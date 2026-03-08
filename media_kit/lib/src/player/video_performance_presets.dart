/// This file is a part of flutter_mpv (https://github.com/media-kit/media-kit).
///
/// Copyright © 2021 & onwards, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.

import 'package:flutter_mpv/src/player/platform_player.dart';

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
/// - Maximum performance for slowest devices
/// - Reference quality for critical viewing
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
  /// - Fast decoding enabled
  /// - Aggressive HR seek with framedrop
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
    fastDecoding: 'yes',
    softwareDecodingDirectRendering: 'yes',
    openglPbo: 'yes',
    hrSeekFramedrop: 'yes',
    fastSeek: 'yes',
    cacheSecs: 30,
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
  /// - PBO enabled for faster texture uploads
  /// - Large cache for high bitrate content
  static const VideoPerformanceConfiguration highQuality =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto-copy',
    decoderThreads: 6,
    frameDropping: 'no',
    videoSync: 'display-resample',
    scaler: 'lanczos',
    downScaler: 'lanczos',
    interpolation: true,
    temporalScaler: 'oversample',
    deinterlacing: 'auto',
    gpuBackend: 'vulkan',
    gpuApi: 'vulkan',
    openglPbo: 'yes',
    hrSeek: 'yes',
    hrSeekFramedrop: 'no',
    fastSeek: 'no',
    cacheSecs: 120,
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
  /// - PBO enabled
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
    openglPbo: 'yes',
    cacheSecs: 60,
  );

  /// Ultra-fast seeking configuration for local file playback.
  ///
  /// Optimized specifically for quick seeking in local files.
  /// Maximizes cache and disables network-related buffering.
  ///
  /// Features:
  /// - Hardware decoding
  /// - Aggressive frame dropping during seek
  /// - Fast seek to keyframes
  /// - Large back buffer for quick backward seeks
  /// - Minimal cache for responsiveness
  /// - HR seek with framedrop enabled
  ///
  /// Best for:
  /// - Local video files
  /// - Frequently seeking
  /// - Scrubbing through videos
  /// - Video editing preview
  static const VideoPerformanceConfiguration fastSeeking =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto',
    decoderThreads: 4,
    frameDropping: 'decoder+vo',
    videoSync: 'audio',
    scaler: 'bicubic',
    downScaler: 'bicubic',
    interpolation: false,
    deinterlacing: 'auto',
    optimizeForLocalFiles: true,
    demuxerMaxBytes: '32M',
    demuxerMaxBackBytes: '128M',
    profile: 'fast',
    cache: 'yes',
    cacheSecs: 20,
    cacheBack: '128M',
    hrSeek: 'yes',
    hrSeekFramedrop: 'yes',
    fastSeek: 'yes',
    openglPbo: 'yes',
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
  /// - Direct rendering enabled
  /// - Fast decoding for speed
  /// - Simple bilinear scaling
  static const VideoPerformanceConfiguration softwareDecoding =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'no',
    decoderThreads: 6,
    frameDropping: 'decoder',
    videoSync: 'audio',
    scaler: 'bilinear',
    downScaler: 'bilinear',
    interpolation: false,
    deinterlacing: 'auto',
    softwareDecodingDirectRendering: 'yes',
    fastDecoding: 'yes',
    openglPbo: 'yes',
    cacheSecs: 60,
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
  /// - No frame dropping for smooth motion
  /// - Vulkan backend
  static const VideoPerformanceConfiguration smoothMotion =
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
    openglPbo: 'yes',
    cacheSecs: 90,
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
  /// - Large cache for network buffering
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
    demuxerMaxBytes: '256M',
    cache: 'yes',
    cacheSecs: 120,
    cacheBack: '64M',
    hrSeekFramedrop: 'yes',
    fastSeek: 'yes',
  );

  /// Quality-first configuration for local high-bitrate content.
  ///
  /// Optimized for local files with high bitrates.
  /// Prioritizes quality over smoothness.
  ///
  /// Features:
  /// - Hardware decoding with surface upload
  /// - No frame dropping
  /// - High-quality lanczos scaling
  /// - Display-resample sync
  /// - Large cache for high bitrate
  /// - PBO enabled
  /// - Vulkan backend
  static const VideoPerformanceConfiguration qualityFirst =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto-copy',
    decoderThreads: 6,
    frameDropping: 'no',
    videoSync: 'display-resample',
    scaler: 'lanczos',
    downScaler: 'lanczos',
    interpolation: false,
    deinterlacing: 'auto',
    gpuBackend: 'vulkan',
    gpuApi: 'vulkan',
    openglPbo: 'yes',
    hrSeek: 'yes',
    hrSeekFramedrop: 'no',
    fastSeek: 'no',
    cacheSecs: 150,
  );

  /// Animation/anime optimization.
  ///
  /// Optimized for animated content with sharp edges and details.
  /// Uses scaling algorithms that preserve sharp lines.
  ///
  /// Features:
  /// - Hardware decoding
  /// - Spline36 scaling (preserves sharp edges)
  /// - No interpolation (preserves original frames)
  /// - No frame dropping
  /// - PBO enabled
  static const VideoPerformanceConfiguration animation =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto',
    decoderThreads: 4,
    frameDropping: 'no',
    videoSync: 'audio',
    scaler: 'spline36',
    downScaler: 'spline36',
    interpolation: false,
    deinterlacing: 'auto',
    openglPbo: 'yes',
    cacheSecs: 60,
  );

  /// Maximum performance preset for fastest playback.
  ///
  /// Sacrifices all quality for maximum speed and responsiveness.
  /// Use only when absolutely necessary.
  ///
  /// Features:
  /// - Hardware decoding
  /// - Maximum frame dropping
  /// - Fastest bilinear scaling
  /// - Fast decoding enabled
  /// - Minimal cache
  /// - Aggressive HR seek with framedrop
  /// - Video latency hacks enabled
  static const VideoPerformanceConfiguration maximumPerformance =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto',
    decoderThreads: 2,
    frameDropping: 'decoder+vo',
    videoSync: 'audio',
    scaler: 'bilinear',
    downScaler: 'bilinear',
    interpolation: false,
    deinterlacing: 'no',
    fastDecoding: 'yes',
    softwareDecodingDirectRendering: 'yes',
    openglPbo: 'yes',
    videoLatencyHacks: 'yes',
    hrSeek: 'yes',
    hrSeekFramedrop: 'yes',
    fastSeek: 'yes',
    cacheSecs: 10,
    profile: 'fast',
  );

  /// Reference quality preset for critical viewing.
  ///
  /// Maximum quality settings for critical viewing and analysis.
  /// Requires high-end hardware.
  ///
  /// Features:
  /// - Hardware decoding with copy
  /// - No frame dropping whatsoever
  /// - Highest quality lanczos scaling
  /// - Display-resample sync
  /// - Frame interpolation
  /// - Vulkan backend
  /// - Maximum cache
  /// - Large demuxer buffers
  static const VideoPerformanceConfiguration referenceQuality =
      VideoPerformanceConfiguration(
    hardwareDecoding: 'auto-copy',
    decoderThreads: 8,
    frameDropping: 'no',
    videoSync: 'display-resample',
    scaler: 'lanczos',
    downScaler: 'lanczos',
    interpolation: true,
    temporalScaler: 'oversample',
    deinterlacing: 'yes',
    gpuBackend: 'vulkan',
    gpuApi: 'vulkan',
    openglPbo: 'yes',
    videoLatencyHacks: 'no',
    hrSeek: 'yes',
    hrSeekFramedrop: 'no',
    fastSeek: 'no',
    cacheSecs: 300,
    demuxerMaxBytes: '512M',
    demuxerMaxBackBytes: '256M',
  );

  /// {@macro video_performance_presets}
  const VideoPerformancePresets();
}
