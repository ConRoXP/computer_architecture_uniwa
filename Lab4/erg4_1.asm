#Simple program that reads an int and
#prints if it is zero or not

.data
msgZ: .asciiz "Zero"
msgN: .asciiz "Non Zero"

.text
main:
#Enter int
li $v0, 5
syscall
la $a1, ($v0)
#If int== 0 goto L1
beq $a1, $zero, L1
#else print not zero
li $v0, 4
la $a0, msgN
syscall
j L2
L1: #Print is zero
li $v0, 4
la $a0, msgZ
syscall
L2: #Program termination
li $v0, 10
syscall