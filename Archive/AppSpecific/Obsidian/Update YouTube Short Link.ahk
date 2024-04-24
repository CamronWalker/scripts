#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#IfWinActive ahk_exe Obsidian.exe
    ^1::
        StartSelection := GetSelectedText()
        StartSelection := StrReplace(StartSelection, "https://youtube.com/shorts/", "https://youtu.be/")
        StartSelection := StrReplace(StartSelection, "?feature=share", "")
        StartSelection := "[YouTube Link](" StartSelection ")"
        Send, %StartSelection%
    return
#If


; Example Link
; https://youtube.com/shorts/JWF1QZ4i3dE?feature=share
