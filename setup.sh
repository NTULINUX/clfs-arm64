#!/bin/bash

. env_setup.sh

FORCE_UPDATE=0
FORCE_BUILD=0

usage() {
  echo "usage: $0 [-u] [-b]"
  echo '       -u: git update for each repo'
  echo '       -b: force build qemu & kernel'
}

WORKD=$PWD
die() {
  echo -e "\n**********\033[41m$1 \033[0m**********\n"
  cd $WORKD
  exit 1
}

# parse options
while getopts ":ub" opt; do
  case $opt in
    u) FORCE_UPDATE=1
    ;;
    b) FORCE_BUILD=1
    ;;
    ?) usage; exit
  esac
done

mkdir -p $TOPDIR/{tools,build,out,git,source}

# check if any package source code is missing
download_source || die "download_source"

# Download qemu source code
if [ ! -d $TOPDIR/git/qemu ]; then
  cd $TOPDIR/git
  git clone git://git.qemu-project.org/qemu.git || die "clone qemu"
  cd -
fi

# Download linux kernel code
if [ ! -d $TOPDIR/git/kernel ]; then
  cd $TOPDIR/git
  git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git kernel || die "clone kernel"
  cd -
fi

if [ $FORCE_UPDATE -eq 1 ]; then
  do_update git/kernel
  do_update git/qemu
fi

# build toolchain
if [ ! -f $TOOLDIR/bin/aarch64-linux-gnu-gcc ]; then
  build_toolchain || die "build_toolchain"
fi

# build qemu
qemu-system-aarch64 -version &> /dev/null
if [ $? -ne 0 ]; then
  build_qemu || die "build_qemu"
fi

# build kernel
if [ ! -f $TOPDIR/out/Image ]; then
  build_kernel || die "build_kernel"
fi


if [ ! -f $SYSIMG ]; then
  mkdir -p $SYSTEM/{dev,tmp,sys,proc,mnt,lib,usr/lib}
  prepare_build_env
  test -f $SYSTEM/usr/bin/strace ||  build_strace || die "build_strace"
#  test -f $SYSTEM/bin/gdb ||  build_binutils_gdb && rm -rf $SYSTEM/aarch64-linux-gnu || die "build_binutils_gdb"
  test -f $SYSTEM/bin/bash ||  build_bash || die "build_bash"
  test -f $SYSTEM/bin/busybox || build_busybox || die "build_busybox"
  do_strip
  rm -rf $SYSTEM/usr/share
  clean_build_env
  new_disk $SYSIMG 512
fi

# force build
if [ $FORCE_BUILD -eq 1 ]; then
  build_qemu || die "build_qemu"
  build_kernel || die "build_kernel"
fi

# Run
run
