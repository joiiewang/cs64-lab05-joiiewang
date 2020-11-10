# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
routineB:
	li $t1, 5
	li $t2, 4
	move $t0, $a0
	sub $t0, $t0, $t1
	mult $t0, $t2
	mflo $t0
	move $v0, $t0
    # TODO: Write your function code here
	jr $ra
routineA:
	li $t1, 3
	addi $sp, $sp, -4
	sw $ra, 0($sp)
    # TODO: Write your function code here
	move $s0, $a0
	move $s1, $a1
	
	mult $s1, $t1
	mflo $t1

	move $a0, $t1
	jal routineB
	move $t0, $v0


	add $s2, $s0, $s0
	
	add $t0, $t0, $s2

	addi $t0, $t0, -1
	move $a0, $t0
	jal routineB

	lw $ra 0($sp)
	addi $sp, $sp, 4
	jr $ra
main:
	li $a0, 5
	li $a1, 7
	jal routineA

	move $a0, $v0
	li $v0, 1
	syscall
	# TODO: Write your main function code here

exit:

	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
