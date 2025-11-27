fact:
    add $sp,$sp,-4
    sw $ra,0($sp)
    li $t0,1
    ble $a0,$t0,fact0or1
    add $sp,$sp,-4
    sw $a0,0($sp)
    addi $a0,$a0,-1

    jal fact
    lw $a0,0($sp)
    addi $sp,$sp,4
    mul $v0,$v0,$a0
    j return_fact

fact0or1:
    move $v0,$t0    

return_fact:

    lw $ra,0($sp)
    add $sp,$sp,4
    jr $ra
    
main:
    add $sp,$sp,-4
    sw $ra,0($sp)
    li $a0,5
    jal fact
    move $a0,$v0
    li $v0,1
    syscall
return_main:
    lw $ra,0($sp)
    add $sp,$sp,4
    jr $ra