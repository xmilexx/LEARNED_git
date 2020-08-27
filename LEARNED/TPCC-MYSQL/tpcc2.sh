DATADIR=/home/song/test_data
BASEDIR=/home/song/mysql-5.7.24
CNFDIR=/home/song/my.cnf
# 1.init
    ./mysql-5.7.24/bin/mysqld --initialize --user=root --datadir=$DATADIR --basedir=$BASEDIR
    sleep 5s
    tmux split-window -v
    ./mysql-5.7.24/bin/mysqld_safe --defaults-file=$CNFDIR --skip-grant-tables --datadir=$DATADIR