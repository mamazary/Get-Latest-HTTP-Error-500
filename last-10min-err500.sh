#!/bin/bash

echo PRINT LAST 10 MINUTE HTTP 500 ERROR
echo "================================="
echo
read -p 'Please input full path of log directory: ' LOG_DIR

#Sort logs by name and get the latest log filename
LATEST_LOG=$(ls $LOG_DIR | sort -n | tail -n 1)

#Get time from 10 minutes ago from now and convert it to epoch
TIME_MIN=$(date -v -10M +"%d/%b/%Y:%H:%M:%S")
EPOCH_TIME_MIN=$(date -j -f "%d/%b/%Y:%T" $TIME_MIN +"%s")

#Read and loop every entry inside the log file
cat $LOG_DIR/$LATEST_LOG | while read line; do   

    #Get date entry and convert it to epoch
    DATE_ENTRY=$(echo $line | awk -F'[][]' '{print (a[split($2,a,/ */)-1])}')
    EPOCH_DATE_ENTRY=$(date -j -f "%d/%b/%Y:%T" $DATE_ENTRY +"%s")

    #Check if the date entry are within 10 minutes ago
    if  [[ $EPOCH_DATE_ENTRY -ge $EPOCH_TIME_MIN ]]; then
        
        #Get entry status code using cut with space delimiter and get the 9th result
        STATUS_CODE=$( echo $line | cut -d ' ' -f 9 )

        #Check if status code is equal 500
        if [[ $STATUS_CODE == 500 ]]; then

            #Print the entry
            echo $line

        fi
    fi
done
