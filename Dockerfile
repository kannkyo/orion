FROM alpine:latest AS build-env

WORKDIR /tmp
RUN apk add --no-cache curl && \
    curl -o orion.zip http://mirrors.ibiblio.org/eclipse/orion/drops/R-20.0-201903291844/eclipse-orion-20.0.0S1-linux.gtk.x86_64.zip && \
    unzip orion.zip

FROM openjdk:8-jre-slim

COPY --from=build-env /tmp/eclipse /opt/eclipse
RUN chmod +x /opt/eclipse/orion

WORKDIR /opt/eclipse
EXPOSE 8080
CMD ["/opt/eclipse/orion"]
