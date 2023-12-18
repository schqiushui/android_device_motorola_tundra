/*
 * Copyright (C) 2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"

using android::base::GetProperty;

namespace {
void PropertyOverride(const std::string& name, const std::string& value, bool add = true) {
    auto pi = const_cast<prop_info*>(__system_property_find(name.c_str()));

    if (pi != nullptr) {
        __system_property_update(pi, value.c_str(), value.size());
    } else if (add) {
        __system_property_add(name.c_str(), name.size(), value.c_str(), value.size());
    }
}
};  // anonymous namespace

void vendor_load_properties() {
    std::string carrier = GetProperty("ro.boot.carrier", "");

    if (!carrier.empty()) PropertyOverride("ro.carrier", carrier);

    if (carrier == "retcn") {
                PropertyOverride("ro.product.product.model", "XT2243-2");
                PropertyOverride("ro.product.product.name", "tundra_cn");
                PropertyOverride("ro.vendor.product.display", "moto S30 Pro");
                PropertyOverride("ro.vendor.product.display.plain_text", "moto S30 Pro");
            } else {
                PropertyOverride("ro.product.product.model", "motorola edge 30 fusion");
                PropertyOverride("ro.product.product.name", "tundra_g");
                PropertyOverride("ro.vendor.product.display", "motorola edge 30 fusion");
                PropertyOverride("ro.vendor.product.display.plain_text", "motorola edge 30 fusion");
    }

}
