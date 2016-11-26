#!/bin/bash

# Travis CI Environment Prepare Script
# Author: Douglas Gadêlha <douglas@gadeco.com.br>
#
# The MIT License (MIT)
#
# Copyright (c) 2016 Douglas Gadêlha. All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -ev
git config --global user.name "Travis CI"
git config --global user.email "dgadelha@users.noreply.github.com"
git config --global color.ui "true"

mkdir build
cd build
repo init -u git://github.com/intel-ctp/android.git -b zf5/kernel-travis
repo sync -c -j12
rm -Rf bionic/tests

mv -fv ../.build/main.mk build/core/main.mk

mkdir -p kernel/asus/T00F
mv -fv ../kernel kernel/asus/T00F/
mv -fv ../modules kernel/asus/T00F/
mv -fv ../AndroidKernel.mk kernel/asus/T00F/
mv -fv ../KernelMakefile kernel/asus/T00F/
mv -fv ../defconfig kernel/asus/T00F/
cp kernel/asus/T00F/KernelMakefile .

cd ..
