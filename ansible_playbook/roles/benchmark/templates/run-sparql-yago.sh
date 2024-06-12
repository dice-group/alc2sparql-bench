#!/bin/bash
triplestores=( "tentris-v0.5.4+tentris.v6.1.2" "fuseki" "blazegraph" "graphdb" )
workers=( 1 )
echo "SPARQL benchmark"
echo "Running Query Mixes suites for YAGO4english"
for ts in "${triplestores[@]}"
do
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting $ts"
	./iguana_suites/http/"$ts"/yago4english/1-start.sh &> /dev/null
	echo "$(date): Running IGUANA (Query Mixes) for $ts"
	./iguana-run.sh ./iguana_suites/http/"$ts"/yago4english/1-queries-QM.yml &> /dev/null
	echo "$(date): Stopping $ts"
	./iguana_suites/http/"$ts"/stop.sh &> /dev/null
done
