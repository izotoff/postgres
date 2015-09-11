FROM alpine
RUN echo http://mirror.yandex.ru/mirrors/alpine/v3.2/main > /etc/apk/repositories
RUN apk add -U postgresql && rm -rf /var/cache/apk/*

COPY gosu /usr/local/bin/
COPY docker-entrypoint.sh /

RUN chmod +x /usr/local/bin/gosu
RUN chmod +x /docker-entrypoint.sh

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data
ENV POSTGRES_DB jiradb
ENV POSTGRES_USER jira
ENV POSTGRES_PASSWORD jirapass

VOLUME $PGDATA

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
