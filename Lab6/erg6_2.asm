#Read an integer and display whether it is a multiple of 4
#(hint: the two low-order digits should be 00).

.data
msgY: .asciiz "Multiple"
msgN: .asciiz "!Multiple"

.text
li $v0, 5
syscall
la $s0, ($v0)

#Number AND 3 -> last 2 bits isolated
#If last 2 bits!= 0 then it's not a multiple
#else it is
andi $t0, $s0, 3
bne $t0, $zero, N
li $v0, 4
la $a0, msgY
syscall
j exit
N:
li $v0, 4
la $a0, msgN
syscall
exit:
li $v0, 10
syscall
