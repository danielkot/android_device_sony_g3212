LOCAL_PATH := device/sony/g3212

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Dalvik heap configurations
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Manifest
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/manifest.xml:system/vendor/manifest.xml \
#    $(LOCAL_PATH)/configs/compatibility_matrix.xml:system/vendor/compatibility_matrix.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_device.xml:system/vendor/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:system/vendor/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:system/vendor/etc/a2dp_audio_policy_configuration.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/vendor/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_mediatek_video.xml:system/vendor/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/vendor/etc/media_profiles.xml

# Ramdisk
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/rootdir,root) $(call find-copy-subdir-files,*,$(LOCAL_PATH)/missing_files,system)

# Gatekeeper
#PRODUCT_PACKAGES += \
#    android.hardware.gatekeeper@1.0-impl

# Keystore
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:system/vendor/etc/seccomp_policy/mediacodec.policy

# Common stuff
$(call inherit-product, $(LOCAL_PATH)/platform/common.mk)
$(call inherit-product, $(LOCAL_PATH)/platform/permissions.mk)
$(call inherit-product, $(LOCAL_PATH)/platform/media.mk)
$(call inherit-product, $(LOCAL_PATH)/platform/wifi.mk)
$(call inherit-product, $(LOCAL_PATH)/platform/telephony.mk)
$(call inherit-product, $(LOCAL_PATH)/platform/google_override.mk)
$(call inherit-product, $(LOCAL_PATH)/platform/debug_boot.mk)

# Vendor
-include vendor/sony/mt6757/mt6757-vendor.mk
