# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
	li $t0, 0
	li $t1, 0
	loop:
		add $t2, $a0, $a0
	jr $ra

main:
	li $a0, 5
	li $a1, 7
	jal conv

	# TODO: Write your main function code here

exit:
	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
