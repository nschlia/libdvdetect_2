#!/bin/bash

echo Making 32 bit...

[ -d 32-bit ] || mkdir 32-bit && cd 32-bit
../configure --build=i686-pc-linux-gnu \
	--prefix=/arch/x86-linux/gnu \
	CC="gcc -m32 -march=i586" \
	CXX="g++ -m32 -march=i586" \
	LDFLAGS="-m32" 
make -s all
make -s dist
make -s doxygen
cd ..

echo Making 64 bit...

[ -d 64-bit ] || mkdir 64-bit && cd 64-bit
../configure
make -s  all
make -s dist
cd ..
