;--------------------------------------------------------------
; CurrentMode is the global variable that determines what mode
; the user is currently in.
;--------------------------------------------------------------

#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_2_Media.ahk
#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_3_Web.ahk

;--------------------------------------------------------------
; Modes
; 1 = PC
; 2 = Media
; 3 = Bookmark
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