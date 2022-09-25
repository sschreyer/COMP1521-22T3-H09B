	.text
# Squares a number unless the number is too big
# to fit into 32 bytes

SQUARE_MAX = 46340

main:
	# Locals:
	# - $t0: int x 
	# - $t1: int y 

	la	$a0, prompt_str
	li	$v0, 4
	syscall				# printf("Enter a number: ");

	li	$v0, 5
	syscall				#  scanf("%d", &x);

	ble 	$t0, SQUARE_MAX, x_le_square_max	# if (x <= SQUARE_MAX) goto x_le_square_max;

	la 	$a0, too_big_str
	li 	$v0, 4
	syscall 			# printf("square too big for 32 bits\n");

	j 	epilogue 		# goto epilogue;

x_le_square_max:
	mul	$t1, $t0, $t0		# y = x * x;

	move	$a0, $t1
	li	$v0, 1
	syscall				# printf("%d", y);

	li 	$a0, '\n'
	li 	$v0, 11
	syscall				# printf("\n");

epilogue:
	li	$v0, 0
	jr 	$ra

	.data

prompt_str:
	.asciiz "Enter a number: "
too_big_str:
	.asciiz "square too big for 32 bits\n"