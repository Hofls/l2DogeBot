#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include "../storage/UserConfiguration.au3"
#include "../storage/UserConfigurationKeysList.au3"

;ShowConfigurationForm()

Local $buttonCheckSelection
Local $infoLabel
Local $InfoBarSelectionStage

ShowInfoBarSelectForm()

; Public function, use otside script only
Func ShowInfoBarSelectForm()
   $InfoBarSelectionStage = 0
   $windowConfigForm = CreateInfoBarSelectForm()
   InfoBarSelectFormInteraction()
   GUIDelete($windowConfigForm)
EndFunc

; Private function, use inside script only
Func CreateInfoBarSelectForm()
   $windowSelectForm = GUICreate("HP/MP Bars selection", 250, 100, -1, -1, BitOr($WS_CAPTION, $WS_POPUP, $WS_SYSMENU))
   $buttonCheckSelection = GUICtrlCreateButton("Check", 80, 10, 100, 30)
   $infoLabel = GUICtrlCreateLabel("Click on 'Check' button when ready", 10, 50, 240, 70)
   GUISetState(@SW_SHOW)
   return $windowSelectForm
EndFunc

; Private function, use inside script only
Func InfoBarSelectFormInteraction()
   While true
	  Switch GUIGetMsg()
		 Case $GUI_EVENT_CLOSE
			ExitLoop
		 Case $buttonCheckSelection
			InfoBarSelect()
			;ExitLoop
	  EndSwitch
   WEnd
EndFunc

; Private function, use inside script only
Func InfoBarSelect()
   ; Info for user
   Local Const $actionsSequence = "Move cursor to the position, then press 'Enter'"
   Local Const $positionMark = "Position: "
   Local Const $heroHealthLeftBorder = "hero health left border."
   Local Const $heroHealthRightBorder = "hero health right border."
   Local Const $heroManaLeftBorder = "hero mana left border."
   Local Const $heroManaRightBorder = "hero mana right border."
   Local Const $targetHealthLeftBorder = "target health left border."
   Local Const $targetHealthRightBorder = "target health right border."
   Local $currentStageSelectedElement = "Not defined yet"
   ; Mouse array
   Local Const $mouseXindex = 0
   Local Const $mouseYindex = 1
   Local $mouseCoordinates

   $InfoBarSelectionStage = $InfoBarSelectionStage + 1

   ; algorithm: read previous stage cursor position => write new stage message
   Switch $InfoBarSelectionStage
	  Case 1
		 $currentStageSelectedElement = $heroHealthLeftBorder
	  Case 2
		 $mouseCoordinates = MouseGetPos()
		 WriteToOptionsFile($CONFIG_KEY_HEALTH_BAR_START_X, $mouseCoordinates[$mouseXindex])
		 WriteToOptionsFile($CONFIG_KEY_HEALTH_BAR_START_Y, $mouseCoordinates[$mouseYindex])
		 $currentStageSelectedElement = $heroHealthRightBorder
	  Case 3
		 $currentStageSelectedElement = $heroManaLeftBorder
   EndSwitch
   GUICtrlSetData($infoLabel, $actionsSequence & " " & $positionMark & " " & $currentStageSelectedElement)

EndFunc