obj-m += mcp9600.o

ARCH ?= $(SUBARCH)
CROSS_COMPILE ?=
KVER  ?= $(if $(KERNELRELEASE),$(KERNELRELEASE),$(shell uname -r))
KSRC ?= $(if $(KERNEL_SRC),$(KERNEL_SRC),/lib/modules/$(KVER)/build)
MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/iio/temperature/
INSTALL_PREFIX :=

all:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd) modules

modules_install:
	$(MAKE) -C $(KSRC) M=$(shell pwd) modules_install

.PHONY: clean

clean:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd) clean
