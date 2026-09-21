# Copyright (C) 2013-2016, The CyanogenMod Project
# Copyright (C) 2018, The LineageOS Project
# ... (license block) ...

LOCAL_PATH := $(call my-dir)

# Camera
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    lg_camera_misc.cpp

LOCAL_SHARED_LIBRARIES := libutils libgui libui liblog libbinder
LOCAL_MODULE := libshim_camera
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_32_BIT_ONLY := true
include $(BUILD_SHARED_LIBRARY)
