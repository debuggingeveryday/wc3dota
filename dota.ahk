; #IfWinActive ahk_class explorer.exe
#MaxThreadsPerHotkey 10
#SingleInstance, Force
SetMouseDelay, -1
#Persistent

dota_id := "48234503"

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

; Inventroy
!q::
  Send {Numpad7}
return

!w::
  Send {Numpad8}
return

!a::
  Send {Numpad4}
return

!s::
  Send {Numpad5}
return

!z::
  Send {Numpad1}
return

!x::
  Send {Numpad2}
return

; Skill
q::
  Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "first"
return

w::
  Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "second"
return

e::
  Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "third"
return

r::
  Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "ulti"
return

d::
  Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "four"
return

f::
  Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "five"
return

g::
  Run, "/home/scrubs/PROJECT/wc3dota/script.sh" "special"
return

; LButton::
; MouseClick, left,,, 5
; return

;}

