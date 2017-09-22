;--------------------------------------------------------------
; Shared functionality
;--------------------------------------------------------------

#If, (CurrentMode > 1)
Esc::
#[::
	ExitCurrentMode()
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

;--------------------------------------------------------------
; Functions
;--------------------------------------------------------------
ExitCurrentMode()
{
	global CurrentMode := 1
	ToolTipInOut("Normal Mode")
}

OpenIfFileExists(Path)
{
	IfExist, %path%
		Run %path%

	IfNotExist, %path%
		MsgBox,, AutoHotkey File Finder, File not found: `n%path%
}

SendAndSleep(textValue, t)
{
	Send, %textValue%
	Sleep, %t%
}

SendAndExit(ToSend)
{
	Send, %ToSend%
	ExitCurrentMode()
}

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

ToolTipSleep(textValue, t)
{
	ToolTip
	ToolTip %textValue%
	Sleep, %t%
}

ToolTipReset(textValue, t)
{
	ToolTip
	ToolTip %textValue%
	SetTimer, ReSetToolTip, %t%
}