;--------------------------------------------------------------
; Shared functionality
;--------------------------------------------------------------

; Clear ToolTip
ReSetToolTip:
    ToolTip
    SetTimer, ReSetToolTip, Off
Return

Esc::
#[::
	Goto, ExitCurrentMode
	Return

ExitCurrentMode:
	CurrentMode := 1
	ToolTip
	ToolTip, - PC Mode -
	SetTimer, ReSetToolTip, 750
Return

Delete & a::Process, Close, AHK.exe

#!H::
	Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\FileExplorerOptions