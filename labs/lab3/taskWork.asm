fibo:
    # fib(0) = 0, fib(1) = 1
    beqz $a0, fib0
    li $t0,1
    beq $a0,$t0, fib1

    # initialize
    li $t1,0   # fib(n-2)
    li $t2,1   # fib(n-1)
    li $t3,2   # counter

loop:
    addu $t4,$t1,$t2   # fib(n) = fib(n-2) + fib(n-1)
    move $t1,$t2
    move $t2,$t4
    addi $t3,$t3,1
    ble $t3,$a0,loop

    move $v0,$t4
    jr $ra

fib0:
    li $v0,0
    jr $ra

fib1:
    li $v0,1
    jr $ra

main:
   #1 prepare arguments
   li $a0,8

   #2 caller-save
   addi $sp, $sp ,-4
   sw $ra,0($sp)

   #3 jump fibo
   jal fibo

   #4 restore from register
   lw $ra,0($sp)
   addi $sp,$sp,4

   #5 operations on return
   move $a0,$v0
   li $v0,1
   syscall

returnMain:
jr $ra
