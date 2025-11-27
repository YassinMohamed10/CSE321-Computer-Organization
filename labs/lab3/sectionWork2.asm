factorial_func:
    li $t0,1
    li $t1,1
for:
    mult $t1,$t0
    mflo $t1
    addi $t0,$t0,1
    bgt $t0,$a0,end_Loop
j for

end_Loop:
    move $v0,$t1  

retun_factorial:
    jr $ra
main:
    add $sp,$sp,-4
    sw $ra,0($sp)
    li $a0,5
    jal factorial_func
    move $a0,$v0
    li $v0,1
    syscall
return_main:
    lw $ra,0($sp)
    add $sp,$sp,4
    jr $ra