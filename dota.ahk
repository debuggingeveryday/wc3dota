; #IfWinActive ahk_class explorer.exe
; #MaxThreadsPerHotkey 10
; #SingleInstance, Force
; SetMouseDelay, -1
; #Persistent

dota_id := "48234503"
script_path := "/home/scrubs/PROJECT/wc3dota/script.sh"

; Loop,
; {
;   WinGet, active_id, ID, A
;   ; Run, "notify-send" "%active_id% %dota_id%"
;
;   if (true = true)
;   {
;     Run, "notify-send" "hello"
;   }
;   Sleep, 1000
; }

Home::Suspend
on_bind := TRUE
on_chat := FALSE


on_bind_display_message := (on_bind == TRUE) ? "on" : "off"
Run, "notify-send" "-r" "1" "-t" "0" "Bind: %on_bind_display_message%"

Home::
  Suspend
  on_bind := !on_bind
  on_bind_display_message := (on_bind == TRUE) ? "on" : "off"
  Run, "notify-send" "-r" "1" "-t" "0" "Bind: %on_bind_display_message%"
  if on_bind = FALSE
    on_chat = FALSE
    is_on_chat_display_message := "off"
    Run, "notify-send" "-r" "2" "-t" "0" "Chat: %is_on_chat_display_message%"
return

Enter::
  Send {Enter}
  on_chat := !on_chat
  is_on_chat_display_message := (on_chat == TRUE) ? "on" : "off"
  Msgbox, %is_on_chat_display_message%

  ; on_chat := !on_chat
  ; if on_chat = TRUE
  ;   Msgbox, "yes"
  ;   return
return

; Inventory

!Esc::Reload

!q::
  Send {Numpad7}
return

!w::
  if on_chat = FALSE
    Send {Numpad8}
return

!a::
  if on_chat = FALSE
    Send {Numpad4}
return

!s::
  if on_chat = FALSE
    Send {Numpad5}
return

!z::
  if on_chat = FALSE
    Send {Numpad1}
return

!x::
  if on_chat = FALSE
    Send {Numpad2}
return

; Skill
q::
  if on_chat = FALSE
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "first"
return

w::
  if on_chat = FALSE
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "second"
return

e::
  if on_chat = FALSE
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "third"
return

r::
  if on_chat = FALSE
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "ulti"
return

d::
  if on_chat = FALSE
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "four"
return

f::
  if on_chat = FALSE
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "five"
return

g::
  if on_chat = FALSE
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "special"
return

; LButton::
; MouseClick, left,,, 5
; return

