;;==============================================================
;; Replacing Caps Lock with Salt modifier (Super Alternate)
;;==============================================================
;; Navigation
;;==============================================================
;; ijkl         up left down right
;; u            home
;; o            end
;; p            Page Up
;; ;            Page Down
;;==============================================================
;; Alernate Modifiers
;;==============================================================
;; Enter        AppsKey
;; CapsLock     Escape
;; BackSpace    Delete
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
   ;; `            switch between stack and queue for storage modes
   ;; 1-0          select current storage block
   ;; shift 1-0    see top of storage
   ;; ctrl 1-0     see full storage
   ;; a            see current storage number and mode (stack/queue)
;;==============================================================
;; Media features
;;==============================================================
;; \            play/pause
;; |            mute
;; [,]          preveous/next
;; {,}          volume down/up
;;==============================================================
;;==============================================================
;; Other Features
;;==============================================================
;; Tab          Delete
;;==============================================================

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
;; Alernate Modifiers
;;==============================================================
;; Enter        AppsKey
;; CapsLock     Escape
;; BackSpace    Delete
;;==============================================================

CapsLock & Enter::SendInput, {AppsKey}
CapsLock::SendInput, {Escape}
CapsLock & BackSpace::SendInput, {Delete}

;;==============================================================
;; Advanced Clipboard Features
;;==============================================================
;; x            cut to storage
CapsLock & x::
Clipboard =
SendInput, ^x
ClipWait
clipindex += 1
clipvar%clipindex% := clipboard
Return

;; c            copy to storage
CapsLock & c::
Clipboard =
SendInput, ^c
ClipWait
clipindex += 1
clipvar%clipindex% := clipboard
Return

;; v            peek paste from storage
CapsLock & v::
clipboard := clipvar%clipindex%
SendInput, ^v
return

;; z            pop paste from storage
CapsLock & z::
clipboard := clipvar%clipindex%
SendInput, ^v
if clipindex > 0
   clipindex -= 1
return

#if GetKeyState( "Ctrl", "P" ) = 0 and GetKeyState( "Alt", "P" ) = 0 and GetKeyState( "Shift", "P" ) = 0
;; d            soft dump storage
CapsLock & d::
SetFormat, float, 06.0
Loop %clipindex%
{
  zindex := SubStr("0000000000" . A_Index, -9)
  clipboard := clipvar%A_Index% . "`r"
  SendInput, ^v
  Sleep, 50
}
Return
;; D            hard dump storage
#if GetKeyState( "Ctrl", "P" ) = 0 and GetKeyState( "Alt", "P" ) = 0 and GetKeyState( "Shift", "P" ) = 1
CapsLock & D::
SetFormat, float, 06.0
Loop %clipindex%
{
  zindex := SubStr("0000000000" . A_Index, -9)
  clipboard := clipvar%A_Index% . "`r"
  SendInput, ^v
  Sleep, 50
}
clipindex = 0
Return
#if GetKeyState( "Ctrl", "P" ) = 1 and GetKeyState( "Alt", "P" ) = 1 and GetKeyState( "Shift", "P" ) = 0
;; Ctrl Alt d   hard dump current storage without paste
CapsLock & d::
clipindex = 0
Return
#if

;; s            swap clipboard with highlighted
CapsLock & s::
pastebackup = %clipboard%
ClipWait, 0.05, 1
clipboard =
ClipWait, 0.05, 1
Send ^c
ClipWait, 0.05, 1
clipboardbackup = %clipboard%
ClipWait, 0.05, 1
clipboard = %pastebackup%
ClipWait, 0.05, 1
Send ^v
clipboard = %clipboardbackup%
ClipWait, 0.05, 1
return

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
;; Other Features
;;==============================================================
CapsLock & Tab::SendInput, {Delete}

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