.data                                   
firstNumberPrompt:    .asciiz "enter the first number:"
secondNumberPrompt:    .asciiz "enter the second number:"
resultPrompt:    .asciiz "the result is:"
prompt:  .asciiz "\n"
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
    la $a0, resultPrompt                       
    syscall

    addu $a0,$t0,$t1

    li $v0,1
    syscall

    li $v0, 4                          
    la $a0, prompt                       
    syscall
 exit:
    li $v0,10
    syscall    