#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>

Local $hwnd

Local $processSelectWindow = GUICreate("Select Lineage 2 process", 125, 50)

; Label for process select list.
$processLabel = GUICtrlCreateLabel("Run Lineage 2 and then make window active.", 5, 5, 115, 50)

; Selected lineage windows HWND.
Func LineageWindowSelected($windowHwnd)
   $hwnd = $windowHwnd
   GUICtrlSetData($processLabel, "Selected process HWND: " & $hwnd)
EndFunc

GUISetState(@SW_SHOW)
While true
   If WinActive("[CLASS:l2UnrealWWindowsViewportWindow]") Then
	  LineageWindowSelected(WinActive("[CLASS:l2UnrealWWindowsViewportWindow]"))
   EndIf

   Switch GUIGetMsg()
	  ; Close button press
	  Case $GUI_EVENT_CLOSE
		 ExitLoop
   EndSwitch
WEnd

GUIDelete($GUI_EVENT_CLOSE)