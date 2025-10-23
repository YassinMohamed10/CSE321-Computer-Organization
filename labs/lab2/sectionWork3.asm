.data
prompt: .asciiz "enter integer:"
result: .asciiz "the sum ="
newLine: .asciiz "\n"
.text
main:

doWhile:
    li $v0,4
    la $a0,prompt
    syscall
    li $v0,5
    syscall
    move $t0,$v0
    beq $t0,$zero,endDoWhile
    add $t1,$t1,$t0
    j doWhile
endDoWhile:
    li $v0,4
    la $a0,result
    syscall
    li $v0,1
    move $a0,$t1
    syscall
    li $v0,4
    la $a0,newLine
    syscall

exit:
    li $v0,10
    syscall    