#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Suspend AutoHotKey
^ScrollLock::Suspend ; Win + ScrollLock
return

; Fix Cap / Numb / Scroll locks
; Default state of lock keys
SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
return

; Caps Lock acts as Shift / remap Capslock Win+Numlock
^Capslock::
if GetKeyState("CapsLock", "T") = 1
 {
   SetCapsLockState, off
 }
else if GetKeyState("CapsLock", "F") = 0
 {
   SetCapsLockState, on
 }
Return

Capslock::LShift
return

; Num Lock acts as = / remap Numlock to Win+Numlock
^NumLock::
if GetKeyState("NumLock", "T") = 1
 {
   SetNumLockState, off
 }
else if GetKeyState("NumLock", "T") = 0
 {
   SetNumLockState, on
 }
Return

Numlock::=
return

; Press middle mouse button to move up a folder in Explorer
#IfWinActive, ahk_class CabinetWClass
~MButton::Send !{Up} 
#IfWinActive
return