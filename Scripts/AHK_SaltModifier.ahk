;;==============================================================
;; Replacing Caps Lock with Salt modifier (Super Alternate)
;;
;; ijkl         up left down right
   ;; x            cut to storage
   ;; c            copy to storage
   ;; v            peek paste from storage
   ;; z            pop paste from storage
   ;; d            soft dump storage
   ;; D            hard dump storage
   ;; Ctrl d       soft dump all storage
   ;; Ctrl D       hard dump all storage
   ;; Ctrl Alt d   hard dump current storage without paste
   ;; Ctrl Alt D   hard dump all storage without paste
   ;; s            swap clipboard with highlighted
   ;; space        switch between stack and queue for storage modes
   ;; 1-0          select current storage block
   ;; shift 1-0    see top of storage
   ;; ctrl 1-0     see full storage
   ;; q            see current storage number and mode (stack/queue)
;; u            home
;; o            end
   ;; f            ctrl f, v
   ;; F            ctrl c, f, v
   ;; p            play/pause
   ;; [,]          preveous/next
   ;; {,}          volume up/down
   ;; \            mute
;;
;;==============================================================



CapsLock::SendInput, {Escape}
CapsLock & BackSpace::SendInput, {Delete}
;;==============================================================
;; Arrow keys, home, and end
;;   i    |   ↑
;; j k l  | ← ↓ →
;; u      | Home
;; o      | End
;;==============================================================
CapsLock & i::SendInput, % persistMods("Up")
CapsLock & j::SendInput, % persistMods("Left")
CapsLock & k::SendInput, % persistMods("Down")
CapsLock & l::SendInput, % persistMods("Right")
CapsLock & u::SendInput, % persistMods("Home")
CapsLock & o::SendInput, % persistMods("End")


persistMods(key)
{
	D := ModD("LShift")ModD("LControl")ModD("LAlt")ModD("LWin")ModD("RShift")ModD("RControl")ModD("RAlt")ModD("RWin")
	U := ModU("LShift")ModU("LControl")ModU("LAlt")ModU("LWin")ModU("RShift")ModU("RControl")ModU("RAlt")ModU("RWin")
	Return % D . "{" . key . "}" . U
}

ModD(keyName)
{
	if GetKeyState(keyName) = 1
		Return % "{" . keyName . " down}"
}

ModU(keyName)
{
	if GetKeyState(keyName) = 1
		Return % "{" . keyName . " up}"
}