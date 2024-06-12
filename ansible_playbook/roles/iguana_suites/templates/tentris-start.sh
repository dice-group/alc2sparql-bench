#!/bin/bash

if [[ -f {{ target_dir }}/tentris.pid ]]
then
    echo $(date --iso-8601) - Tentris seems to be already running
    echo If it is not running remove tentris.pid
    exit 1
fi

echo $(date --iso-8601) - Starting Tentris

{{ target_dir }}/systems/tentris/{{ item[0] }}/tentris -s {{ target_dir }}/databases/tentris/{{ item[0] }}/{{ item[1].name }} serve --limit-request-duration-ms {{ query_timeout_ms }} > {{ target_dir }}/logs/run/tentris-{{ item[0] }}-{{ item[1].name }}-{{ item[2].number }}.log 2>&1 & disown
pid=$!

echo $pid > {{ target_dir }}/tentris.pid

echo $(date --iso-8601) - Waiting for Tentris to become available

while :
do
    curl -s 127.0.0.1:9080
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

echo $(date --iso-8601) - Tentris started and accepting connections
