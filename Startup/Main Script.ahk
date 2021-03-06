﻿/*  By Camron 2019
    https://gitlab.com/camronwalker/autohotkey
*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include, %A_ScriptDir%\MainScript_Includes\Key Locks.ahk
#Include, %A_ScriptDir%\MainScript_Includes\Short Sentences.ahk
#Include, %A_ScriptDir%\..\AppSpecific\Obsidian\Fill Scripture Reference.ahk
#Include, %A_ScriptDir%\MainScript_Includes\Functions.ahk

; Renames Viewpoint Team's stupidly named RFI's
^!r::
send ^x
sleep, 100
clipboard := StrReplace(clipboard, "_Request for Information" , "")
sleep, 100
clipboard := StrReplace(clipboard, "_" , A_Space)
sleep, 100
clipboard := StrReplace(clipboard, "RFI " , "RFI_")
sleep, 100
send ^v

return

^F1:: ; Open or switch to Chrome
  OpenActivateProgram("chrome.exe", "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk")
return

^F2:: ; Inbox
  OpenActivateProgram("OUTLOOK.exe", "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE")
  Sleep, 150
  Send, ^1
return

^F3:: ; Calendar
  OpenActivateProgram("OUTLOOK.exe", "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE")
  Sleep, 150
  Send, ^2
return

^F4:: ; Tasks
  OpenActivateProgram("OUTLOOK.exe", "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE")
  Sleep, 150
  Send, ^4
return

^F5:: ; New Email
    Run, "%programfiles%\Microsoft Office\root\Office16\OUTLOOK.EXE" /c ipm.note
return

^F6:: ; Open or switch to Chrome
  OpenActivateProgram("Teams.exe", "C:\Users\camron\AppData\Local\Microsoft\Teams\current\Teams.exe")
return

^F7:: ; archive outlook email
  send !ho ; alt then h then o
return

^F8:: ; archive outlook email and open the archived one
  send !hy2
return

^F9:: ; 
  OpenActivateProgram("Teams.exe", "C:\Users\camron\AppData\Local\Microsoft\Teams\current\Teams.exe")
  send ^+m
return

^F10:: ; 
  OpenActivateProgram("Teams.exe", "C:\Users\camron\AppData\Local\Microsoft\Teams\current\Teams.exe")
  send ^+o
return

^F11:: ; 
  OpenActivateProgram("Teams.exe", "C:\Users\camron\AppData\Local\Microsoft\Teams\current\Teams.exe")
  send ^+e
return

^F12:: ; a
  OpenActivateProgram("Teams.exe", "C:\Users\camron\AppData\Local\Microsoft\Teams\current\Teams.exe")
  send ^/
return

^F13:: ; Bluebeam Studio Online
  FindChromeTab("Bluebeam Drawings", "web.bluebeam.com")
return

^F14:: ; Google Play Music
  FindChromeTab("Google Play Music", "music.google.com")
return

^F15:: ; Android Messages Online
  FindChromeTab("Messages for web", "messages.android.com")
return

^F16:: ; Open a few common Chrome tabs for work
  run, chrome.exe messages.android.com
  run, chrome.exe -new-tab music.google.com
  run, chrome.exe -new-tab http://to-do.office.com/today
return

^F17:: ; Switch to / open Bluebeam Revu
  OpenActivateProgram("Revu.exe", "C:\Program Files\Bluebeam Software\Bluebeam Revu\20\Revu\Revu.exe")
return

^F18:: ; Switch to / open Excel
  OpenActivateProgram("EXCEL.exe", "C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE")
return

^F19:: ; Attach Submittal Cover see Add Submittal Cover.ahk command
  RunWait, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "%A_ScriptDir%\..\AppSpecific\Bluebeam\Add Submittal Cover.ahk" "SGU Submittal Cover.pdf"
return

^F20:: ; Toggle Connection to Work VPN
  RunWait, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "%A_ScriptDir%\..\AppSpecific\FileManagement\Toggle Work VPN.ahk" "HHS2 Submittal Cover.pdf"
return

^F21:: ; Microsoft To-Do Online
  FindChromeTab("To-Do", "to-do.office.com/today")
return

^F22:: ; YouTube
  FindChromeTab("YouTube", "youtube.com")
return
^F23:: ; Open VS Studio and Code Current Directory
  RunWait, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "%A_ScriptDir%\..\AppSpecific\FileManagement\Code Current Folder.ahk"
return
^F24:: ; Backup Desktop to Desktop Backup folder within the Documents Folder
  RunWait, PowerShell.exe -ExecutionPolicy ByPass -File "%A_ScriptDir%\..\AppSpecific\FileManagement\ps desktop backup.ps1"
return

^+F1:: ; ctrl+shift+F1
  send ^l
  sleep, 50
  SetKeyDelay, 1
  send, javascript: var inputs = document.getElementsByClassName('form-control')`; for(var i = 0`; i < inputs.length`; i{+}{+}) {{} inputs[i].disabled = false`; {}}
  send {Enter}
  return