//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_mpv_video/flutter_mpv_video_plugin_c_api.h>
#include <flutter_mpv_libs_windows_video/flutter_mpv_libs_windows_video_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FlutterMpvVideoPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterMpvVideoPluginCApi"));
  FlutterMpvLibsWindowsVideoPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterMpvLibsWindowsVideoPluginCApi"));
}
