#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe Obsidian.exe
    ^1::

    StartSelection := GetSelectedText()
    InputBox, ReferenceStr , Insert Reference, Please type the reference you would like to include in BOOK_NAME CHAPTER:VERSE_RANGE format. `rEXAMPLE: Genesis 1:1-5 , , , , , , , 120, %StartSelection%
    if ErrorLevel {
        MsgBox, ReferenceStr Cancelled
    } else {
        ; MsgBox, OK    

        SplitReference := StrSplit(ReferenceStr, ":")
        ; msgbox, % SplitReference[1]
        ; msgbox, % SplitReference[2]

        VerseRange := StrSplit(SplitReference[2], "-")

        VerseRangeStart := Format("{:d}", VerseRange[1])
        VerseRangeLast := Format("{:d}", VerseRange[2])

        OutputLoop := ""

        Loop
        {
            if (A_Index >= VerseRangeStart) {
                OutputLoop := OutputLoop . "![[" . SplitReference[1] . "#" . A_Index "]]" 
                ; msgbox, %OutputLoop%
            }
        } Until A_Index = VerseRangeLast

        ReturnText := "> __[[" . SplitReference[1] . "|" . StartSelection . "]]__`r> " . OutputLoop
        ; msgbox, %ReturnText%
        Clipboard = %ReturnText%
        Send, ^v
    }
    return
#If


GetSelectedText() {
    tmp = %ClipboardAll% ; save clipboard
    Clipboard := "" ; clear clipboard
    Send, ^c ; simulate Ctrl+C (=selection in clipboard)
    ClipWait, 0, 1 ; wait until clipboard contains data
    selection = %Clipboard% ; save the content of the clipboard
    Clipboard = %tmp% ; restore old content of the clipboard
    return selection
}