; Inner information storage, for testing/debugging purposes
; Recreate new log every time on work start

#include <FileConstants.au3>
#include <File.au3>

Local Const $LOGS_FILE_NAME = "logs.txt"
Local Const $CURRENT_DIRECTORY_PATH = @ScriptDir & "\"
Local Const $LOGS_FULL_PATH = $CURRENT_DIRECTORY_PATH & $LOGS_FILE_NAME

Local $logsHandle

; Create new logs
Func createLogs()
   _FileCreate ($LOGS_FULL_PATH)
   $logsHandle = FileOpen($LOGS_FULL_PATH, $FO_APPEND)
EndFunc

; Add info to logs
; $message - information to add
Func addToLogs($message)
   FileWriteLine($logsHandle, $message)
EndFunc