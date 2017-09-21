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
	ToolTip
	ToolTip, - PC Mode -
	SetTimer, ReSetToolTip, 750
Return