# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/apache-jmeter-3.0.zip", "C:\temp\apache-jmeter-3.0.zip")
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/apache-jmeter-3.0.zip" -OutFile "C:\temp\apache-jmeter-3.0.zip"

# Extract Eclipse files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\apache-jmeter-3.0.zip")
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\").Copyhere($item)
}

# Create a Shortcut with Windows PowerShell
$TargetFile = "C:\apache-jmeter-3.0\bin\jmeter.bat"
$ShortcutFile = "$env:Public\Desktop\Jmeter.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()