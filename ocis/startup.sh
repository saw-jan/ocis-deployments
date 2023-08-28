#!/bin/sh

while
    curl -s -o /dev/null http://tika:9998
    [ $? -ne 0 ]
do
    echo "Waiting for tika..."
    sleep 1
done

echo "Tika is ready!"

ocis init || true
ocis server
