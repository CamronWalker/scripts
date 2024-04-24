@echo off
SET mypath=%~dp0

REM Use this one to use the config file
REM ControlMyMonitor.exe /LoadConfig "%mypath%FPS Config.cfg" "\\.\DISPLAY1\Monitor0"
REM This one to just change the Game Mode to 30
ControlMyMonitor.exe /SetValue "\\.\DISPLAY1\Monitor0" 15 30
timeout 1

REM Change input to HDMI 1 for Xbox 
ControlMyMonitor.exe /SetValue "\\.\DISPLAY1\Monitor0" 60 17

timeout 1
MultiMonitorTool.exe /disable "\\.\DISPLAY1"