#g::
{
  	clipBoardTemp := Clipboard
    SendAndSleep("^c", 50)
  	Run, http://www.google.com/search?q=%clipboard%
  	Clipboard := clipBoardTemp
  	Return
}

;Define the text under the cursor using Google
#?::
{
    clipBoardTemp := Clipboard
    SendAndSleep("^c", 50)
    Run, http://www.google.com/search?q=define+%clipboard%
    Clipboard := clipBoardTemp
    Return
}

;C# .NET Google Search
#+3::
{
    clipBoardTemp := Clipboard
    SendAndSleep("^c", 50)
    Run, http://www.google.com/search?q=C`%23+.NET+%clipboard%
    Clipboard := clipBoardTemp
    Return
}

; Dump clips
#+v::
SetFormat, float, 06.0
Loop %maxindex%
{
  zindex := SubStr("0000000000" . A_Index, -9)
  thisclip := clipvar%A_Index%
  clipboard := thisclip
  SendInput, ^v
  Sleep, 50
}

ToolTipInOut("Clipboard Dumped")

maxindex  = 0
clipindex = 0
Return

; Add clipboard contents to the stack when you copy or paste using the keyboard
#+c::
SendInput, ^c
Sleep 300
clipindex += 1
clipvar%clipindex% := clipboard . "`r"
thisclip := clipvar%clipindex%
ToolTipSleep(thisclip, 750)
maxindex += 1
Return

#c