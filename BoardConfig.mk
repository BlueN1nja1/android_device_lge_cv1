#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/lge/cv1

TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

DEFAULT_SYSTEM_DEV_CERTIFICATE := $(PRODUCT_DEFAULT_DEV_CERTIFICATE)
PRODUCT_DEFAULT_DEV_CERTIFICATE := $(HOME)/.android-certs/releasekey

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Inherit device-specific board fragments
include $(DEVICE_PATH)/board/*.mk

# Inherit the proprietary files
-include vendor/lge/cv1/BoardConfigVendor.mk
-include vendor/lge/cv1-common/BoardConfigVendor.mk
