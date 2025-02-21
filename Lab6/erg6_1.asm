#Read an integer and display whether it is even or odd
#(hint: check the low-order digit).

.data
msgA: .asciiz "Even"
msgP: .asciiz "Odd"

.text
li $v0, 5
syscall
la $s0, ($v0)

#Number AND 0 -> last bit isolated
#If last bit== 0 then it's even
#else it's odd
andi $t0, $s0, 1
beq $t0, $zero, zyg
li $v0, 4
la $a0, msgP
syscall
j exit
zyg:
li $v0, 4
la $a0, msgA
syscall
exit:
li $v0, 10
syscall
