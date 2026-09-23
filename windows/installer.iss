
[Setup]
AppName=HomeCare
AppVersion=1.0.0
DefaultDirName={autopf}\HomeCare
OutputBaseFilename=HomeCare-Setup-1.0.0
Compression=lzma
SolidCompression=yes
[Files]
Source: "build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs
[Icons]
Name: "{autoprograms}\HomeCare"; Filename: "{app}\home_maintenance_app.exe"
Name: "{autodesktop}\HomeCare"; Filename: "{app}\home_maintenance_app.exe"
