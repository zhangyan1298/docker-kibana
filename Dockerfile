FROM docker.io/kibana
COPY docker-entrypoint.sh /
RUN chown root:root /docker-entrypoint.sh
