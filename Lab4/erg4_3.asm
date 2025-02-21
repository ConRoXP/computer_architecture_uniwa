#Simple program that prints the * char
#5 times

.data
char: .byte '*'

.text
li $s0, 0
li $s1, 5
loop: slt $t0, $s0, $s1
beq $t0, $zero, exit
li $v0, 11
lb $a0, char
syscall
addi $s0, $s0, 1
j loop
exit: li $v0, 10
syscall
