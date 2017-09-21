;--------------------------------------------------------------
; CurrentMode is the global variable that determines what mode
; the user is currently in.
;--------------------------------------------------------------

#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_2_Media.ahk
#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_3_Web.ahk
#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_4_AutoHotkey.ahk

;--------------------------------------------------------------
; Modes
; 1 = PC
; 2 = Media
; 3 = Bookmark
; 4 = AutoHotkey
;--------------------------------------------------------------
#M::
	CurrentMode := 2
	ToolTip
	ToolTip, - Media Mode -
	SetTimer, ReSetToolTip, 750
Return

#W::
	CurrentMode := 3
	ToolTip
	ToolTip, - Web Mode -
	SetTimer, ReSetToolTip, 750
Return

#A::
	CurrentMode := 4
	ToolTip
	ToolTip, - AHK Mode -
	SetTimer, ReSetToolTip, 750
Return