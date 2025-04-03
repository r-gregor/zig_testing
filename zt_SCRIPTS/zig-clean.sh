#! /usr/bin/env bash

TARGET=$PWD

OUT="${TARGET}/zig-out"
CCH="${TARGET}/.zig-cache"

if [ ! -d ${OUT} ]; then
	echo "[ERROR] no '${OUT}' dir"
	exit
fi

if [ ! -d ${CCH} ]; then
	echo "[ERROR] no '${CCH}' dir"
	exit
fi

echo "Dirs to remove:" 
echo "${OUT}"
echo "${CCH}"
read -p "OK ?"

rm -rv ${OUT} ${CCH}

