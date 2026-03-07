import 'package:flutter/foundation.dart';
import 'package:flutter_mpv_video/flutter_mpv_video.dart';

final configuration = ValueNotifier<VideoControllerConfiguration>(
  const VideoControllerConfiguration(
    // PLEASE USE auto-safe IN PRODUCTION.
    hwdec: 'auto',
    enableHardwareAcceleration: true,
  ),
);
