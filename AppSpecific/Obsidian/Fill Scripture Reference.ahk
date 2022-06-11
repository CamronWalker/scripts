#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe Obsidian.exe
    ^2::

    StartSelection := GetSelectedText()
    InputBox, ReferenceStr , Insert Reference, Please type the reference you would like to include in BOOK_NAME CHAPTER:VERSE_RANGE format. `rEXAMPLE: Genesis 1:1-5 , , , , , , , 120, %StartSelection%
    if ErrorLevel {
        OutputDebug, %ReferenceStr% Cancelled
    } else {
    ; MsgBox, OK
    
        SplitReference := StrSplit(ReferenceStr, ":")
        LastSpaceLocation := InStr(SplitReference[1], " " , False, 0)
        ; MsgBox, %LastSpaceLocation%

        
        ChapterNumber := SubStr(SplitReference[1], LastSpaceLocation + 1)
        ; MsgBox, %ChapterNumber%

        BookName := SubStr(SplitReference[1], 1, LastSpaceLocation - 1)
        BookNameNoSpaces := StrReplace(BookName, " " , "-")
        ;MsgBox, %BookName%
    
        if (BookName = "D&C") {
            BookNameNumber := ""
            BookNameAbv := "DaC"
            BookSectionNameAbv := ""
            DCTagSlash := ""
            DCSpace := ""

            } else {
                ; MsgBox, "Not D&C"
            
            ;This is because if it's not D&C then they need this slash and space
            DCTagSlash := "/"
            DCSpace := " "

                for each, line in StrSplit(FileOpen("C:\Users\camron\code\scripts\AppSpecific\Obsidian\Scripture Books.txt", "r").Read(), "`n", "`r")
                    {
                        ;FileOpen(line ".txt", "w")
                        ;MsgBox, %line%
                        BookArray := StrSplit(line, ",")
                        
                        ;MsgBox % BookArray[1] . " " . BookArray[2]
                        
                        if (BookArray[1] = BookName) {
                            BookNameNumber := BookArray[2]
                            BookNameAbv := BookArray[3]
                            BookSectionNameAbv := BookArray[4]

                            ;MsgBox, %BookNameNumber%
                        } else {
                            ;MsgBox, "Book Not Found!"
                        }
                    }
            }

        CleanBookNameAbv := StrReplace(BookNameAbv, "&", "a")

        if InStr(SplitReference[2], "-") {
            ; Verse With Range
            ;MsgBox, "Has Dash"

            LinkLoopOutput := ""
            TagLoopOutput := ""
            CalloutContent :=">[!scripture] " ReferenceStr . "`r>"

            VerseRange := StrSplit(SplitReference[2], "-")
            VerseRangeStart := Format("{:d}", VerseRange[1])
            VerseRangeLast := Format("{:d}", VerseRange[2])

            Loop
            {
                if (A_Index >= VerseRangeStart) {
                    LinkLoopOutput := LinkLoopOutput . "![[" . BookNameNumber . DCSpace . BookName . "#^c" . ChapterNumber . "v" . A_Index . "]]"
                    TagLoopOutput := TagLoopOutput . "#Scripture/" . BookSectionNameAbv . DCTagSlash . CleanBookNameAbv . "/C" . ChapterNumber . "/V" . A_Index
                    ;msgbox, %LinkLoopOutput%
                }
            } Until A_Index = VerseRangeLast

            CalloutContent := CalloutContent . LinkLoopOutput . "`r>" . TagLoopOutput

            Clipboard = %CalloutContent%
            Send, ^v

        } else {
            ; Single Verse
            VerseNumber := SplitReference[2]
            CalloutContent :=">[!scripture] " ReferenceStr . "`r>![[" . BookNameNumber . DCSpace . BookName . "#^c" . ChapterNumber . "v" . VerseNumber . "]]`r>#Scripture/" . BookSectionNameAbv . DCTagSlash . CleanBookNameAbv . "/C" . ChapterNumber . "/V" . VerseNumber
            Clipboard = %CalloutContent%
            Send, ^v
        }
    }
    return
#If

