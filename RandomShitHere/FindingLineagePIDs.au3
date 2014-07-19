; just checking
#include <ConsoleWriteLn.au3>
$proccesses = ProcessList("L2.bin")
For $i = 1 To $proccesses[0][0]
   ConsoleWriteLn($proccesses[$i][1])
Next
