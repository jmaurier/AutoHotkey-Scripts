#If (CurrentMode = 5)
	#S::ExitToMainMode()
		Return

	s::
		WinGet, PID, PID, A

		Input, xTime, T3, {Enter}

		If xTime is integer
		{
			;SetTimer, KillProcess(PID), xTime
			Process, Close, %PID%, %xTime%
		}

		Return

	KillProcess(PID)
	{
		Process, Close, %PID%, %xTime%

	}
	
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
	q::
	r::
	t::
	u::
	v::
	w::
	x::
	y::
	z::
		ToolTipReset("Security...", 750)
		Return
#If