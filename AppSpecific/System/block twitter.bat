@echo off

SET NEWLINE=^& echo.

FIND /C /I "twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%>>%WINDIR%\System32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "www.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 www.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "pic.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pic.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "stream.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 stream.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "m.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 m.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "mobile.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 mobile.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "search.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 search.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "cards-dev.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 cards-dev.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "ww.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 ww.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "tweetdeck.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 tweetdeck.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "es.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 es.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "platform.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 platform.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "blog.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 blog.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "dev.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 dev.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "help.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 help.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "support.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 support.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "buisness.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 buisness.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "publish.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 publish.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "cards.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 cards.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "static.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 static.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "twitter.com/home" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 twitter.com/home>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "ac.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 ac.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "api.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 api.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "twimg.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 twimg.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "p.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 p.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "userstream.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 userstream.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "upload.twitter.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 upload.twitter.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "twimg0-a.akamaihd.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 twimg0-a.akamaihd.net>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "abs.twimg.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 abs.twimg.com>>%WINDIR%\System32\drivers\etc\hosts

FIND /C /I "pbs.twimg.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pbs.twimg.com>>%WINDIR%\System32\drivers\etc\hosts

ipconfig /flushdns