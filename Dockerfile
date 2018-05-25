FROM docker.io/kibana
COPY docker-entrypoint.sh /
RUN chown kibana:kibana /docker-entrypoint.sh
