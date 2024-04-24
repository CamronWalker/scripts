#Requires AutoHotkey v2.0

; Date yyyy-mm-dd
:*:ddd::
{
    shorttime := FormatTime(,"yyyy-MM-dd")
    SendInput shorttime
}

; mudate is an update for a meeting
:*:mudate::
{
    shorttime := FormatTime(,"yyyy-MM-dd")
    SendInput "UPDATE " shorttime ":"
}

:*:cudate::
{
    shorttime := FormatTime(,"yyyy-MM-dd")
    SendInput shorttime " Camron:"
}

; Name as ccc
:*:ccc::
{
    Send "Camron Walker"
}

; email as eee
:*:eee::
{
    Send "camron@westlandconstruction.com"
}

; email as eee
:*:###::
{
    Send "801.875.2600"
}

; q Short Sentences (Questions)
:*:qcall::If you have any questions give me a call on my cell (801.875.2600).
:*:qlmk::Let me know if you have any questions (801.875.2600).
:*:hlmk::Let me know if there is anyway I can help.
:*:afuemail::This is an automated follow-up reminder. If this is already resolved, please ignore this message. Your attention to this matter is greatly appreciated.
