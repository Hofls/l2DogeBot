; Send info to the game, lowest level of abstraction
; (button pressing/mouse clicks/dll calls)

#include "../storage/GameProperties.au3"

; Press the button (for special buttons look at 'Send' documentation)
; $buttonName - name of the button, jeez.
Func pressButton($buttonName)
   ControlSend(getHandleWindow(), "", "", $buttonName)
EndFunc

; Click the mouse
; $coordX - x-axis coord
; $coordY - y-axis coord
Func clickMouse($coordX, $coordY)
   ControlClick(getHandleWindow(), "", "", "left", 1, $coordX, $coordY)
EndFunc
