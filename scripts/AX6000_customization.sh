#!/bin/bash

set -ex

cp -f ../patches/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-5.15/

source ./00_customize_packages.sh

exit 0
