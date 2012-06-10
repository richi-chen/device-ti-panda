LOCAL_PATH := $(my-dir)

include $(call all-subdir-makefiles)

# Install Ducati from the TGZ defined in the device-inherited mk file
#############################################
ifneq (1,1)
ifneq ($(DUCATI_TGZ),)

include $(CLEAR_VARS)
LOCAL_MODULE := tesla-dsp.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(ti-ducati.untarred_intermediates)/tesla-dsp.bin
$(LOCAL_BUILT_MODULE) : $(ti-ducati.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@
endif
endif
#############################################
