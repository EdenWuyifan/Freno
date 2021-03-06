#!/bin/bash

HOME="."

experiment="Freno"
#experiment="SpFreno"
#experiment="IncSpFreno"
#experiment="centFreno"

expnums=7
target="perf"
#target="size"
#target="mem"
#partition=4

dataset="retail"
#dataset="kosarak"
#dataset="chainstore"
#dataset="record"
ALLDATADIR="$HOME/incdatasets"
#datadir="$ALLDATADIR/$dataset"

DISTHOME="$HOME"
DIR="$DISTHOME/$experiment"

EXPDIR="$DIR/exp"
#path-to-performance/retail
performance="$EXPDIR/performance/$dataset"
memory="$EXPDIR/memory/$dataset"
result="$EXPDIR/result/$dataset"
tablesize="$EXPDIR/tablesize/$dataset"
#path-to-performance/retail/perf
perf="$performance"
mem="$memory/mem"
re="$result/result"
table="$tablesize/size"

run="$DIR/run.py"
runperf="$DIR/runperf.py"
runmem="$DIR/runmem.py"
runsize="$DIR/runsize.py"
