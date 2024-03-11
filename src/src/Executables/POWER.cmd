@echo off
setlocal EnableDelayedExpansion

:: Detect if user uses laptop device or personal computer
for /f "delims=:{}" %%a in ('wmic path Win32_SystemEnclosure get ChassisTypes ^| findstr [0-9]') do set "CHASSIS=%%a"
for %%a in (8 9 10 11 12 13 14 18 21 30 31 32) do if "!CHASSIS!" == "%%a" (set "DEVICE_TYPE=LAPTOP") else (set "DEVICE_TYPE=PC")

:: Disable Hibernation and Fast Startup
:: Disabling makes NTFS accessable outside of Windows
powercfg -h off

:: Disable SleepStudy (UserNotPresentSession.etl)
wevtutil set-log "Microsoft-Windows-SleepStudy/Diagnostic" /e:false
wevtutil set-log "Microsoft-Windows-Kernel-Processor-Power/Diagnostic" /e:false
wevtutil set-log "Microsoft-Windows-UserModePowerService/Diagnostic" /e:false

:: Duplicate Ultimate Performance power scheme, customize it and make it the RefinedOS power scheme
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 11111111-1111-1111-1111-111111111111
powercfg -setactive 11111111-1111-1111-1111-111111111111
:: Set current power scheme to RefinedOS
powercfg -changename scheme_current "RefinedOS Power Scheme" "Power scheme optimized for optimal latency and performance."


:: Prevents parking of multi-threads (do not confuse it with cores parking)
:: Prefers to use Performance-cores for foreground applications and heavy load situations
:: Credit: Revision Team
PowerShell -NoP -C "$cpu = Get-CimInstance Win32_Processor; $cpuName = $cpu.Name; $cpuGen = [int]($cpuName.Substring(0, 2)); if ($cpuGen -gt 11) { powercfg -setacvalueindex scheme_current sub_processor HETEROPOLICY 0; powercfg -setacvalueindex scheme_current sub_processor SCHEDPOLICY 2; }"

:: Set the active scheme as the current scheme
powercfg -setactive scheme_current
    rem Disable driver power saving
    PowerShell -NoP -C "$usb_devices = @('Win32_USBController', 'Win32_USBControllerDevice', 'Win32_USBHub'); $power_device_enable = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi; foreach ($power_device in $power_device_enable){$instance_name = $power_device.InstanceName.ToUpper(); foreach ($device in $usb_devices){foreach ($hub in Get-WmiObject $device){$pnp_id = $hub.PNPDeviceID; if ($instance_name -like \"*$pnp_id*\"){$power_device.enable = $False; $power_device.psbase.put()}}}}"

    for %%a in (
        "AllowIdleIrpInD3"
        "D3ColdSupported"
        "DeviceSelectiveSuspended"
        "EnableIdlePowerManagement"
        "EnableSelectiveSuspend"
        "EnhancedPowerManagementEnabled"
        "IdleInWorkingState"
        "SelectiveSuspendEnabled"
        "SelectiveSuspendOn"
        "WaitWakeEnabled"
        "WakeEnabled"
        "WdfDirectedPowerTransitionEnable"
    ) do (
        for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "%%~a" ^| findstr "HKEY"') do (
            reg add "%%b" /v "%%~a" /t REG_DWORD /d "0" /f
        )
    )

    rem Disable D3 support on SATA/NVMEs while using Modern Standby
    rem https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/power-management-for-storage-hardware-devices-intro#d3-support
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Storage" /v "StorageD3InModernStandby" /t REG_DWORD /d "0" /f

    rem Disable IdlePowerMode for stornvme.sys (storage devices) - the device will never enter a low-power state
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v "IdlePowerMode" /t REG_DWORD /d "0" /f

    rem Disable power throttling
    rem https://blogs.windows.com/windows-insider/2017/04/18/introducing-power-throttling
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /
    