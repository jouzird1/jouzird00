Write-Host "=== WINDOWS LAB ===" -ForegroundColor Cyan
Write-Host "Computer: $env:COMPUTERNAME"
Write-Host "User: $env:USERNAME"
Write-Host "OS:"
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, OSArchitecture | Format-List
Write-Host "CPU:"
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors | Format-List
Write-Host "RAM:"
$ramGB = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB
Write-Host ("{0:N2} GB" -f $ramGB)
Write-Host "Disk C:"
Get-PSDrive C | Select-Object Name, @{N='UsedGB';E={[math]::Round($_.Used/1GB,2)}}, @{N='FreeGB';E={[math]::Round($_.Free/1GB,2)}} | Format-List
