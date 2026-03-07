/// This file is a part of media_kit (https://github.com/media-kit/media-kit).
///
/// Copyright © 2021 & onwards, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.

import 'package:media_kit/src/player/platform_player.dart';

/// {@template video_performance_presets}
///
/// VideoPerformancePresets
/// ------------------------
/// Pre-configured video performance settings for common use cases.
///
/// These presets provide optimized configurations for different scenarios:
/// - Low-end devices with limited resources
/// - High-quality playback on powerful devices
/// - Balanced settings for most devices
/// - Software decoding for debugging or compatibility
///
/// {@endtemplate}
class VideoPerformancePresets {
  /// Low-end device configuration for maximum compatibility.
  ///
  /// Optimized for devices with limited CPU/GPU resources.
  /// Prioritizes smooth playback over quality.
  ///
  /// Features:
  /// - Hardware decoding (auto-detect)
  /// - Minimal decoder threads (2)
  /// - Aggressive frame dropping to maintain smoothness
  /// - Simple video sync
  /// - Fast bilinear scaling
  static const VideoPerformanceConfiguration lowEndDevice =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto',
    decoderThreads: 2,
    frameDropping: 'decoder+vo',
    videoSync: 'audio',
    scaler: 'bilinear',
    downScaler: 'bilinear',
    interpolation: false,
    deinterlacing: 'auto',
  );

  /// High-quality playback configuration for high-end devices.
  ///
  /// Optimized for devices with powerful CPU/GPU.
  /// Prioritizes quality over resource usage.
  ///
  /// Features:
  /// - Hardware decoding with surface upload
  /// - More decoder threads for speed
  /// - No frame dropping (best quality)
  /// - Display-resample sync for smoothness
  /// - Lanczos scaling (high quality)
  /// - Frame interpolation for smooth motion
  /// - Vulkan GPU backend (if available)
  static const VideoPerformanceConfiguration highQuality =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto-copy',
    decoderThreads: 4,
    frameDropping: 'no',
    videoSync: 'display-resample',
    scaler: 'lanczos',
    downScaler: 'lanczos',
    interpolation: true,
    temporalScaler: 'oversample',
    deinterlacing: 'auto',
    gpuBackend: 'vulkan',
  );

  /// Balanced configuration for most devices (recommended default).
  ///
  /// Good balance between quality and performance.
  /// Suitable for most playback scenarios.
  ///
  /// Features:
  /// - Hardware decoding (auto)
  /// - Auto decoder threads
  /// - Moderate frame dropping
  /// - Simple video sync
  /// - Bicubic scaling (better than bilinear)
  /// - Optimized for local files
  static const VideoPerformanceConfiguration balanced =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto',
    decoderThreads: null,
    frameDropping: 'decoder',
    videoSync: 'audio',
    scaler: 'bicubic',
    downScaler: 'bicubic',
    interpolation: false,
    deinterlacing: 'auto',
    optimizeForLocalFiles: true,
  );

  /// Fast seeking configuration for local file playback.
  ///
  /// Optimized specifically for quick seeking in local files.
  /// Maximizes cache and disables network-related buffering.
  ///
  /// Features:
  /// - Hardware decoding
  /// - Large back buffer (20MB)
  /// - No network readahead
  /// - Disk caching enabled
  /// - 60 second cache ahead
  ///
  /// Best for:
  /// - Local video files
  /// - Frequently seeking
  /// - Scrubbing through videos
  static const VideoPerformanceConfiguration fastSeeking =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto',
    decoderThreads: null,
    frameDropping: 'decoder',
    videoSync: 'audio',
    scaler: 'bicubic',
    downScaler: 'bicubic',
    interpolation: false,
    deinterlacing: 'auto',
    optimizeForLocalFiles: true,
    demuxerMaxBytes: '64M',
    demuxerMaxBackBytes: '64M',
    profile: 'fast',
    cache: 'yes',
    cacheSecs: 30,
    cacheBack: '200M',
    hrSeek: 'yes',
  );

  /// Software decoding configuration for debugging or compatibility.
  ///
  /// Forces software decoding regardless of hardware capabilities.
  /// Useful for:
  /// - Debugging video issues
  /// - Testing codec compatibility
  /// - Working around hardware decoder bugs
  ///
  /// Features:
  /// - Software decoding (no hardware)
  /// - More decoder threads (needed for SW)
  /// - Standard frame dropping
  /// - Simple video sync
  static const VideoPerformanceConfiguration softwareDecoding =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'no',
    decoderThreads: 4,
    frameDropping: 'decoder',
    videoSync: 'audio',
    scaler: 'bilinear',
    downScaler: 'bilinear',
    interpolation: false,
    deinterlacing: 'auto',
  );

  /// Smooth motion configuration for 24fps content (movies, anime).
  ///
  /// Interpolates frames to match display refresh rate.
  /// Creates smoother motion but increases CPU/GPU usage.
  ///
  /// Best for:
  /// - 24fps movies and TV shows
  /// - Anime content
  /// - High refresh rate displays (60Hz, 120Hz, 144Hz)
  ///
  /// Features:
  /// - Hardware decoding
  /// - Display-resample sync
  /// - Frame interpolation enabled
  /// - Oversample temporal scaling
  static const VideoPerformanceConfiguration smoothMotion =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto',
    decoderThreads: null,
    frameDropping: 'decoder',
    videoSync: 'display-resample',
    scaler: 'bicubic',
    downScaler: 'bicubic',
    interpolation: true,
    temporalScaler: 'oversample',
    deinterlacing: 'auto',
  );

  /// Streaming optimization for network playback.
  ///
  /// Optimized for streaming content over network.
  /// Prioritizes smooth playback and buffer management.
  ///
  /// Features:
  /// - Hardware decoding
  /// - Aggressive frame dropping
  /// - Simple sync and scaling
  /// - Optimized for streaming (not local files)
  ///
  /// Note: Use with larger buffer size in PlayerConfiguration:
  /// ```dart
  /// PlayerConfiguration(
  ///   bufferSize: 128 * 1024 * 1024, // 128MB for streaming
  ///   videoPerformance: VideoPerformancePresets.streaming,
  /// )
  /// ```
  static const VideoPerformanceConfiguration streaming =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto',
    decoderThreads: null,
    frameDropping: 'decoder+vo',
    videoSync: 'audio',
    scaler: 'bilinear',
    downScaler: 'bilinear',
    interpolation: false,
    deinterlacing: 'auto',
    optimizeForLocalFiles: false, // Streaming mode
  );

  /// Quality-first configuration for local high-bitrate content.
  ///
  /// Optimized for local files with high bitrates.
  /// Prioritizes quality over smoothness.
  ///
  /// Features:
  /// - Hardware decoding with surface upload
  /// - No frame dropping
  /// - High-quality scaling
  /// - Better sync method
  static const VideoPerformanceConfiguration qualityFirst =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto-copy',
    decoderThreads: 4,
    frameDropping: 'no',
    videoSync: 'display-resample',
    scaler: 'lanczos',
    downScaler: 'lanczos',
    interpolation: false,
    deinterlacing: 'auto',
  );

  /// Animation/anime optimization.
  ///
  /// Optimized for animated content with sharp edges and details.
  /// Uses scaling algorithms that preserve sharp lines.
  ///
  /// Features:
  /// - Hardware decoding
  /// - Spline36 scaling (preserves sharp edges)
  /// - Optional interpolation for smoothness
  static const VideoPerformanceConfiguration animation =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto',
    decoderThreads: null,
    frameDropping: 'decoder',
    videoSync: 'audio',
    scaler: 'spline36',
    downScaler: 'spline36',
    interpolation: false,
    deinterlacing: 'auto',
  );

  /// {@macro video_performance_presets}
  const VideoPerformancePresets();
}
