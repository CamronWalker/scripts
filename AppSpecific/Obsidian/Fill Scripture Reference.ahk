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
    BooksNumberArray := [["01", "1 Nephi", "1-Ne"], ["02", "2 Nephi", "2-Ne"], ["03", "Jacob", "Jacob"], ["04", "Enos", "Enos"], ["05", "Jarom", "Jarom"], ["06", "Omni", "Omni"], ["07", "Words of Mormon", "WoM"], ["08", "Mosiah", "Mos"], ["09", "Alma", "Alma"], ["10", "Helaman", "Hel"], ["11", "3 Nephi", "3-Ne"], ["12", "4 Nephi", "4-Ne"], ["13", "Mormon", "Mormon"], ["14", "Ether", "Ether"], ["15", "Moroni", "Moroni"]]


    
    SplitReference := StrSplit(ReferenceStr, ":")
    LastSpaceLocation := InStr(SplitReference[1], " " , False, 0)
    ; MsgBox, %LastSpaceLocation%

    ChapterNumber := SubStr(SplitReference[1], LastSpaceLocation + 1)
    ; MsgBox, %ChapterNumber%

    BookName := SubStr(SplitReference[1], 1, LastSpaceLocation - 1)
    BookNameNoSpaces := StrReplace(BookName, " " , "-")
    ; MsgBox, %BookNameNoSpaces%
    for index, element in BooksNumberArray
        {
            if element[2] = BookName {
                BookNameNumber := element[1]
                BookNameAbv := element[3]
            }
        }

    ; MsgBox, %BookNameNumber%


    if InStr(SplitReference[2], "-") {
        ; Verse With Range



    } else {
        ; Single Verse
        VerseNumber := SplitReference[2]
        CalloutContent :=">[!scripture] " ReferenceStr . "`r>![[" . BookNameNumber . " " . BookName . "#^c" . ChapterNumber . "v" . VerseNumber . "]]`r>#Scripture/BoM/" . BookNameAbv . "/C" . ChapterNumber . "/V" . VerseNumber
        Clipboard = %CalloutContent%
        Send, ^v
    }

   /*
        SplitReference := StrSplit(ReferenceStr, ":")
        ; msgbox, % SplitReference[1]
        ; msgbox, % SplitReference[2]

        if InStr(SplitReference[2], "-") {

            VerseRange := StrSplit(SplitReference[2], "-")

            VerseRangeStart := Format("{:d}", VerseRange[1])
            VerseRangeLast := Format("{:d}", VerseRange[2])

            OutputLoop := ""

            Loop
            {
                if (A_Index >= VerseRangeStart) {
                    OutputLoop := OutputLoop . "![[" . SplitReference[1] . "#" . A_Index "]] " 
                    ; msgbox, %OutputLoop%
                }
            } Until A_Index = VerseRangeLast

            ReturnText := "> __[[" . SplitReference[1] . "|" . StartSelection . "]]__`r> " . OutputLoop
            ; msgbox, %ReturnText%
            Clipboard = %ReturnText%
            Send, ^v
            } else {
                ; MsgBox, "no -"

                 

        } 
        */
    }
    return
#If

