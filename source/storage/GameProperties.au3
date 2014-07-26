; Game properties storage
; Use it to initialize properties before work start
; Use it to get information about game process/window/memory

Local $gameProcessId
Local $gameHandleWindow
Local $gameMemoryHandle

; Set current game process id, initialize it before work start
; $_processId - process id, (get it by calling ProcessExists()/ProcessList()/WinGetProcess())
Func setGameProcessId($_processId)
   $gameProcessId = $_processId
EndFunc

; Get current game process id
; Only way to get current game pid
Func getGameProcessId()
   Return $gameProcessId
EndFunc

;  Set current game window handle, initialize it before work start
; $_handleWindow - handle window, (get it by calling WinGetHandle()/WinList()))
Func setGameHandleWindow($_handleWindow)
   $gameHandleWindow = $_handleWindow
EndFunc

; Get current game window handle
; Only way to get current game hwnd
Func getGameHandleWindow()
   Return $gameHandleWindow
EndFunc
