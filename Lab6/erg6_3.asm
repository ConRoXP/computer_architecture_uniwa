#Read an integer and display whether it is positive or negative by checking the high-order digit
#(hint: you can shift it to the right).

.data
msgP: .asciiz "Positive"
msgN: .asciiz "Negative"

.text
li $v0, 5
syscall
la $s0, ($v0)

#Shifting right by 28 bits
#High-order bit isolated
#If it is 0 then positive
#else negative
srl $t0, $s0, 28
beq $t0, $zero, P
li $v0, 4
la $a0, msgN
syscall
j exit
P:
li $v0, 4
la $a0, msgP
syscall
exit:
li $v0, 10
syscall
