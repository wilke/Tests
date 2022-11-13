#!/bin/bash -eu

echo "UPF NIGHTLY GCE: START " $( date "+%Y-%m-%d %H:%M" )

echo SUPERVISOR=$SUPERVISOR

set -x

cd $SUPERVISOR/workflows/upf

test/upf-1.sh

echo "UPF NIGHTLY GCE: STOP" $( date "+%Y-%m-%d %H:%M" )
