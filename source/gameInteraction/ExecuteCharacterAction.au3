; Get data from game, middle level of abstraction
#include-once
#include "SendToGame.au3"



func nextTarget()
   local $VK_F3 = 0x72
   pressButton($VK_F3)
EndFunc

func autoAttack()
   local $VK_F1 = 0x70
   pressButton($VK_F1)
EndFunc

func dropPickUp()
   local $VK_F2 = 0x71
   pressButton($VK_F2)
EndFunc

func useHealthPotion()
   local $VK_F4 = 0x73
   pressButton($VK_F4)
EndFunc

func useManaPotion()
EndFunc



; ...