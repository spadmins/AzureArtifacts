# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install GCViewer
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/gcviewer-1.35-SNAPSHOT.jar", "C:\temp\gcviewer-1.35-SNAPSHOT.jar")
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/gcviewer-1.35-SNAPSHOT.jar" -OutFile "c:\temp\gcviewer-1.35-SNAPSHOT.jar"

# Create a Shortcut for GCViewer with Windows PowerShell
$TargetFile = "c:\temp\gcviewer-1.35-SNAPSHOT.jar"
$ShortcutFile = "$env:Public\Desktop\GC Viewer.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()