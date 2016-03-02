FROM alpine
#RUN echo http://mirror.yandex.ru/mirrors/alpine/latest-stable/main > /etc/apk/repositories 
RUN apk add -U postgresql && rm -rf /var/cache/apk/*
COPY gosu docker-entrypoint.sh /usr/local/bin/
ENV LANG=en_US.utf8 PGDATA=/var/lib/postgresql/data POSTGRES_DB=postgres POSTGRES_USER=postgres POSTGRES_PASSWORD=postgres
VOLUME $PGDATA
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]

