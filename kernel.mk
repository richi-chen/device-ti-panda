ifneq ($(strip $(SHOW_COMMANDS)),)
KERNEL_VERBOSE="V=1"
endif

KERNEL_PATH:=$(shell pwd)/kernel
KERNEL_DIR:=$(KERNEL_PATH)
KLIB:=$(KERNEL_PATH)
KLIB_BUILD:=$(KERNEL_PATH)

kernel_build: 
	cp $(TOP)/device/ti/panda/$(KERNEL_CONFIG) $(KERNEL_PATH)/arch/arm/configs/
	cd $(KERNEL_PATH) &&\
	$(MAKE) $(KERNEL_VERBOSE) ARCH=arm CROSS_COMPILE=arm-eabi- $(KERNEL_CONFIG) &&\
	$(MAKE) $(KERNEL_VERBOSE) ARCH=arm CROSS_COMPILE=arm-eabi- uImage modules
	cp $(KERNEL_PATH)/arch/arm/boot/zImage $(TOP)/device/ti/panda/kernel
	mkdir -p $(KERNEL_PATH)/modules_for_android
	cd $(KERNEL_PATH) &&\
	$(MAKE) ARCH=arm CROSS_COMPILE=arm-eabi- modules_install INSTALL_MOD_PATH=modules_for_android
	mkdir -p $(TARGET_OUT)/lib/modules
	find $(KERNEL_PATH)/modules_for_android -name "*.ko" -exec $(ACP) -fpt {} $(TARGET_OUT)/lib/modules/ \;

ifeq (0,1)
	cd $(TOP)/hardware/ti/wlan/mac80211/compat &&\
	$(MAKE) ARCH=arm CROSS_COMPILE=arm-eabi-
	mkdir -p $(TARGET_OUT)/lib/modules
	find $(TOP)/hardware/ti/wlan/mac80211/compat/. -name "*.ko" -exec $(ACP) -fpt {} $(TARGET_OUT)/lib/modules/ \;
endif

ifeq (0,1)
	cd $(TOP)/external/gator/driver &&\
	$(MAKE) ARCH=arm CROSS_COMPILE=arm-eabi- -C $(KERNEL_PATH) M=`pwd` modules
	mkdir -p $(TARGET_OUT)/lib/modules
	find $(TOP)/external/gator/driver/. -name "*.ko" -exec $(ACP) -fpt {} $(TARGET_OUT)/lib/modules/ \;
endif


