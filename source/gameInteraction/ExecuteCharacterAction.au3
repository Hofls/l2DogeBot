; Get data from game, middle level of abstraction
#include-once
#include "SendToGame.au3"
#include "../storage/UserConfiguration.au3"
#include "../storage/UserConfigurationKeysList.au3"

func nextTarget()
   $buttonName = ReadFromOptionsFile($CONFIG_KEY_NEXT_TARGET)
   pressButton($buttonName)
EndFunc

func autoAttack()
   $buttonName = ReadFromOptionsFile($CONFIG_KEY_AUTO_ATTACK)
   pressButton($buttonName)
EndFunc

func dropPickUp()
   $buttonName = ReadFromOptionsFile($CONFIG_KEY_PICKUP_DROP)
   pressButton($buttonName)
EndFunc

func useHealthPotion()
   $buttonName = ReadFromOptionsFile($CONFIG_KEY_HEALTH_POTION)
   pressButton($buttonName)
EndFunc

func useManaPotion()
EndFunc

; ...