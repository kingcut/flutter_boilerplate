#!/bin/bash

# This command is used to create new app from Flutter template
# cd ~ && flutter create --org="net.webike" --project-name="app01" --description="Webikeのお客様がバイクショップでWebikeポイントがご使用でき、さらにポイントを貯めることができます。" --template="app" --pub --platforms=android --platforms=ios --overwrite --ios-language="swift" --android-language="kotlin" app01

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

# Remove all pub caches
if [ "$1" == "clean" ]; then
  if [ "$windows" != "1" ]; then
      rm -Rf ~/.pub-cache/

      if [ "$mac" == "1" ]; then
          rm -Rf ~/Library/Developer/Xcode/DerivedData/*
          rm -Rf ~/.cocoapods/
      fi
  else
      rm -Rf ~/AppData/Local/Pub
      rm -Rf ~/AppData/Roaming/Pub
  fi
fi

# Remove all logs and temp files
rm -Rf .dart_tool/
rm -Rf .flutter-plugins
rm -Rf .flutter-plugins-dependencies
rm -Rf *.iml
rm -Rf *.lock
rm -Rf *.log
rm -Rf android/.gradle/
rm -Rf android/.idea/
rm -Rf build/

if [ "$mac" == "1" ]; then
    rm -Rf ios/.symlinks/
    rm -Rf ios/Flutter/Flutter.framework
    rm -Rf ios/Flutter/Flutter.podspec
    rm -Rf ios/Pods/
    rm -Rf ios/Runner.xcworkspace
    rm -Rf ios/Podfile.lock
fi

flutter channel stable
flutter upgrade --force

# Get pub packages
if [ ! -e .packages ]; then
    flutter pub get
else
    flutter clean
    flutter pub cache repair
    flutter pub upgrade
fi

# Install ios packages (only works on mac)
if [ "$mac" == "1" ]; then
    cd ios
    pod deintegrate
    pod install --clean-install --repo-update
    cd ..
else
    git checkout -- ios/*
fi

# Get packages for sub modules
get_modules() {
    local root=$(pwd)
    local path="$1"

    echo "Get modules for $path"
    find $path -name "GeneratedPluginRegistrant.java" -delete

    cd $path
    flutter packages get
    cd $root
}
for folder in ./modules/*; do
    if [ -d "$folder" ]; then get_modules "$folder"; fi
done

# # Get the flutter packages
flutter config --no-analytics
flutter doctor --android-licenses
flutter packages get

# Run flutter doctor
clear ; flutter doctor -v
