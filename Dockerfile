FROM frolvlad/alpine-python3
ENV PYTHONUNBUFFERED 1
RUN cp -a /etc/apk/repositories /etc/apk/repositories.bak && sed -i "s@http://dl-cdn.alpinelinux.org/@https://mirrors.aliyun.com/@g" /etc/apk/repositories   && apk add -U jpeg-dev zlib-dev gcc python3-dev libc-dev tzdata   && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mkdir -p /app/blog
WORKDIR /app/blog
COPY ./web/blog .
RUN pip install -r requirements.txt
EXPOSE 9000
