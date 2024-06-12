#!/bin/bash
triplestores=( "tentris-v0.5.4+tentris.v6.1.2" "fuseki" "virtuoso" "blazegraph" "graphdb" )
workers=( 1 )
echo "SPARQL benchmark"
echo "Running Query Mixes suites for Carcinogenesis"
for ts in "${triplestores[@]}"
do
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting $ts"
	./iguana_suites/http/"$ts"/carcinogenesis/1-start.sh &> /dev/null
	echo "$(date): Running IGUANA (Query Mixes) for $ts"
	./iguana-run.sh ./iguana_suites/http/"$ts"/carcinogenesis/1-queries-QM.yml &> /dev/null
	echo "$(date): Stopping $ts"
	./iguana_suites/http/"$ts"/stop.sh &> /dev/null
done 
echo "Running Query Mixes suites for Mutagenesis"
for ts in "${triplestores[@]}"
do
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting $ts"
	./iguana_suites/http/"$ts"/mutagenesis/1-start.sh &> /dev/null
	echo "$(date): Running IGUANA (Query Mixes) for $ts"
	./iguana-run.sh ./iguana_suites/http/"$ts"/mutagenesis/1-queries-QM.yml &> /dev/null
	echo "$(date): Stopping $ts"
	./iguana_suites/http/"$ts"/stop.sh &> /dev/null
done
echo "Running Query Mixes suites for Vicodi"
for ts in "${triplestores[@]}"
do
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting $ts"
	./iguana_suites/http/"$ts"/vicodi/1-start.sh &> /dev/null
	echo "$(date): Running IGUANA (Query Mixes) for $ts"
	./iguana-run.sh ./iguana_suites/http/"$ts"/vicodi/1-queries-QM.yml &> /dev/null
	echo "$(date): Stopping $ts"
	./iguana_suites/http/"$ts"/stop.sh &> /dev/null
done
echo "Running Query Mixes suites for Premierleague"
for ts in "${triplestores[@]}"
do
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting $ts"
	./iguana_suites/http/"$ts"/premierleague/1-start.sh &> /dev/null
	echo "$(date): Running IGUANA (Query Mixes) for $ts"
	./iguana-run.sh ./iguana_suites/http/"$ts"/premierleague/1-queries-QM.yml &> /dev/null
	echo "$(date): Stopping $ts"
	./iguana_suites/http/"$ts"/stop.sh &> /dev/null
done
