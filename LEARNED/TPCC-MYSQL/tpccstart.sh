#!/bin/bash
#DATADIR="/home/song/test_data/tpcc100"
#DEV="/dev/sdc1"
BASEDIR="/home/song/mysql-5.7.24"
RESULT_DIR="/home/song/results"
password="yourpassword"
./mysql-5.7.24/tpcc-mysql/tpcc_start -h127.0.0.1 -S/tmp/mysql.sock -dtpcc1000 -uroot -p2702 -w1000 -c32 -r10 -l10800 &>$RESULT_DIR/tpcc.txt & echo $password | sudo -S iostat -x 10 10800 &>$RESULT_DIR/iostat.txt

sleep 10
cat $RESULT_DIR/iostat.txt | grep "sdc" | awk '{print $4 $5}' &>$RESULT_DIR/readwrite.txt
cat $RESULT_DIR/iostat.txt | grep "sdc" | awk '{print $11 $12}' &>$RESULT_DIR/rwlatency.txt
