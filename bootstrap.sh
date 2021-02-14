#!/bin/sh
cd opencv
mkdir build; cd build
cmake .. -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=./install -DCMAKE_BUILD_TYPE=Release
make -j 8 install
cd ..
mkdir build_d; cd build_d
cmake .. -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=./install -DCMAKE_BUILD_TYPE=Debug
make -j 8 install
cd ../..

