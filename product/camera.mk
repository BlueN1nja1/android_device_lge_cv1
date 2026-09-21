# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml

# Camera
PRODUCT_PACKAGES += \
    camera.msm8937 \
    libmm-qcamera
	
# Camera HAL
PRODUCT_PACKAGES += \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    vendor.qti.hardware.camera.device@1.0 \
    vendor.qti.hardware.camera.device@1.0_vendor

# Compile the camera shim
PRODUCT_PACKAGES += libshim_camera

# Symlink camera config for legacy blob compatibility
PRODUCT_PACKAGES += \
    camera_config_symlink

# Inject the shim into the proprietary Nougat blob
TARGET_LD_SHIM_LIBS += \
/vendor/lib/libmmcamera_ppeiscore.so|libshim_c.so

# Camera App
PRODUCT_PACKAGES += \
    Snap
    
# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    camera.display.umax=1920x1080 \
    camera.display.lmax=1280x720 \
    camera.hal1.packagelist=com.google.android.talk \
    media.camera.ts.monotonic=1 \
    persist.camera.gyro.android=1 \
    persist.camera.HAL3.enabled=1 \
    vidc.enc.narrow.searchrange=1 \
    persist.media.treble_omx=false \
    ro.media.capture.maxres=13 \
    ro.media.capture.fast.fps=4 \
    ro.camcorder.videoModes=true
