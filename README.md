ldd3: Linux Device Drivers 3 examples updated to work with kernel 4.15 on ubuntu 18.04

# About
-----

Linux Device Drivers 3 (http://lwn.net/Kernel/LDD3/) book is now a few years
old and most of the example drivers do not compile in recent kernels.

This project aims to keep LDD3 example drivers up-to-date with recent kernels.

The original code can be found at: http://examples.oreilly.com/9780596005900/

# Compiling
----------

The example drivers should compile against latest Linus Torvalds kernel tree:
* git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git

To compile the drivers against a specific tree (for example Linus tree):
```
$ git clone git://github.com/amygatech/ldd3.git
$ export KERNELDIR=/usr/src/linux-headers-4.15.0-147-generic  (/path/to/linux)
$ cd ldd3
$ make
* To use latest Linux kernel
$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
```


# Latest Tested Kernel Builds
---------
The kernel builds below are the versions most recently tested/supported

* Ubuntu 18.04 kernel 4.15


# Eclipse Integration
---------4
Eclipse CDT integration is provided by symlinking the correct linux source directory with the ./linux_source_cdt symlink.
The .project and .cproject files were setup using instructions in [this link](https://wiki.eclipse.org/HowTo_use_the_CDT_to_navigate_Linux_kernel_source)
and assuming a symlink is setup in the local project directory to point to relevant kernel headers

This can be done on a system with kernel headers installed using:
```
ln -s /usr/src/linux-headers-`uname -r`/ linux_source_cdt
```
