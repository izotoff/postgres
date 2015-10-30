FROM alpine
RUN echo http://mirror.yandex.ru/mirrors/alpine/latest-stable/main > /etc/apk/repositories
RUN apk add -U postgresql && rm -rf /var/cache/apk/*

COPY gosu /usr/local/bin/
COPY docker-entrypoint.sh /

RUN chmod +x /usr/local/bin/gosu && chmod +x /docker-entrypoint.sh

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data
ENV POSTGRES_DB postgres
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres

VOLUME $PGDATA

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
