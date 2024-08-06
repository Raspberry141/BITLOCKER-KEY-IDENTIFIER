@echo off
setlocal

REM Get BitLocker Recovery Keys using PowerShell
powershell.exe -Command "& {Get-BitLockerVolume | Select-Object MountPoint,VolumeStatus,@{Name='RecoveryKey';Expression={($_.KeyProtector | Where-Object { $_.KeyProtectorType -eq 'RecoveryPassword' }).RecoveryPassword}} | Format-Table -AutoSize}"

endlocal
