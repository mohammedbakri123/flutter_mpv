#include "include/flutter_mpv_libs_windows_audio/flutter_mpv_libs_windows_audio_plugin_c_api.h"

#include <iostream>

#include <flutter/plugin_registrar_windows.h>

void FlutterMpvLibsWindowsAudioPluginCApiRegisterWithRegistrar(FlutterDesktopPluginRegistrarRef registrar) {
  std::cout << "package:flutter_mpv_libs_windows_audio registered." << std::endl;
}
