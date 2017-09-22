;--------------------------------------------------------------
; Shared functionality
;--------------------------------------------------------------

#If, (CurrentMode > 1)
Esc::
#[::
	Goto, ExitCurrentMode
	Return
#If

;--------------------------------------------------------------
; Windows functionality
;--------------------------------------------------------------
#l::
	Send, {Media_Stop}
	Send, {Volume_Mute}
	Return

; TODO: add funcctionality to show or hide hidden files and folders
#!H::
	Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\FileExplorerOptions
	Return
	
; No more stupid caps lock!
CapsLock::Ctrl


;--------------------------------------------------------------
; Labels
;--------------------------------------------------------------
; Clear ToolTip
ReSetToolTip:
    ToolTip
    SetTimer, ReSetToolTip, Off
	Return

; Exit to PC Mode
ExitCurrentMode:
	CurrentMode := 1
	ToolTipInOut("Normal Mode")
	Return

;--------------------------------------------------------------
; Functions
;--------------------------------------------------------------
ToolTipInOut(textValue)
{
	ToolTip
	charTime    = 20
	pauseTime   = 500
	textLength := StrLen(textValue) 
	Loop, %textLength%
	{
		ToolTip % SubStr(textValue, 1, A_Index)
		Sleep, charTime
	}
	Sleep, pauseTime
	Loop, %textLength%
	{
		ToolTip % SubStr(textValue, A_Index, textLength - A_Index)
		Sleep, charTime
	}
	ToolTip
}