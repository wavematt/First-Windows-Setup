#Checking if 7-Zip is already installed, 
#counting the number of files in the specified folder

Write-Host "Checking 7-Zip Installation"
$directoryInfo = Get-ChildItem "C:\Program Files\7-Zip\" | Measure-Object
$directoryInfo.count | Out-Null #Returns the count of all of the objects in the directory
if ( $directoryInfo -ne 0 ) {
    Write-Host "7-Zip is already Installed"
} else {
    Write-Host "Downloading 7-Zip"
    Invoke-WebRequest -Uri "https://www.7-zip.org/a/7z1900.exe" -OutFile "$Env:TEMP\7z1900.exe"
    Write-Host "Installing 7-Zip"
    Start-Process "$Env:TEMP\7z1900.exe" -ArgumentList "/S" -Wait
    Write-Host "7-Zip installed successfully"
}

