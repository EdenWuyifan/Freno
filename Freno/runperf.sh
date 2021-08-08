source ../config.sh

PERFDBDIR=$performance
if [ ! -d $PERFDBDIR ]; then
	mkdir $PERFDBDIR
fi
# !--------------Change the minsups here please!----------------!
for SLURM_ARRAY_TASK_ID in 11 21 31 41 51
do
	for expnum in $(seq 1 1 $expnums);
	do
		# !--------------Change the intervals here please!----------------!
		for interval in 0 20000 40000 60000 80000 100000
		do
			for partition in 4 8 12
			do
				PERFDIR="$PERFDBDIR/$partition" # Create result paths
				if [ ! -d $PERFDIR ]; then
					mkdir $PERFDIR
				fi
				PERFFILE="$PERFDIR/$SLURM_ARRAY_TASK_ID"_"$interval.txt"
				if [ ! -f $PERFFILE ]; then
					touch $PERFFILE
				fi

				
				(time -p mpirun -np $(($partition+1)) -f /root/machinefile $runperf \
				--dbpath $ALLDATADIR -d $dataset \
				-m $SLURM_ARRAY_TASK_ID \
				-p $partition -i $interval) \
				>> $PERFFILE 2>&1
			done
		done
	done
done
