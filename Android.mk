LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),g3212)
ifeq ($(BUILD_ONLY_TWRP),true)
$(warning BUILD_ONLY_TWRP is set... Building TWRP)
else
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
endif
