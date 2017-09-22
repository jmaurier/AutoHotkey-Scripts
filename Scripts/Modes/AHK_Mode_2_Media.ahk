#If (CurrentMode = 2)
	#M::Goto, ExitCurrentMode

	 h::Send {Media_Prev}
	+h::
		Send {Media_Prev}
		Goto, ExitCurrentMode
		Return

	k::Send {Volume_Up}

	j::Send {Volume_Down}

	 l::Send {Media_Next}
	+l::
		Send {Media_Next}
		Goto, ExitCurrentMode
		Return

	 m::Send {Volume_Mute}
	+m::
		Send {Volume_Mute}
		Goto, ExitCurrentMode
		Return

	 n::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Netflix
	+n::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Netflix
		Goto, ExitCurrentMode
		Return
		
	 p::Send {Media_Play_Pause}
	+p::
		Send {Media_Play_Pause}
		Goto, ExitCurrentMode
		Return
	
	 q::Send {Media_Stop}
	+q::
		Send {Media_Stop}
		Goto, ExitCurrentMode
		Return

	 s::Run %AppData%\Spotify\Spotify.exe
	+s::
		Run %AppData%\Spotify\Spotify.exe
		Goto, ExitCurrentMode
		Return
	Delete & s::Process, Close, Spotify.exe

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
	r::
	t::
	u::
	v::
	w::
	x::
	y::
	z::
		ToolTip
		ToolTip,  Media...
		SetTimer, ReSetToolTip, 750
		Return
#If