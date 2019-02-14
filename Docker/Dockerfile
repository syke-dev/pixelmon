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

# fetch Pixelmon mod version Pixelmon-1.12.2-7.0.1.jar
RUN wget -O /opt/minecraft/Pixelmon.jar https://dl.reforged.gg/2TBQB2n

# install minecraft server
RUN cd /opt/minecraft \
  && java -Xms1024M -Xmx2000M -jar /opt/minecraft/minecraft-forge-installer.jar --installServer

# accept the eula
RUN echo "eula=true" >> /opt/minecraft/eula.txt

# rename minecraft forge universal jar
RUN mv /opt/minecraft/forge-1.12.2-14.23.5.2814-universal.jar /opt/minecraft/minecraft-forge.jar

# install Pixelmon mod
RUN mkdir /opt/minecraft/mods \
  && mv /opt/minecraft/Pixelmon.jar /opt/minecraft/mods

# cleanup
RUN rm /opt/minecraft/minecraft-forge-installer.jar

EXPOSE 25565

WORKDIR /opt/minecraft
