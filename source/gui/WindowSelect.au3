#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>


; Public function, use otside script only
Func GetGameWindowHandleByUser()

   Local $gameWindowHandle = 0

   $windowSelectForm = CreateWindowSelectForm()

   While true
	  ; game window interaction
	  If WinActive("[CLASS:l2UnrealWWindowsViewportWindow]") Then
		 $gameWindowHandle = WinActive("[CLASS:l2UnrealWWindowsViewportWindow]")
		 ExitLoop
	  EndIf
	  ; interface interaction
	  Switch GUIGetMsg()
		 Case $GUI_EVENT_CLOSE
			ExitLoop
	  EndSwitch
   WEnd

   GUIDelete($windowSelectForm)

   Return $gameWindowHandle
EndFunc

; Private function, use inside script only
Func CreateWindowSelectForm()
   $windowSelectForm = GUICreate("Select game window", 180, 40, -1, -1, BitOr($WS_CAPTION, $WS_POPUP, $WS_SYSMENU))
   GUICtrlCreateLabel("Make lineage 2 window active.", 5, 5, 180, 40)
   GUISetState(@SW_SHOW)
   return $windowSelectForm
EndFunc


