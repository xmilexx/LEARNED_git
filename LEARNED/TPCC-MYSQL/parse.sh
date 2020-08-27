#!/bin/bash
DATADIR="/home/song/test_data/tpcc1000"
DEV="/dev/sdc1"
BASEDIR="/home/song/mysql-5.7.24"
RESULT_DIR="/home/song/results"

cat /results/smartlog.txt|grep "Wear"|awk "{print $10}"&>/results/WEAR.txt
cat /results/smartlog.txt|grep "LBA"|awk "{print $10}"&>/results/LBA.txt

