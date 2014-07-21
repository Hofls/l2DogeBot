; Get information from game, lowest level of abstraction
; (memory/dllhooks/pixels)
; #RequireAdmin is necessary
#include "../libraries/NomadMemory.au3"
#include "../storage/GameProperties.au3"

#RequireAdmin

; Function returns value from address with offset.
; Parameters:
; 	- $dll - dll name which will be used to find values.
; 	- $offsets - array of ofssets;
; Return: value of memory address.
func GetMemoryValue($dllName, $offsets)
   $processId = getProcessId()
   $gameMemory = getMemoryHandle()
   $memoryValue = _MemoryModuleGetBaseAddress($processId, $dllName)

   for $offset in $offsets
	  $memoryValue = _MemoryRead($memoryValue + $offset, $gameMemory)
   Next

   return $memoryValue
EndFunc

; example, todo: delete
;func getHeatlh()
;   Local $offsets[] = [0x000330B0, 0x42c, 0x740, 0x528, 0x524, 0x670]
;   $dllName = "NWindow.dll"
;   $health =  GetMemoryValue($dllName, $offsets)
;   return $health
;EndFunc