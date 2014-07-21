; Graphical user interface, main script, by click on "start" button initiates bot work
#include <GuiConstantsEx.au3>

; GUI
GUICreate("Lineage 2 Doge", 400, 400)
$buttonStart = GUICtrlCreateButton("Start", 150, 330, 100, 30)

; GUI MESSAGE LOOP
GUISetState(@SW_SHOW)
While 1
   Switch GUIGetMsg()
	  Case $GUI_EVENT_CLOSE
		 Exit
	  Case $buttonStart
		 MsgBox("", "Start", "Go go go") ; bot work start (entry point)
	EndSwitch
WEnd
