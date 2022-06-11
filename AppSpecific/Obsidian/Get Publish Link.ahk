#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;DEP because there is an Obsidian addin to do this.
#IfWinActive ahk_exe Obsidian.exe
    ^3::
        OutputLink :="https://notes.camronwalker.com/General/"
        StartSelection := GetSelectedText()
        StartSelection := StrReplace(StartSelection, " ", "+")

        OutputLink := OutputLink . StartSelection
        Clipboard = %OutputLink%
    return
#If


; Example Link
; https://notes.camronwalker.com/General/Joseph+Smith+on+Religious+Freedom+and+Love+of+Liberty
