; Check/Create/Read/Write user defined options (.ini)
; Use it from GUI to set/get values
; Use it on bot start to initialize all values
#include-once
#include <File.au3>
#include "UserConfigurationKeysList.au3"

Local Const $OPTIONS_FILE_NAME = "user_options.ini"
Local Const $CURRENT_DIRECTORY_PATH = @ScriptDir & "\"
Local Const $OPTIONS_FULL_PATH = $CURRENT_DIRECTORY_PATH & $OPTIONS_FILE_NAME
Local Const $OPTIONS_MAIN_SECTION = "Main"

; Read value from options file by key
; $key - key to seacrh value
; Public function, use outside script only
Func ReadFromOptionsFile($key)
   if (not isOptionsFileExists()) Then
	  createOptionsFile()
   EndIf
   Return IniRead($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $key, "")
EndFunc

; Write infromation to options file
; $key - key to search
; $value - info to write
; Public function, use outside script only
Func WriteToOptionsFile($key, $value)
   if (not isOptionsFileExists()) Then
	  createOptionsFile()
   EndIf
   IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $key, $value)
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
   IniWriteSection($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, "")
		  ; Buttons
	      IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_AUTO_ATTACK, "")
	      IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_PICKUP_DROP, "")
	      IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_NEXT_TARGET, "")
	      IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_HEALTH_POTION, "")
		  ; Info bars coordinates
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_HEALTH_BAR_START_X, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_HEALTH_BAR_START_Y, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_HEALTH_BAR_END_X, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_HEALTH_BAR_END_Y, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_MANA_BAR_START_X, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_MANA_BAR_START_Y, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_MANA_BAR_END_X, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_MANA_BAR_END_Y, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_TARGET_HEALTH_BAR_START_X, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_TARGET_HEALTH_BAR_START_Y, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_TARGET_HEALTH_BAR_END_X, "")
		  IniWrite($OPTIONS_FULL_PATH, $OPTIONS_MAIN_SECTION, $CONFIG_KEY_TARGET_HEALTH_BAR_END_Y, "")
EndFunc
