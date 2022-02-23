Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PSWindowsUpdate -Force 
Install-WindowsUpdate -AcceptAll -IgnoreReboot
Write-Host "Windows Updates Installed successfully"