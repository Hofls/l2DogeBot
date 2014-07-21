; Tactis template, high level of abstraction

#include "../gameInteraction/GetCharacterInfo.au3"
#include "../gameInteraction/ExecuteCharacterAction.au3"

while True

   ; battle
   nextTarget()
   if (isTargetChosen()) Then
	  while (not isTargetDead()) Then
		 autoAttack()
	  EndIf
	  dropPickUp()
   EndIf

   ; restore
   if (getHeatlhPercent() < 80) Then
	  useHealthPotion()
   EndIf
   if (getManaPercent() < 70) Then
	  useManaPotion()
   EndIf

   ; rebuff
   if (isTimeToRebuff()) Then
	  useBuffs()
   EndIf

WEnd
; ...