; Get character info from game, middle level of abstraction
; All information character have access to (Character params, monsters visible by character, monsters params etc)
#include-once
#include "../storage/UserConfiguration.au3"
#include "../storage/UserConfigurationKeysList.au3"
#include "GetFromGame.au3"

ConsoleWrite(getTargetHeatlh())

; min 0 max 100
func getCharacterHeatlh()
   $fullHealthBarColor = 0xB50018
   $healthRightBorderX = ReadFromOptionsFile($CONFIG_KEY_HEALTH_BAR_END_X)
   $healthRightBorderY = ReadFromOptionsFile($CONFIG_KEY_HEALTH_BAR_END_Y)
   $healthLeftBorderX  = ReadFromOptionsFile($CONFIG_KEY_HEALTH_BAR_START_X)
   $healthLeftBorderY  = ReadFromOptionsFile($CONFIG_KEY_HEALTH_BAR_START_Y)

   $fullHealthBorderX = getFirstColorCoordX($healthRightBorderX, $healthRightBorderY, _
										   $healthLeftBorderX,  $healthLeftBorderY, _
										   $fullHealthBarColor)

   $percentHealth = (($fullHealthBorderX - $healthLeftBorderX) / ($healthRightBorderX - $healthLeftBorderX)) * 100

   return Int($percentHealth)
EndFunc

; min 0 max 100
func getCharacterMana()
   $fullManaBarColor = 0x083CA5
   $manaRightBorderX = ReadFromOptionsFile($CONFIG_KEY_MANA_BAR_END_X)
   $manaRightBorderY = ReadFromOptionsFile($CONFIG_KEY_MANA_BAR_END_Y)
   $manaLeftBorderX  = ReadFromOptionsFile($CONFIG_KEY_MANA_BAR_START_X)
   $manaLeftBorderY  = ReadFromOptionsFile($CONFIG_KEY_MANA_BAR_START_Y)

   $fullManaBorderX = getFirstColorCoordX($manaRightBorderX, $manaRightBorderY, _
										  $manaLeftBorderX,  $manaLeftBorderY, _
										  $fullManaBarColor)

   $percentMana = (($fullManaBorderX - $manaLeftBorderX) / ($manaRightBorderX - $manaLeftBorderX)) * 100

   return Int($percentMana)
EndFunc

; min 0 max 100
func getTargetHeatlh()
   $targetFullHealthBarColor = 0xE74984
   $healthRightBorderX = ReadFromOptionsFile($CONFIG_KEY_TARGET_HEALTH_BAR_END_X)
   $healthRightBorderY = ReadFromOptionsFile($CONFIG_KEY_TARGET_HEALTH_BAR_END_Y)
   $healthLeftBorderX  = ReadFromOptionsFile($CONFIG_KEY_TARGET_HEALTH_BAR_START_X)
   $healthLeftBorderY  = ReadFromOptionsFile($CONFIG_KEY_TARGET_HEALTH_BAR_START_Y)

   $fullHealthBorderX = getFirstColorCoordX($healthRightBorderX, $healthRightBorderY, _
										   $healthLeftBorderX,  $healthLeftBorderY, _
										   $targetFullHealthBarColor)

   $percentHealth = (($fullHealthBorderX - $healthLeftBorderX) / ($healthRightBorderX - $healthLeftBorderX)) * 100

   return Int($percentHealth)
EndFunc
