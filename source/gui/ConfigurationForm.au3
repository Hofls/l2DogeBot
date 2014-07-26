#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include "../storage/UserConfiguration.au3"

;ShowConfigurationForm()

Local $BoxAttack, $BoxDrop, $BoxNextTarget, $BoxHealthPotion
Local $buttonSave

; Public function, use otside script only
Func ShowConfigurationForm()

   $windowConfigForm = CreateConfigurationForm()

   ConfigurationFormInteraction()

   GUIDelete($windowConfigForm)
EndFunc

; Private function, use inside script only
Func CreateConfigurationForm()
   $ButtonNames = "F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12"
   $windowSelectForm = GUICreate("Configuration", 180, 200, -1, -1, BitOr($WS_CAPTION, $WS_POPUP, $WS_SYSMENU))

   GUICtrlCreateLabel("Attack:", 5, 10, 70, 20)
   $BoxAttack = GUICtrlCreateCombo("", 130, 10, 40)
   GUICtrlSetData($BoxAttack, $ButtonNames)

   GUICtrlCreateLabel("Drop pickup:", 5, 40, 70, 20)
   $BoxDrop = GUICtrlCreateCombo("", 130, 40, 40)
   GUICtrlSetData($BoxDrop, $ButtonNames)

   GUICtrlCreateLabel("Next target:", 5, 70, 70, 20)
   $BoxNextTarget = GUICtrlCreateCombo("", 130, 70, 40)
   GUICtrlSetData($BoxNextTarget, $ButtonNames)

   GUICtrlCreateLabel("Health potion:", 5, 100, 70, 20)
   $BoxHealthPotion = GUICtrlCreateCombo("", 130, 100, 40)
   GUICtrlSetData($BoxHealthPotion, $ButtonNames)

   $buttonSave = GUICtrlCreateButton("Save", 40, 150, 100, 30)

   GUISetState(@SW_SHOW)
   return $windowSelectForm
EndFunc

; Private function, use inside script only
Func ConfigurationFormInteraction()
   While true
	  Switch GUIGetMsg()
		 Case $GUI_EVENT_CLOSE
			ExitLoop
		 Case $buttonSave
			SaveConfiguration()
			ExitLoop
	  EndSwitch
   WEnd
EndFunc

; Private function, use inside script only
Func SaveConfiguration()

   $attackButton = GUICtrlRead($BoxAttack)
   WriteToOptionsFile("AutoAttack", $attackButton)

   $dropButton = GUICtrlRead($BoxDrop)
   WriteToOptionsFile("PickUpDrop", $dropButton)

   $nextTargetButton = GUICtrlRead($BoxNextTarget)
   WriteToOptionsFile("NextTarget", $nextTargetButton)

   $healthPotionButton = GUICtrlRead($BoxHealthPotion)
   WriteToOptionsFile("HealthPotion", $healthPotionButton)

EndFunc