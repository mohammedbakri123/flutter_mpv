#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_mpv_libs_macos_audio.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  system("make")

  s.name             = 'flutter_mpv_libs_macos_audio'
  s.version          = '1.0.4'
  s.summary          = 'macOS dependency package for package:flutter_mpv'
  s.description      = <<-DESC
  macOS dependency package for package:flutter_mpv.
                       DESC
  s.homepage         = 'https://github.com/media-kit/media-kit.git'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Hitesh Kumar Saini' => 'saini123hitesh@gmail.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.vendored_frameworks = 'Frameworks/*.xcframework'

  s.platform = :osx, '10.9'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
