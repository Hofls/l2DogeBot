; Graphical user interface, contains link to other program parts
; by click on "start" button initiates bot work
#include-once
; GUI
#include <GuiConstantsEx.au3>
#include "WindowSelect.au3"
#include "ConfigurationForm.au3"
#include "InfoBarsSelect.au3"
; Storage
#include "../storage/GameProperties.au3"
; Tactics
#include "../tactics/Tactics.au3"

HotKeySet("+{ESC}", "On_Exit")

Local $buttonStart
Local $buttonGameWindowSelect
Local $buttonConfig
Local $buttonInfoBarsSelect

; Start application-user interaction
Func MainFormShow()
   CreateMainForm()
   MainFormInteraction()
EndFunc

; Contain all main form graphic elements
; Private function, use inside script only
Func CreateMainForm()
   GUICreate("l2DogeBot", 300, 150)
   GUICtrlCreateLabel("Press SHIFT+ESC to exit", 10, 10, 150, 20)
   $buttonConfig = GUICtrlCreateButton("Configuration", 50, 30, 100, 30)
   $buttonInfoBarsSelect = GUICtrlCreateButton("Info bars selection", 150, 30, 100, 30)
   $buttonStart = GUICtrlCreateButton("Start", 150, 70, 100, 30)
   $buttonGameWindowSelect = GUICtrlCreateButton("Window selection", 50, 70, 100, 30)
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
		 Case $buttonConfig
			ShowConfigurationForm()
		 Case $buttonInfoBarsSelect
			ShowInfoBarSelectForm()
	  EndSwitch
   WEnd
EndFunc

Func On_Exit()
    Exit
EndFunc
