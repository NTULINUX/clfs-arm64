#!/usr/bin/env bash

## Copyright (C) 2016 - 2017 zhizhou zhang <zhizhou.zh@gmail.com>
## Copyright (C) 2017 Alec Ari <neotheuser@ymail.com>
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

unset STARTDIR
unset TARDIR
unset SRCDIR
unset BUILD_DIR
unset PREFIX
unset SYSROOT

unset CC
unset CXX
unset LD
unset AR
unset AS
unset RANLIB
unset STRIP
unset CFLAGS
unset CXXFLAGS
unset LDFLAGS
unset LIBS

STARTDIR="${PWD}"
TARDIR="${STARTDIR}/tarballs"
SRCDIR="${STARTDIR}/src"

CLFS_HOST=$(echo "${MACHTYPE}" | sed -e 's/-[^-]*/-cross/')
CROSS_COMPILE="aarch64-rpi3-linux-gnueabihf-"
CLFS_TARGET="aarch64-rpi3-linux-gnueabihf"
BUILD_DIR="${STARTDIR}/build"
PREFIX="${STARTDIR}/cross-tools"
SYSROOT="${STARTDIR}/cross-tools/${CLFS_TARGET}"

LINUX_VER="4.9.35"
LINUX_MAJOR_VER="v4.x"
GCC_VER="6.3.0"
MPFR_VER="3.1.5"
MPC_VER="1.0.3"
GMP_VER="6.1.2"
GLIBC_VER="2.25"
GPERF_VER="3.1"
BASH_VER="4.4"
BASH_VER_CUT="44"
BASH_PATCHLEVEL="p12"
BINUTILS_VER="2.28"
NCURSES_VER="6.0"
ZLIB_VER="1.2.11"
COREUTILS_VER="8.27"
UTIL_LINUX_VER="2.30"
FINDUTILS_VER="4.6.0"
GREP_VER="3.1"
GZIP_VER="1.8"
SED_VER="4.4"
GAWK_VER="4.1.4"
PAM_VER="1.3.0"
SHADOW_VER="4.5"
SYSVINIT_VER="2.88dsf"
EUDEV_VER="3.2.2"
PROCPS_VER="3.3.12"
LIBRESSL_VER="2.5.4"
IPROUTE2_VER="4.11.0"
NET_TOOLS_VER="1.60"
TAR_VER="1.29"

LINUX_COMP="${TARDIR}/linux-${LINUX_VER}.tar.xz"
GCC_COMP="${TARDIR}/gcc-${GCC_VER}.tar.bz2"
MPFR_COMP="${TARDIR}/mpfr-${MPFR_VER}.tar.xz"
MPC_COMP="${TARDIR}/mpc-${MPC_VER}.tar.gz"
GMP_COMP="${TARDIR}/gmp-${GMP_VER}.tar.xz"
GLIBC_COMP="${TARDIR}/glibc-${GLIBC_VER}.tar.bz2"
GPERF_COMP="${TARDIR}/gperf-${GPERF_VER}.tar.gz"
BASH_COMP="${TARDIR}/bash-${BASH_VER}.tar.gz"
BINUTILS_COMP="${TARDIR}/binutils-${BINUTILS_VER}.tar.bz2"
NCURSES_COMP="${TARDIR}/ncurses-${NCURSES_VER}.tar.gz"
ZLIB_COMP="${TARDIR}/zlib-${ZLIB_VER}.tar.gz"
COREUTILS_COMP="${TARDIR}/coreutils-${COREUTILS_VER}.tar.xz"
UTIL_LINUX_COMP="${TARDIR}/util-linux-${UTIL_LINUX_VER}.tar.xz"
FINDUTILS_COMP="${TARDIR}/findutils-${FINDUTILS_VER}.tar.gz"
GREP_COMP="${TARDIR}/grep-${GREP_VER}.tar.xz"
GZIP_COMP="${TARDIR}/gzip-${GZIP_VER}.tar.xz"
SED_COMP="${TARDIR}/sed-${SED_VER}.tar.xz"
GAWK_COMP="${TARDIR}/gawk-${GAWK_VER}.tar.xz"
PAM_COMP="${TARDIR}/Linux-PAM-${PAM_VER}.tar.gz"
SHADOW_COMP="${TARDIR}/shadow-${SHADOW_VER}.tar.xz"
SYSVINIT_COMP="${TARDIR}/sysvinit-${SYSVINIT_VER}.tar.bz2"
EUDEV_COMP="${TARDIR}/v${EUDEV_VER}.tar.gz"
PROCPS_COMP="${TARDIR}/procps-ng-${PROCPS_VER}.tar.xz"
LIBRESSL_COMP="${TARDIR}/libressl-${LIBRESSL_VER}.tar.gz"
IPROUTE2_COMP="${TARDIR}/iproute2-${IPROUTE2_VER}.tar.xz"
NET_TOOLS_COMP="${TARDIR}/net-tools-${NET_TOOLS_VER}.tar.bz2"
TAR_COMP="${TARDIR}/tar-${TAR_VER}.tar.xz"

LINUX_SRCDIR="${SRCDIR}/linux-${LINUX_VER}"
GCC_SRCDIR="${SRCDIR}/gcc-${GCC_VER}"
MPFR_SRCDIR="${SRCDIR}/mpfr-${MPFR_VER}"
MPC_SRCDIR="${SRCDIR}/mpc-${MPC_VER}"
GMP_SRCDIR="${SRCDIR}/gmp-${GMP_VER}"
GLIBC_SRCDIR="${SRCDIR}/glibc-${GLIBC_VER}"
GPERF_SRCDIR="${SRCDIR}/gperf-${GPERF_VER}"
BASH_SRCDIR="${SRCDIR}/bash-${BASH_VER}_${BASH_PATCHLEVEL}"
BINUTILS_SRCDIR="${SRCDIR}/binutils-${BINUTILS_VER}"
NCURSES_SRCDIR="${SRCDIR}/ncurses-${NCURSES_VER}"
ZLIB_SRCDIR="${SRCDIR}/zlib-${ZLIB_VER}"
COREUTILS_SRCDIR="${SRCDIR}/coreutils-${COREUTILS_VER}"
UTIL_LINUX_SRCDIR="${SRCDIR}/util-linux-${UTIL_LINUX_VER}"
FINDUTILS_SRCDIR="${SRCDIR}/findutils-${FINDUTILS_VER}"
GREP_SRCDIR="${SRCDIR}/grep-${GREP_VER}"
GZIP_SRCDIR="${SRCDIR}/gzip-${GZIP_VER}"
SED_SRCDIR="${SRCDIR}/sed-${SED_VER}"
GAWK_SRCDIR="${SRCDIR}/gawk-${GAWK_VER}"
PAM_SRCDIR="${SRCDIR}/pam-${PAM_VER}"
SHADOW_SRCDIR="${SRCDIR}/shadow-${SHADOW_VER}"
SYSVINIT_SRCDIR="${SRCDIR}/sysvinit-${SYSVINIT_VER}"
EUDEV_SRCDIR="${SRCDIR}/eudev-${EUDEV_VER}"
PROCPS_SRCDIR="${SRCDIR}/procps-${PROCPS_VER}"
LIBRESSL_SRCDIR="${SRCDIR}/libressl-${LIBRESSL_VER}"
IPROUTE2_SRCDIR="${SRCDIR}/iproute2-${IPROUTE2_VER}"
NET_TOOLS_SRCDIR="${SRCDIR}/net-tools-${NET_TOOLS_VER}"
TAR_SRCDIR="${SRCDIR}/tar-${TAR_VER}"

JOBS=$(grep -c processor /proc/cpuinfo)

prep_dirs()
{
if [[ -w "${STARTDIR}" ]] ; then
	printf "\n\tUser has write permissions to %s\n" "${STARTDIR}"
else
	printf "\n\tPlease switch to a user writeable directory, such as your home folder.\n"
	exit 1
fi

	mkdir -p "${BUILD_DIR}"
	mkdir -p "${TARDIR}"
	mkdir -p "${SRCDIR}"
	mkdir -p "${SYSROOT}"
}

fetch_sources()
{
SOURCES=("https://cdn.kernel.org/pub/linux/kernel/${LINUX_MAJOR_VER}/linux-${LINUX_VER}.tar.xz"
	"ftp://ftp.gnu.org/gnu/gcc/gcc-${GCC_VER}/gcc-${GCC_VER}.tar.bz2"
	"https://ftp.gnu.org/gnu/mpfr/mpfr-${MPFR_VER}.tar.xz"
	"http://ftp.gnu.org/gnu/mpc/mpc-${MPC_VER}.tar.gz"
	"https://ftp.gnu.org/gnu/gmp/gmp-${GMP_VER}.tar.xz"
	"https://ftp.gnu.org/gnu/libc/glibc-${GLIBC_VER}.tar.bz2"
	"https://ftp.gnu.org/gnu/gperf/gperf-${GPERF_VER}.tar.gz"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}.tar.gz"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-001"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-002"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-003"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-004"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-005"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-006"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-007"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-008"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-009"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-010"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-011"
	"https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}-patches/bash${BASH_VER_CUT}-012"
	"https://ftp.gnu.org/gnu/binutils/binutils-${BINUTILS_VER}.tar.bz2"
	"http://ftp.gnu.org/gnu/ncurses/ncurses-${NCURSES_VER}.tar.gz"
	"https://www.zlib.net/zlib-${ZLIB_VER}.tar.gz"
	"http://ftp.gnu.org/gnu/coreutils/coreutils-${COREUTILS_VER}.tar.xz"
	"https://www.kernel.org/pub/linux/utils/util-linux/v${UTIL_LINUX_VER}/util-linux-${UTIL_LINUX_VER}.tar.xz"
	"http://ftp.gnu.org/gnu/findutils/findutils-${FINDUTILS_VER}.tar.gz"
	"http://ftp.gnu.org/gnu/grep/grep-${GREP_VER}.tar.xz"
	"http://ftp.gnu.org/gnu/gzip/gzip-${GZIP_VER}.tar.xz"
	"http://ftp.gnu.org/gnu/sed/sed-${SED_VER}.tar.xz"
	"http://ftp.gnu.org/gnu/gawk/gawk-${GAWK_VER}.tar.xz"
	"http://www.linux-pam.org/library/Linux-PAM-${PAM_VER}.tar.gz"
	"https://github.com/shadow-maint/shadow/releases/download/${SHADOW_VER}/shadow-${SHADOW_VER}.tar.xz"
	"http://download.savannah.gnu.org/releases/sysvinit/sysvinit-${SYSVINIT_VER}.tar.bz2"
	"https://github.com/gentoo/eudev/archive/v${EUDEV_VER}.tar.gz"
	"https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PROCPS_VER}.tar.xz"
	"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${LIBRESSL_VER}.tar.gz"
	"https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-${IPROUTE2_VER}.tar.xz"
	"https://downloads.sourceforge.net/project/net-tools/net-tools-${NET_TOOLS_VER}.tar.bz2"
	"http://ftp.gnu.org/gnu/tar/tar-${TAR_VER}.tar.xz")

	printf "\n\tFetching sources...\n\n"
	cd "${TARDIR}"
	for source in "${SOURCES[@]}" ; do
		wget -c -q --retry-connrefused -t 3 -T 5 "$source"
	done
}

unpack_sources()
{
	printf "\n\tDecompressing source tarballs...\n\n"

	if [[ ! -d "${LINUX_SRCDIR}" ]] ; then
		tar xJf "${LINUX_COMP}" -C "${SRCDIR}"/ || \
		{
				printf "\tError decompressing %s. Exiting.\n" "${LINUX_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${GCC_SRCDIR}" ]] ; then
		tar xjf "${GCC_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${GCC_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${MPFR_SRCDIR}" ]] ; then
		tar xJf "${MPFR_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${MPFR_COMP}" ; exit 1 ;
		}
	fi


	if [[ ! -d "${MPC_SRCDIR}" ]] ; then
		tar xzf "${MPC_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${MPC_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${GMP_SRCDIR}" ]] ; then
		tar xJf "${GMP_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${GMP_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${GLIBC_SRCDIR}" ]] ; then
		tar xjf "${GLIBC_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${GLIBC_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${GPERF_SRCDIR}" ]] ; then
		tar xzf "${GPERF_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${GPERF_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${BASH_SRCDIR}" ]] ; then
		tar xzf "${BASH_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${BASH_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${BINUTILS_SRCDIR}" ]] ; then
		tar xjf "${BINUTILS_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${BINUTILS_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${NCURSES_SRCDIR}" ]] ; then
		tar xzf "${NCURSES_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${NCURSES_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${ZLIB_SRCDIR}" ]] ; then
		tar xzf "${ZLIB_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${ZLIB_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${COREUTILS_SRCDIR}" ]] ; then
		tar xJf "${COREUTILS_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${COREUTILS_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${UTIL_LINUX_SRCDIR}" ]] ; then
		tar xJf "${UTIL_LINUX_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${UTIL_LINUX_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${FINDUTILS_SRCDIR}" ]] ; then
		tar xzf "${FINDUTILS_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${FINDUTILS_TARDIR}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${GREP_SRCDIR}" ]] ; then
		tar xJf "${GREP_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${GREP_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${GZIP_SRCDIR}" ]] ; then
		tar xJf "${GZIP_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${GZIP_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${SED_SRCDIR}" ]] ; then
		tar xJf "${SED_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${SED_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${GAWK_SRCDIR}" ]] ; then
		tar xJf "${GAWK_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${GAWK_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${PAM_SRCDIR}" ]] ; then
		tar xzf "${PAM_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${PAM_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${SHADOW_SRCDIR}" ]] ; then
		tar xJf "${SHADOW_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${SHADOW_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${SYSVINIT_SRCDIR}" ]] ; then
		tar xjf "${SYSVINIT_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${SYSVINIT_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${EUDEV_SRCDIR}" ]] ; then
		tar xzf "${EUDEV_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${EUDEV_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${PROCPS_SRCDIR}" ]] ; then
		tar xJf "${PROCPS_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${PROCPS_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${LIBRESSL_SRCDIR}" ]] ; then
		tar xzf "${LIBRESSL_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${LIBRESSL_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${IPROUTE2_SRCDIR}" ]] ; then
		tar xJf "${IPROUTE2_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${IPROUTE2_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${NET_TOOLS_SRCDIR}" ]] ; then
		tar xjf "${NET_TOOLS_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${NET_TOOLS_COMP}" ; exit 1 ;
		}
	fi

	if [[ ! -d "${TAR_SRCDIR}" ]] ; then
		tar xJf "${TAR_COMP}" -C "${SRCDIR}"/ || \
		{
			printf "\tError decompressing %s. Exiting.\n" "${TAR_COMP}" ; exit 1 ;
		}
	fi
}

build_toolchain() {
	# Crosstool-NG goes here
}

# TODO: Finish re-writing everything below this line.

prepare_build_env() {
	export CC="${CROSS_COMPILE}gcc"
	export LD="${CROSS_COMPILE}ld"
	export AR="${CROSS_COMPILE}ar"
	export AS="${CROSS_COMPILE}as"
	export RANDLIB="${CROSS_COMPILE}randlib"
	export STRIP="${CROSS_COMPILE}strip"
	export CXX="${CROSS_COMPILE}g++"
	export CFLAGS="-O2"
	export LDFLAGS=""
	export LDFLAGS=""
	export LIBS="-lpthread"
}

# build failed:
# ld: cannot find /lib64/libpthread.so.0
# ^ ???
build_gcc () {
	mkdir -p "${BUILD_DIR}"/gcc
	cd "${BUILD_DIR}"/gcc
	"${GCC_SRCDIR}"/configure \
	--build="${CLFS_HOST}" \
	--target="${CLFS_TARGET}" \
	--host="${CLFS_TARGET}" \
	--prefix="${TOOLDIR}" \
	--enable-shared \
	--disable-nls \
	--enable-c99 \
	--enable-long-long \
	--enable-languages=c,c++ \
	--enable-__cxa_atexit \
	--enable-threads=posix \
	--with-system-zlib \
	--enable-checking=release || return 1
	make -j"${JOBS}" AS_FOR_TARGET="${CLFS_TARGET}-as" LD_FOR_TARGET="${CLFS_TARGET}-ld" || return 1
	make install || return 1
}

# Update to p12 (TODO)
#build_bash() {
#	# ?
#	# sed -i '/#define SYS_BASHRC/c\#define SYS_BASHRC "/etc/bash.bashrc"' "${BASH_SRCDIR}"/config-top.h
#
#	mkdir -p "${BUILD_DIR}"/bash
#	cd "${BUILD_DIR}"/bash
#	"${BASH_SRCDIR}"/configure \
#	--host="${CLFS_TARGET}" \
#	--prefix="${SYSROOT}"/usr \
#	--bindir="${SYSROOT}"/bin return 1
#	make -j"${JOBS}" || return 1
#	make install
#	rm -f "${SYSROOT}"/bin/bashbug
#	cd "${SYSROOT}"/bin && ln -sf bash sh
#}

build_binutils() {
	mkdir -p "${BUILD_DIR}"/binutils-gdb
	cd "${BUILD_DIR}"/binutils-gdb
	"${BINUTILS_SRCDIR}"/configure \
	--host="${CLFS_TARGET}" \
	--target="${CLFS_TARGET}" \
	--prefix="${TOOLDIR}"/ \
	--enable-shared || return 1
	make -j"${JOBS}" || return 1
	make install
}

build_coreutils() {
	mkdir -p "${BUILD_DIR}"/coreutils
	cd "${BUILD_DIR}"/coreutils
	"${COREUTILS_SRCDIR}"/configure \
		--host="${CLFS_TARGET}" \
		--prefix="${SYSROOT}"/usr \
		--bindir="${SYSROOT}"/bin || return 1
	make -j"${JOBS}" || return 1
	make install
}

# can pass building in some machine.. to use busybox instead?
# I'm not using busybox, let's see if this works for me.
build_iproute2() {
	cd "${IPROUTE2_SRCDIR}"
	# for cross compiling
	sed -i 's/^CC :=.*$/CC := aarch64-linux-gnu-gcc/;s/^HOSTCC ?=.*$/HOSTCC ?= gcc/' Makefile || return 1
	make -j"${JOBS}" || return 1
	# can't use make install
	cp -v ip/ip bridge/bridge misc/{lnstat,ss} tc/tc "${SYSROOT}"/sbin/
}

# can pass building, maybe will add this later..
# Does it work or not?
build_nettools() {
	cd "${NET_TOOLS_SRCDIR}"
	CC="${CROSS_COMPILE}"-gcc make
}

build_find() {
	mkdir -p "${BUILD_DIR}"/find
	cd "${BUILD_DIR}"/find
	printf "gl_cv_func_wcwidth_works=yes" > config.cache
	printf "ac_cv_func_fnmatch_gnu=yes" >> config.cache
	"${FINDUTILS_SRCDIR}"/configure \
	--host="${CLFS_TARGET}" \
	--prefix="${SYSROOT}"/usr/ \
	--bindir="${SYSROOT}"/bin \
	--cache-file=config.cache || return 1
	make -j"${JOBS}" || return 1
	make install || return 1
}

build_grep() {
	mkdir -p "${BUILD_DIR}"/grep
	cd "${BUILD_DIR}"/grep
	"${GREP_SRCDIR}"/configure \
	--host="${CLFS_TARGET}" \
	--prefix="${SYSROOT}"/usr \
	--bindir="${SYSROOT}"/bin \
	|| return 1
	make -j"${JOBS}" || return 1
	make install || return 1
}

build_ncurses() {
	mkdir -p "${BUILD_DIR}"/ncurses
	cd "${BUILD_DIR}"/ncurses
	AWK="gawk" "${NCURSES_SRCDIR}"/configure \
	--build="${CLFS_HOST}" \
	--host="${CLFS_TARGET}" \
	--prefix="${SYSROOT}"/usr \
	--libdir="${SYSROOT}"/usr/lib64 \
	--with-terminfo-dirs=/usr/lib/terminfo \
	--with-termlib=tinfo \
	--without-ada \
	--without-debug \
	--enable-overwrite \
	--enable-widec \
	--with-build-cc=gcc \
	--with-shared || return 1
	make -j"${JOBS}" || return 1
	make install
	cd "${SYSROOT}"/usr/lib64
	ln -sf libncursesw.so.6.0 libncurses.so
# if without --enable-widec
#	ln -sf libmenu.so.6.0 libmenu.so
#	ln -sf libpanel.so.6.0 libpanel.so
#	ln -sf libform.so.6 libform.so
	ln -sf libtinfo.so.6.0 libtinfo.so
}

# for building gcc
build_zlib() {
	cd "${ZLIB_SRCDIR}"
	./configure \
	--prefix="${SYSROOT}"/usr/ \
	--libdir="${SYSROOT}"/usr/lib64 || return 1
	make -j"${JOBS}" || return 1
	make install
}

build_pam() {
	cd "${PAM_SRCDIR}"
	./configure \
	--host="${CLFS_TARGET}" \
	--with-sysroot="${SYSROOT}" \
	--prefix="${SYSROOT}"/usr \
	--disable-nis \
	--libdir="${SYSROOT}"/usr/lib64 || return 1
	make -j"${JOBS}" || return 1
	make install || return 1
	mkdir -p "${SYSROOT}"/usr/include/security
	cd "${SYSROOT}"/usr/include/security
	for i in $(ls ../{pam*,_pam*}); do ln -sf $i; done
}

build_util_linux() {
	cd "${UTIL_LINUX_SRCDIR}"
	./configure \
	--host="${CLFS_TARGET}" \
	--prefix="${SYSROOT}"/ \
	--includedir="${SYSROOT}"/usr/include/ \
	--datarootdir="${SYSROOT}"/usr/share \
	--with-bashcompletiondir="${SYSROOT}"/usr/share/bash-completion/completions \
	--without-python \
	--disable-wall \
	--disable-eject || return 1
	make -j"${JOBS}" || return 1
	make install || return 1
}

# TODO: Not tested
#build_libressl() {
#	cd "${LIBRESSL_SRCDIR}"
#	CC=gcc AR="ar r" RANLIB=ranlib "${LIBRESSL_SRCDIR}"/Configure dist no-shared \
#	--prefix="${SYSROOT}"/usr/ || return 1
#	make -j"${JOBS}" || return 1
#	make install || return 1
#}

build_gzip() {
	cd "${GZIP_SRCDIR}"
	./configure \
	--host="${CLFS_TARGET}" \
	--prefix="${SYSROOT}"/usr \
	--bindir="${SYSROOT}"/bin || return 1
	make -j"${JOBS}" || return 1
	make install || return 1
}

build_sed() {
	mkdir -p "${BUILD_DIR}"/sed
	cd "${BUILD_DIR}"/sed
	"${SED_SRCDIR}"/configure \
	--host="${CLFS_TARGET}" \
	--prefix="${SYSROOT}"/usr \
	--bindir="${SYSROOT}"/bin || return 1
	make -j"${JOBS}" || return 1
	make install || return 1
}

build_awk() {
	mkdir -p "${BUILD_DIR}"/awk
	cd "${BUILD_DIR}"/awk
	"${GAWK_SRCDIR}"/configure \
	--host="${CLFS_TARGET}" \
	--prefix="${SYSROOT}"/usr \
	--bindir="${SYSROOT}"/bin \
	|| return 1
	make -j"${JOBS}" || return 1
	make install || return 1
}

build_shadow() {
	cd "${SHADOW_SRCDIR}"
	autoreconf -v -f --install
	printf "shadow_cv_passwd_dir=%s" "${CLFS}/bin" > config.cache
	./configure \
	--host="${CLFS_TARGET}" \
	--prefix="${SYSROOT}"/usr \
	--bindir="${SYSROOT}"/usr/bin/ \
	--sbindir="${SYSROOT}"/usr/bin/ \
	--sysconfdir="${SYSROOT}"/etc \
	--enable-maintainer-mode \
	--disable-nls \
	--enable-subordinate-ids=no \
	--cache-file=config.cache || return 1
	make || return 1
	make install
}

build_procps() {
	cd "${PROCPS_SRCDIR}"
	# ?
	sed -i '/^AC_FUNC_MALLOC$/d;/^AC_FUNC_REALLOC$/d' configure.ac
	./configure \
	--host="${CLFS_TARGET}" \
	--prefix="${SYSROOT}"/usr \
	--libdir="${SYSROOT}"/usr/lib64 \
	|| return 1
	make -j"${JOBS}" || return 1
	make install || return 1
}

build_eudev() {
	mkdir -p "${BUILD_DIR}"/eudev
	cd "${BUILD_DIR}"/eudev
	"${EUDEV_SRCDIR}"/configure --host="${CLFS_TARGET}" \
	--prefix="${SYSROOT}"/ \
	--includedir="${SYSROOT}"/usr/include/ \
	--datarootdir="${SYSROOT}"/usr/share \
	--bindir="${SYSROOT}"/sbin/ \
	--sbindir="${SYSROOT}"/sbin/ \
	--disable-introspection \
	--disable-gtk-doc-html \
	--disable-gudev \
	--disable-keymap || return 1
	make -j"${JOBS}" || return 1
	make install || return 1
}

# Changing this (TODO)
#build_sysvinit() {
#	cd "${SYSVINIT_SRCDIR}"
#	make CC=${CROSS_COMPILE}gcc LDFLAGS=-lcrypt -j"${JOBS}" || return 1
#	cp -v src/{init,halt,shutdown,runlevel,killall5,fstab-decode,sulogin,bootlogd} "${SYSROOT}"/sbin/
#	cp -v src/mountpoint "${SYSROOT}"/bin/
#	cp -v src/{last,mesg,utmpdump,wall} "${SYSROOT}"/usr/bin/
#}

do_strip () {
	for i in $(find "${SYSTEM}"/); do
	echo "${i}"
	test -f "${i}" && file "${i}" | grep ELF &>/dev/null
	if [ $? -eq 0 ]; then
		"${CROSS_COMPILE}"strip --strip-unneeded "${i}"
	fi
	done
}

prep_dirs

fetch_sources

unpack_sources

build_toolchain
