#g::
{
  	clipBoardTemp := Clipboard
    SendAndSleep("^c", 50)
  	Run, http://www.google.com/search?q=%clipboard%
  	Clipboard := clipBoardTemp
  	Return
}

;Clipboard Calculator
#+::
{
    val := Clipboard
    SendAndSleep("^c", 50)
    val2 := Clipboard
    sum := val + val2
    Clipboard := sum
    ToolTip
    tooltip %val% + %val% = %sum%
    SetTimer, ReSetToolTip, 1500
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
    ToolTipReset("Clipboard history cleared", 750)
    maxindex = 0
    clipindex = 0
    Return

; ; Scroll up and down through clipboard history
; ^#!j::
;     if clipindex > 1
;     {
;       clipindex -= 1
;     }
;     thisclip := clipvar%clipindex%
;     clipboard := thisclip
;     ToolTipReset(clipboard , 750)
;     Return

; ^#!k::
;     if clipindex < %maxindex%
;     {
;       clipindex += 1
;     }
;     thisclip := clipvar%clipindex%
;     clipboard := thisclip
;     ToolTipReset(clipboard , 750)
;     Return

; Add clipboard contents to the stack when you copy or paste using the keyboard
^+x::
    SendAndSleep("^x", 500)
    clipindex += 1
    clipvar%clipindex% := clipboard
    thisclip := clipvar%clipindex%
    ToolTipReset(thisclip , 750)
    if clipindex > %maxindex%
    {
      maxindex := clipindex
    }
    Return

^+c::
    SendAndSleep("^c", 500)
    clipindex += 1
    clipvar%clipindex% := clipboard
    thisclip := clipvar%clipindex%
    ToolTipReset(thisclip , 750)
    if clipindex > %maxindex%
    {
      maxindex := clipindex
    }
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