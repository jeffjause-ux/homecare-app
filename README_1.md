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

## 🚀 Easiest Method: Auto-Build in Cloud (No Flutter Install Needed)

This repo includes a GitHub Actions workflow that builds the Windows .exe and Android APK/AAB for you in the cloud.

### How to use it:

1. **Create a GitHub repo** at https://github.com/new (name it `homecare-app`)

2. **Upload this code** to your repo:
   ```bash
   # Unzip this project, then in that folder:
   git init
   git add .
   git commit -m "Initial HomeCare app"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/homecare-app.git
   git push -u origin main
   ```
   Or just drag-and-drop the files in GitHub's web UI: "Add file" > "Upload files"

3. **Wait for build** (3-5 minutes):
   - Go to your repo on GitHub > Click **Actions** tab
   - You'll see "Build Windows .exe + Android APK/AAB" running
   - Wait until it turns green with checkmarks

4. **Download your apps**:
   - Click on the completed run
   - Scroll down to **Artifacts** section
   - Download:
     - `HomeCare-Windows-Portable` - Contains your .exe! Unzip and double-click `home_maintenance_app.exe`
     - `HomeCare-Android-APK` - `app-release.apk` for your phone (enable "Install from unknown sources")
     - `HomeCare-Android-AAB` - For Google Play Store submission
     - `HomeCare-MSIX-Installer` - Modern Windows installer

### To get automatic Releases:
Create a tag:
```bash
git tag v1.0.0
git push origin v1.0.0
```
This will create a full GitHub Release with all files attached as download links.

### No GitHub account?
You can use https://github.com/new without any local git - just click "uploading an existing file" and drag the unzipped folder in.
