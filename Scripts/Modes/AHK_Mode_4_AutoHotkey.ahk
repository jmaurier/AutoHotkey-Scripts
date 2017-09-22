#If (CurrentMode = 4)
	#A::Goto, ExitCurrentMode

	; Auto commit ALL of the AutoHotkey project
	c::
		; Open Git bash
		Gosub, ^#G

		; Make sure we are pointing to the correct repo location
		send cd %A_WorkingDir%
		Send, {enter}
		Sleep, 500

		; Add files to stage
		Send, git add -A
		Send, {enter}
		Sleep, 500

		; Commit with local commit changes file
		Send git commit -a -F CommitChanges.txt
		Send, {enter}
		Sleep, 1000

		; Push all changes to repo
		Send, git push
		Send, {enter}
		Sleep, 5000

		; Reset 
		if FileExist( "CommitChanges.txt" )
			FileDelete, %A_WorkingDir%\CommitChanges.txt
		FileAppend, + , %A_WorkingDir%\CommitChanges.txt

		; Recompile and run
		Gosub, r
		Return

	; Pull new changes
	p::
		; Open Git bash
		Gosub, ^#G

		; Make sure we are pointing to the correct repo location
		send cd %A_WorkingDir%
		Send, {enter}
		Sleep, 100

		Send, git fetch
		Send, {enter}
		Sleep, 1000
		Return

		Send, git pull
		Send, {enter}
		Sleep, 5000

		; Recompile and run
		Gosub, r
		Return

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