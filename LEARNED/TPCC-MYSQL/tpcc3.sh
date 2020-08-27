BASEDIR=/home/song/mysql-5.7.24
PASSWORD="yourpassword"


cd mysql-5.7.24
./bin/mysql -uroot -S/tmp/mysql.sock -P3306
#root:(none)> use mysql;
#root:mysql> update user set authentication_string=password('yourpassword') where user='root';
#root:mysql> flush privileges;
#root:mysql> quit;


./bin/mysql -uroot -p2702 mysql

#root:mysql> set password = password('yourpassword');
#root:mysql> quit;

echo "wait for 5s"
sleep 5s
git clone https://github.com/Percona-Lab/tpcc-mysql.git
cd tpcc-mysql/src
make
echo "wait for 5s"
sleep 5s
cd ..
cd ..
./bin/mysql -u root -p$PASSWORD -e "CREATE DATABASE tpcc1000;"
echo "DATABASE CREATED"
./bin/mysql -u root -p$PASSWORD tpcc1000 < /home/song/mysql-5.7.24/tpcc-mysql/create_table.sql
echo "TABLE LOADED"
./bin/mysql -u root -p$PASSWORD tpcc1000 < /home/song/mysql-5.7.24/tpcc-mysql/add_fkey_idx.sql
echo "FKEY LOADED"
echo "GO and change load.sh"
cd ..
echo $PASSWORD|sudo chmod 777 -R mysql-5.7.24
#export LD_LIBRARY_PATH=/home/song/mysql-5.7.24/lib
#DBNAME=$1
#WH=$2
#HOST=127.0.0.1
#STEP=100

#./tpcc_load -h $HOST -d $DBNAME -u root -p "yourpassword" -P3306 -w $WH -l 1 -m 1 -n $WH >> 1.out &
#x=1

#while [ $x -le $WH ]
#do
# echo $x $(( $x + $STEP - 1 ))
#./tpcc_load -h $HOST -d $DBNAME -u root -p "yourpassword" -P3306 -w $WH -l 2 -m $x -n $(( $x + $STEP - 1 ))  >> 2_$x.out &
#./tpcc_load -h $HOST -d $DBNAME -u root -p "yourpassword" -P3306 -w $WH -l 3 -m $x -n $(( $x + $STEP - 1 ))  >> 3_$x.out &
#./tpcc_load -h $HOST -d $DBNAME -u root -p "yourpassword" -P3306 -w $WH -l 4 -m $x -n $(( $x + $STEP - 1 ))  >> 4_$x.out &
# x=$(( $x + $STEP ))
#done

#for pid in $(jobs -p)
#do
#	echo wait for $pid
#	wait $pid
#done
vim $BASEDIR/tpcc-mysql/load.sh
echo $PASSWORD |sudo chmod 777 load.sh
echo Backup data before benchmark!!!!!!!!