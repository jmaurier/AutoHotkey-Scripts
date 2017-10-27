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
   #H::SendInput,    {left}
  ^#H::SendInput,   ^{Left}
  !#H::SendInput,   !{Left}
  +#H::SendInput,   +{Left}
 ^!#H::SendInput,  ^!{Left}
 ^+#H::SendInput,  ^+{Left}
 !+#H::SendInput,  !+{Left}
^!+#H::SendInput, ^!+{Left}
   #6::SendInput,    {Home}

   #K::SendInput,    {Right}
  ^#K::SendInput,   ^{Right}
  !#K::SendInput,   !{Right}
  +#K::SendInput,   +{Right}
 ^!#K::SendInput,  ^!{Right}
 ^+#K::SendInput,  ^+{Right}
 !+#K::SendInput,  !+{Right}
^!+#K::SendInput, ^!+{Right}
   #4::SendInput,    {End}

   #J::SendInput,    {Down}
  ^#J::SendInput,   ^{Down}
  !#J::SendInput,   !{PgDn}
  +#J::SendInput,   +{Down}
 ^!#J::SendInput,  ^!{Down}
 ^+#J::SendInput,  ^+{Down}
 !+#J::SendInput,  !+{Down}
^!+#J::SendInput, ^!+{Down}

   #U::SendInput,    {Up}
  ^#U::SendInput,   ^{Up}
  !#U::SendInput,   !{PgUp}
  +#U::SendInput,   +{Up}
 ^!#U::SendInput,  ^!{Up}
 ^+#U::SendInput,  ^+{Up}
 !+#U::SendInput,  !+{Up}
^!+#U::SendInput, ^!+{Up}
	
; No more stupid caps lock!
CapsLock::Ctrl

; VIM Escape
#[::SendInput, {Esc}

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
