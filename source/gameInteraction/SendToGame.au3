; Send info to the game, lowest level of abstraction
; (button pressing/mouse clicks/dll calls)
#include-once
#include <SendMessage.au3>
#include "../storage/GameProperties.au3"
#include "../storage/AcceptableButtons.au3"

; Press the button (for special buttons look at 'Send' documentation)
; $buttonName - name of the button, jeez.
; ControlClick/_SendMessage(WM_KEYDOWN) is visible by anticheat system
Func pressButton($buttonName)
   $buttonKey = getButtonKeyByName($buttonName)
   _SendMessage(getGameHandleWindow(), $WM_SYSKEYDOWN , $buttonKey)
EndFunc

; Click the mouse
; $coordX - x-axis coord
; $coordY - y-axis coord
Func clickMouse($coordX, $coordY)
   ControlClick(getGameHandleWindow(), "", "", "left", 1, $coordX, $coordY)
EndFunc
