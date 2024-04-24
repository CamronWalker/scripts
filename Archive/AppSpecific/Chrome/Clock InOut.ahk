; Add –remote-debugging-port=9222 flag to chrome when you open password_input
; https://westland-keystyle.viewpointforcloud.com/Account/Login

#Include Chrome.ahk

My_User_Name := "1082"
My_Password := "e5C7W7T@f9r6wKJu"

; Required to initiate profile
 FileCreateDir, ChromeProfile
 ChromeInst := new Chrome("ChromeProfile")
 Sleep, 1000
 
; Connect to the newly opened tab and navigate to another website
; Note: If your first action is to navigate away, it may be just as
; effective to provide the target URL when instantiating the Chrome class
PageInstance := ChromeInst.GetPage()
PageInstance.Call("Page.navigate", {"url": "https://westland-keystyle.viewpointforcloud.com/Account/Login"})
PageInstance.WaitForLoad()
 
PageInstance.Evaluate("document.getElementById('employeeId').value = '1082'")
PageInstance.Evaluate("document.getElementById('password').value = 'e5C7W7T@f9r6wKJu'")