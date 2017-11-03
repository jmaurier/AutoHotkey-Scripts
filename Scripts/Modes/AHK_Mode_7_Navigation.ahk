#If (CurrentMode = 7)
	q::ExitToMainMode()

	u::Up
	h::Left
	j::Down
	k::Right
	y::Home
	i::End

	;;==============================================================
	;; Function keys
	;;==============================================================
	1::F1
	2::F2
	3::F3
	4::F4
	5::F5
	6::F6
	7::F7
	8::F8
	9::F9
	0::F10
	-::F11
	=::F12

	^1::F13
	^2::F14
	^3::F15
	^4::F16
	^5::F17
	^6::F18
	^7::F19
	^8::F20
	^9::F21
	^0::F22
	^-::F23
	^=::F24

	;;==============================================================
	;; Other Functionality
	;;==============================================================
	c::SendInput, ^c
	v::SendInput, ^v
	x::SendInput, ^x

	;Turn off normal typing while in media mode.
	a::
	b::
	d::
	e::
	f::
	g::
	l::
	m::
	o::
	p::
	r::
	s::
	t::
	w::
	z::
		ToolTipReset("Navigation...", 750)
		Return
#If