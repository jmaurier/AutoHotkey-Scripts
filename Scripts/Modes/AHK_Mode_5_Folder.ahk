#If (CurrentMode = 6)
	;#F::ExitToMainMode()
		;Return

	q::ExitToMainMode()

	w::
		Run, C:\Users\jmaurier\Downloads
		ExitToMainMode()
		Return

	e::
		Run, %A_MyDocuments%
		ExitToMainMode()
		Return

	r::

	a::
	s::
	d::
	f::

	z::
	x::
	c::
	v::
		ToolTipReset("Folder...", 750)
		Return
#If