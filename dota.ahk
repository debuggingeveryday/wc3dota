; #IfWinActive ahk_class explorer.exe
; #MaxThreadsPerHotkey 10
; #SingleInstance, Force
; SetMouseDelay, -1
; #Persistent

dota_id := "48234503"
script_path := "/home/scrubs/PROJECT/wc3dota/script.sh"
WINDOW_TITLE := "Wine Desktop"

on_bind := 1
on_chat := 0

on_bind_display_message := (on_bind == 1) ? "on" : "off"
Run, "notify-send" "-r" "1" "-t" "0" "Bind: %on_bind_display_message%"

; SKILL J K

IfWinActive, %WINDOW_TITLE%
{
Enter::
  on_chat := !on_chat
  is_on_chat_display_message := (on_chat == 1) ? "on" : "off"
  Run, "notify-send" "-r" "2" "-t" "0" "Chat: %is_on_chat_display_message%"

  Send {Enter}
return

+Enter::
  on_chat := !on_chat
  is_on_chat_display_message := (on_chat == 1) ? "on" : "off"
  Run, "notify-send" "-r" "2" "-t" "0" "Chat: %is_on_chat_display_message%"

  Send +{Enter}
return

Esc::
  if on_chat = 1
    on_chat := !on_chat
    is_on_chat_display_message := (on_chat == 1) ? "on" : "off"
    Run, "notify-send" "-r" "2" "-t" "0" "Chat: %is_on_chat_display_message%"

    Send {Esc}
return

; Inventory
!q::
  if on_chat = 0
      Send {Numpad7}
return

!w::
  if on_chat = 0
    Send {Numpad8}
return

!a::
  if on_chat = 0
    Send {Numpad4}
return

!s::
  if on_chat = 0
    Send {Numpad5}
return

!z::
  if on_chat = 0
    Send {Numpad1}
return

!x::
  if on_chat = 0
    Send {Numpad2}
return

; Skill
q::
  if on_chat = 0
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "first"

  Send {q}
return

w::
  if on_chat = 0
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "second"

  Send {w}
return

e::
  if on_chat = 0
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "third"

  Send {e}
return

r::
  if on_chat = 0
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "ulti"

  Send {r}
return

d::
  if on_chat = 0
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "four"

  Send {d}
return

f::
  if on_chat = 0
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "five"

  Send {f}
return

g::
  if on_chat = 0
    Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "special"

  Send {g}
return

}

Home::
  Suspend
  on_bind := !on_bind
  on_bind_display_message := (on_bind == 1) ? "on" : "off"
  Run, "notify-send" "-r" "1" "-t" "0" "Bind: %on_bind_display_message%"

  if on_bind = 0
    on_chat = 0
    is_on_chat_display_message := "off"
    Run, "notify-send" "-r" "2" "-t" "0" "Chat: %is_on_chat_display_message%"
return

!Esc::Reload

; LButton::
; MouseClick, left,,, 5
; return


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

; ; The target function we want to "decorate"
; MyOriginalFunction(name) {
;     MsgBox, Hello, %name%
; }
;
; ; The decorator/wrapper function
; DecoratorWrapper(funcObj, arg1) {
;     MsgBox, Pre-execution logic (Logging, setup, etc.)
;
;     ; Call the original function
;     funcObj.Call(arg1)
;
;     MsgBox, Post-execution logic (Cleanup, etc.)
; }
