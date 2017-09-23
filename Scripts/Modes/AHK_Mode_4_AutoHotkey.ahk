#If (CurrentMode = 4)
	#A::ExitCurrentMode()

	; Auto commit ALL of the AutoHotkey project
	c::
		; Open Git bash
		Gosub, ^#G

		; Make sure we are pointing to the correct repo location
		SendAndSleep(Format(" cd {1} {enter}", A_WorkingDir), 100)
		SendAndSleep("git add -A {enter}", 500)
		SendAndSleep("git commit -a -F CommitChanges.txt {enter}", 1000)
		SendAndSleep("git push {enter}", 5000)

		; Reset 
		if FileExist( "CommitChanges.txt" )
			FileDelete, %A_WorkingDir%\CommitChanges.txt
		FileAppend, + , %A_WorkingDir%\CommitChanges.txt

		; Recompile and run
		Gosub, r
		Returnr

	; Pull new changes
	p::
		; Open Git bash
		Gosub, ^#G

		; Make sure we are pointing to the correct repo location
		SendAndSleep(Format(" cd {1} {enter}", A_WorkingDir), 100)
		SendAndSleep("git fetch {enter}", 1000)
		SendAndSleep("git pull {enter}" , 5000)

		; Recompile and run
		Gosub, r
		Return

	; Close the AHK.exe process
	q::
		ToolTipInOut("Closing...")
		ExitApp, 0

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


		;Run *RunAs Ahk2exe.exe /in %A_WorkingDir%\restart.exe
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
		ToolTipReset("AutoHotKey...", 750)
		Return
#If