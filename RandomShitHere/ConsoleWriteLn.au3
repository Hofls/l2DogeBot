; Write to console with new line at the end.
; $message - message to print.
Func ConsoleWriteLn($message)
   ConsoleWrite($message & @CRLF);
EndFunc

$proccesses = ProcessList("L2.bin")
For $i = 1 To $proccesses[0][0]
   ConsoleWriteLn($proccesses[$i][1])
Next

