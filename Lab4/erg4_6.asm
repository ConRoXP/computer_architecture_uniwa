#Modification of the previous program
#The number of lines to be printed
#and the '*' contained in them are defined by the user

.data
char: .byte '*'
charN: .byte '\n'
msgL: .asciiz "Enter lines: \n"
msgA: .asciiz "Enter ast: \n"

.text
main:
#Enter number of lines
li $v0, 4
la $a0, msgL
syscall
li $v0, 5
syscall
la $s0, ($v0)
#Enter number of asterisks
#on each line
li $v0, 4
la $a0, msgA
syscall
li $v0, 5
syscall
la $s2, ($v0)
#Loop Counters
li $s1, 0
li $s3, 0

outter_loop:
#while(s1< s0)
slt $t0, $s1, $s0
beq $t0, $zero, exit
inner_loop:
#while(s3< s2)
slt $t0, $s3, $s2
beq $t0, $zero, exit_inner
#print *
li $v0, 11
lb $a0, char
syscall
addi $s3, $s3, 1 #s3++
j inner_loop
exit_inner:
#Print new line
li $v0, 11
lb $a0, charN
syscall
addi $s1, $s1, 1 #s1++
li $s3, 0 #reset s3
j outter_loop
exit:
li $v0, 10
syscall
