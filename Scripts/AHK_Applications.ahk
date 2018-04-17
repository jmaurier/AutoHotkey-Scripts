; Git bash
^#G::
	if WinExist("MINGW64")
    	WinActivate, MINGW64
    else
    	OpenIfFileExists("C:\Program Files\Git\git-bash.exe")
	Sleep, 100
	Return

; Task Manager
 #`::Run taskmgr

; Close current application
 #x::Send, !{F4}
