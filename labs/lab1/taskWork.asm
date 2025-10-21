.data
name: .asciiz "Name: Yassin Mohamed Issa\n"
id: .asciiz "ID: 4086\n"
course: .asciiz "Course: CSE321-Computer-Organization"

.text
main:
 li $v0,4
 la $a0,name
 syscall
 la $a0,id
 syscall
 la $a0,course
 syscall
 li $v0,10
 syscall
    