;--------------------------------------------------------------
; Windows functionality
;--------------------------------------------------------------
#L::
	Send, {Media_Stop}
	Send, {Volume_Mute}
	ExitToMainMode()
	Return

#O::
{
  	clipBoardTemp := Clipboard
    SendAndSleep("^c", 50)
  	Run, %clipboard%
  	Clipboard := clipBoardTemp
  	Return
}

#H::
{
	Send, {Left}
	Return
}

#K::
{
	Send, {Right}
	Return
}

#U::
{
	Send {Up}
	Return
}

#J::
{
	Send {Down}
	Return
}
	
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

OpenIfFileExists(Path)
{
	IfExist, %path%
		Run %path%

	IfNotExist, %path%
		MsgBox,, AutoHotkey File Finder, File not found: `n%path%

	Return
}

SendAndSleep(textValue, t)
{
	Send, %textValue%
	Sleep, %t%
	Return
}

SendAndExit(ToSend)
{
	Send, %ToSend%
	ExitToMainMode()
	Return
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
	Return
}

ToolTipSleep(textValue, t)
{
	ToolTip
	ToolTip %textValue%
	Sleep, %t%
	ToolTip
	Return
}

ToolTipReset(textValue, t)
{
	ToolTip
	ToolTip %textValue%
	SetTimer, ReSetToolTip, %t%
	ToolTip
	Return
}