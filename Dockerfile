FROM python:3.6.6-alpine
ARG work_home=/opt/app/blog
ENV PYTHONUNBUFFERED 1
RUN apk add mysql-dev
RUN cp -a /etc/apk/repositories /etc/apk/repositories.bak && sed -i "s@http://dl-cdn.alpinelinux.org/@https://mirrors.aliyun.com/@g" /etc/apk/repositories && apk add --no-cache --virtual .build-deps jpeg-dev zlib-dev gcc python3-dev libc-dev tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mkdir -p ${work_home}
WORKDIR ${work_home}
COPY ./web/blog .
RUN pip install -r requirements.txt -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
EXPOSE 8000