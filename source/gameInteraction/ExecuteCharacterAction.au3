; Get data from game, middle level of abstraction
#include-once
#include "SendToGame.au3"
#include "../storage/UserConfiguration.au3"
#include "../storage/UserConfigurationKeysList.au3"

func nextTarget()
   $buttonName = ReadFromOptionsFile($CONFIG_KEY_NEXT_TARGET)
   pressButton($buttonKey)
EndFunc

func autoAttack()
   $buttonName = ReadFromOptionsFile($CONFIG_KEY_AUTO_ATTACK)
   $buttonKey = getButtonKeyByName($buttonName)
   pressButton($buttonKey)
EndFunc

func dropPickUp()
   $buttonName = ReadFromOptionsFile($CONFIG_KEY_PICKUP_DROP)
   $buttonKey = getButtonKeyByName($buttonName)
   pressButton($buttonKey)
EndFunc

func useHealthPotion()
   $buttonName = ReadFromOptionsFile($CONFIG_KEY_HEALTH_POTION)
   $buttonKey = getButtonKeyByName($buttonName)
   pressButton($buttonKey)
EndFunc

func useManaPotion()
EndFunc

; ...