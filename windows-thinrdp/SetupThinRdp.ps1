# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install ThinRDP
(New-Object System.Net.WebClient).DownloadFile("https://thinrdpx.blob.core.windows.net/extension/Thinfinity_Remote_Desktop_Workstation_Setup_x64.exe", "C:\temp\thinrdp.exe")
#Invoke-WebRequest "https://thinrdpx.blob.core.windows.net/extension/Thinfinity_Remote_Desktop_Workstation_Setup_x64.exe" -OutFile "c:\temp\thinrdp.exe"
Start-Process "C:\temp\thinrdp.exe" -ArgumentList "/S /v""/qn""" -Wait