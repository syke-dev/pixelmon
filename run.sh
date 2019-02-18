DATA_DIR=/home/ubuntu/volumes/pixelmon
MINECRAFT_DIR=/opt/minecraft

docker run --name=pixelmon-container --rm -it -p 25565:25565 \
-v $DATA_DIR/ops.json:$MINECRAFT_DIR/ops.json \
-v $DATA_DIR/server.properties:$MINECRAFT_DIR/server.properties \
-v $DATA_DIR/config:$MINECRAFT_DIR/config \
-v $DATA_DIR/world:$MINECRAFT_DIR/world \
sykedev/pixelmon java -jar minecraft-forge.jar nogui
