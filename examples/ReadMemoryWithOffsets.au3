#RequireAdmin
#include <NomadMemory.au3>

Func LineageWindowSelected($windowHwnd)
   $staticOffset = Dec("008BB34C")
   Local $offset[5]
   $offset[0] = Dec('FC')
   $offset[1] = Dec('610')
   $offset[2] = Dec('4E4')
   $offset[3] = Dec('34')
   $offset[4] = Dec('238')

   $value = LineageReadMemoryOffsets($windowHwnd, $offset, $staticOffset)
   ConsoleWrite($value)
EndFunc

; Function returns value from address with offset.
; Parameters:
; 	- $hwnd - game HWnd;
;	- $offsets - array of ofssets;
;	- $staticOffset - offset which added after dll. F.e. Engine.dll+008BB34C
;					  where 008BB34C is staticOffset.
;	- $type (optional) - return value type. By default dword (4 byte)
;	- $dll (optional) - dll name which will be used to find values.
; Return: value of memory address.
Func LineageReadMemoryOffsets($hwnd, $offsets, $staticOffset, $type = "dword", $dll = "Engine.dll")
   $pid = WinGetProcess($hwnd)
   $gameMemoryBaseAddress = _MemoryModuleGetBaseAddress($pid, $dll)
   $gameMemory = _MemoryOpen($pid)
   ; This is "Engine.dll+008BB34C" address.
   $gameMemoryValue = _MemoryRead($gameMemoryBaseAddress + $staticOffset, $gameMemory)

   $arrayLength = UBound($offsets)
   For $i = 0 to $arrayLength - 1
	  $gameMemoryValue = _MemoryRead($gameMemoryValue + $offsets[$i], $gameMemory)
   Next

   Return $gameMemoryValue
EndFunc

While true
   If WinActive("[CLASS:l2UnrealWWindowsViewportWindow]") Then
	  LineageWindowSelected(WinActive("[CLASS:l2UnrealWWindowsViewportWindow]"))
	  ExitLoop
   EndIf
WEnd