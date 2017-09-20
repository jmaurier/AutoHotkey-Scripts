;--------------------------------------------------------------
; CurrentMode is the global variable that determines what mode
; the user is currently in.
;--------------------------------------------------------------


;--------------------------------------------------------------
; Modes
; 1 = Home
; 2 = Media
;--------------------------------------------------------------
#M::
	CurrentMode := 2
	ToolTip
	ToolTip, - Media Mode -
	SetTimer, ReSetToolTip, 750
Return

#If (CurrentMode = 2)
	Esc::
	#[::
	#M::
		CurrentMode := 1
		ToolTip
		ToolTip, - PC Mode -
		SetTimer, ReSetToolTip, 750
		Return

	h::Send {Media_Prev}
	k::Send {Volume_Up}
	j::Send {Volume_Down}
	l::Send {Media_Next}
	m::Send {Volume_Mute}
	p::Send {Media_Play_Pause}

	s::Run %AppData%\Spotify\Spotify.exe
	Delete & s::Process, Close, Spotify.exe

	n::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Netflix
	Delete & n::Process, Close, Netflix

	;Turn off normal typing while in media mode.
	a::
	b::
	c::
	d::
	e::
	f::
	g::
	i::
	o::
	q::
	r::
	t::
	u::
	v::
	w::
	x::
	y::
	z::
		ToolTip
		ToolTip, - Media Mode -
		SetTimer, ReSetToolTip, 750
		Return

#If