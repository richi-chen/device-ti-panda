#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# These two variables are set first, so they can be overridden
# by BoardConfigVendor.mk
BOARD_USES_GENERIC_AUDIO := false
#BOARD_USES_TI_OMAP_MODEM_AUDIO := true
USE_CAMERA_STUB := true
OMAP_ENHANCEMENT := true
OMAP_ENHANCEMENT_S3D := true
ENHANCED_DOMX := true
BLTSVILLE_ENHANCEMENT :=true
# Use the non-open-source parts, if they're present
-include vendor/ti/panda/BoardConfigVendor.mk

# kernel config
KERNEL_CONFIG := richi-panda_defconfig

# TI config
CFG_FM_SERVICE_TI := yes

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

BOARD_HAVE_BLUETOOTH := true
TARGET_NO_BOOTLOADER := true
#TARGET_NO_RECOVERY := true

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyO2,115200n8 mem=1024M@0x80000000 init=/init androidboot.console=ttyO2
#BOARD_KERNEL_CMDLINE := console=ttyO2,115200n8 mem=1024M androidboot.console=ttyO2 vram=20M omapfb.vram=0:16M
#BOARD_KERNEL_CMDLINE := console=ttyO2,115200n8 vmalloc=128M omap_wdt.timer_margin=30 vram=48M omapfb.vram=0:24M,1:24M mem=1024M@0x80000000 init=/init androidboot.console=ttyO2
#BOARD_KERNEL_CMDLINE := console=ttyO2,115200n8 rootwait ro earlyprintk fixrtc nocompcache vram=48M omapfb.vram=0:24M,1:24M mem=456M@0x80000000 mem=512M@0xA0000000 init=/init androidboot.console=ttyO2

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := omap4
TARGET_BOOTLOADER_BOARD_NAME := panda 

BOARD_EGL_CFG := device/ti/richi-panda/egl.cfg

#BOARD_USES_HGL := true
#BOARD_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
BOARD_USES_PANDA_GRAPHICS := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_panda
# device-specific extensions to the updater binary
TARGET_RELEASETOOLS_EXTENSIONS := device/ti/richi-panda

BOARD_USES_SECURE_SERVICES := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 536870912
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096

# Connectivity - Wi-Fi
USES_TI_MAC80211 := true
ifdef USES_TI_MAC80211
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_wl12xx
BOARD_WLAN_DEVICE                := wl12xx_mac80211
BOARD_SOFTAP_DEVICE              := wl12xx_mac80211
#WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wl12xx_sdio.ko"
#WIFI_DRIVER_MODULE_NAME          := "wl12xx_sdio"
WIFI_FIRMWARE_LOADER             := ""
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211
endif

ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4
ifdef OMAP_ENHANCEMENT_S3D
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_S3D
endif
endif

#Set 32 byte cache line to true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true

BOARD_LIB_DUMPSTATE := libdumpstate.panda

BOARD_VENDOR_TI_GPS_HARDWARE := omap4
BOARD_GPS_LIBRARIES := libgps
