#Modification of the previous program
#The user specifies how many times the * char gets printed

.data
char: .byte '*'

.text
li $v0, 5
syscall
la $s0, ($v0)

li $s1, 0
loop: slt $t0, $s1, $s0
beq $t0, $zero, exit
li $v0, 11
lb $a0, char
syscall
addi $s1, $s1, 1
j loop
exit: li $v0, 10
syscall
