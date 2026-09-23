@echo off
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
dart run msix:create
flutter build windows --release
echo Build done: build\windows\x64\runner\Release\
