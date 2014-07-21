#RequireAdmin
#include "Hooking.au3"
#include <WinAPISys.au3>
#include <APIDiagConstants.au3>
#include <Array.au3>
#include <WinAPIDiag.au3>
Global $pString[2] = [0, 0]

Func Start($hwnd)
   $pid = WinGetProcess($hwnd)

   $gameMemoryBaseAddress = _MemoryModuleGetBaseAddress($pid, "Engine.dll")
   $hProc = _MemoryOpen($hwnd & $gameMemoryBaseAddress) ;we have to open the process

   _ArrayDisplay($hProc, _WinAPI_GetExtended())

   ConsoleWrite($hProc)
   $gameFunction = _WinAPI_GetProcAddress($hProc, "?Action_Attack@APawn@@QAEHPAVAActor@@@Z") ;we are reading the address of MessageBoxA in the RAM
   ConsoleWrite($gameFunction)
   ;$callback = DllCallbackRegister("myHookFunc", "none", "dword")
   ;$ptr = DllCallbackGetPtr($callback)
   ;_VirtualProtect(Number($ptr), 94)
   ;$hProc = _MemoryOpen($pid) ;we have to open the process
   ;$hHook = _SetHook(number($gameFunction), 5, Number($ptr), "int;int;int;int", $hProc) ;we are going to hook the MessageBoxA-Function
EndFunc

Func myHookFunc($iParam) ;=>our HookFunction
   ConsoleWrite("W")
   return ;works much better with return
 EndFunc

While true
   If WinActive("[CLASS:l2UnrealWWindowsViewportWindow]") Then
	  Start(WinActive("[CLASS:l2UnrealWWindowsViewportWindow]"))
	  ExitLoop
   EndIf
WEnd
