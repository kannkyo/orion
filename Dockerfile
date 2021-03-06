FROM alpine:latest AS build-env

WORKDIR /tmp
RUN apk add --no-cache curl && \
    curl -o orion.zip https://download.eclipse.org/orion/drops/R-22.1-202005041748/eclipse-orion-22.0.0S1-linux.gtk.x86_64.zip && \
    unzip -q orion.zip && \
    rm orion.zip

FROM openjdk:8-jre-slim

COPY --from=build-env /tmp/eclipse /opt/eclipse
RUN chmod +x /opt/eclipse/orion

WORKDIR /opt/eclipse
EXPOSE 8080
CMD ["/opt/eclipse/orion"]
