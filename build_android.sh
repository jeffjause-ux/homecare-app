#!/bin/bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter build apk --release
flutter build appbundle --release
 echo APK: build/app/outputs/flutter-apk/app-release.apk
 echo AAB: build/app/outputs/bundle/release/app-release.aab
