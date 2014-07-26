; Graphical user interface, main script, by click on "start" button initiates bot work
#include-once
#include <GuiConstantsEx.au3>
#include "WindowSelect.au3"
#include "../storage/GameProperties.au3"
#include "../tactics/Tactics.au3"

#RequireAdmin

Local $buttonStart, $buttonGameWindowSelect

CreateMainForm()

MainFormInteraction()

; Private function, use inside script only
Func CreateMainForm()
   GUICreate("l2DogeBot", 400, 400)
   $buttonStart = GUICtrlCreateButton("Start", 150, 330, 100, 30)
   $buttonGameWindowSelect = GUICtrlCreateButton("Window selection", 50, 330, 100, 30)
   GUISetState(@SW_SHOW)
EndFunc

; User - Form interaction.
; Private function, use inside script only
Func MainFormInteraction()
   While 1
	  Switch GUIGetMsg()
		 Case $GUI_EVENT_CLOSE
			Exit
		 Case $buttonStart
			   testAction() ; bot work start (entry point)
		 Case $buttonGameWindowSelect
			setGameHandleWindow(GetGameWindowHandleByUser())
			setGameProcessId(WinGetProcess(getGameHandleWindow()))
	  EndSwitch
   WEnd
EndFunc


