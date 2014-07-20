## How to find addresses
First at all you must find Max HP value with offsets, cuz it's very simple.

F.e. you must have value like this: 
 - "Engine.dll"+008BB34C
 - Offset 1: FC
 - Offset 2: 610
 - Offset 3: 4E4
 - Offset 4: 34
 - Offset 5: 238

This offsets return you value of Max HP (you will have own offsets).

Having this values we can easly find over.

#### Current HP
Current HP is Max HP offset 5 + 8 (hex).
In my case 238 + 8 = **240**

So final result will be:
 - "Engine.dll"+008BB34C
 - Offset 1: FC
 - Offset 2: 610
 - Offset 3: 4E4
 - Offset 4: 34
 - Offset 5: **240**

#### Max MP
Max HP offset 4 + 300 (hex)

238+300 = **538**

#### Current MP
Max MP offset 4 + 8 (hex)

538+8= **540**

#### Max CP
Max MP offset 4 + 600 (hex)

538+600 = **b38**

#### Current CP
Max CP offset 4 + 8 (hex)

b38+8= **b40**

#### Current EXP
This is return 4 digit number. F.e. 3062. This means hero have 30.62%. 100% = 10000.

Max HP offset 4 + 608 (hex)

238 + 608 = **840**
