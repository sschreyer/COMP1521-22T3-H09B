# prints every 3rd num from 24 to 42

main:
	# Locals:
	# t0: int x

count3_loop_init:
	li 	$t0, 24		# int x = 24;
count3_loop_cond:
	bge 	$t0, 42, count3_loop_end	# if (x >= 42) goto count3_loop_end;

count3_loop_body:
	move 	$a0, $t0
	li	$v0, 1
	syscall 		# printf("%d", x);

	li 	$a0, '\n' 
	li 	$v0, 11 
	syscall 		# printf("\n");

	add	$t0, $t0, 3	# x += 3;
	j 	count3_loop_cond	

count3_loop_end:

epilogue:
	li 	$v0, 0 
	jr 	$ra		# return 0;