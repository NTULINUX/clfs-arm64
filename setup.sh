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
  pushd $TOPDIR/git
  git clone git://git.qemu-project.org/qemu.git || die "clone qemu"
  cd $TOPDIR/git/qemu
  git submodule update --init dtc
  popd
fi

# Download linux kernel code
if [ ! -d $TOPDIR/git/kernel ]; then
  pushd $TOPDIR/git
  git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git kernel || die "clone kernel"
  popd
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
  mkdir -p $SYSTEM/{bin,sbin,etc,run,dev,tmp,sys,proc,mnt,var,home,root,lib,usr/lib}
  prepare_build_env
  test -f $SYSROOT/usr/lib64/libncursesw.so.6.0 || build_ncurses || die "build_ncurses"
  test -f $SYSROOT/usr/lib64/libz.so || build_zlib || die "build_zlib"
  test -f $SYSTEM/bin/yes || build_coreutils || die "build_coreutils"
  test -f $SYSTEM/bin/bash ||  build_bash || die "build_bash"
  test -f $SYSTEM/usr/bin/dmesg || build_util_linux || die "build_util_linux"
  test -f $SYSTEM/usr/bin/strace ||  build_strace || die "build_strace"
  test -f $SYSTEM/bin/find || build_find || die "build_find"
  test -f $SYSTEM/bin/grep || build_grep || die "build_grep"
  test -f $SYSTEM/bin/sed || build_sed || die "build_sed"
  test -f $SYSTEM/bin/awk || build_awk || die "build_awk"
  test -f $SYSTEM/bin/gzip || build_gzip || die "build_gzip"
#  test -f $SYSTEM/usr/bin/gdb ||  build_binutils_gdb || die "build_binutils_gdb"
#  test -f $SYSTEM/usr/bin/gcc || build_gcc || die "build_gcc"
  test -f $SYSTEM/bin/busybox || build_busybox || die "build_busybox"
  do_strip
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
