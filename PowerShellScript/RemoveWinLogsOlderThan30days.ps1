#
# RemoveWinLogsOlderThan30days.ps1
#
# UPDATE PATH to proper location
$DateTime = ((Get-Date).AddDays(-30))
$Path = "D:\PSscripts\WindowsLogExport\Archive\"

Get-ChildItem -Path $Path -Recurse -Force -File | Where-Object { $_.CreationTime -lt $DateTime } | 
ForEach-Object { Remove-Item -Path $_.FullName -Force }