// This file is a part of flutter_mpv (https://github.com/media-kit/media-kit).
//
// Copyright © 2021 & onwards, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
// All rights reserved.
// Use of this source code is governed by MIT license that can be found in the
// LICENSE file.

#include "include/flutter_mpv_libs_linux/flutter_mpv_libs_linux_plugin.h"

#include <stdio.h>
#include <locale.h>

void flutter_mpv_libs_linux_plugin_register_with_registrar(FlPluginRegistrar* registrar) {
  printf("package:flutter_mpv_libs_linux registered.\n");
  fflush(stdout);
  setlocale(LC_NUMERIC, "C");
}
