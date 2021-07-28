# Comment/uncomment the following line to disable/enable debugging
DEBUG = y


# Add your debugging flag (or not) to CFLAGS
ifeq ($(DEBUG),y)
  DEBFLAGS = -O -g -DSCULL_DEBUG # "-O" is needed to expand inlines
else
  DEBFLAGS = -O2
endif

LDDINC=$(PWD)/../include

EXTRA_CFLAGS += $(DEBFLAGS) -std=gnu99 -DENABLE_DEBUG
EXTRA_CFLAGS += -I$(LDDINC)

ifneq ($(KERNELRELEASE),)
# call from kernel build system

scull-objs := main.o pipe.o access.o

obj-m	:= scull.o

else

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)

modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

endif



clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean

depend .depend dep:
	$(CC) $(EXTRA_CFLAGS) -M *.c > .depend

# Enable pr_debug
CFLAGS_main.o := -DDEBUG
CFLAGS_pipe.o := -DDEBUG
CFLAGS_access.o := -DDEBUG

ifeq (.depend,$(wildcard .depend))
include .depend
endif
