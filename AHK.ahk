; --------------------------------------------------------------
; Modes
; --------------------------------------------------------------
; Media
!#M::ModalSwitch( "AHK_M.exe" )

;--------------------------------------------------------------	
; Text: General
;--------------------------------------------------------------	
:c*:@B::jmaurier@b2wsoftware.com
:c*:@G::jacobmaurier@gmail.com
:c*:@H::jmaurier@harding.edu
:*:rar?::rock and roll?

:c*:AK::AutoHotkey
:c*:VS::Visual Studio
:c*:ST::Sublime Text
:c*:PS::PowerShell

;--------------------------------------------------------------	
; Text: SQL
;--------------------------------------------------------------	
::ssf::select * from
::uid::uniqueidentifier
::0uid::00000000-0000-0000-0000-000000000000

;--------------------------------------------------------------
; Text: Long
;--------------------------------------------------------------
:Rc:LOR::Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
:*:;-::
(
--------------------------------------------------------------
--------------------------------------------------------------
)

; --------------------------------------------------------------
; Methods
; --------------------------------------------------------------
ModalSwitch( exe )
{
	Run %exe%
	Process, Close, AHK.exe
	Return
}

; --------------------------------------------------------------
; New functionality
; --------------------------------------------------------------
#g::
{
	clipBoardTemp := Clipboard
	Send, ^c
	Sleep 50
	Run, http://www.google.com/search?q=%clipboard%
	Clipboard := clipBoardTemp
	Return
}

; Retrieves saved clipboard information since when this script last ran
Loop C:\tmp\clipvar*.txt
{
  clipindex += 1
  FileRead clipvar%A_Index%, %A_LoopFileFullPath%
  FileDelete %A_LoopFileFullPath%
}
maxindex := clipindex
OnExit ExitSub

; Clears the history by resetting the indices
^#!x::
  tooltip Clipboard history cleared
  SetTimer, ReSetToolTip, 1000
  maxindex = 0
  clipindex = 0
Return

; Scroll up and down through clipboard history
^#!j::
  if clipindex > 1
  {
    clipindex -= 1
  }
  thisclip := clipvar%clipindex%
  clipboard := thisclip
  tooltip %clipboard%
  SetTimer, ReSetToolTip, 1000
Return

^#!k::
  if clipindex < %maxindex%
  {
    clipindex += 1
  }
  thisclip := clipvar%clipindex%
  clipboard := thisclip
  tooltip %clipboard%
  SetTimer, ReSetToolTip, 1000
Return

; Add clipboard contents to the stack when you copy or paste using the keyboard
~^+x::
~^+c::
  Sleep 500
  clipindex += 1
  clipvar%clipindex% := clipboard
  thisclip := clipvar%clipindex%
  tooltip %thisclip%
  SetTimer, ReSetToolTip, 1000
  if clipindex > %maxindex%
  {
    maxindex := clipindex
  }
Return

; Clear the ToolTip
ReSetToolTip:
  ToolTip
  SetTimer, ReSetToolTip, Off
Return

; Saves the current clipboard history to hard disk
ExitSub:
SetFormat, float, 06.0
Loop %maxindex%
{
  zindex := SubStr("0000000000" . A_Index, -9)
  thisclip := clipvar%A_Index%
  FileAppend %thisclip%, C:\tmp\clipvar%zindex%.txt
}
ExitApp


;Clipboard Calculator
#+::
{
  val := Clipboard
  Sleep, 50
  Send, ^c
  Sleep, 50
  val2 := Clipboard
  sum := val + val2
  Clipboard := sum

  tooltip %sum%
  SetTimer, ReSetToolTip, 1500

  Return
}