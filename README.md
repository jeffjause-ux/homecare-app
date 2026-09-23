# HomeCare - Home Maintenance & Repair (Flutter - Windows + Android)

Offline-first single codebase that builds to:
- **Windows**: portable .exe + MSIX installer (via `msix` package or Inno Setup)
- **Android**: APK + AAB

## Quick Start
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run -d windows
flutter run -d android
```

## Build Artifacts

### Windows .exe
```bash
# Portable exe is at build/windows/x64/runner/Release/
flutter build windows --release

# MSIX installer (modern Windows installer):
dart run msix:create

# Optional: Inno Setup for classic .exe installer - see /windows/installer.iss
```

### Android APK / AAB
```bash
flutter build apk --release
flutter build appbundle --release
# Outputs: build/app/outputs/flutter-apk/app-release.apk
#         : build/app/outputs/bundle/release/app-release.aab
```

## Architecture
- Riverpod for state
- Drift (SQLite) for offline persistence
- Feature-first folders
- Recurrence engine in lib/services/recurrence.dart

## Data Model
Property -> Area -> Asset -> Task / RepairLog
Inventory, Contacts, Documents linked to Property.

See lib/data/schema.dart

## Permissions Android
- CAMERA, READ_MEDIA_IMAGES, POST_NOTIFICATIONS, SCHEDULE_EXACT_ALARM, USE_EXACT_ALARM

## Backup location
Windows: %AppData%\HomeCare\...
Android: app documents directory