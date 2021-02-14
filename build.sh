#!/bin/sh
mkdir TexSyn-build
cd TexSyn-build
cmake .. -DCMAKE_INSTALL_PREFIX=../TexSyn-install -DCMAKE_BUILD_TYPE=Release
make -j 8 install
cd ..

