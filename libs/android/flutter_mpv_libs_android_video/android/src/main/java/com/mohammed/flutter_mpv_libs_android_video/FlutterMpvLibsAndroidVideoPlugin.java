/**
 * This file is a part of flutter_mpv (https://github.com/media-kit/media-kit).
 *
 * Copyright © 2021 & onwards, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
 * All rights reserved.
 * Use of this source code is governed by MIT license that can be found in the LICENSE file.
 */
package com.mohammed.flutter_mpv_libs_android_video;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Objects;
import java.io.InputStream;
import java.io.BufferedReader;
import java.util.regex.Pattern;
import java.io.InputStreamReader;
import java.util.zip.GZIPInputStream;

import android.util.Log;
import androidx.annotation.NonNull;
import android.content.res.AssetManager;

import io.flutter.embedding.engine.plugins.FlutterPlugin;

import com.mohammed.mediakitandroidhelper.FlutterMpvAndroidHelper;

/** FlutterMpvLibsAndroidVideoPlugin */
public class FlutterMpvLibsAndroidVideoPlugin implements FlutterPlugin {
    static {
        // DynamicLibrary.open on Dart side may not work on some ancient devices unless System.loadLibrary is called first.
        try {
            System.loadLibrary("mpv");
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        Log.i("flutter_mpv", "package:flutter_mpv_libs_android_video attached.");
        try {
            // Save android.content.Context for access later within FlutterMpvAndroidHelpers e.g. loading bundled assets.
            FlutterMpvAndroidHelper.setApplicationContextJava(flutterPluginBinding.getApplicationContext());
            Log.i("flutter_mpv", "Saved application context.");
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        Log.i("flutter_mpv", "package:flutter_mpv_libs_android_video detached.");
    }
}
