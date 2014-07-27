; Get information from game, lowest level of abstraction
; (memory/dllhooks/pixels)
; ScreenCapture/Graphic and Sound management
; #RequireAdmin
#include-once
#include "../libraries/NomadMemory.au3"
#include "../storage/GameProperties.au3"
#include "../system/SystemFunctions.au3"


; Search from right to left in rectangle
; Use it to get hp/mp bar fullness
Func getFirstColorCoordX($right, $top, $left, $bottom, $color)
   ; extend search area
   $top = $top - 4
   $bottom = $bottom + 4
   Local $coords = PixelSearch($right, $top, $left, $bottom, $color) ; Right-to-Left - PixelSearch(right < left)
   If Not @error Then
	  return $coords[0]
   Else
	  return 0.
   EndIf

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