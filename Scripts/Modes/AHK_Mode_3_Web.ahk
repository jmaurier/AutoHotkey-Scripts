#If (CurrentMode = 3)
	#W::ExitCurrentMode()

	a::
		Run, https://autohotkey.com/docs/AutoHotkey.htm
		ExitCurrentMode()
		Return
	d::
		Run, https://www.dcu.org/
		ExitCurrentMode()
		Return
	g::
		Run, https://github.com/
		ExitCurrentMode()
		Return
	h::
		Run, https://www.hackerrank.com/dashboard
		ExitCurrentMode()
		Return
	n::
		Run, https://www.navient.com/
		ExitCurrentMode()
		Return
	r::
		Run, https://www.reddit.com/
		ExitCurrentMode()
		Return
	s::
		Run, https://www.google.com/
		ExitCurrentMode()
		Return

	;Turn off normal typing while in media mode.
	b::
	c::
	e::
	f::
	i::
	j::
	k::
	l::
	m::
	o::
	p::
	q::
	t::
	u::
	v::
	w::
	x::
	y::
	z::
		ToolTip
		ToolTip,  Bookmark...
		SetTimer, ReSetToolTip, 750
		Return
#If