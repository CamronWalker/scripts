#Requires -Version 3.0
Write-Output "I'm version 3.0 or above"

$userObj = Get-Content -Path "$PSScriptRoot\user.txt"

New-PSDrive –Name “W” –PSProvider FileSystem –Root “\\Walker-Drive\users” –Persist