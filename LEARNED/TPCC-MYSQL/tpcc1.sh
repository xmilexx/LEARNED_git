PASSWORD= "yourpassword"
DATADIR=/home/song/test_data
BASEDIR=/home/song/mysql-5.7.24
#CNFDIR=/home/song/my.cnf

# 0.mount and install

    mkdir test_data
    echo $PASSWORD | sudo mount /dev/sdc1 test_data
    echo $PASSWORD | sudo chown -R song:song test_data

    tar -xvzf mysql-5.7.24.tar.gz
    cd mysql-5.7.24

    cmake -DDOWNLOAD_BOOST=ON -DWITH_BOOST=$BASEDIR -DCMAKE_INSTALL_PREFIX=$BASEDIR

    make -j24 install
