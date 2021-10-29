# Software for a Raspberry PI and 2065-Z80-programmer

Copy these files onto a PI and type `make`

To verify that your FLASH programmer board is recognized by the Raspberry PI,
use the `i2cdetect` application like this:

```
pi@bot1:~/2065-Z80-programmer/pi $ sudo i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- 24 -- 26 -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --                         
pi@bot1:~/2065-Z80-programmer/pi $ 
```

To program the FLASH, compile your code into a binary file
that begins at absolute address zero and run the flash app:

	flash < mycode.bin
