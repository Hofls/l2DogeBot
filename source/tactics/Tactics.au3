; Tactis template, high level of abstraction
#include-once
#include "../gameInteraction/GetCharacterInfo.au3"
#include "../gameInteraction/ExecuteCharacterAction.au3"

func testAction()

   While True
	  randomPredifinedTarget()
	  if (healthyTargetIsChosen()) Then
		 While (not targetIsDead())
			nextTarget() ; in case if on the way appears other monster
			autoAttack()
		 WEnd
		 dropPickUp()
	  EndIf

	  ; restore
	  if (getCharacterHeatlh() < 80) Then
		 useHealthPotion()
	  EndIf

	  ;rebuff
	  ;if (isTimeToRebuff()) Then
	  ;  useBuffs()
	  ;EndIf

   WEnd

EndFunc
