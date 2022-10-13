# A simple MIPS program that will read 10 numbers into an array
N_SIZE = 10

    	.text
main:
	# Locals:
	# int i: $t0

main_scan_loop_init:
	li	$t0, 0				# i = 0;
main_scan_loop_cond:
	bge	$t0, N_SIZE, main_scan_loop_end	#  if (i >= N_SIZE) goto scan_loop_end;	
main_scan_loop_body:

	li 	$v0, 5				# scanf("%d", &numbers[i]);
	syscall 

	la 	$t1, numbers 			# calculate array offset
	mul	$t2, $t0, 4 
	add 	$t2, $t1, $t2 
	sw 	$v0, ($t2)	

	addi 	$t0, 1				# i++;
	j	main_scan_loop_cond			# goto scan_loop_cond;
	
main_scan_loop_end:
	li	$v0, 0 
	jr 	$ra

    	.data
numbers:
	.word 0,0,0,0,0,0,0,0,0,0