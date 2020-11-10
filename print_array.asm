# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data

ans:
	.asciiz "The contents of the array are:"
newLine:
	.asciiz "\n"
arr:
	.word 1 2 3 4 5 6 7 8 9 10
	# TODO: Write your initializations here
	
.text
printA:
	move $t0, $a0
	move $t1, $a1 #10
	li $t2, 0 #i

	loop: 
		slt $t3, $t2, $t1
		beq $t3, $zero, exit

		sll $t4, $t2, 2
		add $t5, $t4, $t0
		lw $t6, 0($t5)

		li $v0, 1
		move $a0, $t6
		syscall
		li $v0, 4
		la $a0, newLine
		syscall

		addi, $t2, $t2, 1
    		
		j loop
# TODO: Write your function code here

main:


	li $v0, 4
	la $a0, ans
	syscall

	li $v0, 4
	la $a0, newLine
	syscall

	la $a0, arr
	li $a1, 10
	j printA

	# TODO: Write your main function code here

exit:
	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
