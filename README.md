# Linux IIO driver for MCP9600 thermocouple EMF converter

## Quickstart
```
$ make
$ sudo cp mcp9600.ko /lib/modules/$(uname -r)/kernel/drivers/iio/temperature/
$ sudo modprobe mcp9600
$ echo mcp9600 0x60 | sudo tee /sys/class/i2c-adapter/i2c-1/new_device 
mcp9600 0x60
$ ls /sys/bus/iio/devices/
iio:device0
$ ls /sys/bus/iio/devices/iio\:device0/
current_timestamp_clock  in_temp_ambient_scale  name       uevent
dev                      in_temp_raw            power
in_temp_ambient_raw      in_temp_scale          subsystem
```
