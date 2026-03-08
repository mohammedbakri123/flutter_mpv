# flutter_mpv Examples

This directory contains complete working examples demonstrating how to use `flutter_mpv` in real-world applications.

## Available Examples

### 1. advanced_player_example ⭐⭐⭐⭐⭐

A full-featured video player showcasing advanced configuration options.

**Features:**
- 🎯 **3 Player Modes**: Basic, Presets, and Advanced
- 🎨 **12 Performance Presets**: From "Low-End Device" to "Reference Quality"
- ⚙️ **Advanced Settings**: Fine-tune 20+ video parameters
- 💾 **Settings Persistence**: Saves preferences via SharedPreferences
- 📱 **Material Design**: Beautiful, responsive UI
- 🔧 **Real-time Preview**: Apply settings and see results immediately

**Screens:**
| Screen | Description | Best For |
|--------|-------------|----------|
| Basic Player | Simple file picker + player | Quick testing |
| Performance Presets | 12 pre-configured presets | Learning optimal settings |
| Advanced Settings | 20+ individual controls | Fine-tuning |

**Presets Included:**
- Default, Low-End Device, High Quality, Balanced
- Fast Seeking, Software Decoding, Smooth Motion, Streaming
- Quality First, Animation, Max Performance, Reference Quality

**Getting Started:**
```bash
cd examples/advanced_player_example

# Get dependencies
flutter pub get

# Run on your device
flutter run

# Build release APK (Android)
flutter build apk --release

# Build for Linux
flutter build linux --release
```

**Project Structure:**
```
lib/
├── main.dart                      # App entry point
├── screens/
│   ├── basic_player_screen.dart   # Simple player
│   ├── presets_player_screen.dart # Preset selector
│   └── advanced_player_screen.dart # Full settings panel
└── settings.dart                  # SharedPreferences wrapper
```

**Best for:**
- Learning advanced video configuration
- Understanding performance tuning
- Building production video players
- Testing different device capabilities

---

### 2. flutter_mpv_test ⭐⭐

Minimal test cases for each feature (located in `../flutter_mpv_test`).

**Features:**
- Single player, single video
- Single player, multiple videos
- Multiple players, multiple videos
- Tabs test
- Stress test
- Screenshot functionality
- Video controller set size
- Programmatic fullscreen
- Video view parameters

**Best for:**
- Quick feature testing
- Debugging specific issues
- Understanding basic API usage
- Running stress tests

---

## Which Example Should You Use?

| Your Goal | Recommended Example |
|-----------|---------------------|
| Build a production player | `advanced_player_example` |
| Learn performance tuning | `advanced_player_example` |
| Test a specific feature | `flutter_mpv_test` |
| Quick API reference | `flutter_mpv_test` |
| Understand presets | `advanced_player_example` |
| Debug an issue | `flutter_mpv_test` |

---

## Quick Start Guide

### For Development (within this repository)

```bash
# Navigate to example
cd examples/advanced_player_example

# Install dependencies (uses local packages via pubspec_overrides.yaml)
flutter pub get

# Run the example
flutter run
```

### For Your Own Project

1. **Copy the example:**
```bash
cp -r examples/advanced_player_example /path/to/your/project/my_player_app
```

2. **Remove the override file:**
```bash
rm my_player_app/pubspec_overrides.yaml
```

3. **Update pubspec.yaml dependencies:**
```yaml
dependencies:
  flutter_mpv: ^1.2.6
  flutter_mpv_video: ^2.0.1
  media_kit_libs_video: ^1.0.7
  file_picker: ^8.0.0
  shared_preferences: ^2.5.4
```

4. **Install and run:**
```bash
cd my_player_app
flutter pub get
flutter run
```

---

## Additional Resources

- [Main Documentation](../README.md)
- [API Reference](../media_kit/README.md)
- [Video Performance Configuration](../README.md#video-performance-configuration)
- [Troubleshooting Guide](../README.md#troubleshooting)

---

## Contributing

Found an issue or want to add more examples? Please:
1. Open an issue on GitHub
2. Submit a pull request
3. Share your use case

---

## License

These examples are part of the flutter_mpv project and are licensed under the MIT License.
