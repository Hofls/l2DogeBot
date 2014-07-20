; Game properties storage
; Use it to initialize properties before work start
; Use it to get information about game process/window/memory

Local $processId
Local $handleWindow
Local $memoryHandle

; Set current game process id, initialize it before work start
; $_processId - process id, (get it by calling ProcessExists()/ProcessList()/WinGetProcess())
Func setProcessId($_processId)
   $processId = $_processId
EndFunc

; Get current game process id
; Only way to get current game pid
Func getProcessId()
   Return $processId
EndFunc

;  Set current game window handle, initialize it before work start
; $_handleWindow - handle window, (get it by calling WinGetHandle()/WinList()))
Func setHandleWindow($_handleWindow)
   $handleWindow = $_handleWindow
EndFunc

; Get current game window handle
; Only way to get current game hwnd
Func getHandleWindow()
   Return $handleWindow
EndFunc

;  Set current game memory handle, initialize it before work start
; $_handleWindow - handle window, (get it by calling _MemoryOpen())
Func setMemoryHandle($_memoryHandle)
   $handleWindow = $_memoryHandle
EndFunc

; Get current game memory handle
; Only way to get current memory handle
Func getMemoryHandle()
   Return $handleWindow
EndFunc