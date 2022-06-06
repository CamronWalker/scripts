#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

OpenActivateProgram(ExeName, ExePath) {
    ExistExe = ahk_exe %ExeName%
    if WinExist(ExistExe) {
        WinActivate, %ExistExe%
    } else {
        run, %ExePath%
        WinWait %ExistExe%
        WinActivate %ExistExe%
        WinWaitActive %ExistExe%
    }
}
return

FindChromeTab(TabToFind, TabURL) {
    ; Msgbox, %TabToFind% %TabURL%

	If WinExist("ahk_exe chrome.exe") {
		winactivate ahk_exe chrome.exe
		WinGetTitle, StartTab

        if InStr(StartTab, TabToFind, True) > 0 {
                Goto, SkipLoop
            }
        loop {
            Send ^{Tab}
            Sleep, 40

            WinGetTitle, CurrentTitle
            if InStr(CurrentTitle, TabToFind, True) > 0 {
                break
            }
            if (StartTab = CurrentTitle) {
                run, chrome.exe -new-tab %TabURL%
                break
            }
        }
        SkipLoop:
	} else {
		run, chrome.exe %TabURL%
		WinWait ahk_exe chrome.exe
		WinActivate ahk_exe chrome.exe
		WinWaitActive ahk_exe chrome.exe
	}
}
return

GetSelectedText() {
    tmp = %ClipboardAll% ; save clipboard
    Clipboard := "" ; clear clipboard
    Send, ^c ; simulate Ctrl+C (=selection in clipboard)
    ClipWait, 0, 1 ; wait until clipboard contains data
    selection = %Clipboard% ; save the content of the clipboard
    Clipboard = %tmp% ; restore old content of the clipboard
    return selection
}