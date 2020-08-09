$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/sony/g3212/device.mk)

$(call inherit-product, vendor/omni/config/common.mk)

# Release name
PRODUCT_RELEASE_NAME := XA1 Ultra

PRODUCT_DEVICE := g3212
PRODUCT_NAME := omni_g3212
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia XA1 Ultra
PRODUCT_MANUFACTURER := Sony
PRODUCT_RESTRICT_VENDOR_FILES := false
