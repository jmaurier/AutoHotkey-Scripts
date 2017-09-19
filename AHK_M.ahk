; --------------------------------------------------------------
; AutoHotKey Media Mode
; --------------------------------------------------------------

#[::ModalSwitch( "AHK.exe" )

k::Send {Volume_Up}
j::Send {Volume_Down}
m::Send,{Volume_Mute}
h::Send {Media_Prev}
l::Send {Media_Next}
p::Send {Media_Play_Pause}

s::Run %AppData%\Spotify\Spotify.exe
Delete & s::Process, Close, Spotify.exe

; --------------------------------------------------------------
; Methods
; --------------------------------------------------------------
ModalSwitch( exe )
{
	Run %exe%
	Process, Close, AHK_M.exe
	Return
}