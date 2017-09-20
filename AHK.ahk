FileGetTime, ModTime, %A_ScriptFullPath%, M
SetTimer, CheckTime, 2000
Return

CheckTime:
    FileGetTime, ModTime2, %A_ScriptFullPath%, M
    If (ModTime2 != ModTime)
      Reload
    Return

;--------------------------------------------------------------
; Script Directory
;--------------------------------------------------------------
#Include, %A_ScriptDir%\Scripts\AHK_Git.ahk
#Include, %A_ScriptDir%\Scripts\AHK_ClipBoard.ahk
#Include, %A_ScriptDir%\Scripts\AHK_HotStrings.ahk
#Include, %A_ScriptDir%\Scripts\AHK_Applications.ahk
#Include, %A_ScriptDir%\Scripts\AHK_Modes.ahk 