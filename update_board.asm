# Subroutine to update the game board
update_board:
    sub $sp, $sp, 4     # Decrement sp by 4 bytes
    sw $ra, ($sp)       # Store return address in the location pointed to by sp

    # Load the second characters of each coordinate from memory
    la $a0, first_co
    la $a1, second_co
    lb $t5, 0($a0)
    lb $t6, 0($a1)

    beq $t5, $t6, determine_load_address

    la $a3, greater
    lb $t5, 0($a3)
    j determine_load_address

determine_load_address:

    la $t1, a_letter
    lb $t2, 0($t1)
    beq $t2, $t5, load_a

    la $t1, b_letter
    lb $t2, 0($t1)
    beq $t2, $t5, load_b

    la $t1, c_letter
    lb $t2, 0($t1)
    beq $t2, $t5, load_c

    la $t1, d_letter
    lb $t2, 0($t1)
    beq $t2, $t5, load_d

    la $t1, e_letter
    lb $t2, 0($t1)
    beq $t2, $t5, load_e

    la $t1, f_letter
    lb $t2, 0($t1)
    beq $t2, $t5, load_f
    
    la $t1, g_letter
    lb $t2, 0($t1)
    beq $t2, $t5, load_g

update_with_underscore:

    sub $sp, $sp, 4     # Decrement sp by 4 bytes
    sw $ra, ($sp)       # Store return address in the location pointed to by sp

    # Replace spaces with underscores
    li $t4, 0x5F        # ASCII value of underscore

    # Load offset from "greater" variable and multiply by 2
    la $a0, greater
    lb $t0, ($a0)       # Load byte from memory into $t0
    sub $t0, $t0, 48    # Subtract ASCII value of '0' to get actual integer value of offset
    add $t0, $t0, $t0   # Multiply by 2 by adding the same value to itself

    # Compute the memory address where we want to store $t4
    add $t3, $t3, $t0
    sub $t3, $t3, 1     # Decrement memory address by 1 to store underscore one step back

    sb $t4, ($t3)       # Store underscore in first space

    lw $ra, ($sp)       # Load return address from the location pointed to by sp
    add $sp, $sp, 4     # Increment sp by 4 bytes to "pop" the return address off the stack
    jr $ra              # Jump to the return address

update_with_pipe:
    
    sub $sp, $sp, 4     # Decrement sp by 4 bytes
    sw $ra, ($sp)       # Store return address in the location pointed to by sp

    # Replace spaces with pipes
    li $t4, 0x7C        # ASCII value of pipe

    # Load offset from "greater" variable and multiply by 2
    la $a0, greater
    lb $t0, ($a0)       # Load byte from memory into $t0
    la $a0, lower
    lb $t1, ($a0)       # Load byte from memory into $t0
    sub $t0, $t0, $t1    # Subtract ASCII value of '0' to get actual integer value of offset

    add $t0, $t0, $t2


    # Compute the memory address where we want to store $t4
    add $t3, $t3, $t0
    

    sb $t4, ($t3)       # Store underscore in first space

    lw $ra, ($sp)       # Load return address from the location pointed to by sp
    add $sp, $sp, 4     # Increment sp by 4 bytes to "pop" the return address off the stack
    jr $ra              # Jump to the return address

determine_num_to_add:
    lb $t5, 1($a0)

    la $t1, num_0
    lb $t2, 1($t1)
    beq $t2, $t5, add_0

    la $t1, num_1
    lb $t2, 1($t1)
    beq $t2, $t5, add_1

    la $t1, num_2
    lb $t2, 1($t1)
    beq $t2, $t5, add_2

    la $t1, num_3
    lb $t2, 1($t1)
    beq $t2, $t5, add_3

    la $t1, num_4
    lb $t2, 1($t1)
    beq $t2, $t5, add_4

    la $t1, num_5
    lb $t2, 1($t1)
    beq $t2, $t5, add_5

    la $t1, num_6
    lb $t2, 1($t1)
    beq $t2, $t5, add_6

    la $t1, num_7
    lb $t2, 1($t1)
    beq $t2, $t5, add_7

    la $t1, num_8
    lb $t2, 1($t1)
    beq $t2, $t5, add_8
    
add_0:

    li $t2, -1

    j update_with_pipe

add_1:

    li $t2, 1

    j update_with_pipe

add_2:

    li $t2, 3

    j update_with_pipe

add_3:

    li $t2, 5

    j update_with_pipe

add_4:

    li $t2, 7

    j update_with_pipe

add_5:

    li $t2, 9

    j update_with_pipe

add_6:

    li $t2, 11

    j update_with_pipe

add_7:

    li $t2, 13

    j update_with_pipe

add_8:

    li $t2, 15

    j update_with_pipe

load_a:
    # Load address of string into $t3
    la $t3, a
    
    lb $t5, 0($a0)
    lb $t6, 0($a1)
    beq $t5, $t6, update_with_underscore

    j determine_num_to_add

load_b:
    # Load address of string into $t3
    la $t3, b

    lb $t5, 0($a0)
    lb $t6, 0($a1)
    beq $t5, $t6, update_with_underscore
    
    j determine_num_to_add

load_c:
    # Load address of string into $t3
    la $t3, c

    lb $t5, 0($a0)
    lb $t6, 0($a1)
    beq $t5, $t6, update_with_underscore

    j determine_num_to_add

load_d:
    # Load address of string into $t3
    la $t3, d

    lb $t5, 0($a0)
    lb $t6, 0($a1)
    beq $t5, $t6, update_with_underscore

    j determine_num_to_add

load_e:
    # Load address of string into $t3
    la $t3, e

    lb $t5, 0($a0)
    lb $t6, 0($a1)
    beq $t5, $t6, update_with_underscore

    j determine_num_to_add

load_f:
    # Load address of string into $t3
    la $t3, f

    lb $t5, 0($a0)
    lb $t6, 0($a1)
    beq $t5, $t6, update_with_underscore

    j determine_num_to_add

load_g:
    # Load address of string into $t3
    la $t3, g

    lb $t5, 0($a0)
    lb $t6, 0($a1)
    beq $t5, $t6, update_with_underscore

    j determine_num_to_add

