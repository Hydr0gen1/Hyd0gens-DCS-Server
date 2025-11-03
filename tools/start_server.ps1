# tools/start_server.ps1
$ErrorActionPreference = "Stop"
$DCSBin = "C:\Program Files\Eagle Dynamics\DCS World OpenBeta Server\bin\DCS.exe"
$LogDir = "$PSScriptRoot\..\logs"
New-Item -ItemType Directory -Force -Path $LogDir | Out-Null
Start-Process -FilePath $DCSBin -ArgumentList "--server", "--norender", "--webgui", "--quiet" `
  -RedirectStandardOutput "$LogDir\stdout.log" `
  -RedirectStandardError "$LogDir\stderr.log"
