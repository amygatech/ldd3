# scull

To best illustrate the concepts behind the basic file operations, device
**scull** is the only choice. **scull** is a char driver that acts on a memory
area as though it were a device. In this example, userspace program can write
data to this device, and the device will hold all this data in memory until
the next open of the device file. Any read operations performed on this device
will extract the data out, and the data won't be swapt (Only open operation
has the ability to sweep data).

## build the module

To build this module, execute:

```bash
make KERNELDIR=/path/to/kernel/source/dir
```

If you have already set and exported `KERNELDIR` environment variable, simply
execute `make` is enough.

If neither `KERNELDIR` environment variable nor `KERNELDIR` option of make
are set, the current running kernel will be built against.

## Usage

Copy **load_module.sh** and **scull.ko** files to the target machine, then run:

```bash
sudo ./load_module.sh load|unload
sudo ./scull.init {start|stop|restart|force-reload}
```

## test the module

Write anything by any Linux tool you favoured to any device file named as
`/dev/scullN`. Then execute `dmesg | tail -10`, you will find some messages
like:

```
[33649.196446]  ----Enter scull_init_module()-----
[33649.198203] scull_p_init() is invoked
[33649.198225] scull_p_setup_cdev() is invoked
[33649.198264] scull_p_setup_cdev() is invoked
[33649.198299] scull_p_setup_cdev() is invoked
[33649.198330] scull_p_setup_cdev() is invoked
[33649.199346] scullsingle registered at 1fe00008
[33649.199383] sculluid registered at 1fe00009
[33649.199409] scullwuid registered at 1fe0000a
[33649.199434] scullpriv registered at 1fe0000b

.. clean up
[33653.670436]  ----Enter scull_cleanup_module()-----
[33653.672190] scull_p_cleanup() is invoked

```

Next, read the device file which you've writen to before, if success, contents
previously wrote into are extacted. `dmesg | tail -10 ` to see debug message
or just run `tail -f /var/log/kern.log`



### ¶ The end
