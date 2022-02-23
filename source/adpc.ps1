# Installing Screenconnect Client
Invoke-WebRequest -Uri "https://screenconnect.aidepc.ca:4443/Bin/One-Sky.ClientSetup.exe?h=screenconnect.aidepc.ca&p=8041&k=BgIAAACkAABSU0ExAAgAAAEAAQDVaolrsK5KPjWzlyXPqf2Tgu54EBdrxl5sr55VJawQru7JFBNcp1ZwyDia2xnaBRsUimo%2BQ3O78dLnqa94ADRnD1hUr%2FBkUaKUd9%2ByU0ZwIqnS8je%2Br7YEia9MdWrPyukD3wM5zy7D67%2BTH8a%2Bi%2BUyVtR2DQaWGGoIg9bnlR6r2gvGUElchkHx7VCKgjnys8CvTmmrfrcYOTFxGtnfmIb11x800zxWeotLMcpH9Mpo5l17GbqVAjyovs%2FusQyvYyTYyXjleFeIymOooos%2B8q4VYe2XyVs%2F9xWUA48dQAn1LqZ5C%2BNGX%2BT4vC3CNSw7BUGw%2FHHrudTMSiMZzySFK%2Fa5&e=Access&y=Guest&t=&c=Inventaire%20OneSky&c=&c=&c=&c=&c=&c=&c=" -OutFile "$Env:TEMP\One-SkySetup.exe"
Start-Process $env:TEMP\One-SkySetup.exe -Verb Runas -Wait
Remove-Item $env:TEMP\One-SkySetup.exe 
Write-Host "Permanent Support Client installed successfully"

