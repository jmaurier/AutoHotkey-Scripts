#If (CurrentMode = 3)
	q::ExitToMainMode()

	a::
		Run, https://autohotkey.com/docs/AutoHotkey.htm
		ExitToMainMode()
		Return
	d::
		Run, https://www.dcu.org/
		ExitToMainMode()
		Return
	g::
		Run, https://github.com/
		ExitToMainMode()
		Return
	h::
		Run, https://www.hackerrank.com/dashboard
		ExitToMainMode()
		Return
	n::
		Run, https://www.navient.com/
		ExitToMainMode()
		Return
	r::
		Run, https://www.reddit.com/
		ExitToMainMode()
		Return
	s::
		Run, https://www.google.com/
		ExitToMainMode()
		Return

	^s::
	  	clipBoardTemp := Clipboard
	    SendAndSleep("^c", 50)
	  	Run, http://www.google.com/search?q=%clipboard%
	  	Clipboard := clipBoardTemp
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
	t::
	u::
	v::
	w::
	x::
	y::
	z::
		ToolTipReset("Bookmark...", 750)
		Return
#If