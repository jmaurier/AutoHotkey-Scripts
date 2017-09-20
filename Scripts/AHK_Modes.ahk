;--------------------------------------------------------------
; CurrentMode is the global variable that determines what mode
; the user is currently in.
;--------------------------------------------------------------


;--------------------------------------------------------------
; Modes
; 1 = Home
; 2 = Media
;--------------------------------------------------------------
!#M::
	CurrentMode := 2
	ToolTip, --- Media Mode ---, 0, 0
Return

#If (CurrentMode = 2)
	Esc::
	#[::
		CurrentMode := 1
	ToolTip
	Return

	k::Send {Volume_Up}
	j::Send {Volume_Down}
	m::Send {Volume_Mute}
	h::Send {Media_Prev}
	l::Send {Media_Next}
	p::Send {Media_Play_Pause}

	s::Run %AppData%\Spotify\Spotify.exe
	Delete & s::Process, Close, Spotify.exe
#If