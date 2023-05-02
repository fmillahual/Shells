#!/bin/bash
export DSHOME=${PATH_DS}

if [ ! -d "${DSHOME}" ]
then 
    echo "ERROR: Invalid Path ${DSHOME}."
    exit 1
fi

. ${DSHOME}/dsenv

#example run 10 instances in parallel
for nroInstance in {1..10}
do
    $DSHOME/bin/dsjob -run -mode RESET -wait $projectDS ${nameJob}.$nroInstance
    $DSHOME/bin/dsjob -run -wait -param param1=$nroInstance -param param2=${varParam2} $projectDS ${nameJob}.${nroInstance} 2>&1 &
    
done