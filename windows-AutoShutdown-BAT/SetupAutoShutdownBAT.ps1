# Download AutoShutdownScheduler BAT File
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/AutoShutdownScheduler.bat", "c:\temp\AutoShutdownScheduler.bat")

# Add Registry Entry
$RegPath = “HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run”
$RegName = "AutoShutdownImportBAT"
$BATPath = "C:\temp\AutoShutdownScheduler.bat"
New-ItemProperty -Path $RegPath -Name $RegName -Value $BATPath -Force | Out-Null