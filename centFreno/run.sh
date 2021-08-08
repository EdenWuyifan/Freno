#!/bin/bash
source ../config.sh

mkdir $performance 

db_path=$ALLDATADIR/interval_$dataset_0/db_0.txt


if [ $target == 'perf' ] #performance and result measurement
then
	python $runperf $expsnum $db_path $perf $re
elif [ $target == 'size' ] #tablesize measurement
then
	python $runsize $expsnum $db_path $table
elif [ $target == 'mem' ] #memory measurement
then
	for ((i=0; i<$expsnum; i++))
	do
		for ((j=70; j<=100; j=j+30))
		do
			python $runmem $i $data $mem $j
		done
	done
fi
