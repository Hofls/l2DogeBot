#RequireAdmin
#include <NomadMemory.au3>

Func LineageWindowSelected($windowHwnd)
   $hwnd = $windowHwnd
   $pid = WinGetProcess($hwnd)
   ToolTip($pid)
   $gameMemory = _MemoryOpen($pid)
   $gameMemoryValue = _MemoryRead('0x12F2DD38', $gameMemory)
   ConsoleWrite($gameMemoryValue)
EndFunc

While true
   If WinActive("[CLASS:l2UnrealWWindowsViewportWindow]") Then
	  LineageWindowSelected(WinActive("[CLASS:l2UnrealWWindowsViewportWindow]"))
	  ExitLoop
   EndIf
WEnd