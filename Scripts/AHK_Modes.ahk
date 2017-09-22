;--------------------------------------------------------------
; CurrentMode is the global variable that determines what mode
; the user is currently in.
;--------------------------------------------------------------
#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_2_Media.ahk
#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_3_Web.ahk
#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_4_AutoHotkey.ahk

;--------------------------------------------------------------
; Modes
; 1 = Normal Mode
; 2 = Media
; 3 = Bookmark
; 4 = AutoHotkey
;--------------------------------------------------------------



#M::
	CurrentMode := 2
	ToolTipInOut("Media Control")
	Return

#W::
	CurrentMode := 3
	ToolTipInOut("Bookmark")
	Return

#A::
	CurrentMode := 4
	ToolTipInOut("AutoHotkey")
	Return