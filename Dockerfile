FROM java:8

MAINTAINER EMCDotNextTeam-vTexan

RUN  mkdir /data
RUN   mkdir /games
RUN curl "https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar" -o /games/minecraft_server.jar

RUN  echo "eula=true" > /games/eula.txt

EXPOSE 25565


WORKDIR /games

COPY server.properties /games/

ENTRYPOINT [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "/games/minecraft_server.jar" ]
CMD ["nogui"]
