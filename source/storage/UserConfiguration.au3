; Check/Create/Read/Write user defined options (.ini)
; Use it from GUI to set/get values
; Use it on bot start to initialize all values
#include-once
#include <File.au3>

Local Const $OPTIONS_FILE_NAME = "user_options.ini"
Local Const $CURRENT_DIRECTORY_PATH = @ScriptDir & "\"
Local Const $OPTIONS_FULL_PATH = $CURRENT_DIRECTORY_PATH & $OPTIONS_FILE_NAME
Local Const $OPTIONS_BUTTONS_SECTION = "Buttons"

; Read value from options file by key
; $key - key to seacrh value
; Public function, use otside script only
Func ReadFromOptionsFile($key)
   if (not isOptionsFileExists()) Then
	  createOptionsFile()
   EndIf
   Return IniRead($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, $key, "")
EndFunc

; Write infromation to options file
; $key - key to search
; $value - info to write
; Public function, use otside script only
Func WriteToOptionsFile($key, $value)
   if (not isOptionsFileExists()) Then
	  createOptionsFile()
   EndIf
   IniWrite($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, $key, $value)
EndFunc

; Check option file existance, call it before start work with options
; Private function, use inside script only
Func isOptionsFileExists()
   if (FileExists($OPTIONS_FULL_PATH)) Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc

; Create new options file with full structure
; (rewrite old one if exists).
; Private function, use inside script only
Func createOptionsFile()
   _FileCreate ($OPTIONS_FULL_PATH)
   IniWriteSection($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, "")
	  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, "HealthPotion", "")
	  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, "NextTarget", "")
	  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, "PickUpDrop", "")
	  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, "AutoAttack", "")
EndFunc


