REM Script requires: https://github.com/eksime/VDesk/releases/
@echo off

REM Find day of weeek
for /f %%a in ('date /t') do set DAY=%%a


REM DESKTOP 1 - Main Desktop


REM DESKTOP 2 - Plans Desktop
    vdesk on:2 run:"C:\Program Files\Bluebeam Software\Bluebeam Revu\2018\Revu\Revu.exe"
    timeout 10
REM DESKTOP 3 - Email Desktop
    vdesk on:3 run:outlook
    timeout 10
REM DESKTOP 4 - Internet Desktop

Set choice=CASE_%DAY%

if '%choice%'=='CASE_Mon' GOTO CASE_Mon
if '%choice%'=='CASE_Tue' GOTO CASE_Tue
if '%choice%'=='CASE_Wed' GOTO CASE_Wed
if '%choice%'=='CASE_Thu' GOTO CASE_Thu
if '%choice%'=='CASE_Fri' GOTO CASE_Fri
if '%choice%'=='CASE_Sat' GOTO CASE_Sat
if '%choice%'=='CASE_Sun' GOTO CASE_Sun

echo "day couldn't be found"
GOTO DEFAULT_CASE
:CASE_Mon
    vdesk on:4 run:"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" /new-window "https://play.google.com/music/r/m/Tfthy7ulpclivki2eaqxeznjfty?t=Anywhere_But_Here_-_Rise_Against"
    GOTO END_CASE
:CASE_Tue
:CASE_Wed
:CASE_Thu
:CASE_Fri
:CASE_Sat
:CASE_Sun
:DEFAULT_CASE
    vdesk on:4 run:"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" /new-window "music.google.com"
    GOTO END_CASE
:END_CASE
vdesk on:4 run:"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "messages.android.com"
vdesk on:4 run:"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "youtube.com"