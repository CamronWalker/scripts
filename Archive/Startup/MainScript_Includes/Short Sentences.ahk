﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; q Short Sentences (Questions)
:*:qcall::Feel free to give me a call if you have any questions (801.875.2600).
:*:qemail::Let's keep communication related to this subject in this email thread to stay on the same page. Please reply all if you have any questions.
:*:qlmk::Feel free to let me know if you have any questions (801.875.2600).
:*:hlmk::Feel free to let me know if there is anything I can do to help (801.875.2600).
:*:afuemail::This is an automated follow-up reminder. If this is already resolved, please ignore this message. Your attention to this matter is greatly appreciated.

; r Short Sentences (Reply)
:*:rnow::I would appreciate your immediate attention to this matter.
:*:rtomorrow::
    tomorrow := A_Now
    tomorrow += 1, days
    FormatTime, rtomorrowdate, %tomorrow%, MMMM d, yyyy
    Send, Can you send me an update on this by %rtomorrowdate% at noon.
return

:*:tyc::
    send Thanks,
    send, {Enter 1}
    send !nas
    send {Enter}
return
; Instructions

:*:revinst::(To view previous revisions click on the small down facing triangle next to the REV {#} on the upper left of the screen.)
:*:rfiinst::Please submit this RFI through https://team.viewpoint.com by following the instructions on http://teamdocs.viewpoint.com/topics/RFI/t_add_an_RFI.html. (NOTE: Please do not just attach a PDF of your RFI. The correct way is to fill out the create RFI form on Viewpoint Team and send it to Westland PE's. A good example of an attachment is a clouded or marked up drawing that helps explain the RFI question that was typed out or copy/pasted into the Viewpoint Team form.)
:*:notecomm::Please note any comments made by the Architect and work with the project superintendent to coordinate correct procurement and install.

; Date and time related


; tddd for todays date
:*:ddd::
    FormatTime, shorttime, ,yyyy-MM-dd
    SendInput, %shorttime%
return

; udate for for date
:*:udate::
    FormatTime, shorttime, ,yyyy-MM-dd
    SendInput, %shorttime% Camron:
return

; mudate is an update for a meeting
:*:mudate::
    FormatTime, shorttime, ,yyyy-MM-dd
    SendInput, UPDATE %shorttime%:
return

; Name as ccc
:*:ccc::
    send, Camron Walker
return

; email as eee
:*:eee::
    send, camron@westlandconstruction.com
return

; tdt for today's date and time
:*:tdt::
    FormatTime, todaydateandtime, ,yyyy-MM-dd hh:mm tt
    SendInput, %todaydateandtime%
return

; emailfu for "Followed up with an email sent on <date> around <time>. -Camron"
:*:emailfu::
    FormatTime, emailfudate, ,MMMM d, yyyy
    FormatTime, emailfutime, ,h tt
    SendInput, Followed up with an email sent on %emailfudate% around %emailfutime%. -Camron
return

; vmfu for "Followed up with a voicemail on <date> around <time>. -Camron"
:*:vmfu::
    FormatTime, vmfudate, ,MMMM d, yyyy
    FormatTime, vmfutime, ,h tt
    SendInput, Followed up with a voicemail on %vmfudate% around %vmfutime%. -Camron
return

; callfu for "Followed up with a phone call on <date> around <time>. -Camron"
:*:callfu::
    FormatTime, callfudate, ,MMMM d, yyyy
    FormatTime, callfutime, ,h tt
    SendInput, Followed up with a phone call on %callfudate% around %callfutime%. -Camron
return

; camsign for "-Camron <date> <time>"
:*:camsign::
    FormatTime, camsigndate, ,yyyy-MM-dd hh:mm tt
    SendInput, - Camron %camsigndate%
return
; other acronyms I hate
; :*:idk::I don't know.

;TODO Reply Pricing by days of week.
;TODO Reply by certain number of days