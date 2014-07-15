#!/bin/sh 

if [ $# -ne 1 ]; then

echo Usage: $0 [inst_dir]

exit -1

fi

INST=$1
export PATH=/afs/cern.ch/ams/opt/intel/composer_xe_2013_sp1.3.174/bin/intel64/:$PATH
export LD_LIBRARY_PATH=/afs/cern.ch/ams/opt/intel/composer_xe_2013_sp1.3.174/compiler/lib/intel64/:$LD_LIBRARY_PATH

# First get xrootd we are using version 3.2.7

wget http://xrootd.org/download/v3.2.7/xrootd-3.2.7.tar.gz

tar -xvzf xrootd-3.2.7.tar.gz

DD=$PWD

cd xrootd-3.2.7
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$INST/xrootd/ \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_C_COMPILER=icc \
-DCMAKE_CXX_COMPILER=icc \
../

make -j
make install

cd $DD

./configure linuxx8664icc --prefix=$INST/root534/ \
--etcdir=$INST/root534/etc/ \
--enable-asimage \
--enable-builtin-afterimage \
--enable-builtin-ftgl \
--enable-builtin-freetype \
--enable-builtin-glew \
--enable-builtin-lzma \
--enable-builtin-pcre \
--enable-builtin-zlib \
--enable-builtin-lzma \
--enable-castor \
--enable-cintex \
--enable-explicitlink \
--enable-fitsio \
--enable-gdml \
--enable-genvector \
--enable-krb5 \
--enable-ldap \
--enable-mathmore \
--enable-memstat \
--enable-minuit2 \
--enable-mysql \
--enable-opengl \
--enable-pgsql \
--enable-python \
--enable-reflex \
--enable-rfio \
--enable-roofit \
--enable-shadowpw \
--enable-ssl \
--enable-tmva \
--enable-x11 \
--enable-xft \
--enable-xml \
--enable-xrootd \
--with-xrootd=$INST/xrootd
if  [ $? -eq 0 ]; then
make -j -i 
fi

make -j -i 
make

if  [ $? -eq 0 ]; then
make static
fi

if  [ $? -eq 0 ]; then
make install
fi
