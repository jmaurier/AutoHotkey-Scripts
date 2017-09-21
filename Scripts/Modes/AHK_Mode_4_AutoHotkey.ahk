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

			Sleep, 750
			Run *RunAs Ahk2exe.exe /in AHK.ahk

			Sleep, 750
			Run *RunAs %A_ScriptDir%\AHK.exe
			FileDelete, %A_WorkingDir%\restart.ahk 
		)
		, %A_WorkingDir%\restart.ahk

		Run *RunAs %A_WorkingDir%\restart.ahk 

	Return

	;Turn off normal typing while in media mode.
	a::
	b::
	c::
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
	w::
	x::
	y::
	z::
		ToolTip
		ToolTip, - AHK Mode -
		SetTimer, ReSetToolTip, 750
		Return
#If