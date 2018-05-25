#!/bin/bash
set -e

# Add kibana as command if needed
if [[ "$1" == -* ]]; then
	set -- kibana "$@"
fi

# Run as user "kibana" if the command is "kibana"
if [ "$1" = 'kibana' ]; then
	if [ "$ELSEARCH_SVC_SERVICE_HOST" ]; then
		sed -i /^elasticsearch.url:/s/elasticsearch:9200/$ELSEARCH_SVC_SERVICE_HOST:ELSEARCH_SVC_SERVICE_PORT_YEWU/ etc/kibana/kibana.yml
	fi

	set -- gosu kibana tini -- "$@"
fi

exec "$@"
