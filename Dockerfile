FROM mysql:5.6
MAINTAINER axway@axway.com
#ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
#ENV MYSQL_DATABASE=${MYSQL_DATABASE}
#ADD joomla.sql /tmp/joomla.sql
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

