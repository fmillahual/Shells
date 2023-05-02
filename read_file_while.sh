#!/bin/bash
PATH_FILE=/example/PATH/
FILE=TEST.txt

if [ ! -d "${PATH_FILE}" ]
then 
    echo "ERROR: Invalid Path ${PATH_FILE}."
    exit 1
fi


if [ ! -s ${PATH_FILE}${FILE} ]
then
    echo "ERROR: FILE EMPTY ${PATH_FILE}${FILE} "
    exit 1
fi


while IFS='' read -r line || [ -n "$line" ]; 
do
     echo $line

done < "${PATH_FILE}${FILE}"