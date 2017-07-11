# Introduction

Bootable ARM64 Root Filesystem, codename: BARF

This project is aimed at building a complete filesystem for ARM64 platforms, entirely from bare metal.

BARF; originated from NTU's sick Toolchain_Builder project, brings you an easily and fully customizable ARM64 powerhouse script, designed specifically for you, from you. Edit easy-to-use variables, modify strings, configure and design your embedded your system, your way. This project is about YOU!

Building a Cross Linux from Scratch (CLFS) system has never been easier. Forget about reading documentation on building cross compilers, configuring embedded systems, and those long, boring PDF pages. BARF makes this process easy for you by giving you the choice of freedom, while keeping simplicity in mind. BARF is written entirely in GNU Bash, and is fully customizable, with everything in one place. BARF handles everything from building the cross compiler (Crosstool-NG) to your system packages. A simple script for even the most complex embedded installs. No secrets, no magic. Want something chnaged? Do it yourself with ease!

FAQ:

Q: Why Bash?

A: Bash is 100% open source, easy to use, and is licensed under the GPL which we all know and love. Bash can run on many devices and operating systems including Mac, Windows, Linux, FreeBSD and more! After it's 28 years of development, you can trust the reliability and stability of Bash. It's fast, easy to use, and learn!

Q: What's the point of this? Can't I just read into CLFS?

A: Absolutely! CLFS is a great starting point to learn how to build embedded Linux systems from scratch. Say you want to automate the build process, easily add packages to your image, or be able to create a new root filesystem image on the fly, without having to go through all of the CLFS documentation again and do everything by hand. BARF gives you the speed and simplicity of CLFS, without all the reading.

Q: Does BARF use SystemD?

A: No, BARF does not build, use, or even download any of SystemD, nor any packages that depend on it. Any pull requests or suggestions about adding it will be denied. SystemD is evil and must be avoided. BARF uses OpenRC and Eudev; a fork of udev that actually has SystemD stripped from it's code base. You can view the source code of eudev and it's lack of backdoors here: https://github.com/gentoo/eudev

Q: Is BARF associated with the NSA at all?

A: BARF is in no way affiliated, licensed, or endorsed by the NSA, nor any government agency for that matter.

Q: Is BARF secure?

A: The stability and security of BARF is strictly dependant on the software that BARF compiles and puts into your root filesystem. Packages that are built by default can be removed from the script, or added by hand, and you, yourself, can be a developer too! WOW!

BARF's current goals:

- Build a toolchain (Crosstool-NG)
- Linux Kernel with tested configs (Raspberry Pi 3)
- Root filesystem

### Prerequisites:

A complete working native toolchain:

flex bison libtool binutils gcc g++ glibc make autoconf automake autogen type file bc elfutils sed gawk
