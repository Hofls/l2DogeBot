; Send info to the game, lowest level of abstraction
; (button pressing/mouse clicks/dll calls)
#include-once
#include <SendMessage.au3>
#include "../storage/GameProperties.au3"

; Press the button (for special buttons look at 'Send' documentation)
; $buttonName - name of the button, jeez.
Func pressButton($buttonKey)
   _SendMessage(getGameHandleWindow(), $WM_KEYDOWN, $buttonKey)
   Sleep(100)
   _SendMessage(getGameHandleWindow(), $WM_KEYUP, $buttonKey)
EndFunc

; Click the mouse
; $coordX - x-axis coord
; $coordY - y-axis coord
Func clickMouse($coordX, $coordY)
   ControlClick(getGameHandleWindow(), "", "", "left", 1, $coordX, $coordY)
EndFunc
