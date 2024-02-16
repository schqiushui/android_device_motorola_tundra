#
# Copyright (C) 2022 The LineageOS Project
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

# A/B
TARGET_IS_VAB := true

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1080

# Screen
TARGET_SCREEN_DENSITY := 446

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Inherit from motorola sm8350-common
$(call inherit-product, device/motorola/sm8350-common/common.mk)

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResTundra \
    NfcResTundra \
    SettingsResTundra \
    SettingsProviderResTundra \
    SystemUIResTundra \
    WifiResTundra

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/sku_lahaina/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_io_policy.conf \
    $(LOCAL_PATH)/audio/sku_lahaina/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/sku_lahaina/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths.xml \
    $(LOCAL_PATH)/audio/sku_lahaina/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sku_lahaina/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Camera
PRODUCT_PACKAGES += \
    libgui_shim_vendor

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_4630947043778501762.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630947043778501762.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.motorola

# Init
PRODUCT_PACKAGES += \
    fstab.qcom.zramwb \
    init.mmi.overlay.rc \
    init.mmi.product.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom.zramwb:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.qcom.zramwb

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/goodix_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodix_ts.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml \
    $(LOCAL_PATH)/media/media_codecs_performance_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_lahaina.xml \
    $(LOCAL_PATH)/media/media_codecs_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_lahaina.xml \
    $(LOCAL_PATH)/media/media_profiles_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_lahaina.xml

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2.vendor \
    android.hardware.nfc_snxxx@1.2-service \
    android.hardware.secure_element@1.2.vendor \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml

# Sensors
PRODUCT_PACKAGES += \
    sensors.motorola

PRODUCT_COPY_FILES += \
    hardware/motorola/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.motorola

# Shipping API level
BOARD_API_LEVEL := 31
BOARD_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine-tundra-game-perf.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-tundra.conf

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/tundra/tundra-vendor.mk)
