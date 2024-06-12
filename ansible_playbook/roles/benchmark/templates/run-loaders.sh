#!/bin/bash
datasets=( "carcinogenesis" "mutagenesis" "premierleague" "vicodi" "yago4english" )
systems=( "fuseki" "virtuoso" "blazegraph" "graphdb" "tentris-v0.5.4+tentris.v6.1.2" )
for system in "${systems[@]}"
do
  for dataset in "${datasets[@]}"
  do
    bash {{ target_dir }}/loaders/"$system"-load-"$dataset".sh
  done
done