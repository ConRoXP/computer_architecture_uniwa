#This program prints 5 lines
#with each containing the * char 4 times

.data
char: .byte '*'
charS: .byte '\n'

.text
main:
li $s0, 0
li $s1, 5
li $s3, 4
li $s4, 0

outter_loop:
#while(s0< s1)
slt $t0, $s0, $s1
beq $t0, $zero, exit
inner_loop:
#while(s4< s3)
slt $t0, $s4, $s3
beq $t0, $zero, inner_exit
#print *
li $v0, 11
lb $a0, char
syscall
addi $s4, $s4, 1 #s4++
j inner_loop #goto inner_loop
inner_exit:
#Change line by printing the new line character
li $v0, 11
lb $a0, charS
syscall
addi $s0, $s0, 1 #s0++
li $s4, 0 #reset s4 (s4=0)
j outter_loop #goto outter_loop
exit: li $v0, 10
syscall
