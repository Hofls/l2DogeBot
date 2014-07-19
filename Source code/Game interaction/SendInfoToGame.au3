; Send info to the game (button pressing/mouse clicks/dll calls)


; Press the button (for special buttons look at 'Send' documentation)
; $buttonName - name of the button, jeez.
Func pressButton($buttonName)
   ; todo: create script with getHwnd function, which returns chosen game window
   ControlSend(getHwnd(), "", "", $buttonName)
EndFunc

; Click the mouse
; $coordX - x-axis coord
; $coordY - y-axis coord
Func clickMouse($coordX, $coordY)
   ; todo: create script with getHwnd function, which returns chosen game window
   ControlClick(getHwnd(), "", "", "left", 1, $coordX, $coordY)
EndFunc

; Some advanced stuff here, think about it later.
Func callDll()
   ; $res = DllCallAddress("LRESULT", $GetPointerToFunction(), $param, $value)
   ; $res = DllCall("user32.dll", "int", "GetWindowText", "hwnd", $hWnd, "str", "", "int", 32768)
EndFunc
