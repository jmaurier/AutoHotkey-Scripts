;--------------------------------------------------------------
; Windows functionality
;--------------------------------------------------------------
<#L::
	Send, {Media_Stop}
	Send, {Volume_Mute}
	ExitToMainMode()
	Return

<#O::
{
  	clipBoardTemp := Clipboard
    SendAndSleep("^c", 50)
    OpenLocation := LTrim(clipboard) 
  	Run, %OpenLocation%
  	Clipboard := clipBoardTemp
  	Return
}

;Delete a line of text
<#!BackSpace::SendInput, {End}{Home}{Home}{Shift Down}{End}{Delete}{Delete}{Shift Up}

; alternate delete keys
 !BackSpace::SendInput,  {Delete}
+!BackSpace::SendInput, ^{Delete}

; Switch desktops
  ^<#Z::SendInput, ^#{Left}
  ^<#X::SendInput, ^#{Right}

; No more stupid caps lock!
CapsLock::Ctrl

; VIM Escape
<#[::SendInput, {Esc}

; Open start menu with ctrl esc
^<#[::SendInput, {Esc}{LWin}

;;==============================================================
;; windows keys
;;==============================================================
;Left windows key doesnt do anything on its own
LWin::SendInput, {VK00}
<#-::WinMinimize, A
<#=::WinRestore,  A
<#+::WinMaximize, A

;;==============================================================
;; Arrow key
;;==============================================================

;--; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;--; UHJK
;--; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	;left
	   <#H::SendInput,    {Left}
	  ^<#H::SendInput,   ^{Left}
	  !<#H::SendInput,   !{Left}
	  +<#H::SendInput,   +{Left}
	 ^!<#H::SendInput,  ^!{Left}
	 ^+<#H::SendInput,  ^+{Left}
	 !+<#H::SendInput,  !+{Left}
	^!+<#H::SendInput, ^!+{Left}
	;right
	   <#K::SendInput,    {Right}
	  ^<#K::SendInput,   ^{Right}
	  !<#K::SendInput,   !{Right}
	  +<#K::SendInput,   +{Right}
	 ^!<#K::SendInput,  ^!{Right}
	 ^+<#K::SendInput,  ^+{Right}
	 !+<#K::SendInput,  !+{Right}
	^!+<#K::SendInput, ^!+{Right}
	;down
	   <#J::SendInput,    {Down}
	  ^<#J::SendInput,   ^{Down}
	  !<#J::SendInput,   !{Down}
	  +<#J::SendInput,   +{Down}
	 ^!<#J::SendInput,  ^!{Down}
	 ^+<#J::SendInput,  ^+{Down}
	 !+<#J::SendInput,  !+{Down}
	^!+<#J::SendInput, ^!+{Down}
	;up
	   <#U::SendInput,    {Up}
	  ^<#U::SendInput,   ^{Up}
	  !<#U::SendInput,   !{Up}
	  +<#U::SendInput,   +{Up}
	 ^!<#U::SendInput,  ^!{Up}
	 ^+<#U::SendInput,  ^+{Up}
	 !+<#U::SendInput,  !+{Up}
	^!+<#U::SendInput, ^!+{Up}
	; Home
	   <#Y::SendInput,    {Home}
	  ^<#Y::SendInput,   ^{Home}
	  !<#Y::SendInput,   !{Home}
	  +<#Y::SendInput,   +{Home}
	 ^!<#Y::SendInput,  ^!{Home}
	 ^+<#Y::SendInput,  ^+{Home}
	 !+<#Y::SendInput,  !+{Home}
	^!+<#Y::SendInput, ^!+{Home}
	; End
	   <#I::SendInput,    {End}
	  ^<#I::SendInput,   ^{End}
	  !<#I::SendInput,   !{End}
	  +<#I::SendInput,   +{End}
	 ^!<#I::SendInput,  ^!{End}
	 ^+<#I::SendInput,  ^+{End}
	 !+<#I::SendInput,  !+{End}
	^!+<#I::SendInput, ^!+{End}


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
