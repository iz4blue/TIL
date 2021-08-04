#!/bin/bash

# https://gusrb.tistory.com/79

mkdir ~/.pip

cat > ~/.pip/pip.conf << EOF 

[global]
index-url=http://ftp.daumkakao.com/pypi/simple
trusted-host=ftp.daumkakao.com
EOF
