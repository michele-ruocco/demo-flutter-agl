//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <dart_vlc/dart_vlc_plugin.h>
#include <flutter_gstreamer_player/flutter_gstreamer_player_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) dart_vlc_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DartVlcPlugin");
  dart_vlc_plugin_register_with_registrar(dart_vlc_registrar);
  g_autoptr(FlPluginRegistrar) flutter_gstreamer_player_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterGstreamerPlayerPlugin");
  flutter_gstreamer_player_plugin_register_with_registrar(flutter_gstreamer_player_registrar);
}
