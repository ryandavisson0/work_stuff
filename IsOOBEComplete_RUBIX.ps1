$process = Get-Process -Name SecurityHealthSysTray -ErrorAction SilentlyContinue

if($null -ne $process)
{
  Write-Output "not-OOBE"
  exit 0
}
else
{
  Write-Output "OOBE"
  exit 0
}