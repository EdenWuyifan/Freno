wget https://www.mpich.org/static/downloads/3.3.2/mpich-3.3.2.tar.gz

tar zxvf mpich-3.3.2.tar.gz

cd mpich-3.3.2
./configure --prefix /usr/local/mpich --disable-fortran --disable-cxx
make
make install

echo 'PATH=$PATH:/usr/local/mpich/bin' >> ~/etc/profile
echo 'MANPATH=$MANPATH:/usr/local/mpich/man' >> ~/etc/profile
echo 'export PATH MANPATH' >> ~/etc/profile

source /etc/profile

echo 'export PATH=$PATH:/usr/local/mpich/bin' >> ~/.bash_profile
source ~/.bash_profile


pip3 install mpi4py




