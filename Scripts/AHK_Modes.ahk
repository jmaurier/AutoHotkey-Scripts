;--------------------------------------------------------------
; CurrentMode is the global variable that determines what mode
; the user is currently in.
;--------------------------------------------------------------
#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_3_Web.ahk
#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_4_AutoHotkey.ahk
#Include, %A_ScriptDir%\Scripts\Modes\AHK_Mode_5_Folder.ahk

;--------------------------------------------------------------
; User folder
;--------------------------------------------------------------
#Include, %A_ScriptDir%\Scripts\User\Modes\AHK_uMode_6_Folder.ahk

;--------------------------------------------------------------
; Modes
; 1 = Normal Mode
; 2 = Media
; 3 = Bookmark
; 4 = AutoHotkey
; 5 = Security
;--------------------------------------------------------------

;--------------------------------------------------------------
; Mode accessors
;--------------------------------------------------------------
#W::
	CurrentMode := 3
	ToolTipInOut("Bookmark")
	Return

#A::
	CurrentMode := 4
	ToolTipInOut("AutoHotkey")
	Return

#F::
	CurrentMode := 6
	ToolTipInOut("Folder")
	Return

;--------------------------------------------------------------
; Global modal control
;--------------------------------------------------------------
#If (CurrentMode > 1)
	#[::
		ExitToMainMode()
		Return
#If

;--------------------------------------------------------------
; Methods
;--------------------------------------------------------------

ExitToMainMode()
{
	global CurrentMode  := 1

	ToolTipInOut("Main Mode")

	Return
}

