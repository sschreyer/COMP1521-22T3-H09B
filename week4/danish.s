FLAG_ROWS = 6
FLAG_COLS = 12

main:
# row in $t0
# col in $t1

main__row_loop_init:
	li 	$t0, 0		# int row = 0;
main__row_loop_cond:
	bge 	$t0, FLAG_ROWS, main__row_loop_end	# for (int row = 0; row < FLAG_ROWS; row++)

main__row_loop_body:

main__col_loop_init:
	li	$t1, 0		# int col = 0;
main__col_loop_cond:
	bge 	$t1, FLAG_COLS, main__col_loop_end

main__col_loop_body:
	
	mul	$t2, $t0, FLAG_COLS	
	add	$t2, $t2, $t1
	# la	$t4, flag
	# add 	$t4, $t2
	lb	$t3, flag($t2)	# calculate &flag[row][col]

	move	$a0, $t3 
	li	$v0, 11 
	syscall 

main__col_loop_incr:
	addi 	$t1, 1		# col++;
	j	main__col_loop_cond

main__col_loop_end:

	li	$a0, '\n'
	li	$v0, 11
	syscall 		# printf("\n");

main__row_loop_incr:
	addi 	$t0, 1		# row++;
	j 	main__row_loop_cond

main__row_loop_end:

	jr	$ra



.data 
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'