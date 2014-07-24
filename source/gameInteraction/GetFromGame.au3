; Get information from game, lowest level of abstraction
; (memory/dllhooks/pixels)
; ScreenCapture/Graphic and Sound management
; #RequireAdmin
#include "../libraries/NomadMemory.au3"
#include "../storage/GameProperties.au3"
#include "../system/SystemFunctions.au3"


; Search from right to left in rectangle
; Use it to get hp/mp bar fullness
Func getFirstColorCoordX($right, $top, $left, $bottom, $color)
   ; Right-to-Left - right < left
   Local $coords = PixelSearch($right, $top, $left, $bottom, $color)
   If Not @error Then
	  return $coords[0]
   Else
	  return 0.
   EndIf

EndFunc

;util --------------------------------------------------------------------

Func GetMouseInfoTwice()
   GetMouseInfo(2500)
   GetMouseInfo(1500)
EndFunc

Func GetMouseInfo($waitMilliseconds)
   Sleep($waitMilliseconds)
   Local $aPos = MouseGetPos()
   ConsoleWriteLn($aPos[0] & ":" & $aPos[1] & " | " & _
				  Hex(PixelGetColor($aPos[0], $aPos[1]), 6))
EndFunc

;memory -------------------------------------------------------------------
; Function returns value from address with offset.
; Parameters:
; 	- $dll - dll name which will be used to find values.
; 	- $offsets - array of ofssets;
; Return: value of memory address.
Func GetMemoryValue($dllName, $offsets)
   $processId = getProcessId()
   $gameMemory = getMemoryHandle()
   $memoryValue = _MemoryModuleGetBaseAddress($processId, $dllName)

   for $offset in $offsets
	  $memoryValue = _MemoryRead($memoryValue + $offset, $gameMemory)
   Next

   return $memoryValue
EndFunc