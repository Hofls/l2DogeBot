; Get data from game, middle level of abstraction
#include-once
#include "SendToGame.au3"
#include "../storage/UserConfiguration.au3"
#include "../storage/UserConfigurationKeysList.au3"

func nextTarget()
   $nextTargetButtonName = ReadFromOptionsFile($CONFIG_KEY_NEXT_TARGET)
   pressButton($nextTargetButtonName)
EndFunc

func randomPredifinedTarget()
   Switch Random(1, 3, 1)
	  Case 1
		 pressButton("F9")
	  Case 2
		 pressButton("F10")
	  Case 3
		 pressButton("F11")
   EndSwitch
EndFunc

func autoAttack()
   $autoAttackButtonName = ReadFromOptionsFile($CONFIG_KEY_AUTO_ATTACK)
   pressButton($autoAttackButtonName)
EndFunc

func dropPickUp()
   $dropPickupButtonName = ReadFromOptionsFile($CONFIG_KEY_PICKUP_DROP)
   $maxPickupAttempts = 4
   For $pickupAttempt = 1 to $maxPickupAttempts Step 1
	  pressButton($dropPickupButtonName)
   Next
EndFunc

func useHealthPotion()
   $useHealthPotionButtonName = ReadFromOptionsFile($CONFIG_KEY_HEALTH_POTION)
   pressButton($useHealthPotionButtonName)
EndFunc

func useManaPotion()
EndFunc

; ...