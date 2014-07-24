; Get character info from game, middle level of abstraction
; All information character have access to (Character params, monsters visible by character, monsters params etc)

#include "GetFromGame.au3"

; min 0 max 100
func getTargetHealth()
   $fullHealthBarColor = 0xE74984
   $fullHealthBorder = getFirstColorCoordX(545, 57, 404, 59, $fullHealthBarColor)
   $percentHealth = (($fullHealthBorder - 404) / (545 - 404)) * 100
   return Int($percentHealth)
EndFunc

; min 0 max 100
func getCharacterHeatlh()
   $fullHealthBarColor = 0xB50018
   $fullHealthBorder = getFirstColorCoordX(370, 80, 25, 75, $fullHealthBarColor)
   $percentHealth = (($fullHealthBorder - 25) / (370 - 25)) * 100
   return Int($percentHealth)
EndFunc

; min 0 max 100
func getCharacterMana()
   $fullManaBarColor = 0x083CA5
   $fullManaBorder = getFirstColorCoordX(370, 85, 25, 95, $fullHealthBarColor)
   $percentMana = (($fullHealthBorder - 25) / (370 - 25)) * 100
   return Int($percentMana)
EndFunc
