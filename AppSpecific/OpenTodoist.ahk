#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;msgbox, %1%

sleep, 500
WinActivate, %1%

sleep, 50
send, {LAlt}
sleep, 50
send, h
sleep, 50
send, y
sleep, 50
send, 3