FROM scratch
LABEL maintainer="brad@foghornconsulting.com"

ADD rootfs.tar.xz /

COPY requirements.txt /tmp/requirements.txt

RUN apk add --no-cache --update python3 bash \
    && pip3 install --upgrade pip \
    && pip3 install -r /tmp/requirements.txt

RUN mkdir /app
COPY helloworld_project /app/helloworld_project

VOLUME /app
EXPOSE 8000

# Cleanup
RUN rm -rf /.wh /root/.cache /var/cache /tmp/requirements.txt

WORKDIR /app/helloworld_project
CMD ["./start.sh"]
