/*
 * Copyright (C) 2016 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdint.h>
#include <system/window.h>

extern "C" {
    // Keep the existing dummy shims
    void _ZN7android13GraphicBufferC1Ejjij() {}
    void _ZNK7android11MediaBuffer8refcountEv() {}
    void _ZN7android20DisplayEventReceiverC1Ev() {}

    // 1. Declare the exact Oreo constructor found in libui.so
    extern void _ZN7android13GraphicBufferC1EjjijjjP13native_handleb(
        void* instance, uint32_t inWidth, uint32_t inHeight, int inFormat,
        uint32_t inLayerCount, uint32_t inUsage, uint32_t inStride,
        native_handle_t* inHandle, bool keepOwnership);

    // 2. Intercept the Nougat call from the camera blob and map it to Oreo
    void _ZN7android13GraphicBufferC1EjjijjP13native_handleb(
        void* instance, uint32_t inWidth, uint32_t inHeight, int inFormat,
        uint32_t inUsage, uint32_t inStride, native_handle_t* inHandle, bool keepOwnership) {

        // Pass to Oreo, injecting 1 for layerCount to match jjijjj
        _ZN7android13GraphicBufferC1EjjijjjP13native_handleb(
            instance, inWidth, inHeight, inFormat, 1, inUsage, inStride, inHandle, keepOwnership);
        }
}
