#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include "../storage/UserConfiguration.au3"
#include "../storage/UserConfigurationKeysList.au3"
#include "../storage/AcceptableButtons.au3"

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
   $windowSelectForm = GUICreate("Configuration", 180, 200, -1, -1, BitOr($WS_CAPTION, $WS_POPUP, $WS_SYSMENU))

   GUICtrlCreateLabel("Attack:", 5, 10, 70, 20)
   $BoxAttack = GUICtrlCreateCombo("", 130, 10, 40)
   GUICtrlSetData($BoxAttack, $BUTTONS_LIST, ReadFromOptionsFile($CONFIG_KEY_AUTO_ATTACK))

   GUICtrlCreateLabel("Drop pickup:", 5, 40, 70, 20)
   $BoxDrop = GUICtrlCreateCombo("", 130, 40, 40)
   GUICtrlSetData($BoxDrop, $BUTTONS_LIST, ReadFromOptionsFile($CONFIG_KEY_PICKUP_DROP))

   GUICtrlCreateLabel("Next target:", 5, 70, 70, 20)
   $BoxNextTarget = GUICtrlCreateCombo("", 130, 70, 40)
   GUICtrlSetData($BoxNextTarget, $BUTTONS_LIST, ReadFromOptionsFile($CONFIG_KEY_NEXT_TARGET))

   GUICtrlCreateLabel("Health potion:", 5, 100, 70, 20)
   $BoxHealthPotion = GUICtrlCreateCombo("", 130, 100, 40)
   GUICtrlSetData($BoxHealthPotion, $BUTTONS_LIST, ReadFromOptionsFile($CONFIG_KEY_HEALTH_POTION))

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
   WriteToOptionsFile($CONFIG_KEY_AUTO_ATTACK, $attackButton)

   $dropButton = GUICtrlRead($BoxDrop)
   WriteToOptionsFile($CONFIG_KEY_PICKUP_DROP, $dropButton)

   $nextTargetButton = GUICtrlRead($BoxNextTarget)
   WriteToOptionsFile($CONFIG_KEY_NEXT_TARGET, $nextTargetButton)

   $healthPotionButton = GUICtrlRead($BoxHealthPotion)
   WriteToOptionsFile($CONFIG_KEY_HEALTH_POTION, $healthPotionButton)

EndFunc