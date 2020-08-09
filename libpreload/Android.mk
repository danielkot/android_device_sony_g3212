LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_INCLUDE_LIBPRELOAD),true)
    include $(CLEAR_VARS)
    LOCAL_MODULE := libpreload
    LOCAL_MODULE_TAGS := optional
    LOCAL_SHARED_LIBRARIES := libbinder libc liblog libicuuc libicui18n libmedia libgui libui libutils
    LOCAL_SRC_FILES := \
        audio.cpp \
        omx.cpp \
        xlog.c \
        sensor.cpp \
        gui.cpp
include $(BUILD_SHARED_LIBRARY)
endif
