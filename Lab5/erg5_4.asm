#Program that stores the value 0xabcd in memory locations
#first(a), second(b), third(c), fourth(d) using a loop.

#Here I used a switch statement to assign each digit
#to the correct memory location

#To separate the digits of the hex value, I used bit shifting.

#!Currently this has a few errors in the bit shifting math!
#!In terms of syntax it is correct!
.data
first: .word
second: .word
third: .word
fourth: .word

.text
#s0 keeps track of which digit
#we are currently on (0 to 3)

#s1= 4= total digits
li $s0, -1
li $s1, 4

li $s3, 0x0000abcd

loop:
#while(s0< s1)
addi $s0, $s0, 1 #s0++
slt $t0, $s0, $s1
beq $t0, $zero, exit

switch_$s0:
c0:
bne $s0, $zero, c1 #if(s0 != 0) goto the next switch statement
srl $t0, $s3, 12
sw $t0, first
j loop

c1:
bne $s0, 1, c2 #if(s0 != 1) goto the next switch statement
sll $t0, $s3, 20
srl $t1, $t0, 24
sw $t1, second
j loop

c2:
bne $s0, 2, c3 #if(s0 != 2) goto the next switch statement
sll $t0, $s3, 24
srl $t1, $t0, 28
sw $t1, third
j loop

c3:
bne $s0, 3, exit #if(s0 != 3) goto exit
sll $t0, $s3, 28
srl $t1, $t0, 28
sw $t1, fourth
j exit

exit:
li $v0, 10
syscall
