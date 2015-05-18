FROM alpine
RUN apk --update add postgresql

COPY gosu /usr/local/bin/
COPY docker-entrypoint.sh /

RUN chmod +x /usr/local/bin/gosu

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data


ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
