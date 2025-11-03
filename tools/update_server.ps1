# tools/update_server.ps1
$Updater = "C:\Program Files\Eagle Dynamics\DCS World OpenBeta Server\bin\DCS_updater.exe"
& "$Updater" update
& "$Updater" repair
