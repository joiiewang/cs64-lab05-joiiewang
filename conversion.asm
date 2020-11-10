# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
	li $t0, 0 #z (a0 is x, a1 is y)
	li $t1, 0 #i
	li $t2, 5 #limit for i
	li $t3, 3 #limit for x
	loop:
		slt $t4, $t1, $t2
		beq $t4, $zero, return
		
		add $t4, $a0, $a0
		sub $t4, $t4, $a1
		add $t0, $t0, $t4
		
		slt $t5, $t3, $a0
		beq $t5, $zero, x_less
		addi $a1, $a1, -1

		x_less:
			addi $a0, $a0, 1

		addi $t1, $t1, 1

		j loop
		

return:
	move $v0, $t0
	jr $ra

main:
	li $a0, 5
	li $a1, 7
	jal conv

	move $a0, $v0
	li $v0, 1
	syscall

	# TODO: Write your main function code here

exit:
	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
