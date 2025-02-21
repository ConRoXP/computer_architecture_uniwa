#Program that reads a string no more than
#15 characters long and prints how many
#characters it contains

.data
str: .asciiz

.text
#Read string
li $v0, 8
li $a1, 17 #string length= length+2
la $a0, str
syscall
la $s0, ($a0)
#s3 counts the number of characters in the string
li $s3, -1
loop:
#s0 contains the address to the string's first character
#s1 contains the character that s0 points to
#string ends when we hit the '\0' character
lb $s1, 0($s0)
#while(s1!= 0) 
beq $s1, $zero, exit
addi $s0, $s0, 1 #s0 now points to the next character
addi $s3, $s3, 1 #s3++
j loop

exit:
#Print number of characters
li $v0, 1
la $a0, ($s3)
syscall
li $v0, 10
syscall
