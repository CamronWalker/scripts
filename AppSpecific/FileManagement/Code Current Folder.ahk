#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

if WinActive("ahk_exe Explorer.EXE") {
    Send, !d
    Sleep, 450
    Send, cmd
    Send, {Enter}
    Sleep, 1000
    Send, code . && exit
    Send, {Enter}
} else {
    MsgBox, 1, VS Code, Windows Explorer isn't active.  , 3
    ExitApp, 1
}
ExitApp, 0