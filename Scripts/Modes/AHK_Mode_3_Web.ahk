#If (CurrentMode = 3)
	#W::Goto, ExitCurrentMode

	a::
		Run, https://autohotkey.com/docs/AutoHotkey.htm
		Goto, ExitCurrentMode
		Return
	d::
		Run, https://www.dcu.org/
		Goto, ExitCurrentMode
		Return
	g::
		Run, https://github.com/
		Goto, ExitCurrentMode
		Return
	h::
		Run, https://www.hackerrank.com/dashboard
		Goto, ExitCurrentMode
		Return
	n::
		Run, https://www.navient.com/
		Goto, ExitCurrentMode
		Return
	r::
		Run, https://www.reddit.com/
		Goto, ExitCurrentMode
		Return
	s::
		Run, https://www.google.com/
		Goto, ExitCurrentMode
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