#!/usr/bin/env bash

set -e

script_dir=$(cd $(dirname $0); pwd)

cd $script_dir

git submodule update --init --recursive

prefix="$script_dir/libs"
if [[ $# -ge 1 ]]; then
  prefix=$1
fi
mkdir -p $prefix

echo "set(H2RPC_THIRD_PARTY_PREFIX '$prefix')" > h2rpc-third-party-prefix.cmake

python3_version=`python3 -V | awk '{print $2}' | awk -F '.' '{printf "%d.%d", $1,$2}'`

# build nghttp2
cd third_party/nghttp2

autoreconf -i
automake
autoconf
./configure \
  --prefix=$prefix \
  --enable-asio-lib \
  --disable-python-bindings \

make -j $((`nproc` + 1))
make install
