# Written by David Speight 2017-08-28.
# This script gets the Windows APPLICATION and SYSTEM logs for the previous day.
# The logs are written to a CSV file for EACH server in the list stored in the text file.
$basePath = "D:\PSScripts\WindowsLogExport\"
$log = $basePath + "JobLog\windows-log-export.log"
$serverList = $basePath + "JobLog\LogServers.txt"
Function LogWrite
{
    Param ([string]$logstring)
    Add-Content $log -value $logstring
}

$Start = ([datetime]::Today).AddDays(-1)
$End = Get-Date -Hour 0 -Minute 00 -Second 00
LogWrite("$(Get-Date -f 'yyyy-MM-dd hh:mm:ss') - START windows log script.")

foreach ($server in Get-Content $serverList) { 
    Write-Output $Server

    $FileName = $basePath + "Exports\WinAppLog_" + $Server + "_" + (($Start).toString('yyyyMMdd')) + ".csv"
    Get-WinEvent application -ComputerName $Server | ?{($_.Level -eq 2 -or $_.Level -eq 3) -and ($_.TimeCreated -gt $Start) -and ($_.TimeCreated -lt $End)} | Export-Csv $FileName

    LogWrite("$(Get-Date -f 'yyyy-MM-dd hh:mm:ss') - Windows Application Log Exported for " + $Server)

    $FileName = $basePath + "Exports\WinSysLog_" + $Server + "_" + (($Start).toString('yyyyMMdd')) + ".csv"
    Get-WinEvent system -ComputerName $Server | ?{($_.Level -eq 2 -or $_.Level -eq 3) -and ($_.TimeCreated -gt $Start) -and ($_.TimeCreated -lt $End)} | Export-Csv $FileName

    LogWrite("$(Get-Date -f 'yyyy-MM-dd hh:mm:ss') - Windows System Log Exported for " + $Server)

}

LogWrite("$(Get-Date -f 'yyyy-MM-dd hh:mm:ss') - END windows log script.")