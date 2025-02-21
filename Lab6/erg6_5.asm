#Write a program in MIPS symbolic language that will read an integer from 1 to 255.
#Based on this number, it will search the table and display its corresponding two-digit hexadecimal number.

.data
hex: .ascii "0123456789abcdef"
t0: .word
t1: .word

.text
li $v0, 5
syscall
la $s0, ($v0)

#Firstly, the program isolates the 4 most significant digits of the number entered.
#These digits constitute an index in the table to locate the first of the two hexadecimal digits.
#This digit will be read from memory and printed in the I/O window.
andi $t0, $s0, 240
srl $t0, $t0, 4
sw $t0, t0
lb $s5, hex($t0)

#Afterwards, it isolates the 4 least significant digits of the number entered.
#These digits constitute a different index in the table to locate the second of the two hexadecimal digits.
#This digit will be read from memory and printed next to the first.
andi $t1, $s0, 15
sw $t1, t1
lb $s6, hex($t1)

li $v0, 11
la $a0, ($s5)
syscall
li $v0, 11
la $a0, ($s6)
syscall

li $v0, 10
syscall
