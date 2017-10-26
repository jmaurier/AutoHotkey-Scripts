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

!BackSpace::
{
	Send, {Delete}
	Return
}

;;==============================================================
;; Arrow key
;;==============================================================

#H::
{
	Send, {Left}
	Return
}
^#H::
{
	Send, {LCtrl Down}{Left}{LCtrl Up}
	Return
}
+#H::
{
	Send, {Shift Down}{Left}{Shift Up}
	Return
}
^+#H::
{
	Send, {Ctrl Down}{Shift Down}{Left}{Shift Up}{Ctrl Up}
	Return
}
!#H::
{
	Send, {Home}
	Return
}

#K::
{
	Send, {Right}
	Return
}
^#K::
{
	Send, {LCtrl Down}{Right}{LCtrl Up}
	Return
}
+#K::
{
	Send, {Shift Down}{Right}{Shift Up}
	Return
}
^+#K::
{
	Send, {Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}
	Return
}
!#K::
{
	Send, {End}
	Return
}

#U::
{
	Send {Up}
	Return
}

+#U::
{
	Send, {LShift Down}{Up}{LShift Up}
	Return
}

#J::
{
	Send {Down}
	Return
}

+#J::
{
	Send, {LShift Down}{Down}{LShift Up}
	Return
}

;;==============================================================
;; home and end
;;==============================================================
	
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