SUBDIRS =  misc-progs misc-modules \
           skull scull scullc scullp lddbus sculld scullv shortprint simple  \
           pci usb snull short \
           tty sbull   

all: subdirs

subdirs:
	for n in $(SUBDIRS); do $(MAKE) -C $$n || exit 1; done

clean:
	for n in $(SUBDIRS); do $(MAKE) -C $$n clean; done
