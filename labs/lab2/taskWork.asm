.data
firstNumberPrompt:    .asciiz "enter the first number:"
secondNumberPrompt:    .asciiz "enter the second number:"
thirdNumberPrompt:    .asciiz "enter the third number:"
fourthNumberPrompt:    .asciiz "enter the fourth number:"
resultPrompt:    .asciiz "the average is:"
prompt:  .asciiz "\n"
prompt2:  .asciiz "."

.text
main:
    li $v0, 4                          
    la $a0, firstNumberPrompt                       
    syscall
    li $v0,5
    syscall
    move $t0,$v0

    li $v0, 4                          
    la $a0, secondNumberPrompt                      
    syscall
    li $v0,5
    syscall
    move $t1,$v0

    li $v0, 4                          
    la $a0, thirdNumberPrompt                       
    syscall
    li $v0,5
    syscall
    move $t2,$v0

    li $v0, 4                          
    la $a0, fourthNumberPrompt                      
    syscall
    li $v0,5
    syscall
    move $t3,$v0

    li $v0, 4                          
    la $a0, resultPrompt                       
    syscall

    addu $t0,$t0,$t1
    addu $t1,$t2,$t3
    addu $t0,$t0,$t1

    li   $t4,4            
    divu $t0,$t4      
    mflo $t1              
    mfhi $t0              

    li   $t5,100
    multu $t0,$t5         
    mflo $t0
    divu $t0,$t4
    mflo $t2              

    move $a0,$t1          
    li   $v0,1
    syscall

    li   $v0,4            
    la   $a0,prompt2
    syscall

    move $a0,$t2          
    li   $v0,1
    syscall

    li   $v0,4            
    la   $a0,prompt
    syscall
 exit:
    li $v0,10
    syscall    
    