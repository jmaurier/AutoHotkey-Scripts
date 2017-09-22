#If (CurrentMode = 4)
	#A::Goto, ExitCurrentMode

	; Close the AHK.exe process
	q::Process, Close, AHK.exe

	r::
		if FileExist( "restart.ahk" )
			FileDelete, %A_WorkingDir%\restart.ahk

		FileAppend, 
		(
			Process, Close, AHK.exe

			ToolTip
			ToolTip Recompiling...
			Sleep, 750
			Run *RunAs Ahk2exe.exe /in AHK.ahk

			ToolTip
			ToolTip Restarting...
			Sleep, 750
			Run *RunAs %A_ScriptDir%\AHK.exe

			ToolTip
			FileDelete, %A_WorkingDir%\restart.ahk 
		)
		, %A_WorkingDir%\restart.ahk

		Run *RunAs %A_WorkingDir%\restart.ahk 
		Return

	c::
		; Open Git bash
		if WinExist("MINGW64")
    		WinActivate, MINGW64
    	Else
    		Gosub, ^#G
		Sleep, 100

		; Send git status hotkey
		Send, git status
		Send, {enter}
		Sleep, 750

		; Add files to stage
		Send, git add -A
		Send, {enter}
		Sleep, 750

		; Commit with local commit changes file
		Send git commit -a -F CommitChanges.txt
		Send, {enter}
		Sleep, 2000

		; Push all changes to repo
		Send, git push
		Send, {enter}
		Sleep, 3000

		; Close git bash
		Gosub, #x

		; Reset 
		if FileExist( "CommitChanges.txt" )
			FileDelete, %A_WorkingDir%\CommitChanges.txt
		FileAppend, + , %A_WorkingDir%\CommitChanges.txt

		Return

	; Window information
	w::
		id := WinExist("A")
		MsgBox % id
		Return

	;Turn off normal typing while in media mode.
	a::
	b::
	d::
	e::
	f::
	g::
	h::
	i::
	j::
	k::
	l::
	m::
	n::
	o::
	p::
	s::
	t::
	u::
	v::
	x::
	y::
	z::
		ToolTip
		ToolTip,  AutoHotKey...
		SetTimer, ReSetToolTip, 750
		Return
#If