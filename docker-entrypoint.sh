#!/bin/sh
# docker-entrypoint.sh: Periodically run 'make up' and start Flask server

# Start a background job to run 'make up' every hour
while true; do
    make up
    sleep 3600 &
    wait $!
done &

# Start the Flask server
exec flask run --host=0.0.0.0
