; List of acceptable button names
; Use it get any button name, no literals.
#include-once
#include <Array.au3>

Local Const $BUTTONS_LIST = "F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12" ; Used in the gui

Local Const $BUTTON_F1 = "F1"
Local Const $BUTTON_F2 = "F2"
Local Const $BUTTON_F3 = "F3"
Local Const $BUTTON_F4 = "F4"
Local Const $BUTTON_F5 = "F5"
Local Const $BUTTON_F6 = "F6"
Local Const $BUTTON_F7 = "F7"
Local Const $BUTTON_F8 = "F8"
Local Const $BUTTON_F9 = "F9"
Local Const $BUTTON_F10 = "F10"
Local Const $BUTTON_F11 = "F11"
Local Const $BUTTON_F12 = "F12"

Dim Const $BUTTON_KEY_LINK[12][2] = [[$BUTTON_F1,  0x70], _
						             [$BUTTON_F2,  0x71], _
							         [$BUTTON_F3,  0x72], _
							         [$BUTTON_F4,  0x73], _
							         [$BUTTON_F5,  0x74], _
							         [$BUTTON_F6,  0x75], _
							         [$BUTTON_F7,  0x76], _
							         [$BUTTON_F8,  0x77], _
							         [$BUTTON_F9,  0x78], _
							         [$BUTTON_F10, 0x79], _
							         [$BUTTON_F11, 0x7A], _
							         [$BUTTON_F12, 0x7B]]

; Public function, use otside script only
func getButtonKeyByName($buttonName)
   $codeCol = 1
   $row = _ArraySearch($BUTTON_KEY_LINK, $buttonName)
   return $BUTTON_KEY_LINK[$row][$codeCol]
EndFunc
