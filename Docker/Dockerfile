FROM ubuntu:18.04

# install java 8
RUN apt-get update \
  && apt-get install -y software-properties-common \
  && add-apt-repository ppa:openjdk-r/ppa \
  && apt-get update \
  && apt-get install -y openjdk-8-jre wget

# working directory for minecraft
RUN mkdir /opt/minecraft

# fetch minecraft forge version 1.12.2 jar
RUN wget -O /opt/minecraft/minecraft-forge-installer.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2814/forge-1.12.2-14.23.5.2814-installer.jar

# install minecraft server
RUN cd /opt/minecraft \
  && java -Xms1024M -Xmx2000M -jar /opt/minecraft/minecraft-forge-installer.jar --installServer

# accept the eula
RUN echo "eula=true" >> /opt/minecraft/eula.txt

# rename minecraft forge universal jar
RUN mv /opt/minecraft/forge-1.12.2-14.23.5.2814-universal.jar /opt/minecraft/minecraft-forge.jar

# install mods
#   Pixelmon-1.12.2-7.0.1.jar               (1.12.2 for the Forge version and 7.0.1 is the Pixelmon version)
#   extrautils2-1.12-1.9.8.jar              (1.12   for the Forge version and 1.9.8 is the extrautils2 verison)
#   refinedstorage-1.6.12.jar               (compatabile with Minecraft version 1.12.2)
RUN mkdir /opt/minecraft/mods \
  && wget -O /opt/minecraft/mods/Pixelmon.jar https://dl.reforged.gg/2TBQB2n \
  && wget -O /opt/minecraft/mods/extrautils2.jar https://edge.forgecdn.net/files/2632/255/extrautils2-1.12-1.9.8.jar \
  && wget -O /opt/minecraft/mods/refinedstorage.jar https://edge.forgecdn.net/files/2642/249/refinedstorage-1.6.12.jar


# cleanup
RUN rm /opt/minecraft/minecraft-forge-installer.jar

EXPOSE 25565

WORKDIR /opt/minecraft
