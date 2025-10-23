.data

prompt: .asciiz "enter the number:"
zeroPrompt: .asciiz "Zero\n"
lessPrompt: .asciiz "less than zero\n"
morePrompt: .asciiz "more than zero\n"
.text
main:
li $v0,4
    la $a0,prompt
    syscall

    li $v0,5
    syscall

    move $t0,$v0
    beq $t0,$zero,if
    blez $t0,elseif
    bgtz $t0,else
if: li $v0,4
    la $a0,zeroPrompt
    j endif
elseif: li $v0,4
    la $a0,lessPrompt
    j endif
else: li $v0,4
    la $a0,morePrompt
    j endif
endif: li $v0,4
    syscall
exit:
    li $v0,10
    syscall    