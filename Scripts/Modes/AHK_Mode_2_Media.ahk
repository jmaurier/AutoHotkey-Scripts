#If (CurrentMode = 2)
	#M::ExitToMainMode()
		Return
	
	 h::Send {Media_Prev}
	+h::
		SendAndExit("{Media_Prev}")
		Return

	 k::Send {Volume_Up}

	 j::Send {Volume_Down}

	 l::Send {Media_Next}
	+l::
		SendAndExit("{Media_Next}")
		Return

	 m::Send {Volume_Mute}
	+m::
		SendAndExit("{Volume_Mute}")
		Return

	 n::
	+n::
		OpenIfFileExists("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Netflix")
		ExitToMainMode()
		Return

	 p::
	 	Send {Media_Play_Pause}
	 	;SoundGet, OutputVar [, ComponentType, ControlType, DeviceNumber]
	 	Return
	+p::
		SendAndExit("{Media_Play_Pause}")
		Return

	 q::Send {Media_Stop}
	+q::
		SendAndExit("{Media_Stop}")
		Return
	
	 s::
	 	OpenIfFileExists(Format("{1}{2}", AppData,"\Spotify\Spotify.exe"))
	 	Sleep, 100
	 	WinHide, "spotify"
	 	Return
	+s::
		OpenIfFileExists(Format("{1}{2}", AppData,"\Spotify\Spotify.exe"))
		ExitToMainMode()
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
	o::
	r::
	t::
	u::
	v::
	w::
	x::
	y::
	z::
		ToolTipReset("Media...", 750)
		Return
#If