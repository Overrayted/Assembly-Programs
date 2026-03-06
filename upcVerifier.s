ASCII_SUB EQU 0x30; used for ascii conversion
UPC_LEN EQU 11; used for loops and last digit location

        AREA assignment5, CODE, READONLY
        ENTRY
        mov r3,#0; loop counter (11 digits so will be decremented)
        mov r4,#0;  Even number store
        mov r5,#0;  Odd number store
        ldr r1,=UPC; start location of upc code
        
COUNTER ldrb r2,[r1,r3];      UPC[r3] index at r3 essentially like indexing in C
        sub r2,r2,#ASCII_SUB; subract 30 to go from ascii to hex (to be able to work with number)
      
        tst r3,#1; test if the iteration is odd or even
        addne r4,r4,r2;   add to even (this is for every second number from 2nd number ie 2,4,6 etc)
        addeq r5,r5,r2;   add to odd (this is for every second number starting at the first)
      
        add r3,r3,#1; increase the counter
        cmp r3,#UPC_LEN;
        blt COUNTER
        
        ldrb r2,[r1,#UPC_LEN]; store last ascii in storage register
        sub r2,r2,#ASCII_SUB; same thing as before subracting this hex to get to hex 
        add r5,r5,r5,lsl#1; Multiply odd sum by 3 
        add r2,r2,r5; add the last digit to the first sum that was multiplied by 3
        add r2,r2,r4; now we add the second sum as well (even indexes)
        
        
DIVIDER sub r2,r2,#10; subtracting 10 from r2 each time in this loop
        cmp r2,#0; compare with 0 to set flags
        bgt DIVIDER; if its greater than 0 continue looping, esentially it runs until less than equal to zero
        
       
        moveq r0,#1; if the Z flag from the last compare in the loop was flipped its divisble by 10
        movne r0,#2; if it wasnt then it is not
        
loop b loop

        AREA assignment5, DATA, READWRITE
UPC DCB "013800150738" ;correct UPC string
UPC2 DCB "060383755577" ;correct UPC string
UPC3 DCB "065633454712" ;correct UPC string
        END