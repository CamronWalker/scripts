@echo off
MultiMonitorTool.exe /enable "\\.\DISPLAY1"
timeout 1

REM ControlMyMonitor.exe /LoadConfig "%mypath%RTS Config.cfg" "\\.\DISPLAY1\Monitor0"
ControlMyMonitor.exe /SetValue "\\.\DISPLAY1\Monitor0" 15 31
REM timeout 1
REM Change input to HDMI 1 for Xbox 
REM ControlMyMonitor.exe /SetValue "\\.\DISPLAY1\Monitor0" 60 15