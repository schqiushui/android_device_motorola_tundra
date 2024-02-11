#
# Copyright (C) 2022-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from tundra device
$(call inherit-product, device/motorola/tundra/device.mk)

# Inherit some common Pixel Experience stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

#Custom build type
CUSTOM_BUILD_TYPE := OFFICIAL

# Quick Tap
TARGET_SUPPORTS_QUICK_TAP := true

PRODUCT_NAME := aosp_tundra
PRODUCT_DEVICE := tundra
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 30 fusion

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=tundra_g \
    PRIVATE_BUILD_DESC="tundra_g-user 13 T1SJS33.117-30-3-7 94949b-05592 release-keys"

BUILD_FINGERPRINT := motorola/tundra_g/tundra:13/T1SJS33.117-30-3-7/94949b-05592:user/release-keys
