FROM eclipse-temurin:21-jre

WORKDIR /opt/Lavalink

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fL https://github.com/lavalink-devs/Lavalink/releases/download/4.2.1/Lavalink.jar -o Lavalink.jar

COPY application.yml ./application.yml
COPY plugins/ ./plugins/

ENV PORT=10000

EXPOSE 10000

CMD ["java", "-jar", "Lavalink.jar"]
