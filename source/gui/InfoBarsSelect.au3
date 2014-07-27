#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include "../storage/UserConfiguration.au3"
#include "../storage/UserConfigurationKeysList.au3"

;ShowConfigurationForm()

Local $buttonCheckSelection
Local $infoLabel
Local $InfoBarSelectionStage

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
	  EndSwitch
   WEnd
EndFunc

; Private function, use inside script only
Func InfoBarSelect()
   ; Info for user
   Local Const $actionsSequence = "Move cursor to the position, then press 'Space'"
   Local Const $positionMark = "Position: "
   Local Const $heroHealthLeftBorder = "hero health left border."
   Local Const $heroHealthRightBorder = "hero health right border."
   Local Const $heroManaLeftBorder = "hero mana left border."
   Local Const $heroManaRightBorder = "hero mana right border."
   Local Const $targetHealthLeftBorder = "target health left border."
   Local Const $targetHealthRightBorder = "target health right border."
   Local Const $doneMessage = "Selection is over."
   Local $nextStageSelectElement = ""
   ; Mouse array
   Local Const $mouseXindex = 0
   Local Const $mouseYindex = 1
   Local $mouseCoordinates

   Local Const $stagesTotalCount = 7
   $InfoBarSelectionStage = $InfoBarSelectionStage + 1

   ; algorithm: save previous stage cursor position => write new stage message
   $mouseCoordinates = MouseGetPos()
   Switch $InfoBarSelectionStage
	  Case 1
		 $nextStageSelectElement = $heroHealthLeftBorder
	  Case 2
		 WriteToOptionsFile($CONFIG_KEY_HEALTH_BAR_START_X, $mouseCoordinates[$mouseXindex])
		 WriteToOptionsFile($CONFIG_KEY_HEALTH_BAR_START_Y, $mouseCoordinates[$mouseYindex])
		 $nextStageSelectElement = $heroHealthRightBorder
	  Case 3
		 WriteToOptionsFile($CONFIG_KEY_HEALTH_BAR_END_X, $mouseCoordinates[$mouseXindex])
		 WriteToOptionsFile($CONFIG_KEY_HEALTH_BAR_END_Y, $mouseCoordinates[$mouseYindex])
		 $nextStageSelectElement = $heroManaLeftBorder
	  Case 4
		 WriteToOptionsFile($CONFIG_KEY_MANA_BAR_START_X, $mouseCoordinates[$mouseXindex])
		 WriteToOptionsFile($CONFIG_KEY_MANA_BAR_START_Y, $mouseCoordinates[$mouseYindex])
		 $nextStageSelectElement = $heroManaRightBorder
	  Case 5
		 WriteToOptionsFile($CONFIG_KEY_MANA_BAR_END_X, $mouseCoordinates[$mouseXindex])
		 WriteToOptionsFile($CONFIG_KEY_MANA_BAR_END_Y, $mouseCoordinates[$mouseYindex])
		 $nextStageSelectElement = $targetHealthLeftBorder
	  Case 6
		 WriteToOptionsFile($CONFIG_KEY_TARGET_HEALTH_BAR_START_X, $mouseCoordinates[$mouseXindex])
		 WriteToOptionsFile($CONFIG_KEY_TARGET_HEALTH_BAR_START_Y, $mouseCoordinates[$mouseYindex])
		 $nextStageSelectElement = $targetHealthRightBorder
   	  Case $stagesTotalCount
		 WriteToOptionsFile($CONFIG_KEY_TARGET_HEALTH_BAR_END_X, $mouseCoordinates[$mouseXindex])
		 WriteToOptionsFile($CONFIG_KEY_TARGET_HEALTH_BAR_END_Y, $mouseCoordinates[$mouseYindex])
   EndSwitch
   $selectionIsOver = ($InfoBarSelectionStage >= $stagesTotalCount)
   if (not $selectionIsOver) Then
	  GUICtrlSetData($infoLabel, $actionsSequence & " " & $positionMark & " " & $nextStageSelectElement)
   Else
	  GUICtrlSetData($infoLabel, $doneMessage)
   EndIf

EndFunc