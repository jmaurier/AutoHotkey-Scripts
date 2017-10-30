#If (CurrentMode = 4)
	q::ExitToMainMode()

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
		ExitToMainMode()
		Return

	e::
		Run, C:\Program Files\Sublime Text 3\sublime_text.exe
		Return

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
		ExitToMainMode()
		Return

	r::
		if FileExist( "restart.ahk" )
			FileDelete, %A_WorkingDir%\restart.ahk

		FileAppend, 
		(
			ToolTip
			ToolTip "Closing..."
			Sleep, 750
			Process, Close, AHK.exe
			ToolTip "Compiling..."
			Sleep, 750
			Run Ahk2exe.exe /in AHK.ahk
			ToolTip "Restarting..."
			Sleep, 750
			Run %A_ScriptDir%\AHK.exe
			ToolTip
			FileDelete, %A_WorkingDir%\restart.ahk
		)
		, %A_WorkingDir%\restart.ahk

		Run %A_WorkingDir%\restart.ahk
		Return

	; Window information
	w::
		id := WinExist("A")
		WinGetTitle, Title, A
		MsgBox % id Title
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