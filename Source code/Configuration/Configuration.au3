; Check/Create/Read/Write user defined options (.ini)
; Use it from GUI to set/get values
; Use it on bot start to initialize all values

#include <../Source code/System functions/SystemFunctions.au3>
#include <File.au3>

Local Const $OPTIONS_FILE_NAME = "user_options.ini"
Local Const $CURRENT_DIRECTORY_PATH = @ScriptDir & "\"
Local Const $OPTIONS_FULL_PATH = $CURRENT_DIRECTORY_PATH & $OPTIONS_FILE_NAME
Local Const $OPTIONS_BUTTONS_SECTION = "Buttons"

; Check option file existance, call it before start work with options
Func isOptionsFileExists()
   if (FileExists($OPTIONS_FULL_PATH)) Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc

; Read value from options file by key
; $key - key to seacrh value
Func ReadFromOptionsFile($key)
   Return IniRead($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, $key, "")
EndFunc

; Write infromation to options file (but first, you need to make sure it exists)
; $key - key to search
; $value - info to write
Func WriteToOptionsFile($key, $value)
   IniWrite($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, $key, $value)
EndFunc

; Create new options file with full structure
; (rewrite old one if exists).
Func createOptionsFile()
   _FileCreate ($OPTIONS_FULL_PATH)
   IniWriteSection($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, "")
	  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, "HealthPotion", "")
	  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, "ManaPotion", "")
	  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, "PickUpDrop", "")
	  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_BUTTONS_SECTION, "AutoAttack", "")
EndFunc
