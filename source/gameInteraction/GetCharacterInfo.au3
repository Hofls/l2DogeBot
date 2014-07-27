; Get character info from game, middle level of abstraction
; All information character have access to (Character params, monsters visible by character, monsters params etc)
#include-once
#include "../storage/UserConfiguration.au3"
#include "../storage/UserConfigurationKeysList.au3"
#include "GetFromGame.au3"

; min 0 max 100
; Public function, use otside script only
func getCharacterHeatlh()
   $fullHealthBarColor = 0xB50018
   $healthPercent = getBarFullness($CONFIG_KEY_HEALTH_BAR_START_X, $CONFIG_KEY_HEALTH_BAR_START_Y, _
								   $CONFIG_KEY_HEALTH_BAR_END_X, $CONFIG_KEY_HEALTH_BAR_END_Y, _
							       $fullHealthBarColor)
   return Int($healthPercent)
EndFunc

; min 0 max 100
; Public function, use otside script only
func getCharacterMana()
   $fullManaBarColor = 0x083CA5
   $manaPercent = getBarFullness($CONFIG_KEY_MANA_BAR_START_X, $CONFIG_KEY_MANA_BAR_START_Y, _
								 $CONFIG_KEY_MANA_BAR_END_X, $CONFIG_KEY_MANA_BAR_END_Y, _
								 $fullManaBarColor)
   return Int($manaPercent)
EndFunc

; min 0 max 100
; Public function, use otside script only
func getTargetHeatlh()
   $targetFullHealthBarColor = 0xE74984
   $targetHeatlhPercent = getBarFullness($CONFIG_KEY_TARGET_HEALTH_BAR_START_X, $CONFIG_KEY_TARGET_HEALTH_BAR_START_Y, _
										 $CONFIG_KEY_TARGET_HEALTH_BAR_END_X, $CONFIG_KEY_TARGET_HEALTH_BAR_END_Y, _
										 $targetFullHealthBarColor)
   return Int($targetHeatlhPercent)
EndFunc

; min 0 max 100
; Private function, use inside script only
func getBarFullness($keyBarStartX, $keyBarStartY, $keyBarEndX, $keyBarEndY, $colorToSearch)

   $barRightBorderX = ReadFromOptionsFile($keyBarEndX)
   $barRightBorderY = ReadFromOptionsFile($keyBarEndY)
   $barLeftBorderX  = ReadFromOptionsFile($keyBarStartX)
   $barLeftBorderY  = ReadFromOptionsFile($keyBarStartY)

   $barFullBorderX = getFirstColorCoordX($barRightBorderX, $barRightBorderY, _
										 $barLeftBorderX,  $barLeftBorderY, _
										 $colorToSearch)

   $percentBarFullness = (($barFullBorderX - $barLeftBorderX) / ($barRightBorderX - $barLeftBorderX)) * 100

   return Int($percentBarFullness)
EndFunc