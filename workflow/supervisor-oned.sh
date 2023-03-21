#!/bin/bash
set -eu

echo "MLRMBO NIGHTLY GCE: START " $( date "+%Y-%m-%d %H:%M" )

echo SUPERVISOR=$SUPERVISOR

set -x

hostname

cd $SUPERVISOR/workflows/mlrMBO

pwd
export CANDLE_DATA_DIR=/nfs/gce/globalscratch/jain/Data
ls $CANDLE_DATA_DIR

# To disable mlrmbo while debugging GA below: comment the next two lines
test/test-nightly.sh oned gce
ls -ltrh turbine-output/

echo "OneD MLRMBO NIGHTLY GCE: STOP" $( date "+%Y-%m-%d %H:%M" )

echo "GA OneD NIGHTLY GCE: START " $( date "+%Y-%m-%d %H:%M" )


cd $SUPERVISOR/workflows/GA
test/test-1.sh oned gce

ls -ltrh turbine-output/
cat turbine-output/final_result_1

echo "GA OneD NIGHTLY GCE: STOP " $( date "+%Y-%m-%d %H:%M" )