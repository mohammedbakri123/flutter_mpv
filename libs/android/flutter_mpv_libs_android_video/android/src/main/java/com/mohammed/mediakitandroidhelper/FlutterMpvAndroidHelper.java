/**
 * This file is a part of flutter_mpv (https://github.com/media-kit/media-kit).
 *
 * Copyright © 2021 & onwards, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
 * All rights reserved.
 * Use of this source code is governed by MIT license that can be found in the LICENSE file.
 */
package com.mohammed.mediakitandroidhelper;

import android.content.Context;
import androidx.annotation.Keep;

import com.alexmercerind.mediakitandroidhelper.MediaKitAndroidHelper;

@Keep
public class FlutterMpvAndroidHelper {
    public static long newGlobalObjectRef(Object obj) {
        return MediaKitAndroidHelper.newGlobalObjectRef(obj);
    }

    public static void deleteGlobalObjectRef(long ref) {
        MediaKitAndroidHelper.deleteGlobalObjectRef(ref);
    }

    public static String copyAssetToFilesDir(String assetName) {
        return MediaKitAndroidHelper.copyAssetToFilesDir(assetName);
    }

    public static void setApplicationContextJava(Context context) {
        MediaKitAndroidHelper.setApplicationContextJava(context);
    }

    public static int openFileDescriptorNative(String uri) {
        return MediaKitAndroidHelper.openFileDescriptorNative(uri);
    }

    public static int openFileDescriptorJava(String uri) {
        return MediaKitAndroidHelper.openFileDescriptorJava(uri);
    }
}
