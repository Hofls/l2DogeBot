; Rewritten standart system functions

; Write to console with new line at the end.
; $message - message to print.
Func ConsoleWriteLn($message)
   ConsoleWrite($message & @CRLF);
EndFunc
