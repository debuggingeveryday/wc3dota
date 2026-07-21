;; MY WARCRAFT III DOTA LOD HOTKEY in ahk_x11 (System: Arch Linux)
;; I created this because I've playing with my friends Warcraft III Dota maps and My settings is Dota2 Setup

; #NoEnv
#SingleInstance, Force
; SetKeyDelay, -1, -1

WINDOW_TITLE := "Wine Desktop"
WINDOW_POSITION_X := 0
WINDOW_POSITION_Y := 0
WINDOW_SIZE_HEIGHT := 0
WINDOW_SIZE_WIDTH := 0

COLUMN_ONE := 79.68
COLUMN_TWO := 85.15
COLUMN_THREE := 90.63
COLUMN_FOUR := 96.32

ROW_ONE := 81.94
ROW_TWO := 88.88
ROW_THREE := 95.83

Loop,
{
  IfWinActive, %WINDOW_TITLE%
  {
    WinGetPos, X, Y, Width, Height, A
    MouseGetPos, mouse_x_pos, mouse_y_pos

    WINDOW_POSITION_X := X
    WINDOW_POSITION_Y := Y
    WINDOW_SIZE_HEIGHT := Height
    WINDOW_SIZE_WIDTH := Width

    Echo, "Warcraft III Window Found!"

   ; ;; Debugging
   ;  target_x := WINDOW_SIZE_WIDTH * (COLUMN_ONE / 100)
   ;  target_y := WINDOW_SIZE_HEIGHT * (ROW_THREE / 100)
   ;
   ;  Transform, target_x, Floor, %target_x% 
   ;  Transform, target_y, Floor, %target_y% 
   ;
   ;  ; target_x := (target_x + WINDOW_POSITION_X)
   ;  ; target_y := (target_y + WINDOW_POSITION_Y)
   ;
   ;  target_x := (target_x + 10)
   ;  target_y := (target_y + 10)
   ;
   ;  RunWait, clear
   ;  Echo, "-----------------------------------------"
   ;  Echo, WINDOW_POSITION_X: %WINDOW_POSITION_X%
   ;  Echo, WINDOW_POSITION_Y: %WINDOW_POSITION_Y%
   ;  Echo, WINDOW_SIZE_HEIGHT: %WINDOW_SIZE_HEIGHT%
   ;  Echo, WINDOW_SIZE_WIDTH: %WINDOW_SIZE_WIDTH%
   ;  Echo, MOUSE_X_POSITION: %mouse_x_pos%
   ;  Echo, MOUSE_Y_POSITION: %mouse_y_pos%
   ;  Echo, "------------- Goals -------------------- "
   ;  Echo, GOALS: x - %target_x%  y - %target_y%

    break
  } 
  Sleep, 500
}

on_bind := 1
on_chat := 0

Run, "numlockx" "on"

on_bind_display_message := (on_bind == 1) ? "on" : "off"
Run, "notify-send" "-r" "1" "-t" "0" "Bind: %on_bind_display_message%"

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
return


Esc::
if on_chat = 1
  on_chat := !on_chat
  is_on_chat_display_message := (on_chat == 1) ? "on" : "off"
  Run, "notify-send" "-r" "2" "-t" "0" "Chat: %is_on_chat_display_message%"

Send {Esc}
return

#DefineCommand, SkillTrigger, SkillTriggerFunction
#DefineCommand, SkillOne, SkillOneFunction
#DefineCommand, SkillTwo, SkillTwoFunction
#DefineCommand, SkillThree, SkillThreeFunction
#DefineCommand, SkillUltimate, SkillUltimateFunction
#DefineCommand, SkillFour, SkillFourFunction
#DefineCommand, SkillFive, SkillFiveFunction
#DefineCommand, SkillSpecial, SkillSpecialFunction

SkillTriggerFunction:
  MouseGetPos, mouse_x_pos, mouse_y_pos

  x := WINDOW_SIZE_WIDTH * (A_Param1 / 100)
  y := WINDOW_SIZE_HEIGHT * (A_Param2 / 100)

  Transform, x, Floor, %x% 
  Transform, y, Floor, %y% 

  x := (x + 10)
  y := (y + 10)

  mouse_last_position_x := mouse_x_pos
  mouse_last_position_y := mouse_y_pos

  MouseClick, left, %x%, %y%
  MouseMove, %mouse_last_position_x%, %mouse_last_position_y%
return

SkillOneFunction:
    SkillTrigger, %COLUMN_ONE%, %ROW_THREE%
return

SkillTwoFunction:
    SkillTrigger, %COLUMN_TWO%, %ROW_THREE%
return

SkillThreeFunction:
    SkillTrigger, %COLUMN_THREE%, %ROW_THREE%
return

SkillUltimateFunction:
    SkillTrigger, %COLUMN_FOUR%, %ROW_THREE%
return

SkillFourFunction:
    SkillTrigger, %COLUMN_TWO%, %ROW_TWO%
return

SkillFiveFunction:
    SkillTrigger, %COLUMN_THREE%, %ROW_TWO%
return

SkillSpecialFunction:
    SkillTrigger, %COLUMN_FOUR%, %ROW_TWO%
return

;; SKILLS
q::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  SkillOne

Send {q}
return
}

Send {q}
return

w::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0
  SkillTwo

Send {w}
return
}

Send {w}
return

e::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0
  SkillThree

Send {e}
return
}

Send {e}
return

r::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0
  SkillUltimate

Send {r}
return
}

Send {r}
return

d::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0
  SkillFour

Send {d}
return
}

Send {d}
return

f::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0
  SkillFive

Send {f}
return
}

Send {f}
return

g::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0
  SkillSpecial

Send {g}
return
}

Send {g}
return

;; Inventory
!q::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  Send {Numpad7}
}
return

!w::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  Send {Numpad8}
}
return

!a::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  Send {Numpad4}
return
}
return

!s::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  Send {Numpad5}
}
return

!z::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  Send {Numpad1}
}
return

!x::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  Send {Numpad2}
}
return

m::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  Send {z}

Send {m}
return
}

Send {m}
return

s::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  Send {x}

Send {s}
return
}

Send {s}
return

h::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  Send {c}

Send {h}
return
}

Send {h}
return

a::
IfWinActive, %WINDOW_TITLE%
{
if on_chat = 0 
  Send {v}

Send {a}
return
}
Send {a}
return

!Esc::Reload
Delete::ExitApp
