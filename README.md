# Introduction

Bootable ARM64 Root Filesystem, codename: Barf

This project is aimed at building a complete filesystem for ARM64 platforms, entirely from bare metal.

Barf; originated from NTU's sick Toolchain_Builder project, brings you an easily and fully customizable ARM64 powerhouse, designed specifically for you, from you. Edit easy-to-use variables, modify strings, configure and design your embedded your system, your way. This project is about YOU!

Building a Cross Linux from Scratch (CLFS) system has never been easier. Forget about reading documentation on building cross compilers, configuring embedded systems, and those long, boring PDF pages. Barf makes this process easy for you by giving you the choice of freedom, while keeping simplicity in mind. Barf is written entirely in GNU Bash, and is fully customizable, with everything in one place. Barf handles everything from building the cross compiler to your system packages. A simple set of scripts for even the most complex embedded installs. No secrets, no magic. Want something changed? Do it yourself with ease!

### Prerequisites:

A complete working native toolchain:

flex bison libtool binutils gcc g++ glibc make autoconf automake autogen type file bc elfutils sed gawk

### Barf's current goals:

- Verify all sources with a checksum
- Linux Kernel with tested configs (Raspberry Pi 3)
- Root filesystem

### How to use Barf:

Using Barf is easier than ever!

`$ ./barf_prep` will download and unpack any sources. If necessary, any patches that should be applied will be patched accordingly.

`$ ./barf_builder` This is where the building happens! Everything from the cross compiler to your ARM64 root filesystem will be handled by this powerful script.

The reason there is now two files is because there was simply too much scrolling involved, so hopefully these recent updates will make developing with Barf much more easier.

Another recent change is a provided user config file. This config file contains the following:

- Versions of all sources
- Download URLs of source archives
- Git tree locations and their respected branches (optionally tags; U-Boot)
- Number of compilation jobs

This now cuts down the clutter of the barf_prep script and will make future developments much easier.

### FAQ:

Q: Why Bash?

A: Bash is 100% open source, easy to use, and is licensed under the GPL which we all know and love. Bash can run on many devices and operating systems including Mac, Windows, Linux, FreeBSD and more! After 28 years since it's first release and still active, you can trust the reliability and stability of Bash. It's fast, easy to use, and learn!

Q: What's the point of this? Can't I just read into CLFS?

A: Absolutely! CLFS is a great starting point to learn how to build embedded Linux systems from scratch. Say you want to automate the build process, easily add packages to your image, or be able to create a new root filesystem image on the fly, without having to go through all of the CLFS documentation again and do everything by hand. Barf gives you the speed and simplicity of CLFS, without all the reading.

Q: Does Barf use SystemD?

A: No, Barf does not build, use, or even download any of SystemD, nor any packages that depend on it. Any pull requests or suggestions about adding it will be denied. SystemD is evil and must be avoided. Barf uses OpenRC and Eudev; a fork of udev that actually has SystemD stripped from it's code base. You can view the source code of eudev and it's lack of backdoors here: https://github.com/gentoo/eudev

Q: Is Barf associated with the NSA at all?

A: No. Barf is in no way affiliated, licensed, or endorsed by the NSA, nor any government agency for that matter. You could spend the time to add SELinux to your project if you wish, but that will never be included in this repository.

Q: Is Barf secure?

A: The stability and security of Barf is strictly dependant on the software that Barf compiles and puts into your root filesystem. Packages that are built by default can be removed from the script, or added by hand, and you, yourself, can be a developer too! WOW!

Q: How does Barf compare to Buildroot?

A: Barf's code base is much smaller; there is no ncurses interface or Makefile, none of the bells and whistles, or a fancy front-end that you get with Buildroot. Barf's design is simplistic as you can get. You're better off knowing more about Linux internals when using Barf than Buildroot as it is not as user-friendly, but rather extremely developer-friendly. DIY is the main focus of this project, giving you absolutely full control of the build system and every aspect of it's design.
