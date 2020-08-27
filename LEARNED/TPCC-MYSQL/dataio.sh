#!/bin/bash
PASSWORD="yourpassword"
DATADIR="/home/song/test_data/tpcc1000"
DEV="/dev/sdc1"
BASEDIR="/home/song/mysql-5.7.24"
RESULT_DIR="/home/song/results"

while [ 1 ]
do
	du -h ${DATADIR} >> ${RESULT_DIR}/mysql-size.txt &
	du -sh ${DATADIR} >> ${RESULT_DIR}/mysql-total-size.txt &
	echo $PASSWORD | sudo -S smartctl -A ${DEV} >> ${RESULT_DIR}/smartlog.txt &
	sleep 10
done
