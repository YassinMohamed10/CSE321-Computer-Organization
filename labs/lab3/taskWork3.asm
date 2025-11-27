.data
A:  .word 4
B:  .word 6

.text

compute:
    
    addi $sp, $sp, -4
    sw   $s0, 0($sp)

    add  $s0, $a0, $a1      
    sll  $v0, $s0, 1        

    
    lw   $s0, 0($sp)
    addi $sp, $sp, 4

    jr   $ra

main:
    lw   $t0, A
    lw   $t1, B
    li   $s0, 99           
    move $a0, $t0
    move $a1, $t1
    jal  compute

    move $t3, $v0            

    jr $ra
