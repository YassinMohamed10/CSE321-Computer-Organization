.data

prompt: .asciiz "enter the number:"
one: .asciiz "the entered number is equal 1\n"
two: .asciiz "the entered number is equal 2\n"
three: .asciiz "the entered number is equal 3\n"
four: .asciiz "the entered number is equal 4\n"
other: .asciiz "the entered number is not equal (1,2,3,4)\n"

.text
main:
switch:
    li $t1,1
    li $t2,2
    li $t3,3
    li $t4,4
    li $v0,4

    la $a0,prompt
    syscall

    li $v0,5
    syscall
    move $t0,$v0
    beq $t0,$t1,case_1
    beq $t0,$t2,case_2
    beq $t0,$t3,case_3
    beq $t0,$t4,case_4
    j defualt

case_1: 
    li $v0,4
    la $a0,one
    j endSwitch
case_2:
    li $v0,4
    la $a0,two
    j endSwitch
case_3:
    li $v0,4
    la $a0,three
    j endSwitch
case_4: 
    li $v0,4
    la $a0,four
    j endSwitch
defualt: 
    li $v0,4
    la $a0,other
    j endSwitch
endSwitch: li $v0,4
    syscall
exit:
    li $v0,10
    syscall    