;--------------------------------------------------------------
; Script Directory
;--------------------------------------------------------------
ToolTip I'm up!
Sleep, 750
ToolTip

;Include all script files.
#Include, %A_ScriptDir%\Scripts\AHK_Git.ahk
#Include, %A_ScriptDir%\Scripts\AHK_ClipBoard.ahk 
#Include, %A_ScriptDir%\Scripts\AHK_HotStrings.ahk
#Include, %A_ScriptDir%\Scripts\AHK_Applications.ahk
#Include, %A_ScriptDir%\Scripts\AHK_Modes.ahk
#Include, %A_ScriptDir%\Scripts\AHK_Core.ahk

;Never show a tray icon for AutoHotkey.
#NoTrayIcon

;Suspend all AutoHotkey functionality until Win + Q is hit again.
#Q::Suspend