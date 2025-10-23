.data
prompt1: .asciiz "enter number of integer:"
prompt2: .asciiz "enter integer:"
result: .asciiz "the average ="
newLine: .asciiz "\n"
dotPrompt: .asciiz"."
.text
main:
    li $v0,4
    la $a0,prompt1
    syscall
    li $v0,5
    syscall
    move $t2,$v0
    bne $t2,$zero,While
nEqualZero:
    li $v0,4
    la $a0,result
    syscall
    li $v0,1
    li $a0,0
    syscall
    li $v0,4
    la $a0,newLine
    syscall
    j exit

While:
    beq $t1,$t2,endWhile
    li $v0,4
    la $a0,prompt2
    syscall
    li $v0,5
    syscall
    add $t0,$t0,$v0
    addi $t1,$t1,1
    j While
endWhile:
    li $v0,4
    la $a0,result
    syscall
    divu $t0,$t2
    mflo $t3
    mfhi $t4
    li $t5,100
    multu $t4,$t5
    mflo $t4
    divu $t4,$t2
    mflo $t4
    li $v0,1
    move $a0,$t3
    syscall
    li $v0,4
    la $a0,dotPrompt
    syscall
    li $v0,1
    move $a0,$t4
    syscall
    li $v0,4
    la $a0,newLine
    syscall

exit:
    li $v0,10
    syscall    