ifneq ($(strip $(SHOW_COMMANDS)),)
KERNEL_VERBOSE="V=1"
endif

ifeq (full_richi_panda,$(TARGET_PRODUCT))

export KERNEL_PATH:=$(shell pwd)/kernel
export WLAN_PATH:=$(shell pwd)/hardware/ti/wlan/mac80211/compat_wl12xx

export TMS470CGTOOLPATH:=/opt/ti/ccsv5/tools/compiler/tms470
export C6000CGTOOLPATH:=/opt/TI/C6000CGT7.2.0


kernel_build: 
	cp $(TOP)/device/ti/richi-panda/$(KERNEL_CONFIG) $(KERNEL_PATH)/arch/arm/configs/
	cd $(KERNEL_PATH) &&\
	$(MAKE) $(KERNEL_VERBOSE) ARCH=arm CROSS_COMPILE=arm-eabi- $(KERNEL_CONFIG) &&\
	$(MAKE) $(KERNEL_VERBOSE) ARCH=arm CROSS_COMPILE=arm-eabi- uImage modules
	cp $(KERNEL_PATH)/arch/arm/boot/zImage $(TOP)/device/ti/richi-panda/kernel
	mkdir -p $(KERNEL_PATH)/modules_for_android
	cd $(KERNEL_PATH) &&\
	$(MAKE) ARCH=arm CROSS_COMPILE=arm-eabi- modules_install INSTALL_MOD_PATH=modules_for_android
	mkdir -p $(TARGET_OUT)/lib/modules
	find $(KERNEL_PATH)/modules_for_android -name "*.ko" -exec $(ACP) -fpt {} $(TARGET_OUT)/lib/modules/ \;

ifeq (1,1)
	cd $(WLAN_PATH) &&\
	$(MAKE) ARCH=arm CROSS_COMPILE=arm-eabi- KERNEL_DIR=$(KERNEL_PATH) KLIB=$(KERNEL_PATH) KLIB_BUILD=$(KERNEL_PATH)
	mkdir -p $(TARGET_OUT)/lib/modules
	find $(WLAN_PATH)/. -name "*.ko" -exec $(ACP) -fpt {} $(TARGET_OUT)/lib/modules/ \;
endif

ifeq (0,1)
	cd $(TOP)/external/gator/driver &&\
	$(MAKE) ARCH=arm CROSS_COMPILE=arm-eabi- -C $(KERNEL_PATH) M=`pwd` modules
	mkdir -p $(TARGET_OUT)/lib/modules
	find $(TOP)/external/gator/driver/. -name "*.ko" -exec $(ACP) -fpt {} $(TARGET_OUT)/lib/modules/ \;
endif


sysbios_build:
	cd $(TOP)/sysbios &&\
	$(MAKE)

sysbios_clean:
	cd $(TOP)/sysbios &&\
	$(MAKE) clean

kernel_clean:
	$(MAKE) -C $(KERNEL_PATH) ARCH=arm  distclean

wl12xx_compat_clean:
	$(MAKE) -C $(WLAN_PATH) KERNEL_DIR=$(KERNEL_PATH) KLIB=$(KERNEL_PATH) KLIB_BUILD=$(KERNEL_PATH) CROSS_COMPILE=arm-eabi- ARCH=arm clean

endif

