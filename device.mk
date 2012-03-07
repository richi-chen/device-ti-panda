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

# Tiler
PRODUCT_PACKAGES += \
    libtimemmgr

#HWC Hal
PRODUCT_PACKAGES += \
    hwcomposer.omap4

#Lib Skia test
PRODUCT_PACKAGES += \
    SkLibTiJpeg_Test

# Camera
PRODUCT_PACKAGES += \
    CameraOMAP4 \
    Camera \
    camera_test

# VTC test
PRODUCT_PACKAGES += \
    VTCTestApp

ifeq ($(TARGET_PREBUILT_KERNEL),)
$(call inherit-product-if-exists, device/ti/richi-panda/kernel.mk)
LOCAL_KERNEL := device/ti/richi-panda/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel \
	device/ti/richi-panda/init.omap4pandaboard.rc:root/init.omap4pandaboard.rc \
	device/ti/richi-panda/init.omap4pandaboard.usb.rc:root/init.omap4pandaboard.usb.rc \
	device/ti/richi-panda/ueventd.omap4pandaboard.rc:root/ueventd.omap4pandaboard.rc \
	device/ti/richi-panda/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	device/ti/richi-panda/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	device/ti/richi-panda/bootanimation.zip:/system/media/bootanimation.zip

# to mount the external storage (sdcard)
PRODUCT_COPY_FILES += \
	device/ti/richi-panda/vold.fstab:system/etc/vold.fstab

PRODUCT_PACKAGES += \
       boardidentity \
       libboardidentity \
       libboard_idJNI \
       Board_id

PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	hwui.render_dirty_regions=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS := \
    device/ti/richi-panda/overlay

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

#PRODUCT_PROPERTY_OVERRIDES += \
#	ro.sf.lcd_density=160

#PRODUCT_PROPERTY_OVERRIDES += \
#	persist.hwc.mirroring.region=0:0:1920:1080

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	audio.primary.omap4 \
	audio.a2dp.default \
	libaudioutils

# Wifi
PRODUCT_PACKAGES += \
	dhcpcd.conf \
	hostapd.conf \
	wifical.sh \
	TQS_D_1.7.ini \
	TQS_D_1.7_127x.ini \
	crda \
	regulatory.bin \
	calibrator

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
	system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
	system/extras/bugmailer/send_bug:system/bin/send_bug

# tinyalsa utils
PRODUCT_PACKAGES += \
	tinymix \
	tinyplay \
	tinycap

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# SMC components for secure services like crypto, secure storage
PRODUCT_PACKAGES += \
        smc_pa.ift \
        smc_normal_world_android_cfg.ini \
        libsmapi.so \
        libtf_crypto_sst.so \
        libtfsw_jce_provider.so \
        tfsw_jce_provider.jar \
        tfctrl

# Linaro extra
include $(LOCAL_PATH)/ZeroXBenchmark.mk
PRODUCT_PACKAGES += \
    	ZeroXBenchmark \
    	$(ZEROXBENCHMARK_NATIVE_APPS) \
		libglmark2-android \
		GLMark2 \
		LinaroWallpaper \
		powertop \
		gatord

# external packages
PRODUCT_PACKAGES += \
	AndroidTerm \
	FileManager \
	Superuser \
	replicaisland


$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/omap4/ti-omap4-vendor.mk)
$(call inherit-product-if-exists, hardware/ti/wpan/ti-wpan-products.mk)
$(call inherit-product-if-exists, device/ti/proprietary-open/omap4/ti-omap4-vendor.mk)
#$(call inherit-product-if-exists, vendor/ti/panda/device-vendor.mk)
$(call inherit-product, device/ti/richi-panda/proprietary-open/install-binaries.mk)
$(call inherit-product, device/ti/proprietary-open/wl12xx/wlan/wl12xx-wlan-fw-products.mk)
$(call inherit-product-if-exists, device/ti/common-open/s3d/s3d-products.mk)
$(call inherit-product-if-exists, device/ti/proprietary-open/omap4/ducati-blaze_tablet.mk)
