#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

if WinActive("ahk_exe Revu.exe") {
    StringTrimRight, StartPath, A_ScriptDir, 17
    TemplatePath = %StartPath%\Templates\%1%
    Send, ^+i
    Send, {Enter}
    Sleep, 400
    Send, %TemplatePath%
    Send, {Enter}
    Sleep, 400

    ControlClick, x142 y591, A
    Sleep, 400
    Send, {Down}
    Sleep, 10
    Send, {Enter}
    Sleep, 400
    ControlClick, x66 y623, A
    Sleep, 400
    ControlClick, x531 y770, A

    
} else {
    MsgBox, 1, Insert Cover, Bluebeam isn't active.  , 3
    ExitApp, 1
}
ExitApp, 0