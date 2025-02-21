#Read an integer between 0 and 15 and display its binary value
#hint: (check the 4 low-order digits. Use repetition).

.data

.text
li $v0, 5
syscall
la $s0, ($v0)

li $s5, 16
li $s1, 3
loop:
#By using bit shifting the 4 right-most bits
#are isolated and printed
beq $s1, -1, exit
srl $s5, $s5, 1
and $t0, $s0, $s5
srlv $t1, $t0, $s1
subi $s1, $s1, 1

li $v0, 1
la $a0, ($t1)
syscall
j loop
exit:
li $v0, 10
syscall
