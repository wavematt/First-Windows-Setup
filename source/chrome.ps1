Write-Host "Checking Google Chrome Installation"
$directoryInfo = Get-ChildItem "C:\Program Files\Google\Chrome\Application\" | Measure-Object
$directoryInfo.count | Out-Null #Returns the count of all of the objects in the directory
if ( $directoryInfo -ne 0 ) {
    Write-Host "Google Chrome is already Installed"
} else {
# Installing Chrome
    Write-Host "Downloading Google Chrome"
    Invoke-WebRequest -Uri "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile "$Env:TEMP\chrome_installer.exe"
    Write-Host "Installing Google Chrome"
    Start-Process "$Env:TEMP\chrome_installer.exe" -ArgumentList "/silent /install" -Verb RunAs -Wait
    Write-Host "Google Chrome installed successfully"
}