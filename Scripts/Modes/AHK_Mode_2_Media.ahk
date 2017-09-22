#If (CurrentMode = 2)
	#M::ExitCurrentMode()

	 h::Send {Media_Prev}
	+h::SendAndExit("{Media_Prev}")

	 k::Send {Volume_Up}

	 j::Send {Volume_Down}

	 l::Send {Media_Next}
	+l::SendAndExit("{Media_Next}")

	 m::Send {Volume_Mute}
	+m::SendAndExit("{Volume_Mute}")

	 n::
	+n::
		OpenIfFileExists("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Netflix")
		ExitCurrentMode()
		Return

	 p::Send {Media_Play_Pause}
	+p::SendAndExit("{Media_Play_Pause}")

	 q::Send {Media_Stop}
	+q::SendAndExit("{Media_Stop}")
	
	 s::OpenIfFileExists(Format("{1}{2}", AppData,"\Spotify\Spotify.exe"))
	+s::
		OpenIfFileExists(Format("{1}{2}", AppData,"\Spotify\Spotify.exe"))
		ExitCurrentMode()
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