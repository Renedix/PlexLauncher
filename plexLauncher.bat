@echo off
setlocal enableextensions enabledelayedexpansion
set /a "x = 0"
:while
for /f "delims=" %%# in  ('"wmic path Win32_VideoController  get CurrentHorizontalResolution,CurrentVerticalResolution /format:value"') do (
  set "%%#">nul
)
	if %CurrentHorizontalResolution% EQU 1920 (
		if %CurrentVerticalResolution% EQU 1080 (
			TIMEOUT 1
		        goto :launchplex
		)
	)
	TIMEOUT 2
	goto :while
endlocal

:launchplex
start "" "C:\Program Files (x86)\Plex Home Theater\Plex Home Theater.exe"