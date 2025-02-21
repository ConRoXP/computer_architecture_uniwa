#Program that read a string of no more
#than 15 characters and prints it backwards

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
beq $s1, $zero, printLoop1
addi $s0, $s0, 1 #s0 now points to the next character
addi $s3, $s3, 1 #s3++
j loop

#s0 now points to the end of the string
#that's where we begin printing
#incrementing by -1
printLoop1:
subi $s0, $s0, 2
printLoop:
sgt $t0, $s3, $zero
beq $t0, $zero, exit
lb $s1, ($s0)
li $v0, 11
la $a0, ($s1)
syscall

subi $s3, $s3, 1 #s3--
la $s0, -1($s0) #s0 points to the previous char
j printLoop

exit:
li $v0, 10
syscall
