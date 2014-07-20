#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>

Local $processSelectWindow = GUICreate("Select Lineage 2 process", 125, 200)

; Label for process select list.
GUICtrlCreateLabel("Select your L2 process:", 5, 5)

; SelectList with Lineage 2 processes.
Local $processListSelect = GUICtrlCreateList("", 5, 30, 115, 165)
Local $processes = ProcessList("L2.bin")
Local $processList
For $i = 1 To $processes[0][0]
   $processList &= $processes[$i][1] & "|"
Next
ConsoleWrite($processList)
GUICtrlSetData(-1, $processList)

GUISetState(@SW_SHOW)
While 1
   $selectedProcess = _GUICtrlListBox_GetAnchorIndex($processListSelect)
   If $selectedProcess > 0 Then
	  $selectedProcessId = _GUICtrlListBox_GetText($processListSelect, $selectedProcess)
	  MsgBox($MB_SYSTEMMODAL, "Selected proccess id", $selectedProcessId, 10)
	  ExitLoop
   EndIf

   Switch GUIGetMsg()
	  ; Close button press
	  Case $GUI_EVENT_CLOSE
		 ExitLoop
   EndSwitch
WEnd

GUIDelete($GUI_EVENT_CLOSE)
