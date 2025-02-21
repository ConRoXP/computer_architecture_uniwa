#Program that translates given C code to asm
#Found in the lab excercise sheet

.data
arr: .word 1, 15, 0, -3, 99, 48, -17, -9, 20, 15

.text
li $s0, 0 #sum
li $s2, 10 #size
li $s1, 0 #i
la $s5, arr

loop:
slt $t0, $s1, $s2
beq $t0, $zero, exit
lw $s6, ($s5)
add $s0, $s0, $s6
la $s5, 4($s5)
addi $s1, $s1, 1
j loop

exit:
li $v0, 1
la $a0, ($s0)
syscall
li $v0, 10
syscall
