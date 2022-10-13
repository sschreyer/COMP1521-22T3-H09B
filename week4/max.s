# Recursive maximum of array function

# Register usage:
# - `a' is in $a0 (only before function call)
# - `length' is in $a1 (only before function call)
# - `first_element' is in $s0
# - `max_so_far' is in $t0 (only after function call)

# s0 & s1 used for a and first_element because they need
# to keep their value across recursive call

max:
max__prologue:
        push    $ra
        push    $s0

max__body:
        move    $t0, $a0                # array in $t0
        move    $t1, $a1                # length in $1

        lw      $s0, ($a0)              # int first_element = array[0];

max__if_eq_one:
        bne     $a1, 1, max__if_ne_one  # if (length == 1) {

        move    $v0, $s0 
        j       max__epilogue           #  return first_element;

max__if_ne_one:

        add     $t0, $t0, 4
        move    $a0, $t0 
        sub     $a1, $t1, 1
        jal     max                     # max(&array[1], length - 1);
        
        move    $t3, $v0                # max_so_far in $t3

max__if_fe_gt_max:
        ble     $s0, $t3, max__if_fe_le_max     # if (first_element > max_so_far) {
        move    $t3, $s0 
        j       max__return_max_so_far

max__if_fe_le_max:
        

max__return_max_so_far:
        move    $v0, $t3                # return max_so_far;
max__epilogue: 
        pop     $s0 
        pop     $ra 

        jr      $ra



# some test code which calls max
main:
        addi    $sp, $sp, -4    # create stack frame
        sw      $ra, 0($sp)     # save return address for after the function call

        la      $a0, array
        li      $a1, 10
        jal     max             # call max(array, 10)

        move    $a0, $v0        # printf ("%d")
        li      $v0, 1
        syscall

        li      $a0, '\n'       # printf("%c", '\n');
        li      $v0, 11
        syscall

                                # clean up stack frame
        lw      $ra, 0($sp)     # restore $ra
        addi    $sp, $sp, 4     # restore sp

        li      $v0, 0          # return 0
        jr      $ra


.data
array:
    .word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1