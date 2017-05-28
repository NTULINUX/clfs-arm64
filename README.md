### introduction

This project contains the following items:

- build toolchain: gcc,binutils,glibc, etc.
- build Linux Kernel；
- rootfs.

### 如何运行

在运行前要确保在本机安装了必要软件包。本人在 fedora 和 ubuntu 上测试过。列出了大部分所需要的软件包。如果在编译的时候，提醒有未安装的软件包，可自行再安装上。

直接运行 ./setup.sh 即可。第一次运行的时候，会下载源代码会编译工具链，会花费比较多的时间。后面再编译就会快很多。

如果需要手动编译某一个 target 机器的包。例如 bash，可以使用下面方法：

        prepare_build_env
        build_bash

`prepare_build_env` 会设置 CC 等环境变量。

如果需要使用 gdb 调试内核，可以在 qemu 运行起来的时候，通过按 ctrl+a c，在 qemu 的终端输入 gdbserver 打开 gdb server。也可以在运行的时候，通过指定 -s 参数打开 gdb server。如下所示：

        . env_setup.sh
        run -s

然后另开一个终端，通过 `gdb_attach` 连接：

        . env_setup.sh
        gdb_attach

### 文件结构

- build: 编译用的临时文件夹
- configs: kernel 和 busybox 的配置文件
- git: 使用 git clone 下载的代码
- source: 解压出来的源文件
- tarball: 下载下载的压缩源文件
- tools: 编译出来的 host 机器工具，包括工具链
- out: 编译得到的 target 目标

### prerequisite packages:

- fedora:
    dnf install flex libfdt-devel bison texinfo libtool gcc-g++

        To find a missing package name:
        dnf whatprovides */<program>

- ubuntu:
    apt-get install libglib2.0-dev libpixman-1-dev libfdt-dev zlib1g-dev texinfo bison flex gawk autoconf autopoint libncurses5-dev build-essential bridge-utils openvpn
    NOTES:
    bridge-utils, openvpn: for creating host tap device that needs by networking.


### 其他

软件版权归本人所有，你可以任意传播使用，但不得未经作者许可用于商业用途！本人并不对可能由此给您的计算机系统带来的任何问题负责！

0. http://trac.clfs.org/
