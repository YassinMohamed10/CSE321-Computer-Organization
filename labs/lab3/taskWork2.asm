fib:
    # detect if n < 2
    li $t0,1
    beqz $a0, fibCase0
    ble  $a0,$t0, fibCase1

    # caller-save ra
    addi $sp,$sp,-4
    sw   $ra,0($sp)

    # push n
    addi $sp,$sp,-4
    sw   $a0,0($sp)

    # prepare n-1
    addi $a0,$a0,-1

    # fib(n-1)
    jal fib
    move $t1,$v0

    # restore n
    lw   $a0,0($sp)
    addi $sp,$sp,4

    # prepare n-2
    addi $a0,$a0,-2

    # fib(n-2)
    jal fib
    move $t2,$v0

    # compute fib(n)
    addu $v0,$t1,$t2

    # pop n
    addi $sp,$sp,4

    # restore ra
    lw   $ra,0($sp)
    addi $sp,$sp,4
    jr   $ra


fibCase0:
    li $v0,0
    jr $ra

fibCase1:
    li $v0,1
    jr $ra

main:
   #1 prepare arguments n
   li $a0,7

   #2 caller-save
   addi $sp, $sp ,-4
   sw $ra,0($sp)

   #3 jump fib
   jal fib

   #4 restore from register
   lw $ra,0($sp)
   addi $sp,$sp,4

   #5 operations on return
   move $a0,$v0
   li $v0,1
   syscall

returnMain:
   jr $ra
