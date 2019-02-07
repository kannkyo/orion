FROM alpine:latest

RUN apk install --no-cache curl && \
    curl -o /tmp/orion.zip http://mirrors.ibiblio.org/eclipse/orion/drops/R-19.0-201808201406/eclipse-orion-19.0.0S1-linux.gtk.x86_64.zip && \
    mkdir -p /opt && \
    cd /opt && unzip /tmp/orion.zip && \
    rm -rf /tmp/orion.zip

RUN chmod +x /opt/eclipse/orion

EXPOSE 8080

WORKDIR /opt/eclipse

ADD  orion.conf /opt/eclipse/orion.conf
ADD  .gitconfig /root/.gitconfig

CMD ["/opt/eclipse/orion"]
