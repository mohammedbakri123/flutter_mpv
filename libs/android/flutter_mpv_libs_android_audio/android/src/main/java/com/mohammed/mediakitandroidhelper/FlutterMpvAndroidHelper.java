/**
 * This file is a part of flutter_mpv (https://github.com/media-kit/media-kit).
 *
 * Copyright © 2021 & onwards, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
 * All rights reserved.
 * Use of this source code is governed by MIT license that can be found in the LICENSE file.
 */
package com.mohammed.mediakitandroidhelper;

import android.net.Uri;
import android.content.Context;
import androidx.annotation.Keep;

import java.io.FileNotFoundException;

@Keep
public class FlutterMpvAndroidHelper {
    static {
        System.loadLibrary("mediakitandroidhelper");
    }

    // Store android.content.Context for access in openFileDescriptor.
    private static Context applicationContext = null;

    public static native long newGlobalObjectRef(Object obj);

    public static native void deleteGlobalObjectRef(long ref);

    public static native String copyAssetToFilesDir(String assetName);

    private static native void setApplicationContextNative(Context context);

    public static void setApplicationContextJava(Context context) {
        applicationContext = context;
        setApplicationContextNative(context);
    }

    public static native int openFileDescriptorNative(String uri);

    public static int openFileDescriptorJava(String uri) {
        try {
            final Uri object = Uri.parse(uri);
            return applicationContext.getContentResolver().openFileDescriptor(object, "r").detachFd();
        } catch (Throwable e) {
            e.printStackTrace();
            return -1;
        }
    }
}
