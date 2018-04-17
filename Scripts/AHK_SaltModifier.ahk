;;==============================================================
;; Replacing Caps Lock with Salt modifier (Super Alternate)
;;==============================================================
;; Navigation
;;==============================================================
;; CapsLock     Escape
;; BackSpace    Delete
;; ijkl         up left down right
;; u            home
;; o            end
;; p            Page Up
;; ;            Page Down
;;==============================================================
;; Advanced Clipboard Features
;;==============================================================
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
;;==============================================================
;; Media features
;;==============================================================
;; \            play/pause
;; |            mute
;; [,]          preveous/next
;; {,}          volume down/up
;;==============================================================

CapsLock::SendInput, {Escape}
CapsLock & BackSpace::SendInput, {Delete}

;;==============================================================
;; Navigation
;; Arrow keys, Home, End, Page Up, and Page Down
;; u i o p     |     H ↑ E PgUp
;; j k l ;     |     ← ↓ → PgDn
;;==============================================================
CapsLock & i::SendInput, % persistGeneralMods("Up")
CapsLock & j::SendInput, % persistGeneralMods("Left")
CapsLock & k::SendInput, % persistGeneralMods("Down")
CapsLock & l::SendInput, % persistGeneralMods("Right")

CapsLock & u::SendInput, % persistGeneralMods("Home")
CapsLock & o::SendInput, % persistGeneralMods("End")

CapsLock & p::SendInput, % persistGeneralMods("PgUp")
CapsLock & SC027::SendInput, % persistGeneralMods("PgDn")

;;==============================================================
;; Media features
;; \            play/pause
;; [,]          preveous/next
;; {,}          volume up/down
;; |            mute
;;==============================================================
#if GetKeyState( "Shift", "P" ) = 0
CapsLock & [::Send {Media_Prev}
CapsLock & ]::Send {Media_Next}
CapsLock & \::Send {Media_Play_Pause}
#if GetKeyState( "Shift", "P" ) = 1
CapsLock & [::Send {Volume_Down}
CapsLock & ]::Send {Volume_Up}
CapsLock & \::Send {Volume_Mute}
#if

;;==============================================================
;; Modifier key utilities
;;==============================================================

;; Surround a key with left or right modifiers. e.g. {RCrtl Up}{LShift Up}{x}{LShift Down}{RCtrl Down}
persistPerciseMods(key)
{
	return modifyKey("LShift"
      , modifyKey("LControl"
      , modifyKey("LAlt"
      , modifyKey("LWin"
      , modifyKey("RShift"
      , modifyKey("RControl"
      , modifyKey("RAlt"
      , modifyKey("RWin"
      , "{" . key . "}"))))))))
}

;; Surround a key with general modifiers. e.g. {Crtl Up}{Shift Up}{x}{Shift Down}{Ctrl Down}
persistGeneralMods(key)
{
   Return modifyKey("Shift"
      , modifyKey("Control"
      , modifyKey("Alt"
      , modifyKey("Win"
      , "{" . key . "}"))))
}

modifyKey(modifier, keyCombination)
{
   if GetKeyState(modifier) = 1
      Return % "{" . modifier . " down}" . keyCombination . "{" . modifier . " up}"
   Return keyCombination
}