;--------------------------------------------------------------
; Git specific hotkeys, hotstrings, ect...
;--------------------------------------------------------------
^#G::Run C:\Program Files\Git\git-bash.exe

;--------------------------------------------------------------
; Hotstrings
;--------------------------------------------------------------
#IfWinActive, MINGW64
	:c*:GA::git add -A
	:c*:GC::git commit
	:c*:GF::git fetch
	:c*:GL::git pull
	:c*:GP::git push
	:c*:GS::git status
#If