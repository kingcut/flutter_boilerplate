#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo "Use path: $SCRIPTPATH/"
cd $SCRIPTPATH

case "$(uname -s)" in
    Linux*)  windows=0;mac=0;;
    Darwin*) windows=0;mac=1;;
    CYGWIN*) windows=1;mac=0;;
    MINGW*)  windows=1;mac=0;;
    *)       windows=0;mac=0
esac

if [ -e ./build ]; then
    rm -rf ./build
fi

flutter format modules lib test
flutter clean
flutter pub get
clear

# Analyze before build
flutter analyze --no-fatal-infos
if [ ! $? -eq 0 ]; then
    exit 1
fi

# Generate app icons & splash screen
# dart pub run flutter_launcher_icons:main -f flutter_icons.yml

# Exclude flutter icons
# dart pub global activate split_icon >/dev/null 2>&1
# split_icon >/dev/null 2>&1

# Debug latest version of the framework
flutter doctor --version > 'latest-build-version.txt'

if [ "$1" == "run" ]; then
  # Run on all devices
  flutter run -d all
else
  BUILD_ARG="--release --tree-shake-icons --split-debug-info=build/debug_info"

  # Android App Bundle
  # Support app bundles with 32-bit and 64-bit binaries
  # https://github.com/flutter/flutter/issues/3192＃
  # brew cask install java
  # brew install gradle
  flutter build appbundle --shrink $BUILD_ARG $@

  if [ "$mac" == "1" ]; then
      # Short pause
      sleep 3

      # iOS Build
      flutter build ios --obfuscate $BUILD_ARG $@
      if [ $? -eq 0 ]; then
          du -sh build/ios/iphoneos/Runner.app
          rm -Rf build/ios/iphoneos/Runner.app
      fi
  else
      git checkout -- ios/*
  fi
fi
