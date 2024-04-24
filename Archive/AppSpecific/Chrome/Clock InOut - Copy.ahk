#Include, RunAsAdmin.ahk

My_User_Name := "1082"
My_Password := "e5C7W7T@f9r6wKJu"

web_browser := ComObjCreate("InternetExplorer.Application")
web_browser.Visible := true

web_browser.Navigate("https://westland-keystyle.viewpointforcloud.com/Account/Login")

while web_browser.busy ; a while loop is a way to keep the script testing an IF like expression

sleep 100 ; IF web_browser.busy is true then sleep 100 milliseconds

sleep 1000
web_browser.document.getElementById("employeeId").select()
sleep 1000
send, %My_User_Name%

sleep 1000

web_browser.document.getElementById("password").select()
sleep 1000
send, %My_Password%

sleep 1000
;While ( value <> "CLOCK IN / OUT" )																				; Loops through the elements, until its innerText matches.
	;value 			:= Pwb.document.getElementsByTagName( "Button")[ A_Index - 1].innerText, index := A_Index -1			; Gets the value, and stores the Index

web_browser.getElementsByTagName("Button")[2].click()																; Clicks on the Community Forum link.

Return

; Add –remote-debugging-port=9222 flag to chrome when you open password_input
