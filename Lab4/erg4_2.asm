#Simple program that checks if
#number is positive or negative

.data
msgP: .asciiz "Positive"
msgN: .asciiz "Non Positive"

.text
#Enter int
li $v0, 5
syscall
la $a1, ($v0)
#If int> 0 goto L1
slt $t0, $a1, $zero
beq $t0, $zero, L1
#else print Non Positive
li $v0, 4
la $a0, msgN
syscall
j L2
L1: #Print Positive
li $v0, 4
la $a0, msgP
syscall
L2: #Program termination
li $v0, 10
syscall
