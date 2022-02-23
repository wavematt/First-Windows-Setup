Invoke-WebRequest -Uri "https://download.lenovo.com/pccbbs/thinkvantage_en/system_update_5.07.0097.exe" -OutFile "$Env:TEMP\sysupd.exe"
Write-Host "Installing Lenovo System Update"
Start-Process "$Env:TEMP\sysupd.exe" -Verb RunAs -Args "/verysilent /norestart" -Wait
Write-Host "OK"
Write-Host "Checking for System Updates"
Start-Process "C:\Program Files (x86)\Lenovo\System Update\Tvsu.exe" -Args "/CM -search R  -action INSTALL -includerebootpackages 1,3,4 -noicon -noreboot -nolicense -schtask" -Wait
Write-Host "OK"