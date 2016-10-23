	.file	"kernel.c"
	.globl	mousex
	.data
	.align 4
	.type	mousex, @object
	.size	mousex, 4
mousex:
	.long	512
	.globl	mousey
	.align 4
	.type	mousey, @object
	.size	mousey, 4
mousey:
	.long	384
	.globl	mousedeltax
	.section	.bss
	.align 4
	.type	mousedeltax, @object
	.size	mousedeltax, 4
mousedeltax:
	.zero	4
	.globl	mousedeltay
	.align 4
	.type	mousedeltay, @object
	.size	mousedeltay, 4
mousedeltay:
	.zero	4
	.local	mouse_bytes
	.comm	mouse_bytes,3,1
	.local	cycle
	.comm	cycle,4,4
	.globl	mouse_buff
	.align 4
	.type	mouse_buff, @object
	.size	mouse_buff, 4
mouse_buff:
	.zero	4
	.globl	background
	.data
	.align 4
	.type	background, @object
	.size	background, 4
background:
	.long	90
	.comm	tempbuff,4,4
	.comm	offset,4,4
	.globl	width
	.align 4
	.type	width, @object
	.size	width, 4
width:
	.long	1022
	.globl	height
	.align 4
	.type	height, @object
	.size	height, 4
height:
	.long	766
	.comm	general_buff,4,4
	.globl	cx0
	.align 4
	.type	cx0, @object
	.size	cx0, 4
cx0:
	.long	512
	.globl	cx1
	.align 4
	.type	cx1, @object
	.size	cx1, 4
cx1:
	.long	512
	.globl	cy0
	.align 4
	.type	cy0, @object
	.size	cy0, 4
cy0:
	.long	384
	.globl	cy1
	.align 4
	.type	cy1, @object
	.size	cy1, 4
cy1:
	.long	384
	.comm	SMI_CMD,4,4
	.comm	ACPI_ENABLE,1,1
	.comm	ACPI_DISABLE,1,1
	.comm	PM1a_CNT,4,4
	.comm	PM1b_CNT,4,4
	.comm	SLP_TYPa,2,2
	.comm	SLP_TYPb,2,2
	.comm	SLP_EN,2,2
	.comm	SCI_EN,2,2
	.comm	PM1_CNT_LEN,1,1
	.text
	.align 16
	.globl	memcmp_fast
	.type	memcmp_fast, @function
memcmp_fast:
.LFB8:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	24(%esp), %ebx
	movl	16(%esp), %esi
	movl	20(%esp), %edi
	shrl	$2, %ebx
	testl	%ebx, %ebx
	je	.L7
	movl	(%esi), %ecx
	movl	(%edi), %edx
	sall	$2, %ebx
	movl	$4, %eax
	cmpl	%ecx, %edx
	je	.L5
	jmp	.L3
	.align 16
.L6:
	movl	(%esi,%eax), %ecx
	addl	$4, %eax
	movl	-4(%edi,%eax), %edx
	cmpl	%edx, %ecx
	jne	.L3
.L5:
	cmpl	%ebx, %eax
	jne	.L6
.L7:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L3:
	.cfi_restore_state
	cmpl	%edx, %ecx
	sbbl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	orl	$1, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE8:
	.size	memcmp_fast, .-memcmp_fast
	.align 16
	.globl	strtok
	.type	strtok, @function
strtok:
.LFB21:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %edi
	movl	20(%esp), %esi
	testl	%edi, %edi
	je	.L14
	movl	%edi, p.1369
.L15:
	movzbl	(%edi), %ecx
	testb	%cl, %cl
	je	.L17
	xorl	%ebx, %ebx
	.align 16
.L27:
	movl	%esi, %eax
	jmp	.L18
	.align 16
.L20:
	addl	$1, %eax
	testb	%dl, %dl
	je	.L19
.L18:
	movzbl	(%eax), %edx
	cmpb	%cl, %dl
	jne	.L20
	addl	$1, %ebx
	movzbl	(%edi,%ebx), %ecx
	testb	%cl, %cl
	jne	.L27
	.align 16
.L19:
	leal	(%edi,%ebx), %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	je	.L17
	xorl	%edi, %edi
	.align 16
.L28:
	movl	%esi, %edx
	jmp	.L24
	.align 16
.L25:
	addl	$1, %edx
	testb	%cl, %cl
	je	.L44
.L24:
	movzbl	(%edx), %ecx
	cmpb	%bl, %cl
	jne	.L25
.L29:
	addl	%eax, %edi
	cmpl	%edi, %eax
	movl	%edi, p.1369
	je	.L17
	xorl	%edx, %edx
	cmpb	$0, (%edi)
	je	.L26
	leal	1(%edi), %edx
	movb	$0, (%edi)
.L26:
	movl	%edx, p.1369
.L13:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L44:
	.cfi_restore_state
	addl	$1, %edi
	movzbl	(%eax,%edi), %ebx
	testb	%bl, %bl
	jne	.L28
	jmp	.L29
.L14:
	movl	p.1369, %edi
	testl	%edi, %edi
	jne	.L15
	xorl	%eax, %eax
	jmp	.L13
	.align 16
.L17:
	movl	$0, p.1369
	xorl	%eax, %eax
	jmp	.L13
	.cfi_endproc
.LFE21:
	.size	strtok, .-strtok
	.align 16
	.globl	stroccr
	.type	stroccr, @function
stroccr:
.LFB23:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %ecx
	xorl	%eax, %eax
	movzbl	12(%esp), %ebx
	movzbl	(%ecx), %edx
	testb	%dl, %dl
	je	.L45
	.align 16
.L48:
	cmpb	%dl, %bl
	sete	%dl
	addl	$1, %ecx
	movzbl	%dl, %edx
	addl	%edx, %eax
	movzbl	(%ecx), %edx
	testb	%dl, %dl
	jne	.L48
.L45:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE23:
	.size	stroccr, .-stroccr
	.align 16
	.globl	delay
	.type	delay, @function
delay:
.LFB26:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE26:
	.size	delay, .-delay
	.align 16
	.globl	mouse_wait
	.type	mouse_wait, @function
mouse_wait:
.LFB37:
	.cfi_startproc
	cmpb	$0, 4(%esp)
	jne	.L54
	jmp	mouse_wait.part.0
	.align 16
.L54:
	movl	$100000, %edx
	jmp	.L56
	.align 16
.L61:
	subl	$1, %edx
	je	.L53
.L56:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L61
.L53:
	rep ret
	.cfi_endproc
.LFE37:
	.size	mouse_wait, .-mouse_wait
	.align 16
	.globl	mouse_write
	.type	mouse_write, @function
mouse_write:
.LFB38:
	.cfi_startproc
	movl	4(%esp), %ecx
	movl	$100000, %edx
	jmp	.L64
	.align 16
.L75:
	subl	$1, %edx
	je	.L63
.L64:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L75
.L63:
	movl	$-44, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $100
/  0 "" 2
/NO_APP
	movl	$100000, %edx
	jmp	.L66
	.align 16
.L76:
	subl	$1, %edx
	je	.L65
.L66:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L76
.L65:
	movl	%ecx, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $96
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE38:
	.size	mouse_write, .-mouse_write
	.align 16
	.globl	mouse_read
	.type	mouse_read, @function
mouse_read:
.LFB39:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	mouse_wait.part.0
/APP
/  45 "Library/sys.h" 1
	inb $96, %al
/  0 "" 2
/NO_APP
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE39:
	.size	mouse_read, .-mouse_read
	.align 16
	.globl	mouseinit
	.type	mouseinit, @function
mouseinit:
.LFB40:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	$100000, %edx
	jmp	.L81
	.align 16
.L129:
	subl	$1, %edx
	je	.L80
.L81:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L129
.L80:
	movl	$-88, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $100
/  0 "" 2
/NO_APP
	movl	$100000, %edx
	jmp	.L83
	.align 16
.L130:
	subl	$1, %edx
	je	.L82
.L83:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L130
.L82:
	movl	$32, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $100
/  0 "" 2
/NO_APP
	call	mouse_wait.part.0
/APP
/  45 "Library/sys.h" 1
	inb $96, %al
/  0 "" 2
/NO_APP
	orl	$2, %eax
	movl	$100000, %edx
	movl	%eax, %ecx
	jmp	.L85
	.align 16
.L131:
	subl	$1, %edx
	je	.L84
.L85:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L131
.L84:
	movl	$96, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $100
/  0 "" 2
/NO_APP
	movl	$100000, %edx
	jmp	.L87
	.align 16
.L132:
	subl	$1, %edx
	je	.L86
.L87:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L132
.L86:
	movl	%ecx, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $96
/  0 "" 2
/NO_APP
	movl	$100000, %edx
	jmp	.L89
	.align 16
.L133:
	subl	$1, %edx
	je	.L88
.L89:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L133
.L88:
	movl	$-44, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $100
/  0 "" 2
/NO_APP
	movl	$100000, %edx
	jmp	.L91
	.align 16
.L134:
	subl	$1, %edx
	je	.L90
.L91:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L134
.L90:
	movl	$-10, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $96
/  0 "" 2
/NO_APP
	call	mouse_wait.part.0
/APP
/  45 "Library/sys.h" 1
	inb $96, %al
/  0 "" 2
/NO_APP
	movl	$100000, %edx
	jmp	.L93
	.align 16
.L135:
	subl	$1, %edx
	je	.L92
.L93:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L135
.L92:
	movl	$-44, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $100
/  0 "" 2
/NO_APP
	movl	$100000, %edx
	jmp	.L95
	.align 16
.L136:
	subl	$1, %edx
	je	.L94
.L95:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L136
.L94:
	movl	$-12, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $96
/  0 "" 2
/NO_APP
	call	mouse_wait.part.0
/APP
/  45 "Library/sys.h" 1
	inb $96, %al
/  0 "" 2
/NO_APP
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE40:
	.size	mouseinit, .-mouseinit
	.align 16
	.globl	mouse_updater
	.type	mouse_updater, @function
mouse_updater:
.LFB41:
	.cfi_startproc
	movl	cycle, %edx
	cmpl	$2, %edx
	ja	.L142
	.align 16
.L138:
	addl	$mouse_bytes, %edx
	.align 16
.L141:
/APP
/  45 "Library/sys.h" 1
	inb $96, %al
/  0 "" 2
/NO_APP
	movb	%al, (%edx)
	addl	$1, %edx
	cmpl	$mouse_bytes+3, %edx
	jne	.L141
.L142:
	movzbl	mouse_bytes, %eax
	testb	%al, %al
	js	.L139
	testb	$64, %al
	jne	.L139
	testb	$32, %al
	jne	.L145
	movl	mousedeltay, %edx
	orl	$-256, %edx
	movl	%edx, mousedeltay
.L145:
	testb	$16, %al
	jne	.L146
	movl	mousedeltax, %eax
	orl	$-256, %eax
	movl	%eax, mousedeltax
.L146:
	movsbl	mouse_bytes+1, %eax
	movl	%eax, mousedeltax
	movsbl	mouse_bytes+2, %eax
	movl	%eax, mousedeltay
/APP
/  103 "Source/Drivers/mouse/mouse.c" 1
	int $50
/  0 "" 2
/NO_APP
	xorl	%edx, %edx
	jmp	.L138
.L139:
	movl	$0, cycle
	ret
	.cfi_endproc
.LFE41:
	.size	mouse_updater, .-mouse_updater
	.align 16
	.type	print, @function
print:
.LFB42:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	leal	(%eax,%edx), %esi
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	testl	%edx, %edx
	je	.L149
	movl	%eax, %ebx
	.align 16
.L153:
	movsbl	(%ebx), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	addl	$1, %ebx
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	console_putchar
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	cmpl	%ebx, %esi
	jne	.L153
.L149:
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE42:
	.size	print, .-print
	.align 16
	.globl	printf
	.type	printf, @function
printf:
.LFB44:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	multitasking_ON, %eax
	movl	64(%esp), %esi
	testl	%eax, %eax
	leal	68(%esp), %eax
	je	.L157
	movl	%eax, 12(%esp)
	movzbl	(%esi), %eax
	movb	$0, 8(%esp)
	movl	$0, 4(%esp)
.L158:
	testb	%al, %al
	je	.L156
	.align 16
.L176:
	cmpb	$37, %al
	je	.L159
	movzbl	1(%esi), %eax
	leal	1(%esi), %ebx
.L160:
.L161:
	testb	%al, %al
	je	.L162
.L243:
	cmpb	$37, %al
	je	.L162
	leal	2(%esi), %edx
	movl	$1, %edi
	jmp	.L163
	.align 16
.L238:
	cmpb	$37, %al
	je	.L202
.L163:
	movzbl	(%edx), %eax
	addl	$1, %edi
	movl	%edx, %ebx
	addl	$1, %edx
	testb	%al, %al
	jne	.L238
.L202:
	testl	%edi, %edi
	je	.L165
	xorl	%ebp, %ebp
	.align 16
.L166:
	movsbl	(%esi,%ebp), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	addl	$1, %ebp
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	_putchar
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	cmpl	%ebp, %edi
	ja	.L166
.L195:
	movzbl	(%ebx), %eax
.L165:
	addl	%edi, 4(%esp)
	testb	%al, %al
	movl	%ebx, %esi
	jne	.L176
.L156:
	movl	4(%esp), %eax
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L159:
	.cfi_restore_state
	movzbl	1(%esi), %eax
	leal	1(%esi), %edx
	cmpb	$37, %al
	je	.L239
	cmpb	$0, 8(%esp)
	jne	.L196
	cmpb	$99, %al
	je	.L240
	cmpb	$115, %al
	je	.L241
	cmpb	$105, %al
	sete	%bl
	cmpb	$100, %al
	sete	%cl
	orb	%cl, %bl
	jne	.L242
	cmpb	$108, %al
	je	.L203
	cmpb	$120, %al
	movl	%edx, %ebx
	movb	$1, 8(%esp)
	jne	.L161
.L203:
	movl	12(%esp), %ecx
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	leal	2(%esi), %ebx
	movl	%ecx, %eax
	addl	$4, %ecx
	movl	%ecx, 24(%esp)
	pushl	(%eax)
	.cfi_def_cfa_offset 80
	call	_printint
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movzbl	2(%esi), %eax
	movb	$0, 8(%esp)
	movl	%ebx, %esi
	jmp	.L158
	.align 16
.L196:
	testb	%al, %al
	movl	%edx, %ebx
	jne	.L243
.L162:
	movsbl	(%esi), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	movl	$1, %edi
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	_putchar
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	jmp	.L195
	.align 16
.L157:
	movl	%eax, 8(%esp)
	xorl	%edi, %edi
	movl	$0, 4(%esp)
	.align 16
.L178:
	movzbl	(%esi), %eax
	testb	%al, %al
	je	.L156
	cmpb	$37, %al
	je	.L179
	movzbl	1(%esi), %eax
	leal	1(%esi), %ebp
.L180:
.L181:
	cmpb	$37, %al
	je	.L198
.L250:
	testb	%al, %al
	je	.L198
	leal	2(%esi), %eax
	movl	$1, %ebx
	jmp	.L183
	.align 16
.L244:
	cmpb	$37, %dl
	je	.L182
.L183:
	movzbl	(%eax), %edx
	addl	$1, %ebx
	movl	%eax, %ebp
	addl	$1, %eax
	testb	%dl, %dl
	jne	.L244
.L182:
	movl	%esi, %eax
	movl	%ebx, %edx
	movl	%ebp, %esi
	call	print
	addl	%ebx, 4(%esp)
	jmp	.L178
	.align 16
.L179:
	movzbl	1(%esi), %eax
	leal	1(%esi), %edx
	cmpb	$37, %al
	je	.L245
	movl	%edi, %ecx
	testb	%cl, %cl
	jne	.L199
	cmpb	$99, %al
	je	.L246
	cmpb	$115, %al
	je	.L247
	cmpb	$105, %al
	sete	%bl
	cmpb	$100, %al
	sete	%cl
	orb	%cl, %bl
	jne	.L248
	cmpb	$108, %al
	sete	%bl
	cmpb	$120, %al
	sete	%cl
	orb	%cl, %bl
	movl	%ebx, %edi
	jne	.L249
	cmpb	$97, %al
	je	.L204
	cmpb	$76, %al
	je	.L204
	cmpb	$37, %al
	movl	%edx, %ebp
	movl	$1, %edi
	jne	.L250
.L198:
	movl	$1, %ebx
	movl	%esi, %eax
	movl	%ebp, %esi
	movl	%ebx, %edx
	call	print
	addl	%ebx, 4(%esp)
	jmp	.L178
	.align 16
.L199:
	movl	%edx, %ebp
	jmp	.L181
.L239:
	movzbl	2(%esi), %eax
	leal	2(%esi), %ebx
	movl	%edx, %esi
	jmp	.L161
.L245:
	movzbl	2(%esi), %eax
	leal	2(%esi), %ebp
	movl	%edx, %esi
	jmp	.L181
.L249:
	movl	8(%esp), %ecx
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	addl	$2, %esi
	xorl	%edi, %edi
	movl	%ecx, %eax
	addl	$4, %ecx
	movl	%ecx, 20(%esp)
	pushl	(%eax)
	.cfi_def_cfa_offset 80
	call	printint
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	jmp	.L178
.L246:
	movl	8(%esp), %ecx
	movl	$1, %edx
	addl	$2, %esi
	movl	%ecx, %eax
	addl	$4, %ecx
	movl	(%eax), %eax
	movl	%ecx, 8(%esp)
	movb	%al, 31(%esp)
	leal	31(%esp), %eax
	call	print
	jmp	.L178
.L240:
	movl	12(%esp), %ecx
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	leal	2(%esi), %ebx
	movl	%ecx, %eax
	addl	$4, %ecx
	movsbl	(%eax), %eax
	movl	%ecx, 24(%esp)
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	_putchar
	movzbl	2(%esi), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movl	%ebx, %esi
	jmp	.L158
.L242:
	movl	12(%esp), %ecx
	leal	2(%esi), %ebx
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	movl	%ecx, %eax
	addl	$4, %ecx
	movl	%ecx, 24(%esp)
	pushl	(%eax)
	.cfi_def_cfa_offset 80
	call	_printint
	movzbl	2(%esi), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movl	%ebx, %esi
	jmp	.L158
.L248:
	movl	8(%esp), %ecx
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	addl	$2, %esi
	movl	%ecx, %eax
	addl	$4, %ecx
	movl	%ecx, 20(%esp)
	pushl	(%eax)
	.cfi_def_cfa_offset 80
	call	printint
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	jmp	.L178
.L204:
	movl	8(%esp), %ecx
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	addl	$2, %esi
	movl	%ecx, %eax
	addl	$8, %ecx
	movl	%ecx, 20(%esp)
	pushl	(%eax)
	.cfi_def_cfa_offset 80
	call	console_write_dec
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	jmp	.L178
.L247:
	movl	8(%esp), %ecx
	addl	$2, %esi
	xorl	%edx, %edx
	movl	%ecx, %eax
	addl	$4, %ecx
	movl	(%eax), %eax
	movl	%ecx, 8(%esp)
	cmpb	$0, (%eax)
	je	.L189
	.align 16
.L190:
	addl	$1, %edx
	cmpb	$0, (%eax,%edx)
	jne	.L190
.L189:
	call	print
	jmp	.L178
.L241:
	movl	12(%esp), %ecx
	xorl	%ebp, %ebp
	leal	2(%esi), %ebx
	movl	%ecx, %eax
	addl	$4, %ecx
	movl	(%eax), %edx
	movl	%ecx, 12(%esp)
	cmpb	$0, (%edx)
	je	.L237
	.align 16
.L219:
	addl	$1, %ebp
	cmpb	$0, (%edx,%ebp)
	jne	.L219
	movl	%edx, %edi
	addl	%edx, %ebp
	.align 16
.L173:
	movsbl	(%edi), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	addl	$1, %edi
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	_putchar
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	cmpl	%edi, %ebp
	jne	.L173
.L237:
	movzbl	2(%esi), %eax
	movl	%ebx, %esi
	jmp	.L158
	.cfi_endproc
.LFE44:
	.size	printf, .-printf
	.comm	tbuf,32,32
	.globl	bchars
	.data
	.align 4
	.type	bchars, @object
	.size	bchars, 16
bchars:
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	69
	.byte	70
	.text
	.align 16
	.globl	itoa
	.type	itoa, @function
itoa:
.LFB45:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %eax
	movl	20(%esp), %esi
	movl	24(%esp), %ebx
	testl	%eax, %eax
	je	.L258
	xorl	%ecx, %ecx
	cmpl	$16, %esi
	ja	.L258
	.align 16
.L259:
	xorl	%edx, %edx
	movl	%ecx, %edi
	addl	$1, %ecx
	divl	%esi
	movzbl	bchars(%edx), %edx
	movb	%dl, tbuf-1(%ecx)
	testl	%eax, %eax
	jne	.L259
	movl	%ebx, %esi
	leal	tbuf-1(%edi), %eax
	jmp	.L257
	.align 16
.L263:
	movzbl	(%eax), %edx
	subl	$1, %eax
.L257:
	movb	%dl, (%esi)
	addl	$1, %esi
	cmpl	$tbuf-1, %eax
	jne	.L263
	movb	$0, (%ebx,%ecx)
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L258:
	.cfi_restore_state
	movb	$48, (%ebx)
	movb	$0, 1(%ebx)
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE45:
	.size	itoa, .-itoa
	.section	.rodata
.LC0:
	.string	"%s\n"
	.text
	.align 16
	.globl	puts
	.type	puts, @function
puts:
.LFB46:
	.cfi_startproc
	subl	$20, %esp
	.cfi_def_cfa_offset 24
	pushl	24(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC0
	.cfi_def_cfa_offset 32
	call	printf
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE46:
	.size	puts, .-puts
	.comm	consolerow,4,4
	.comm	consolecolumn,4,4
	.comm	console_color,1,1
	.comm	console_dbuffer,4,4
	.comm	console_dbuffer_original,4,4
	.comm	console_dbuffer_limit,4,4
	.globl	console_rows_skipped
	.section	.bss
	.align 4
	.type	console_rows_skipped, @object
	.size	console_rows_skipped, 4
console_rows_skipped:
	.zero	4
	.globl	console_skip
	.align 4
	.type	console_skip, @object
	.size	console_skip, 4
console_skip:
	.zero	4
	.comm	console_buffer,4,4
	.comm	mdbug,4,4
	.comm	vesa,4,4
	.comm	widthVESA,4,4
	.comm	heightVESA,4,4
	.comm	depthVESA,4,4
	.comm	vga_mem,4,4
	.comm	buff,4,4
	.comm	vesa_buff,4,4
	.text
	.align 16
	.globl	console_init
	.type	console_init, @function
console_init:
.LFB49:
	.cfi_startproc
	movl	$0, consolerow
	movl	$0, consolecolumn
	movl	$753664, %eax
	movb	$7, console_color
	movl	$753664, console_buffer
	.align 16
.L267:
	leal	160(%eax), %edx
	.align 16
.L268:
	movl	$1824, %ecx
	addl	$2, %eax
	movw	%cx, -2(%eax)
	cmpl	%edx, %eax
	jne	.L268
	cmpl	$757664, %eax
	jne	.L267
	rep ret
	.cfi_endproc
.LFE49:
	.size	console_init, .-console_init
	.align 16
	.globl	console_putentryat
	.type	console_putentryat, @function
console_putentryat:
.LFB51:
	.cfi_startproc
	movl	16(%esp), %eax
	movl	console_buffer, %edx
	leal	(%eax,%eax,4), %eax
	sall	$4, %eax
	addl	12(%esp), %eax
	leal	(%edx,%eax,2), %ecx
	movzbl	8(%esp), %eax
	sall	$8, %eax
	movl	%eax, %edx
	movsbw	4(%esp), %ax
	orl	%edx, %eax
	movw	%ax, (%ecx)
	ret
	.cfi_endproc
.LFE51:
	.size	console_putentryat, .-console_putentryat
	.align 16
	.globl	console_putchar
	.type	console_putchar, @function
console_putchar:
.LFB52:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	$32, %edx
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %esi
	movl	consolerow, %edi
	movl	consolecolumn, %ebx
	leal	-9(%esi), %eax
	movl	%edi, -28(%ebp)
	leal	(%edi,%edi,4), %edi
	cmpb	$1, %al
	movl	console_buffer, %eax
	cmova	%esi, %edx
	sall	$4, %edi
	addl	%ebx, %edi
	movsbw	%dl, %dx
	leal	(%eax,%edi,2), %edi
	movl	%edi, %ecx
	movzbl	console_color, %edi
	sall	$8, %edi
	orl	%edi, %edx
	movw	%dx, (%ecx)
	leal	1(%ebx), %edx
	cmpl	$80, %edx
	je	.L289
	movl	%esi, %ecx
	cmpb	$10, %cl
	je	.L289
	addl	$6, %ebx
	cmpb	$9, %cl
	cmovne	%edx, %ebx
	movl	%ebx, consolecolumn
.L272:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.L289:
	.cfi_restore_state
	movl	-28(%ebp), %ecx
	movl	$0, consolecolumn
	addl	$1, %ecx
	cmpl	$25, %ecx
	movl	%ecx, consolerow
	jne	.L272
	movl	%esp, -28(%ebp)
	subl	$4336, %esp
	movl	$24, consolerow
	leal	4322(%esp), %ecx
	movl	%esp, -32(%ebp)
	movl	%esp, %edi
	movl	%esp, %edx
	.align 16
.L278:
	xorl	%ebx, %ebx
	addl	$2, %edx
	movw	%bx, -2(%edx)
	cmpl	%ecx, %edx
	jne	.L278
	leal	4000(%eax), %esi
	movl	%eax, %edx
	movl	%eax, -36(%ebp)
	.align 16
.L281:
	leal	160(%edx), %ebx
	movl	%edi, %eax
	.align 16
.L280:
	movzwl	(%edx), %ecx
	addl	$2, %edx
	addl	$2, %eax
	movw	%cx, -2(%eax)
	cmpl	%ebx, %edx
	jne	.L280
	addl	$160, %edi
	cmpl	%edx, %esi
	jne	.L281
	movl	-32(%ebp), %esi
	movl	-36(%ebp), %eax
	leal	160(%esi), %edx
	addl	$4160, %esi
	.align 16
.L284:
	leal	160(%edx), %edi
	movl	%eax, %ecx
	.align 16
.L283:
	movzwl	(%edx), %ebx
	addl	$2, %edx
	addl	$2, %ecx
	movw	%bx, -2(%ecx)
	cmpl	%edx, %edi
	jne	.L283
	addl	$160, %eax
	cmpl	%edi, %esi
	jne	.L284
	movl	-28(%ebp), %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE52:
	.size	console_putchar, .-console_putchar
	.align 16
	.globl	console_write
	.type	console_write, @function
console_write:
.LFB53:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	20(%esp), %eax
	movl	16(%esp), %ebx
	testl	%eax, %eax
	leal	(%ebx,%eax), %esi
	je	.L303
	.align 16
.L307:
	movsbl	(%ebx), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	addl	$1, %ebx
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	console_putchar
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	cmpl	%esi, %ebx
	jne	.L307
.L303:
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE53:
	.size	console_write, .-console_write
	.align 16
	.globl	console_writestring
	.type	console_writestring, @function
console_writestring:
.LFB54:
	.cfi_startproc
	jmp	printf
	.cfi_endproc
.LFE54:
	.size	console_writestring, .-console_writestring
	.align 16
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB55:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	movl	28(%esp), %ebx
	movsbl	%bl, %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	console_putchar
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE55:
	.size	putchar, .-putchar
	.align 16
	.globl	console_write_dec
	.type	console_write_dec, @function
console_write_dec:
.LFB56:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	movl	96(%esp), %ecx
	testl	%ecx, %ecx
	je	.L319
	movl	%ecx, %edx
	xorl	%esi, %esi
	movl	$-858993459, %ebx
	.align 16
.L315:
	movl	%edx, %eax
	addl	$1, %esi
	mull	%ebx
	shrl	$3, %edx
	testl	%edx, %edx
	jne	.L315
	testl	%esi, %esi
	movl	%esi, 8(%esp)
	je	.L329
	movl	8(%esp), %eax
	movl	$1, %ebx
	.align 16
.L316:
	leal	(%ebx,%ebx,4), %ebx
	addl	$1, %edx
	addl	%ebx, %ebx
	cmpl	%edx, %eax
	jne	.L316
	movl	%ebx, %eax
	movl	$-858993459, %edx
	movl	$-858993459, %edi
	mull	%edx
	leal	24(%esp), %eax
	movl	%eax, %ebp
	addl	8(%esp), %ebp
	movl	%eax, 12(%esp)
	shrl	$3, %edx
	movl	%eax, %esi
	movl	%edx, %ebx
	.align 16
.L318:
	movl	%ecx, %eax
	xorl	%edx, %edx
	addl	$1, %esi
	divl	%ebx
	addl	$48, %eax
	movl	%edx, %ecx
	movb	%al, -1(%esi)
	movl	%ebx, %eax
	mull	%edi
	movl	%edx, %ebx
	shrl	$3, %ebx
	cmpl	%esi, %ebp
	jne	.L318
.L314:
	movl	8(%esp), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 108
	movb	$0, 36(%esp,%eax)
	pushl	24(%esp)
	.cfi_def_cfa_offset 112
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L319:
	.cfi_restore_state
	movl	$0, 8(%esp)
.L329:
	leal	24(%esp), %eax
	movl	%eax, 12(%esp)
	jmp	.L314
	.cfi_endproc
.LFE56:
	.size	console_write_dec, .-console_write_dec
	.align 16
	.globl	printint
	.type	printint, @function
printint:
.LFB57:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %esi
	cmpl	$999999999, %esi
	jbe	.L342
	movl	%esi, %edx
	xorl	%ebx, %ebx
	movl	$-858993459, %ecx
	jmp	.L339
	.align 16
.L336:
	movl	%eax, %ebx
.L339:
	movl	%edx, %eax
	mull	%ecx
	leal	1(%ebx), %eax
	shrl	$3, %edx
	testl	%edx, %edx
	jne	.L336
	subl	$8, %ebx
	movl	$1, %ecx
	je	.L334
	.align 16
.L335:
	leal	(%ecx,%ecx,4), %ecx
	addl	$1, %edx
	addl	%ecx, %ecx
	cmpl	%edx, %ebx
	jne	.L335
.L334:
	movl	%esi, %eax
	xorl	%edx, %edx
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	divl	%ecx
	pushl	%eax
	.cfi_def_cfa_offset 32
	movl	%edx, %esi
	call	console_write_dec
	movl	%esi, 32(%esp)
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	console_write_dec
	.align 16
.L342:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -12
	.cfi_offset 6, -8
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	console_write_dec
	.cfi_endproc
.LFE57:
	.size	printint, .-printint
	.align 16
	.globl	print64int
	.type	print64int, @function
print64int:
.LFB58:
	.cfi_startproc
	jmp	console_write_dec
	.cfi_endproc
.LFE58:
	.size	print64int, .-print64int
	.align 16
	.globl	_console_putentryat
	.type	_console_putentryat, @function
_console_putentryat:
.LFB59:
	.cfi_startproc
	movl	16(%esp), %eax
	movl	console_dbuffer, %edx
	leal	(%eax,%eax,4), %eax
	sall	$4, %eax
	addl	12(%esp), %eax
	leal	(%edx,%eax,2), %ecx
	movzbl	8(%esp), %eax
	sall	$8, %eax
	movl	%eax, %edx
	movsbw	4(%esp), %ax
	orl	%edx, %eax
	movw	%ax, (%ecx)
	ret
	.cfi_endproc
.LFE59:
	.size	_console_putentryat, .-_console_putentryat
	.align 16
	.globl	_putchar
	.type	_putchar, @function
_putchar:
.LFB60:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$4, %esp
	.cfi_def_cfa_offset 12
	movl	12(%esp), %eax
	movb	%al, (%esp)
	cmpb	$10, (%esp)
	jne	.L346
	movl	$0, consolecolumn
	movl	consolerow, %eax
	addl	$1, %eax
	movl	%eax, consolerow
	movl	consolerow, %eax
	movl	$25, %edx
	cmpl	%edx, %eax
	jb	.L347
	movl	console_rows_skipped, %eax
	addl	$1, %eax
	movl	%eax, console_rows_skipped
	movl	console_skip, %eax
	addl	$1, %eax
	movl	%eax, console_skip
.L347:
	movsbl	(%esp), %eax
	jmp	.L348
.L346:
	cmpb	$9, (%esp)
	jne	.L349
	movl	consolecolumn, %eax
	addl	$5, %eax
	movl	%eax, consolecolumn
	jmp	.L350
.L349:
	movl	consolerow, %ebx
	movl	consolecolumn, %ecx
	movzbl	console_color, %eax
	movzbl	%al, %edx
	movsbl	(%esp), %eax
	pushl	%ebx
	.cfi_def_cfa_offset 16
	pushl	%ecx
	.cfi_def_cfa_offset 20
	pushl	%edx
	.cfi_def_cfa_offset 24
	pushl	%eax
	.cfi_def_cfa_offset 28
	call	_console_putentryat
	addl	$16, %esp
	.cfi_def_cfa_offset 12
.L350:
	movl	consolecolumn, %eax
	addl	$1, %eax
	movl	%eax, consolecolumn
	movl	consolecolumn, %eax
	movl	$80, %edx
	cmpl	%edx, %eax
	jb	.L351
	movl	$0, consolecolumn
	movl	consolerow, %eax
	addl	$1, %eax
	movl	%eax, consolerow
	movl	consolerow, %eax
	movl	$25, %edx
	cmpl	%edx, %eax
	jb	.L352
	movl	console_rows_skipped, %eax
	addl	$1, %eax
	movl	%eax, console_rows_skipped
	movl	console_skip, %eax
	addl	$1, %eax
	movl	%eax, console_skip
.L352:
	movsbl	(%esp), %eax
	jmp	.L348
.L351:
	movsbl	(%esp), %eax
.L348:
	addl	$4, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE60:
	.size	_putchar, .-_putchar
	.align 16
	.globl	_putchar_old
	.type	_putchar_old, @function
_putchar_old:
.LFB61:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	8(%ebp), %eax
	movzbl	8(%ebp), %esi
	movl	consolerow, %edx
	movl	consolecolumn, %ecx
	subl	$9, %eax
	leal	(%edx,%edx,4), %ebx
	cmpb	$1, %al
	movl	$32, %eax
	cmova	%esi, %eax
	movl	console_dbuffer, %esi
	sall	$4, %ebx
	addl	%ecx, %ebx
	cbtw
	leal	(%esi,%ebx,2), %edi
	movzbl	console_color, %ebx
	sall	$8, %ebx
	orl	%ebx, %eax
	movw	%ax, (%edi)
	leal	1(%ecx), %eax
	cmpl	$80, %eax
	je	.L370
	cmpb	$10, 8(%ebp)
	je	.L370
	addl	$6, %ecx
	cmpb	$9, 8(%ebp)
	cmovne	%eax, %ecx
	movl	%ecx, consolecolumn
.L358:
	movl	8(%ebp), %eax
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.L370:
	.cfi_restore_state
	addl	$1, %edx
	movl	$0, consolecolumn
	cmpl	$25, %edx
	movl	%edx, consolerow
	jne	.L358
	movl	%esp, -28(%ebp)
	subl	$4336, %esp
	movl	$24, consolerow
	leal	4322(%esp), %edx
	movl	%esp, %eax
	movl	%esp, -32(%ebp)
	movl	%esp, %edi
	.align 16
.L359:
	xorl	%ecx, %ecx
	addl	$2, %eax
	movw	%cx, -2(%eax)
	cmpl	%edx, %eax
	jne	.L359
	leal	4000(%esi), %eax
	movl	%esi, -36(%ebp)
	movl	%eax, %ebx
	movl	%esi, %eax
	movl	%ebx, %esi
	.align 16
.L362:
	leal	160(%eax), %ebx
	movl	%edi, %edx
	.align 16
.L361:
	movzwl	(%eax), %ecx
	addl	$2, %eax
	addl	$2, %edx
	movw	%cx, -2(%edx)
	cmpl	%ebx, %eax
	jne	.L361
	addl	$160, %edi
	cmpl	%eax, %esi
	jne	.L362
	movl	-32(%ebp), %ebx
	movl	-36(%ebp), %esi
	movl	%ebx, %eax
	addl	$4160, %ebx
	addl	$160, %eax
	.align 16
.L365:
	leal	160(%eax), %edi
	movl	%esi, %edx
	.align 16
.L364:
	movzwl	(%eax), %ecx
	addl	$2, %eax
	addl	$2, %edx
	movw	%cx, -2(%edx)
	cmpl	%eax, %edi
	jne	.L364
	addl	$160, %esi
	cmpl	%edi, %ebx
	jne	.L365
	movl	8(%ebp), %eax
	movl	-28(%ebp), %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE61:
	.size	_putchar_old, .-_putchar_old
	.align 16
	.globl	_console_write_dec
	.type	_console_write_dec, @function
_console_write_dec:
.LFB62:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	movl	96(%esp), %ecx
	testl	%ecx, %ecx
	je	.L390
	movl	%ecx, %edx
	xorl	%esi, %esi
	movl	$-858993459, %ebx
	.align 16
.L386:
	movl	%edx, %eax
	addl	$1, %esi
	mull	%ebx
	shrl	$3, %edx
	testl	%edx, %edx
	jne	.L386
	testl	%esi, %esi
	movl	%esi, 8(%esp)
	je	.L400
	movl	8(%esp), %eax
	movl	$1, %ebx
	.align 16
.L387:
	leal	(%ebx,%ebx,4), %ebx
	addl	$1, %edx
	addl	%ebx, %ebx
	cmpl	%edx, %eax
	jne	.L387
	movl	%ebx, %eax
	movl	$-858993459, %edx
	movl	$-858993459, %edi
	mull	%edx
	leal	24(%esp), %eax
	movl	%eax, %ebp
	addl	8(%esp), %ebp
	movl	%eax, 12(%esp)
	shrl	$3, %edx
	movl	%eax, %esi
	movl	%edx, %ebx
	.align 16
.L389:
	movl	%ecx, %eax
	xorl	%edx, %edx
	addl	$1, %esi
	divl	%ebx
	addl	$48, %eax
	movl	%edx, %ecx
	movb	%al, -1(%esi)
	movl	%ebx, %eax
	mull	%edi
	movl	%edx, %ebx
	shrl	$3, %ebx
	cmpl	%esi, %ebp
	jne	.L389
.L385:
	movl	8(%esp), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 108
	movb	$0, 36(%esp,%eax)
	pushl	24(%esp)
	.cfi_def_cfa_offset 112
	call	_printf
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L390:
	.cfi_restore_state
	movl	$0, 8(%esp)
.L400:
	leal	24(%esp), %eax
	movl	%eax, 12(%esp)
	jmp	.L385
	.cfi_endproc
.LFE62:
	.size	_console_write_dec, .-_console_write_dec
	.align 16
	.globl	backspace
	.type	backspace, @function
backspace:
.LFB63:
	.cfi_startproc
	movl	consolecolumn, %eax
	movl	consolerow, %edx
	subl	$1, %eax
	testl	%eax, %eax
	movl	%eax, consolecolumn
	jne	.L404
	movl	consolerow, %eax
	movl	$80, consolecolumn
	leal	-1(%eax), %edx
	movl	$80, %eax
	movl	%edx, consolerow
.L404:
	leal	(%edx,%edx,4), %edx
	sall	$4, %edx
	addl	%edx, %eax
	movl	console_dbuffer, %edx
	leal	(%edx,%eax,2), %edx
	movzbl	console_color, %eax
	sall	$8, %eax
	orl	$32, %eax
	movw	%ax, (%edx)
	ret
	.cfi_endproc
.LFE63:
	.size	backspace, .-backspace
	.align 16
	.globl	clrline
	.type	clrline, @function
clrline:
.LFB413:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE413:
	.size	clrline, .-clrline
	.align 16
	.globl	_printint
	.type	_printint, @function
_printint:
.LFB65:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %esi
	cmpl	$999999999, %esi
	jbe	.L417
	movl	%esi, %edx
	xorl	%ebx, %ebx
	movl	$-858993459, %ecx
	jmp	.L414
	.align 16
.L411:
	movl	%eax, %ebx
.L414:
	movl	%edx, %eax
	mull	%ecx
	leal	1(%ebx), %eax
	shrl	$3, %edx
	testl	%edx, %edx
	jne	.L411
	subl	$8, %ebx
	movl	$1, %ecx
	je	.L409
	.align 16
.L410:
	leal	(%ecx,%ecx,4), %ecx
	addl	$1, %edx
	addl	%ecx, %ecx
	cmpl	%edx, %ebx
	jne	.L410
.L409:
	movl	%esi, %eax
	xorl	%edx, %edx
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	divl	%ecx
	pushl	%eax
	.cfi_def_cfa_offset 32
	movl	%edx, %esi
	call	_console_write_dec
	movl	%esi, 32(%esp)
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	_console_write_dec
	.align 16
.L417:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -12
	.cfi_offset 6, -8
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	_console_write_dec
	.cfi_endproc
.LFE65:
	.size	_printint, .-_printint
	.align 16
	.globl	_printf
	.type	_printf, @function
_printf:
.LFB66:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %ebx
	leal	52(%esp), %eax
	movb	$0, 11(%esp)
	movl	$0, 4(%esp)
	movl	%eax, 12(%esp)
	movzbl	(%ebx), %edx
.L419:
	testb	%dl, %dl
	je	.L466
	.align 16
.L437:
	cmpb	$37, %dl
	je	.L420
	movzbl	1(%ebx), %eax
	leal	1(%ebx), %esi
.L421:
.L422:
	cmpb	$37, %al
	je	.L423
.L472:
	testb	%al, %al
	je	.L423
	leal	2(%ebx), %eax
	movl	$1, %edi
	jmp	.L424
	.align 16
.L467:
	cmpb	$37, %dl
	je	.L441
.L424:
	movzbl	(%eax), %edx
	addl	$1, %edi
	movl	%eax, %esi
	addl	$1, %eax
	testb	%dl, %dl
	jne	.L467
.L441:
	testl	%edi, %edi
	je	.L426
	xorl	%ebp, %ebp
	.align 16
.L427:
	movsbl	(%ebx,%ebp), %eax
	addl	$1, %ebp
	pushl	%eax
	.cfi_def_cfa_offset 52
	call	_putchar
	cmpl	%ebp, %edi
	popl	%eax
	.cfi_def_cfa_offset 48
	ja	.L427
.L438:
	movzbl	(%esi), %edx
.L426:
	addl	%edi, 4(%esp)
	testb	%dl, %dl
	movl	%esi, %ebx
	jne	.L437
.L466:
	movl	4(%esp), %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L420:
	.cfi_restore_state
	movzbl	1(%ebx), %eax
	leal	1(%ebx), %edi
	cmpb	$37, %al
	je	.L468
	cmpb	$0, 11(%esp)
	jne	.L439
	cmpb	$99, %al
	je	.L469
	cmpb	$115, %al
	je	.L470
	cmpb	$105, %al
	sete	%cl
	cmpb	$100, %al
	movl	%ecx, %esi
	sete	%cl
	movl	%esi, %edx
	orb	%cl, %dl
	jne	.L471
	cmpb	$108, %al
	je	.L442
	cmpb	$120, %al
	movl	%edi, %esi
	movb	$1, 11(%esp)
	jne	.L422
.L442:
	movl	12(%esp), %ecx
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	2(%ebx), %esi
	movl	%ecx, %eax
	addl	$4, %ecx
	movl	%ecx, 24(%esp)
	pushl	(%eax)
	.cfi_def_cfa_offset 64
	call	_printint
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	2(%ebx), %edx
	movb	$0, 11(%esp)
	movl	%esi, %ebx
	jmp	.L419
	.align 16
.L439:
	cmpb	$37, %al
	movl	%edi, %esi
	jne	.L472
.L423:
	movsbl	(%ebx), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	$1, %edi
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	_putchar
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L438
.L468:
	leal	2(%ebx), %esi
	movzbl	2(%ebx), %eax
	movl	%edi, %ebx
	jmp	.L422
.L471:
	movl	12(%esp), %ecx
	leal	2(%ebx), %esi
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	%ecx, %eax
	addl	$4, %ecx
	movl	%ecx, 24(%esp)
	pushl	(%eax)
	.cfi_def_cfa_offset 64
	call	_printint
	movzbl	2(%ebx), %edx
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	%esi, %ebx
	jmp	.L419
.L469:
	movl	12(%esp), %ecx
	leal	2(%ebx), %esi
	movl	%ecx, %eax
	addl	$4, %ecx
	movsbl	(%eax), %eax
	movl	%ecx, 12(%esp)
	pushl	%eax
	.cfi_def_cfa_offset 52
	call	_putchar
	movzbl	2(%ebx), %edx
	movl	%esi, %ebx
	popl	%ecx
	.cfi_def_cfa_offset 48
	jmp	.L419
.L470:
	movl	12(%esp), %ecx
	xorl	%ebp, %ebp
	leal	2(%ebx), %esi
	movl	%ecx, %eax
	addl	$4, %ecx
	movl	(%eax), %edx
	movl	%ecx, 12(%esp)
	cmpb	$0, (%edx)
	je	.L464
	.align 16
.L451:
	addl	$1, %ebp
	cmpb	$0, (%edx,%ebp)
	jne	.L451
	movl	%edx, %edi
	addl	%edx, %ebp
	.align 16
.L434:
	movsbl	(%edi), %eax
	addl	$1, %edi
	pushl	%eax
	.cfi_def_cfa_offset 52
	call	_putchar
	cmpl	%edi, %ebp
	popl	%eax
	.cfi_def_cfa_offset 48
	jne	.L434
.L464:
	movzbl	2(%ebx), %edx
	movl	%esi, %ebx
	jmp	.L419
	.cfi_endproc
.LFE66:
	.size	_printf, .-_printf
	.comm	gdt_entries,80,32
	.comm	gdt_ptr,6,4
	.comm	idt_entries,2048,32
	.comm	idt_ptr,6,4
	.align 16
	.globl	init_descriptor_tables
	.type	init_descriptor_tables, @function
init_descriptor_tables:
.LFB67:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	init_gdt
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	jmp	init_idt
	.cfi_endproc
.LFE67:
	.size	init_descriptor_tables, .-init_descriptor_tables
	.align 16
	.type	init_gdt, @function
init_gdt:
.LFB68:
	.cfi_startproc
	subl	$124, %esp
	.cfi_def_cfa_offset 128
	movl	$39, %eax
	movl	$104, %ecx
	movw	%ax, gdt_ptr
	leal	8(%esp), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 140
	movl	$gdt_entries, gdt_ptr+2
	movl	$0, gdt_entries
	movl	%eax, %edx
	movl	$0, gdt_entries+4
	movl	$65535, gdt_entries+8
	sall	$16, %edx
	movl	$13605376, gdt_entries+12
	movl	$65535, gdt_entries+16
	orl	$104, %edx
	movl	$13603328, gdt_entries+20
	movl	$65535, gdt_entries+24
	movl	%edx, gdt_entries+40
	movl	%eax, %edx
	andl	$-16777216, %eax
	shrl	$16, %edx
	orl	$4229376, %eax
	movl	$13629952, gdt_entries+28
	movzbl	%dl, %edx
	movl	$65535, gdt_entries+32
	movl	$13627904, gdt_entries+36
	orl	%edx, %eax
	movl	$16, %edx
	movl	%eax, gdt_entries+44
	movl	initial_esp, %eax
	movw	%dx, 28(%esp)
	movl	%eax, 24(%esp)
	movw	%cx, 122(%esp)
	pushl	$gdt_ptr
	.cfi_def_cfa_offset 144
	call	lgdt
	addl	$140, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE68:
	.size	init_gdt, .-init_gdt
	.align 16
	.type	init_idt, @function
init_idt:
.LFB70:
	.cfi_startproc
	movl	$2047, %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	$idt_entries, idt_ptr+2
	movw	%ax, idt_ptr
	movl	$idt_entries, %eax
	.align 16
.L478:
	addl	$1, %eax
	movb	$0, -1(%eax)
	cmpl	$idt_entries+2048, %eax
	jne	.L478
	movl	$divByZero_handler, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+4
	movl	$debug_handler, %eax
	movl	%edx, idt_entries
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+12
	movl	$NMI_handler, %eax
	movl	%edx, idt_entries+8
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+20
	movl	$breakpoint_handler, %eax
	movl	%edx, idt_entries+16
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+28
	movl	$overflow_handler, %eax
	movl	%edx, idt_entries+24
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+36
	movl	$outOfBounds_handler, %eax
	movl	%edx, idt_entries+32
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+44
	movl	$invalidInstr_handler, %eax
	movl	%edx, idt_entries+40
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+52
	movl	$noCoprocessor_handler, %eax
	movl	%edx, idt_entries+48
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+60
	movl	$doubleFault_handler, %eax
	movl	%edx, idt_entries+56
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+68
	movl	$coprocessor_handler, %eax
	movl	%edx, idt_entries+64
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+76
	movl	$badTSS_handler, %eax
	movl	%edx, idt_entries+72
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$142, %ah
	movl	%eax, idt_entries+84
	movl	$segmentNotPresent_handler, %eax
	movl	%edx, idt_entries+80
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+92
	movl	$stackFault_handler, %eax
	movl	%edx, idt_entries+88
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+100
	movl	$generalProtectionFault_handler, %eax
	movl	%edx, idt_entries+96
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+108
	movl	$pageFault_handler, %eax
	movl	%edx, idt_entries+104
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+116
	movl	$unknownInterrupt_handler, %eax
	movl	%edx, idt_entries+112
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+124
	movl	$coprocessorFault_handler, %eax
	movl	%edx, idt_entries+120
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$142, %ah
	movl	%edx, idt_entries+128
	movl	%eax, idt_entries+132
	movl	$alignmentCheck_handler, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+140
	movl	$machineCheck_handler, %eax
	movl	%edx, idt_entries+136
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+148
	movl	$reserved_handler, %eax
	movl	%edx, idt_entries+144
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+156
	movl	%eax, idt_entries+164
	movl	%eax, idt_entries+172
	movl	%eax, idt_entries+180
	movl	%eax, idt_entries+188
	movl	%eax, idt_entries+196
	movl	%eax, idt_entries+204
	movl	%eax, idt_entries+212
	movl	%eax, idt_entries+220
	movl	%eax, idt_entries+228
	movl	%eax, idt_entries+236
	movl	%eax, idt_entries+244
	movl	%eax, idt_entries+252
	movl	$Scheduler_Promoter_assistance, %eax
	movl	%edx, idt_entries+152
	movl	%edx, idt_entries+160
	movl	%edx, idt_entries+168
	movl	%edx, idt_entries+176
	movl	%edx, idt_entries+184
	movl	%edx, idt_entries+192
	movl	%edx, idt_entries+200
	movl	%edx, idt_entries+208
	movl	%edx, idt_entries+216
	movl	%edx, idt_entries+224
	movl	%edx, idt_entries+232
	movl	%edx, idt_entries+240
	movl	%edx, idt_entries+248
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$142, %ah
	movl	%edx, idt_entries+256
	movl	%eax, idt_entries+260
	movl	$kb_handle, %eax
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	movl	%edx, idt_entries+264
	movl	%eax, idt_entries+268
	movl	$cascade_handler, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+276
	movl	$COM2_handler, %eax
	movl	%edx, idt_entries+272
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+284
	movl	$COM1_handler, %eax
	movl	%edx, idt_entries+280
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+292
	movl	$LPT2_handler, %eax
	movl	%edx, idt_entries+288
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+300
	movl	$floppyDisk_handler, %eax
	movl	%edx, idt_entries+296
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+308
	movl	$LPT1_handler, %eax
	movl	%edx, idt_entries+304
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+316
	movl	$RTC_handler, %eax
	movl	%edx, idt_entries+312
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+324
	movl	$periph1_handler, %eax
	movl	%edx, idt_entries+320
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+332
	movl	$periph2_handler, %eax
	movl	%edx, idt_entries+328
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+340
	movl	$periph3_handler, %eax
	movl	%edx, idt_entries+336
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+348
	movl	$mouse_handle, %eax
	movl	%edx, idt_entries+344
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	orb	$142, %ah
	movl	%edx, idt_entries+352
	movl	%eax, idt_entries+356
	movl	$FPU_handler, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+364
	movl	$primaryHDD_handler, %eax
	movl	%edx, idt_entries+360
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+372
	movl	$secondaryHDD_handler, %eax
	movl	%edx, idt_entries+368
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+380
	movl	$switcher, %eax
	movl	%edx, idt_entries+376
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, idt_entries+412
	movl	$switcher_manual, %eax
	movl	%edx, idt_entries+408
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$142, %ah
	movl	%edx, idt_entries+400
	pushl	$idt_ptr
	.cfi_def_cfa_offset 32
	movl	%eax, idt_entries+404
	call	lidt
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE70:
	.size	init_idt, .-init_idt
	.globl	APIC_LOCAL_BASE
	.data
	.align 4
	.type	APIC_LOCAL_BASE, @object
	.size	APIC_LOCAL_BASE, 4
APIC_LOCAL_BASE:
	.long	-18874368
	.globl	APIC_IO_BASE
	.align 4
	.type	APIC_IO_BASE, @object
	.size	APIC_IO_BASE, 4
APIC_IO_BASE:
	.long	-20971520
	.globl	counter
	.section	.bss
	.align 4
	.type	counter, @object
	.size	counter, 4
counter:
	.zero	4
	.comm	IOAPIC_entry,4,4
	.comm	LAPIC_entry,4,4
	.comm	ISD_entry,4,4
	.comm	madt,4,4
	.globl	tick
	.align 4
	.type	tick, @object
	.size	tick, 4
tick:
	.zero	4
	.local	scancodes
	.comm	scancodes,4,4
	.data
	.align 32
	.type	Main_key_codes, @object
	.size	Main_key_codes, 332
Main_key_codes:
	.long	97
	.long	4097
	.long	49
	.long	50
	.long	51
	.long	52
	.long	53
	.long	54
	.long	55
	.long	56
	.long	57
	.long	48
	.long	45
	.long	61
	.long	8
	.long	16384
	.long	113
	.long	119
	.long	101
	.long	114
	.long	116
	.long	121
	.long	117
	.long	105
	.long	111
	.long	112
	.long	91
	.long	93
	.long	13
	.long	0
	.long	97
	.long	115
	.long	100
	.long	102
	.long	103
	.long	104
	.long	106
	.long	107
	.long	108
	.long	59
	.long	39
	.long	96
	.long	0
	.long	92
	.long	122
	.long	120
	.long	99
	.long	118
	.long	98
	.long	110
	.long	109
	.long	44
	.long	46
	.long	47
	.long	0
	.long	42
	.long	0
	.long	32
	.long	0
	.long	4609
	.long	4610
	.long	4611
	.long	4612
	.long	4613
	.long	4614
	.long	4615
	.long	4616
	.long	4617
	.long	4618
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	50
	.long	51
	.long	48
	.long	46
	.long	97
	.long	97
	.long	97
	.long	0
	.long	0
	.align 32
	.type	Special_key_codes, @object
	.size	Special_key_codes, 332
Special_key_codes:
	.long	97
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	16387
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	16386
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	16390
	.long	0
	.long	16392
	.long	0
	.long	16385
	.long	4609
	.long	4610
	.long	4611
	.long	4612
	.long	4613
	.long	4614
	.long	4615
	.long	4616
	.long	4617
	.long	4618
	.long	12303
	.long	16400
	.long	16396
	.long	4352
	.long	16398
	.long	50
	.long	51
	.long	48
	.long	46
	.long	97
	.long	97
	.long	97
	.long	4619
	.long	4619
	.local	call
	.comm	call,4,4
	.local	_ctrl
	.comm	_ctrl,4,4
	.local	_shift
	.comm	_shift,4,4
	.local	_alt
	.comm	_alt,4,4
	.local	_numlock
	.comm	_numlock,4,4
	.local	_capslock
	.comm	_capslock,4,4
	.local	_scrolllock
	.comm	_scrolllock,4,4
	.local	_arrow_up
	.comm	_arrow_up,4,4
	.local	_arrow_down
	.comm	_arrow_down,4,4
	.globl	mb_temp
	.section	.bss
	.align 4
	.type	mb_temp, @object
	.size	mb_temp, 4
mb_temp:
	.zero	4
	.comm	max_mem,4,4
	.globl	in_system_dir
	.align 4
	.type	in_system_dir, @object
	.size	in_system_dir, 4
in_system_dir:
	.zero	4
	.comm	main_dir,4,4
	.comm	system_dir,4,4
	.comm	user_dir,4,4
	.globl	_cur_directory
	.align 4
	.type	_cur_directory, @object
	.size	_cur_directory, 4
_cur_directory:
	.zero	4
	.globl	_prev_directory
	.align 4
	.type	_prev_directory, @object
	.size	_prev_directory, 4
_prev_directory:
	.zero	4
	.comm	PgDirs,800,32
	.comm	curr_pgdir,8,4
	.globl	PgDs
	.type	PgDs, @object
	.size	PgDs, 1
PgDs:
	.zero	1
	.globl	pag
	.align 4
	.type	pag, @object
	.size	pag, 4
pag:
	.zero	4
	.globl	status
	.align 4
	.type	status, @object
	.size	status, 4
status:
	.zero	4
	.globl	maxmem
	.align 4
	.type	maxmem, @object
	.size	maxmem, 4
maxmem:
	.zero	4
	.globl	memAvailable
	.align 4
	.type	memAvailable, @object
	.size	memAvailable, 4
memAvailable:
	.zero	4
	.globl	blockID
	.data
	.align 2
	.type	blockID, @object
	.size	blockID, 2
blockID:
	.value	10
	.comm	Mblock,4,4
	.comm	lastBlock,4,4
	.comm	lastBlockAddr,4,4
	.comm	mblock,8,8
	.comm	Kblock,4,4
	.comm	mmap_info,4,4
	.globl	strMemoryTypes
	.section	.rodata
.LC1:
	.string	"Available"
.LC2:
	.string	"Reserved"
.LC3:
	.string	"ACPI Reclaim"
.LC4:
	.string	"ACPI NVS Memory"
	.data
	.align 4
	.type	strMemoryTypes, @object
	.size	strMemoryTypes, 16
strMemoryTypes:
	.long	.LC1
	.long	.LC2
	.long	.LC3
	.long	.LC4
	.globl	kSupportedDevices
	.section	.rodata
.LC5:
	.string	"ATI SB600"
.LC6:
	.string	"ATI SB700/800"
.LC7:
	.string	"ATI IXP700"
.LC8:
	.string	"SiS 966"
.LC9:
	.string	"SiS 968"
.LC10:
	.string	"Acer Labs M5288"
.LC11:
	.string	"NVIDIA MCP65"
.LC12:
	.string	"NVIDIA MCP67"
.LC13:
	.string	"NVIDIA MCP73"
.LC14:
	.string	"NVIDIA MCP77"
.LC15:
	.string	"NVIDIA MCP79"
.LC16:
	.string	"NVIDIA MCP89"
.LC17:
	.string	"VIA VT8251"
.LC18:
	.string	"Marvell 6121"
.LC19:
	.string	"Marvell 6145"
.LC20:
	.string	"JMicron JMB360"
.LC21:
	.string	"JMicron JMB361"
.LC22:
	.string	"JMicron JMB362"
.LC23:
	.string	"JMicron JMB363"
.LC24:
	.string	"JMicron JMB366"
.LC25:
	.string	"Intel ICH6R"
.LC26:
	.string	"Intel ICH6-M"
.LC27:
	.string	"Intel 63xxESB"
.LC28:
	.string	"Intel ESB2"
.LC29:
	.string	"Intel ICH7R (AHCI mode)"
.LC30:
	.string	"Intel ICH7R (RAID mode)"
.LC31:
	.string	"Intel ICH7-M (AHCI mode)"
.LC32:
	.string	"Intel ICH7-M DH (RAID mode)"
.LC33:
	.string	"Intel ICH8 (AHCI mode)"
	.align 4
.LC34:
	.string	"Intel ICH8R / ICH9 (RAID mode)"
.LC35:
	.string	"Intel ICH8M (AHCI mode)"
.LC36:
	.string	"Intel ICH8M (RAID mode)"
.LC37:
	.string	"Intel ICH9 (AHCI mode)"
.LC38:
	.string	"Intel ICH9"
.LC39:
	.string	"Intel ICH9M"
.LC40:
	.string	"Intel ICH10"
.LC41:
	.string	"UnKnown Device"
	.align 32
	.type	kSupportedDevices, @object
	.size	kSupportedDevices, 944
kSupportedDevices:
	.value	4098
	.value	17280
	.long	.LC5
	.value	4098
	.value	17296
	.long	.LC6
	.value	4098
	.value	17297
	.long	.LC7
	.value	4098
	.value	17298
	.long	.LC6
	.value	4098
	.value	17299
	.long	.LC6
	.value	4098
	.value	17300
	.long	.LC6
	.value	4098
	.value	17301
	.long	.LC6
	.value	4153
	.value	4484
	.long	.LC8
	.value	4153
	.value	4485
	.long	.LC8
	.value	4153
	.value	390
	.long	.LC9
	.value	4281
	.value	21128
	.long	.LC10
	.value	4318
	.value	1100
	.long	.LC11
	.value	4318
	.value	1101
	.long	.LC11
	.value	4318
	.value	1102
	.long	.LC11
	.value	4318
	.value	1103
	.long	.LC11
	.value	4318
	.value	1116
	.long	.LC11
	.value	4318
	.value	1117
	.long	.LC11
	.value	4318
	.value	1118
	.long	.LC11
	.value	4318
	.value	1119
	.long	.LC11
	.value	4318
	.value	1360
	.long	.LC12
	.value	4318
	.value	1361
	.long	.LC12
	.value	4318
	.value	1362
	.long	.LC12
	.value	4318
	.value	1363
	.long	.LC12
	.value	4318
	.value	1364
	.long	.LC12
	.value	4318
	.value	1365
	.long	.LC12
	.value	4318
	.value	1366
	.long	.LC12
	.value	4318
	.value	1367
	.long	.LC12
	.value	4318
	.value	1368
	.long	.LC12
	.value	4318
	.value	1369
	.long	.LC12
	.value	4318
	.value	1370
	.long	.LC12
	.value	4318
	.value	1371
	.long	.LC12
	.value	4318
	.value	2032
	.long	.LC13
	.value	4318
	.value	2033
	.long	.LC13
	.value	4318
	.value	2034
	.long	.LC13
	.value	4318
	.value	2035
	.long	.LC13
	.value	4318
	.value	2036
	.long	.LC13
	.value	4318
	.value	2037
	.long	.LC13
	.value	4318
	.value	2038
	.long	.LC13
	.value	4318
	.value	2039
	.long	.LC13
	.value	4318
	.value	2040
	.long	.LC13
	.value	4318
	.value	2041
	.long	.LC13
	.value	4318
	.value	2042
	.long	.LC13
	.value	4318
	.value	2043
	.long	.LC13
	.value	4318
	.value	2768
	.long	.LC14
	.value	4318
	.value	2769
	.long	.LC14
	.value	4318
	.value	2770
	.long	.LC14
	.value	4318
	.value	2771
	.long	.LC14
	.value	4318
	.value	2772
	.long	.LC14
	.value	4318
	.value	2773
	.long	.LC14
	.value	4318
	.value	2774
	.long	.LC14
	.value	4318
	.value	2775
	.long	.LC14
	.value	4318
	.value	2776
	.long	.LC14
	.value	4318
	.value	2777
	.long	.LC14
	.value	4318
	.value	2778
	.long	.LC14
	.value	4318
	.value	2779
	.long	.LC14
	.value	4318
	.value	2740
	.long	.LC15
	.value	4318
	.value	2741
	.long	.LC15
	.value	4318
	.value	2742
	.long	.LC15
	.value	4318
	.value	2743
	.long	.LC15
	.value	4318
	.value	2744
	.long	.LC15
	.value	4318
	.value	2745
	.long	.LC15
	.value	4318
	.value	2746
	.long	.LC15
	.value	4318
	.value	2747
	.long	.LC15
	.value	4318
	.value	2748
	.long	.LC15
	.value	4318
	.value	2749
	.long	.LC15
	.value	4318
	.value	2750
	.long	.LC15
	.value	4318
	.value	2751
	.long	.LC15
	.value	4318
	.value	3460
	.long	.LC16
	.value	4318
	.value	3461
	.long	.LC16
	.value	4318
	.value	3462
	.long	.LC16
	.value	4318
	.value	3463
	.long	.LC16
	.value	4318
	.value	3464
	.long	.LC16
	.value	4318
	.value	3465
	.long	.LC16
	.value	4318
	.value	3466
	.long	.LC16
	.value	4318
	.value	3467
	.long	.LC16
	.value	4318
	.value	3468
	.long	.LC16
	.value	4318
	.value	3469
	.long	.LC16
	.value	4318
	.value	3470
	.long	.LC16
	.value	4318
	.value	3471
	.long	.LC16
	.value	4358
	.value	13129
	.long	.LC17
	.value	4358
	.value	25223
	.long	.LC17
	.value	4523
	.value	24865
	.long	.LC18
	.value	4523
	.value	24901
	.long	.LC19
	.value	6523
	.value	9056
	.long	.LC20
	.value	6523
	.value	9057
	.long	.LC21
	.value	6523
	.value	9058
	.long	.LC22
	.value	6523
	.value	9059
	.long	.LC23
	.value	6523
	.value	9062
	.long	.LC24
	.value	-32634
	.value	9810
	.long	.LC25
	.value	-32634
	.value	9811
	.long	.LC26
	.value	-32634
	.value	9857
	.long	.LC27
	.value	-32634
	.value	9858
	.long	.LC28
	.value	-32634
	.value	9859
	.long	.LC28
	.value	-32634
	.value	10177
	.long	.LC29
	.value	-32634
	.value	10179
	.long	.LC30
	.value	-32634
	.value	10181
	.long	.LC31
	.value	-32634
	.value	10182
	.long	.LC32
	.value	-32634
	.value	10273
	.long	.LC33
	.value	-32634
	.value	10274
	.long	.LC34
	.value	-32634
	.value	10276
	.long	.LC33
	.value	-32634
	.value	10281
	.long	.LC35
	.value	-32634
	.value	10282
	.long	.LC36
	.value	-32634
	.value	10530
	.long	.LC37
	.value	-32634
	.value	10531
	.long	.LC37
	.value	-32634
	.value	10532
	.long	.LC38
	.value	-32634
	.value	10533
	.long	.LC38
	.value	-32634
	.value	10535
	.long	.LC38
	.value	-32634
	.value	10537
	.long	.LC39
	.value	-32634
	.value	10538
	.long	.LC39
	.value	-32634
	.value	10539
	.long	.LC39
	.value	-32634
	.value	10540
	.long	.LC39
	.value	-32634
	.value	10543
	.long	.LC39
	.value	-32634
	.value	10573
	.long	.LC38
	.value	-32634
	.value	10574
	.long	.LC39
	.value	-32634
	.value	14853
	.long	.LC40
	.value	-32634
	.value	14882
	.long	.LC40
	.value	-32634
	.value	14885
	.long	.LC40
	.value	0
	.value	0
	.long	.LC41
	.comm	ident,512,32
	.comm	HDD,1,1
	.comm	drive,2,2
	.globl	PciVenTable
.LC42:
	.string	""
.LC43:
	.string	"Paradyne Corp."
.LC44:
	.string	"well"
.LC45:
	.string	"master"
.LC46:
	.string	"Hauppauge1"
.LC47:
	.string	"Hauppauge Computer Works Inc."
.LC48:
	.string	"ncipher"
.LC49:
	.string	"Ncipher Corp. Ltd"
.LC50:
	.string	"General Dynamics"
.LC51:
	.string	"SK - Electronics Co., Ltd."
.LC52:
	.string	"BREA"
.LC53:
	.string	"BREA Technologies Inc."
.LC54:
	.string	"Compaq"
.LC55:
	.string	"Compaq Computer Corp."
.LC56:
	.string	"LSI"
.LC57:
	.string	"LSI Logic"
.LC58:
	.string	"KOLTER"
.LC59:
	.string	"Kolter Electronic - Germany"
.LC60:
	.string	"ATI"
.LC61:
	.string	"ATI  Technologies  Inc."
.LC62:
	.string	"ULSI"
.LC63:
	.string	"VLSI"
.LC64:
	.string	"VLSI Technology"
.LC65:
	.string	"Reply"
.LC66:
	.string	"Reply Group"
.LC67:
	.string	"NetFrame"
.LC68:
	.string	"Netframe Systems Inc."
.LC69:
	.string	"Epson"
.LC70:
	.string	"Phoenix"
.LC71:
	.string	"Phoenix Technologies Ltd."
.LC72:
	.string	"NSC"
.LC73:
	.string	"National Semiconductors"
.LC74:
	.string	"Tseng"
.LC75:
	.string	"Tseng Labs"
.LC76:
	.string	"AST"
.LC77:
	.string	"AST Research"
.LC78:
	.string	"Weitek"
.LC79:
	.string	"VLogic"
.LC80:
	.string	"Video Logic Ltd."
.LC81:
	.string	"DEC"
.LC82:
	.string	"Digital Equipment Corporation"
.LC83:
	.string	"Micronics"
.LC84:
	.string	"Micronics Computers Inc."
.LC85:
	.string	"Cirrus"
.LC86:
	.string	"Cirrus Logic"
.LC87:
	.string	"IBM"
	.align 4
.LC88:
	.string	"International Business Machines Corp."
.LC89:
	.string	"Fujitsu ICL"
.LC90:
	.string	"Fujitsu ICL Computers"
.LC91:
	.string	"Spea"
.LC92:
	.string	"Spea Software AG"
.LC93:
	.string	"Unisys"
.LC94:
	.string	"Unisys Systems"
.LC95:
	.string	"ECS"
.LC96:
	.string	"Elitegroup Computer System"
.LC97:
	.string	"NCR"
.LC98:
	.string	"NCR Corporation"
.LC99:
	.string	"Vitesse"
.LC100:
	.string	"Vitesse Semiconductor"
.LC101:
	.string	"AMI"
.LC102:
	.string	"American Megatrends Inc."
.LC103:
	.string	"PictureTel"
.LC104:
	.string	"PictureTel Corp."
.LC105:
	.string	"Hitachi"
.LC106:
	.string	"Hitachi Computer Electronics"
.LC107:
	.string	"OKI"
.LC108:
	.string	"Oki Electric Industry"
.LC109:
	.string	"AMD"
.LC110:
	.string	"Advanced Micro Devices"
.LC111:
	.string	"machdo"
.LC112:
	.string	"TRIDENT MICRO"
.LC113:
	.string	"Acer"
.LC114:
	.string	"Acer Incorporated"
.LC115:
	.string	"Dell"
.LC116:
	.string	"Dell Computer Corporation"
.LC117:
	.string	"LSI Logic Headland Division"
.LC118:
	.string	"Matrox"
	.align 4
.LC119:
	.string	"Matrox Electronic Systems Ltd."
.LC120:
	.string	"C&T"
	.align 4
.LC121:
	.string	"Asiliant (Chips And Technologies)"
.LC122:
	.string	"Wyse"
.LC123:
	.string	"Wyse Technologies"
.LC124:
	.string	"Olivetti"
.LC125:
	.string	"Olivetti Advanced Technology"
.LC126:
	.string	"A305-S6829"
.LC127:
	.string	"Toshiba America"
.LC128:
	.string	"TMC"
.LC129:
	.string	"TMC Research"
.LC130:
	.string	"miro"
.LC131:
	.string	"miro Computer Products AG"
.LC132:
	.string	"NEC"
.LC133:
	.string	"NEC Electronics"
.LC134:
	.string	"Burndy"
.LC135:
	.string	"Burndy Corporation"
.LC136:
	.string	"FDomain"
.LC137:
	.string	"Future Domain"
.LC138:
	.string	"Hitachi Micro Systems Inc"
.LC139:
	.string	"AMP"
.LC140:
	.string	"AMP Incorporated"
.LC141:
	.string	"SiS 630"
.LC142:
	.string	"Silicon Integrated Systems"
.LC143:
	.string	"Seiko"
.LC144:
	.string	"Seiko Epson Corporation"
.LC145:
	.string	"Tatung"
.LC146:
	.string	"Tatung Corp. Of America"
.LC147:
	.string	"HP"
.LC148:
	.string	"Hewlett-Packard Company"
.LC149:
	.string	"Solliday"
.LC150:
	.string	"Solliday Engineering"
.LC151:
	.string	"Logic Mod."
.LC152:
	.string	"Logic Modeling"
.LC153:
	.string	"Computrend"
.LC154:
	.string	"Asustek"
.LC155:
	.string	"Asustek Computer Inc."
.LC156:
	.string	"DPT"
.LC157:
	.string	"Distributed Processing Tech"
.LC158:
	.string	"OPTi"
.LC159:
	.string	"OPTi Inc."
.LC160:
	.string	"IPC"
.LC161:
	.string	"IPC Corporation LTD"
.LC162:
	.string	"Genoa"
.LC163:
	.string	"Genoa Systems Corp."
.LC164:
	.string	"ELSA"
.LC165:
	.string	"ELSA GmbH"
.LC166:
	.string	"Fountain"
.LC167:
	.string	"Fountain Technology"
.LC168:
	.string	"STM"
.LC169:
	.string	"STMicroelectronics"
.LC170:
	.string	"Mylex / Buslogic"
.LC171:
	.string	"TI"
.LC172:
	.string	"Texas Instruments"
.LC173:
	.string	"Sony"
.LC174:
	.string	"Sony Corporation"
.LC175:
	.string	"Oak"
.LC176:
	.string	"Oak Technology"
.LC177:
	.string	"Co-Time"
.LC178:
	.string	"Co-Time Computer Ltd."
.LC179:
	.string	"Winbond"
.LC180:
	.string	"Winbond Electronics Corp."
.LC181:
	.string	"Anigma"
.LC182:
	.string	"Anigma Corp."
.LC183:
	.string	"Young"
.LC184:
	.string	"Young Micro Systems"
.LC185:
	.string	"Hitachi Ltd"
.LC186:
	.string	"SMSC"
.LC187:
	.string	"Standard Microsystems Corp."
.LC188:
	.string	"ICL"
.LC189:
	.string	"Motorola"
.LC190:
	.string	"E&TR"
	.align 4
.LC191:
	.string	"Electronics & Telecommunication Res"
.LC192:
	.string	"Kontron"
.LC193:
	.string	"Kontron Canada"
.LC194:
	.string	"Promise"
.LC195:
	.string	"Promise Technology"
.LC196:
	.string	"Foxconn"
.LC197:
	.string	"Foxconn International Inc."
.LC198:
	.string	"Wipro"
.LC199:
	.string	"Wipro Infotech Limited"
.LC200:
	.string	"Number-Nine"
.LC201:
	.string	"Number Nine Visual Technology"
.LC202:
	.string	"Vtech"
.LC203:
	.string	"Vtech Engineering Canada Ltd."
.LC204:
	.string	"Infotronic"
.LC205:
	.string	"Infotronic America Inc."
.LC206:
	.string	"UMC"
.LC207:
	.string	"United Microelectronics"
.LC208:
	.string	"8x8"
.LC209:
	.string	"8x8 Inc."
.LC210:
	.string	"Maspar"
.LC211:
	.string	"Maspar Computer Corp."
.LC212:
	.string	"OOA"
.LC213:
	.string	"Ocean Office Automation"
.LC214:
	.string	"Alcatel"
.LC215:
	.string	"Alcatel Cit"
.LC216:
	.string	"TM"
.LC217:
	.string	"Texas Microsystems"
.LC218:
	.string	"Picopower"
.LC219:
	.string	"Picopower Technology"
.LC220:
	.string	"Mitsubishi"
.LC221:
	.string	"Mitsubishi Electronics"
.LC222:
	.string	"Div. Tech."
.LC223:
	.string	"Diversified Technology"
.LC224:
	.string	"Aten"
.LC225:
	.string	"Aten Research Inc."
.LC226:
	.string	"Apple"
.LC227:
	.string	"Power Mac G5 Quad"
.LC228:
	.string	"Hyundai"
.LC229:
	.string	"Hyundai Electronics America"
.LC230:
	.string	"Sequent"
.LC231:
	.string	"Sequent Computer Systems"
.LC232:
	.string	"DFI"
.LC233:
	.string	"DFI Inc."
.LC234:
	.string	"CityGate"
.LC235:
	.string	"City Gate Development LTD"
.LC236:
	.string	"Daewoo"
.LC237:
	.string	"Daewoo Telecom Ltd."
.LC238:
	.string	"Mitac"
.LC239:
	.string	"GIT"
.LC240:
	.string	"GIT Co. Ltd."
.LC241:
	.string	"Yamaha"
.LC242:
	.string	"Yamaha Corporation"
.LC243:
	.string	"Nexgen"
.LC244:
	.string	"Nexgen Microsystems"
.LC245:
	.string	"AIR"
.LC246:
	.string	"Advanced Integration Research"
.LC247:
	.string	"QLogic"
.LC248:
	.string	"QLogic Corporation"
.LC249:
	.string	"Cyrix"
.LC250:
	.string	"Cyrix Corporation"
.LC251:
	.string	"I-Bus"
.LC252:
	.string	"Networth"
.LC253:
	.string	"Networth controls"
.LC254:
	.string	"Gateway"
.LC255:
	.string	"Gateway 2000"
.LC256:
	.string	"Goldstar"
.LC257:
	.string	"Goldstar Co. Ltd."
.LC258:
	.string	"Leadtek"
.LC259:
	.string	"Leadtek Research"
.LC260:
	.string	"Interphase"
.LC261:
	.string	"Testernec"
.LC262:
	.string	"DTC"
.LC263:
	.string	"Data Technology Corporation"
.LC264:
	.string	"Cypress"
.LC265:
	.string	"Cypress Semiconductor"
.LC266:
	.string	"Radius Inc."
.LC267:
	.string	"EFA"
.LC268:
	.string	"EFA Corporation Of America"
.LC269:
	.string	"Forex"
.LC270:
	.string	"Forex Computer Corporation"
.LC271:
	.string	"Parador"
.LC272:
	.string	"Tulip"
.LC273:
	.string	"Tulip Computers Int'l BV"
.LC274:
	.string	"J. Bond"
.LC275:
	.string	"J. Bond Computer Systems"
.LC276:
	.string	"Cache"
.LC277:
	.string	"Cache Computer"
.LC278:
	.string	"MS Son."
.LC279:
	.string	"Microcomputer Systems (M) Son"
.LC280:
	.string	"DG"
.LC281:
	.string	"Data General Corporation"
.LC282:
	.string	"Bit3"
.LC283:
	.string	"SBS  Operations"
.LC284:
	.string	"Oakleigh"
.LC285:
	.string	"Oakleigh Systems Inc."
.LC286:
	.string	"Olicom"
.LC287:
	.string	"Sun"
.LC288:
	.string	"Sun Microsystems"
.LC289:
	.string	"Systemsoft"
.LC290:
	.string	"Systemsoft Corporation"
.LC291:
	.string	"Encore"
.LC292:
	.string	"Encore Computer Corporation"
.LC293:
	.string	"Intergraph"
.LC294:
	.string	"Intergraph Corporation"
.LC295:
	.string	"Diamond"
.LC296:
	.string	"Diamond Computer Systems"
.LC297:
	.string	"Nat. Inst."
.LC298:
	.string	"National Instruments"
.LC299:
	.string	"FIC"
.LC300:
	.string	"First Int'l Computers"
.LC301:
	.string	"Silicon Image"
.LC302:
	.string	"Silicon Image, Inc."
.LC303:
	.string	"Alacron"
.LC304:
	.string	"Appian"
.LC305:
	.string	"Appian Graphics"
.LC306:
	.string	"Quantum"
.LC307:
	.string	"Quantum Designs Ltd."
.LC308:
	.string	"Samsung"
.LC309:
	.string	"Samsung Electronics Co. Ltd."
.LC310:
	.string	"Packard-Bell"
.LC311:
	.string	"Packard Bell"
.LC312:
	.string	"Gemlight"
.LC313:
	.string	"Gemlight Computer Ltd."
.LC314:
	.string	"Megachips"
.LC315:
	.string	"Megachips Corporation"
.LC316:
	.string	"Zida"
.LC317:
	.string	"Zida Technologies Ltd."
.LC318:
	.string	"Brooktree"
.LC319:
	.string	"Brooktree Corporation"
.LC320:
	.string	"Trigem"
.LC321:
	.string	"Trigem Computer Inc."
.LC322:
	.string	"Meidensha"
.LC323:
	.string	"Meidensha Corporation"
.LC324:
	.string	"Juko"
.LC325:
	.string	"Juko Electronics Inc. Ltd."
.LC326:
	.string	"Quantum Corporation"
.LC327:
	.string	"Everex"
.LC328:
	.string	"Everex Systems Inc."
.LC329:
	.string	"Globe"
.LC330:
	.string	"Globe Manufacturing Sales"
.LC331:
	.string	"Racal"
.LC332:
	.string	"Racal Interlan"
.LC333:
	.string	"Sierra"
.LC334:
	.string	"Sierra Semiconductor"
.LC335:
	.string	"SG"
.LC336:
	.string	"Silicon Graphics"
.LC337:
	.string	"Digicom"
.LC338:
	.string	"Honeywell"
.LC339:
	.string	"Honeywell IASD"
.LC340:
	.string	"Winbond Systems Labs"
.LC341:
	.string	"Cornerstone"
.LC342:
	.string	"Cornerstone Technology"
.LC343:
	.string	"MCS"
.LC344:
	.string	"Micro Computer Systems Inc."
.LC345:
	.string	"CardExpert"
.LC346:
	.string	"CardExpert Technology"
.LC347:
	.string	"Cabletron"
.LC348:
	.string	"Cabletron Systems Inc."
.LC349:
	.string	"Raytheon"
.LC350:
	.string	"Raytheon Company"
.LC351:
	.string	"Databook"
.LC352:
	.string	"Databook Inc."
.LC353:
	.string	"STB"
.LC354:
	.string	"STB Systems"
.LC355:
	.string	"PLX"
.LC356:
	.string	"PLX Technology Inc."
.LC357:
	.string	"Madge"
.LC358:
	.string	"Madge Networks"
.LC359:
	.string	"3Com"
.LC360:
	.string	"3Com Corporation"
.LC361:
	.string	"SMC"
	.align 4
.LC362:
	.string	"Standard Microsystems Corporation"
.LC363:
	.string	"Ali"
.LC364:
	.string	"Ali Corporation"
.LC365:
	.string	"Mitsubishi Electronics Corp."
.LC366:
	.string	"Dapha"
.LC367:
	.string	"Dapha Electronics Corporation"
.LC368:
	.string	"ALR"
.LC369:
	.string	"Advanced Logic Research Inc."
.LC370:
	.string	"Surecom"
.LC371:
	.string	"Surecom Technology"
.LC372:
	.string	"Tsenglabs International Corp."
.LC373:
	.string	"MOST"
.LC374:
	.string	"MOST Corp."
.LC375:
	.string	"Boca"
.LC376:
	.string	"Boca Research Inc."
.LC377:
	.string	"ICM"
.LC378:
	.string	"ICM Corp. Ltd."
.LC379:
	.string	"Auspex"
.LC380:
	.string	"Auspex Systems Inc."
.LC381:
	.string	"Samsung Semiconductors"
.LC382:
	.string	"wim"
.LC383:
	.string	"Award Software Int'l Inc."
.LC384:
	.string	"Xerox"
.LC385:
	.string	"Xerox Corporation"
.LC386:
	.string	"Rambus"
.LC387:
	.string	"Rambus Inc."
.LC388:
	.string	"Neomagic"
.LC389:
	.string	"Neomagic Corporation"
.LC390:
	.string	"Dataexpert"
.LC391:
	.string	"Dataexpert Corporation"
.LC392:
	.string	"Fujitsu"
.LC393:
	.string	"Fujitsu Siemens"
.LC394:
	.string	"Omron"
.LC395:
	.string	"Omron Corporation"
.LC396:
	.string	"AdvanSys"
.LC397:
	.string	"Advanced System Products"
.LC398:
	.string	"Fujitsu Ltd."
.LC399:
	.string	"Future+"
.LC400:
	.string	"Future+ Systems"
.LC401:
	.string	"Molex"
.LC402:
	.string	"Molex Incorporated"
.LC403:
	.string	"Jabil"
.LC404:
	.string	"Jabil Circuit Inc."
.LC405:
	.string	"Hualon"
.LC406:
	.string	"Hualon Microelectronics"
.LC407:
	.string	"Autologic"
.LC408:
	.string	"Autologic Inc."
.LC409:
	.string	"Wilson .co .ltd"
.LC410:
	.string	"BCM"
.LC411:
	.string	"BCM Advanced Research"
.LC412:
	.string	"APL"
.LC413:
	.string	"Advanced Peripherals Labs"
.LC414:
	.string	"Macronix"
	.align 4
.LC415:
	.string	"Macronix International Co. Ltd."
.LC416:
	.string	"Rohm"
.LC417:
	.string	"Rohm Research"
.LC418:
	.string	"CERN"
	.align 4
.LC419:
	.string	"CERN-European Lab. for Particle Physics"
.LC420:
	.string	"E&S"
.LC421:
	.string	"Evans & Sutherland"
.LC422:
	.string	"NVIDIA"
.LC423:
	.string	"Emulex"
.LC424:
	.string	"Emulex Corporation"
.LC425:
	.string	"Tekram"
.LC426:
	.string	"Tekram Technology Corp. Ltd."
.LC427:
	.string	"Aptix"
.LC428:
	.string	"Aptix Corporation"
.LC429:
	.string	"Tundra"
.LC430:
	.string	"Tundra Semiconductor Corp."
.LC431:
	.string	"Tandem"
.LC432:
	.string	"Tandem Computers"
.LC433:
	.string	"MIC"
.LC434:
	.string	"Micro Industries Corporation"
.LC435:
	.string	"Gainbery"
	.align 4
.LC436:
	.string	"Gainbery Computer Products Inc."
.LC437:
	.string	"Vadem"
.LC438:
	.string	"AMCC"
.LC439:
	.string	"Applied Micro Circuits Corp."
.LC440:
	.string	"Alps"
.LC441:
	.string	"Alps Electronic Corp. Ltd."
.LC442:
	.string	"Tvia"
.LC443:
	.string	"Tvia, Inc."
.LC444:
	.string	"Artist"
.LC445:
	.string	"Artist Graphics"
.LC446:
	.string	"Realtek"
.LC447:
	.string	"Realtek Semiconductor"
.LC448:
	.string	"Ascii"
.LC449:
	.string	"Ascii Corporation"
.LC450:
	.string	"Xilinx"
.LC451:
	.string	"Xilinx Corporation"
.LC452:
	.string	"Racore"
.LC453:
	.string	"Racore Computer Products"
.LC454:
	.string	"Real-Time Graphics & Video"
	.align 4
.LC455:
	.string	"Curtiss-Wright Controls Embedded Computing"
.LC456:
	.string	"Tyan"
.LC457:
	.string	"Tyan Computer"
.LC458:
	.string	"Achme"
	.align 4
.LC459:
	.string	"Achme Computer Inc. - GONE !!!!"
.LC460:
	.string	"Alaris"
.LC461:
	.string	"Alaris Inc."
.LC462:
	.string	"S-Mos"
.LC463:
	.string	"S-Mos Systems"
.LC464:
	.string	"NKK"
.LC465:
	.string	"NKK Corporation"
.LC466:
	.string	"CES"
	.align 4
.LC467:
	.string	"Creative Electronic Systems SA"
.LC468:
	.string	"Matsushita"
	.align 4
.LC469:
	.string	"Matsushita Electric Industrial Corp."
.LC470:
	.string	"Altos"
.LC471:
	.string	"Altos India Ltd."
.LC472:
	.string	"PC-Direct"
.LC473:
	.string	"PC Direct"
.LC474:
	.string	"Truevision"
.LC475:
	.string	"Thesys"
.LC476:
	.string	"Thesys Microelectronic's"
.LC477:
	.string	"I-O"
.LC478:
	.string	"I-O Data Device Inc."
.LC479:
	.string	"Soyo"
.LC480:
	.string	"Soyo Technology Corp. Ltd."
.LC481:
	.string	"Fast"
.LC482:
	.string	"Fast Electronic GmbH"
.LC483:
	.string	"Ncube"
.LC484:
	.string	"Jazz"
.LC485:
	.string	"Jazz Multimedia"
.LC486:
	.string	"Initio"
.LC487:
	.string	"Initio Corporation"
.LC488:
	.string	"Creative Labs"
.LC489:
	.string	"Creative Technology LTD."
.LC490:
	.string	"Highpoint"
	.align 4
.LC491:
	.string	"Triones Technologies Inc. (HighPoint)"
.LC492:
	.string	"Rasterops"
.LC493:
	.string	"Sigma"
.LC494:
	.string	"Sigma Designs Inc."
.LC495:
	.string	"VIA"
.LC496:
	.string	"VIA Technology"
.LC497:
	.string	"Stratus"
.LC498:
	.string	"Stratus Computer"
.LC499:
	.string	"Proteon"
.LC500:
	.string	"Proteon Inc."
.LC501:
	.string	"Cogent"
	.align 4
.LC502:
	.string	"Adaptec/Cogent Data Technologies"
.LC503:
	.string	"Siemens"
.LC504:
	.string	"Siemens Nixdorf AG"
.LC505:
	.string	"Chromatic"
.LC506:
	.string	"Chromatic Research Inc"
.LC507:
	.string	"Mini-Max"
.LC508:
	.string	"Mini-Max Technology Inc."
.LC509:
	.string	"ZNYX"
.LC510:
	.string	"ZNYX Corporation"
.LC511:
	.string	"CPU Tech."
.LC512:
	.string	"CPU Technology"
.LC513:
	.string	"Ross"
.LC514:
	.string	"Ross Technology"
.LC515:
	.string	"Osicom"
.LC516:
	.string	"Osicom Technologies Inc."
.LC517:
	.string	"Accton"
.LC518:
	.string	"Accton Technology Corporation"
.LC519:
	.string	"Atmel"
.LC520:
	.string	"Atmel Corp."
.LC521:
	.string	"Data Translation"
.LC522:
	.string	"Data Translation, Inc."
.LC523:
	.string	"Datacube"
.LC524:
	.string	"Datacube Inc."
.LC525:
	.string	"Berg"
.LC526:
	.string	"Berg Electronics"
.LC527:
	.string	"Vortex"
	.align 4
.LC528:
	.string	"ICP vortex Computersysteme GmbH"
.LC529:
	.string	"Eff. Net."
.LC530:
	.string	"Efficent Networks"
.LC531:
	.string	"Tricord"
.LC532:
	.string	"Tricord Systems Inc."
.LC533:
	.string	"IDT"
	.align 4
.LC534:
	.string	"Integrated Device Technology Inc."
.LC535:
	.string	"PDI"
.LC536:
	.string	"Precision Digital Images"
.LC537:
	.string	"EMC"
.LC538:
	.string	"EMC Corp."
.LC539:
	.string	"Zilog"
.LC540:
	.string	"EDI"
.LC541:
	.string	"Excellent Design Inc."
.LC542:
	.string	"Leutron"
.LC543:
	.string	"Leutron Vision AG"
.LC544:
	.string	"Eurocore"
.LC545:
	.string	"Eurocore/Vigra"
.LC546:
	.string	"FORE RUNNER LE"
.LC547:
	.string	"FORE Systems"
.LC548:
	.string	"Firmworks"
.LC549:
	.string	"Hermes"
.LC550:
	.string	"Hermes Electronics Co. Ltd."
.LC551:
	.string	"Zenith"
.LC552:
	.string	"Zenith Data Systems"
.LC553:
	.string	"Ravicad"
.LC554:
	.string	"Infomedia"
.LC555:
	.string	"Computervision"
.LC556:
	.string	"72c0ai913629"
.LC557:
	.string	"Philips Semiconductors"
.LC558:
	.string	"Mitel"
.LC559:
	.string	"Mitel Corp."
.LC560:
	.string	"EIC"
.LC561:
	.string	"Eicon Networks Corporation"
.LC562:
	.string	"Mercury Computer Systems Inc."
.LC563:
	.string	"Fuji"
.LC564:
	.string	"Fuji Xerox Co Ltd"
.LC565:
	.string	"Momentum"
.LC566:
	.string	"Momentum Data Systems"
.LC567:
	.string	"Cisco"
.LC568:
	.string	"Cisco Systems Inc"
.LC569:
	.string	"Ziatech"
.LC570:
	.string	"Ziatech Corporation"
.LC571:
	.string	"Dyn. Pict."
.LC572:
	.string	"Dynamic Pictures Inc"
.LC573:
	.string	"FWB"
.LC574:
	.string	"FWB  Inc"
.LC575:
	.string	"NCD"
.LC576:
	.string	"Network Computing Devices"
.LC577:
	.string	"Cyclone"
.LC578:
	.string	"Cyclone Microsystems Inc."
.LC579:
	.string	"Leading Edge"
.LC580:
	.string	"Leading Edge Products Inc"
.LC581:
	.string	"Sanyo"
.LC582:
	.string	"Sanyo Electric Co"
.LC583:
	.string	"Equinox"
.LC584:
	.string	"Equinox Systems"
.LC585:
	.string	"Intervoice"
.LC586:
	.string	"Intervoice Inc"
.LC587:
	.string	"Crest"
.LC588:
	.string	"Crest Microsystem Inc"
.LC589:
	.string	"Alliance"
.LC590:
	.string	"Alliance Semiconductor"
.LC591:
	.string	"Netpower"
.LC592:
	.string	"Netpower Inc"
.LC593:
	.string	"Cinn. Mil."
.LC594:
	.string	"Cincinnati Milacron"
.LC595:
	.string	"Workbit"
.LC596:
	.string	"Workbit Corp"
.LC597:
	.string	"Force"
.LC598:
	.string	"Force Computers"
.LC599:
	.string	"Interface"
.LC600:
	.string	"Interface Corp"
.LC601:
	.string	"Marvell"
	.align 4
.LC602:
	.string	"Marvell Semiconductor Germany GmbH"
.LC603:
	.string	"Win System"
.LC604:
	.string	"Win System Corporation"
.LC605:
	.string	"VMIC"
.LC606:
	.string	"Canopus"
.LC607:
	.string	"Canopus corporation"
.LC608:
	.string	"Annabooks"
.LC609:
	.string	"IC Corp."
.LC610:
	.string	"IC Corporation"
.LC611:
	.string	"Nikon"
.LC612:
	.string	"Nikon Systems Inc"
.LC613:
	.string	"Digi"
.LC614:
	.string	"Digi International"
.LC615:
	.string	"Thinking Machines Corporation"
.LC616:
	.string	"JAE"
.LC617:
	.string	"JAE Electronics Inc."
.LC618:
	.string	"Land Win"
.LC619:
	.string	"Land Win Electronic Corp"
.LC620:
	.string	"Melco"
.LC621:
	.string	"Melco Inc"
.LC622:
	.string	"Pine"
.LC623:
	.string	"Pine Technology Ltd"
.LC624:
	.string	"Periscope"
.LC625:
	.string	"Periscope Engineering"
.LC626:
	.string	"Avsys"
.LC627:
	.string	"Avsys Corporation"
.LC628:
	.string	"Voarx"
.LC629:
	.string	"Voarx R&D Inc"
.LC630:
	.string	"Mutech"
.LC631:
	.string	"Harlequin"
.LC632:
	.string	"Harlequin Ltd"
.LC633:
	.string	"Parallax"
.LC634:
	.string	"Parallax Graphics"
.LC635:
	.string	"Photron"
.LC636:
	.string	"Photron Ltd."
.LC637:
	.string	"Xircom"
.LC638:
	.string	"Peer"
.LC639:
	.string	"Peer Protocols Inc"
.LC640:
	.string	"Maxtorr"
.LC641:
	.string	"Maxtor Corporation"
.LC642:
	.string	"Megasoft"
.LC643:
	.string	"Megasoft Inc"
.LC644:
	.string	"PFU"
.LC645:
	.string	"PFU Ltd"
.LC646:
	.string	"OA Lab"
.LC647:
	.string	"OA Laboratory Co Ltd"
.LC648:
	.string	"Rendition"
.LC649:
	.string	"Rendition Inc"
.LC650:
	.string	"APT"
.LC651:
	.string	"Advanced Peripherals Tech"
.LC652:
	.string	"Imagraph"
.LC653:
	.string	"Imagraph Corporation"
.LC654:
	.string	"BRCM/ServerWorks"
.LC655:
	.string	"Broadcom / ServerWorks"
.LC656:
	.string	"Mutoh"
.LC657:
	.string	"Mutoh Industries Inc"
.LC658:
	.string	"Thine"
.LC659:
	.string	"Thine Electronics Inc"
.LC660:
	.string	"CDAC"
	.align 4
.LC661:
	.string	"Centre f/Dev. of Adv. Computing"
.LC662:
	.string	"Luminex"
.LC663:
	.string	"Luminex Software, Inc"
.LC664:
	.string	"Connectware"
.LC665:
	.string	"Connectware Inc"
.LC666:
	.string	"Int Res."
.LC667:
	.string	"Intelligent Resources"
.LC668:
	.string	"EFI"
.LC669:
	.string	"Electronics for Imaging"
.LC670:
	.string	"Inventec"
.LC671:
	.string	"Inventec Corporation"
.LC672:
	.string	"Altera"
.LC673:
	.string	"Altera Corporation"
.LC674:
	.string	"Adobe"
.LC675:
	.string	"Adobe Systems"
.LC676:
	.string	"Bridgeport"
.LC677:
	.string	"Bridgeport Machines"
.LC678:
	.string	"Mitron"
.LC679:
	.string	"Mitron Computer Inc."
.LC680:
	.string	"SBE"
.LC681:
	.string	"Silicon Eng."
.LC682:
	.string	"Silicon Engineering"
.LC683:
	.string	"Alfa"
.LC684:
	.string	"Alfa Inc"
.LC685:
	.string	"Toshiba"
.LC686:
	.string	"Toshiba America Info Systems"
.LC687:
	.string	"A-Trend"
.LC688:
	.string	"A-Trend Technology"
.LC689:
	.string	"LG"
	.align 4
.LC690:
	.string	"LG (Lucky Goldstar) Electronics Inc."
.LC691:
	.string	"Atto"
.LC692:
	.string	"Atto Technology"
.LC693:
	.string	"B&D"
.LC694:
	.string	"Becton & Dickinson"
.LC695:
	.string	"T/R"
.LC696:
	.string	"T/R Systems"
.LC697:
	.string	"ICS"
.LC698:
	.string	"Integrated Circuit Systems"
.LC699:
	.string	"Ricoh"
.LC700:
	.string	"Ricoh Company, Ltd."
.LC701:
	.string	"Fujikura"
.LC702:
	.string	"Fujikura Ltd"
.LC703:
	.string	"Forks"
.LC704:
	.string	"Forks Inc"
.LC705:
	.string	"Dataworld"
.LC706:
	.string	"D-Link"
.LC707:
	.string	"D-Link System Inc"
.LC708:
	.string	"ATL"
	.align 4
.LC709:
	.string	"Advanced Technology Laboratories"
.LC710:
	.string	"Shima"
	.align 4
.LC711:
	.string	"Shima Seiki Manufacturing Ltd."
.LC712:
	.string	"Matsushita Electronics"
.LC713:
	.string	"Hilevel"
.LC714:
	.string	"Hilevel Technology"
.LC715:
	.string	"Hypertec"
.LC716:
	.string	"Hypertec Pty Ltd"
.LC717:
	.string	"Corollary"
.LC718:
	.string	"Corollary Inc"
.LC719:
	.string	"BitFlow"
.LC720:
	.string	"BitFlow Inc"
.LC721:
	.string	"Hermstedt"
.LC722:
	.string	"Hermstedt AG"
.LC723:
	.string	"Green"
.LC724:
	.string	"Green Logic"
.LC725:
	.string	"Tripace"
.LC726:
	.string	"Acard"
.LC727:
	.string	"Acard Technology Corp."
.LC728:
	.string	"Densan"
.LC729:
	.string	"Densan Co. Ltd"
.LC730:
	.string	"Toucan"
.LC731:
	.string	"Toucan Technology"
.LC732:
	.string	"Ratoc"
.LC733:
	.string	"Ratoc System Inc"
.LC734:
	.string	"Hytec"
.LC735:
	.string	"Hytec Electronics Ltd"
.LC736:
	.string	"Gage"
.LC737:
	.string	"Gage Applied Technologies"
.LC738:
	.string	"Lambda"
.LC739:
	.string	"Lambda Systems Inc"
.LC740:
	.string	"Attachmate"
.LC741:
	.string	"Attachmate Corp."
.LC742:
	.string	"Mind Share"
.LC743:
	.string	"Mind/Share Inc."
.LC744:
	.string	"Omega"
.LC745:
	.string	"Omega Micro Inc."
.LC746:
	.string	"ITI"
.LC747:
	.string	"Information Technology Inst."
.LC748:
	.string	"Bug"
.LC749:
	.string	"Bug Sapporo Japan"
.LC750:
	.string	"Fujitsu Microelectronics Ltd."
.LC751:
	.string	"Bull"
.LC752:
	.string	"Bull Hn Information Systems"
.LC753:
	.string	"Hamamatsu"
.LC754:
	.string	"Hamamatsu Photonics K.K."
	.align 4
.LC755:
	.string	"Sierra Research and Technology"
.LC756:
	.string	"Deuretzbacher"
	.align 4
.LC757:
	.string	"Deuretzbacher GmbH & Co. Eng. KG"
.LC758:
	.string	"Barco"
.LC759:
	.string	"MicroUnity"
	.align 4
.LC760:
	.string	"MicroUnity Systems Engineering Inc."
.LC761:
	.string	"Pure Data"
.LC762:
	.string	"Power Comp."
.LC763:
	.string	"Power Computing Corp."
.LC764:
	.string	"Systech"
.LC765:
	.string	"Systech Corp."
.LC766:
	.string	"InnoSys"
.LC767:
	.string	"InnoSys Inc."
.LC768:
	.string	"Actel"
.LC769:
	.string	"Marvell Semiconductor"
.LC770:
	.string	"Canon"
.LC771:
	.string	"Canon Information Systems"
.LC772:
	.string	"Lite-On"
.LC773:
	.string	"Lite-On Technology Corp."
.LC774:
	.string	"Scitex"
.LC775:
	.string	"Scitex Corporation Ltd"
.LC776:
	.string	"Avid"
.LC777:
	.string	"Avid Technology, Inc."
.LC778:
	.string	"QuickLogic"
.LC779:
	.string	"Quicklogic Corp"
.LC780:
	.string	"Apricot"
.LC781:
	.string	"Apricot Computers"
.LC782:
	.string	"Kodak"
.LC783:
	.string	"Eastman Kodak"
.LC784:
	.string	"Barr"
.LC785:
	.string	"Barr Systems Inc."
.LC786:
	.string	"Leitch"
	.align 4
.LC787:
	.string	"Leitch Technology International"
.LC788:
	.string	"Radstone"
.LC789:
	.string	"Radstone Technology Ltd."
.LC790:
	.string	"United Video"
.LC791:
	.string	"United Video Corp"
.LC792:
	.string	"Xpoint"
.LC793:
	.string	"Xpoint Technologies Inc"
.LC794:
	.string	"Pathlight"
.LC795:
	.string	"Pathlight Technology Inc."
.LC796:
	.string	"Videotron"
.LC797:
	.string	"Videotron Corp"
.LC798:
	.string	"Pyramid"
.LC799:
	.string	"Pyramid Technology"
.LC800:
	.string	"Net. Periph."
.LC801:
	.string	"Network Peripherals Inc"
.LC802:
	.string	"NABOHO"
.LC803:
	.string	"lota"
.LC804:
	.string	"IMI"
	.align 4
.LC805:
	.string	"International Microcircuits Inc"
.LC806:
	.string	"Astrodesign"
.LC807:
	.string	"Astrodesign Inc."
.LC808:
	.string	"Agere"
.LC809:
	.string	"Erick Medina"
.LC810:
	.string	"Sand"
.LC811:
	.string	"Sand Microelectronics"
.LC812:
	.string	"Doc. Tech."
.LC813:
	.string	"Document Technologies Ind."
.LC814:
	.string	"Shiva"
.LC815:
	.string	"Shiva Corporatin"
.LC816:
	.string	"Dainippon"
.LC817:
	.string	"Dainippon Screen Mfg. Co"
.LC818:
	.string	"D.C.M."
.LC819:
	.string	"D.C.M. Data Systems"
.LC820:
	.string	"Dolphin"
	.align 4
.LC821:
	.string	"Dolphin Interconnect Solutions"
.LC822:
	.string	"MAGMA"
.LC823:
	.string	"LSI Sys."
.LC824:
	.string	"LSI Systems Inc"
.LC825:
	.string	"Specialix"
.LC826:
	.string	"Specialix International Ltd."
.LC827:
	.string	"M&K"
	.align 4
.LC828:
	.string	"Michels & Kleberhoff Computer GmbH"
.LC829:
	.string	"HAL"
.LC830:
	.string	"HAL Computer Systems Inc."
.LC831:
	.string	"PRI"
.LC832:
	.string	"Primary Rate Inc"
.LC833:
	.string	"PEC"
	.align 4
.LC834:
	.string	"Pioneer Electronic Corporation"
.LC835:
	.string	"BAE"
.LC836:
	.string	"BAE SYSTEMS - Manassas"
.LC837:
	.string	"AuraVision"
.LC838:
	.string	"AuraVision Corporation"
.LC839:
	.string	"Intercom"
.LC840:
	.string	"Intercom Inc."
.LC841:
	.string	"Trancell"
.LC842:
	.string	"Trancell Systems Inc"
.LC843:
	.string	"ADI"
.LC844:
	.string	"Analog Devices, Inc."
.LC845:
	.string	"Tahoma"
.LC846:
	.string	"Tahoma Technology"
.LC847:
	.string	"Tekelec"
.LC848:
	.string	"Tekelec Technologies"
.LC849:
	.string	"Trenton"
.LC850:
	.string	"TRENTON Technology, Inc."
.LC851:
	.string	"ITD"
	.align 4
.LC852:
	.string	"Image Technologies Development"
.LC853:
	.string	"Tec"
.LC854:
	.string	"Tec Corporation"
.LC855:
	.string	"Novell"
.LC856:
	.string	"Sega"
.LC857:
	.string	"Sega Enterprises Ltd"
.LC858:
	.string	"Questra"
.LC859:
	.string	"Questra Corp"
.LC860:
	.string	"Crosfield"
.LC861:
	.string	"Crosfield Electronics Ltd"
.LC862:
	.string	"Zoran"
.LC863:
	.string	"Zoran Corporation"
.LC864:
	.string	"Gec Plessey"
.LC865:
	.string	"Gec Plessey Semi Inc"
	.align 4
.LC866:
	.string	"Samsung Information Systems America"
.LC867:
	.string	"Second Wave"
.LC868:
	.string	"Second Wave Inc"
.LC869:
	.string	"IIX"
.LC870:
	.string	"IIX Consulting"
.LC871:
	.string	"Mitsui"
.LC872:
	.string	"Mitsui-Zosen System Research"
.LC873:
	.string	"DPSI"
	.align 4
.LC874:
	.string	"Digital Processing Systems Inc"
.LC875:
	.string	"Highwater"
.LC876:
	.string	"Highwater Designs Ltd"
.LC877:
	.string	"Elsag"
.LC878:
	.string	"Elsag Bailey"
.LC879:
	.string	"Formation"
.LC880:
	.string	"Formation, Inc"
.LC881:
	.string	"Coreco"
.LC882:
	.string	"Coreco Inc"
.LC883:
	.string	"Mediamatics"
.LC884:
	.string	"Dome"
.LC885:
	.string	"Dome Imaging Systems Inc"
.LC886:
	.string	"Nicolet"
.LC887:
	.string	"Nicolet Technologies BV"
.LC888:
	.string	"Compu-Shack"
.LC889:
	.string	"Compu-Shack GmbH"
.LC890:
	.string	"Pic-Tel"
.LC891:
	.string	"Picture Tel Japan KK"
.LC892:
	.string	"Keithley"
.LC893:
	.string	"Keithley Metrabyte"
.LC894:
	.string	"Kinetic"
.LC895:
	.string	"Kinetic Systems Corporation"
.LC896:
	.string	"Comp Dev"
.LC897:
	.string	"Computing Devices Intl"
.LC898:
	.string	"Powermatic"
.LC899:
	.string	"Powermatic Data Systems Ltd"
.LC900:
	.string	"S-A"
.LC901:
	.string	"Scientific Atlanta"
.LC902:
	.string	"PMC-Sierra"
.LC903:
	.string	"PMC-Sierra Inc."
.LC904:
	.string	"I-Cube"
.LC905:
	.string	"I-Cube Inc"
.LC906:
	.string	"Kasan"
.LC907:
	.string	"Kasan Electronics Co Ltd"
.LC908:
	.string	"Datel"
.LC909:
	.string	"Datel Inc"
.LC910:
	.string	"High Street"
.LC911:
	.string	"High Street Consultants"
.LC912:
	.string	"Comtrol"
.LC913:
	.string	"Comtrol Corp"
.LC914:
	.string	"Scion"
.LC915:
	.string	"Scion Corp"
.LC916:
	.string	"CSS"
.LC917:
	.string	"CSS Corp"
.LC918:
	.string	"Vista"
.LC919:
	.string	"Vista Controls Corp"
.LC920:
	.string	"Network Gen"
.LC921:
	.string	"Network General Corp"
.LC922:
	.string	"Agfa"
.LC923:
	.string	"Bayer Corporation Agfa Div"
.LC924:
	.string	"Lattice"
.LC925:
	.string	"Lattice Semiconductor Corp"
.LC926:
	.string	"Array"
.LC927:
	.string	"Array Corp"
.LC928:
	.string	"Amdahl"
.LC929:
	.string	"Amdahl Corp"
.LC930:
	.string	"Parsytec"
.LC931:
	.string	"Parsytec GmbH"
.LC932:
	.string	"Sci Sys"
.LC933:
	.string	"Sci Systems Inc"
.LC934:
	.string	"Synaptel"
.LC935:
	.string	"Adaptive"
.LC936:
	.string	"Adaptive Solutions"
.LC937:
	.string	"Comp Labs"
.LC938:
	.string	"Compression Labs Inc."
.LC939:
	.string	"Cyclades"
.LC940:
	.string	"Cyclades Corporation"
.LC941:
	.string	"Essential"
.LC942:
	.string	"Essential Communications"
.LC943:
	.string	"Hyperparallel"
.LC944:
	.string	"Hyperparallel Technologies"
.LC945:
	.string	"Braintech"
.LC946:
	.string	"Braintech Inc"
.LC947:
	.string	"AISI"
	.align 4
.LC948:
	.string	"Applied Intelligent Systems Inc"
.LC949:
	.string	"Perf Tech"
.LC950:
	.string	"Performance Technologies Inc"
.LC951:
	.string	"Interware"
.LC952:
	.string	"Interware Co Ltd"
.LC953:
	.string	"Purup Eskofot"
.LC954:
	.string	"Purup-Eskofot A/S"
.LC955:
	.string	"O2Micro"
.LC956:
	.string	"O2Micro Inc"
.LC957:
	.string	"Hybricon"
.LC958:
	.string	"Hybricon Corp"
.LC959:
	.string	"First Virtual"
.LC960:
	.string	"First Virtual Corp"
.LC961:
	.string	"3dfx"
.LC962:
	.string	"3dfx Interactive Inc"
.LC963:
	.string	"ATM"
	.align 4
.LC964:
	.string	"Advanced Telecommunications Modules"
.LC965:
	.string	"Nippon Texa"
.LC966:
	.string	"Nippon Texa Co Ltd"
.LC967:
	.string	"Lippert"
	.align 4
.LC968:
	.string	"Lippert Automationstechnik GmbH"
.LC969:
	.string	"CSPI"
.LC970:
	.string	"Arcus"
.LC971:
	.string	"Arcus Technology Inc"
.LC972:
	.string	"Ariel"
.LC973:
	.string	"Ariel Corporation"
.LC974:
	.string	"Contec"
	.align 4
.LC975:
	.string	"Contec Microelectronics Europe BV"
.LC976:
	.string	"Ancor"
.LC977:
	.string	"Ancor Communications Inc"
.LC978:
	.string	"Emerson Network Power"
	.align 4
.LC979:
	.string	"Emerson Network Power, Embedded Computing"
.LC980:
	.string	"Int. Img."
.LC981:
	.string	"Interactive Images"
.LC982:
	.string	"Power IO"
.LC983:
	.string	"Power I/O Inc."
.LC984:
	.string	"Tech-Source"
.LC985:
	.string	"Norsk"
.LC986:
	.string	"Norsk Elektro Optikk A/S"
.LC987:
	.string	"Data Kin"
.LC988:
	.string	"Data Kinesis Inc."
.LC989:
	.string	"Int. Telecom"
.LC990:
	.string	"Integrated Telecom"
.LC991:
	.string	"LG Ind."
	.align 4
.LC992:
	.string	"LG Industrial Systems Co. Ltd."
.LC993:
	.string	"sci-worx"
.LC994:
	.string	"sci-worx GmbH"
.LC995:
	.string	"Aztech"
.LC996:
	.string	"Aztech System Ltd"
.LC997:
	.string	"Xyratex"
.LC998:
	.string	"Andrew"
.LC999:
	.string	"Andrew Corp."
.LC1000:
	.string	"Fishcamp"
.LC1001:
	.string	"Fishcamp Engineering"
.LC1002:
	.string	"WMI"
.LC1003:
	.string	"Woodward McCoach Inc."
.LC1004:
	.string	"Bus-Tech"
.LC1005:
	.string	"Bus-Tech Inc."
.LC1006:
	.string	"Bochs"
.LC1007:
	.string	"Sigma Designs"
.LC1008:
	.string	"Sigma Designs, Inc"
.LC1009:
	.string	"Alta Tech"
.LC1010:
	.string	"Alta Technology Corp."
.LC1011:
	.string	"Adtran"
.LC1012:
	.string	"3DO"
.LC1013:
	.string	"The 3DO Company"
.LC1014:
	.string	"Visicom"
.LC1015:
	.string	"Visicom Laboratories Inc."
.LC1016:
	.string	"Seeq"
.LC1017:
	.string	"Seeq Technology Inc."
.LC1018:
	.string	"Century Sys"
.LC1019:
	.string	"Century Systems Inc."
.LC1020:
	.string	"EDT"
.LC1021:
	.string	"Engineering Design Team Inc."
.LC1022:
	.string	"C-Cube"
.LC1023:
	.string	"C-Cube Microsystems"
.LC1024:
	.string	"Marathon"
.LC1025:
	.string	"Marathon Technologies Corp."
.LC1026:
	.string	"DSC"
.LC1027:
	.string	"DSC Communications"
.LC1028:
	.string	"JNI"
.LC1029:
	.string	"JNI Corporation"
.LC1030:
	.string	"Delphax"
.LC1031:
	.string	"AVM"
	.align 4
.LC1032:
	.string	"AVM AUDIOVISUELLES MKTG & Computer GmbH"
.LC1033:
	.string	"APD"
.LC1034:
	.string	"APD S.A."
.LC1035:
	.string	"Dipix"
.LC1036:
	.string	"Dipix Technologies Inc"
.LC1037:
	.string	"Xylon"
.LC1038:
	.string	"Xylon Research Inc."
.LC1039:
	.string	"Central Data"
.LC1040:
	.string	"Central Data Corp."
.LC1041:
	.string	"AEG"
.LC1042:
	.string	"AEG Electrocom GmbH"
.LC1043:
	.string	"Solitron"
.LC1044:
	.string	"Solitron Technologies Inc."
.LC1045:
	.string	"Stallion"
.LC1046:
	.string	"Stallion Technologies"
.LC1047:
	.string	"Cylink"
.LC1048:
	.string	"Infortrend"
.LC1049:
	.string	"Infortrend Technology Inc"
	.align 4
.LC1050:
	.string	"Hitachi Microcomputer System Ltd."
.LC1051:
	.string	"VLSI Sol."
.LC1052:
	.string	"VLSI Solution OY"
.LC1053:
	.string	"Guzik"
.LC1054:
	.string	"Guzik Technical Enterprises"
.LC1055:
	.string	"Linear Systems"
.LC1056:
	.string	"Linear Systems Ltd."
.LC1057:
	.string	"Optibase"
.LC1058:
	.string	"Optibase Ltd."
.LC1059:
	.string	"Perceptive"
.LC1060:
	.string	"Perceptive Solutions Inc."
.LC1061:
	.string	"Vertex"
.LC1062:
	.string	"Vertex Networks Inc."
.LC1063:
	.string	"Gilbarco"
.LC1064:
	.string	"Gilbarco Inc."
.LC1065:
	.string	"Allied Tsyn"
.LC1066:
	.string	"Allied Telesyn International"
.LC1067:
	.string	"ABB Pwr"
.LC1068:
	.string	"ABB Power Systems"
.LC1069:
	.string	"Asix"
.LC1070:
	.string	"Asix Electronics Corp."
.LC1071:
	.string	"Aurora"
.LC1072:
	.string	"Aurora Technologies Inc."
.LC1073:
	.string	"ESS"
.LC1074:
	.string	"ESS Technology"
.LC1075:
	.string	"Specvideo"
.LC1076:
	.string	"Specialvideo Engineering SRL"
.LC1077:
	.string	"Concurrent"
.LC1078:
	.string	"Concurrent Technologies Inc."
.LC1079:
	.string	"Intersil"
.LC1080:
	.string	"Intersil Corporation"
	.align 4
.LC1081:
	.string	"Matsushita-Kotobuki Electronics Indu"
.LC1082:
	.string	"ES Comp."
.LC1083:
	.string	"ES Computer Co. Ltd."
.LC1084:
	.string	"Sonic Sol."
.LC1085:
	.string	"Sonic Solutions"
.LC1086:
	.string	"Aval Nag."
.LC1087:
	.string	"Aval Nagasaki Corp."
.LC1088:
	.string	"Casio"
.LC1089:
	.string	"Casio Computer Co. Ltd."
.LC1090:
	.string	"Microdyne"
.LC1091:
	.string	"Microdyne Corp."
.LC1092:
	.string	"SA Telecom"
.LC1093:
	.string	"S.A. Telecommunications"
.LC1094:
	.string	"Tektronix"
.LC1095:
	.string	"SGS Thomson"
.LC1096:
	.string	"Thomson-CSF/TTM"
.LC1097:
	.string	"Lexmark"
.LC1098:
	.string	"Lexmark International Inc."
.LC1099:
	.string	"Adax"
.LC1100:
	.string	"Adax Inc."
.LC1101:
	.string	"Nortel"
.LC1102:
	.string	"Nortel Networks Corp."
.LC1103:
	.string	"Splash"
.LC1104:
	.string	"Splash Technology Inc."
.LC1105:
	.string	"Sumitomo"
	.align 4
.LC1106:
	.string	"Sumitomo Metal Industries Ltd."
.LC1107:
	.string	"Sil Motion"
.LC1108:
	.string	"Silicon Motion"
.LC1109:
	.string	"Olympus"
.LC1110:
	.string	"Olympus Optical Co. Ltd."
.LC1111:
	.string	"GW Instr."
.LC1112:
	.string	"GW Instruments"
.LC1113:
	.string	"Telematics"
.LC1114:
	.string	"Telematics International"
.LC1115:
	.string	"Hughes"
.LC1116:
	.string	"Hughes Network Systems"
.LC1117:
	.string	"Ensoniq"
.LC1118:
	.string	"NetApp"
.LC1119:
	.string	"Network Appliance"
.LC1120:
	.string	"Sw Net Tech"
	.align 4
.LC1121:
	.string	"Switched Network Technologies Inc."
.LC1122:
	.string	"Comstream"
.LC1123:
	.string	"Transtech"
.LC1124:
	.string	"Transtech Parallel Systems"
.LC1125:
	.string	"Transmeta"
.LC1126:
	.string	"Transmeta Corp."
.LC1127:
	.string	"Pixera"
.LC1128:
	.string	"Pixera Corp"
.LC1129:
	.string	"Crosspoint"
.LC1130:
	.string	"Crosspoint Solutions Inc."
.LC1131:
	.string	"Vela"
.LC1132:
	.string	"Vela Research LP"
.LC1133:
	.string	"Winnow"
.LC1134:
	.string	"Winnov L.P."
.LC1135:
	.string	"Fujifilm"
.LC1136:
	.string	"Photoscript"
.LC1137:
	.string	"Photoscript Group Ltd."
.LC1138:
	.string	"Yokogawa"
.LC1139:
	.string	"Yokogawa Electronic Corp."
.LC1140:
	.string	"Davicom"
.LC1141:
	.string	"Davicom Semiconductor Inc."
.LC1142:
	.string	" Zamora"
.LC1143:
	.string	"Waldo"
.LC1144:
	.string	"Plat Tech"
.LC1145:
	.string	"Platform Technologies Inc."
.LC1146:
	.string	"MAZeT"
.LC1147:
	.string	"MAZeT GmbH"
.LC1148:
	.string	"LuxSonor"
.LC1149:
	.string	"LuxSonor Inc."
.LC1150:
	.string	"Timestep"
.LC1151:
	.string	"Timestep Corp."
.LC1152:
	.string	"AVC Tech"
.LC1153:
	.string	"AVC Technology Inc."
.LC1154:
	.string	"Asante"
.LC1155:
	.string	"Asante Technologies Inc."
.LC1156:
	.string	"Transwitch"
.LC1157:
	.string	"Transwitch Corp."
.LC1158:
	.string	"Retix"
.LC1159:
	.string	"Retix Corp."
.LC1160:
	.string	"G2 Net"
.LC1161:
	.string	"G2 Networks Inc."
.LC1162:
	.string	"Tateno"
.LC1163:
	.string	"Tateno Dennou Inc."
.LC1164:
	.string	"Sord"
.LC1165:
	.string	"Sord Computer Corp."
.LC1166:
	.string	"NCS Comp"
.LC1167:
	.string	"NCS Computer Italia"
.LC1168:
	.string	"Tritech"
	.align 4
.LC1169:
	.string	"Tritech Microelectronics Intl PTE"
.LC1170:
	.string	"M Reality"
.LC1171:
	.string	"Media Reality Technology"
.LC1172:
	.string	"Rhetorex"
.LC1173:
	.string	"Rhetorex Inc."
.LC1174:
	.string	"Imagenation"
.LC1175:
	.string	"Imagenation Corp."
.LC1176:
	.string	"Kofax"
.LC1177:
	.string	"Kofax Image Products"
.LC1178:
	.string	"Shuttle Computer"
.LC1179:
	.string	"Spellcaster"
	.align 4
.LC1180:
	.string	"Spellcaster Telecommunications Inc."
.LC1181:
	.string	"Know Tech"
	.align 4
.LC1182:
	.string	"Knowledge Technology Laboratories"
.LC1183:
	.string	"VMETRO"
.LC1184:
	.string	"VMETRO Inc."
.LC1185:
	.string	"Img Access"
.LC1186:
	.string	"Image Access"
.LC1187:
	.string	"CompCore"
.LC1188:
	.string	"CompCore Multimedia Inc."
.LC1189:
	.string	"Victor Jpn"
.LC1190:
	.string	"Victor Co. of Japan Ltd."
.LC1191:
	.string	"OEC Med"
.LC1192:
	.string	"OEC Medical Systems Inc."
.LC1193:
	.string	"A-B"
.LC1194:
	.string	"Allen Bradley Co."
.LC1195:
	.string	"Simpact"
.LC1196:
	.string	"Simpact Inc"
.LC1197:
	.string	"NewGen"
.LC1198:
	.string	"NewGen Systems Corp."
.LC1199:
	.string	"Lucent"
.LC1200:
	.string	"Lucent Technologies AMR"
.LC1201:
	.string	"NTT Elect"
	.align 4
.LC1202:
	.string	"NTT Electronics Technology Co."
.LC1203:
	.string	"Vision Dyn"
.LC1204:
	.string	"Vision Dynamics Ltd."
.LC1205:
	.string	"Scalable"
.LC1206:
	.string	"Scalable Networks Inc."
.LC1207:
	.string	"AMO"
.LC1208:
	.string	"AMO GmbH"
.LC1209:
	.string	"News Datacom"
.LC1210:
	.string	"Xiotech"
.LC1211:
	.string	"Xiotech Corp."
.LC1212:
	.string	"SDL"
.LC1213:
	.string	"SDL Communications Inc."
.LC1214:
	.string	"Yuan Yuan"
.LC1215:
	.string	"Yuan Yuan Enterprise Co. Ltd."
.LC1216:
	.string	"MeasureX"
.LC1217:
	.string	"MeasureX Corp."
.LC1218:
	.string	"MULTIDATA"
.LC1219:
	.string	"MULTIDATA GmbH"
.LC1220:
	.string	"Alteon"
.LC1221:
	.string	"Alteon Networks Inc."
.LC1222:
	.string	"TDK USA"
.LC1223:
	.string	"TDK USA Corp."
.LC1224:
	.string	"Jorge Sci"
.LC1225:
	.string	"Jorge Scientific Corp."
.LC1226:
	.string	"GammaLink"
.LC1227:
	.string	"Gen Signal"
.LC1228:
	.string	"General Signal Networks"
.LC1229:
	.string	"Inter-Face"
.LC1230:
	.string	"Inter-Face Co. Ltd."
.LC1231:
	.string	"Future Tel"
.LC1232:
	.string	"Future Tel Inc."
.LC1233:
	.string	"Granite"
.LC1234:
	.string	"Granite Systems Inc."
.LC1235:
	.string	"Acumen"
.LC1236:
	.string	"Korg"
.LC1237:
	.string	"Bittware"
.LC1238:
	.string	"Bittware, Inc"
.LC1239:
	.string	"Nippon Uni"
.LC1240:
	.string	"Nippon Unisoft Corp."
.LC1241:
	.string	"Array Micro"
.LC1242:
	.string	"Array Microsystems"
.LC1243:
	.string	"Computerm"
.LC1244:
	.string	"Computerm Corp."
.LC1245:
	.string	"Fujifilm Microdevices"
.LC1246:
	.string	"Infimed"
.LC1247:
	.string	"GMM Res"
.LC1248:
	.string	"GMM Research Corp."
.LC1249:
	.string	"Mentec"
.LC1250:
	.string	"Mentec Ltd."
.LC1251:
	.string	"Holtek"
.LC1252:
	.string	"Holtek Microelectronics Inc."
.LC1253:
	.string	"Connect Tech"
.LC1254:
	.string	"Connect Tech Inc."
.LC1255:
	.string	"PicturEl"
.LC1256:
	.string	"Picture Elements Inc."
.LC1257:
	.string	"Mitani"
.LC1258:
	.string	"Mitani Corp."
.LC1259:
	.string	"Dialogic"
.LC1260:
	.string	"Dialogic Corp."
.LC1261:
	.string	"G Force"
.LC1262:
	.string	"G Force Co. Ltd."
.LC1263:
	.string	"Gigi Ops"
.LC1264:
	.string	"Gigi Operations"
.LC1265:
	.string	"ICE"
	.align 4
.LC1266:
	.string	"Integrated Computing Engines, Inc."
.LC1267:
	.string	"Antex"
.LC1268:
	.string	"Antex Electronics Corp."
.LC1269:
	.string	"Pluto"
	.align 4
.LC1270:
	.string	"Pluto Technologies International"
.LC1271:
	.string	"Aims Lab"
.LC1272:
	.string	"Netspeed"
.LC1273:
	.string	"Netspeed Inc."
.LC1274:
	.string	"Prophet"
.LC1275:
	.string	"Prophet Systems Inc."
.LC1276:
	.string	"GDE Sys"
.LC1277:
	.string	"GDE Systems Inc."
.LC1278:
	.string	"PsiTech"
.LC1279:
	.string	"Vingmed"
.LC1280:
	.string	"Vingmed Sound A/S"
.LC1281:
	.string	"Ulticom"
.LC1282:
	.string	"Ulticom, Inc."
.LC1283:
	.string	"Equator"
.LC1284:
	.string	"Equator Technologies"
.LC1285:
	.string	"Analogic"
.LC1286:
	.string	"Analogic Corp."
.LC1287:
	.string	"Biotronic"
.LC1288:
	.string	"Biotronic SRL"
.LC1289:
	.string	"Pericom"
.LC1290:
	.string	"Pericom Semiconductor"
.LC1291:
	.string	"Aculab"
.LC1292:
	.string	"Aculab Plc."
.LC1293:
	.string	"TrueTime"
.LC1294:
	.string	"Annapolis"
.LC1295:
	.string	"Annapolis Micro Systems Inc."
.LC1296:
	.string	"Symicron"
	.align 4
.LC1297:
	.string	"Symicron Computer Communication Ltd."
.LC1298:
	.string	"MGI"
.LC1299:
	.string	"Management Graphics Inc."
.LC1300:
	.string	"Rainbow"
.LC1301:
	.string	"Rainbow Technologies"
.LC1302:
	.string	"SBS Tech"
.LC1303:
	.string	"SBS Technologies Inc."
.LC1304:
	.string	"Chase"
.LC1305:
	.string	"Chase Research PLC"
.LC1306:
	.string	"Nintendo"
.LC1307:
	.string	"Nintendo Co. Ltd."
.LC1308:
	.string	"Datum"
	.align 4
.LC1309:
	.string	"Datum Inc. Bancomm-Timing Division"
.LC1310:
	.string	"Imation"
	.align 4
.LC1311:
	.string	"Imation Corp. - Medical Imaging Syst"
.LC1312:
	.string	"Brooktrout"
.LC1313:
	.string	"Brooktrout Technology Inc."
.LC1314:
	.string	"Cirel"
.LC1315:
	.string	"Cirel Systems"
.LC1316:
	.string	"Sebring"
.LC1317:
	.string	"Sebring Systems Inc"
.LC1318:
	.string	"CRISC"
.LC1319:
	.string	"CRISC Corp."
.LC1320:
	.string	"GE Spacenet"
.LC1321:
	.string	"Aureal"
.LC1322:
	.string	"Aureal Semiconductor"
.LC1323:
	.string	"3A Intl"
.LC1324:
	.string	"3A International Inc."
.LC1325:
	.string	"Optivision"
.LC1326:
	.string	"Optivision Inc."
.LC1327:
	.string	"Orange Micro"
.LC1328:
	.string	"Orange Micro, Inc."
.LC1329:
	.string	"Vienna"
.LC1330:
	.string	"Vienna Systems"
.LC1331:
	.string	"Pentek"
.LC1332:
	.string	"Sorenson"
.LC1333:
	.string	"Sorenson Vision Inc."
.LC1334:
	.string	"Gammagraphx"
.LC1335:
	.string	"Gammagraphx Inc."
.LC1336:
	.string	"Megatel"
.LC1337:
	.string	"Cognex"
.LC1338:
	.string	"Electronic-Design"
.LC1339:
	.string	"Electronic-Design GmbH"
.LC1340:
	.string	"FFT"
.LC1341:
	.string	"FourFold Technologies"
.LC1342:
	.string	"SSP"
.LC1343:
	.string	"Spectrum Signal Processing"
.LC1344:
	.string	"CEC"
.LC1345:
	.string	"Capital Equipment Corp"
.LC1346:
	.string	"esd"
	.align 4
.LC1347:
	.string	"esd Electronic System Design GmbH"
.LC1348:
	.string	"II"
.LC1349:
	.string	"Innovative Integration"
.LC1350:
	.string	"Juniper Networks Inc."
.LC1351:
	.string	"ComputerBoards"
.LC1352:
	.string	"Jato"
.LC1353:
	.string	"Jato Technologies Inc."
	.align 4
.LC1354:
	.string	"Mitsubishi Electric Microcomputer"
.LC1355:
	.string	"Colorgraphic"
	.align 4
.LC1356:
	.string	"Colorgraphic Communications Corp"
.LC1357:
	.string	"Advanet Inc."
.LC1358:
	.string	"Gespac"
.LC1359:
	.string	"Microscan"
.LC1360:
	.string	"Microscan Systems Inc"
.LC1361:
	.string	"Yaskawa Electric Co."
.LC1362:
	.string	"Teradyne Inc."
.LC1363:
	.string	"ADMtek"
.LC1364:
	.string	"ADMtek Inc"
.LC1365:
	.string	"Packet Engines"
.LC1366:
	.string	"Packet Engines, Inc."
.LC1367:
	.string	"Forte Media2"
.LC1368:
	.string	"Forte Media"
.LC1369:
	.string	"SIIG"
.LC1370:
	.string	"Salix Technologies Inc"
.LC1371:
	.string	"Seachange International"
.LC1372:
	.string	"CIFELLI"
.LC1373:
	.string	"CIFELLI SYSTEMS CORPORATION"
.LC1374:
	.string	"RadiSys"
.LC1375:
	.string	"RadiSys Corporation"
.LC1376:
	.string	"VMetro"
.LC1377:
	.string	"Videomail"
.LC1378:
	.string	"Videomail Inc."
.LC1379:
	.string	"Prisa Networks"
.LC1380:
	.string	"SCM Microsystems"
.LC1381:
	.string	"Promax Systems Inc"
.LC1382:
	.string	"Micron"
.LC1383:
	.string	"Micron Technology, Inc."
.LC1384:
	.string	"Spectracom"
.LC1385:
	.string	"Spectracom Corporation"
.LC1386:
	.string	"DTC Technology Corp."
.LC1387:
	.string	"ARK Research Corp."
.LC1388:
	.string	"Chori Joho System Co. Ltd"
.LC1389:
	.string	"PCTEL"
.LC1390:
	.string	"PCTEL Inc."
.LC1391:
	.string	"Brain Boxes Limited"
.LC1392:
	.string	"Giganet Inc."
.LC1393:
	.string	"Quatech Inc"
.LC1394:
	.string	"ABB Network Partn"
.LC1395:
	.string	"ABB Network Partner AB"
.LC1396:
	.string	"Sealevel"
.LC1397:
	.string	"Sealevel Systems Inc."
.LC1398:
	.string	"I-Data International A-S"
.LC1399:
	.string	"Meinberg Funkuhren"
	.align 4
.LC1400:
	.string	"Meinberg Funkuhren GmbH & Co. KG"
.LC1401:
	.string	"Soliton Systems K.K."
.LC1402:
	.string	"Phoenix Technologies Ltd"
.LC1403:
	.string	"Hypercope"
.LC1404:
	.string	"Hypercope Corp."
.LC1405:
	.string	"Teijin"
.LC1406:
	.string	"Teijin Seiki Co. Ltd."
.LC1407:
	.string	"Hitachi Zosen Corporation"
.LC1408:
	.string	"Skyware Corporation"
.LC1409:
	.string	"Digigram"
.LC1410:
	.string	"Kawasaki Steel Corporation"
.LC1411:
	.string	"Adtek System Science Co Ltd"
.LC1412:
	.string	"Boeing - Sunnyvale"
.LC1413:
	.string	"MOTU"
.LC1414:
	.string	"Mark Of The Unicorn Inc"
.LC1415:
	.string	"PPT Vision"
.LC1416:
	.string	"Iwatsu Electric Co Ltd"
.LC1417:
	.string	"Dynachip Corporation"
.LC1418:
	.string	"PTSC"
.LC1419:
	.string	"Patriot Scientific Corp."
.LC1420:
	.string	"SANRITZ"
.LC1421:
	.string	"Sanritz Automation Co LTC"
.LC1422:
	.string	"Brains Co. Ltd"
.LC1423:
	.string	"Marian"
	.align 4
.LC1424:
	.string	"Marian - Electronic & Software"
.LC1425:
	.string	"Stellar Semiconductor Inc"
.LC1426:
	.string	"Netgear"
.LC1427:
	.string	"Digital Signal Processing"
	.align 4
.LC1428:
	.string	"Hitachi Information Technology Co Ltd"
.LC1429:
	.string	"Applicom"
.LC1430:
	.string	"Applicom International"
.LC1431:
	.string	"Tokimec Inc"
.LC1432:
	.string	"Basler GMBH"
.LC1433:
	.string	"Patapsco Designs Inc"
.LC1434:
	.string	"CDI"
.LC1435:
	.string	"Concept Development Inc."
.LC1436:
	.string	"Moxa Technologies Co Ltd"
.LC1437:
	.string	"Level One"
.LC1438:
	.string	"Level One Communications"
.LC1439:
	.string	"Ambicom Inc"
.LC1440:
	.string	"Cipher Systems Inc"
.LC1441:
	.string	"Cologne"
.LC1442:
	.string	"Cologne Chip Designs GmbH"
.LC1443:
	.string	"Clarion Co. Ltd"
.LC1444:
	.string	"Alacritech Inc"
.LC1445:
	.string	"Xstreams PLC/ EPL Limited"
.LC1446:
	.string	"Echostar Data Networks"
.LC1447:
	.string	"Crystal Group Inc"
.LC1448:
	.string	"Kawasaki Heavy Industries Ltd"
.LC1449:
	.string	"HI-FN"
.LC1450:
	.string	"HI-FN Inc."
.LC1451:
	.string	"Rascom Inc"
.LC1452:
	.string	"amc330"
.LC1453:
	.string	"XR"
.LC1454:
	.string	"Exar Corp."
.LC1455:
	.string	"Siemens Medical Solutions"
	.align 4
.LC1456:
	.string	"Nortel Networks - BWA Division"
.LC1457:
	.string	"T.Sqware"
.LC1458:
	.string	"Tamura Corporation"
.LC1459:
	.string	"Wellbean Co Inc"
.LC1460:
	.string	"ARM Ltd"
.LC1461:
	.string	"pci\013en_13b6"
.LC1462:
	.string	"DLoG GMBH"
.LC1463:
	.string	"Nokia Telecommunications OY"
.LC1464:
	.string	"SHARP"
.LC1465:
	.string	"Sharp Corporation"
.LC1466:
	.string	"Sharewave Inc"
.LC1467:
	.string	"Microgate"
.LC1468:
	.string	"Microgate Corp."
.LC1469:
	.string	"3ware"
.LC1470:
	.string	"3ware Inc."
	.align 4
.LC1471:
	.string	"Technotrend Systemtechnik GMBH"
.LC1472:
	.string	"Janz Computer AG"
.LC1473:
	.string	"Blue Chip Technology Ltd"
.LC1474:
	.string	"Metheus Corporation"
.LC1475:
	.string	"Studio Audio & Video Ltd"
.LC1476:
	.string	"A"
.LC1477:
	.string	"B2C2 Inc"
.LC1478:
	.string	"AboCom"
.LC1479:
	.string	"AboCom Systems, Inc"
.LC1480:
	.string	"Graphics Microsystems Inc"
.LC1481:
	.string	"K.I. Technology Co Ltd"
.LC1482:
	.string	"tos6205"
	.align 4
.LC1483:
	.string	"Toshiba Engineering Corporation"
.LC1484:
	.string	"Phobos Corporation"
.LC1485:
	.string	"Apex Inc"
.LC1486:
	.string	"Netboost Corporation"
.LC1487:
	.string	"ABB Robotics Products AB"
.LC1488:
	.string	"E-Tech"
.LC1489:
	.string	"E-Tech Inc."
.LC1490:
	.string	"GVC"
.LC1491:
	.string	"GVC Corporation"
.LC1492:
	.string	"Nest Inc"
.LC1493:
	.string	"Calculex Inc"
.LC1494:
	.string	"Telesoft Design Ltd"
.LC1495:
	.string	"Intraserver Technology Inc"
.LC1496:
	.string	"Dallas Semiconductor"
.LC1497:
	.string	"IC Plus Corporation"
.LC1498:
	.string	"OCE - Industries S.A."
.LC1499:
	.string	"Troika Networks Inc"
.LC1500:
	.string	"C-Media"
.LC1501:
	.string	"C-Media Electronics Inc."
.LC1502:
	.string	"NTT Advanced Technology Corp."
.LC1503:
	.string	"Pentland"
.LC1504:
	.string	"Pentland Systems Ltd."
.LC1505:
	.string	"Aydin Corp"
.LC1506:
	.string	"Micro Science Inc"
.LC1507:
	.string	"Advantech"
.LC1508:
	.string	"Advantech Co., Ltd."
.LC1509:
	.string	"Silicon Spice Inc."
.LC1510:
	.string	"ArtX"
.LC1511:
	.string	"ArtX Inc"
.LC1512:
	.string	"Meilhaus Electronic"
	.align 4
.LC1513:
	.string	"Meilhaus Electronic GmbH Germany"
.LC1514:
	.string	"Fundamental Software Inc"
.LC1515:
	.string	"Oc"
	.align 4
.LC1516:
	.string	"Oce Print Logics Technologies S.A."
.LC1517:
	.string	"LAVA"
.LC1518:
	.string	"Lava Computer MFG Inc."
.LC1519:
	.string	"Aloka Co. Ltd"
.LC1520:
	.string	"SUNIX"
.LC1521:
	.string	"SUNIX Co., Ltd."
.LC1522:
	.string	"DSP Research Inc"
.LC1523:
	.string	"Ramix Inc"
.LC1524:
	.string	"Matsushita Electric Works Ltd"
.LC1525:
	.string	"Salient Systems Corp"
.LC1526:
	.string	"IC Ensemble"
.LC1527:
	.string	"IC Ensemble, Inc."
.LC1528:
	.string	"Addonics"
.LC1529:
	.string	"Oxford"
.LC1530:
	.string	"Oxford Semiconductor Ltd"
	.align 4
.LC1531:
	.string	"Kyushu Electronics Systems Inc"
.LC1532:
	.string	"Excel Switching Corp"
.LC1533:
	.string	"Gerd Mokwinski"
.LC1534:
	.string	"Zoom Telephonics Inc"
.LC1535:
	.string	"Fanuc Co. Ltd"
.LC1536:
	.string	"Visiontech Ltd"
.LC1537:
	.string	"Psion Dacom PLC"
.LC1538:
	.string	"ASIC Designers Inc"
.LC1539:
	.string	"Edec Co Ltd"
.LC1540:
	.string	"Unex Technology Corp."
.LC1541:
	.string	"Kingmax Technology Inc"
.LC1542:
	.string	"Radiolan"
.LC1543:
	.string	"Minton Optic Industry Co Ltd"
.LC1544:
	.string	"Pixstream Inc"
	.align 4
.LC1545:
	.string	"ITT Aerospace/Communications Division"
.LC1546:
	.string	"Eltec Elektronik AG"
.LC1547:
	.string	"RTD"
	.align 4
.LC1548:
	.string	"RTD Embedded Technologies, Inc."
.LC1549:
	.string	"CIS Technology Inc"
.LC1550:
	.string	"Nissin Inc Co"
.LC1551:
	.string	"Atmel-Dream"
	.align 4
.LC1552:
	.string	"Lightwell Co Ltd - Zax Division"
.LC1553:
	.string	"Agie SA."
.LC1554:
	.string	"Unibrain"
.LC1555:
	.string	"Unibrain S.A."
.LC1556:
	.string	"Logical Co Ltd"
.LC1557:
	.string	"Graphin Co. Ltd"
.LC1558:
	.string	"Aim GMBH"
.LC1559:
	.string	"Alesis"
.LC1560:
	.string	"Alesis Studio"
.LC1561:
	.string	"ADLINK"
.LC1562:
	.string	"ADLINK Technology Inc"
.LC1563:
	.string	"Loronix"
	.align 4
.LC1564:
	.string	"Loronix Information Systems, Inc."
.LC1565:
	.string	"sanyo"
.LC1566:
	.string	"Octave Communications Ind."
.LC1567:
	.string	"SP3D Chip Design GMBH"
.LC1568:
	.string	"Mycom Inc"
.LC1569:
	.string	"Giga-Byte"
.LC1570:
	.string	"Giga-Byte Technologies"
.LC1571:
	.string	"Cryptek"
.LC1572:
	.string	"Baldor"
.LC1573:
	.string	"Baldor Electric Company"
.LC1574:
	.string	"Dynarc Inc"
.LC1575:
	.string	"MSI"
	.align 4
.LC1576:
	.string	"Micro-Star International Co Ltd"
.LC1577:
	.string	"Fast Corporation"
	.align 4
.LC1578:
	.string	"Interactive Circuits & Systems Ltd"
.LC1579:
	.string	"Ambit Microsystems Corp."
.LC1580:
	.string	"Cleveland Motion Controls"
.LC1581:
	.string	"Ruby Tech Corp."
.LC1582:
	.string	"Tachyon Inc."
.LC1583:
	.string	"WMS Gaming"
	.align 4
.LC1584:
	.string	"Integrated Telecom Express Inc"
.LC1585:
	.string	"Zapex Technologies Inc"
.LC1586:
	.string	"Doug Carson & Associates"
.LC1587:
	.string	"Net Insight"
.LC1588:
	.string	"Diatrend Corporation"
.LC1589:
	.string	"Abit Computer Corp."
.LC1590:
	.string	"Nihon Unisys Ltd."
	.align 4
.LC1591:
	.string	"Isytec - Integrierte Systemtechnik Gmbh"
.LC1592:
	.string	"Labway Coporation"
.LC1593:
	.string	"Erma - Electronic GMBH"
.LC1594:
	.string	"KYE Systems Corporation"
.LC1595:
	.string	"Opto 22"
.LC1596:
	.string	"Innomedialogic Inc."
.LC1597:
	.string	"CP (PowerColor)"
.LC1598:
	.string	"C.P. Technology Co. Ltd"
.LC1599:
	.string	"Digicom Systems Inc."
.LC1600:
	.string	"OSI Plus Corporation"
.LC1601:
	.string	"Plant Equipment Inc."
.LC1602:
	.string	"TC Labs Pty Ltd."
.LC1603:
	.string	"Maker Communications"
	.align 4
.LC1604:
	.string	"Tokai Communications Industry Co. Ltd"
.LC1605:
	.string	"Joytech Computer Co. Ltd."
.LC1606:
	.string	"SMA"
.LC1607:
	.string	"SMA Technologie AG"
.LC1608:
	.string	"Tews"
.LC1609:
	.string	"Tews Technologies"
.LC1610:
	.string	"Micro-Technology Co Ltd"
.LC1611:
	.string	"Andor Tech"
.LC1612:
	.string	"Andor Technology Ltd"
.LC1613:
	.string	"Seiko Instruments Inc"
.LC1614:
	.string	"Mapletree Networks Inc."
.LC1615:
	.string	"Lectron Co Ltd"
.LC1616:
	.string	"Softing GMBH"
.LC1617:
	.string	"Millennium Engineering Inc"
.LC1618:
	.string	"sebastien"
.LC1619:
	.string	"GVC/BCM Advanced Research"
.LC1620:
	.string	"Hivertec Inc."
.LC1621:
	.string	"Mentor Graphics Corp."
.LC1622:
	.string	"Nextcom K.K."
.LC1623:
	.string	"Xpeed"
.LC1624:
	.string	"Xpeed Inc."
	.align 4
.LC1625:
	.string	"Philips Business Electronics B.V."
.LC1626:
	.string	"Creamware"
.LC1627:
	.string	"Creamware GmbH"
.LC1628:
	.string	"Quantum Data Corp."
.LC1629:
	.string	"Proxim"
.LC1630:
	.string	"Proxim Inc."
.LC1631:
	.string	"Aironet"
	.align 4
.LC1632:
	.string	"Aironet Wireless Communication"
.LC1633:
	.string	"Internix Inc."
.LC1634:
	.string	"Semtech Corporation"
.LC1635:
	.string	"L3 Communications"
.LC1636:
	.string	"Compal"
.LC1637:
	.string	"Compal Electronics, Inc."
.LC1638:
	.string	"Myricom Inc."
.LC1639:
	.string	"DTK Computer"
	.align 4
.LC1640:
	.string	"Iwasaki Information Systems Co Ltd"
.LC1641:
	.string	"ABB Automation Products AB"
.LC1642:
	.string	"Data Race Inc"
.LC1643:
	.string	"Modtech"
.LC1644:
	.string	"Modular Technology Ltd."
.LC1645:
	.string	"Turbocomm"
.LC1646:
	.string	"Turbocomm Tech Inc"
.LC1647:
	.string	"Odin Telesystems Inc"
	.align 4
.LC1648:
	.string	"Billionton Systems Inc./Cadmus Micro Inc"
.LC1649:
	.string	"Universal Scientific Ind."
.LC1650:
	.string	"Tekmicro"
.LC1651:
	.string	"TEK Microsystems Inc."
.LC1652:
	.string	"PANACOM"
	.align 4
.LC1653:
	.string	"Panacom Technology Corporation"
.LC1654:
	.string	"Nitsuko Corporation"
.LC1655:
	.string	"Accusys Inc"
.LC1656:
	.string	"Hirakawa Hewtech Corp"
.LC1657:
	.string	"Hopf Elektronik GMBH"
.LC1658:
	.string	"Alpha Processor Inc"
.LC1659:
	.string	"Avlab"
.LC1660:
	.string	"Avlab Technology Inc."
.LC1661:
	.string	"Amplicon"
.LC1662:
	.string	"Amplicon Liveline Limited"
.LC1663:
	.string	"Imodl Inc."
	.align 4
.LC1664:
	.string	"Applied Integration Corporation"
.LC1665:
	.string	"Amtelco"
.LC1666:
	.string	"Broadcom"
.LC1667:
	.string	"Broadcom Corporation"
.LC1668:
	.string	"Planex"
.LC1669:
	.string	"Planex Communications, Inc."
.LC1670:
	.string	"Acqiris"
.LC1671:
	.string	"Datakinetics Ltd"
.LC1672:
	.string	"Carry Computer Eng. Co Ltd"
.LC1673:
	.string	"Conexant"
.LC1674:
	.string	"Mobility"
.LC1675:
	.string	"Mobility Electronics, Inc."
	.align 4
.LC1676:
	.string	"Tokyo Electronic Industry Co. Ltd."
.LC1677:
	.string	"Sopac Ltd"
.LC1678:
	.string	"Coyote Technologies LLC"
.LC1679:
	.string	"Wolf Technology Inc"
.LC1680:
	.string	"Audiocodes Inc"
.LC1681:
	.string	"AG Communications"
.LC1682:
	.string	"Transas Marine (UK) Ltd"
.LC1683:
	.string	"Quadrics Ltd"
.LC1684:
	.string	"Silex"
.LC1685:
	.string	"Silex Technology Inc."
.LC1686:
	.string	"Archtek Telecom Corp."
.LC1687:
	.string	"Twinhead International Corp."
.LC1688:
	.string	"Banksoft Canada Ltd"
	.align 4
.LC1689:
	.string	"Mitsubishi Electric Logistics Support Co"
.LC1690:
	.string	"Kawasaki LSI USA Inc"
.LC1691:
	.string	"Kaiser Electronics"
.LC1692:
	.string	"Chameleon Systems Inc"
.LC1693:
	.string	"Htec"
.LC1694:
	.string	"Htec Ltd."
	.align 4
.LC1695:
	.string	"First International Computer Inc"
.LC1696:
	.string	"Yamashita Systems Corp"
.LC1697:
	.string	"Kyopal Co Ltd"
.LC1698:
	.string	"Warpspped Inc"
.LC1699:
	.string	"C-Port Corporation"
.LC1700:
	.string	"Intec GMBH"
.LC1701:
	.string	"Behavior Tech Computer Corp"
.LC1702:
	.string	"Centillium Technology Corp"
.LC1703:
	.string	"Rosen"
.LC1704:
	.string	"Rosun Technologies Inc"
.LC1705:
	.string	"Raychem"
.LC1706:
	.string	"TFL LAN Inc"
.LC1707:
	.string	"ICS Advent"
.LC1708:
	.string	"Myson Technology Inc"
.LC1709:
	.string	"Echotek Corporation"
	.align 4
.LC1710:
	.string	"Kontron Modular Computers GmbH (PEP Modular Computers GMBH)"
	.align 4
.LC1711:
	.string	"Telefon Aktiebolaget LM Ericsson"
.LC1712:
	.string	"Globetek"
.LC1713:
	.string	"Globetek Inc."
.LC1714:
	.string	"wesam"
.LC1715:
	.string	"Combox Ltd"
.LC1716:
	.string	"Digital Audio Labs Inc"
	.align 4
.LC1717:
	.string	"Fujitsu Computer Products Of America"
.LC1718:
	.string	"Matrix Corp."
.LC1719:
	.string	"Topic Semiconductor Corp"
.LC1720:
	.string	"Chaplet System Inc"
.LC1721:
	.string	"Bell Corporation"
.LC1722:
	.string	"Mainpine"
.LC1723:
	.string	"Mainpine Limited"
.LC1724:
	.string	"Music Semiconductors"
.LC1725:
	.string	"mayer"
.LC1726:
	.string	"ENE Technology Inc"
.LC1727:
	.string	"Impact Technologies"
.LC1728:
	.string	"ISS Inc"
.LC1729:
	.string	"Solectron"
.LC1730:
	.string	"Acksys"
.LC1731:
	.string	"American Microsystems Inc"
.LC1732:
	.string	"Quickturn Design Systems"
.LC1733:
	.string	"Flytech Technology Co Ltd"
.LC1734:
	.string	"Macraigor Systems LLC"
.LC1735:
	.string	"Quanta Computer Inc"
.LC1736:
	.string	"Melec Inc"
.LC1737:
	.string	"Philips - Crypto"
.LC1738:
	.string	"Echelon Corporation"
.LC1739:
	.string	"Baltimore"
.LC1740:
	.string	"Road Corporation"
.LC1741:
	.string	"Evergreen Technologies Inc"
.LC1742:
	.string	"Datalex Communcations"
.LC1743:
	.string	"Aralion"
.LC1744:
	.string	"Aralion Inc."
	.align 4
.LC1745:
	.string	"Atelier Informatiques et Electronique Et"
.LC1746:
	.string	"ONO Sokki"
.LC1747:
	.string	"cami"
.LC1748:
	.string	"Terratec Electronic GMBH"
.LC1749:
	.string	"Antal Electronic"
.LC1750:
	.string	"Filanet Corporation"
.LC1751:
	.string	"Techwell"
.LC1752:
	.string	"Techwell Inc"
.LC1753:
	.string	"MIPS"
.LC1754:
	.string	"MIPS Technologies, Inc"
.LC1755:
	.string	"Provideo Multimedia Co Ltd"
.LC1756:
	.string	"Telocity Inc."
.LC1757:
	.string	"Vivid Technology Inc"
.LC1758:
	.string	"Silicon Laboratories"
.LC1759:
	.string	"DCM"
.LC1760:
	.string	"DCM Technologies Ltd."
.LC1761:
	.string	"Visiontek"
.LC1762:
	.string	"VisionTek"
.LC1763:
	.string	"IOI Technology Corp."
.LC1764:
	.string	"Mitutoyo Corporation"
.LC1765:
	.string	"Jet Propulsion Laboratory"
.LC1766:
	.string	"ISS"
	.align 4
.LC1767:
	.string	"Interconnect Systems Solutions"
.LC1768:
	.string	"Max Technologies Inc."
.LC1769:
	.string	"Computex Co Ltd"
.LC1770:
	.string	"Visual Technology Inc."
	.align 4
.LC1771:
	.string	"PAN International Industrial Corp"
.LC1772:
	.string	"Servotest Ltd"
.LC1773:
	.string	"Stratabeam Technology"
.LC1774:
	.string	"Open Network Co Ltd"
	.align 4
.LC1775:
	.string	"Smart Electronic Development GMBH"
.LC1776:
	.string	"Chicony Electronics Co Ltd"
.LC1777:
	.string	"PMC"
.LC1778:
	.string	"Prolink Microsystems Corp."
.LC1779:
	.string	"Gesytec"
.LC1780:
	.string	"Gesytec GmbH"
.LC1781:
	.string	"PLD Applications"
.LC1782:
	.string	"Mediastar Co. Ltd"
.LC1783:
	.string	"Clevo/Kapok Computer"
.LC1784:
	.string	"SI Logic Ltd"
.LC1785:
	.string	"Innomedia Inc"
.LC1786:
	.string	"Protac International Corp"
.LC1787:
	.string	"s"
.LC1788:
	.string	"MAC System Co Ltd"
.LC1789:
	.string	"KR"
.LC1790:
	.string	"KUKA Roboter GmbH"
.LC1791:
	.string	"Perle Systems Limited"
	.align 4
.LC1792:
	.string	"Terayon Communications Systems"
.LC1793:
	.string	"Viewgraphics Inc"
.LC1794:
	.string	"Symbol Technologies, Inc."
.LC1795:
	.string	"A-Trend Technology Co Ltd"
	.align 4
.LC1796:
	.string	"Yamakatsu Electronics Industry Co Ltd"
.LC1797:
	.string	"xyz"
.LC1798:
	.string	"Biostar Microtech Intl Corp"
.LC1799:
	.string	"Ardent Technologies Inc"
.LC1800:
	.string	"Jungsoft"
.LC1801:
	.string	"DDK Electronics Inc"
.LC1802:
	.string	"AleksSPb"
.LC1803:
	.string	"Palit Microsystems Inc"
.LC1804:
	.string	"Avtec"
.LC1805:
	.string	"Avtec Systems Inc"
.LC1806:
	.string	"S2io Inc"
.LC1807:
	.string	"Vidac Electronics GMBH"
.LC1808:
	.string	"Alpha-Top Corp"
.LC1809:
	.string	"Alfa Inc."
	.align 4
.LC1810:
	.string	"M-Systems Flash Disk Pioneers Ltd"
.LC1811:
	.string	"Lecroy Corporation"
.LC1812:
	.string	"Contemporary Controls"
.LC1813:
	.string	"Otis Elevator Company"
.LC1814:
	.string	"Lattice - Vantis"
.LC1815:
	.string	"Fairchild Semiconductor"
	.align 4
.LC1816:
	.string	"Voltaire Advanced Data Security Ltd"
.LC1817:
	.string	"Viewcast Com"
.LC1818:
	.string	"Hitt"
.LC1819:
	.string	"Dual Technology Corporation"
.LC1820:
	.string	"Japan Elecronics Ind. Inc"
.LC1821:
	.string	"Star Multimedia Corp."
.LC1822:
	.string	"Eurosoft"
.LC1823:
	.string	"Eurosoft (UK)"
.LC1824:
	.string	"Gemflex Networks"
.LC1825:
	.string	"Transition Networks"
.LC1826:
	.string	"PX Instruments Technology Ltd"
.LC1827:
	.string	"Primex Aerospace Co."
.LC1828:
	.string	"SEH Computertechnik GMBH"
.LC1829:
	.string	"Cytec Corporation"
.LC1830:
	.string	"Inet Technologies Inc"
.LC1831:
	.string	"Uniwill Computer Corp."
.LC1832:
	.string	"Marconi Commerce Systems SRL"
.LC1833:
	.string	"Lancast Inc"
.LC1834:
	.string	"Konica Corporation"
.LC1835:
	.string	"Solidum"
.LC1836:
	.string	"Solidum Systems Corp"
.LC1837:
	.string	"Atlantek Microsystems Pty Ltd"
.LC1838:
	.string	"Digalog Systems Inc"
.LC1839:
	.string	"Allied Data Technologies"
	.align 4
.LC1840:
	.string	"Hitachi Semiconductor & Devices Sales Co"
.LC1841:
	.string	"Point Multimedia Systems"
.LC1842:
	.string	"Lara Technology Inc"
.LC1843:
	.string	"Ditect Coop"
.LC1844:
	.string	"3pardata Inc."
.LC1845:
	.string	"ARN"
.LC1846:
	.string	"Syba"
.LC1847:
	.string	"Syba Tech Ltd."
.LC1848:
	.string	"Bops Inc"
.LC1849:
	.string	"Netgame Ltd"
.LC1850:
	.string	"Diva Systems Corp."
.LC1851:
	.string	"Folsom Research Inc"
.LC1852:
	.string	"Memec Design Services"
.LC1853:
	.string	"Granite Microsystems"
.LC1854:
	.string	"Delta Electronics Inc"
.LC1855:
	.string	"General Instrument"
.LC1856:
	.string	"Faraday Technology Corp"
.LC1857:
	.string	"Stratus Computer Systems"
	.align 4
.LC1858:
	.string	"Ningbo Harrison Electronics Co Ltd"
.LC1859:
	.string	"A-Max Technology Co Ltd"
.LC1860:
	.string	"Galea Network Security"
.LC1861:
	.string	"Compumaster SRL"
.LC1862:
	.string	"Geocast Network Systems Inc"
.LC1863:
	.string	"Catalyst Enterprises Inc"
.LC1864:
	.string	"Italtel"
.LC1865:
	.string	"X-Net OY"
.LC1866:
	.string	"Toyota MACS Inc"
	.align 4
.LC1867:
	.string	"Sunlight Ultrasound Technologies Ltd"
.LC1868:
	.string	"SSE Telecom Inc"
	.align 4
.LC1869:
	.string	"Shanghai Communications Technologies Cen"
.LC1870:
	.string	"Moreton Bay"
.LC1871:
	.string	"Bluesteel Networks Inc"
.LC1872:
	.string	"North Atlantic Instruments"
.LC1873:
	.string	"VMware"
.LC1874:
	.string	"VMware Inc."
.LC1875:
	.string	"Amersham Pharmacia Biotech"
.LC1876:
	.string	"Zoltrix International Limited"
.LC1877:
	.string	"Source Technology Inc"
.LC1878:
	.string	"Mosaid Technologies Inc."
.LC1879:
	.string	"Mellanox Technology"
.LC1880:
	.string	"CCI/Triad"
.LC1881:
	.string	"Cimetrics Inc"
.LC1882:
	.string	"Texas Memory Systems Inc"
.LC1883:
	.string	"Sandisk Corp."
.LC1884:
	.string	"Addi-Data GMBH"
	.align 4
.LC1885:
	.string	"Maestro Digital Communications"
.LC1886:
	.string	"Impacct Technology Corp"
.LC1887:
	.string	"Portwell Inc"
.LC1888:
	.string	"Agilent"
.LC1889:
	.string	"Agilent Technologies"
.LC1890:
	.string	"Sola Electronics"
.LC1891:
	.string	"High Tech Computer Corp (HTC)"
.LC1892:
	.string	"BVM"
.LC1893:
	.string	"BVM Limited"
.LC1894:
	.string	"Quantel"
.LC1895:
	.string	"Newer Technology Inc"
.LC1896:
	.string	"Taiwan Mycomp Co Ltd"
.LC1897:
	.string	"EVSX Inc"
.LC1898:
	.string	"Procomp Informatics Ltd"
	.align 4
.LC1899:
	.string	"Technical University Of Budapest"
	.align 4
.LC1900:
	.string	"Tateyama System Laboratory Co Ltd"
.LC1901:
	.string	"Penta Media Co. Ltd"
.LC1902:
	.string	"Serome Technology Inc"
.LC1903:
	.string	"Bitboys OY"
.LC1904:
	.string	"AG Electronics Ltd"
.LC1905:
	.string	"Hotrail Inc."
.LC1906:
	.string	"Dreamtech Co Ltd"
.LC1907:
	.string	"Genrad Inc."
.LC1908:
	.string	"Hilscher GMBH"
.LC1909:
	.string	"Infineon"
.LC1910:
	.string	"Infineon Technologies AG"
	.align 4
.LC1911:
	.string	"FIC (First International Computer Inc)"
.LC1912:
	.string	"NDS Technologies Israel Ltd"
.LC1913:
	.string	"Iwill Corporation"
.LC1914:
	.string	"Tatung Co."
.LC1915:
	.string	"Entridia Corporation"
.LC1916:
	.string	"Rockwell-Collins Inc"
.LC1917:
	.string	"Cybernetics Technology Co Ltd"
.LC1918:
	.string	"Super Micro Computer Inc"
.LC1919:
	.string	"Cyberfirm Inc."
	.align 4
.LC1920:
	.string	"Applied Computing Systems Inc."
.LC1921:
	.string	"Litronic"
.LC1922:
	.string	"Litronic Inc."
.LC1923:
	.string	"jjk"
.LC1924:
	.string	"Sigmatel Inc."
.LC1925:
	.string	"Malleable Technologies Inc"
.LC1926:
	.string	"Cacheflow Inc"
.LC1927:
	.string	"VTG"
.LC1928:
	.string	"Voice Technologies Group"
.LC1929:
	.string	"Quicknet Technologies Inc"
.LC1930:
	.string	"Networth Technologies Inc"
.LC1931:
	.string	"VSN Systemen BV"
.LC1932:
	.string	"Valley Technologies Inc"
.LC1933:
	.string	"Agere Inc."
.LC1934:
	.string	"GET Engineering Corp."
.LC1935:
	.string	"National Datacomm Corp."
.LC1936:
	.string	"Pacific Digital Corp."
.LC1937:
	.string	"Tokyo Denshi Sekei K.K."
.LC1938:
	.string	"Drsearch GMBH"
.LC1939:
	.string	"Beckhoff GMBH"
.LC1940:
	.string	"Macrolink Inc"
.LC1941:
	.string	"IN Win Development Inc."
.LC1942:
	.string	"Intelligent Paradigm Inc"
.LC1943:
	.string	"B-Tree Systems Inc"
.LC1944:
	.string	"Times N Systems Inc"
.LC1945:
	.string	"Diagnostic Instruments Inc"
.LC1946:
	.string	"Digitmedia Corp."
.LC1947:
	.string	"Valuesoft"
.LC1948:
	.string	"Power Micro Research"
.LC1949:
	.string	"Extreme Packet Device Inc"
.LC1950:
	.string	"Banctec"
.LC1951:
	.string	"Koga Electronics Co"
.LC1952:
	.string	"Zenith Electronics Co"
.LC1953:
	.string	"Axzam"
.LC1954:
	.string	"Axzam Corporation"
.LC1955:
	.string	"Zilog Inc."
.LC1956:
	.string	"Techsan Electronics Co Ltd"
.LC1957:
	.string	"N-Cubed.Net"
.LC1958:
	.string	"Kinpo Electronics Inc"
.LC1959:
	.string	"Fastpoint Technologies Inc."
.LC1960:
	.string	"Northrop Grumman - Canada Ltd"
.LC1961:
	.string	"Tenta Technology"
.LC1962:
	.string	"Prosys-TEC Inc."
	.align 4
.LC1963:
	.string	"Nokia Wireless Business Communications"
	.align 4
.LC1964:
	.string	"Central System Research Co Ltd"
.LC1965:
	.string	"Pairgain Technologies"
.LC1966:
	.string	"Europop AG"
	.align 4
.LC1967:
	.string	"Lava Semiconductor Manufacturing Inc."
	.align 4
.LC1968:
	.string	"Automated Wagering International"
.LC1969:
	.string	"Sciemetric Instruments Inc"
.LC1970:
	.string	"Kollmorgen Servotronix"
.LC1971:
	.string	"Onkyo Corp."
.LC1972:
	.string	"Oregon Micro Systems Inc."
.LC1973:
	.string	"Aaeon Electronics Inc"
.LC1974:
	.string	"CML Emergency Services"
.LC1975:
	.string	"ITEC Co Ltd"
.LC1976:
	.string	"Tottori Sanyo Electric Co Ltd"
.LC1977:
	.string	"Bel Fuse Inc."
.LC1978:
	.string	"Telesynergy Research Inc."
.LC1979:
	.string	"System Craft Inc."
.LC1980:
	.string	"Jace Tech Inc."
.LC1981:
	.string	"Equus Computer Systems Inc"
.LC1982:
	.string	"Iotech Inc."
.LC1983:
	.string	"Rapidstream Inc"
.LC1984:
	.string	"Esec SA"
.LC1985:
	.string	"FarSite"
	.align 4
.LC1986:
	.string	"FarSite Communications Limited"
.LC1987:
	.string	"Mobilian Israel Ltd"
.LC1988:
	.string	"Berkshire Products"
.LC1989:
	.string	"Gatec"
.LC1990:
	.string	"Kyoei Sangyo Co Ltd"
.LC1991:
	.string	"Arima"
.LC1992:
	.string	"Arima Computer Corporation"
.LC1993:
	.string	"Sigmacom Co Ltd"
.LC1994:
	.string	"Lynx Studio Technology Inc"
.LC1995:
	.string	"NHC"
.LC1996:
	.string	"Nokia Home Communications"
.LC1997:
	.string	"KRF Tech Ltd"
.LC1998:
	.string	"CE Infosys GMBH"
.LC1999:
	.string	"Warp Nine Engineering"
.LC2000:
	.string	"TDK Semiconductor Corp."
.LC2001:
	.string	"BCom Electronics Inc"
.LC2002:
	.string	"Kongsberg Spacetec a.s."
.LC2003:
	.string	"Sejin Computerland Co Ltd"
.LC2004:
	.string	"Shanghai Bell Company Limited"
.LC2005:
	.string	"C&H Technologies Inc"
.LC2006:
	.string	"Reprosoft Co Ltd"
.LC2007:
	.string	"Margi Systems Inc"
.LC2008:
	.string	"Rohde & Schwarz GMBH & Co KG"
.LC2009:
	.string	"Sky Computers Inc"
.LC2010:
	.string	"NEC Computer International"
.LC2011:
	.string	"Verisys Inc"
.LC2012:
	.string	"Adac Corporation"
.LC2013:
	.string	"Visionglobal Network Corp."
.LC2014:
	.string	"Decros"
.LC2015:
	.string	"Jean Company Ltd"
.LC2016:
	.string	"NSI"
.LC2017:
	.string	" Eumitcom Technology Inc"
.LC2018:
	.string	"Eumitcom Technology Inc"
.LC2019:
	.string	"Air Prime Inc"
.LC2020:
	.string	"Glotrex Co Ltd"
.LC2021:
	.string	"intel"
.LC2022:
	.string	"Heidelberg Digital LLC"
	.align 4
.LC2023:
	.string	"&#1074;&#1083;&#1072;&#1076;&#1080;&#1084;&#1080;&"
.LC2024:
	.string	"3dpower"
.LC2025:
	.string	"Renishaw PLC"
.LC2026:
	.string	"Intelliworxx Inc"
.LC2027:
	.string	"MKNet Corporation"
.LC2028:
	.string	"Bitland"
.LC2029:
	.string	"Hajime Industries Ltd"
.LC2030:
	.string	"Western Avionics Ltd"
.LC2031:
	.string	"Quick-Serv. Computer Co. Ltd"
.LC2032:
	.string	"Nippon Systemware Co Ltd"
.LC2033:
	.string	"Hertz Systemtechnik GMBH"
.LC2034:
	.string	"MeltDown Systems LLC"
.LC2035:
	.string	"Jupiter Systems"
.LC2036:
	.string	"Aiwa Co. Ltd"
.LC2037:
	.string	"Department Of Defense"
.LC2038:
	.string	"Ishoni Networks"
.LC2039:
	.string	"Micrel Inc."
.LC2040:
	.string	"DataVoice"
.LC2041:
	.string	"Datavoice (Pty) Ltd."
.LC2042:
	.string	"Admore Technology Inc."
.LC2043:
	.string	"Chaparral Network Storage"
.LC2044:
	.string	"Spectrum Digital Inc."
.LC2045:
	.string	"Naturetech"
	.align 4
.LC2046:
	.string	"Nature Worldwide Technology Corp"
.LC2047:
	.string	"Sonicwall Inc"
.LC2048:
	.string	"Dazzle Multimedia Inc."
.LC2049:
	.string	"Insyde Software Corp"
	.align 4
.LC2050:
	.string	"Brocade Communications Systems"
.LC2051:
	.string	"Med Associates Inc."
.LC2052:
	.string	"Shiba Denshi Systems Inc."
.LC2053:
	.string	"Epix Inc."
.LC2054:
	.string	"Real-Time Digital Inc."
.LC2055:
	.string	"Kondo Kagaku"
	.align 4
.LC2056:
	.string	"Hsing Tech. Enterprise Co. Ltd."
.LC2057:
	.string	"Hyunju Computer Co. Ltd."
.LC2058:
	.string	"Comart"
.LC2059:
	.string	"Comartsystem Korea"
	.align 4
.LC2060:
	.string	"Network Security Technologies Inc. (Net"
.LC2061:
	.string	"Worldspace Corp."
.LC2062:
	.string	"Int Labs"
.LC2063:
	.string	"Elmec Inc. Ltd."
.LC2064:
	.string	"Fastfame Technology Co. Ltd."
.LC2065:
	.string	"Edax Inc."
.LC2066:
	.string	"Norpak Corporation"
.LC2067:
	.string	"CoSystems Inc."
.LC2068:
	.string	"Actiontec"
.LC2069:
	.string	"Actiontec Electronics Inc."
.LC2070:
	.string	"Komatsu Ltd."
.LC2071:
	.string	"Supernet Inc."
.LC2072:
	.string	"Shade Ltd."
.LC2073:
	.string	"Sibyte Inc."
.LC2074:
	.string	"Schneider Automation Inc."
.LC2075:
	.string	"Televox Software Inc."
.LC2076:
	.string	"Rearden Steel"
.LC2077:
	.string	"Atan Technology Inc."
.LC2078:
	.string	"Unitec Co. Ltd."
.LC2079:
	.string	"pctel"
.LC2080:
	.string	"Square Wave Technology"
.LC2081:
	.string	"Emachines Inc."
.LC2082:
	.string	"Bernecker + Rainer"
.LC2083:
	.string	"INH Semiconductor"
.LC2084:
	.string	"Tokyo Electron Device Ltd."
.LC2085:
	.string	"iba"
.LC2086:
	.string	"iba AG"
.LC2087:
	.string	"Dunti"
.LC2088:
	.string	"Dunti Corp."
.LC2089:
	.string	"Hercules"
.LC2090:
	.string	"PINE"
.LC2091:
	.string	"PINE Technology, Ltd."
.LC2092:
	.string	"CastleNet"
.LC2093:
	.string	"CastleNet Technology Inc."
.LC2094:
	.string	"USA"
.LC2095:
	.string	"Utimaco Safeware AG"
.LC2096:
	.string	"Circut Assembly Corp."
.LC2097:
	.string	"Atheros"
.LC2098:
	.string	"Atheros Communications Inc."
.LC2099:
	.string	"NMI"
.LC2100:
	.string	"NMI Electronics Ltd."
.LC2101:
	.string	"Hyundai MultiCAV"
	.align 4
.LC2102:
	.string	"Hyundai MultiCAV Computer Co. Ltd."
.LC2103:
	.string	"qsb"
.LC2104:
	.string	"KDS Innotech Corp."
.LC2105:
	.string	"NetContinuum"
.LC2106:
	.string	"NetContinuum, Inc."
.LC2107:
	.string	"FERMA"
.LC2108:
	.string	"EPoX"
.LC2109:
	.string	"EPoX Computer Co., Ltd."
.LC2110:
	.string	"SFNT"
.LC2111:
	.string	"SafeNet Inc."
.LC2112:
	.string	"CNF Mobile Solutions"
.LC2113:
	.string	"Sonnet Technologies"
.LC2114:
	.string	"Sonnet Technologies, Inc."
.LC2115:
	.string	"Cenatek"
.LC2116:
	.string	"Cenatek Inc."
.LC2117:
	.string	"Minolta"
.LC2118:
	.string	"Minolta Co. Ltd."
.LC2119:
	.string	"Inari"
.LC2120:
	.string	"Inari Inc."
.LC2121:
	.string	"Systemax"
.LC2122:
	.string	"3MTS"
	.align 4
.LC2123:
	.string	"Third Millenium Test Solutions, Inc."
.LC2124:
	.string	"Intellon Corporation"
.LC2125:
	.string	"USR"
.LC2126:
	.string	"U.S. Robotics"
.LC2127:
	.string	"TLA Inc."
.LC2128:
	.string	"Adicti"
.LC2129:
	.string	"Adicti Corp."
.LC2130:
	.string	"Jetway"
.LC2131:
	.string	"Jetway Information Co., Ltd"
.LC2132:
	.string	"VideoTele.com"
.LC2133:
	.string	"VideoTele.com Inc."
.LC2134:
	.string	"Antara"
.LC2135:
	.string	"Antara LLC"
	.align 4
.LC2136:
	.string	"Interactive Computer Products Inc."
.LC2137:
	.string	"IMC"
.LC2138:
	.string	"Internet Machines Corp."
.LC2139:
	.string	"Desana"
.LC2140:
	.string	"Desana Systems"
.LC2141:
	.string	"Clearwater"
.LC2142:
	.string	"Clearwater Networks"
.LC2143:
	.string	"Digital First"
.LC2144:
	.string	"PBC"
	.align 4
.LC2145:
	.string	"Pacific Broadband Communications"
.LC2146:
	.string	"Cogency"
.LC2147:
	.string	"Cogency Semiconductor Inc."
.LC2148:
	.string	"Harris"
.LC2149:
	.string	"Harris Corp."
.LC2150:
	.string	"Zarlink"
.LC2151:
	.string	"Zarlink Semiconductor"
.LC2152:
	.string	"Alpine"
.LC2153:
	.string	"Alpine Electronics Inc."
.LC2154:
	.string	"NetOctave"
.LC2155:
	.string	"NetOctave Inc."
.LC2156:
	.string	"YottaYotta"
.LC2157:
	.string	"YottaYotta Inc."
.LC2158:
	.string	"SMI"
.LC2159:
	.string	"SensoMotoric Instruments GmbH"
.LC2160:
	.string	"San Valley"
.LC2161:
	.string	"San Valley Systems, Inc."
.LC2162:
	.string	"Cyberdyne"
.LC2163:
	.string	"Cyberdyne Inc."
.LC2164:
	.string	"Pelago"
.LC2165:
	.string	"Pelago Nutworks"
.LC2166:
	.string	"NetScreen"
.LC2167:
	.string	"MyName Technologies, Inc."
.LC2168:
	.string	"NICE"
.LC2169:
	.string	"NICE Systems Inc."
.LC2170:
	.string	"TOPCON"
.LC2171:
	.string	"TOPCON Corp."
.LC2172:
	.string	"Fujitsu-Siemens"
	.align 4
.LC2173:
	.string	"Fujitsu-Siemens Computers GmbH"
.LC2174:
	.string	"LinkSys"
.LC2175:
	.string	"Altima"
.LC2176:
	.string	"Altima Communications Inc."
.LC2177:
	.string	"Peppercon"
.LC2178:
	.string	"Peppercon AG"
.LC2179:
	.string	"PC Partner (Sapphire)"
.LC2180:
	.string	"PC Partner Limited"
.LC2181:
	.string	"AMW Europe GmbH"
	.align 4
.LC2182:
	.string	"Global Brands Manufacture Ltd."
.LC2183:
	.string	"TeraRecon"
.LC2184:
	.string	"TeraRecon, Inc."
.LC2185:
	.string	"Alchemy"
.LC2186:
	.string	"Alchemy Semiconductor Inc."
.LC2187:
	.string	"GDC"
.LC2188:
	.string	"General Dynamics Canada"
.LC2189:
	.string	"Ennyah"
.LC2190:
	.string	"Ennyah Technologies Corp"
.LC2191:
	.string	"Unitech"
.LC2192:
	.string	"Unitech Electronics Co., Ltd"
.LC2193:
	.string	"Start Network"
	.align 4
.LC2194:
	.string	"Start Network Technology Co., Ltd."
.LC2195:
	.string	"lenovo"
.LC2196:
	.string	"Legend Ltd. (Beijing)"
.LC2197:
	.string	"Phillips Components"
.LC2198:
	.string	"Hightech"
	.align 4
.LC2199:
	.string	"Hightech Information Systems, Ltd."
.LC2200:
	.string	"Philips"
.LC2201:
	.string	"Wistron"
.LC2202:
	.string	"Wistron Corp."
.LC2203:
	.string	"Movita"
.LC2204:
	.string	"NetChip"
.LC2205:
	.string	"Neterion"
.LC2206:
	.string	"Neterion Inc."
.LC2207:
	.string	"DH electronics GmbH"
.LC2208:
	.string	"Connect3D"
.LC2209:
	.string	"Connect Components, Ltd."
.LC2210:
	.string	"Ambient"
.LC2211:
	.string	"phillip rees"
.LC2212:
	.string	"Ralink Technology"
.LC2213:
	.string	"Ralink Technology, Corp"
.LC2214:
	.string	"devolo"
.LC2215:
	.string	"devolo AG"
.LC2216:
	.string	"InfiniCon"
.LC2217:
	.string	"InfiniCon Systems, Inc."
.LC2218:
	.string	"Avocent"
.LC2219:
	.string	"Primagraphics"
.LC2220:
	.string	"Primagraphics Ltd."
.LC2221:
	.string	"Humusoft"
.LC2222:
	.string	"Humusoft S.R.O"
.LC2223:
	.string	"Elan"
.LC2224:
	.string	"Elan Digital Systems Ltd"
.LC2225:
	.string	"Varisys Limited"
.LC2226:
	.string	"Millogic"
.LC2227:
	.string	"Millogic Ltd."
.LC2228:
	.string	"Egenera, Inc."
.LC2229:
	.string	"Info-Tek Corp."
.LC2230:
	.string	"ARVOO"
.LC2231:
	.string	"ARVOO Engineering BV"
.LC2232:
	.string	"XGI"
.LC2233:
	.string	"XGI Technology Inc"
.LC2234:
	.string	"Spc"
	.align 4
.LC2235:
	.string	"Spectrum Systementwicklung Microelectronic GmbH"
.LC2236:
	.string	"Napatech"
.LC2237:
	.string	"Napatech A/S"
.LC2238:
	.string	"Commtech"
.LC2239:
	.string	"Commtech, Inc."
.LC2240:
	.string	"Resilience Corporation"
.LC2241:
	.string	"WIS Computers"
.LC2242:
	.string	"WIS Technology, Inc."
.LC2243:
	.string	"Seaway Networks"
.LC2244:
	.string	"AGEIA Technologies, Inc."
.LC2245:
	.string	"DAQDATA"
.LC2246:
	.string	"DAQDATA GmbH"
.LC2247:
	.string	"Kasten Chase"
.LC2248:
	.string	"Kasten Chase Applied Research"
.LC2249:
	.string	"Vector"
.LC2250:
	.string	"Vector Informatik GmbH"
.LC2251:
	.string	"Linux Networx"
.LC2252:
	.string	"Imaginant"
.LC2253:
	.string	"Jaton Corp"
.LC2254:
	.string	"Jaton Corporation USA"
.LC2255:
	.string	"Miranda"
.LC2256:
	.string	"Miranda Technologies Ltd."
.LC2257:
	.string	"Temporal Research Ltd"
.LC2258:
	.string	"Kingston"
.LC2259:
	.string	"Kingston Technology Co."
.LC2260:
	.string	"ChainTech"
.LC2261:
	.string	"ChainTech Computer Co. Ltd."
.LC2262:
	.string	"Zenic Inc"
.LC2263:
	.string	"Hint"
.LC2264:
	.string	"Hint Corp."
.LC2265:
	.string	"Quantum Designs (H.K.) Inc."
.LC2266:
	.string	"ARCOM"
.LC2267:
	.string	"ARCOM Control Systems Ltd."
.LC2268:
	.string	"4links"
.LC2269:
	.string	"3DLabs"
.LC2270:
	.string	"3Dlabs, Inc. Ltd"
.LC2271:
	.string	"Avance"
.LC2272:
	.string	"Avance Logic Inc."
.LC2273:
	.string	"Alpha Data"
.LC2274:
	.string	"Aladdin Knowledge Systems"
.LC2275:
	.string	"UMAX Comp"
.LC2276:
	.string	"UMAX Computer Corp."
.LC2277:
	.string	"Hercules Computer Technology"
.LC2278:
	.string	"Growth Networks"
.LC2279:
	.string	"Integral"
.LC2280:
	.string	"Integral Technologies"
.LC2281:
	.string	"Axil"
.LC2282:
	.string	"Axil Computer Inc."
.LC2283:
	.string	"Lung Hwa"
.LC2284:
	.string	"Lung Hwa Electronics"
.LC2285:
	.string	"SBS"
.LC2286:
	.string	"SBS-OR Industrial Computers"
.LC2287:
	.string	"Seanix Technology Inc"
.LC2288:
	.string	"Mediaq"
.LC2289:
	.string	"Mediaq Inc."
.LC2290:
	.string	"Microtechnica Co Ltd"
.LC2291:
	.string	"ILC"
.LC2292:
	.string	"ILC Data Device Corp."
.LC2293:
	.string	"TBS/Voyetra"
.LC2294:
	.string	"TBS/Voyetra Technologies"
.LC2295:
	.string	"S S Technologies"
.LC2296:
	.string	"Qualcomm"
.LC2297:
	.string	"Qualcomm Inc."
.LC2298:
	.string	"S3 86c765"
.LC2299:
	.string	"S3 Graphics Co., Ltd"
.LC2300:
	.string	"Teralogic Inc"
.LC2301:
	.string	"Genroco"
.LC2302:
	.string	"Genroco Inc."
.LC2303:
	.string	"Logitec Corp."
.LC2304:
	.string	"Decision"
	.align 4
.LC2305:
	.string	"Decision Computer International Co."
.LC2306:
	.string	"O.N."
.LC2307:
	.string	"O.N. Electric Co. Ltd."
.LC2308:
	.string	"Intel"
.LC2309:
	.string	"Intel Corporation"
.LC2310:
	.string	"T-Square"
.LC2311:
	.string	"T-Square Design Inc."
.LC2312:
	.string	"Sil Magic"
.LC2313:
	.string	"Silicon Magic"
.LC2314:
	.string	"Computone"
.LC2315:
	.string	"Computone Corporation"
.LC2316:
	.string	"Adaptec"
.LC2317:
	.string	"Adaptec Inc"
.LC2318:
	.string	"Gigapixel Corp"
.LC2319:
	.string	"Omni Media Technology Inc."
.LC2320:
	.string	"StarGen"
.LC2321:
	.string	"StarGen, Inc."
.LC2322:
	.string	"Aopen"
.LC2323:
	.string	"Aopen Inc."
.LC2324:
	.string	"Unisys Corporation"
.LC2325:
	.string	"NEC Corp."
.LC2326:
	.string	"Hewlett Packard"
.LC2327:
	.string	"3com Corporation"
.LC2328:
	.string	"Scitex Digital Video"
	.align 4
.LC2329:
	.string	"Digital Receiver Technology Inc"
.LC2330:
	.string	"Shiva Europe Ltd."
.LC2331:
	.string	"Brown & Sharpe Mfg. Co."
.LC2332:
	.string	"Mindstream Computing"
.LC2333:
	.string	"TSI"
.LC2334:
	.string	"TSI Telsys"
.LC2335:
	.string	"Micron/Crucial"
.LC2336:
	.string	"Micron/Crucial Technology"
.LC2337:
	.string	"Mot Engrg"
.LC2338:
	.string	"Motion Engineering Inc."
.LC2339:
	.string	"Hudson Soft Co Ltd"
.LC2340:
	.string	"Varian"
.LC2341:
	.string	"Varian, Inc"
.LC2342:
	.string	"Chrysalis-ITS"
.LC2343:
	.string	"Catapult Communications"
.LC2344:
	.string	"Processing"
.LC2345:
	.string	"Dawicontrol"
.LC2346:
	.string	"Indigita"
.LC2347:
	.string	"Indigita Corporation"
.LC2348:
	.string	"Middle Digital, Inc"
.LC2349:
	.string	"Tiger Jet"
.LC2350:
	.string	"Tiger Jet Network Inc"
.LC2351:
	.string	"EKF Elektronik GMBH"
.LC2352:
	.string	"Eagle Technology"
.LC2353:
	.string	"Aashima"
.LC2354:
	.string	"Aashima Technology B.V."
.LC2355:
	.string	"Endace"
	.align 4
.LC2356:
	.string	"Endace Measurement Systems Ltd."
.LC2357:
	.string	"Echo"
	.align 4
.LC2358:
	.string	"Echo Digital Audio Corporation"
.LC2359:
	.string	"ARK Logic"
.LC2360:
	.string	"ARK Logic, Inc"
.LC2361:
	.string	"F5 Networks Inc."
.LC2362:
	.string	"Interagon"
.LC2363:
	.string	"Interagon AS"
	.data
	.align 32
	.type	PciVenTable, @object
	.size	PciVenTable, 17976
PciVenTable:
	.value	51
	.zero	2
	.long	.LC42
	.long	.LC43
	.value	61
	.zero	2
	.long	.LC44
	.long	.LC45
	.value	112
	.zero	2
	.long	.LC46
	.long	.LC47
	.value	256
	.zero	2
	.long	.LC48
	.long	.LC49
	.value	291
	.zero	2
	.long	.LC42
	.long	.LC50
	.value	789
	.zero	2
	.long	.LC42
	.long	.LC51
	.value	2697
	.zero	2
	.long	.LC52
	.long	.LC53
	.value	3601
	.zero	2
	.long	.LC54
	.long	.LC55
	.value	4096
	.zero	2
	.long	.LC56
	.long	.LC57
	.value	4097
	.zero	2
	.long	.LC58
	.long	.LC59
	.value	4098
	.zero	2
	.long	.LC60
	.long	.LC61
	.value	4099
	.zero	2
	.long	.LC62
	.long	.LC62
	.value	4100
	.zero	2
	.long	.LC63
	.long	.LC64
	.value	4102
	.zero	2
	.long	.LC65
	.long	.LC66
	.value	4103
	.zero	2
	.long	.LC67
	.long	.LC68
	.value	4104
	.zero	2
	.long	.LC69
	.long	.LC69
	.value	4106
	.zero	2
	.long	.LC70
	.long	.LC71
	.value	4107
	.zero	2
	.long	.LC72
	.long	.LC73
	.value	4108
	.zero	2
	.long	.LC74
	.long	.LC75
	.value	4109
	.zero	2
	.long	.LC76
	.long	.LC77
	.value	4110
	.zero	2
	.long	.LC78
	.long	.LC78
	.value	4112
	.zero	2
	.long	.LC79
	.long	.LC80
	.value	4113
	.zero	2
	.long	.LC81
	.long	.LC82
	.value	4114
	.zero	2
	.long	.LC83
	.long	.LC84
	.value	4115
	.zero	2
	.long	.LC85
	.long	.LC86
	.value	4116
	.zero	2
	.long	.LC87
	.long	.LC88
	.value	4118
	.zero	2
	.long	.LC89
	.long	.LC90
	.value	4119
	.zero	2
	.long	.LC91
	.long	.LC92
	.value	4120
	.zero	2
	.long	.LC93
	.long	.LC94
	.value	4121
	.zero	2
	.long	.LC95
	.long	.LC96
	.value	4122
	.zero	2
	.long	.LC97
	.long	.LC98
	.value	4123
	.zero	2
	.long	.LC99
	.long	.LC100
	.value	4126
	.zero	2
	.long	.LC101
	.long	.LC102
	.value	4127
	.zero	2
	.long	.LC103
	.long	.LC104
	.value	4128
	.zero	2
	.long	.LC105
	.long	.LC106
	.value	4129
	.zero	2
	.long	.LC107
	.long	.LC108
	.value	4130
	.zero	2
	.long	.LC109
	.long	.LC110
	.value	4131
	.zero	2
	.long	.LC111
	.long	.LC112
	.value	4133
	.zero	2
	.long	.LC113
	.long	.LC114
	.value	4136
	.zero	2
	.long	.LC115
	.long	.LC116
	.value	4138
	.zero	2
	.long	.LC56
	.long	.LC117
	.value	4139
	.zero	2
	.long	.LC118
	.long	.LC119
	.value	4140
	.zero	2
	.long	.LC120
	.long	.LC121
	.value	4141
	.zero	2
	.long	.LC122
	.long	.LC123
	.value	4142
	.zero	2
	.long	.LC124
	.long	.LC125
	.value	4143
	.zero	2
	.long	.LC126
	.long	.LC127
	.value	4144
	.zero	2
	.long	.LC128
	.long	.LC129
	.value	4145
	.zero	2
	.long	.LC130
	.long	.LC131
	.value	4147
	.zero	2
	.long	.LC132
	.long	.LC133
	.value	4148
	.zero	2
	.long	.LC134
	.long	.LC135
	.value	4150
	.zero	2
	.long	.LC136
	.long	.LC137
	.value	4151
	.zero	2
	.long	.LC105
	.long	.LC138
	.value	4152
	.zero	2
	.long	.LC139
	.long	.LC140
	.value	4153
	.zero	2
	.long	.LC141
	.long	.LC142
	.value	4154
	.zero	2
	.long	.LC143
	.long	.LC144
	.value	4155
	.zero	2
	.long	.LC145
	.long	.LC146
	.value	4156
	.zero	2
	.long	.LC147
	.long	.LC148
	.value	4158
	.zero	2
	.long	.LC149
	.long	.LC150
	.value	4159
	.zero	2
	.long	.LC151
	.long	.LC152
	.value	4161
	.zero	2
	.long	.LC153
	.long	.LC153
	.value	4163
	.zero	2
	.long	.LC154
	.long	.LC155
	.value	4164
	.zero	2
	.long	.LC156
	.long	.LC157
	.value	4165
	.zero	2
	.long	.LC158
	.long	.LC159
	.value	4166
	.zero	2
	.long	.LC160
	.long	.LC161
	.value	4167
	.zero	2
	.long	.LC162
	.long	.LC163
	.value	4168
	.zero	2
	.long	.LC164
	.long	.LC165
	.value	4169
	.zero	2
	.long	.LC166
	.long	.LC167
	.value	4170
	.zero	2
	.long	.LC168
	.long	.LC169
	.value	4171
	.zero	2
	.long	.LC42
	.long	.LC170
	.value	4172
	.zero	2
	.long	.LC171
	.long	.LC172
	.value	4173
	.zero	2
	.long	.LC173
	.long	.LC174
	.value	4174
	.zero	2
	.long	.LC175
	.long	.LC176
	.value	4175
	.zero	2
	.long	.LC177
	.long	.LC178
	.value	4176
	.zero	2
	.long	.LC179
	.long	.LC180
	.value	4177
	.zero	2
	.long	.LC181
	.long	.LC182
	.value	4179
	.zero	2
	.long	.LC183
	.long	.LC184
	.value	4180
	.zero	2
	.long	.LC105
	.long	.LC185
	.value	4181
	.zero	2
	.long	.LC186
	.long	.LC187
	.value	4182
	.zero	2
	.long	.LC188
	.long	.LC188
	.value	4183
	.zero	2
	.long	.LC189
	.long	.LC189
	.value	4184
	.zero	2
	.long	.LC190
	.long	.LC191
	.value	4185
	.zero	2
	.long	.LC192
	.long	.LC193
	.value	4186
	.zero	2
	.long	.LC194
	.long	.LC195
	.value	4187
	.zero	2
	.long	.LC196
	.long	.LC197
	.value	4188
	.zero	2
	.long	.LC198
	.long	.LC199
	.value	4189
	.zero	2
	.long	.LC200
	.long	.LC201
	.value	4190
	.zero	2
	.long	.LC202
	.long	.LC203
	.value	4191
	.zero	2
	.long	.LC204
	.long	.LC205
	.value	4192
	.zero	2
	.long	.LC206
	.long	.LC207
	.value	4193
	.zero	2
	.long	.LC208
	.long	.LC209
	.value	4194
	.zero	2
	.long	.LC210
	.long	.LC211
	.value	4195
	.zero	2
	.long	.LC212
	.long	.LC213
	.value	4196
	.zero	2
	.long	.LC214
	.long	.LC215
	.value	4197
	.zero	2
	.long	.LC216
	.long	.LC217
	.value	4198
	.zero	2
	.long	.LC218
	.long	.LC219
	.value	4199
	.zero	2
	.long	.LC220
	.long	.LC221
	.value	4200
	.zero	2
	.long	.LC222
	.long	.LC223
	.value	4202
	.zero	2
	.long	.LC224
	.long	.LC225
	.value	4203
	.zero	2
	.long	.LC226
	.long	.LC227
	.value	4204
	.zero	2
	.long	.LC228
	.long	.LC229
	.value	4205
	.zero	2
	.long	.LC230
	.long	.LC231
	.value	4206
	.zero	2
	.long	.LC232
	.long	.LC233
	.value	4207
	.zero	2
	.long	.LC234
	.long	.LC235
	.value	4208
	.zero	2
	.long	.LC236
	.long	.LC237
	.value	4209
	.zero	2
	.long	.LC238
	.long	.LC238
	.value	4210
	.zero	2
	.long	.LC239
	.long	.LC240
	.value	4211
	.zero	2
	.long	.LC241
	.long	.LC242
	.value	4212
	.zero	2
	.long	.LC243
	.long	.LC244
	.value	4213
	.zero	2
	.long	.LC245
	.long	.LC246
	.value	4215
	.zero	2
	.long	.LC247
	.long	.LC248
	.value	4216
	.zero	2
	.long	.LC249
	.long	.LC250
	.value	4217
	.zero	2
	.long	.LC251
	.long	.LC251
	.value	4218
	.zero	2
	.long	.LC252
	.long	.LC253
	.value	4219
	.zero	2
	.long	.LC254
	.long	.LC255
	.value	4220
	.zero	2
	.long	.LC256
	.long	.LC257
	.value	4221
	.zero	2
	.long	.LC258
	.long	.LC259
	.value	4222
	.zero	2
	.long	.LC260
	.long	.LC261
	.value	4223
	.zero	2
	.long	.LC262
	.long	.LC263
	.value	4224
	.zero	2
	.long	.LC264
	.long	.LC265
	.value	4225
	.zero	2
	.long	.LC266
	.long	.LC266
	.value	4226
	.zero	2
	.long	.LC267
	.long	.LC268
	.value	4227
	.zero	2
	.long	.LC269
	.long	.LC270
	.value	4228
	.zero	2
	.long	.LC271
	.long	.LC271
	.value	4229
	.zero	2
	.long	.LC272
	.long	.LC273
	.value	4230
	.zero	2
	.long	.LC274
	.long	.LC275
	.value	4231
	.zero	2
	.long	.LC276
	.long	.LC277
	.value	4232
	.zero	2
	.long	.LC278
	.long	.LC279
	.value	4233
	.zero	2
	.long	.LC280
	.long	.LC281
	.value	4234
	.zero	2
	.long	.LC282
	.long	.LC283
	.value	4236
	.zero	2
	.long	.LC284
	.long	.LC285
	.value	4237
	.zero	2
	.long	.LC286
	.long	.LC286
	.value	4238
	.zero	2
	.long	.LC287
	.long	.LC288
	.value	4239
	.zero	2
	.long	.LC289
	.long	.LC290
	.value	4240
	.zero	2
	.long	.LC291
	.long	.LC292
	.value	4241
	.zero	2
	.long	.LC293
	.long	.LC294
	.value	4242
	.zero	2
	.long	.LC295
	.long	.LC296
	.value	4243
	.zero	2
	.long	.LC297
	.long	.LC298
	.value	4244
	.zero	2
	.long	.LC299
	.long	.LC300
	.value	4245
	.zero	2
	.long	.LC301
	.long	.LC302
	.value	4246
	.zero	2
	.long	.LC303
	.long	.LC303
	.value	4247
	.zero	2
	.long	.LC304
	.long	.LC305
	.value	4248
	.zero	2
	.long	.LC306
	.long	.LC307
	.value	4249
	.zero	2
	.long	.LC308
	.long	.LC309
	.value	4250
	.zero	2
	.long	.LC310
	.long	.LC311
	.value	4251
	.zero	2
	.long	.LC312
	.long	.LC313
	.value	4252
	.zero	2
	.long	.LC314
	.long	.LC315
	.value	4253
	.zero	2
	.long	.LC316
	.long	.LC317
	.value	4254
	.zero	2
	.long	.LC318
	.long	.LC319
	.value	4255
	.zero	2
	.long	.LC320
	.long	.LC321
	.value	4256
	.zero	2
	.long	.LC322
	.long	.LC323
	.value	4257
	.zero	2
	.long	.LC324
	.long	.LC325
	.value	4258
	.zero	2
	.long	.LC306
	.long	.LC326
	.value	4259
	.zero	2
	.long	.LC327
	.long	.LC328
	.value	4260
	.zero	2
	.long	.LC329
	.long	.LC330
	.value	4261
	.zero	2
	.long	.LC331
	.long	.LC332
	.value	4264
	.zero	2
	.long	.LC333
	.long	.LC334
	.value	4265
	.zero	2
	.long	.LC335
	.long	.LC336
	.value	4267
	.zero	2
	.long	.LC337
	.long	.LC337
	.value	4268
	.zero	2
	.long	.LC338
	.long	.LC339
	.value	4269
	.zero	2
	.long	.LC179
	.long	.LC340
	.value	4270
	.zero	2
	.long	.LC341
	.long	.LC342
	.value	4271
	.zero	2
	.long	.LC343
	.long	.LC344
	.value	4272
	.zero	2
	.long	.LC345
	.long	.LC346
	.value	4273
	.zero	2
	.long	.LC347
	.long	.LC348
	.value	4274
	.zero	2
	.long	.LC349
	.long	.LC350
	.value	4275
	.zero	2
	.long	.LC351
	.long	.LC352
	.value	4276
	.zero	2
	.long	.LC353
	.long	.LC354
	.value	4277
	.zero	2
	.long	.LC355
	.long	.LC356
	.value	4278
	.zero	2
	.long	.LC357
	.long	.LC358
	.value	4279
	.zero	2
	.long	.LC359
	.long	.LC360
	.value	4280
	.zero	2
	.long	.LC361
	.long	.LC362
	.value	4281
	.zero	2
	.long	.LC363
	.long	.LC364
	.value	4282
	.zero	2
	.long	.LC220
	.long	.LC365
	.value	4283
	.zero	2
	.long	.LC366
	.long	.LC367
	.value	4284
	.zero	2
	.long	.LC368
	.long	.LC369
	.value	4285
	.zero	2
	.long	.LC370
	.long	.LC371
	.value	4286
	.zero	2
	.long	.LC74
	.long	.LC372
	.value	4287
	.zero	2
	.long	.LC373
	.long	.LC374
	.value	4288
	.zero	2
	.long	.LC375
	.long	.LC376
	.value	4289
	.zero	2
	.long	.LC377
	.long	.LC378
	.value	4290
	.zero	2
	.long	.LC379
	.long	.LC380
	.value	4291
	.zero	2
	.long	.LC308
	.long	.LC381
	.value	4292
	.zero	2
	.long	.LC382
	.long	.LC383
	.value	4293
	.zero	2
	.long	.LC384
	.long	.LC385
	.value	4294
	.zero	2
	.long	.LC386
	.long	.LC387
	.value	4296
	.zero	2
	.long	.LC388
	.long	.LC389
	.value	4297
	.zero	2
	.long	.LC390
	.long	.LC391
	.value	4298
	.zero	2
	.long	.LC392
	.long	.LC393
	.value	4299
	.zero	2
	.long	.LC394
	.long	.LC395
	.value	4301
	.zero	2
	.long	.LC396
	.long	.LC397
	.value	4303
	.zero	2
	.long	.LC392
	.long	.LC398
	.value	4305
	.zero	2
	.long	.LC399
	.long	.LC400
	.value	4306
	.zero	2
	.long	.LC401
	.long	.LC402
	.value	4307
	.zero	2
	.long	.LC403
	.long	.LC404
	.value	4308
	.zero	2
	.long	.LC405
	.long	.LC406
	.value	4309
	.zero	2
	.long	.LC407
	.long	.LC408
	.value	4310
	.zero	2
	.long	.LC409
	.long	.LC409
	.value	4311
	.zero	2
	.long	.LC410
	.long	.LC411
	.value	4312
	.zero	2
	.long	.LC412
	.long	.LC413
	.value	4313
	.zero	2
	.long	.LC414
	.long	.LC415
	.value	4315
	.zero	2
	.long	.LC416
	.long	.LC417
	.value	4316
	.zero	2
	.long	.LC418
	.long	.LC419
	.value	4317
	.zero	2
	.long	.LC420
	.long	.LC421
	.value	4318
	.zero	2
	.long	.LC422
	.long	.LC422
	.value	4319
	.zero	2
	.long	.LC423
	.long	.LC424
	.value	4321
	.zero	2
	.long	.LC425
	.long	.LC426
	.value	4322
	.zero	2
	.long	.LC427
	.long	.LC428
	.value	4323
	.zero	2
	.long	.LC429
	.long	.LC430
	.value	4324
	.zero	2
	.long	.LC431
	.long	.LC432
	.value	4325
	.zero	2
	.long	.LC433
	.long	.LC434
	.value	4326
	.zero	2
	.long	.LC435
	.long	.LC436
	.value	4327
	.zero	2
	.long	.LC437
	.long	.LC437
	.value	4328
	.zero	2
	.long	.LC438
	.long	.LC439
	.value	4329
	.zero	2
	.long	.LC440
	.long	.LC441
	.value	4330
	.zero	2
	.long	.LC442
	.long	.LC443
	.value	4331
	.zero	2
	.long	.LC444
	.long	.LC445
	.value	4332
	.zero	2
	.long	.LC446
	.long	.LC447
	.value	4333
	.zero	2
	.long	.LC448
	.long	.LC449
	.value	4334
	.zero	2
	.long	.LC450
	.long	.LC451
	.value	4335
	.zero	2
	.long	.LC452
	.long	.LC453
	.value	4336
	.zero	2
	.long	.LC454
	.long	.LC455
	.value	4337
	.zero	2
	.long	.LC456
	.long	.LC457
	.value	4338
	.zero	2
	.long	.LC458
	.long	.LC459
	.value	4339
	.zero	2
	.long	.LC460
	.long	.LC461
	.value	4340
	.zero	2
	.long	.LC462
	.long	.LC463
	.value	4341
	.zero	2
	.long	.LC464
	.long	.LC465
	.value	4342
	.zero	2
	.long	.LC466
	.long	.LC467
	.value	4343
	.zero	2
	.long	.LC468
	.long	.LC469
	.value	4344
	.zero	2
	.long	.LC470
	.long	.LC471
	.value	4345
	.zero	2
	.long	.LC472
	.long	.LC473
	.value	4346
	.zero	2
	.long	.LC474
	.long	.LC474
	.value	4347
	.zero	2
	.long	.LC475
	.long	.LC476
	.value	4348
	.zero	2
	.long	.LC477
	.long	.LC478
	.value	4349
	.zero	2
	.long	.LC479
	.long	.LC480
	.value	4350
	.zero	2
	.long	.LC481
	.long	.LC482
	.value	4351
	.zero	2
	.long	.LC483
	.long	.LC483
	.value	4352
	.zero	2
	.long	.LC484
	.long	.LC485
	.value	4353
	.zero	2
	.long	.LC486
	.long	.LC487
	.value	4354
	.zero	2
	.long	.LC488
	.long	.LC489
	.value	4355
	.zero	2
	.long	.LC490
	.long	.LC491
	.value	4356
	.zero	2
	.long	.LC492
	.long	.LC492
	.value	4357
	.zero	2
	.long	.LC493
	.long	.LC494
	.value	4358
	.zero	2
	.long	.LC495
	.long	.LC496
	.value	4359
	.zero	2
	.long	.LC497
	.long	.LC498
	.value	4360
	.zero	2
	.long	.LC499
	.long	.LC500
	.value	4361
	.zero	2
	.long	.LC501
	.long	.LC502
	.value	4362
	.zero	2
	.long	.LC503
	.long	.LC504
	.value	4363
	.zero	2
	.long	.LC505
	.long	.LC506
	.value	4364
	.zero	2
	.long	.LC507
	.long	.LC508
	.value	4365
	.zero	2
	.long	.LC509
	.long	.LC510
	.value	4366
	.zero	2
	.long	.LC511
	.long	.LC512
	.value	4367
	.zero	2
	.long	.LC513
	.long	.LC514
	.value	4370
	.zero	2
	.long	.LC515
	.long	.LC516
	.value	4371
	.zero	2
	.long	.LC517
	.long	.LC518
	.value	4372
	.zero	2
	.long	.LC519
	.long	.LC520
	.value	4374
	.zero	2
	.long	.LC521
	.long	.LC522
	.value	4375
	.zero	2
	.long	.LC523
	.long	.LC524
	.value	4376
	.zero	2
	.long	.LC525
	.long	.LC526
	.value	4377
	.zero	2
	.long	.LC527
	.long	.LC528
	.value	4378
	.zero	2
	.long	.LC529
	.long	.LC530
	.value	4380
	.zero	2
	.long	.LC531
	.long	.LC532
	.value	4381
	.zero	2
	.long	.LC533
	.long	.LC534
	.value	4383
	.zero	2
	.long	.LC535
	.long	.LC536
	.value	4384
	.zero	2
	.long	.LC537
	.long	.LC538
	.value	4385
	.zero	2
	.long	.LC539
	.long	.LC539
	.value	4387
	.zero	2
	.long	.LC540
	.long	.LC541
	.value	4388
	.zero	2
	.long	.LC542
	.long	.LC543
	.value	4389
	.zero	2
	.long	.LC544
	.long	.LC545
	.value	4391
	.zero	2
	.long	.LC546
	.long	.LC547
	.value	4393
	.zero	2
	.long	.LC548
	.long	.LC548
	.value	4394
	.zero	2
	.long	.LC549
	.long	.LC550
	.value	4396
	.zero	2
	.long	.LC551
	.long	.LC552
	.value	4397
	.zero	2
	.long	.LC553
	.long	.LC553
	.value	4398
	.zero	2
	.long	.LC554
	.long	.LC554
	.value	4400
	.zero	2
	.long	.LC555
	.long	.LC555
	.value	4401
	.zero	2
	.long	.LC556
	.long	.LC557
	.value	4402
	.zero	2
	.long	.LC558
	.long	.LC559
	.value	4403
	.zero	2
	.long	.LC560
	.long	.LC561
	.value	4404
	.zero	2
	.long	.LC343
	.long	.LC562
	.value	4405
	.zero	2
	.long	.LC563
	.long	.LC564
	.value	4406
	.zero	2
	.long	.LC565
	.long	.LC566
	.value	4407
	.zero	2
	.long	.LC567
	.long	.LC568
	.value	4408
	.zero	2
	.long	.LC569
	.long	.LC570
	.value	4409
	.zero	2
	.long	.LC571
	.long	.LC572
	.value	4410
	.zero	2
	.long	.LC573
	.long	.LC574
	.value	4411
	.zero	2
	.long	.LC575
	.long	.LC576
	.value	4412
	.zero	2
	.long	.LC577
	.long	.LC578
	.value	4413
	.zero	2
	.long	.LC579
	.long	.LC580
	.value	4414
	.zero	2
	.long	.LC581
	.long	.LC582
	.value	4415
	.zero	2
	.long	.LC583
	.long	.LC584
	.value	4416
	.zero	2
	.long	.LC585
	.long	.LC586
	.value	4417
	.zero	2
	.long	.LC587
	.long	.LC588
	.value	4418
	.zero	2
	.long	.LC589
	.long	.LC590
	.value	4419
	.zero	2
	.long	.LC591
	.long	.LC592
	.value	4420
	.zero	2
	.long	.LC593
	.long	.LC594
	.value	4421
	.zero	2
	.long	.LC595
	.long	.LC596
	.value	4422
	.zero	2
	.long	.LC597
	.long	.LC598
	.value	4423
	.zero	2
	.long	.LC599
	.long	.LC600
	.value	4424
	.zero	2
	.long	.LC601
	.long	.LC602
	.value	4425
	.zero	2
	.long	.LC603
	.long	.LC604
	.value	4426
	.zero	2
	.long	.LC605
	.long	.LC605
	.value	4427
	.zero	2
	.long	.LC606
	.long	.LC607
	.value	4428
	.zero	2
	.long	.LC608
	.long	.LC608
	.value	4429
	.zero	2
	.long	.LC609
	.long	.LC610
	.value	4430
	.zero	2
	.long	.LC611
	.long	.LC612
	.value	4431
	.zero	2
	.long	.LC613
	.long	.LC614
	.value	4432
	.zero	2
	.long	.LC128
	.long	.LC615
	.value	4433
	.zero	2
	.long	.LC616
	.long	.LC617
	.value	4435
	.zero	2
	.long	.LC618
	.long	.LC619
	.value	4436
	.zero	2
	.long	.LC620
	.long	.LC621
	.value	4437
	.zero	2
	.long	.LC622
	.long	.LC623
	.value	4438
	.zero	2
	.long	.LC624
	.long	.LC625
	.value	4439
	.zero	2
	.long	.LC626
	.long	.LC627
	.value	4440
	.zero	2
	.long	.LC628
	.long	.LC629
	.value	4441
	.zero	2
	.long	.LC630
	.long	.LC630
	.value	4442
	.zero	2
	.long	.LC631
	.long	.LC632
	.value	4443
	.zero	2
	.long	.LC633
	.long	.LC634
	.value	4444
	.zero	2
	.long	.LC635
	.long	.LC636
	.value	4445
	.zero	2
	.long	.LC637
	.long	.LC637
	.value	4446
	.zero	2
	.long	.LC638
	.long	.LC639
	.value	4447
	.zero	2
	.long	.LC640
	.long	.LC641
	.value	4448
	.zero	2
	.long	.LC642
	.long	.LC643
	.value	4449
	.zero	2
	.long	.LC644
	.long	.LC645
	.value	4450
	.zero	2
	.long	.LC646
	.long	.LC647
	.value	4451
	.zero	2
	.long	.LC648
	.long	.LC649
	.value	4452
	.zero	2
	.long	.LC650
	.long	.LC651
	.value	4453
	.zero	2
	.long	.LC652
	.long	.LC653
	.value	4454
	.zero	2
	.long	.LC654
	.long	.LC655
	.value	4455
	.zero	2
	.long	.LC656
	.long	.LC657
	.value	4456
	.zero	2
	.long	.LC658
	.long	.LC659
	.value	4457
	.zero	2
	.long	.LC660
	.long	.LC661
	.value	4458
	.zero	2
	.long	.LC662
	.long	.LC663
	.value	4459
	.zero	2
	.long	.LC664
	.long	.LC665
	.value	4460
	.zero	2
	.long	.LC666
	.long	.LC667
	.value	4462
	.zero	2
	.long	.LC668
	.long	.LC669
	.value	4464
	.zero	2
	.long	.LC670
	.long	.LC671
	.value	4466
	.zero	2
	.long	.LC672
	.long	.LC673
	.value	4467
	.zero	2
	.long	.LC674
	.long	.LC675
	.value	4468
	.zero	2
	.long	.LC676
	.long	.LC677
	.value	4469
	.zero	2
	.long	.LC678
	.long	.LC679
	.value	4470
	.zero	2
	.long	.LC680
	.long	.LC680
	.value	4471
	.zero	2
	.long	.LC681
	.long	.LC682
	.value	4472
	.zero	2
	.long	.LC683
	.long	.LC684
	.value	4473
	.zero	2
	.long	.LC685
	.long	.LC686
	.value	4474
	.zero	2
	.long	.LC687
	.long	.LC688
	.value	4475
	.zero	2
	.long	.LC689
	.long	.LC690
	.value	4476
	.zero	2
	.long	.LC691
	.long	.LC692
	.value	4477
	.zero	2
	.long	.LC693
	.long	.LC694
	.value	4478
	.zero	2
	.long	.LC695
	.long	.LC696
	.value	4479
	.zero	2
	.long	.LC697
	.long	.LC698
	.value	4480
	.zero	2
	.long	.LC699
	.long	.LC700
	.value	4483
	.zero	2
	.long	.LC701
	.long	.LC702
	.value	4484
	.zero	2
	.long	.LC703
	.long	.LC704
	.value	4485
	.zero	2
	.long	.LC705
	.long	.LC705
	.value	4486
	.zero	2
	.long	.LC706
	.long	.LC707
	.value	4487
	.zero	2
	.long	.LC708
	.long	.LC709
	.value	4488
	.zero	2
	.long	.LC710
	.long	.LC711
	.value	4489
	.zero	2
	.long	.LC468
	.long	.LC712
	.value	4490
	.zero	2
	.long	.LC713
	.long	.LC714
	.value	4491
	.zero	2
	.long	.LC715
	.long	.LC716
	.value	4492
	.zero	2
	.long	.LC717
	.long	.LC718
	.value	4493
	.zero	2
	.long	.LC719
	.long	.LC720
	.value	4494
	.zero	2
	.long	.LC721
	.long	.LC722
	.value	4495
	.zero	2
	.long	.LC723
	.long	.LC724
	.value	4496
	.zero	2
	.long	.LC725
	.long	.LC725
	.value	4497
	.zero	2
	.long	.LC726
	.long	.LC727
	.value	4498
	.zero	2
	.long	.LC728
	.long	.LC729
	.value	4500
	.zero	2
	.long	.LC730
	.long	.LC731
	.value	4501
	.zero	2
	.long	.LC732
	.long	.LC733
	.value	4502
	.zero	2
	.long	.LC734
	.long	.LC735
	.value	4503
	.zero	2
	.long	.LC736
	.long	.LC737
	.value	4504
	.zero	2
	.long	.LC738
	.long	.LC739
	.value	4505
	.zero	2
	.long	.LC740
	.long	.LC741
	.value	4506
	.zero	2
	.long	.LC742
	.long	.LC743
	.value	4507
	.zero	2
	.long	.LC744
	.long	.LC745
	.value	4508
	.zero	2
	.long	.LC746
	.long	.LC747
	.value	4509
	.zero	2
	.long	.LC748
	.long	.LC749
	.value	4510
	.zero	2
	.long	.LC392
	.long	.LC750
	.value	4511
	.zero	2
	.long	.LC751
	.long	.LC752
	.value	4513
	.zero	2
	.long	.LC753
	.long	.LC754
	.value	4514
	.zero	2
	.long	.LC333
	.long	.LC755
	.value	4515
	.zero	2
	.long	.LC756
	.long	.LC757
	.value	4516
	.zero	2
	.long	.LC758
	.long	.LC758
	.value	4517
	.zero	2
	.long	.LC759
	.long	.LC760
	.value	4518
	.zero	2
	.long	.LC761
	.long	.LC761
	.value	4519
	.zero	2
	.long	.LC762
	.long	.LC763
	.value	4520
	.zero	2
	.long	.LC764
	.long	.LC765
	.value	4521
	.zero	2
	.long	.LC766
	.long	.LC767
	.value	4522
	.zero	2
	.long	.LC768
	.long	.LC768
	.value	4523
	.zero	2
	.long	.LC601
	.long	.LC769
	.value	4524
	.zero	2
	.long	.LC770
	.long	.LC771
	.value	4525
	.zero	2
	.long	.LC772
	.long	.LC773
	.value	4526
	.zero	2
	.long	.LC774
	.long	.LC775
	.value	4527
	.zero	2
	.long	.LC776
	.long	.LC777
	.value	4528
	.zero	2
	.long	.LC778
	.long	.LC779
	.value	4529
	.zero	2
	.long	.LC780
	.long	.LC781
	.value	4530
	.zero	2
	.long	.LC782
	.long	.LC783
	.value	4531
	.zero	2
	.long	.LC784
	.long	.LC785
	.value	4532
	.zero	2
	.long	.LC786
	.long	.LC787
	.value	4533
	.zero	2
	.long	.LC788
	.long	.LC789
	.value	4534
	.zero	2
	.long	.LC790
	.long	.LC791
	.value	4535
	.zero	2
	.long	.LC189
	.long	.LC189
	.value	4536
	.zero	2
	.long	.LC792
	.long	.LC793
	.value	4537
	.zero	2
	.long	.LC794
	.long	.LC795
	.value	4538
	.zero	2
	.long	.LC796
	.long	.LC797
	.value	4539
	.zero	2
	.long	.LC798
	.long	.LC799
	.value	4540
	.zero	2
	.long	.LC800
	.long	.LC801
	.value	4541
	.zero	2
	.long	.LC802
	.long	.LC803
	.value	4542
	.zero	2
	.long	.LC804
	.long	.LC805
	.value	4543
	.zero	2
	.long	.LC806
	.long	.LC807
	.value	4545
	.zero	2
	.long	.LC808
	.long	.LC809
	.value	4546
	.zero	2
	.long	.LC810
	.long	.LC811
	.value	4548
	.zero	2
	.long	.LC812
	.long	.LC813
	.value	4549
	.zero	2
	.long	.LC814
	.long	.LC815
	.value	4550
	.zero	2
	.long	.LC816
	.long	.LC817
	.value	4551
	.zero	2
	.long	.LC818
	.long	.LC819
	.value	4552
	.zero	2
	.long	.LC820
	.long	.LC821
	.value	4553
	.zero	2
	.long	.LC822
	.long	.LC822
	.value	4554
	.zero	2
	.long	.LC823
	.long	.LC824
	.value	4555
	.zero	2
	.long	.LC825
	.long	.LC826
	.value	4556
	.zero	2
	.long	.LC827
	.long	.LC828
	.value	4557
	.zero	2
	.long	.LC829
	.long	.LC830
	.value	4558
	.zero	2
	.long	.LC831
	.long	.LC832
	.value	4559
	.zero	2
	.long	.LC833
	.long	.LC834
	.value	4560
	.zero	2
	.long	.LC835
	.long	.LC836
	.value	4561
	.zero	2
	.long	.LC837
	.long	.LC838
	.value	4562
	.zero	2
	.long	.LC839
	.long	.LC840
	.value	4563
	.zero	2
	.long	.LC841
	.long	.LC842
	.value	4564
	.zero	2
	.long	.LC843
	.long	.LC844
	.value	4565
	.zero	2
	.long	.LC845
	.long	.LC846
	.value	4566
	.zero	2
	.long	.LC847
	.long	.LC848
	.value	4567
	.zero	2
	.long	.LC849
	.long	.LC850
	.value	4568
	.zero	2
	.long	.LC851
	.long	.LC852
	.value	4569
	.zero	2
	.long	.LC853
	.long	.LC854
	.value	4570
	.zero	2
	.long	.LC855
	.long	.LC855
	.value	4571
	.zero	2
	.long	.LC856
	.long	.LC857
	.value	4572
	.zero	2
	.long	.LC858
	.long	.LC859
	.value	4573
	.zero	2
	.long	.LC860
	.long	.LC861
	.value	4574
	.zero	2
	.long	.LC862
	.long	.LC863
	.value	4577
	.zero	2
	.long	.LC864
	.long	.LC865
	.value	4578
	.zero	2
	.long	.LC308
	.long	.LC866
	.value	4579
	.zero	2
	.long	.LC778
	.long	.LC779
	.value	4580
	.zero	2
	.long	.LC867
	.long	.LC868
	.value	4581
	.zero	2
	.long	.LC869
	.long	.LC870
	.value	4582
	.zero	2
	.long	.LC871
	.long	.LC872
	.value	4584
	.zero	2
	.long	.LC873
	.long	.LC874
	.value	4585
	.zero	2
	.long	.LC875
	.long	.LC876
	.value	4586
	.zero	2
	.long	.LC877
	.long	.LC878
	.value	4587
	.zero	2
	.long	.LC879
	.long	.LC880
	.value	4588
	.zero	2
	.long	.LC881
	.long	.LC882
	.value	4589
	.zero	2
	.long	.LC883
	.long	.LC883
	.value	4590
	.zero	2
	.long	.LC884
	.long	.LC885
	.value	4591
	.zero	2
	.long	.LC886
	.long	.LC887
	.value	4592
	.zero	2
	.long	.LC888
	.long	.LC889
	.value	4594
	.zero	2
	.long	.LC890
	.long	.LC891
	.value	4595
	.zero	2
	.long	.LC892
	.long	.LC893
	.value	4596
	.zero	2
	.long	.LC894
	.long	.LC895
	.value	4597
	.zero	2
	.long	.LC896
	.long	.LC897
	.value	4598
	.zero	2
	.long	.LC898
	.long	.LC899
	.value	4599
	.zero	2
	.long	.LC900
	.long	.LC901
	.value	4600
	.zero	2
	.long	.LC902
	.long	.LC903
	.value	4601
	.zero	2
	.long	.LC904
	.long	.LC905
	.value	4602
	.zero	2
	.long	.LC906
	.long	.LC907
	.value	4603
	.zero	2
	.long	.LC908
	.long	.LC909
	.value	4605
	.zero	2
	.long	.LC910
	.long	.LC911
	.value	4606
	.zero	2
	.long	.LC912
	.long	.LC913
	.value	4607
	.zero	2
	.long	.LC914
	.long	.LC915
	.value	4608
	.zero	2
	.long	.LC916
	.long	.LC917
	.value	4609
	.zero	2
	.long	.LC918
	.long	.LC919
	.value	4610
	.zero	2
	.long	.LC920
	.long	.LC921
	.value	4611
	.zero	2
	.long	.LC922
	.long	.LC923
	.value	4612
	.zero	2
	.long	.LC924
	.long	.LC925
	.value	4613
	.zero	2
	.long	.LC926
	.long	.LC927
	.value	4614
	.zero	2
	.long	.LC928
	.long	.LC929
	.value	4616
	.zero	2
	.long	.LC930
	.long	.LC931
	.value	4617
	.zero	2
	.long	.LC932
	.long	.LC933
	.value	4618
	.zero	2
	.long	.LC934
	.long	.LC934
	.value	4619
	.zero	2
	.long	.LC935
	.long	.LC936
	.value	4621
	.zero	2
	.long	.LC937
	.long	.LC938
	.value	4622
	.zero	2
	.long	.LC939
	.long	.LC940
	.value	4623
	.zero	2
	.long	.LC941
	.long	.LC942
	.value	4624
	.zero	2
	.long	.LC943
	.long	.LC944
	.value	4625
	.zero	2
	.long	.LC945
	.long	.LC946
	.value	4627
	.zero	2
	.long	.LC947
	.long	.LC948
	.value	4628
	.zero	2
	.long	.LC949
	.long	.LC950
	.value	4629
	.zero	2
	.long	.LC951
	.long	.LC952
	.value	4630
	.zero	2
	.long	.LC953
	.long	.LC954
	.value	4631
	.zero	2
	.long	.LC955
	.long	.LC956
	.value	4632
	.zero	2
	.long	.LC957
	.long	.LC958
	.value	4633
	.zero	2
	.long	.LC959
	.long	.LC960
	.value	4634
	.zero	2
	.long	.LC961
	.long	.LC962
	.value	4635
	.zero	2
	.long	.LC963
	.long	.LC964
	.value	4636
	.zero	2
	.long	.LC965
	.long	.LC966
	.value	4637
	.zero	2
	.long	.LC967
	.long	.LC968
	.value	4638
	.zero	2
	.long	.LC969
	.long	.LC969
	.value	4639
	.zero	2
	.long	.LC970
	.long	.LC971
	.value	4640
	.zero	2
	.long	.LC972
	.long	.LC973
	.value	4641
	.zero	2
	.long	.LC974
	.long	.LC975
	.value	4642
	.zero	2
	.long	.LC976
	.long	.LC977
	.value	4643
	.zero	2
	.long	.LC978
	.long	.LC979
	.value	4644
	.zero	2
	.long	.LC980
	.long	.LC981
	.value	4645
	.zero	2
	.long	.LC982
	.long	.LC983
	.value	4647
	.zero	2
	.long	.LC984
	.long	.LC984
	.value	4648
	.zero	2
	.long	.LC985
	.long	.LC986
	.value	4649
	.zero	2
	.long	.LC987
	.long	.LC988
	.value	4650
	.zero	2
	.long	.LC989
	.long	.LC990
	.value	4651
	.zero	2
	.long	.LC991
	.long	.LC992
	.value	4652
	.zero	2
	.long	.LC993
	.long	.LC994
	.value	4653
	.zero	2
	.long	.LC995
	.long	.LC996
	.value	4654
	.zero	2
	.long	.LC997
	.long	.LC997
	.value	4655
	.zero	2
	.long	.LC998
	.long	.LC999
	.value	4656
	.zero	2
	.long	.LC1000
	.long	.LC1001
	.value	4657
	.zero	2
	.long	.LC1002
	.long	.LC1003
	.value	4659
	.zero	2
	.long	.LC1004
	.long	.LC1005
	.value	4660
	.zero	2
	.long	.LC1006
	.long	.LC1006
	.value	4662
	.zero	2
	.long	.LC1007
	.long	.LC1008
	.value	4663
	.zero	2
	.long	.LC1009
	.long	.LC1010
	.value	4664
	.zero	2
	.long	.LC1011
	.long	.LC1011
	.value	4665
	.zero	2
	.long	.LC1012
	.long	.LC1013
	.value	4666
	.zero	2
	.long	.LC1014
	.long	.LC1015
	.value	4667
	.zero	2
	.long	.LC1016
	.long	.LC1017
	.value	4668
	.zero	2
	.long	.LC1018
	.long	.LC1019
	.value	4669
	.zero	2
	.long	.LC1020
	.long	.LC1021
	.value	4671
	.zero	2
	.long	.LC1022
	.long	.LC1023
	.value	4672
	.zero	2
	.long	.LC1024
	.long	.LC1025
	.value	4673
	.zero	2
	.long	.LC1026
	.long	.LC1027
	.value	4674
	.zero	2
	.long	.LC1028
	.long	.LC1029
	.value	4675
	.zero	2
	.long	.LC1030
	.long	.LC1030
	.value	4676
	.zero	2
	.long	.LC1031
	.long	.LC1032
	.value	4677
	.zero	2
	.long	.LC1033
	.long	.LC1034
	.value	4678
	.zero	2
	.long	.LC1035
	.long	.LC1036
	.value	4679
	.zero	2
	.long	.LC1037
	.long	.LC1038
	.value	4680
	.zero	2
	.long	.LC1039
	.long	.LC1040
	.value	4681
	.zero	2
	.long	.LC308
	.long	.LC309
	.value	4682
	.zero	2
	.long	.LC1041
	.long	.LC1042
	.value	4684
	.zero	2
	.long	.LC1043
	.long	.LC1044
	.value	4685
	.zero	2
	.long	.LC1045
	.long	.LC1046
	.value	4686
	.zero	2
	.long	.LC1047
	.long	.LC1047
	.value	4687
	.zero	2
	.long	.LC1048
	.long	.LC1049
	.value	4688
	.zero	2
	.long	.LC105
	.long	.LC1050
	.value	4689
	.zero	2
	.long	.LC1051
	.long	.LC1052
	.value	4691
	.zero	2
	.long	.LC1053
	.long	.LC1054
	.value	4692
	.zero	2
	.long	.LC1055
	.long	.LC1056
	.value	4693
	.zero	2
	.long	.LC1057
	.long	.LC1058
	.value	4694
	.zero	2
	.long	.LC1059
	.long	.LC1060
	.value	4695
	.zero	2
	.long	.LC1061
	.long	.LC1062
	.value	4696
	.zero	2
	.long	.LC1063
	.long	.LC1064
	.value	4697
	.zero	2
	.long	.LC1065
	.long	.LC1066
	.value	4698
	.zero	2
	.long	.LC1067
	.long	.LC1068
	.value	4699
	.zero	2
	.long	.LC1069
	.long	.LC1070
	.value	4700
	.zero	2
	.long	.LC1071
	.long	.LC1072
	.value	4701
	.zero	2
	.long	.LC1073
	.long	.LC1074
	.value	4702
	.zero	2
	.long	.LC1075
	.long	.LC1076
	.value	4703
	.zero	2
	.long	.LC1077
	.long	.LC1078
	.value	4704
	.zero	2
	.long	.LC1079
	.long	.LC1080
	.value	4705
	.zero	2
	.long	.LC468
	.long	.LC1081
	.value	4706
	.zero	2
	.long	.LC1082
	.long	.LC1083
	.value	4707
	.zero	2
	.long	.LC1084
	.long	.LC1085
	.value	4708
	.zero	2
	.long	.LC1086
	.long	.LC1087
	.value	4709
	.zero	2
	.long	.LC1088
	.long	.LC1089
	.value	4710
	.zero	2
	.long	.LC1090
	.long	.LC1091
	.value	4711
	.zero	2
	.long	.LC1092
	.long	.LC1093
	.value	4712
	.zero	2
	.long	.LC1094
	.long	.LC1094
	.value	4713
	.zero	2
	.long	.LC1095
	.long	.LC1096
	.value	4714
	.zero	2
	.long	.LC1097
	.long	.LC1098
	.value	4715
	.zero	2
	.long	.LC1099
	.long	.LC1100
	.value	4716
	.zero	2
	.long	.LC1101
	.long	.LC1102
	.value	4717
	.zero	2
	.long	.LC1103
	.long	.LC1104
	.value	4718
	.zero	2
	.long	.LC1105
	.long	.LC1106
	.value	4719
	.zero	2
	.long	.LC1107
	.long	.LC1108
	.value	4720
	.zero	2
	.long	.LC1109
	.long	.LC1110
	.value	4721
	.zero	2
	.long	.LC1111
	.long	.LC1112
	.value	4722
	.zero	2
	.long	.LC1113
	.long	.LC1114
	.value	4723
	.zero	2
	.long	.LC1115
	.long	.LC1116
	.value	4724
	.zero	2
	.long	.LC1117
	.long	.LC1117
	.value	4725
	.zero	2
	.long	.LC1118
	.long	.LC1119
	.value	4726
	.zero	2
	.long	.LC1120
	.long	.LC1121
	.value	4727
	.zero	2
	.long	.LC1122
	.long	.LC1122
	.value	4728
	.zero	2
	.long	.LC1123
	.long	.LC1124
	.value	4729
	.zero	2
	.long	.LC1125
	.long	.LC1126
	.value	4731
	.zero	2
	.long	.LC1127
	.long	.LC1128
	.value	4732
	.zero	2
	.long	.LC1129
	.long	.LC1130
	.value	4733
	.zero	2
	.long	.LC1131
	.long	.LC1132
	.value	4734
	.zero	2
	.long	.LC1133
	.long	.LC1134
	.value	4735
	.zero	2
	.long	.LC1135
	.long	.LC1135
	.value	4736
	.zero	2
	.long	.LC1136
	.long	.LC1137
	.value	4737
	.zero	2
	.long	.LC1138
	.long	.LC1139
	.value	4738
	.zero	2
	.long	.LC1140
	.long	.LC1141
	.value	4739
	.zero	2
	.long	.LC1142
	.long	.LC1143
	.value	4741
	.zero	2
	.long	.LC1144
	.long	.LC1145
	.value	4742
	.zero	2
	.long	.LC1146
	.long	.LC1147
	.value	4743
	.zero	2
	.long	.LC1148
	.long	.LC1149
	.value	4744
	.zero	2
	.long	.LC1150
	.long	.LC1151
	.value	4745
	.zero	2
	.long	.LC1152
	.long	.LC1153
	.value	4746
	.zero	2
	.long	.LC1154
	.long	.LC1155
	.value	4747
	.zero	2
	.long	.LC1156
	.long	.LC1157
	.value	4748
	.zero	2
	.long	.LC1158
	.long	.LC1159
	.value	4749
	.zero	2
	.long	.LC1160
	.long	.LC1161
	.value	4751
	.zero	2
	.long	.LC1162
	.long	.LC1163
	.value	4752
	.zero	2
	.long	.LC1164
	.long	.LC1165
	.value	4753
	.zero	2
	.long	.LC1166
	.long	.LC1167
	.value	4754
	.zero	2
	.long	.LC1168
	.long	.LC1169
	.value	4755
	.zero	2
	.long	.LC1170
	.long	.LC1171
	.value	4756
	.zero	2
	.long	.LC1172
	.long	.LC1173
	.value	4757
	.zero	2
	.long	.LC1174
	.long	.LC1175
	.value	4758
	.zero	2
	.long	.LC1176
	.long	.LC1177
	.value	4759
	.zero	2
	.long	.LC1178
	.long	.LC1178
	.value	4760
	.zero	2
	.long	.LC1179
	.long	.LC1180
	.value	4761
	.zero	2
	.long	.LC1181
	.long	.LC1182
	.value	4762
	.zero	2
	.long	.LC1183
	.long	.LC1184
	.value	4763
	.zero	2
	.long	.LC1185
	.long	.LC1186
	.value	4765
	.zero	2
	.long	.LC1187
	.long	.LC1188
	.value	4766
	.zero	2
	.long	.LC1189
	.long	.LC1190
	.value	4767
	.zero	2
	.long	.LC1191
	.long	.LC1192
	.value	4768
	.zero	2
	.long	.LC1193
	.long	.LC1194
	.value	4769
	.zero	2
	.long	.LC1195
	.long	.LC1196
	.value	4770
	.zero	2
	.long	.LC1197
	.long	.LC1198
	.value	4771
	.zero	2
	.long	.LC1199
	.long	.LC1200
	.value	4772
	.zero	2
	.long	.LC1201
	.long	.LC1202
	.value	4773
	.zero	2
	.long	.LC1203
	.long	.LC1204
	.value	4774
	.zero	2
	.long	.LC1205
	.long	.LC1206
	.value	4775
	.zero	2
	.long	.LC1207
	.long	.LC1208
	.value	4776
	.zero	2
	.long	.LC1209
	.long	.LC1209
	.value	4777
	.zero	2
	.long	.LC1210
	.long	.LC1211
	.value	4778
	.zero	2
	.long	.LC1212
	.long	.LC1213
	.value	4779
	.zero	2
	.long	.LC1214
	.long	.LC1215
	.value	4780
	.zero	2
	.long	.LC1216
	.long	.LC1217
	.value	4781
	.zero	2
	.long	.LC1218
	.long	.LC1219
	.value	4782
	.zero	2
	.long	.LC1220
	.long	.LC1221
	.value	4783
	.zero	2
	.long	.LC1222
	.long	.LC1223
	.value	4784
	.zero	2
	.long	.LC1224
	.long	.LC1225
	.value	4785
	.zero	2
	.long	.LC1226
	.long	.LC1226
	.value	4786
	.zero	2
	.long	.LC1227
	.long	.LC1228
	.value	4787
	.zero	2
	.long	.LC1229
	.long	.LC1230
	.value	4788
	.zero	2
	.long	.LC1231
	.long	.LC1232
	.value	4789
	.zero	2
	.long	.LC1233
	.long	.LC1234
	.value	4791
	.zero	2
	.long	.LC1235
	.long	.LC1235
	.value	4792
	.zero	2
	.long	.LC1236
	.long	.LC1236
	.value	4793
	.zero	2
	.long	.LC359
	.long	.LC360
	.value	4794
	.zero	2
	.long	.LC1237
	.long	.LC1238
	.value	4795
	.zero	2
	.long	.LC1239
	.long	.LC1240
	.value	4796
	.zero	2
	.long	.LC1241
	.long	.LC1242
	.value	4797
	.zero	2
	.long	.LC1243
	.long	.LC1244
	.value	4799
	.zero	2
	.long	.LC1135
	.long	.LC1245
	.value	4800
	.zero	2
	.long	.LC1246
	.long	.LC1246
	.value	4801
	.zero	2
	.long	.LC1247
	.long	.LC1248
	.value	4802
	.zero	2
	.long	.LC1249
	.long	.LC1250
	.value	4803
	.zero	2
	.long	.LC1251
	.long	.LC1252
	.value	4804
	.zero	2
	.long	.LC1253
	.long	.LC1254
	.value	4805
	.zero	2
	.long	.LC1255
	.long	.LC1256
	.value	4806
	.zero	2
	.long	.LC1257
	.long	.LC1258
	.value	4807
	.zero	2
	.long	.LC1259
	.long	.LC1260
	.value	4808
	.zero	2
	.long	.LC1261
	.long	.LC1262
	.value	4809
	.zero	2
	.long	.LC1263
	.long	.LC1264
	.value	4810
	.zero	2
	.long	.LC1265
	.long	.LC1266
	.value	4811
	.zero	2
	.long	.LC1267
	.long	.LC1268
	.value	4812
	.zero	2
	.long	.LC1269
	.long	.LC1270
	.value	4813
	.zero	2
	.long	.LC1271
	.long	.LC1271
	.value	4814
	.zero	2
	.long	.LC1272
	.long	.LC1273
	.value	4815
	.zero	2
	.long	.LC1274
	.long	.LC1275
	.value	4816
	.zero	2
	.long	.LC1276
	.long	.LC1277
	.value	4817
	.zero	2
	.long	.LC1278
	.long	.LC1278
	.value	4819
	.zero	2
	.long	.LC1279
	.long	.LC1280
	.value	4820
	.zero	2
	.long	.LC1281
	.long	.LC1282
	.value	4821
	.zero	2
	.long	.LC1283
	.long	.LC1284
	.value	4822
	.zero	2
	.long	.LC1285
	.long	.LC1286
	.value	4823
	.zero	2
	.long	.LC1287
	.long	.LC1288
	.value	4824
	.zero	2
	.long	.LC1289
	.long	.LC1290
	.value	4825
	.zero	2
	.long	.LC1291
	.long	.LC1292
	.value	4826
	.zero	2
	.long	.LC1293
	.long	.LC1293
	.value	4827
	.zero	2
	.long	.LC1294
	.long	.LC1295
	.value	4828
	.zero	2
	.long	.LC1296
	.long	.LC1297
	.value	4829
	.zero	2
	.long	.LC1298
	.long	.LC1299
	.value	4830
	.zero	2
	.long	.LC1300
	.long	.LC1301
	.value	4831
	.zero	2
	.long	.LC1302
	.long	.LC1303
	.value	4832
	.zero	2
	.long	.LC1304
	.long	.LC1305
	.value	4833
	.zero	2
	.long	.LC1306
	.long	.LC1307
	.value	4834
	.zero	2
	.long	.LC1308
	.long	.LC1309
	.value	4835
	.zero	2
	.long	.LC1310
	.long	.LC1311
	.value	4836
	.zero	2
	.long	.LC1312
	.long	.LC1313
	.value	4838
	.zero	2
	.long	.LC1314
	.long	.LC1315
	.value	4839
	.zero	2
	.long	.LC1316
	.long	.LC1317
	.value	4840
	.zero	2
	.long	.LC1318
	.long	.LC1319
	.value	4841
	.zero	2
	.long	.LC1320
	.long	.LC1320
	.value	4843
	.zero	2
	.long	.LC1321
	.long	.LC1322
	.value	4844
	.zero	2
	.long	.LC1323
	.long	.LC1324
	.value	4845
	.zero	2
	.long	.LC1325
	.long	.LC1326
	.value	4846
	.zero	2
	.long	.LC1327
	.long	.LC1328
	.value	4847
	.zero	2
	.long	.LC1329
	.long	.LC1330
	.value	4848
	.zero	2
	.long	.LC1331
	.long	.LC1331
	.value	4849
	.zero	2
	.long	.LC1332
	.long	.LC1333
	.value	4850
	.zero	2
	.long	.LC1334
	.long	.LC1335
	.value	4852
	.zero	2
	.long	.LC1336
	.long	.LC1336
	.value	4853
	.zero	2
	.long	.LC703
	.long	.LC703
	.value	4855
	.zero	2
	.long	.LC1337
	.long	.LC1337
	.value	4856
	.zero	2
	.long	.LC1338
	.long	.LC1339
	.value	4857
	.zero	2
	.long	.LC1340
	.long	.LC1341
	.value	4859
	.zero	2
	.long	.LC1342
	.long	.LC1343
	.value	4860
	.zero	2
	.long	.LC1344
	.long	.LC1345
	.value	4862
	.zero	2
	.long	.LC1346
	.long	.LC1347
	.value	4867
	.zero	2
	.long	.LC1348
	.long	.LC1349
	.value	4868
	.zero	2
	.long	.LC42
	.long	.LC1350
	.value	4871
	.zero	2
	.long	.LC1351
	.long	.LC1351
	.value	4872
	.zero	2
	.long	.LC1352
	.long	.LC1353
	.value	4874
	.zero	2
	.long	.LC220
	.long	.LC1354
	.value	4875
	.zero	2
	.long	.LC1355
	.long	.LC1356
	.value	4879
	.zero	2
	.long	.LC42
	.long	.LC1357
	.value	4880
	.zero	2
	.long	.LC42
	.long	.LC1358
	.value	4882
	.zero	2
	.long	.LC1359
	.long	.LC1360
	.value	4883
	.zero	2
	.long	.LC42
	.long	.LC1361
	.value	4886
	.zero	2
	.long	.LC42
	.long	.LC1362
	.value	4887
	.zero	2
	.long	.LC1363
	.long	.LC1364
	.value	4888
	.zero	2
	.long	.LC1365
	.long	.LC1366
	.value	4889
	.zero	2
	.long	.LC1367
	.long	.LC1368
	.value	4895
	.zero	2
	.long	.LC42
	.long	.LC1369
	.value	4901
	.zero	2
	.long	.LC42
	.long	.LC1370
	.value	4902
	.zero	2
	.long	.LC42
	.long	.LC1371
	.value	4904
	.zero	2
	.long	.LC1372
	.long	.LC1373
	.value	4913
	.zero	2
	.long	.LC1374
	.long	.LC1375
	.value	4914
	.zero	2
	.long	.LC1376
	.long	.LC1376
	.value	4917
	.zero	2
	.long	.LC1377
	.long	.LC1378
	.value	4925
	.zero	2
	.long	.LC42
	.long	.LC1379
	.value	4927
	.zero	2
	.long	.LC42
	.long	.LC1380
	.value	4930
	.zero	2
	.long	.LC42
	.long	.LC1381
	.value	4932
	.zero	2
	.long	.LC1382
	.long	.LC1383
	.value	4935
	.zero	2
	.long	.LC1384
	.long	.LC1385
	.value	4938
	.zero	2
	.long	.LC262
	.long	.LC1386
	.value	4939
	.zero	2
	.long	.LC42
	.long	.LC1387
	.value	4940
	.zero	2
	.long	.LC42
	.long	.LC1388
	.value	4941
	.zero	2
	.long	.LC1389
	.long	.LC1390
	.value	4954
	.zero	2
	.long	.LC42
	.long	.LC1391
	.value	4955
	.zero	2
	.long	.LC42
	.long	.LC1392
	.value	4956
	.zero	2
	.long	.LC42
	.long	.LC1393
	.value	4957
	.zero	2
	.long	.LC1394
	.long	.LC1395
	.value	4958
	.zero	2
	.long	.LC1396
	.long	.LC1397
	.value	4959
	.zero	2
	.long	.LC42
	.long	.LC1398
	.value	4960
	.zero	2
	.long	.LC1399
	.long	.LC1400
	.value	4961
	.zero	2
	.long	.LC42
	.long	.LC1401
	.value	4963
	.zero	2
	.long	.LC42
	.long	.LC1402
	.value	4965
	.zero	2
	.long	.LC1403
	.long	.LC1404
	.value	4966
	.zero	2
	.long	.LC1405
	.long	.LC1406
	.value	4967
	.zero	2
	.long	.LC42
	.long	.LC1407
	.value	4968
	.zero	2
	.long	.LC42
	.long	.LC1408
	.value	4969
	.zero	2
	.long	.LC1409
	.long	.LC1409
	.value	4971
	.zero	2
	.long	.LC42
	.long	.LC1410
	.value	4972
	.zero	2
	.long	.LC42
	.long	.LC1411
	.value	4981
	.zero	2
	.long	.LC42
	.long	.LC1412
	.value	4986
	.zero	2
	.long	.LC1413
	.long	.LC1414
	.value	4987
	.zero	2
	.long	.LC42
	.long	.LC1415
	.value	4988
	.zero	2
	.long	.LC42
	.long	.LC1416
	.value	4989
	.zero	2
	.long	.LC42
	.long	.LC1417
	.value	4990
	.zero	2
	.long	.LC1418
	.long	.LC1419
	.value	4992
	.zero	2
	.long	.LC1420
	.long	.LC1421
	.value	4993
	.zero	2
	.long	.LC42
	.long	.LC1422
	.value	4994
	.zero	2
	.long	.LC1423
	.long	.LC1424
	.value	4996
	.zero	2
	.long	.LC42
	.long	.LC1425
	.value	4997
	.zero	2
	.long	.LC1426
	.long	.LC1426
	.value	4999
	.zero	2
	.long	.LC1427
	.long	.LC455
	.value	5000
	.zero	2
	.long	.LC42
	.long	.LC1428
	.value	5001
	.zero	2
	.long	.LC1429
	.long	.LC1430
	.value	5003
	.zero	2
	.long	.LC42
	.long	.LC1431
	.value	5006
	.zero	2
	.long	.LC42
	.long	.LC1432
	.value	5007
	.zero	2
	.long	.LC42
	.long	.LC1433
	.value	5008
	.zero	2
	.long	.LC1434
	.long	.LC1435
	.value	5011
	.zero	2
	.long	.LC42
	.long	.LC1436
	.value	5012
	.zero	2
	.long	.LC1437
	.long	.LC1438
	.value	5013
	.zero	2
	.long	.LC42
	.long	.LC1439
	.value	5014
	.zero	2
	.long	.LC42
	.long	.LC1440
	.value	5015
	.zero	2
	.long	.LC1441
	.long	.LC1442
	.value	5016
	.zero	2
	.long	.LC42
	.long	.LC1443
	.value	5018
	.zero	2
	.long	.LC42
	.long	.LC1444
	.value	5021
	.zero	2
	.long	.LC42
	.long	.LC1445
	.value	5022
	.zero	2
	.long	.LC42
	.long	.LC1446
	.value	5024
	.zero	2
	.long	.LC42
	.long	.LC1447
	.value	5025
	.zero	2
	.long	.LC42
	.long	.LC1448
	.value	5027
	.zero	2
	.long	.LC1449
	.long	.LC1450
	.value	5028
	.zero	2
	.long	.LC42
	.long	.LC1451
	.value	5031
	.zero	2
	.long	.LC42
	.long	.LC1452
	.value	5032
	.zero	2
	.long	.LC1453
	.long	.LC1454
	.value	5033
	.zero	2
	.long	.LC42
	.long	.LC1455
	.value	5034
	.zero	2
	.long	.LC42
	.long	.LC1456
	.value	5039
	.zero	2
	.long	.LC42
	.long	.LC1457
	.value	5041
	.zero	2
	.long	.LC42
	.long	.LC1458
	.value	5044
	.zero	2
	.long	.LC42
	.long	.LC1459
	.value	5045
	.zero	2
	.long	.LC42
	.long	.LC1460
	.value	5046
	.zero	2
	.long	.LC1461
	.long	.LC1462
	.value	5048
	.zero	2
	.long	.LC42
	.long	.LC1463
	.value	5053
	.zero	2
	.long	.LC1464
	.long	.LC1465
	.value	5055
	.zero	2
	.long	.LC42
	.long	.LC1466
	.value	5056
	.zero	2
	.long	.LC1467
	.long	.LC1468
	.value	5057
	.zero	2
	.long	.LC1469
	.long	.LC1470
	.value	5058
	.zero	2
	.long	.LC42
	.long	.LC1471
	.value	5059
	.zero	2
	.long	.LC42
	.long	.LC1472
	.value	5063
	.zero	2
	.long	.LC42
	.long	.LC1473
	.value	5068
	.zero	2
	.long	.LC42
	.long	.LC1474
	.value	5071
	.zero	2
	.long	.LC42
	.long	.LC1475
	.value	5072
	.zero	2
	.long	.LC1476
	.long	.LC1477
	.value	5073
	.zero	2
	.long	.LC1478
	.long	.LC1479
	.value	5076
	.zero	2
	.long	.LC42
	.long	.LC1480
	.value	5078
	.zero	2
	.long	.LC42
	.long	.LC1481
	.value	5079
	.zero	2
	.long	.LC1482
	.long	.LC1483
	.value	5080
	.zero	2
	.long	.LC42
	.long	.LC1484
	.value	5081
	.zero	2
	.long	.LC42
	.long	.LC1485
	.value	5084
	.zero	2
	.long	.LC42
	.long	.LC1486
	.value	5086
	.zero	2
	.long	.LC42
	.long	.LC1487
	.value	5087
	.zero	2
	.long	.LC1488
	.long	.LC1489
	.value	5088
	.zero	2
	.long	.LC1490
	.long	.LC1491
	.value	5091
	.zero	2
	.long	.LC42
	.long	.LC1492
	.value	5092
	.zero	2
	.long	.LC42
	.long	.LC1493
	.value	5093
	.zero	2
	.long	.LC42
	.long	.LC1494
	.value	5097
	.zero	2
	.long	.LC42
	.long	.LC1495
	.value	5098
	.zero	2
	.long	.LC42
	.long	.LC1496
	.value	5104
	.zero	2
	.long	.LC42
	.long	.LC1497
	.value	5105
	.zero	2
	.long	.LC42
	.long	.LC1498
	.value	5108
	.zero	2
	.long	.LC42
	.long	.LC1499
	.value	5110
	.zero	2
	.long	.LC1500
	.long	.LC1501
	.value	5113
	.zero	2
	.long	.LC42
	.long	.LC1502
	.value	5114
	.zero	2
	.long	.LC1503
	.long	.LC1504
	.value	5115
	.zero	2
	.long	.LC42
	.long	.LC1505
	.value	5117
	.zero	2
	.long	.LC42
	.long	.LC1506
	.value	5118
	.zero	2
	.long	.LC1507
	.long	.LC1508
	.value	5119
	.zero	2
	.long	.LC42
	.long	.LC1509
	.value	5120
	.zero	2
	.long	.LC1510
	.long	.LC1511
	.value	5122
	.zero	2
	.long	.LC1512
	.long	.LC1513
	.value	5124
	.zero	2
	.long	.LC42
	.long	.LC1514
	.value	5126
	.zero	2
	.long	.LC1515
	.long	.LC1516
	.value	5127
	.zero	2
	.long	.LC1517
	.long	.LC1518
	.value	5128
	.zero	2
	.long	.LC42
	.long	.LC1519
	.value	5129
	.zero	2
	.long	.LC1520
	.long	.LC1521
	.value	5130
	.zero	2
	.long	.LC42
	.long	.LC1522
	.value	5131
	.zero	2
	.long	.LC42
	.long	.LC1523
	.value	5133
	.zero	2
	.long	.LC42
	.long	.LC1524
	.value	5135
	.zero	2
	.long	.LC42
	.long	.LC1525
	.value	5138
	.zero	2
	.long	.LC1526
	.long	.LC1527
	.value	5139
	.zero	2
	.long	.LC42
	.long	.LC1528
	.value	5141
	.zero	2
	.long	.LC1529
	.long	.LC1530
	.value	5144
	.zero	2
	.long	.LC42
	.long	.LC1531
	.value	5145
	.zero	2
	.long	.LC42
	.long	.LC1532
	.value	5147
	.zero	2
	.long	.LC1533
	.long	.LC1534
	.value	5150
	.zero	2
	.long	.LC42
	.long	.LC1535
	.value	5151
	.zero	2
	.long	.LC42
	.long	.LC1536
	.value	5152
	.zero	2
	.long	.LC42
	.long	.LC1537
	.value	5157
	.zero	2
	.long	.LC42
	.long	.LC1538
	.value	5160
	.zero	2
	.long	.LC42
	.long	.LC1539
	.value	5161
	.zero	2
	.long	.LC42
	.long	.LC1540
	.value	5162
	.zero	2
	.long	.LC42
	.long	.LC1541
	.value	5163
	.zero	2
	.long	.LC42
	.long	.LC1542
	.value	5164
	.zero	2
	.long	.LC42
	.long	.LC1543
	.value	5165
	.zero	2
	.long	.LC42
	.long	.LC1544
	.value	5168
	.zero	2
	.long	.LC42
	.long	.LC1545
	.value	5171
	.zero	2
	.long	.LC42
	.long	.LC1546
	.value	5173
	.zero	2
	.long	.LC1547
	.long	.LC1548
	.value	5174
	.zero	2
	.long	.LC42
	.long	.LC1549
	.value	5175
	.zero	2
	.long	.LC42
	.long	.LC1550
	.value	5176
	.zero	2
	.long	.LC42
	.long	.LC1551
	.value	5183
	.zero	2
	.long	.LC42
	.long	.LC1552
	.value	5185
	.zero	2
	.long	.LC42
	.long	.LC1553
	.value	5187
	.zero	2
	.long	.LC1554
	.long	.LC1555
	.value	5189
	.zero	2
	.long	.LC42
	.long	.LC1556
	.value	5190
	.zero	2
	.long	.LC42
	.long	.LC1557
	.value	5191
	.zero	2
	.long	.LC42
	.long	.LC1558
	.value	5192
	.zero	2
	.long	.LC1559
	.long	.LC1560
	.value	5194
	.zero	2
	.long	.LC1561
	.long	.LC1562
	.value	5195
	.zero	2
	.long	.LC1563
	.long	.LC1564
	.value	5197
	.zero	2
	.long	.LC42
	.long	.LC1565
	.value	5200
	.zero	2
	.long	.LC42
	.long	.LC1566
	.value	5201
	.zero	2
	.long	.LC42
	.long	.LC1567
	.value	5203
	.zero	2
	.long	.LC42
	.long	.LC1568
	.value	5208
	.zero	2
	.long	.LC1569
	.long	.LC1570
	.value	5212
	.zero	2
	.long	.LC42
	.long	.LC1571
	.value	5215
	.zero	2
	.long	.LC1572
	.long	.LC1573
	.value	5216
	.zero	2
	.long	.LC42
	.long	.LC1574
	.value	5218
	.zero	2
	.long	.LC1575
	.long	.LC1576
	.value	5219
	.zero	2
	.long	.LC42
	.long	.LC1577
	.value	5220
	.zero	2
	.long	.LC697
	.long	.LC1578
	.value	5224
	.zero	2
	.long	.LC42
	.long	.LC1579
	.value	5225
	.zero	2
	.long	.LC42
	.long	.LC1580
	.value	5228
	.zero	2
	.long	.LC42
	.long	.LC1581
	.value	5229
	.zero	2
	.long	.LC42
	.long	.LC1582
	.value	5230
	.zero	2
	.long	.LC42
	.long	.LC1583
	.value	5233
	.zero	2
	.long	.LC42
	.long	.LC1584
	.value	5235
	.zero	2
	.long	.LC42
	.long	.LC1585
	.value	5236
	.zero	2
	.long	.LC42
	.long	.LC1586
	.value	5239
	.zero	2
	.long	.LC42
	.long	.LC1587
	.value	5240
	.zero	2
	.long	.LC42
	.long	.LC1588
	.value	5243
	.zero	2
	.long	.LC42
	.long	.LC1589
	.value	5247
	.zero	2
	.long	.LC42
	.long	.LC1590
	.value	5250
	.zero	2
	.long	.LC42
	.long	.LC1591
	.value	5251
	.zero	2
	.long	.LC42
	.long	.LC1592
	.value	5253
	.zero	2
	.long	.LC42
	.long	.LC1593
	.value	5257
	.zero	2
	.long	.LC42
	.long	.LC1594
	.value	5258
	.zero	2
	.long	.LC42
	.long	.LC1595
	.value	5259
	.zero	2
	.long	.LC42
	.long	.LC1596
	.value	5260
	.zero	2
	.long	.LC1597
	.long	.LC1598
	.value	5261
	.zero	2
	.long	.LC337
	.long	.LC1599
	.value	5262
	.zero	2
	.long	.LC42
	.long	.LC1600
	.value	5263
	.zero	2
	.long	.LC42
	.long	.LC1601
	.value	5264
	.zero	2
	.long	.LC42
	.long	.LC1602
	.value	5267
	.zero	2
	.long	.LC42
	.long	.LC1603
	.value	5269
	.zero	2
	.long	.LC42
	.long	.LC1604
	.value	5270
	.zero	2
	.long	.LC42
	.long	.LC1605
	.value	5271
	.zero	2
	.long	.LC1606
	.long	.LC1607
	.value	5272
	.zero	2
	.long	.LC1608
	.long	.LC1609
	.value	5273
	.zero	2
	.long	.LC42
	.long	.LC1610
	.value	5274
	.zero	2
	.long	.LC1611
	.long	.LC1612
	.value	5275
	.zero	2
	.long	.LC42
	.long	.LC1613
	.value	5278
	.zero	2
	.long	.LC42
	.long	.LC1614
	.value	5279
	.zero	2
	.long	.LC42
	.long	.LC1615
	.value	5280
	.zero	2
	.long	.LC42
	.long	.LC1616
	.value	5282
	.zero	2
	.long	.LC42
	.long	.LC1617
	.value	5284
	.zero	2
	.long	.LC1618
	.long	.LC1619
	.value	5289
	.zero	2
	.long	.LC1620
	.long	.LC1620
	.value	5291
	.zero	2
	.long	.LC42
	.long	.LC1621
	.value	5297
	.zero	2
	.long	.LC42
	.long	.LC1622
	.value	5299
	.zero	2
	.long	.LC1623
	.long	.LC1624
	.value	5300
	.zero	2
	.long	.LC42
	.long	.LC1625
	.value	5301
	.zero	2
	.long	.LC1626
	.long	.LC1627
	.value	5302
	.zero	2
	.long	.LC42
	.long	.LC1628
	.value	5303
	.zero	2
	.long	.LC1629
	.long	.LC1630
	.value	5305
	.zero	2
	.long	.LC1631
	.long	.LC1632
	.value	5306
	.zero	2
	.long	.LC42
	.long	.LC1633
	.value	5307
	.zero	2
	.long	.LC42
	.long	.LC1634
	.value	5310
	.zero	2
	.long	.LC42
	.long	.LC1635
	.value	5312
	.zero	2
	.long	.LC1636
	.long	.LC1637
	.value	5313
	.zero	2
	.long	.LC42
	.long	.LC1638
	.value	5314
	.zero	2
	.long	.LC42
	.long	.LC1639
	.value	5316
	.zero	2
	.long	.LC42
	.long	.LC1640
	.value	5317
	.zero	2
	.long	.LC42
	.long	.LC1641
	.value	5318
	.zero	2
	.long	.LC42
	.long	.LC1642
	.value	5319
	.zero	2
	.long	.LC1643
	.long	.LC1644
	.value	5320
	.zero	2
	.long	.LC1645
	.long	.LC1646
	.value	5321
	.zero	2
	.long	.LC42
	.long	.LC1647
	.value	5323
	.zero	2
	.long	.LC42
	.long	.LC1648
	.value	5325
	.zero	2
	.long	.LC42
	.long	.LC1649
	.value	5327
	.zero	2
	.long	.LC1650
	.long	.LC1651
	.value	5332
	.zero	2
	.long	.LC1652
	.long	.LC1653
	.value	5333
	.zero	2
	.long	.LC42
	.long	.LC1654
	.value	5334
	.zero	2
	.long	.LC42
	.long	.LC1655
	.value	5335
	.zero	2
	.long	.LC42
	.long	.LC1656
	.value	5336
	.zero	2
	.long	.LC42
	.long	.LC1657
	.value	5337
	.zero	2
	.long	.LC42
	.long	.LC1658
	.value	5339
	.zero	2
	.long	.LC1659
	.long	.LC1660
	.value	5340
	.zero	2
	.long	.LC1661
	.long	.LC1662
	.value	5341
	.zero	2
	.long	.LC42
	.long	.LC1663
	.value	5342
	.zero	2
	.long	.LC42
	.long	.LC1664
	.value	5347
	.zero	2
	.long	.LC42
	.long	.LC1665
	.value	5348
	.zero	2
	.long	.LC1666
	.long	.LC1667
	.value	5354
	.zero	2
	.long	.LC1668
	.long	.LC1669
	.value	5355
	.zero	2
	.long	.LC42
	.long	.LC144
	.value	5356
	.zero	2
	.long	.LC42
	.long	.LC1670
	.value	5357
	.zero	2
	.long	.LC42
	.long	.LC1671
	.value	5359
	.zero	2
	.long	.LC42
	.long	.LC1672
	.value	5361
	.zero	2
	.long	.LC1673
	.long	.LC1673
	.value	5362
	.zero	2
	.long	.LC1674
	.long	.LC1675
	.value	5364
	.zero	2
	.long	.LC42
	.long	.LC1676
	.value	5365
	.zero	2
	.long	.LC42
	.long	.LC1677
	.value	5366
	.zero	2
	.long	.LC42
	.long	.LC1678
	.value	5367
	.zero	2
	.long	.LC42
	.long	.LC1679
	.value	5368
	.zero	2
	.long	.LC42
	.long	.LC1680
	.value	5369
	.zero	2
	.long	.LC42
	.long	.LC1681
	.value	5371
	.zero	2
	.long	.LC42
	.long	.LC1682
	.value	5372
	.zero	2
	.long	.LC42
	.long	.LC1683
	.value	5373
	.zero	2
	.long	.LC1684
	.long	.LC1685
	.value	5374
	.zero	2
	.long	.LC42
	.long	.LC1686
	.value	5375
	.zero	2
	.long	.LC42
	.long	.LC1687
	.value	5377
	.zero	2
	.long	.LC42
	.long	.LC1688
	.value	5378
	.zero	2
	.long	.LC42
	.long	.LC1689
	.value	5379
	.zero	2
	.long	.LC42
	.long	.LC1690
	.value	5380
	.zero	2
	.long	.LC42
	.long	.LC1691
	.value	5382
	.zero	2
	.long	.LC42
	.long	.LC1692
	.value	5383
	.zero	2
	.long	.LC1693
	.long	.LC1694
	.value	5385
	.zero	2
	.long	.LC299
	.long	.LC1695
	.value	5387
	.zero	2
	.long	.LC42
	.long	.LC1696
	.value	5388
	.zero	2
	.long	.LC42
	.long	.LC1697
	.value	5389
	.zero	2
	.long	.LC42
	.long	.LC1698
	.value	5390
	.zero	2
	.long	.LC42
	.long	.LC1699
	.value	5391
	.zero	2
	.long	.LC42
	.long	.LC1700
	.value	5392
	.zero	2
	.long	.LC42
	.long	.LC1701
	.value	5393
	.zero	2
	.long	.LC42
	.long	.LC1702
	.value	5394
	.zero	2
	.long	.LC1703
	.long	.LC1704
	.value	5395
	.zero	2
	.long	.LC42
	.long	.LC1705
	.value	5396
	.zero	2
	.long	.LC42
	.long	.LC1706
	.value	5397
	.zero	2
	.long	.LC42
	.long	.LC1707
	.value	5398
	.zero	2
	.long	.LC42
	.long	.LC1708
	.value	5399
	.zero	2
	.long	.LC42
	.long	.LC1709
	.value	5400
	.zero	2
	.long	.LC42
	.long	.LC1710
	.value	5401
	.zero	2
	.long	.LC42
	.long	.LC1711
	.value	5402
	.zero	2
	.long	.LC1712
	.long	.LC1713
	.value	5403
	.zero	2
	.long	.LC1714
	.long	.LC1715
	.value	5404
	.zero	2
	.long	.LC42
	.long	.LC1716
	.value	5405
	.zero	2
	.long	.LC42
	.long	.LC1717
	.value	5406
	.zero	2
	.long	.LC42
	.long	.LC1718
	.value	5407
	.zero	2
	.long	.LC42
	.long	.LC1719
	.value	5408
	.zero	2
	.long	.LC42
	.long	.LC1720
	.value	5409
	.zero	2
	.long	.LC42
	.long	.LC1721
	.value	5410
	.zero	2
	.long	.LC1722
	.long	.LC1723
	.value	5411
	.zero	2
	.long	.LC42
	.long	.LC1724
	.value	5412
	.zero	2
	.long	.LC1725
	.long	.LC1726
	.value	5413
	.zero	2
	.long	.LC42
	.long	.LC1727
	.value	5414
	.zero	2
	.long	.LC42
	.long	.LC1728
	.value	5415
	.zero	2
	.long	.LC42
	.long	.LC1729
	.value	5416
	.zero	2
	.long	.LC42
	.long	.LC1730
	.value	5417
	.zero	2
	.long	.LC42
	.long	.LC1731
	.value	5418
	.zero	2
	.long	.LC42
	.long	.LC1732
	.value	5419
	.zero	2
	.long	.LC42
	.long	.LC1733
	.value	5420
	.zero	2
	.long	.LC42
	.long	.LC1734
	.value	5421
	.zero	2
	.long	.LC42
	.long	.LC1735
	.value	5422
	.zero	2
	.long	.LC42
	.long	.LC1736
	.value	5423
	.zero	2
	.long	.LC42
	.long	.LC1737
	.value	5426
	.zero	2
	.long	.LC42
	.long	.LC1738
	.value	5427
	.zero	2
	.long	.LC42
	.long	.LC1739
	.value	5428
	.zero	2
	.long	.LC42
	.long	.LC1740
	.value	5429
	.zero	2
	.long	.LC42
	.long	.LC1741
	.value	5431
	.zero	2
	.long	.LC42
	.long	.LC1742
	.value	5432
	.zero	2
	.long	.LC1743
	.long	.LC1744
	.value	5433
	.zero	2
	.long	.LC42
	.long	.LC1745
	.value	5434
	.zero	2
	.long	.LC42
	.long	.LC1746
	.value	5435
	.zero	2
	.long	.LC1747
	.long	.LC1748
	.value	5436
	.zero	2
	.long	.LC42
	.long	.LC1749
	.value	5437
	.zero	2
	.long	.LC42
	.long	.LC1750
	.value	5438
	.zero	2
	.long	.LC1751
	.long	.LC1752
	.value	5439
	.zero	2
	.long	.LC1753
	.long	.LC1754
	.value	5440
	.zero	2
	.long	.LC42
	.long	.LC1755
	.value	5441
	.zero	2
	.long	.LC42
	.long	.LC1756
	.value	5442
	.zero	2
	.long	.LC42
	.long	.LC1757
	.value	5443
	.zero	2
	.long	.LC42
	.long	.LC1758
	.value	5444
	.zero	2
	.long	.LC1759
	.long	.LC1760
	.value	5445
	.zero	2
	.long	.LC1761
	.long	.LC1762
	.value	5446
	.zero	2
	.long	.LC42
	.long	.LC1763
	.value	5447
	.zero	2
	.long	.LC42
	.long	.LC1764
	.value	5448
	.zero	2
	.long	.LC42
	.long	.LC1765
	.value	5449
	.zero	2
	.long	.LC1766
	.long	.LC1767
	.value	5450
	.zero	2
	.long	.LC42
	.long	.LC1768
	.value	5451
	.zero	2
	.long	.LC42
	.long	.LC1769
	.value	5452
	.zero	2
	.long	.LC42
	.long	.LC1770
	.value	5453
	.zero	2
	.long	.LC42
	.long	.LC1771
	.value	5454
	.zero	2
	.long	.LC42
	.long	.LC1772
	.value	5455
	.zero	2
	.long	.LC42
	.long	.LC1773
	.value	5456
	.zero	2
	.long	.LC42
	.long	.LC1774
	.value	5457
	.zero	2
	.long	.LC42
	.long	.LC1775
	.value	5459
	.zero	2
	.long	.LC42
	.long	.LC1776
	.value	5460
	.zero	2
	.long	.LC1777
	.long	.LC1778
	.value	5461
	.zero	2
	.long	.LC1779
	.long	.LC1780
	.value	5462
	.zero	2
	.long	.LC42
	.long	.LC1781
	.value	5463
	.zero	2
	.long	.LC42
	.long	.LC1782
	.value	5464
	.zero	2
	.long	.LC42
	.long	.LC1783
	.value	5465
	.zero	2
	.long	.LC42
	.long	.LC1784
	.value	5466
	.zero	2
	.long	.LC42
	.long	.LC1785
	.value	5467
	.zero	2
	.long	.LC42
	.long	.LC1786
	.value	5468
	.zero	2
	.long	.LC42
	.long	.LC1787
	.value	5469
	.zero	2
	.long	.LC42
	.long	.LC1788
	.value	5470
	.zero	2
	.long	.LC1789
	.long	.LC1790
	.value	5471
	.zero	2
	.long	.LC42
	.long	.LC1791
	.value	5472
	.zero	2
	.long	.LC42
	.long	.LC1792
	.value	5473
	.zero	2
	.long	.LC42
	.long	.LC1793
	.value	5474
	.zero	2
	.long	.LC42
	.long	.LC1794
	.value	5475
	.zero	2
	.long	.LC42
	.long	.LC1795
	.value	5476
	.zero	2
	.long	.LC42
	.long	.LC1796
	.value	5477
	.zero	2
	.long	.LC1797
	.long	.LC1798
	.value	5478
	.zero	2
	.long	.LC42
	.long	.LC1799
	.value	5479
	.zero	2
	.long	.LC42
	.long	.LC1800
	.value	5480
	.zero	2
	.long	.LC42
	.long	.LC1801
	.value	5481
	.zero	2
	.long	.LC1802
	.long	.LC1803
	.value	5482
	.zero	2
	.long	.LC1804
	.long	.LC1805
	.value	5483
	.zero	2
	.long	.LC42
	.long	.LC1806
	.value	5484
	.zero	2
	.long	.LC42
	.long	.LC1807
	.value	5485
	.zero	2
	.long	.LC42
	.long	.LC1808
	.value	5486
	.zero	2
	.long	.LC42
	.long	.LC1809
	.value	5487
	.zero	2
	.long	.LC42
	.long	.LC1810
	.value	5488
	.zero	2
	.long	.LC42
	.long	.LC1811
	.value	5489
	.zero	2
	.long	.LC42
	.long	.LC1812
	.value	5490
	.zero	2
	.long	.LC42
	.long	.LC1813
	.value	5491
	.zero	2
	.long	.LC42
	.long	.LC1814
	.value	5492
	.zero	2
	.long	.LC42
	.long	.LC1815
	.value	5493
	.zero	2
	.long	.LC42
	.long	.LC1816
	.value	5494
	.zero	2
	.long	.LC42
	.long	.LC1817
	.value	5496
	.zero	2
	.long	.LC42
	.long	.LC1818
	.value	5497
	.zero	2
	.long	.LC42
	.long	.LC1819
	.value	5498
	.zero	2
	.long	.LC42
	.long	.LC1820
	.value	5499
	.zero	2
	.long	.LC42
	.long	.LC1821
	.value	5500
	.zero	2
	.long	.LC1822
	.long	.LC1823
	.value	5501
	.zero	2
	.long	.LC42
	.long	.LC1824
	.value	5502
	.zero	2
	.long	.LC42
	.long	.LC1825
	.value	5503
	.zero	2
	.long	.LC42
	.long	.LC1826
	.value	5504
	.zero	2
	.long	.LC42
	.long	.LC1827
	.value	5505
	.zero	2
	.long	.LC42
	.long	.LC1828
	.value	5506
	.zero	2
	.long	.LC42
	.long	.LC1829
	.value	5507
	.zero	2
	.long	.LC42
	.long	.LC1830
	.value	5508
	.zero	2
	.long	.LC42
	.long	.LC1831
	.value	5509
	.zero	2
	.long	.LC42
	.long	.LC1832
	.value	5510
	.zero	2
	.long	.LC42
	.long	.LC1833
	.value	5511
	.zero	2
	.long	.LC42
	.long	.LC1834
	.value	5512
	.zero	2
	.long	.LC1835
	.long	.LC1836
	.value	5513
	.zero	2
	.long	.LC42
	.long	.LC1837
	.value	5514
	.zero	2
	.long	.LC42
	.long	.LC1838
	.value	5515
	.zero	2
	.long	.LC42
	.long	.LC1839
	.value	5516
	.zero	2
	.long	.LC42
	.long	.LC1840
	.value	5517
	.zero	2
	.long	.LC42
	.long	.LC1841
	.value	5518
	.zero	2
	.long	.LC42
	.long	.LC1842
	.value	5519
	.zero	2
	.long	.LC42
	.long	.LC1843
	.value	5520
	.zero	2
	.long	.LC42
	.long	.LC1844
	.value	5521
	.zero	2
	.long	.LC42
	.long	.LC1845
	.value	5522
	.zero	2
	.long	.LC1846
	.long	.LC1847
	.value	5523
	.zero	2
	.long	.LC42
	.long	.LC1848
	.value	5524
	.zero	2
	.long	.LC42
	.long	.LC1849
	.value	5525
	.zero	2
	.long	.LC42
	.long	.LC1850
	.value	5526
	.zero	2
	.long	.LC42
	.long	.LC1851
	.value	5527
	.zero	2
	.long	.LC42
	.long	.LC1852
	.value	5528
	.zero	2
	.long	.LC42
	.long	.LC1853
	.value	5529
	.zero	2
	.long	.LC42
	.long	.LC1854
	.value	5530
	.zero	2
	.long	.LC42
	.long	.LC1855
	.value	5531
	.zero	2
	.long	.LC42
	.long	.LC1856
	.value	5532
	.zero	2
	.long	.LC42
	.long	.LC1857
	.value	5533
	.zero	2
	.long	.LC42
	.long	.LC1858
	.value	5534
	.zero	2
	.long	.LC42
	.long	.LC1859
	.value	5535
	.zero	2
	.long	.LC42
	.long	.LC1860
	.value	5536
	.zero	2
	.long	.LC42
	.long	.LC1861
	.value	5537
	.zero	2
	.long	.LC42
	.long	.LC1862
	.value	5538
	.zero	2
	.long	.LC42
	.long	.LC1863
	.value	5539
	.zero	2
	.long	.LC42
	.long	.LC1864
	.value	5540
	.zero	2
	.long	.LC42
	.long	.LC1865
	.value	5541
	.zero	2
	.long	.LC42
	.long	.LC1866
	.value	5542
	.zero	2
	.long	.LC42
	.long	.LC1867
	.value	5543
	.zero	2
	.long	.LC42
	.long	.LC1868
	.value	5544
	.zero	2
	.long	.LC42
	.long	.LC1869
	.value	5546
	.zero	2
	.long	.LC42
	.long	.LC1870
	.value	5547
	.zero	2
	.long	.LC42
	.long	.LC1871
	.value	5548
	.zero	2
	.long	.LC42
	.long	.LC1872
	.value	5549
	.zero	2
	.long	.LC1873
	.long	.LC1874
	.value	5550
	.zero	2
	.long	.LC42
	.long	.LC1875
	.value	5552
	.zero	2
	.long	.LC42
	.long	.LC1876
	.value	5553
	.zero	2
	.long	.LC42
	.long	.LC1877
	.value	5554
	.zero	2
	.long	.LC42
	.long	.LC1878
	.value	5555
	.zero	2
	.long	.LC42
	.long	.LC1879
	.value	5556
	.zero	2
	.long	.LC42
	.long	.LC1880
	.value	5557
	.zero	2
	.long	.LC42
	.long	.LC1881
	.value	5558
	.zero	2
	.long	.LC42
	.long	.LC1882
	.value	5559
	.zero	2
	.long	.LC42
	.long	.LC1883
	.value	5560
	.zero	2
	.long	.LC42
	.long	.LC1884
	.value	5561
	.zero	2
	.long	.LC42
	.long	.LC1885
	.value	5562
	.zero	2
	.long	.LC42
	.long	.LC1886
	.value	5563
	.zero	2
	.long	.LC42
	.long	.LC1887
	.value	5564
	.zero	2
	.long	.LC1888
	.long	.LC1889
	.value	5565
	.zero	2
	.long	.LC42
	.long	.LC233
	.value	5566
	.zero	2
	.long	.LC42
	.long	.LC1890
	.value	5567
	.zero	2
	.long	.LC42
	.long	.LC1891
	.value	5568
	.zero	2
	.long	.LC1892
	.long	.LC1893
	.value	5569
	.zero	2
	.long	.LC42
	.long	.LC1894
	.value	5570
	.zero	2
	.long	.LC42
	.long	.LC1895
	.value	5571
	.zero	2
	.long	.LC42
	.long	.LC1896
	.value	5572
	.zero	2
	.long	.LC42
	.long	.LC1897
	.value	5573
	.zero	2
	.long	.LC42
	.long	.LC1898
	.value	5574
	.zero	2
	.long	.LC42
	.long	.LC1899
	.value	5575
	.zero	2
	.long	.LC42
	.long	.LC1900
	.value	5576
	.zero	2
	.long	.LC42
	.long	.LC1901
	.value	5577
	.zero	2
	.long	.LC42
	.long	.LC1902
	.value	5578
	.zero	2
	.long	.LC42
	.long	.LC1903
	.value	5579
	.zero	2
	.long	.LC42
	.long	.LC1904
	.value	5580
	.zero	2
	.long	.LC42
	.long	.LC1905
	.value	5581
	.zero	2
	.long	.LC42
	.long	.LC1906
	.value	5582
	.zero	2
	.long	.LC42
	.long	.LC1907
	.value	5583
	.zero	2
	.long	.LC42
	.long	.LC1908
	.value	5585
	.zero	2
	.long	.LC1909
	.long	.LC1910
	.value	5586
	.zero	2
	.long	.LC42
	.long	.LC1911
	.value	5587
	.zero	2
	.long	.LC42
	.long	.LC1912
	.value	5588
	.zero	2
	.long	.LC42
	.long	.LC1913
	.value	5589
	.zero	2
	.long	.LC42
	.long	.LC1914
	.value	5590
	.zero	2
	.long	.LC42
	.long	.LC1915
	.value	5591
	.zero	2
	.long	.LC42
	.long	.LC1916
	.value	5592
	.zero	2
	.long	.LC42
	.long	.LC1917
	.value	5593
	.zero	2
	.long	.LC42
	.long	.LC1918
	.value	5594
	.zero	2
	.long	.LC42
	.long	.LC1919
	.value	5595
	.zero	2
	.long	.LC42
	.long	.LC1920
	.value	5596
	.zero	2
	.long	.LC1921
	.long	.LC1922
	.value	5597
	.zero	2
	.long	.LC1923
	.long	.LC1924
	.value	5598
	.zero	2
	.long	.LC42
	.long	.LC1925
	.value	5600
	.zero	2
	.long	.LC42
	.long	.LC1926
	.value	5601
	.zero	2
	.long	.LC1927
	.long	.LC1928
	.value	5602
	.zero	2
	.long	.LC42
	.long	.LC1929
	.value	5603
	.zero	2
	.long	.LC42
	.long	.LC1930
	.value	5604
	.zero	2
	.long	.LC42
	.long	.LC1931
	.value	5605
	.zero	2
	.long	.LC42
	.long	.LC1932
	.value	5606
	.zero	2
	.long	.LC42
	.long	.LC1933
	.value	5607
	.zero	2
	.long	.LC42
	.long	.LC1934
	.value	5608
	.zero	2
	.long	.LC42
	.long	.LC1935
	.value	5609
	.zero	2
	.long	.LC42
	.long	.LC1936
	.value	5610
	.zero	2
	.long	.LC42
	.long	.LC1937
	.value	5611
	.zero	2
	.long	.LC42
	.long	.LC1938
	.value	5612
	.zero	2
	.long	.LC42
	.long	.LC1939
	.value	5613
	.zero	2
	.long	.LC42
	.long	.LC1940
	.value	5614
	.zero	2
	.long	.LC42
	.long	.LC1941
	.value	5615
	.zero	2
	.long	.LC42
	.long	.LC1942
	.value	5616
	.zero	2
	.long	.LC42
	.long	.LC1943
	.value	5617
	.zero	2
	.long	.LC42
	.long	.LC1944
	.value	5618
	.zero	2
	.long	.LC42
	.long	.LC1945
	.value	5619
	.zero	2
	.long	.LC42
	.long	.LC1946
	.value	5620
	.zero	2
	.long	.LC42
	.long	.LC1947
	.value	5621
	.zero	2
	.long	.LC42
	.long	.LC1948
	.value	5622
	.zero	2
	.long	.LC42
	.long	.LC1949
	.value	5623
	.zero	2
	.long	.LC42
	.long	.LC1950
	.value	5624
	.zero	2
	.long	.LC42
	.long	.LC1951
	.value	5625
	.zero	2
	.long	.LC42
	.long	.LC1952
	.value	5626
	.zero	2
	.long	.LC1953
	.long	.LC1954
	.value	5627
	.zero	2
	.long	.LC42
	.long	.LC1955
	.value	5628
	.zero	2
	.long	.LC42
	.long	.LC1956
	.value	5629
	.zero	2
	.long	.LC42
	.long	.LC1957
	.value	5630
	.zero	2
	.long	.LC42
	.long	.LC1958
	.value	5631
	.zero	2
	.long	.LC42
	.long	.LC1959
	.value	5632
	.zero	2
	.long	.LC42
	.long	.LC1960
	.value	5633
	.zero	2
	.long	.LC42
	.long	.LC1961
	.value	5634
	.zero	2
	.long	.LC42
	.long	.LC1962
	.value	5635
	.zero	2
	.long	.LC42
	.long	.LC1963
	.value	5636
	.zero	2
	.long	.LC42
	.long	.LC1964
	.value	5637
	.zero	2
	.long	.LC42
	.long	.LC1965
	.value	5638
	.zero	2
	.long	.LC42
	.long	.LC1966
	.value	5639
	.zero	2
	.long	.LC42
	.long	.LC1967
	.value	5640
	.zero	2
	.long	.LC42
	.long	.LC1968
	.value	5641
	.zero	2
	.long	.LC42
	.long	.LC1969
	.value	5642
	.zero	2
	.long	.LC42
	.long	.LC1970
	.value	5643
	.zero	2
	.long	.LC42
	.long	.LC1971
	.value	5644
	.zero	2
	.long	.LC42
	.long	.LC1972
	.value	5645
	.zero	2
	.long	.LC42
	.long	.LC1973
	.value	5646
	.zero	2
	.long	.LC42
	.long	.LC1974
	.value	5647
	.zero	2
	.long	.LC42
	.long	.LC1975
	.value	5648
	.zero	2
	.long	.LC42
	.long	.LC1976
	.value	5649
	.zero	2
	.long	.LC42
	.long	.LC1977
	.value	5650
	.zero	2
	.long	.LC42
	.long	.LC1978
	.value	5651
	.zero	2
	.long	.LC42
	.long	.LC1979
	.value	5652
	.zero	2
	.long	.LC42
	.long	.LC1980
	.value	5653
	.zero	2
	.long	.LC42
	.long	.LC1981
	.value	5654
	.zero	2
	.long	.LC42
	.long	.LC1982
	.value	5655
	.zero	2
	.long	.LC42
	.long	.LC1983
	.value	5656
	.zero	2
	.long	.LC42
	.long	.LC1984
	.value	5657
	.zero	2
	.long	.LC1985
	.long	.LC1986
	.value	5659
	.zero	2
	.long	.LC42
	.long	.LC1987
	.value	5660
	.zero	2
	.long	.LC42
	.long	.LC1988
	.value	5661
	.zero	2
	.long	.LC42
	.long	.LC1989
	.value	5662
	.zero	2
	.long	.LC42
	.long	.LC1990
	.value	5663
	.zero	2
	.long	.LC1991
	.long	.LC1992
	.value	5664
	.zero	2
	.long	.LC42
	.long	.LC1993
	.value	5665
	.zero	2
	.long	.LC42
	.long	.LC1994
	.value	5666
	.zero	2
	.long	.LC1995
	.long	.LC1996
	.value	5667
	.zero	2
	.long	.LC42
	.long	.LC1997
	.value	5668
	.zero	2
	.long	.LC42
	.long	.LC1998
	.value	5669
	.zero	2
	.long	.LC42
	.long	.LC1999
	.value	5670
	.zero	2
	.long	.LC42
	.long	.LC2000
	.value	5671
	.zero	2
	.long	.LC42
	.long	.LC2001
	.value	5673
	.zero	2
	.long	.LC42
	.long	.LC2002
	.value	5674
	.zero	2
	.long	.LC42
	.long	.LC2003
	.value	5675
	.zero	2
	.long	.LC42
	.long	.LC2004
	.value	5676
	.zero	2
	.long	.LC42
	.long	.LC2005
	.value	5677
	.zero	2
	.long	.LC42
	.long	.LC2006
	.value	5678
	.zero	2
	.long	.LC42
	.long	.LC2007
	.value	5679
	.zero	2
	.long	.LC42
	.long	.LC2008
	.value	5680
	.zero	2
	.long	.LC42
	.long	.LC2009
	.value	5681
	.zero	2
	.long	.LC42
	.long	.LC2010
	.value	5682
	.zero	2
	.long	.LC42
	.long	.LC2011
	.value	5683
	.zero	2
	.long	.LC42
	.long	.LC2012
	.value	5684
	.zero	2
	.long	.LC42
	.long	.LC2013
	.value	5685
	.zero	2
	.long	.LC42
	.long	.LC2014
	.value	5686
	.zero	2
	.long	.LC42
	.long	.LC2015
	.value	5687
	.zero	2
	.long	.LC42
	.long	.LC2016
	.value	5688
	.zero	2
	.long	.LC2017
	.long	.LC2018
	.value	5690
	.zero	2
	.long	.LC42
	.long	.LC2019
	.value	5691
	.zero	2
	.long	.LC42
	.long	.LC2020
	.value	5692
	.zero	2
	.long	.LC42
	.long	.LC2021
	.value	5693
	.zero	2
	.long	.LC42
	.long	.LC2022
	.value	5694
	.zero	2
	.long	.LC2023
	.long	.LC2024
	.value	5695
	.zero	2
	.long	.LC42
	.long	.LC2025
	.value	5696
	.zero	2
	.long	.LC42
	.long	.LC2026
	.value	5697
	.zero	2
	.long	.LC42
	.long	.LC2027
	.value	5698
	.zero	2
	.long	.LC42
	.long	.LC2028
	.value	5699
	.zero	2
	.long	.LC42
	.long	.LC2029
	.value	5700
	.zero	2
	.long	.LC42
	.long	.LC2030
	.value	5701
	.zero	2
	.long	.LC42
	.long	.LC2031
	.value	5702
	.zero	2
	.long	.LC42
	.long	.LC2032
	.value	5703
	.zero	2
	.long	.LC42
	.long	.LC2033
	.value	5704
	.zero	2
	.long	.LC42
	.long	.LC2034
	.value	5705
	.zero	2
	.long	.LC42
	.long	.LC2035
	.value	5706
	.zero	2
	.long	.LC42
	.long	.LC2036
	.value	5708
	.zero	2
	.long	.LC42
	.long	.LC2037
	.value	5709
	.zero	2
	.long	.LC42
	.long	.LC2038
	.value	5710
	.zero	2
	.long	.LC42
	.long	.LC2039
	.value	5711
	.zero	2
	.long	.LC2040
	.long	.LC2041
	.value	5712
	.zero	2
	.long	.LC42
	.long	.LC2042
	.value	5713
	.zero	2
	.long	.LC42
	.long	.LC2043
	.value	5714
	.zero	2
	.long	.LC42
	.long	.LC2044
	.value	5715
	.zero	2
	.long	.LC2045
	.long	.LC2046
	.value	5716
	.zero	2
	.long	.LC42
	.long	.LC2047
	.value	5717
	.zero	2
	.long	.LC42
	.long	.LC2048
	.value	5718
	.zero	2
	.long	.LC42
	.long	.LC2049
	.value	5719
	.zero	2
	.long	.LC42
	.long	.LC2050
	.value	5720
	.zero	2
	.long	.LC42
	.long	.LC2051
	.value	5721
	.zero	2
	.long	.LC42
	.long	.LC2052
	.value	5722
	.zero	2
	.long	.LC42
	.long	.LC2053
	.value	5723
	.zero	2
	.long	.LC42
	.long	.LC2054
	.value	5724
	.zero	2
	.long	.LC42
	.long	.LC2055
	.value	5725
	.zero	2
	.long	.LC42
	.long	.LC2056
	.value	5726
	.zero	2
	.long	.LC42
	.long	.LC2057
	.value	5727
	.zero	2
	.long	.LC2058
	.long	.LC2059
	.value	5728
	.zero	2
	.long	.LC42
	.long	.LC2060
	.value	5729
	.zero	2
	.long	.LC42
	.long	.LC2061
	.value	5730
	.zero	2
	.long	.LC42
	.long	.LC2062
	.value	5731
	.zero	2
	.long	.LC42
	.long	.LC2063
	.value	5732
	.zero	2
	.long	.LC42
	.long	.LC2064
	.value	5733
	.zero	2
	.long	.LC42
	.long	.LC2065
	.value	5734
	.zero	2
	.long	.LC42
	.long	.LC2066
	.value	5735
	.zero	2
	.long	.LC42
	.long	.LC2067
	.value	5736
	.zero	2
	.long	.LC2068
	.long	.LC2069
	.value	5738
	.zero	2
	.long	.LC42
	.long	.LC2070
	.value	5739
	.zero	2
	.long	.LC42
	.long	.LC2071
	.value	5740
	.zero	2
	.long	.LC42
	.long	.LC2072
	.value	5741
	.zero	2
	.long	.LC42
	.long	.LC2073
	.value	5742
	.zero	2
	.long	.LC42
	.long	.LC2074
	.value	5743
	.zero	2
	.long	.LC42
	.long	.LC2075
	.value	5744
	.zero	2
	.long	.LC42
	.long	.LC2076
	.value	5745
	.zero	2
	.long	.LC42
	.long	.LC2077
	.value	5746
	.zero	2
	.long	.LC42
	.long	.LC2078
	.value	5747
	.zero	2
	.long	.LC42
	.long	.LC2079
	.value	5749
	.zero	2
	.long	.LC42
	.long	.LC2080
	.value	5750
	.zero	2
	.long	.LC254
	.long	.LC2081
	.value	5751
	.zero	2
	.long	.LC42
	.long	.LC2082
	.value	5752
	.zero	2
	.long	.LC42
	.long	.LC2083
	.value	5753
	.zero	2
	.long	.LC42
	.long	.LC2084
	.value	5759
	.zero	2
	.long	.LC2085
	.long	.LC2086
	.value	5760
	.zero	2
	.long	.LC2087
	.long	.LC2088
	.value	5761
	.zero	2
	.long	.LC2089
	.long	.LC2089
	.value	5762
	.zero	2
	.long	.LC2090
	.long	.LC2091
	.value	5768
	.zero	2
	.long	.LC2092
	.long	.LC2093
	.value	5770
	.zero	2
	.long	.LC2094
	.long	.LC2095
	.value	5771
	.zero	2
	.long	.LC42
	.long	.LC2096
	.value	5772
	.zero	2
	.long	.LC2097
	.long	.LC2098
	.value	5773
	.zero	2
	.long	.LC2099
	.long	.LC2100
	.value	5774
	.zero	2
	.long	.LC2101
	.long	.LC2102
	.value	5775
	.zero	2
	.long	.LC2103
	.long	.LC2104
	.value	5776
	.zero	2
	.long	.LC2105
	.long	.LC2106
	.value	5779
	.zero	2
	.long	.LC2107
	.long	.LC2107
	.value	5781
	.zero	2
	.long	.LC2108
	.long	.LC2109
	.value	5806
	.zero	2
	.long	.LC2110
	.long	.LC2111
	.value	5811
	.zero	2
	.long	.LC42
	.long	.LC2112
	.value	5816
	.zero	2
	.long	.LC2113
	.long	.LC2114
	.value	5834
	.zero	2
	.long	.LC2115
	.long	.LC2116
	.value	5835
	.zero	2
	.long	.LC2117
	.long	.LC2118
	.value	5836
	.zero	2
	.long	.LC2119
	.long	.LC2120
	.value	5840
	.zero	2
	.long	.LC42
	.long	.LC2121
	.value	5856
	.zero	2
	.long	.LC2122
	.long	.LC2123
	.value	5861
	.zero	2
	.long	.LC42
	.long	.LC2124
	.value	5868
	.zero	2
	.long	.LC2125
	.long	.LC2126
	.value	5872
	.zero	2
	.long	.LC42
	.long	.LC2127
	.value	5873
	.zero	2
	.long	.LC2128
	.long	.LC2129
	.value	5875
	.zero	2
	.long	.LC2130
	.long	.LC2131
	.value	5878
	.zero	2
	.long	.LC2132
	.long	.LC2133
	.value	5888
	.zero	2
	.long	.LC2134
	.long	.LC2135
	.value	5889
	.zero	2
	.long	.LC42
	.long	.LC2136
	.value	5890
	.zero	2
	.long	.LC2137
	.long	.LC2138
	.value	5891
	.zero	2
	.long	.LC2139
	.long	.LC2140
	.value	5892
	.zero	2
	.long	.LC2141
	.long	.LC2142
	.value	5893
	.zero	2
	.long	.LC2143
	.long	.LC2143
	.value	5894
	.zero	2
	.long	.LC2144
	.long	.LC2145
	.value	5895
	.zero	2
	.long	.LC2146
	.long	.LC2147
	.value	5896
	.zero	2
	.long	.LC2148
	.long	.LC2149
	.value	5897
	.zero	2
	.long	.LC2150
	.long	.LC2151
	.value	5898
	.zero	2
	.long	.LC2152
	.long	.LC2153
	.value	5899
	.zero	2
	.long	.LC2154
	.long	.LC2155
	.value	5900
	.zero	2
	.long	.LC2156
	.long	.LC2157
	.value	5901
	.zero	2
	.long	.LC2158
	.long	.LC2159
	.value	5902
	.zero	2
	.long	.LC2160
	.long	.LC2161
	.value	5903
	.zero	2
	.long	.LC2162
	.long	.LC2163
	.value	5904
	.zero	2
	.long	.LC2164
	.long	.LC2165
	.value	5905
	.zero	2
	.long	.LC2166
	.long	.LC2167
	.value	5906
	.zero	2
	.long	.LC2168
	.long	.LC2169
	.value	5907
	.zero	2
	.long	.LC2170
	.long	.LC2171
	.value	5925
	.zero	2
	.long	.LC99
	.long	.LC100
	.value	5940
	.zero	2
	.long	.LC2172
	.long	.LC2173
	.value	5943
	.zero	2
	.long	.LC2174
	.long	.LC2174
	.value	5947
	.zero	2
	.long	.LC2175
	.long	.LC2176
	.value	5955
	.zero	2
	.long	.LC2177
	.long	.LC2178
	.value	5963
	.zero	2
	.long	.LC2179
	.long	.LC2180
	.value	5970
	.zero	2
	.long	.LC2181
	.long	.LC2182
	.value	5971
	.zero	2
	.long	.LC2183
	.long	.LC2184
	.value	5973
	.zero	2
	.long	.LC2185
	.long	.LC2186
	.value	5994
	.zero	2
	.long	.LC2187
	.long	.LC2188
	.value	6025
	.zero	2
	.long	.LC2189
	.long	.LC2190
	.value	6035
	.zero	2
	.long	.LC2191
	.long	.LC2192
	.value	6055
	.zero	2
	.long	.LC2193
	.long	.LC2194
	.value	6058
	.zero	2
	.long	.LC2195
	.long	.LC2196
	.value	6059
	.zero	2
	.long	.LC42
	.long	.LC2197
	.value	6063
	.zero	2
	.long	.LC2198
	.long	.LC2199
	.value	6078
	.zero	2
	.long	.LC2200
	.long	.LC557
	.value	6080
	.zero	2
	.long	.LC2201
	.long	.LC2202
	.value	6084
	.zero	2
	.long	.LC42
	.long	.LC2203
	.value	6092
	.zero	2
	.long	.LC2204
	.long	.LC2204
	.value	6101
	.zero	2
	.long	.LC2205
	.long	.LC2206
	.value	6121
	.zero	2
	.long	.LC42
	.long	.LC2207
	.value	6126
	.zero	2
	.long	.LC2208
	.long	.LC2209
	.value	6163
	.zero	2
	.long	.LC2210
	.long	.LC2211
	.value	6164
	.zero	2
	.long	.LC2212
	.long	.LC2213
	.value	6165
	.zero	2
	.long	.LC2214
	.long	.LC2215
	.value	6176
	.zero	2
	.long	.LC2216
	.long	.LC2217
	.value	6180
	.zero	2
	.long	.LC2218
	.long	.LC2218
	.value	6240
	.zero	2
	.long	.LC2219
	.long	.LC2220
	.value	6252
	.zero	2
	.long	.LC2221
	.long	.LC2222
	.value	6279
	.zero	2
	.long	.LC2223
	.long	.LC2224
	.value	6280
	.zero	2
	.long	.LC42
	.long	.LC2225
	.value	6285
	.zero	2
	.long	.LC2226
	.long	.LC2227
	.value	6288
	.zero	2
	.long	.LC42
	.long	.LC2228
	.value	6332
	.zero	2
	.long	.LC42
	.long	.LC2229
	.value	6345
	.zero	2
	.long	.LC2230
	.long	.LC2231
	.value	6346
	.zero	2
	.long	.LC2232
	.long	.LC2233
	.value	6385
	.zero	2
	.long	.LC2234
	.long	.LC2235
	.value	6388
	.zero	2
	.long	.LC2236
	.long	.LC2237
	.value	6391
	.zero	2
	.long	.LC2238
	.long	.LC2239
	.value	6395
	.zero	2
	.long	.LC42
	.long	.LC2240
	.value	6405
	.zero	2
	.long	.LC2241
	.long	.LC2242
	.value	6416
	.zero	2
	.long	.LC2243
	.long	.LC2243
	.value	6513
	.zero	2
	.long	.LC42
	.long	.LC2244
	.value	6568
	.zero	2
	.long	.LC2245
	.long	.LC2246
	.value	6572
	.zero	2
	.long	.LC2247
	.long	.LC2248
	.value	6626
	.zero	2
	.long	.LC2249
	.long	.LC2250
	.value	6664
	.zero	2
	.long	.LC42
	.long	.LC2251
	.value	6722
	.zero	2
	.long	.LC42
	.long	.LC2252
	.value	6931
	.zero	2
	.long	.LC2253
	.long	.LC2254
	.value	7649
	.zero	2
	.long	.LC425
	.long	.LC425
	.value	8143
	.zero	2
	.long	.LC2255
	.long	.LC2256
	.value	8193
	.zero	2
	.long	.LC42
	.long	.LC2257
	.value	9798
	.zero	2
	.long	.LC2258
	.long	.LC2259
	.value	9999
	.zero	2
	.long	.LC2260
	.long	.LC2261
	.value	11969
	.zero	2
	.long	.LC42
	.long	.LC2262
	.value	13192
	.zero	2
	.long	.LC2263
	.long	.LC2264
	.value	13329
	.zero	2
	.long	.LC42
	.long	.LC2265
	.value	13587
	.zero	2
	.long	.LC2266
	.long	.LC2267
	.value	14575
	.zero	2
	.long	.LC42
	.long	.LC2268
	.value	15677
	.zero	2
	.long	.LC2269
	.long	.LC2270
	.value	16389
	.zero	2
	.long	.LC2271
	.long	.LC2272
	.value	16708
	.zero	2
	.long	.LC2273
	.long	.LC2273
	.value	16748
	.zero	2
	.long	.LC42
	.long	.LC2274
	.value	18048
	.zero	2
	.long	.LC2275
	.long	.LC2276
	.value	18499
	.zero	2
	.long	.LC2089
	.long	.LC2277
	.value	18755
	.zero	2
	.long	.LC42
	.long	.LC2278
	.value	18772
	.zero	2
	.long	.LC2279
	.long	.LC2280
	.value	18808
	.zero	2
	.long	.LC2281
	.long	.LC2282
	.value	19528
	.zero	2
	.long	.LC2283
	.long	.LC2284
	.value	19539
	.zero	2
	.long	.LC2285
	.long	.LC2286
	.value	19617
	.zero	2
	.long	.LC42
	.long	.LC2287
	.value	19793
	.zero	2
	.long	.LC2288
	.long	.LC2289
	.value	19796
	.zero	2
	.long	.LC42
	.long	.LC2290
	.value	19932
	.zero	2
	.long	.LC2291
	.long	.LC2292
	.value	20563
	.zero	2
	.long	.LC2293
	.long	.LC2294
	.value	20790
	.zero	2
	.long	.LC42
	.long	.LC2295
	.value	20803
	.zero	2
	.long	.LC2296
	.long	.LC2297
	.value	21299
	.zero	2
	.long	.LC2298
	.long	.LC2299
	.value	21580
	.zero	2
	.long	.LC42
	.long	.LC2300
	.value	21845
	.zero	2
	.long	.LC2301
	.long	.LC2302
	.value	25609
	.zero	2
	.long	.LC42
	.long	.LC2303
	.value	26214
	.zero	2
	.long	.LC2304
	.long	.LC2305
	.value	30212
	.zero	2
	.long	.LC2306
	.long	.LC2307
	.value	-32634
	.zero	2
	.long	.LC2308
	.long	.LC2309
	.value	-30618
	.zero	2
	.long	.LC2310
	.long	.LC2311
	.value	-30584
	.zero	2
	.long	.LC2312
	.long	.LC2313
	.value	-29170
	.zero	2
	.long	.LC2314
	.long	.LC2315
	.value	-28668
	.zero	2
	.long	.LC2316
	.long	.LC2317
	.value	-28667
	.zero	2
	.long	.LC2316
	.long	.LC2317
	.value	-28262
	.zero	2
	.long	.LC42
	.long	.LC2318
	.value	-27630
	.zero	2
	.long	.LC1251
	.long	.LC1251
	.value	-26983
	.zero	2
	.long	.LC42
	.long	.LC2319
	.value	-26366
	.zero	2
	.long	.LC2320
	.long	.LC2321
	.value	-24416
	.zero	2
	.long	.LC2322
	.long	.LC2323
	.value	-24335
	.zero	2
	.long	.LC42
	.long	.LC2324
	.value	-24064
	.zero	2
	.long	.LC132
	.long	.LC2325
	.value	-23975
	.zero	2
	.long	.LC42
	.long	.LC2326
	.value	-23804
	.zero	2
	.long	.LC173
	.long	.LC173
	.value	-22745
	.zero	2
	.long	.LC42
	.long	.LC2327
	.value	-21950
	.zero	2
	.long	.LC774
	.long	.LC2328
	.value	-21474
	.zero	2
	.long	.LC42
	.long	.LC2329
	.value	-20045
	.zero	2
	.long	.LC814
	.long	.LC2330
	.value	-18284
	.zero	2
	.long	.LC42
	.long	.LC2331
	.value	-16657
	.zero	2
	.long	.LC2332
	.long	.LC2332
	.value	-16383
	.zero	2
	.long	.LC2333
	.long	.LC2334
	.value	-16215
	.zero	2
	.long	.LC2335
	.long	.LC2336
	.value	-16162
	.zero	2
	.long	.LC42
	.long	.LC189
	.value	-16130
	.zero	2
	.long	.LC2337
	.long	.LC2338
	.value	-14814
	.zero	2
	.long	.LC42
	.long	.LC2339
	.value	-13744
	.zero	2
	.long	.LC2340
	.long	.LC2341
	.value	-13570
	.zero	2
	.long	.LC42
	.long	.LC2342
	.value	-13108
	.zero	2
	.long	.LC42
	.long	.LC2343
	.value	-11052
	.zero	2
	.long	.LC2344
	.long	.LC455
	.value	-9069
	.zero	2
	.long	.LC42
	.long	.LC2345
	.value	-8531
	.zero	2
	.long	.LC2346
	.long	.LC2347
	.value	-8529
	.zero	2
	.long	.LC42
	.long	.LC2348
	.value	-7847
	.zero	2
	.long	.LC2349
	.long	.LC2350
	.value	-6977
	.zero	2
	.long	.LC42
	.long	.LC2351
	.value	-5631
	.zero	2
	.long	.LC42
	.long	.LC2352
	.value	-5445
	.zero	2
	.long	.LC2353
	.long	.LC2354
	.value	-5426
	.zero	2
	.long	.LC2355
	.long	.LC2356
	.value	-4928
	.zero	2
	.long	.LC2357
	.long	.LC2358
	.value	-4648
	.zero	2
	.long	.LC2359
	.long	.LC2360
	.value	-2571
	.zero	2
	.long	.LC42
	.long	.LC2361
	.value	-1449
	.zero	2
	.long	.LC2362
	.long	.LC2363
	.globl	PciDevTable
	.section	.rodata
.LC2364:
	.string	"FT232BL"
.LC2365:
	.string	"SafeXcel-1141"
.LC2366:
	.string	"???"
.LC2367:
	.string	"Dreamcast Broadband Adapter"
.LC2368:
	.string	"ZR36067"
.LC2369:
	.string	"AV PCI Controller"
.LC2370:
	.string	"zr36067pqc"
.LC2371:
	.string	"zoran"
.LC2372:
	.string	"ZR36120PQC"
.LC2373:
	.string	"MPEG VideoBVPSXI Capture Card"
.LC2374:
	.string	"ZR36057PQC"
	.align 4
.LC2375:
	.string	"ZORAN PCI Bridge (interface for transferring video across the PCI bus)"
.LC2376:
	.string	"FASTline UTP Quattro"
.LC2377:
	.string	"FASTline FO"
.LC2378:
	.string	"FASTline UTP"
.LC2379:
	.string	"FASTline-II UTP"
.LC2380:
	.string	"FASTline-II FO"
.LC2381:
	.string	"GIGAline"
.LC2382:
	.string	"Gigabit Ethernet Adapter"
.LC2383:
	.string	"2915"
.LC2384:
	.string	"ATT2MD11"
.LC2385:
	.string	"ReadyLink ENET100-VG4"
.LC2386:
	.string	"FreedomLine 100"
.LC2387:
	.string	"832AE28030680"
.LC2388:
	.string	"ReadyLink RL2000"
.LC2389:
	.string	"TXA9882"
	.align 4
.LC2390:
	.string	"ReadyLink  RL100ATX/PCI Fast Ethernet Adapter"
.LC2391:
	.string	"TXA9883"
	.align 4
.LC2392:
	.string	"ReadyLink 100TX (Winbond W89C840)"
.LC2393:
	.string	"TXA9881?"
	.align 4
.LC2394:
	.string	"ReadyLink RL100TX Fast Ethernet Adapter"
.LC2395:
	.string	"PM7364"
	.align 4
.LC2396:
	.string	"FREEDM-32 Frame Engine & Datalink Mgr"
	.align 4
.LC2397:
	.string	"FREEDM-8 Frame Engine & Datalink Manager"
.LC2398:
	.string	"PM7367"
	.align 4
.LC2399:
	.string	"FREEDM-32P32 Frame Engine & Datalink Mgr"
.LC2400:
	.string	"PM7375"
.LC2401:
	.string	"LASAR-155 ATM SAR"
.LC2402:
	.string	"PM7380"
	.align 4
.LC2403:
	.string	"FREEDM-32P672 Frm Engine & Datalink Mgr"
.LC2404:
	.string	"PM7382"
	.align 4
.LC2405:
	.string	"FREEDM-32P256 Frm Engine & Datalink Mgr"
.LC2406:
	.string	"PM7384"
	.align 4
.LC2407:
	.string	"FREEDM-84P672 Frm Engine & Datalink Mgr"
.LC2408:
	.string	"PM8000 SPC"
.LC2409:
	.string	"6G SAS/SATA Controller"
.LC2410:
	.string	"PM8010 SRC"
.LC2411:
	.string	"6G SAS/SATA RAID Controller"
.LC2412:
	.string	"RocketPort"
.LC2413:
	.string	"4-port UART 16954"
.LC2414:
	.string	"NAIATMPCI"
.LC2415:
	.string	"PCI ATM Adapter"
.LC2416:
	.string	"HS-Link Device"
.LC2417:
	.string	"HYSDN"
.LC2418:
	.string	"PCI 9054"
.LC2419:
	.string	"PLX PCI BRIDGE"
.LC2420:
	.string	"Cyclom-Y"
.LC2421:
	.string	"Multiport Serial Card"
.LC2422:
	.string	"Cyclom-4Y"
.LC2423:
	.string	"Cyclom-8Y"
.LC2424:
	.string	"Cyclom-Z"
.LC2425:
	.string	"Intelligent Multiport Serial"
.LC2426:
	.string	"Intelligent Serial Card"
.LC2427:
	.string	"PC300 RX 2"
.LC2428:
	.string	"PC300 RX 1"
.LC2429:
	.string	"PC300 TE 2"
.LC2430:
	.string	"PC300 TE 1"
.LC2431:
	.string	"Roadrunner"
.LC2432:
	.string	"?"
.LC2433:
	.string	"PTM400 PCI Taxi Module"
.LC2434:
	.string	"0x00f71217"
	.align 4
.LC2435:
	.string	"1394 Open Host Controller Interface"
.LC2436:
	.string	"OZ6729"
.LC2437:
	.string	"PCI to PCMCIA Bridge"
.LC2438:
	.string	"OZ6730"
.LC2439:
	.string	"OZ6832/3"
.LC2440:
	.string	"CardBus Controller"
.LC2441:
	.string	"OZ6836/6860"
.LC2442:
	.string	"OZ6812"
.LC2443:
	.string	"OZ6922"
.LC2444:
	.string	"OZ6933"
.LC2445:
	.string	"OZ6912"
.LC2446:
	.string	"OZ711Mx"
.LC2447:
	.string	"MemoryCardBus Accelerator"
.LC2448:
	.string	"0Z711EC1"
.LC2449:
	.string	"SmartCardBus Contoller"
.LC2450:
	.string	"OZ711M1"
.LC2451:
	.string	"Unknown device"
	.align 4
.LC2452:
	.string	"O2Micro Integrated MMC/SD controller"
.LC2453:
	.string	"OZ711M3"
	.align 4
.LC2454:
	.string	"Integrated MMC/SD/MS/xD/SM Controller"
.LC2455:
	.string	"OZ711MP1/MS1"
	.align 4
.LC2456:
	.string	"MemoryCardBus Controller 6-in-1"
.LC2457:
	.string	"unknow"
.LC2458:
	.string	"pci to pcmcia bridge"
.LC2459:
	.string	"OZ711M3/MC3"
.LC2460:
	.string	"MemoryCardBus Controller"
.LC2461:
	.string	"Voodoo"
.LC2462:
	.string	"Voodoo 3D Acceleration Chip"
.LC2463:
	.string	"Voodoo2"
.LC2464:
	.string	"Voodoo 2 3D Accelerator"
.LC2465:
	.string	"Voodoo Banshee"
.LC2466:
	.string	"Voodoo3"
.LC2467:
	.string	"All Voodoo3 chips, 3000"
.LC2468:
	.string	"Voodoo4"
.LC2469:
	.string	"Voodoo5"
.LC2470:
	.string	"Rampage"
	.align 4
.LC2471:
	.string	"Rev.A AGPx4, 0.25\357\277\275, 200/2x200 core/RAM"
.LC2472:
	.string	"Voodoo 3/3000"
.LC2473:
	.string	"Avenger"
.LC2474:
	.string	"9622qac"
	.align 4
.LC2475:
	.string	"AMCC 5933 TMS320C80 DSP/Imaging Board"
.LC2476:
	.string	" "
.LC2477:
	.string	"controller audio multimediale"
.LC2478:
	.string	"KatanaQp"
	.align 4
.LC2479:
	.string	"Real-Time Processing Blade in a standard single-slot AdvancedTCA\357\277\275 formfactor"
.LC2480:
	.string	"KosaiPM"
	.align 4
.LC2481:
	.string	"Intel\357\277\275 Pentium-M\357\277\275 based AMC Module"
.LC2482:
	.string	"Katana3752"
.LC2483:
	.string	"Advanced Tri-Processor Blade"
.LC2484:
	.string	"Katana3750"
.LC2485:
	.string	"Memory controller"
.LC2486:
	.string	"Katana752i"
.LC2487:
	.string	"Real-time Processing Blade"
.LC2488:
	.string	"Katana750i"
.LC2489:
	.string	"CC1000dm"
.LC2490:
	.string	"Processor PMC Carrier Card"
.LC2491:
	.string	"Pm3Gv"
	.align 4
.LC2492:
	.string	"Up to 8 E1/T1/J1 interfaces for PMC-compatible baseboards"
.LC2493:
	.string	"Pm3GE1T1"
	.align 4
.LC2494:
	.string	"Third Generation E1 and T1/J1 interfaces for PMC-compatible baseboards"
.LC2495:
	.string	"SpiderwareSG"
	.align 4
.LC2496:
	.string	"SIGTRAN Signalling Gateway Blade"
.LC2497:
	.string	"SpiderwareSS7"
	.align 4
.LC2498:
	.string	"64 SS7 signaling channels on a single blade"
.LC2499:
	.string	"SpiderSS7"
	.align 4
.LC2500:
	.string	"Portable, STREAMS-Based Implementation of the ITU SS7 Protocol Stack"
.LC2501:
	.string	"Spider FRAME RELAY"
	.align 4
.LC2502:
	.string	"STREAMS-Based Frame Relay Implementation"
.LC2503:
	.string	"Spider STREAMS"
	.align 4
.LC2504:
	.string	"Implementation of the UNIX STREAMS Environment"
.LC2505:
	.string	"Spider DSF"
	.align 4
.LC2506:
	.string	"Transparent STREAMS Interface for High Speed LAN or Shared Memory Systems"
.LC2507:
	.string	"CL560?"
	.align 4
.LC2508:
	.string	"Plum Audio, Video and VTR Controller"
.LC2509:
	.string	"ICH2"
.LC2510:
	.string	"Asus"
.LC2511:
	.string	"MR2800W"
.LC2512:
	.string	"AMR 56K modem"
.LC2513:
	.string	"PCI168/3328"
.LC2514:
	.string	"Audio"
.LC2515:
	.string	"3328"
.LC2516:
	.string	"0x9030"
.LC2517:
	.string	"Reflectometer using PLX 9030"
.LC2518:
	.string	"0304"
.LC2519:
	.string	"PCI to PCI Bridge"
.LC2520:
	.string	"RealMagic64/GX"
.LC2521:
	.string	"SD6425"
.LC2522:
	.string	"MX98715/25"
	.align 4
.LC2523:
	.string	"Single Chip Fast Ethernet NIC Controller"
.LC2524:
	.string	"RealMagic/2D"
.LC2525:
	.string	"REALmagic64/GX"
.LC2526:
	.string	"GUI"
.LC2527:
	.string	"realmagic64/gx"
.LC2528:
	.string	"sd6425"
.LC2529:
	.string	"PCI-DV"
	.align 4
.LC2530:
	.string	"PCI-DV Digital Video Interface"
.LC2531:
	.string	"cl 480"
.LC2532:
	.string	"MPEG"
.LC2533:
	.string	"12.03"
.LC2534:
	.string	"DVD device"
.LC2535:
	.string	"176"
.LC2536:
	.string	"i845E"
.LC2537:
	.string	"cPEG C 3.0 DVD/MPEG2 Decoder"
.LC2538:
	.string	"1"
.LC2539:
	.string	"keyboard"
.LC2540:
	.string	"B1"
.LC2541:
	.string	"ISDN controller"
.LC2542:
	.string	"C4"
.LC2543:
	.string	"ISDN Controller"
.LC2544:
	.string	"A1"
.LC2545:
	.string	"Fritz!PCI 2.0 ISDN Controller"
.LC2546:
	.string	"C2"
.LC2547:
	.string	"T1"
.LC2548:
	.string	"E13 32A5KYW / 2CAKRCT"
.LC2549:
	.string	"DSP TNETD5100GHK / TNETD5015"
.LC2550:
	.string	"82566DM-2"
	.align 4
.LC2551:
	.string	"Intel Gigabit network connection"
.LC2552:
	.string	"."
.LC2553:
	.string	"EasyConnect 8/32"
.LC2554:
	.string	"EasyConnect 8/64"
.LC2555:
	.string	"EasyIO PCI"
.LC2556:
	.string	"IFT-2000"
.LC2557:
	.string	"PCI RAID Controller"
.LC2558:
	.string	"MPEG Forge"
.LC2559:
	.string	"MPEG Fusion"
.LC2560:
	.string	"VideoPlex-pci"
.LC2561:
	.string	"VideoPlex pci bpc1825 rev a"
.LC2562:
	.string	"VideoPlex plus"
.LC2563:
	.string	"VideoPlex BPC 1851 A"
.LC2564:
	.string	"VideoQuest"
.LC2565:
	.string	"PCI-2240i"
.LC2566:
	.string	"EIDE Adapter"
.LC2567:
	.string	"PCI-2220i"
.LC2568:
	.string	"Dale EIDE Adapter"
.LC2569:
	.string	"PCI-2000"
.LC2570:
	.string	"IntelliCache SCSI Adapter"
.LC2571:
	.string	"Realtek 8139b"
	.align 4
.LC2572:
	.string	"AT-2560 Fast Ethernet Adapter (i82557B)"
.LC2573:
	.string	"Realtek 8169S"
.LC2574:
	.string	"AX88772"
	.align 4
.LC2575:
	.string	"USB2.0 to 10/100M Fast Ethernet Controller"
.LC2576:
	.string	"AX88140A"
	.align 4
.LC2577:
	.string	"ASIX AX88140 Based PCI Fast Ethernet Adapter"
.LC2578:
	.string	"AX88172"
.LC2579:
	.string	"USB2 to Fast Ethernet Adapter"
.LC2580:
	.string	"ESS336H"
.LC2581:
	.string	"PCI Fax Modem (early model)"
.LC2582:
	.string	"Multimedia Device"
.LC2583:
	.string	"ESS Solo-1 Soundcard"
.LC2584:
	.string	"ES2839"
	.align 4
.LC2585:
	.string	"Maestro-2 PCI audio accelerator"
.LC2586:
	.string	"ES72222"
.LC2587:
	.string	"Solo-1 PCI AudioDrive family"
.LC2588:
	.string	"ES1978"
.LC2589:
	.string	"ESS Maestro-2E PCI Audiodrive"
.LC2590:
	.string	"ES1989"
.LC2591:
	.string	"ESS Allegro PCI Audio (WDM)"
.LC2592:
	.string	"ESS Maestro 3 PCI Audio (WDM)"
.LC2593:
	.string	"ES2898S"
.LC2594:
	.string	"Maestro 3i"
.LC2595:
	.string	"ES1938/41/46 solo audio"
	.align 4
.LC2596:
	.string	"Maestro-3.COMM PCI Voice+audio"
.LC2597:
	.string	"ES336H"
.LC2598:
	.string	"PCI Fax Modem (later model)"
.LC2599:
	.string	"ES2828S"
.LC2600:
	.string	"TeleDrive"
.LC2601:
	.string	"ES56H-PI"
.LC2602:
	.string	"Data Fax Modem"
.LC2603:
	.string	"2838"
	.align 4
.LC2604:
	.string	"Superlink Modem/V.92 chipset 56K"
.LC2605:
	.string	"2898"
	.align 4
.LC2606:
	.string	"TelDrive ES56T-PI family V.90 PCI modem"
.LC2607:
	.string	"AMCC S5933"
	.align 4
.LC2608:
	.string	"AMCC Bridge + 2 x Super I/O (National PC97338)"
.LC2609:
	.string	"PRISM 3"
	.align 4
.LC2610:
	.string	"LAN-Express IEEE 802.11b PCI Adapter"
.LC2611:
	.string	"ISL3874A"
	.align 4
.LC2612:
	.string	"PRISMII.5 IEE802.11B Wireless LAN"
.LC2613:
	.string	"Unknown"
	.align 4
.LC2614:
	.string	"Creatix CTX405 WLAN Controller"
.LC2615:
	.string	"ISL3890"
	.align 4
.LC2616:
	.string	"PRISM GT 802.11g 54Mbps Wireless Controller"
.LC2617:
	.string	"HMP8130"
.LC2618:
	.string	"NTSC/PAL Video Decoder"
.LC2619:
	.string	"HMP8131"
.LC2620:
	.string	"NE10/100 Adapter (i82557B)"
	.align 4
.LC2621:
	.string	"NE2000Plus (RT8029) Ethernet Adapter"
.LC2622:
	.string	"NICCY PCI card"
	.align 4
.LC2623:
	.string	"Satellite receiver board / MPEG2 decoder"
.LC2624:
	.string	"PCR2101"
.LC2625:
	.string	"telsatturbo"
.LC2626:
	.string	"unknown"
	.align 4
.LC2627:
	.string	"Sek'D ARC88 professional soundcard"
	.align 4
.LC2628:
	.string	"PLX TECHNOLOGY \n PCI9052 \n 0435 \n BX9497.1 MALA"
	.align 4
.LC2629:
	.string	"SEK'D Prodif 96 Pro - professional audio card"
.LC2630:
	.string	"2048"
.LC2631:
	.string	"Prodif Plus sound card"
.LC2632:
	.string	"Marc 8 Midi"
.LC2633:
	.string	"8-in, 8-out sound card"
	.align 4
.LC2634:
	.string	"Tektronix IO Processor / Tektronix PCI Acquisition Interface Rev 204"
	.align 4
.LC2635:
	.string	"e-mobility 802.11b Wireless LAN PCI Card"
.LC2636:
	.string	"SM710"
.LC2637:
	.string	"LynxEM"
.LC2638:
	.string	"SM712"
.LC2639:
	.string	"LynxEM+"
.LC2640:
	.string	"SM720 / SM722"
.LC2641:
	.string	"Lynx3DM"
.LC2642:
	.string	"SM810"
.LC2643:
	.string	"LynxE"
.LC2644:
	.string	"SM811"
.LC2645:
	.string	"SM820"
.LC2646:
	.string	"Lynx3D"
.LC2647:
	.string	"SM910"
.LC2648:
	.string	"SILICON MOTION"
.LC2649:
	.string	"DirecPC"
.LC2650:
	.string	"t9p17af-01"
.LC2651:
	.string	"5880x"
.LC2652:
	.string	"multimedia audio device"
.LC2653:
	.string	"ES 1371"
.LC2654:
	.string	"AudioPCI"
.LC2655:
	.string	"ES1373"
.LC2656:
	.string	"Sound Blaster Audio(PCI)"
.LC2657:
	.string	"ES1371"
.LC2658:
	.string	"AudioPci"
.LC2659:
	.string	"TPE3/TM3"
.LC2660:
	.string	"PowerPC Node"
.LC2661:
	.string	"TM8000"
.LC2662:
	.string	"Efficeon Virtual Northbridge"
.LC2663:
	.string	"TMTM8000"
.LC2664:
	.string	"Efficeon AGP Bridge"
.LC2665:
	.string	"Virtual Northbridge"
.LC2666:
	.string	"LongRun"
.LC2667:
	.string	"Northbridge"
.LC2668:
	.string	"SDRAM Controller"
.LC2669:
	.string	"BIOS scratchpad"
.LC2670:
	.string	"DM9009"
.LC2671:
	.string	"Ethernet Adapter"
.LC2672:
	.string	"DM9102/A/AF"
	.align 4
.LC2673:
	.string	"10/100 Mbps Fast Ethernet Controller"
.LC2674:
	.string	"IT8152F/G"
.LC2675:
	.string	"Audio Digital Controller"
.LC2676:
	.string	"IT8330G"
.LC2677:
	.string	"IDE Controller"
	.align 4
.LC2678:
	.string	"Advanced RISC-to-PCI Companion Chip"
.LC2679:
	.string	"IT8172G"
	.align 4
.LC2680:
	.string	"Ultra RISC (MIPS, SH4) Companion Chip"
.LC2681:
	.string	"IT8211F"
.LC2682:
	.string	"ATA/ATAPI Controller"
.LC2683:
	.string	"IT8212F"
.LC2684:
	.string	"ATA 133 IDE RAID Controller"
.LC2685:
	.string	"IT8213F"
.LC2686:
	.string	"Host Bridge"
.LC2687:
	.string	"IT8871/72"
	.align 4
.LC2688:
	.string	"PCI-ISA I/O chip with SMB & Parallel Port"
.LC2689:
	.string	"IT8875F"
.LC2690:
	.string	"PCI Parallel Port"
.LC2691:
	.string	"IT8888F"
.LC2692:
	.string	"PCI to ISA Bridge"
.LC2693:
	.string	"IT8889F"
.LC2694:
	.string	"sound"
.LC2695:
	.string	"PCI I/O CARD"
.LC2696:
	.string	"ES1849"
.LC2697:
	.string	"Maestro-1 AudioDrive"
.LC2698:
	.string	"LS220D"
.LC2699:
	.string	"DVD Decoder"
.LC2700:
	.string	"LS220C"
.LC2701:
	.string	"LS242"
.LC2702:
	.string	"MPEG/DVD video decoder"
.LC2703:
	.string	"Ethernet 10/100"
	.align 4
.LC2704:
	.string	"AsanteFAST 10/100 PCI Ethernet Adapter"
.LC2705:
	.string	"ATM Adapter"
.LC2706:
	.string	"PCI-1710"
	.align 4
.LC2707:
	.string	"4-Axis Stepping/Servo Motor Card"
.LC2708:
	.string	"PCI-1680U-A"
	.align 4
.LC2709:
	.string	"2-port CAN UniversalPCI Communication Card with Isolation"
.LC2710:
	.string	"PCI-1713"
	.align 4
.LC2711:
	.string	"32-channel Isolated Analog Input Card"
.LC2712:
	.string	"PCI-1724"
	.align 4
.LC2713:
	.string	"14-bit, 32-channel Isolated Analog Output Card"
.LC2714:
	.string	"PBT-415"
	.align 4
.LC2715:
	.string	"PCI 66MHz Analyzer and 33MHz Exerciser"
.LC2716:
	.string	"PBT-515"
	.align 4
.LC2717:
	.string	"PCI 66MHz Analyzer and Exerciser"
.LC2718:
	.string	"PBT-615"
	.align 4
.LC2719:
	.string	"PCI 66MHz and PCI-X 100MHz Bus Analyzer and Exerciser"
.LC2720:
	.string	"Vanguard PCI/PMC/cPCI"
	.align 4
.LC2721:
	.string	"PCI 66MHz and PCI-X 133MHz Bus Analyzer and Exerciser"
.LC2722:
	.string	"DPIO"
	.align 4
.LC2723:
	.string	"Digital Parallel Input Output Device 32bit, 33MHz PCI bus"
.LC2724:
	.string	"DPIO2"
	.align 4
.LC2725:
	.string	"Digital Parallel Input Output Device 64bit, 33MHz PCI bus"
.LC2726:
	.string	"DPIO2-66"
	.align 4
.LC2727:
	.string	"Digital Parallel Input Output Device 64bit, 66MHz PCI bus"
.LC2728:
	.string	"1784-PKTX"
.LC2729:
	.string	"Allen-Bradley 1784-PKTX"
.LC2730:
	.string	"1646T00"
.LC2731:
	.string	"V.92 Lucent Modem"
.LC2732:
	.string	"Wan405"
	.align 4
.LC2733:
	.string	"WANic 400 series X.21 controller"
.LC2734:
	.string	"NAI HSSI Sniffer PCI Adapter"
.LC2735:
	.string	"JRS-3DS100"
.LC2736:
	.string	"PCI"
.LC2737:
	.string	"HERMES-S0"
.LC2738:
	.string	"HERMES-PRI"
.LC2739:
	.string	"HERMES-PRI/PCIX"
.LC2740:
	.string	"3C986"
	.align 4
.LC2741:
	.string	"ACEnic 1000 BASE-SX Ethernet adapter"
.LC2742:
	.string	"3C986-T"
	.align 4
.LC2743:
	.string	"Copper Gigabit Ethernet Adapter"
.LC2744:
	.string	"Hammerhead-Lite-PCI"
	.align 4
.LC2745:
	.string	"DSP Prototyping & Development Card"
.LC2746:
	.string	"Sync4hs/CCP/PCI/MP"
.LC2747:
	.string	"Communications Processor"
.LC2748:
	.string	"7751"
.LC2749:
	.string	"Security Processor"
.LC2750:
	.string	"6500"
.LC2751:
	.string	"Public Key Processor"
.LC2752:
	.string	"7811"
.LC2753:
	.string	"7951"
.LC2754:
	.string	"7814/7851/7854"
.LC2755:
	.string	"8065"
.LC2756:
	.string	"8165"
.LC2757:
	.string	"8154"
.LC2758:
	.string	"7956"
.LC2759:
	.string	"Cryptographic Processor"
.LC2760:
	.string	"7954/7955"
.LC2761:
	.string	"HT80232"
	.align 4
.LC2762:
	.string	"LAN Adapter (NE2000-compatible)"
.LC2763:
	.string	"HT80229"
	.align 4
.LC2764:
	.string	"Ethernet Adapter (NE2000-compatible)"
.LC2765:
	.string	"Blue Heat-8 RS232"
	.align 4
.LC2766:
	.string	"BlueHeat 8 Port RS232 Serial Board"
.LC2767:
	.string	"ISE"
.LC2768:
	.string	"PEI Imaging Subsystem Engine"
.LC2769:
	.string	"PCIVST"
.LC2770:
	.string	"PCI Thresholding Engine"
.LC2771:
	.string	"Video Simulator/Sender"
.LC2772:
	.string	"THR2"
.LC2773:
	.string	"Multi-scale Thresholder"
.LC2774:
	.string	"kssjsjj"
.LC2775:
	.string	"D120JCT-LS Card"
	.align 4
.LC2776:
	.string	"BRI/2 Type Card (Voice Driver)"
.LC2777:
	.string	"D/240JCT-T1 Card"
.LC2778:
	.string	"D/300JCT-E1 Card"
.LC2779:
	.string	"MSI PCI Card"
.LC2780:
	.string	"BRI/160-PCI Card"
.LC2781:
	.string	"BRI/120-PCI Card"
.LC2782:
	.string	"BRI/80-PCI Card"
.LC2783:
	.string	"D/41JCT Card"
.LC2784:
	.string	"D/480JCT-2T1 Card"
.LC2785:
	.string	"D/600JCT-2E1 (75 Ohm) Card"
.LC2786:
	.string	"D/600JCT-2E1"
.LC2787:
	.string	"Dialogic 2E1 - JCT series"
.LC2788:
	.string	"D/320JCT (Resource Only) Card"
.LC2789:
	.string	"D/160JCT (Resource Only) Card"
.LC2790:
	.string	"StudioCard"
.LC2791:
	.string	"BX-12"
.LC2792:
	.string	"SC-2000"
.LC2793:
	.string	"LX-44"
.LC2794:
	.string	"SC-22"
.LC2795:
	.string	"BX-44"
.LC2796:
	.string	"LX-24M"
	.align 4
.LC2797:
	.string	"20-bit 2-in, 4-out audio card w/MPEG-2"
.LC2798:
	.string	"LX-22M"
.LC2799:
	.string	"BX-8"
.LC2800:
	.string	"BX-12e"
.LC2801:
	.string	"EP1S"
	.align 4
.LC2802:
	.string	"SS7 Telecommunications Interface Adapter"
.LC2803:
	.string	"MAP-CA"
.LC2804:
	.string	"Broadband Signal Processor"
.LC2805:
	.string	"MAP-1000"
.LC2806:
	.string	"Digital Signal Processor"
.LC2807:
	.string	"Au1500"
.LC2808:
	.string	"Au1500 Processor"
.LC2809:
	.string	"PI7C7300"
.LC2810:
	.string	"3 Port PCI to PCI bridge"
.LC2811:
	.string	"PI7C8150"
.LC2812:
	.string	"2-Port PCI to PCI Bridge"
.LC2813:
	.string	"PI7C8152"
.LC2814:
	.string	"2-Port PCI-To-PCI Bridge"
.LC2815:
	.string	"PI7C9X130"
.LC2816:
	.string	"PCI-X Bridge"
.LC2817:
	.string	"FoxFire II"
.LC2818:
	.string	"Cryptoswift 200"
.LC2819:
	.string	"Infineon PEB 20534"
.LC2820:
	.string	"Communications Controller"
.LC2821:
	.string	"PCI Controller"
.LC2822:
	.string	"ST16C654"
.LC2823:
	.string	"Quad UART"
.LC2824:
	.string	"TR1000 PRI"
.LC2825:
	.string	"PRI Controller"
.LC2826:
	.string	"TR1000 BRI"
.LC2827:
	.string	"BRI Controller"
.LC2828:
	.string	"AU8820"
	.align 4
.LC2829:
	.string	"Vortex 1 Digital Audio Processor"
.LC2830:
	.string	"AU8830A2"
.LC2831:
	.string	"Vortex 2 Audio Processor"
.LC2832:
	.string	"312EB&REV3"
.LC2833:
	.string	"Aureal Soundcard"
.LC2834:
	.string	"0xxxx"
.LC2835:
	.string	"215RAAGCGA11F"
.LC2836:
	.string	"Grapics Radeon X850"
.LC2837:
	.string	"VT8237"
	.align 4
.LC2838:
	.string	"AC97 Enhanced Audio Controller - the 8251 controller is different"
.LC2839:
	.string	"VideoMaker"
.LC2840:
	.string	"s3 trio"
.LC2841:
	.string	"TRM-S1040"
.LC2842:
	.string	"SCSI ASIC"
.LC2843:
	.string	"DC-390"
.LC2844:
	.string	"SCSI Controller"
.LC2845:
	.string	"DC-690C"
.LC2846:
	.string	"IDE Cache Controller"
.LC2847:
	.string	"DC290M"
	.align 4
.LC2848:
	.string	"Bus Master IDE PCI 2 controllers"
.LC2849:
	.string	"GLint 300SX"
.LC2850:
	.string	"3D Accelerator"
.LC2851:
	.string	"GLint 500TX"
.LC2852:
	.string	"Sapphire 3D Accelerator"
.LC2853:
	.string	"GLint"
.LC2854:
	.string	"Delta Geometry processor"
.LC2855:
	.string	"3C0SX"
.LC2856:
	.string	"2D+3D Accelerator"
.LC2857:
	.string	"Permedia"
.LC2858:
	.string	"GLint MX"
.LC2859:
	.string	"3D Extreme"
.LC2860:
	.string	"Permedia II 2D+3D Accelerator"
.LC2861:
	.string	"GLint Gamma G1"
.LC2862:
	.string	"Permedia2v"
	.align 4
.LC2863:
	.string	"2d+3d chipset, integrated ramdac"
.LC2864:
	.string	"Permedia 3"
.LC2865:
	.string	"GLINT R4"
.LC2866:
	.string	"GLINT Gamma G2"
.LC2867:
	.string	"0x030000"
.LC2868:
	.string	"3Dlabs Wildcat Realizm 800"
.LC2869:
	.string	"Permedia II"
.LC2870:
	.string	"3D+3D Accelerator"
.LC2871:
	.string	"GLint VGA"
.LC2872:
	.string	"3220"
.LC2873:
	.string	"PCI Audio Device"
.LC2874:
	.string	"PCI Audio Device + modem"
.LC2875:
	.string	"ALS300+"
.LC2876:
	.string	"PCI Input Controller"
.LC2877:
	.string	"ALG2064"
.LC2878:
	.string	"GUI Accelerator"
.LC2879:
	.string	"<DELETE>"
.LC2880:
	.string	"ALG2364A"
.LC2881:
	.string	"ALG2301"
.LC2882:
	.string	"ALG2302"
.LC2883:
	.string	"AVG2302"
.LC2884:
	.string	"ALG2364"
.LC2885:
	.string	"ALG2464"
.LC2886:
	.string	"ALG2564A/25128A"
.LC2887:
	.string	"ALS4000"
.LC2888:
	.string	"Audio Chipset"
.LC2889:
	.string	"86C551"
.LC2890:
	.string	"Plato/PX"
.LC2891:
	.string	"via"
.LC2892:
	.string	"86C325"
.LC2893:
	.string	"Virge 3D "
.LC2894:
	.string	"86C866"
.LC2895:
	.string	"Vision 866 GUI Accelerator"
.LC2896:
	.string	"86C964"
.LC2897:
	.string	"Vision 964 GUI Accelerator"
.LC2898:
	.string	"86C732-P"
.LC2899:
	.string	"S3 TRIO32  IACB2  86C732-P"
.LC2900:
	.string	"8622mcq04"
.LC2901:
	.string	"Trio 64/64V"
.LC2902:
	.string	"86CM65?"
.LC2903:
	.string	"Aurora 64V+"
.LC2904:
	.string	"86C764"
.LC2905:
	.string	"Trio 32/64 GUI Accelerator v3"
.LC2906:
	.string	"86C767"
.LC2907:
	.string	"Trio 64UV+"
.LC2908:
	.string	"86CM66"
.LC2909:
	.string	"Aurora128"
.LC2910:
	.string	"86C988"
.LC2911:
	.string	"ViRGE/VX 3D GUI Accelerator"
.LC2912:
	.string	"Fire GL"
.LC2913:
	.string	"86C868"
	.align 4
.LC2914:
	.string	"Vision 868 GUI Accelerator VRAM rev. 0"
	.align 4
.LC2915:
	.string	"Vision 868 GUI Accelerator VRAM rev. 1"
	.align 4
.LC2916:
	.string	"Vision 868 GUI Accelerator VRAM rev. 2"
	.align 4
.LC2917:
	.string	"Vision 868 GUI Accelerator VRAM rev. 3"
.LC2918:
	.string	"86C928"
	.align 4
.LC2919:
	.string	"Vision 928 GUI Accelerator VRAM rev. 0"
	.align 4
.LC2920:
	.string	"Vision 928 GUI Accelerator VRAM rev. 1"
	.align 4
.LC2921:
	.string	"Vision 928 GUI Accelerator VRAM rev. 2"
	.align 4
.LC2922:
	.string	"Vision 928 GUI Accelerator VRAM rev. 3"
.LC2923:
	.string	"86C864"
	.align 4
.LC2924:
	.string	"Vision 864 GUI Accelerator DRAM rev. 0"
	.align 4
.LC2925:
	.string	"Vision 864 GUI Accelerator DRAM rev. 1"
	.align 4
.LC2926:
	.string	"Vision 864 GUI Accelerator DRAM rev. 2"
	.align 4
.LC2927:
	.string	"Vision 864 GUI Accelerator DRAM rev. 3"
	.align 4
.LC2928:
	.string	"Vision 964 GUI Accelerator VRAM rev. 0"
	.align 4
.LC2929:
	.string	"Vision 964-P GUI Accelerator VRAM rev. 1"
	.align 4
.LC2930:
	.string	"Vision 964-P GUI Accelerator DRAM rev 2"
	.align 4
.LC2931:
	.string	"Vision 964-P GUI Accelerator VRAM rev. 3"
.LC2932:
	.string	"86C968"
	.align 4
.LC2933:
	.string	"Vision 968 GUI Accelerator VRAM rev. 0"
	.align 4
.LC2934:
	.string	"Vision 968 GUI Accelerator VRAM rev. 1"
	.align 4
.LC2935:
	.string	"Vision 968 GUI Accelerator VRAM rev. 2"
	.align 4
.LC2936:
	.string	"Vision 968 GUI Accelerator VRAM rev. 3"
.LC2937:
	.string	"86C775"
.LC2938:
	.string	"Trio64V2/DX"
	.align 4
.LC2939:
	.string	"pci\013en_5333dev_8C2E&SUBSYS_00011179&REV_05\004&74C6"
.LC2940:
	.string	"S3 trio64uv+ for windows xp"
.LC2941:
	.string	"SMA Family"
.LC2942:
	.string	"TrioV Family"
.LC2943:
	.string	"86C365/366"
.LC2944:
	.string	"Trio3D QFP/BGA"
.LC2945:
	.string	"86c765"
.LC2946:
	.string	"86C765 Trio64V+ compatible"
.LC2947:
	.string	"9711 MCN74"
.LC2948:
	.string	"7699688"
.LC2949:
	.string	"0x00091011"
.LC2950:
	.string	"9726 c19394.00"
.LC2951:
	.string	"86C765"
.LC2952:
	.string	"86C375/86C385"
.LC2953:
	.string	"ViRGE /DX & /GX"
.LC2954:
	.string	"86C357"
.LC2955:
	.string	"ViRGE /GX2"
.LC2956:
	.string	"86C359"
.LC2957:
	.string	"ViRGE /GX2+ Macrovision"
.LC2958:
	.string	"ViRGE /GX2+"
.LC2959:
	.string	"86C368"
	.align 4
.LC2960:
	.string	"Trio3D2x & Trio3D2x+ AGP / Trio3D2x & Trio3D2x+ 8MB"
.LC2961:
	.string	"86C391"
.LC2962:
	.string	"S3savage3D"
.LC2963:
	.string	"86C390"
.LC2964:
	.string	"Savage3D/MV"
.LC2965:
	.string	"86c398"
.LC2966:
	.string	"Savage 4"
.LC2967:
	.string	"86C394-397"
.LC2968:
	.string	"86C370"
.LC2969:
	.string	"Savage4"
.LC2970:
	.string	"86C395B"
.LC2971:
	.string	"ProSavage"
.LC2972:
	.string	"85C260"
.LC2973:
	.string	"ViRGE/M3 (ViRGE/MX)"
.LC2974:
	.string	"86C260"
.LC2975:
	.string	"ViRGE/M5 (ViRGE/MX)"
.LC2976:
	.string	"86C240"
.LC2977:
	.string	"ViRGE/MXC"
.LC2978:
	.string	"86C280 db"
.LC2979:
	.string	"ViRGE /MX+mv"
.LC2980:
	.string	"86C270/274/290/294"
.LC2981:
	.string	"Savage MX/IX/MX+MV/IX+MV"
.LC2982:
	.string	"82C294"
.LC2983:
	.string	"SAVAGE IX"
.LC2984:
	.string	"86C508"
.LC2985:
	.string	"SuperSavage 128/MX"
.LC2986:
	.string	"86C544"
.LC2987:
	.string	"SuperSavage 128/IX"
.LC2988:
	.string	"86C553"
.LC2989:
	.string	"SuperSavage 128/IX DDR"
.LC2990:
	.string	"86C564"
.LC2991:
	.string	"SuperSavage/IX"
.LC2992:
	.string	"86C573"
.LC2993:
	.string	"SuperSavage/IX DDR"
.LC2994:
	.string	"86C584"
.LC2995:
	.string	"SuperSavage/IXC SDRAM"
.LC2996:
	.string	"86C594"
.LC2997:
	.string	"SuperSavage/IXC DDR"
.LC2998:
	.string	"86C380/381"
.LC2999:
	.string	"Twister/Twister T"
.LC3000:
	.string	"86c387"
.LC3001:
	.string	"Twister K"
.LC3002:
	.string	"86C410"
.LC3003:
	.string	"ProSavage DDR"
.LC3004:
	.string	"86C777/787"
.LC3005:
	.string	"DeltaChrome S8/F1"
.LC3006:
	.string	"86C732"
.LC3007:
	.string	"DeltaChromeX9m"
.LC3008:
	.string	"86c410"
.LC3009:
	.string	"Inno Savage 2000"
.LC3010:
	.string	"86C617"
	.align 4
.LC3011:
	.string	"SonicVibes PCI Audio Accelerator"
.LC3012:
	.string	"XILINX SPARTAN"
.LC3013:
	.string	"16 Channel Audio Capture Card"
	.align 4
.LC3014:
	.string	"Extended Express System Support Ctrlr"
.LC3015:
	.string	"AA"
	.align 4
.LC3016:
	.string	"Intel(R) ICH8 Family SMBus Controller"
.LC3017:
	.string	"80303"
	.align 4
.LC3018:
	.string	"I/O Processor PCI-to-PCI Bridge Unit"
.LC3019:
	.string	"80312"
	.align 4
.LC3020:
	.string	"I/O Companion Unit PCI-to-PCI Bridge"
.LC3021:
	.string	"80219"
	.align 4
.LC3022:
	.string	"General Purpose PCI Processor Address Translation Unit"
.LC3023:
	.string	"670xPXH"
.LC3024:
	.string	"I/OxAPIC Interrupt Controller"
.LC3025:
	.string	"6700PXH"
	.align 4
.LC3026:
	.string	"I/OxAPIC Interrupt Controller B"
	.align 4
.LC3027:
	.string	"PCI Express-to-PCI Express Bridge A"
	.align 4
.LC3028:
	.string	"PCI Express-to-PCI Express Bridge B"
.LC3029:
	.string	"6702PXH"
	.align 4
.LC3030:
	.string	"PCI Express-to-PCI Express Bridge"
.LC3031:
	.string	"80332"
.LC3032:
	.string	"A-Segment Bridge"
.LC3033:
	.string	"A-Segment IOAPIC"
.LC3034:
	.string	"B-Segment Bridge"
.LC3035:
	.string	"B-Segment IOAPIC"
.LC3036:
	.string	"Address Translation Unit"
.LC3037:
	.string	"80331"
	.align 4
.LC3038:
	.string	"Address Translation Unit (ATU)"
.LC3039:
	.string	"41210"
	.align 4
.LC3040:
	.string	"Serial to Parallel PCI Bridge A"
	.align 4
.LC3041:
	.string	"Serial to Parallel PCI Bridge B"
.LC3042:
	.string	"80333"
	.align 4
.LC3043:
	.string	"Segment-A PCI Express-to-PCI Express Bridge"
.LC3044:
	.string	"A-Bus IOAPIC"
	.align 4
.LC3045:
	.string	"Segment-B PCI Express-to-PCI Express Bridge"
.LC3046:
	.string	"B-Bus IOAPIC"
.LC3047:
	.string	"82375MB"
.LC3048:
	.string	"PCI-EISA Bridge (PCEB)"
.LC3049:
	.string	"82424TX/ZX"
.LC3050:
	.string	"CPU (i486) Bridge (Saturn)"
.LC3051:
	.string	"82378ZB/IB"
.LC3052:
	.string	"SIO ISA Bridge"
.LC3053:
	.string	"82425EX"
.LC3054:
	.string	"82434bX/zX"
	.align 4
.LC3055:
	.string	"Mercury/Neptune Cache/DRAM Controller"
.LC3056:
	.string	"E8870"
.LC3057:
	.string	"Processor Bus Controller"
.LC3058:
	.string	"Memory Controller"
.LC3059:
	.string	"Scalability Port 0"
	.align 4
.LC3060:
	.string	"Scalability Port 1 / Glob. Perf. Monitor"
.LC3061:
	.string	"E8870IO"
	.align 4
.LC3062:
	.string	"Hub Interface Port 0 (8-bit compatible)"
.LC3063:
	.string	"Hub Interface Port 1"
.LC3064:
	.string	"Hub Interface Port 2"
.LC3065:
	.string	"Hub Interface Port 3"
.LC3066:
	.string	"Hub Interface Port 4"
.LC3067:
	.string	"Server I/O Hub (SIOH)"
	.align 4
.LC3068:
	.string	"Reliabilty, Availability, Serviceability"
.LC3069:
	.string	"E8870SP"
.LC3070:
	.string	"Scalability Port 1"
.LC3071:
	.string	"Scalability Port 2"
.LC3072:
	.string	"Scalability Port 3"
.LC3073:
	.string	"Scalability Port 4"
.LC3074:
	.string	"Scalability Port 5"
	.align 4
.LC3075:
	.string	"Scalability Port Switch Global Registers"
	.align 4
.LC3076:
	.string	"Interleave Configuration Registers"
.LC3077:
	.string	"01af8086"
.LC3078:
	.string	"Storage RAID Controller"
.LC3079:
	.string	"80960RP"
.LC3080:
	.string	"i960 RP Microprocessor/Bridge"
.LC3081:
	.string	"80960RM/RN"
	.align 4
.LC3082:
	.string	"i960RM/RN Microprocessor/Bridge"
.LC3083:
	.string	"i960 RP Microprocessor Bridge"
.LC3084:
	.string	"82542"
.LC3085:
	.string	"Gigabit Ethernet Controller"
.LC3086:
	.string	"2572"
	.align 4
.LC3087:
	.string	"10/100/1000 Ethernet Controller (Fiber)"
	.align 4
.LC3088:
	.string	"Pro 100 LAN+Modem 56 CardBus II"
.LC3089:
	.string	"82543GC"
	.align 4
.LC3090:
	.string	"Gigabit Ethernet Controller (Copper)"
.LC3091:
	.string	"82544EI/GC"
.LC3092:
	.string	"82544EI"
	.align 4
.LC3093:
	.string	"Gigabit Ethernet Controller (Fiber)"
.LC3094:
	.string	"82543EI/GC"
.LC3095:
	.string	"82544GC"
	.align 4
.LC3096:
	.string	"Gigabit Ethernet Controller (LOM)"
.LC3097:
	.string	"82540EM"
.LC3098:
	.string	"82545EM"
	.align 4
.LC3099:
	.string	"Gigabit Ethernet Controller (copper)"
.LC3100:
	.string	"82546EB"
	.align 4
.LC3101:
	.string	"Dual Port Gigabit Ethernet Controller (Copper)"
	.align 4
.LC3102:
	.string	"Dual Port Gigabit Ethernet Controller (Fiber)"
.LC3103:
	.string	"82541EI"
.LC3104:
	.string	"82541ER"
.LC3105:
	.string	"82540EP"
.LC3106:
	.string	"PRO/1000 MT Mobile connection"
.LC3107:
	.string	"82547EI"
	.align 4
.LC3108:
	.string	"Dual Port Gigabit Ethernet Controller"
	.align 4
.LC3109:
	.string	"Gigabit Ethernet Controller (Mobile)"
.LC3110:
	.string	"82545ep"
.LC3111:
	.string	"82545GM"
.LC3112:
	.string	"82559"
	.align 4
.LC3113:
	.string	"Fast Ethernet PCI/CardBus Controller"
.LC3114:
	.string	"825593"
.LC3115:
	.string	"PCI Networking device"
.LC3116:
	.string	"82801CAM"
.LC3117:
	.string	"PRO/100 VE Network Connection"
.LC3118:
	.string	"PRO/100 VM Network Connection"
.LC3119:
	.string	"82562EH"
.LC3120:
	.string	"Phoneline Network Connection"
.LC3121:
	.string	"LAN Controller"
	.align 4
.LC3122:
	.string	"PRO/100 VM/KM Network Connection"
.LC3123:
	.string	"10011734"
	.align 4
.LC3124:
	.string	"LAN Controller with 82562ET/EZ PHY"
.LC3125:
	.string	"82801DB"
	.align 4
.LC3126:
	.string	"LAN Controller with 82562ET/EZ (CNR) PHY"
	.align 4
.LC3127:
	.string	"LAN Controller with 82562EM/EX PHY"
	.align 4
.LC3128:
	.string	"LAN Controller with 82562EM/EX (CNR) PHY"
.LC3129:
	.string	"536EP"
.LC3130:
	.string	"V.92 PCI (DSP) Data Fax Modem"
	.align 4
.LC3131:
	.string	"PRO/Wireless 2011 LAN PCI Card"
.LC3132:
	.string	"82801"
	.align 4
.LC3133:
	.string	"Intel(R) PRO/Wireless 2100 LAN Card Driver"
.LC3134:
	.string	"82597EX"
	.align 4
.LC3135:
	.string	"10 Gigabit Ethernet Controller"
.LC3136:
	.string	"82566MM NIC"
	.align 4
.LC3137:
	.string	"Gigabit Network Connection Interface Controller"
.LC3138:
	.string	"82566DM"
.LC3139:
	.string	"Gigabit Ethernet"
.LC3140:
	.string	"82566DC"
.LC3141:
	.string	"82801EB/ER"
	.align 4
.LC3142:
	.string	"PRO/100 VE Network Connection (mobile)"
	.align 4
.LC3143:
	.string	"PRO/100 VM Network Connection (mobile)"
.LC3144:
	.string	"82551QM"
.LC3145:
	.string	"n1e5132"
	.align 4
.LC3146:
	.string	"HP NC360T PCIe DP Gigabit Server Adapter"
.LC3147:
	.string	"Intel Pro VE"
.LC3148:
	.string	"82562EZ PLC"
.LC3149:
	.string	"82801FB/FR/FW/FRW"
.LC3150:
	.string	"82562"
	.align 4
.LC3151:
	.string	"1068h 82562ET/EZ/GT/GZ PRO/100 VE Ethernet Controller"
.LC3152:
	.string	"82541PI"
	.align 4
.LC3153:
	.string	"Gigabit Ethernet Controller (Copper) rev 5"
.LC3154:
	.string	"0321CGEA04"
	.align 4
.LC3155:
	.string	"FA82537EP - Intel 537EP V.92 (PCI)  modem"
.LC3156:
	.string	"PC82573V"
	.align 4
.LC3157:
	.string	"Intel network controller (PCIE Gigabit Ethernet)"
.LC3158:
	.string	"82573E"
	.align 4
.LC3159:
	.string	"Intel Corporation 82573E Gigabit Ethernet Controller (Copper)"
.LC3160:
	.string	"ICH7R"
	.align 4
.LC3161:
	.string	"Intel(R) Active Management Technology - KCS"
	.align 4
.LC3162:
	.string	"Intel(R) Active Management Technology - SOL"
.LC3163:
	.string	"27DA"
.LC3164:
	.string	"PRO/100 VE Network Controller"
	.align 4
.LC3165:
	.string	"Onboard - Intel PRO 100/VE nic"
.LC3166:
	.string	"get PRO2KXP.exe from Intel"
.LC3167:
	.string	"Intel PRO/1000 EB"
.LC3168:
	.string	"82573L"
	.align 4
.LC3169:
	.string	"Intel PRO/1000 PL Network Adaptor"
.LC3170:
	.string	"82572GI"
.LC3171:
	.string	"Intel PRO/1000 PT Desktop"
	.align 4
.LC3172:
	.string	"Intel 82566DM Gigabit Ethernet Adapter"
.LC3173:
	.string	"8082"
	.align 4
.LC3174:
	.string	"Intel(R) 82562V-2 10/100 Network Connection"
.LC3175:
	.string	"83567LM-3 "
.LC3176:
	.string	"82567LM"
	.align 4
.LC3177:
	.string	"Intel\357\277\275  82567LM-2 Gigabit Network Connection"
.LC3178:
	.string	"82815/EP/P"
	.align 4
.LC3179:
	.string	"Host-Hub Interface Bridge / DRAM Ctrlr"
.LC3180:
	.string	"AGP Bridge"
.LC3181:
	.string	"82815"
.LC3182:
	.string	"Internal Graphics Device"
.LC3183:
	.string	"82815/82815EM/EP"
.LC3184:
	.string	"65416"
	.align 4
.LC3185:
	.string	"Internal Graphics Device [810/815 chipset AGP]"
.LC3186:
	.string	"82806AA"
.LC3187:
	.string	"I/O APIC Device"
.LC3188:
	.string	"BECC"
	.align 4
.LC3189:
	.string	"XScale 80200 Companion Chip (FPGA)"
.LC3190:
	.string	"IXP1200"
.LC3191:
	.string	"Network Processor"
.LC3192:
	.string	"8255xER/IT"
.LC3193:
	.string	"Fast Ethernet Controller"
.LC3194:
	.string	"82092AA"
.LC3195:
	.string	"PCMCIA Bridge"
.LC3196:
	.string	"IDE Ctrlr"
.LC3197:
	.string	"SAA 7116 H"
.LC3198:
	.string	"Video Controller"
.LC3199:
	.string	"82452KX/GX"
	.align 4
.LC3200:
	.string	"Orion Extended Express CPU to PCI Bridge"
.LC3201:
	.string	"82596"
.LC3202:
	.string	"EtherExpress PRO/10"
.LC3203:
	.string	"82801db ich4"
	.align 4
.LC3204:
	.string	"LAN Controller with 82562EM/EX PHY\tPCI"
.LC3205:
	.string	"EE PRO/100 Smart"
	.align 4
.LC3206:
	.string	"Intelligent 10/100 Fast Ethernet Adapter"
.LC3207:
	.string	"82557/8/9/0/1"
.LC3208:
	.string	"Fast Ethernet LAN Controller"
.LC3209:
	.string	"82437FX"
.LC3210:
	.string	"System Controller (TSC)"
.LC3211:
	.string	"82371FB"
.LC3212:
	.string	"PCI to ISA Bridge (Triton)"
.LC3213:
	.string	"FW82371AB"
.LC3214:
	.string	"IDE Interface (Triton)"
.LC3215:
	.string	"16345"
.LC3216:
	.string	"DSVD Modem"
.LC3217:
	.string	"82371MX"
.LC3218:
	.string	"82439TX"
	.align 4
.LC3219:
	.string	"Mobile System Controller (MTSC)"
.LC3220:
	.string	"82440LX/EX"
.LC3221:
	.string	"PCI & Memory"
.LC3222:
	.string	"82380PB"
.LC3223:
	.string	"PCI to PCI Docking Bridge"
.LC3224:
	.string	"82380AB"
	.align 4
.LC3225:
	.string	"Mobile PCI-to-ISA Bridge (MISA)"
.LC3226:
	.string	"683053"
.LC3227:
	.string	"Programmable Interrupt Device"
.LC3228:
	.string	"82466GX"
	.align 4
.LC3229:
	.string	"Integrated Hot-Plug Controller (IHPC)"
.LC3230:
	.string	"82752"
.LC3231:
	.string	"AGP Graphics Accelerator"
.LC3232:
	.string	"4227"
	.align 4
.LC3233:
	.string	"Mobile PCI-to-PCI Bridge (MPCI2)"
.LC3234:
	.string	"82430HX"
.LC3235:
	.string	"System Controller (TXC)"
.LC3236:
	.string	"92XX"
	.align 4
.LC3237:
	.string	"SIGMATEL STAC 92XX C-Major HD Audio"
.LC3238:
	.string	"Hub Interface to PCI Bridge"
.LC3239:
	.string	"Advanced Interrupt Controller"
.LC3240:
	.string	"82870P2"
.LC3241:
	.string	"Hub Interface-to-PCI Bridge"
.LC3242:
	.string	"14611014"
.LC3243:
	.string	"Hot Plug Controller"
.LC3244:
	.string	"i960RP Microprocessor"
	.align 4
.LC3245:
	.string	"Promise SuperTrak SX6000 IDE RAID Controller"
	.align 4
.LC3246:
	.string	"Eicon DIVA Server Voice PRI 2.0 (PCI)"
.LC3247:
	.string	"82840"
	.align 4
.LC3248:
	.string	"Host-Hub Interface A Bridge / DRAM Ctrlr"
	.align 4
.LC3249:
	.string	"Host to I/O Hub Bridge (Quad PCI)"
.LC3250:
	.string	"Hub Interface B Bridge"
.LC3251:
	.string	"82845G[GL/GV/GE/PE]"
.LC3252:
	.string	"Host-Hub Interface Bridge"
.LC3253:
	.string	"82845[MP/MZ]"
.LC3254:
	.string	"5000P"
	.align 4
.LC3255:
	.string	"5000 Series Chipset DMA Engine"
.LC3256:
	.string	"82801AA"
	.align 4
.LC3257:
	.string	"AC97 Audio Controller. website to download - http://www.intel.com/design/chipsets/manuals/29802801.p"
.LC3258:
	.string	"LPC Interface"
.LC3259:
	.string	"IDE Controller (UltraATA/66)"
.LC3260:
	.string	"USB Controller"
.LC3261:
	.string	"SMBus Controller"
	.align 4
.LC3262:
	.string	"Intel 82801DBM SM/BUS Controller 24C3"
	.align 4
.LC3263:
	.string	"Aureal (AD1881 SOUNDMAX) Placa M\357\277\275e Asaki P3-141"
.LC3264:
	.string	"82801fb"
.LC3265:
	.string	"AC'97 Modem Controller"
.LC3266:
	.string	"82801AB"
.LC3267:
	.string	"IDE Controller (UltraATA/33)"
.LC3268:
	.string	"82845G"
.LC3269:
	.string	"Video controler"
.LC3270:
	.string	"AC97 Modem Controller"
.LC3271:
	.string	"82810"
.LC3272:
	.string	"pci bus"
.LC3273:
	.string	"82801BA"
.LC3274:
	.string	"LPC Interface Bridge, ICH2"
.LC3275:
	.string	"82801BA/BAM"
.LC3276:
	.string	"USB Controller, USB-A"
.LC3277:
	.string	"0055110A"
.LC3278:
	.string	"USB Controller, USB-B"
.LC3279:
	.string	"Intel i945G/GZ"
.LC3280:
	.string	"AC97 Audio Controller"
.LC3281:
	.string	"82801BAM/CAM/DBM"
.LC3282:
	.string	"82559ER"
	.align 4
.LC3283:
	.string	"82559ER Integrated 10Base-T/100Base-TX Ethernet Controller"
.LC3284:
	.string	"82801BAM"
.LC3285:
	.string	"LPC Interface Bridge"
.LC3286:
	.string	"82801E"
.LC3287:
	.string	"LAN0 Controller"
.LC3288:
	.string	"LAN1 Controller"
.LC3289:
	.string	"82801CA"
.LC3290:
	.string	"82801CA/CAM"
.LC3291:
	.string	"AC 97 Modem Controller"
.LC3292:
	.string	"UltraATA IDE Controller"
.LC3293:
	.string	"UltraATA/100 IDE Controller"
	.align 4
.LC3294:
	.string	"LPC Interface or ISA bridge: see Notes"
.LC3295:
	.string	"82801??"
.LC3296:
	.string	"USB 2.0 EHCI Contoroller"
.LC3297:
	.string	"82801DB/DBL"
.LC3298:
	.string	"82801DB/DBL/DBM"
.LC3299:
	.string	"USB UHCI Controller #1"
.LC3300:
	.string	"modem"
.LC3301:
	.string	"USB UHCI Controller"
.LC3302:
	.string	"Realtek ALC268 & ALC650"
.LC3303:
	.string	"RealTek"
.LC3304:
	.string	"Subsys_01601028"
	.align 4
.LC3305:
	.string	"Soundmax Integrated Digital Audio"
.LC3306:
	.string	"USB UHCI Controller #3"
.LC3307:
	.string	"82801DBM"
.LC3308:
	.string	"IDE Controller (UltraATA/100)"
.LC3309:
	.string	"USB EHCI Controller"
.LC3310:
	.string	"SATA Controller"
.LC3311:
	.string	"USB UHCI Controller #2"
.LC3312:
	.string	"815B104D"
	.align 4
.LC3313:
	.string	"multimedia audio device (codec AC97) SoundMAX or VIA"
.LC3314:
	.string	"EIDE Controller"
.LC3315:
	.string	"82801EB"
.LC3316:
	.string	"LPC Interface Controller"
.LC3317:
	.string	"USB UHCI Controller #4"
.LC3318:
	.string	"82801ER"
.LC3319:
	.string	"SATA Controller (RAID)"
.LC3320:
	.string	"82820"
.LC3321:
	.string	"Host Bridge (MCH)"
.LC3322:
	.string	"82805AA"
.LC3323:
	.string	"Memory Translator Hub (MTH)"
.LC3324:
	.string	"82804AA"
	.align 4
.LC3325:
	.string	"Memory Repeater Hub for SDRAM (MRH-S)"
.LC3326:
	.string	"82850/E"
	.align 4
.LC3327:
	.string	"Host-Hub Interface Bridge(A2 step)"
.LC3328:
	.string	"82860"
	.align 4
.LC3329:
	.string	"Host-Hub Interface_A Bridge (DP mode)"
.LC3330:
	.string	"82850/850E/860"
.LC3331:
	.string	"Hub Interface_B Bridge"
.LC3332:
	.string	"Hub Interface_C Bridge"
.LC3333:
	.string	"PCI Bridge"
.LC3334:
	.string	"(Quad Processor mode)"
.LC3335:
	.string	"E7500"
	.align 4
.LC3336:
	.string	"Host-HI Bridge & DRAM Controller"
.LC3337:
	.string	"E7500/E7501"
	.align 4
.LC3338:
	.string	"DRAM Controller Error Reporting"
	.align 4
.LC3339:
	.string	"HI_B Virtual PCI-to-PCI Bridge"
	.align 4
.LC3340:
	.string	"HI_B PCI-to-PCI Bridge Error Reporting"
	.align 4
.LC3341:
	.string	"HI_C Virtual PCI-to-PCI Bridge"
	.align 4
.LC3342:
	.string	"HI_C PCI-to-PCI Bridge Error Reporting"
	.align 4
.LC3343:
	.string	"HI_D Virtual PCI-to-PCI Bridge"
	.align 4
.LC3344:
	.string	"HI_D PCI-to-PCI Bridge Error Reporting"
.LC3345:
	.string	"E7501"
.LC3346:
	.string	"Host Controller"
.LC3347:
	.string	"E7505"
.LC3348:
	.string	"25511014"
.LC3349:
	.string	"Host RAS Controller"
.LC3350:
	.string	"E7205/E7505"
.LC3351:
	.string	"PCI-to-AGP Bridge"
	.align 4
.LC3352:
	.string	"Hub Interface_B PCI-to-PCI Bridge"
	.align 4
.LC3353:
	.string	"Hub I/F_B PCI-to-PCI Bridge Error Report"
.LC3354:
	.string	"E7205"
.LC3355:
	.string	"82845G/GL/GV/GE/PE"
	.align 4
.LC3356:
	.string	"DRAM Controller / Host-Hub I/F Bridge"
.LC3357:
	.string	"Host-to-AGP Bridge"
.LC3358:
	.string	"Integrated Graphics Device"
.LC3359:
	.string	"82865G/PE/P, 82848P"
	.align 4
.LC3360:
	.string	"DRAM Controller / Host-Hub Interface"
.LC3361:
	.string	"82865G"
.LC3362:
	.string	"PCI-to-CSA Bridge"
.LC3363:
	.string	"Overflow Configuration"
.LC3364:
	.string	"82875P/E7210"
.LC3365:
	.string	"82875P"
.LC3366:
	.string	"PCI to CSA Bridge"
.LC3367:
	.string	"915G/P/GV"
.LC3368:
	.string	"Host Bridge / DRAM Controller"
.LC3369:
	.string	"915G/P/GV, 925X/XE?"
.LC3370:
	.string	"Host-PCI Express Bridge"
.LC3371:
	.string	"0181102"
	.align 4
.LC3372:
	.string	"82915g/gv/910gl Express Chipset Family"
.LC3373:
	.string	"82925X/XE"
.LC3374:
	.string	"E7221"
.LC3375:
	.string	"Host Bridge/DRAM Controller"
.LC3376:
	.string	"PCI Express Bridge"
.LC3377:
	.string	"Internal Graphics"
.LC3378:
	.string	"915GM"
	.align 4
.LC3379:
	.string	"Mobile Intel(R) 915GM/PM/GMS/910GML Express Processor to DRAM Controller"
	.align 4
.LC3380:
	.string	"Intel 82852/82855 Graphic controller family"
	.align 4
.LC3381:
	.string	"you can be found in www.intelcom"
.LC3382:
	.string	"6300ESB"
.LC3383:
	.string	"AC'97 Audio Controller"
.LC3384:
	.string	"USB 1.1 UHCI Controller #1"
.LC3385:
	.string	"USB 1.1 UHCI Controller #2"
.LC3386:
	.string	"Watchdog Timer"
.LC3387:
	.string	"APIC1"
.LC3388:
	.string	"USB 2.0 EHCI Controller"
.LC3389:
	.string	"Hub Interface to PCI-X Bridge"
	.align 4
.LC3390:
	.string	"Serial ATA Controller (RAID mode)"
.LC3391:
	.string	"E8500"
.LC3392:
	.string	"Hub Interface 1.5"
.LC3393:
	.string	"PCI Express Port D"
.LC3394:
	.string	"PCI Express Port C0"
.LC3395:
	.string	"PCI Express Port C1"
.LC3396:
	.string	"PCI Express Port B0"
.LC3397:
	.string	"PCI Express Port B1"
.LC3398:
	.string	"PCI Express Port A0"
.LC3399:
	.string	"PCI Express Port A1"
.LC3400:
	.string	"82801FB/FR"
.LC3401:
	.string	"82801FBM"
.LC3402:
	.string	"LPC Interface Bridge (ICH6-M)"
.LC3403:
	.string	"82801Fb"
.LC3404:
	.string	"82801FR"
.LC3405:
	.string	"SATA RAID Controller"
.LC3406:
	.string	"82801FR/FRW"
.LC3407:
	.string	"SATA Raid Controller"
.LC3408:
	.string	"AHCI Controller"
.LC3409:
	.string	"SATA AHCI Controller"
.LC3410:
	.string	"SATA IDE Controller"
.LC3411:
	.string	"PCI Express Port 1"
.LC3412:
	.string	"PCI Express Port 2"
.LC3413:
	.string	"82801FB"
.LC3414:
	.string	"PCI Express Port 3"
.LC3415:
	.string	"PCI Express Port 4"
.LC3416:
	.string	"11583659"
	.align 4
.LC3417:
	.string	"82801FB (ICH6) High Definition Audio Controller"
.LC3418:
	.string	"2028026"
.LC3419:
	.string	"jkn "
.LC3420:
	.string	"82801BA/CA"
.LC3421:
	.string	"82801I"
	.align 4
.LC3422:
	.string	"INTEL 82801FB ICH6-AC'97 AUDIO CONTROLLER"
	.align 4
.LC3423:
	.string	"Intel Corporation  82830M/MG SDRAM Controller / Ho"
	.align 4
.LC3424:
	.string	"AC '97 Audio Controller/ Sigmatel (SoundMAX Integrated Digital Audio)"
.LC3425:
	.string	"82801FB/FBM/FW/FR/FRW"
.LC3426:
	.string	"PATA100 Controller - 266F"
.LC3427:
	.string	"62089A2"
	.align 4
.LC3428:
	.string	"LSI LOGIC, 62089A2, LSISAS1068 B0, T 0620, WE 119200.1"
.LC3429:
	.string	"82945G/GZ/P/PL"
.LC3430:
	.string	"Host to PCI Express Bridge"
.LC3431:
	.string	"82945G/GZ"
.LC3432:
	.string	"82975X"
.LC3433:
	.string	"Intel 975X Express Chipset"
.LC3434:
	.string	"82915G"
.LC3435:
	.string	"Graphics device"
	.align 4
.LC3436:
	.string	"Graphics device: 82915G/GV/910GL Express Chipset Family"
.LC3437:
	.string	"Mobile 82915GLx/x/x"
	.align 4
.LC3438:
	.string	"Mobile Intel(R) 915GM/GMS/, 910GML Express Chipset Family"
.LC3439:
	.string	"874079"
.LC3440:
	.string	"i945GM Express Chipset"
.LC3441:
	.string	"82940GML"
	.align 4
.LC3442:
	.string	"Mobile Intel(R) 945 Express Chipset Family"
.LC3443:
	.string	"945GM"
.LC3444:
	.string	"Intel 945GM/950"
.LC3445:
	.string	"945GL"
	.align 4
.LC3446:
	.string	"Intel 82801GB/GR (ICH7 Family) LPC Interface Controller - 27B8"
.LC3447:
	.string	"82801GB/GR/GH"
	.align 4
.LC3448:
	.string	"82801 GB Serial ATA Storage Controllers"
.LC3449:
	.string	"82801GR/GH"
.LC3450:
	.string	"Raid Controller"
.LC3451:
	.string	"82801GBM/GHM"
.LC3452:
	.string	"82801GHM"
.LC3453:
	.string	"-"
.LC3454:
	.string	"26331019"
.LC3455:
	.string	"INTEL"
.LC3456:
	.string	"945GME"
.LC3457:
	.string	"Intel core2duo"
.LC3458:
	.string	"Microsoft UAA Bus HD Audio"
.LC3459:
	.string	"1B761019"
.LC3460:
	.string	"SMBus Controller XP driver"
.LC3461:
	.string	"Intel PRO/100"
	.align 4
.LC3462:
	.string	"Intel(R) PRO/100 VE Network Connection"
.LC3463:
	.string	"82801GB/GBM/GR/GH/GHM"
.LC3464:
	.string	"PATA100"
.LC3465:
	.string	"82801HB/HR/HH/HO"
.LC3466:
	.string	"SATA IDE Controller:4 port"
.LC3467:
	.string	"82821HR/HH/HO"
	.align 4
.LC3468:
	.string	"82801HR/HH/HO&82801IR/IH/IO(AIE=0)/ICH10R"
.LC3469:
	.string	"82801HB"
.LC3470:
	.string	"ICH8 AHCI Controller"
.LC3471:
	.string	"SATA IDE Controller:2 port"
.LC3472:
	.string	"82801HBM/HEM"
.LC3473:
	.string	"ICH8ME/9ME"
.LC3474:
	.string	"81EC1043 (?)"
	.align 4
.LC3475:
	.string	"ICH8 Enhanced USB2 Enhanced Host Controller"
.LC3476:
	.string	"82801H"
	.align 4
.LC3477:
	.string	"Intel audio controller embedded with the 82801H chipset ( ICH8 chipset )"
.LC3478:
	.string	"PATA Controller"
.LC3479:
	.string	"82801(IB)/IR/IH/IO"
.LC3480:
	.string	"82801IR/IH/IO"
.LC3481:
	.string	"SATA IDE Controller:2 port1"
.LC3482:
	.string	"82801IB"
.LC3483:
	.string	"ICH9 AHCI Controller"
.LC3484:
	.string	"82801IR/IH/IO(AIE=1)"
.LC3485:
	.string	"SATA IDE Controller:2 port2"
.LC3486:
	.string	"?(ICH9M Family)"
.LC3487:
	.string	"SATA IDE Controller:2port1"
.LC3488:
	.string	"ICH9M/ME"
.LC3489:
	.string	"ICH9M/ME AHCI Controller"
.LC3490:
	.string	"SATA IDE Controller:2port2"
.LC3491:
	.string	"SATA IDE Controller:1port2"
.LC3492:
	.string	"ICH9 Family SMBus Controller"
.LC3493:
	.string	"486486"
	.align 4
.LC3494:
	.string	"82801IB/IR/IH (ICH9 Family) HD Audio Controller"
.LC3495:
	.string	"82566DC-2"
	.align 4
.LC3496:
	.string	"Intel(R) 82566DC-2 Gigabit Network Connection"
.LC3497:
	.string	"82946GZ "
	.align 4
.LC3498:
	.string	"Onboard Video Device for 82946GZ chips"
.LC3499:
	.string	"Q965/Q963"
.LC3500:
	.string	"Intel PCI Serial Port"
	.align 4
.LC3501:
	.string	"Intel(R) Express Chipset video"
	.align 4
.LC3502:
	.string	"Intel(R) Express Chipset (Dell Version)"
.LC3503:
	.string	"0x8086"
	.align 4
.LC3504:
	.string	"Intel(R) Management Engine Interface"
.LC3505:
	.string	"?(82P965)"
	.align 4
.LC3506:
	.string	"Intel P965/G965 Processor to I/O Controller"
.LC3507:
	.string	"?(82Q965, 82G965, 82P965)"
	.align 4
.LC3508:
	.string	"Intel P965/G965 PCI Express Root Port"
.LC3509:
	.string	"n/a"
	.align 4
.LC3510:
	.string	"The Intel Management Engine provides thermal management for Intel Desktop Boards."
.LC3511:
	.string	"Q35"
	.align 4
.LC3512:
	.string	"Intel(R) Q35 Express Chipset Family"
.LC3513:
	.string	"Q35-Chipset"
	.align 4
.LC3514:
	.string	"Intel(R) Management Engine Interface (HECI)"
.LC3515:
	.string	"Serial Over LAN"
.LC3516:
	.string	"82G33"
	.align 4
.LC3517:
	.string	"Intel(R) G33 chipset GMA3100 video"
.LC3518:
	.string	"Intel Management Interface"
.LC3519:
	.string	"02091028"
.LC3520:
	.string	"Intel GM965, Intel X3100"
.LC3521:
	.string	"82Q965"
.LC3522:
	.string	"Intel GM"
.LC3523:
	.string	"Q965/Q96"
	.align 4
.LC3524:
	.string	"Intel PCI communication controller"
.LC3525:
	.string	"Q965 Chipset"
	.align 4
.LC3526:
	.string	"Intel(R) Extended Thermal Model MCH"
.LC3527:
	.string	"20EC17AA"
	.align 4
.LC3528:
	.string	"Active Management Technology - SOL"
.LC3529:
	.string	"SRCU32"
.LC3530:
	.string	"I2O 1.5 RAID Controller"
.LC3531:
	.string	"31244"
	.align 4
.LC3532:
	.string	"PCI-X to Serial ATA Controller"
.LC3533:
	.string	"82855PM"
.LC3534:
	.string	"Power Management"
.LC3535:
	.string	"82830[MP]"
	.align 4
.LC3536:
	.string	"Host-Hub I/F Bridge / SDRAM Controller"
.LC3537:
	.string	"82830M/MP"
.LC3538:
	.string	"Host-AGP Bridge"
.LC3539:
	.string	"82830M/MG"
.LC3540:
	.string	"CPU to I/O Bridge"
.LC3541:
	.string	"82835"
	.align 4
.LC3542:
	.string	"SDRAM Controller / Host-hub Interface"
.LC3543:
	.string	"852GM/GMV"
.LC3544:
	.string	"82852GME/PM"
.LC3545:
	.string	"Virtual PCI to AGP Bridge"
.LC3546:
	.string	"System Memory Controller"
.LC3547:
	.string	"852GM"
.LC3548:
	.string	"Configuration Process"
.LC3549:
	.string	"E7520"
.LC3550:
	.string	"Memory Controller Hub"
.LC3551:
	.string	"E7320"
.LC3552:
	.string	"E7525"
.LC3553:
	.string	"MCH Error Reporting Registers"
.LC3554:
	.string	"DMA Controller Registers"
.LC3555:
	.string	"PCI Express Port A"
.LC3556:
	.string	"PCI Express Port B"
.LC3557:
	.string	"PCI Express Port C"
	.align 4
.LC3558:
	.string	"Extended Configuration Registers"
.LC3559:
	.string	"MCH Control Registers"
.LC3560:
	.string	"who knows&erka"
.LC3561:
	.string	"ICH10 Family"
.LC3562:
	.string	"SATA2(4Port1)"
.LC3563:
	.string	"ICH10R"
.LC3564:
	.string	"ICH10R AHCI"
.LC3565:
	.string	"ICH10"
.LC3566:
	.string	"ICH10 AHCI"
.LC3567:
	.string	"SATA2(2Port1)"
.LC3568:
	.string	" SATA2(4Port2)"
.LC3569:
	.string	"SATA2(2Port2)"
.LC3570:
	.string	"50011458"
.LC3571:
	.string	"SMB controller "
.LC3572:
	.string	"Creatix"
.LC3573:
	.string	"V.90 HaM Modem"
.LC3574:
	.string	"MPCI3B"
	.align 4
.LC3575:
	.string	" driverIntel PRO/Wireless 2200BG"
.LC3576:
	.string	"10418086"
	.align 4
.LC3577:
	.string	"Intel 3945ABG Wireless LAN controller"
.LC3578:
	.string	"2915ABG"
	.align 4
.LC3579:
	.string	"Intel (R) PRO/Wireless 2200BG Network Connection, (R) PRO/Wireless 2915ABG Network Connection"
.LC3580:
	.string	"Intel Pro Wireless 2915ABG"
.LC3581:
	.string	"802.11a/b/g WLan adapter"
.LC3582:
	.string	"3945ABG"
.LC3583:
	.string	"Intel(R) PRO/Wireless 3945ABG"
.LC3584:
	.string	"Intel 4965AGN"
	.align 4
.LC3585:
	.string	"Intel Wireless WiFi Link 4965AGN(supporting 802.11a/b/g/Draft-N)"
	.align 4
.LC3586:
	.string	"Intel Wireless WiFi Link 4965AGN"
.LC3587:
	.string	"Intel WiFi Link 5100"
	.align 4
.LC3588:
	.string	"Carte Intel WiFi Link 5100 AGN"
.LC3589:
	.string	"5300AGN"
.LC3590:
	.string	"Intel WiFi Link 5300 AGN"
.LC3591:
	.string	"5100 AGN"
.LC3592:
	.string	"Intel (R) WiFi Link 5100 AGN"
.LC3593:
	.string	"TurboMemory"
.LC3594:
	.string	"Intel TurboMemory"
.LC3595:
	.string	"PRO/DSL 2100"
.LC3596:
	.string	"Modem - PPP"
.LC3597:
	.string	"PRO/DSL 2200"
.LC3598:
	.string	"Modem - PPPoA"
.LC3599:
	.string	"?(EP80579)"
.LC3600:
	.string	"NH82801GR"
.LC3601:
	.string	"Network Controller"
	.align 4
.LC3602:
	.string	"I/O Processor Address Translation Unit"
	.align 4
.LC3603:
	.string	"I/O Companion Unit Address Translation"
.LC3604:
	.string	"EHCI 960 emulator"
.LC3605:
	.string	"82371SB"
	.align 4
.LC3606:
	.string	"PIIX3 PCI-to-ISA Bridge (Triton II)"
	.align 4
.LC3607:
	.string	"PIIX3 IDE Interface (Triton II)"
	.align 4
.LC3608:
	.string	"PIIX3 USB Host Controller (Triton II)"
.LC3609:
	.string	"82437VX"
.LC3610:
	.string	"System Controller"
.LC3611:
	.string	"PB 642365-003"
	.align 4
.LC3612:
	.string	"Intel Business Video Conferencing Card"
	.align 4
.LC3613:
	.string	"System Controller (MTXC), part of 430TX chipset"
.LC3614:
	.string	"82371AB/EB/MB"
.LC3615:
	.string	"PIIX4/4E/4M ISBridgeA "
.LC3616:
	.string	"PIIX4/4E/4M IDE Controller"
.LC3617:
	.string	"PIIX4/4E/4M USB Interface"
	.align 4
.LC3618:
	.string	"PIIX4/4E/4M Power Management Controller"
.LC3619:
	.string	"Graphics Controller"
.LC3620:
	.string	"82810-DC100"
	.align 4
.LC3621:
	.string	"Intel\357\277\275 82810 Graphics Controller"
.LC3622:
	.string	"82810E"
.LC3623:
	.string	"Intel Direct AGP 810 Chipset"
.LC3624:
	.string	"82810-DC133"
	.align 4
.LC3625:
	.string	"Host Bridge and Memory Controller Hub"
.LC3626:
	.string	"Graphics Device (FSB 133 MHz)"
.LC3627:
	.string	"82810-M DC-100"
.LC3628:
	.string	"82810-M DC-133"
.LC3629:
	.string	"rmc"
	.align 4
.LC3630:
	.string	"Host/PCI bridge in 440LX/EX AGP chipset"
.LC3631:
	.string	"82443 ex/lx"
	.align 4
.LC3632:
	.string	"AGP device in 440LX/EX AGP chipset"
.LC3633:
	.string	"440LX/EX"
.LC3634:
	.string	"82443BX/ZX"
.LC3635:
	.string	"440BX/ZX AGPset Host Bridge"
	.align 4
.LC3636:
	.string	"440BX/ZX AGPset PCI-to-PCI bridge"
	.align 4
.LC3637:
	.string	"440BX/ZX chipset Host-to-PCI Bridge"
.LC3638:
	.string	"82443MX"
.LC3639:
	.string	"AC'97 Audio device"
.LC3640:
	.string	"82440 - 443MX"
	.align 4
.LC3641:
	.string	"AC97 Modem Controller (Winmodem)"
.LC3642:
	.string	"USB Universal Host Controller"
.LC3643:
	.string	"Power Management Controller"
.LC3644:
	.string	"82443GX"
.LC3645:
	.string	"Host-to-PCI Bridge"
	.align 4
.LC3646:
	.string	"intel 82801 IB ICH9 - high definition audio"
.LC3647:
	.string	"graphics device"
.LC3648:
	.string	"82372FB/82468GX"
.LC3649:
	.string	"LPC/FWH Interface"
.LC3650:
	.string	"USB Host Controller"
.LC3651:
	.string	"SM Bus Controller"
.LC3652:
	.string	"82372FB"
	.align 4
.LC3653:
	.string	"IEEE1394 OpenHCI Host Controller"
.LC3654:
	.string	"82740"
.LC3655:
	.string	"(0x2994)"
.LC3656:
	.string	"Atom SCH"
.LC3657:
	.string	"Atom SCH PATA"
.LC3658:
	.string	"82454KX/GX"
.LC3659:
	.string	"450KX/GX PCI Bridge (Orion)"
.LC3660:
	.string	"82453KX/GX"
	.align 4
.LC3661:
	.string	"450KX/GX Memory Controller (Orion)"
.LC3662:
	.string	"82451NX"
	.align 4
.LC3663:
	.string	"450NX PCIset Memory & I/O Controller"
.LC3664:
	.string	"82454NX/82467GX"
.LC3665:
	.string	"PCI Expander Bridge"
.LC3666:
	.string	"82461GX"
.LC3667:
	.string	"System Address controller"
.LC3668:
	.string	"82462GX"
.LC3669:
	.string	"System Data Controller"
.LC3670:
	.string	"82465GX"
.LC3671:
	.string	"Graphics Expander Bridge"
.LC3672:
	.string	"82463GX"
.LC3673:
	.string	"Memory Address Controller"
.LC3674:
	.string	"82464GX"
.LC3675:
	.string	"Memory Data Controller"
	.align 4
.LC3676:
	.string	"Wide and fast PCI eXpander Bridge"
.LC3677:
	.string	"82460GX"
.LC3678:
	.string	"AGP Bridge (GXB function 1)"
.LC3679:
	.string	"LPC Bridge"
.LC3680:
	.string	"Serial ATA Controller"
.LC3681:
	.string	"I2O RAID PCI to PCI Bridge"
.LC3682:
	.string	"SRCU21"
.LC3683:
	.string	"SRCUxx"
.LC3684:
	.string	"SRCU31"
.LC3685:
	.string	"SRCU31L"
.LC3686:
	.string	"AC97"
.LC3687:
	.string	"AUDIO CONTROLLER"
.LC3688:
	.string	"i845"
.LC3689:
	.string	"intel brokdale"
.LC3690:
	.string	"S21152BB"
.LC3691:
	.string	"S21154AE/BE"
.LC3692:
	.string	"21555"
	.align 4
.LC3693:
	.string	"Non-Transparent PCI-to-PCI Bridge"
.LC3694:
	.string	"aic-7880p"
.LC3695:
	.string	"AHA-2940UW/CN"
.LC3696:
	.string	"AIC-7810C"
.LC3697:
	.string	"RAID Coprocessor"
.LC3698:
	.string	"0x0035"
.LC3699:
	.string	"AIC-1160"
.LC3700:
	.string	"Fibre Channel Adapter"
.LC3701:
	.string	"AIC-7821"
.LC3702:
	.string	"AIC-2930U Ultra SCSI Ctrlr"
.LC3703:
	.string	"AHA-4944W/4944UW"
	.align 4
.LC3704:
	.string	"QuadChannel Fast-Wide/Ultra-Wide Diff. SCSI Ctrlr"
.LC3705:
	.string	"AIC-755x"
.LC3706:
	.string	"SCSI Ctrlr"
.LC3707:
	.string	"AIC-7850P"
.LC3708:
	.string	"Fast/Wide SCSI Controller"
.LC3709:
	.string	"AIC-7850"
.LC3710:
	.string	"FAST-SCSI Ctrlr"
.LC3711:
	.string	"Fast SCSI Ctrlr"
.LC3712:
	.string	"AVA-2930"
.LC3713:
	.string	"AIC-7855"
.LC3714:
	.string	"AIC-7856"
.LC3715:
	.string	"AIC-5800"
.LC3716:
	.string	"PCI-to-1394 Ctrlr"
.LC3717:
	.string	"ANA-5910/30/40"
.LC3718:
	.string	"ATM155 & 25 LAN Controller"
.LC3719:
	.string	"ANA-5910A/30A/40A"
.LC3720:
	.string	"ATM Adpater"
.LC3721:
	.string	"AHA-2930C"
.LC3722:
	.string	"Ultra SCSI Adpater (VAR)"
.LC3723:
	.string	"AIC-7560?"
.LC3724:
	.string	"CardBus Ultra SCSI Controller"
.LC3725:
	.string	"AIC-7860"
.LC3726:
	.string	"PCI SCSI Controller"
.LC3727:
	.string	"AIC-7861"
.LC3728:
	.string	"AIC-786x"
.LC3729:
	.string	"ANA620xx/69011A"
.LC3730:
	.string	"Fast Ethernet"
.LC3731:
	.string	"AIC-7870"
.LC3732:
	.string	"Fast and Wide SCSI Ctrlr"
.LC3733:
	.string	"AHA-2940/2940W"
.LC3734:
	.string	"Fast/Fast-Wide SCSI Ctrlr"
.LC3735:
	.string	"AHA-3940/3940W"
	.align 4
.LC3736:
	.string	"Multichannel Fast/Fast-Wide SCSI Ctrlr"
.LC3737:
	.string	"AHA-3985"
.LC3738:
	.string	"4-chan RAID SCSI Ctrlr"
.LC3739:
	.string	"AHA-2944"
.LC3740:
	.string	"AHA-3944/3944W"
	.align 4
.LC3741:
	.string	"Multichannel Fast/Fast-Wide Diff. SCSI Ctrlr"
.LC3742:
	.string	"AIC-787x"
.LC3743:
	.string	"aic 7810"
.LC3744:
	.string	"Memory control IC"
.LC3745:
	.string	"AIC-7515"
.LC3746:
	.string	"RAID + Memory Controller IC"
.LC3747:
	.string	"aic-7850"
.LC3748:
	.string	"Fast/Wide SCSI-2 Controller"
.LC3749:
	.string	"AHA-2930"
	.align 4
.LC3750:
	.string	"Single channel SCSI Host Adapter"
.LC3751:
	.string	"aha 2940"
.LC3752:
	.string	"SCSI"
.LC3753:
	.string	"aha 3940"
.LC3754:
	.string	"Multiple SCSI channels"
.LC3755:
	.string	"aha 3985"
.LC3756:
	.string	"aha 2944"
.LC3757:
	.string	"Differential SCSI"
.LC3758:
	.string	"aic7880p"
.LC3759:
	.string	"Fast 20 SCSI"
.LC3760:
	.string	"AIC-7890"
.LC3761:
	.string	"SCSI controller"
.LC3762:
	.string	"AIC-789x"
.LC3763:
	.string	"AIC-7895"
	.align 4
.LC3764:
	.string	"Ultra-Wide SCSI Ctrlr on AHA-2940 AHA-394x"
.LC3765:
	.string	"AIC-7880"
.LC3766:
	.string	"Ultra Wide SCSI"
.LC3767:
	.string	"AHA-2940U/2940UW"
.LC3768:
	.string	"Ultra/Ultra-Wide SCSI Ctrlr"
.LC3769:
	.string	"AHA-3940Uxx"
	.align 4
.LC3770:
	.string	"AHA-3940U/3940UW/3940UWD SCSI Ctrlr"
.LC3771:
	.string	"AIC-7883U"
.LC3772:
	.string	"ADAPTEC 2940UW CN SCSI"
.LC3773:
	.string	"Ultra-Wide Diff. SCSI Ctrlr"
.LC3774:
	.string	"AHA-3944U/3944UWD"
	.align 4
.LC3775:
	.string	"Fast-Wide/Ultra-Wide Diff. SCSI Ctrlr"
.LC3776:
	.string	"AHA-4944UW"
	.align 4
.LC3777:
	.string	"QuadChannel Ultra-Wide Diff. SCSI Ctrlr"
.LC3778:
	.string	"AIC-788x"
.LC3779:
	.string	"Ultra-Wide SCSI Ctrlr"
.LC3780:
	.string	"AIC-7888?"
.LC3781:
	.string	"Ultra Wide SCSI Controller"
.LC3782:
	.string	"ABA-1030"
.LC3783:
	.string	"AIC-7880P"
.LC3784:
	.string	"PMC-211"
.LC3785:
	.string	"PCI Mezzanine Card"
.LC3786:
	.string	"PC Weasel PCI VGA Device"
	.align 4
.LC3787:
	.string	"PC Weasel PCI Serial Comm. Device"
.LC3788:
	.string	"PC Weasel PCI"
.LC3789:
	.string	"Ambient MD3200 A"
	.align 4
.LC3790:
	.string	"Intel 537 Data Fax Voice v.92 Modem"
.LC3791:
	.string	"Sedlbauer Speed PCI"
.LC3792:
	.string	"Tiger 600"
.LC3793:
	.string	"PCI-to-PCI Bridge"
.LC3794:
	.string	"ARK1000PV"
.LC3795:
	.string	"Stingray GUI Accelerator"
.LC3796:
	.string	"ARK2000PV"
.LC3797:
	.string	"ARK2000MT"
.LC3798:
	.string	"Stingray 64"
.LC3799:
	.string	"ARK2000MI"
.LC3800:
	.string	"Quadro645 GUI Accelerator"
.LC3801:
	.string	"ARK2000MI+"
.LC3802:
	.string	"0x1"
.LC3803:
	.string	"PCI Interface bus"
.LC3804:
	.string	"me594v02100 combox"
.LC3805:
	.string	"combox cb 300a"
.LC3806:
	.string	"TOPIC FM-56PCI-TP"
.LC3807:
	.string	"1.0.1.8"
	.align 4
.LC3808:
	.string	"56k Internal Data Fax Voice Modem"
.LC3809:
	.string	"DELETE"
.LC3810:
	.string	"SPM6020"
.LC3811:
	.string	"PCI-104 dspModule"
.LC3812:
	.string	"SPM6030"
.LC3813:
	.string	"PC/104-Plus dspModule"
.LC3814:
	.string	"SPM186420"
.LC3815:
	.string	"SPM176430"
.LC3816:
	.string	"DM7520"
.LC3817:
	.string	"PC/104-Plus dataModule"
.LC3818:
	.string	"SDM7540"
	.align 4
.LC3819:
	.string	"PC/104-Plus dataModule with SmartCal"
.LC3820:
	.string	"MU9C8K64"
.LC3821:
	.string	"Content Addressable Memory"
.LC3822:
	.string	"1.4.5.0"
	.align 4
.LC3823:
	.string	"PCI Memory Card Reader Controller"
.LC3824:
	.string	"CB-712/714/810"
.LC3825:
	.string	"Memory Stick Card Reader"
.LC3826:
	.string	"Secure Digital Card Reader"
	.align 4
.LC3827:
	.string	"PCI Smart Card Reader Controller"
.LC3828:
	.string	"CB-1211"
.LC3829:
	.string	"CB-1225"
.LC3830:
	.string	"CB-1420"
.LC3831:
	.string	"CB-710/2/4/810"
.LC3832:
	.string	"Cardbus Controller"
.LC3833:
	.string	"CB-712/4"
.LC3834:
	.string	"CB-720/2/4"
.LC3835:
	.string	"CB-722/4"
	.align 4
.LC3836:
	.string	"Tekram DC200 PATA100 RAID Controller"
.LC3837:
	.string	"ICE1712 Envy24"
	.align 4
.LC3838:
	.string	"IC Ensemble Inc ICE1712 Envy24 Multichannel Audio Controller"
.LC3839:
	.string	"SAA7134HL"
	.align 4
.LC3840:
	.string	"Philips Semiconductors SAA7134HL Multimedia Capture Device"
.LC3841:
	.string	"CS4614/22/24"
	.align 4
.LC3842:
	.string	"CrystalClear SoundFusion PCI Audio Accel"
.LC3843:
	.string	"xx12345"
.LC3844:
	.string	"Not a chip ..."
.LC3845:
	.string	"saa7134"
	.align 4
.LC3846:
	.string	"PAL/SECAM TV card w/ FM1216ME MK3 tuner (+FM radio)"
.LC3847:
	.string	"PLX PCI9054"
.LC3848:
	.string	"EPONINE ESR-PCI Board"
.LC3849:
	.string	"Motorola MPC8245"
.LC3850:
	.string	"EPONINE MTM120 PCI Board"
.LC3851:
	.string	"NSP2000-SSL"
.LC3852:
	.string	"Crypto Aceletator"
.LC3853:
	.string	"ROL/F-100"
	.align 4
.LC3854:
	.string	"Fast Ethernet Adapter with ROL"
.LC3855:
	.string	"PBridge+"
.LC3856:
	.string	"PCI Interface Chip"
.LC3857:
	.string	"30201543"
	.align 4
.LC3858:
	.string	"Modem Intel 537EP (Chipset KAIOMY)"
	.align 4
.LC3859:
	.string	"Modem Device on High Definition Audio Bus"
.LC3860:
	.string	"PLX PCI 9050"
.LC3861:
	.string	"Easylon PCI Bus Interface"
.LC3862:
	.string	"PCI-ISA-001"
.LC3863:
	.string	"PCI/ISA Bus Bridge"
.LC3864:
	.string	"MFC3"
.LC3865:
	.string	"Multi Function Card Version 3"
.LC3866:
	.string	"LA-41x3"
	.align 4
.LC3867:
	.string	"Spectrum24 Wireless LAN PCI Card"
.LC3868:
	.string	"LA-5030"
	.align 4
.LC3869:
	.string	"Symbol Wireless Networker 802.11a/g CardBus"
.LC3870:
	.string	"LA-5033"
	.align 4
.LC3871:
	.string	"Symbol Wireless Networker 802.11a/g PCI"
.LC3872:
	.string	"NA"
	.align 4
.LC3873:
	.string	"Wideband Advanced Signal Processor"
.LC3874:
	.string	"High Data Rate Radio"
.LC3875:
	.string	"Rocket Drive"
.LC3876:
	.string	"Solid State Disk"
.LC3877:
	.string	"CCSI PCI20"
.LC3878:
	.string	"ARCNET backplane"
.LC3879:
	.string	"CCSI PCI20-485D"
.LC3880:
	.string	"ARCnet"
.LC3881:
	.string	"CCSI PCI20-485X"
.LC3882:
	.string	"CCSI PCI20-CXB"
.LC3883:
	.string	"CCSI PCI20-CXS"
.LC3884:
	.string	"CCSI PCI20-FOG-SMA"
.LC3885:
	.string	"CCSI PCI20-FOG-ST"
.LC3886:
	.string	"CCSI PCI20-TB5"
.LC3887:
	.string	"CCSI PCI20-5-485"
.LC3888:
	.string	"5 Mbit ARCnet"
.LC3889:
	.string	"CCSI PCI20-5-485D"
.LC3890:
	.string	"CCSI PCI20-5-485X"
.LC3891:
	.string	"CCSI PIC20-5-FOG-ST"
.LC3892:
	.string	"CCSI PCI20-5-FOG-SMA"
.LC3893:
	.string	"COM200C22"
.LC3894:
	.string	"ARCNET"
.LC3895:
	.string	"CCSI PCI22-485"
.LC3896:
	.string	"10 Mbit ARCnet"
.LC3897:
	.string	"CCSI PCI22-485D"
.LC3898:
	.string	"CCSI PCI22-485X"
.LC3899:
	.string	"CCSI PCI22-CHB"
.LC3900:
	.string	"CCSI PCI22-FOG-ST"
.LC3901:
	.string	"CCSI PCI22-THB"
.LC3902:
	.string	"AC1000"
.LC3903:
	.string	"AC1002"
.LC3904:
	.string	"PAX.port 1100"
	.align 4
.LC3905:
	.string	"PAX.ware 1100 dual Gb classifier engine"
.LC3906:
	.string	"AMD '971"
	.align 4
.LC3907:
	.string	"SNP 8023 packet classifier - AMD component"
.LC3908:
	.string	"SNP8023"
	.align 4
.LC3909:
	.string	"PAX.ware 100 packet classifier"
.LC3910:
	.string	"HLF-VMPEU560-C"
.LC3911:
	.string	"Standar HSP Modem Series"
.LC3912:
	.string	"TA700"
.LC3913:
	.string	"PCI Bus Analyzer/Exerciser"
.LC3914:
	.string	"200"
.LC3915:
	.string	"HIS Excalibur Radeon 9600"
.LC3916:
	.string	"FM-1789"
.LC3917:
	.string	"Pctel"
.LC3918:
	.string	"2BD0"
.LC3919:
	.string	"soft56k voice,data,fax CARP"
.LC3920:
	.string	"MT21108"
.LC3921:
	.string	"InfiniBridge"
.LC3922:
	.string	"MT25208A0-FCC"
.LC3923:
	.string	"InfiniHost TM III Ex"
.LC3924:
	.string	"xPCI-3504"
.LC3925:
	.string	"Analog output board"
.LC3926:
	.string	"n2530a"
.LC3927:
	.string	"DX2+ FC-AL Adapter"
.LC3928:
	.string	"QX4"
	.align 4
.LC3929:
	.string	"4 Port Fibre Channel Controller"
.LC3930:
	.string	"HP Communications Port"
	.align 4
.LC3931:
	.string	"HP Toptools Remote Control Adapter"
.LC3932:
	.string	"E2929A"
.LC3933:
	.string	"PCI/PCI-X Bus Analyzer"
.LC3934:
	.string	"LXT1001"
.LC3935:
	.string	"TC11IB"
	.align 4
.LC3936:
	.string	"TriCore 32-bit Single-chip Microctrlr"
.LC3937:
	.string	"PEB 20544 E v1.1"
	.align 4
.LC3938:
	.string	"6 Port Optimized Comm Ctrlr (SPOCC)"
.LC3939:
	.string	"PEB 3454 E v1.1"
	.align 4
.LC3940:
	.string	"TE3-SPICCE 6 Port Integrated Comm Ctrlr"
.LC3941:
	.string	"hcf cx11252-41z"
.LC3942:
	.string	"hcf 56"
.LC3943:
	.string	"vgn-ar71mr"
.LC3944:
	.string	"idt high audio"
.LC3945:
	.string	"*"
.LC3946:
	.string	"Internet PhoneJack PCI Card"
.LC3947:
	.string	"DAG 3.10"
.LC3948:
	.string	"OC-3/OC-12"
.LC3949:
	.string	"DAG 3.2x"
.LC3950:
	.string	"DAG 3.2E"
.LC3951:
	.string	"DAG 3.4E"
.LC3952:
	.string	"DAG 3.41E"
.LC3953:
	.string	"DAG 3.5"
.LC3954:
	.string	"DAG 3.5ECM"
.LC3955:
	.string	"DAG 4.10"
.LC3956:
	.string	"OC-48"
.LC3957:
	.string	"DAG 4.11"
.LC3958:
	.string	"DAG 4.2"
.LC3959:
	.string	"DAG 4.2E"
.LC3960:
	.string	"Dual Gigabit Ethernet"
.LC3961:
	.string	"DAG 4.3E"
.LC3962:
	.string	"1646t00"
.LC3963:
	.string	"v.90 Lucent Modem"
.LC3964:
	.string	"NCP130"
.LC3965:
	.string	"Wireless NIC"
.LC3966:
	.string	"Prism II"
.LC3967:
	.string	"InstantWave HR PCI card"
.LC3968:
	.string	"NetStaQ ADMA-100"
.LC3969:
	.string	"ATA controller"
.LC3970:
	.string	"CX11252-15"
.LC3971:
	.string	"Conexant HSFi"
.LC3972:
	.string	"Spot RT"
.LC3973:
	.string	"Spot RT Interface Board"
.LC3974:
	.string	"Spot RT #2"
.LC3975:
	.string	"Spot Insight"
.LC3976:
	.string	"Spot Insight Interface Board"
.LC3977:
	.string	"FarSync T2P"
	.align 4
.LC3978:
	.string	"Two Port Intelligent Sync Comms Card"
.LC3979:
	.string	"FarSync T4P"
	.align 4
.LC3980:
	.string	"Four Port Intelligent Sync Comms Card"
.LC3981:
	.string	"FarSync T1U"
	.align 4
.LC3982:
	.string	"One Port Intelligent Sync Comms Card"
.LC3983:
	.string	"FarSync T2U"
.LC3984:
	.string	"FarSync T4U"
.LC3985:
	.string	"FarSync TE1"
.LC3986:
	.string	"FarSync TE1C"
	.align 4
.LC3987:
	.string	"Channelized Intelligent Sync Comms Card"
.LC3988:
	.string	"FarSync DSL-S1"
	.align 4
.LC3989:
	.string	"G.SHDSL Intelligent Sync Comms Card"
.LC3990:
	.string	"FarSync T4E"
.LC3991:
	.string	"FarSync T2Ue (PCI Express)"
.LC3992:
	.string	"FarSync T4Ue (PCI Express)"
.LC3993:
	.string	"LynxTWO-A"
	.align 4
.LC3994:
	.string	"4 in/4 out Professional Digital Audio Card"
.LC3995:
	.string	"LynxTWO-B"
	.align 4
.LC3996:
	.string	"2 in/6 out Professional Digital Audio Card"
.LC3997:
	.string	"LynxTWO-C"
	.align 4
.LC3998:
	.string	"6 in/2 out Professional Digital Audio Card"
.LC3999:
	.string	"Lynx L22"
	.align 4
.LC4000:
	.string	"2 in/2 out Professional Digital Audio Card"
.LC4001:
	.string	"Lynx AES16"
	.align 4
.LC4002:
	.string	"16 in/16 out AES/EBU Audio Card"
.LC4003:
	.string	"Lynx AES16-SRC"
	.align 4
.LC4004:
	.string	"16 in/16 out AES/EBU Audio Card w/SRC"
.LC4005:
	.string	"Format Synchronizer v3.0"
.LC4006:
	.string	"Fast Universal Data Output"
.LC4007:
	.string	"Repeographics controller"
.LC4008:
	.string	"Reprographics Controller"
.LC4009:
	.string	"TS-PRL1"
.LC4010:
	.string	"General Purpose Relay Card"
.LC4011:
	.string	"TS-PMA"
.LC4012:
	.string	"Matrix Card"
.LC4013:
	.string	"WL11000P"
.LC4014:
	.string	" WL11000P"
.LC4015:
	.string	"R6793-11"
.LC4016:
	.string	"RS56/HSP-PCI"
.LC4017:
	.string	"SL2800 PCI"
	.align 4
.LC4018:
	.string	"SMART LINK  56K VOICE V.92 MODEM"
.LC4019:
	.string	"Rage XL"
.LC4020:
	.string	"ATI Rage XL (rev 27)"
.LC4021:
	.string	"AIC-7902W"
	.align 4
.LC4022:
	.string	"Adaptec AIC-7902 Dual Channel U320 SCSI"
.LC4023:
	.string	"CSB6"
	.align 4
.LC4024:
	.string	"Serverworks Southbridge with RAID/IDE (rev a0), OHCI USB (rev 05), GCLE-2 Host Bridge"
.LC4025:
	.string	"BCM5703"
	.align 4
.LC4026:
	.string	"Broadcom Corp. NetXtreme Gigabyte Ethernet"
.LC4027:
	.string	"0x00541000"
	.align 4
.LC4028:
	.string	"SAS 3000 series, 8-port with 1068 -StorPort"
.LC4029:
	.string	"PLX 9054"
.LC4030:
	.string	"PCI interface chip"
.LC4031:
	.string	"PCI interaface chip"
.LC4032:
	.string	"MD5628D-L-A"
.LC4033:
	.string	"intel V.92 HaM Modem"
.LC4034:
	.string	"Ambient MD8820"
.LC4035:
	.string	"Intel HaM V.92 Modem"
.LC4036:
	.string	"X1"
.LC4037:
	.string	"Xframe 10GbE PCI-X Adapter"
.LC4038:
	.string	"X2"
	.align 4
.LC4039:
	.string	"Xframe II 10GbE PCI-X 2.0 Adapter"
.LC4040:
	.string	"X3"
	.align 4
.LC4041:
	.string	"E3100 PCI-Express 10Gb Ethernet Interface"
.LC4042:
	.string	"Pattern Matching Chip"
.LC4043:
	.string	"8085"
.LC4044:
	.string	"Volari Family"
.LC4045:
	.string	"Leonardo CL"
.LC4046:
	.string	"Video processor"
.LC4047:
	.string	"Leonardo CL-P"
.LC4048:
	.string	"Leonardo CL-DB"
.LC4049:
	.string	"Leonardo CL-P-DB"
.LC4050:
	.string	"Leonardo CL-DVR"
.LC4051:
	.string	"Leonardo CL-DVR-DB"
.LC4052:
	.string	"Picasso 2SQ"
.LC4053:
	.string	"Framegrabber"
.LC4054:
	.string	"Picasso 3C/3Cpro"
.LC4055:
	.string	"Picasso LS"
.LC4056:
	.string	"Picasso CL"
.LC4057:
	.string	"Picasso FI"
.LC4058:
	.string	"Picasso SDI"
.LC4059:
	.string	"Picasso DUO"
.LC4060:
	.string	"Colory"
.LC4061:
	.string	"Valentino"
.LC4062:
	.string	"Video Output Board"
.LC4063:
	.string	"SW5000-NCA"
	.align 4
.LC4064:
	.string	"Seaway Network Content Accelerator"
.LC4065:
	.string	"PCI32"
.LC4066:
	.string	"DCF77 Radio Clock"
.LC4067:
	.string	"PCI509"
.LC4068:
	.string	"PCI510"
.LC4069:
	.string	"PCI511"
.LC4070:
	.string	"PEX511"
.LC4071:
	.string	"DCF77 Receiver"
.LC4072:
	.string	"GPS167PCI"
.LC4073:
	.string	"GPS Receiver"
.LC4074:
	.string	"GPS168PCI"
.LC4075:
	.string	"GPS169PCI"
.LC4076:
	.string	"GPS170PCI"
.LC4077:
	.string	"GPS170PEX"
.LC4078:
	.string	"TCR510PCI"
.LC4079:
	.string	"IRIG Timecode Reader"
.LC4080:
	.string	"TCR167PCI"
.LC4081:
	.string	"TCR511PCI"
.LC4082:
	.string	"TCR511PEX"
.LC4083:
	.string	"IRIG Timecode Receiver"
.LC4084:
	.string	"VSC7174"
	.align 4
.LC4085:
	.string	"VSC7174 PCI/PCI-X SATA Controller"
.LC4086:
	.string	"VP500"
.LC4087:
	.string	"VolumePro 500"
.LC4088:
	.string	"VP1000"
.LC4089:
	.string	"VolumePro 1000"
.LC4090:
	.string	"Net 2280"
.LC4091:
	.string	"USB 2.0 Device Controller"
.LC4092:
	.string	"FNW-3603-TX"
	.align 4
.LC4093:
	.string	"10/100 Fast Ethernet CardBus (RTL8139)"
.LC4094:
	.string	"5610"
.LC4095:
	.string	"5610 56K FaxModem WinModem"
.LC4096:
	.string	"AD1807JS"
	.align 4
.LC4097:
	.string	"US Robotics 56K DATA FAX WINMODEM"
.LC4098:
	.string	"USR5610B"
	.align 4
.LC4099:
	.string	"USR5610B (0005610-02) 56K Performance Pro Modem (PCI Internal)"
.LC4100:
	.string	"3CP2977"
	.align 4
.LC4101:
	.string	"US Robotics 56K Fax PCI aka Model 0726, V.90 56K Internal Faxmodem"
.LC4102:
	.string	"2460  802.11b"
	.align 4
.LC4103:
	.string	"RT2460  802.11b Baseband/MAC integrated chip"
.LC4104:
	.string	"0x03011814"
	.align 4
.LC4105:
	.string	"Ralink Chipset 802.11b/g WLAN Card"
.LC4106:
	.string	"<unknown>"
.LC4107:
	.string	"W-LAN 802.11b/g"
.LC4108:
	.string	"RT2560F"
.LC4109:
	.string	"RaLink"
.LC4110:
	.string	"b8341462"
	.align 4
.LC4111:
	.string	"Edimax 54 MBit WLan 802.11g rt 2500"
	.align 4
.LC4112:
	.string	"RT2525 2.4GHz transceiver + RT2560 MAC/BBP"
.LC4113:
	.string	"wireless a/b"
.LC4114:
	.string	"RT2860/RT2890"
.LC4115:
	.string	"Wireless"
.LC4116:
	.string	"HPT 343/345/363"
.LC4117:
	.string	"HPT366/368/370/370A"
.LC4118:
	.string	"ATA Raid Controller"
.LC4119:
	.string	"HPT372/372N"
.LC4120:
	.string	"PATA133 Raid Controller"
.LC4121:
	.string	"HPT302"
.LC4122:
	.string	"HPT371"
.LC4123:
	.string	"ATA133 Controller"
.LC4124:
	.string	"HPT-374"
.LC4125:
	.string	"RR172x"
.LC4126:
	.string	"RR172x SATA Controller"
.LC4127:
	.string	"RR174x"
.LC4128:
	.string	"RR174x SATA Controller"
.LC4129:
	.string	"RR2210"
.LC4130:
	.string	"RR2210 SATA Controller"
.LC4131:
	.string	"RR2300"
.LC4132:
	.string	"RR2300 SATA Controller"
.LC4133:
	.string	"RR231x"
.LC4134:
	.string	"RR231x SATA Controller"
.LC4135:
	.string	"RR2340"
.LC4136:
	.string	"RR2340 SATA Controller"
.LC4137:
	.string	"RR252x"
.LC4138:
	.string	"RR252x SATA Controller"
.LC4139:
	.string	"RR312x"
.LC4140:
	.string	"RR312x SATA Controller"
.LC4141:
	.string	"RR322x"
.LC4142:
	.string	"RR322x SATA Controller"
.LC4143:
	.string	"RR332x"
.LC4144:
	.string	"RR332x SATA Controller"
.LC4145:
	.string	"RR341x"
.LC4146:
	.string	"RR341x SATA Controller"
.LC4147:
	.string	"RR35xx"
.LC4148:
	.string	"RR35xx SATA Controller"
.LC4149:
	.string	"RR432x"
.LC4150:
	.string	"RR432x SATA Controller"
.LC4151:
	.string	"RR18xx"
.LC4152:
	.string	"RR18xx SATA Controller"
.LC4153:
	.string	"RR222x/224x"
.LC4154:
	.string	"RR222x/224x SATA Controller"
.LC4155:
	.string	"HWGPCI-54"
.LC4156:
	.string	"Hercules WiFi PCI 802.11G"
.LC4157:
	.string	"ESCC-PCI-335"
	.align 4
.LC4158:
	.string	"Fastcom:ESCC-PCI-335 Syncronous RS422/485 serial communication adapter"
.LC4159:
	.string	"422/4-PCI-335"
	.align 4
.LC4160:
	.string	"Fastcom:422/4-PCI-335 Asyncronous RS422/485 serial adapter"
.LC4161:
	.string	"422/2-PCI-335"
	.align 4
.LC4162:
	.string	"Fastcom:422/2-PCI-335 Asyncronous RS422/485 serial adapter"
.LC4163:
	.string	"232/4-PCI-335"
	.align 4
.LC4164:
	.string	"Fastcom:232/4-PCI-335 Asyncronous RS232 serial adapter"
.LC4165:
	.string	"EG1032 v3"
	.align 4
.LC4166:
	.string	"Linksys Instant Gigabit Desktop Network Interface"
.LC4167:
	.string	"ACA2400"
.LC4168:
	.string	"Crypto Accelerator"
.LC4169:
	.string	"PEB 20321"
	.align 4
.LC4170:
	.string	"Multichannel Network Interface Controller for HDLC"
.LC4171:
	.string	"PEB 20534"
	.align 4
.LC4172:
	.string	"DMA supported serial communication controller with 4 channels"
.LC4173:
	.string	"01"
	.align 4
.LC4174:
	.string	"PROFIBUS Communication Processor CP5611 A2"
.LC4175:
	.string	"ERTEC400"
.LC4176:
	.string	"EB400 ProfiNet Device-Kit"
.LC4177:
	.string	"BT958 SCSI Host Adaptor"
.LC4178:
	.string	"Flashpoint LT"
.LC4179:
	.string	"RL5c475"
.LC4180:
	.string	"Ricoh R/RL/5C476(II)"
.LC4181:
	.string	"RB5c478"
.LC4182:
	.string	"R5C552"
	.align 4
.LC4183:
	.string	"FireWire (IEEE 1394) Controller"
.LC4184:
	.string	"13871043"
	.align 4
.LC4185:
	.string	"Ricoh Memory Stick Host Controller"
.LC4186:
	.string	"R5C832, R5C843"
	.align 4
.LC4187:
	.string	"SDA Standard Compliant SD Host Controller"
	.align 4
.LC4188:
	.string	"IEEE 1394 (4 pin firewire) chip)"
.LC4189:
	.string	"R5C853"
.LC4190:
	.string	"Ricoh SD/MMC Host Controller"
.LC4191:
	.string	"01cf1028"
	.align 4
.LC4192:
	.string	"Ricoh xD-Picture Card Host Controller"
.LC4193:
	.string	"IEEE 1394 Controller"
.LC4194:
	.string	"DI15630-5, DI5631, DI5633"
.LC4195:
	.string	"SmartHCF"
.LC4196:
	.string	"1456"
.LC4197:
	.string	"HCFp Modem"
.LC4198:
	.string	"AccessRunner ADSL Modem"
.LC4199:
	.string	"cx11252-15"
	.align 4
.LC4200:
	.string	"HSFp or Soft V92 Data Fax Modem"
.LC4201:
	.string	"HDA D100 MDC v.92 Modem"
.LC4202:
	.string	"1002"
	.align 4
.LC4203:
	.string	"HDAUDIO Soft Data fax Modem with SmartPC"
.LC4204:
	.string	"00101767"
.LC4205:
	.string	"HSF 56k HSFi Modem"
.LC4206:
	.string	"CX11252-11"
.LC4207:
	.string	"HSFi PCI Internal Modem"
	.align 4
.LC4208:
	.string	"Zyxel OMNI 56K PCI Plus Rev.3 "
.LC4209:
	.string	"hp/compaq alhena 5-gl6"
.LC4210:
	.string	"71030277"
.LC4211:
	.string	"Conexant Modem RD02-D490"
.LC4212:
	.string	"cx9510-11z"
	.align 4
.LC4213:
	.string	"Conexant PCI-E Soft Data/Fax Modem with SmartCP"
.LC4214:
	.string	"4.0.3.1"
	.align 4
.LC4215:
	.string	"HDAUDIO Soft Data fax Modem with SmartPC / Conexant High Definition SmartAudio HD2"
.LC4216:
	.string	"4.0.1.6"
.LC4217:
	.string	"Realtek High Definition audio"
.LC4218:
	.string	"nForce 630M"
	.align 4
.LC4219:
	.string	"Conexant HD-Audio SmartAudio 221"
.LC4220:
	.string	"Belived to be a CX23418"
	.align 4
.LC4221:
	.string	"Single-Chip MPEG-2 Encoder with Integrated Analog Video/Broadcast Audio Decoder"
.LC4222:
	.string	"2003"
	.align 4
.LC4223:
	.string	"Conexant 23881 Video Capture (NTSC)"
.LC4224:
	.string	"0x7717"
.LC4225:
	.string	"CX23881-21"
	.align 4
.LC4226:
	.string	"AGEIA PhysX 100 Series PCI Express Card"
.LC4227:
	.string	"PCIVEN_1971&DEV_1011&CC_FF00"
	.align 4
.LC4228:
	.string	"AGEIA PhysX 100 Series PCI Card"
	.align 4
.LC4229:
	.string	"AGEIA PhysX 200 Series PCI Express Card"
.LC4230:
	.string	"AR5005"
.LC4231:
	.string	"802.11a Wireless Adapter"
.LC4232:
	.string	"AR5bmb5"
.LC4233:
	.string	"AR5211"
	.align 4
.LC4234:
	.string	"802.11a/b/g Mini-PCI Wireless Adapter"
.LC4235:
	.string	"AR5212"
.LC4236:
	.string	"802.11a/b/g Wireless Adapter"
.LC4237:
	.string	"Atheros AR5005G"
	.align 4
.LC4238:
	.string	"Atheros AR5005G 802.11abg NIC Chipset / TP-Link (TL-WN551G)"
.LC4239:
	.string	"AR5006X"
.LC4240:
	.string	"802.11abg NIC"
	.align 4
.LC4241:
	.string	"VEN_10DE&DEV_0649&SUBSYS_059717FF&REV_A14&2DEFBOA"
	.align 4
.LC4242:
	.string	"HDAUDIOFUNC_01&VEN_10DE&DEV_0003&SUBSYS_10DE0101&REV_10004&6641A29&0&0201"
.LC4243:
	.string	"AR5416"
	.align 4
.LC4244:
	.string	"802.11a/b/g/n Wireless PCI Adapter"
.LC4245:
	.string	"AR5008"
	.align 4
.LC4246:
	.string	"Atheros 802.11a/b/g/n (pre-N) radio"
.LC4247:
	.string	"0001"
	.align 4
.LC4248:
	.string	"Atheros AR5B91 Wireless Network Adapter"
	.align 4
.LC4249:
	.string	"Atheros AR5212 802.11abg wireless"
	.align 4
.LC4250:
	.string	"LAN-Express AS IEEE 802.11g miniPCI adapter"
.LC4251:
	.string	"0239"
.LC4252:
	.string	"cM67 CompactPCI DSP Card"
.LC4253:
	.string	"M44/cM44 DSP board"
.LC4254:
	.string	"Quattro6x DSP board"
	.align 4
.LC4255:
	.string	"Chico/ChicoPlus Data Acquisition Board"
	.align 4
.LC4256:
	.string	"Code Hammer Jtag Debugger board"
.LC4257:
	.string	"Matador DSP board"
.LC4258:
	.string	"Quixote DSP board"
.LC4259:
	.string	"Quadia C64x DSP"
.LC4260:
	.string	"Quadia DSP Baseboard"
.LC4261:
	.string	"ADM-XRC"
.LC4262:
	.string	"Virtex-E Bridge"
.LC4263:
	.string	"ADM-XRC-II Lite"
.LC4264:
	.string	"Virtex-II Bridge"
.LC4265:
	.string	"ADM-XRC-II"
.LC4266:
	.string	"ADM-XPL"
.LC4267:
	.string	"Virtex-II Pro Bridge"
.LC4268:
	.string	"ADM-XP"
	.align 4
.LC4269:
	.string	"Virtex-II Pro PCI/PCI-X Bridge"
.LC4270:
	.string	"ADP-WRC-II"
.LC4271:
	.string	"ADP-DRC-II"
.LC4272:
	.string	"ADP-XPI"
.LC4273:
	.string	"Virtex-II Pro PCI"
.LC4274:
	.string	"ADP-XPI (PCI-X)"
.LC4275:
	.string	"Virtex-II Pro PCI-X Bridge"
.LC4276:
	.string	"ADM-XRC-4FX"
.LC4277:
	.string	"ADM-XRC-5LX"
.LC4278:
	.string	"Virtex-4LX Bridge"
.LC4279:
	.string	"ADM-XRC-5T1"
.LC4280:
	.string	"MM-5410D"
.LC4281:
	.string	"PCI 32bit Bulk Memory w/DMA"
.LC4282:
	.string	"MM-5415CN"
	.align 4
.LC4283:
	.string	"PCI Battery Backed SDRAM Adapter"
.LC4284:
	.string	"MM-5425CN"
	.align 4
.LC4285:
	.string	"PCI Memory Module with Battery Backup"
.LC4286:
	.string	"MM-6140D"
.LC4287:
	.string	"Memory Module"
.LC4288:
	.string	"Bt881"
	.align 4
.LC4289:
	.string	"Video Capture (10 bit High qualtiy cap)"
.LC4290:
	.string	"Bt878"
.LC4291:
	.string	"Video Capture"
.LC4292:
	.string	"nVidia NV28"
.LC4293:
	.string	"VGA Geforce4 MX440"
.LC4294:
	.string	"VGA Geforce4 Ti4200"
.LC4295:
	.string	"FOB-IO Card"
.LC4296:
	.string	"L2B PCI Board"
.LC4297:
	.string	"FOB-SD Card"
.LC4298:
	.string	"FOB-TDC Card"
.LC4299:
	.string	"Scope"
.LC4300:
	.string	"Pulsar"
.LC4301:
	.string	"Pulsar SRB"
.LC4302:
	.string	"Pulsar 2"
.LC4303:
	.string	"DSP-Board"
.LC4304:
	.string	"RV250"
.LC4305:
	.string	"RADEON 9000 PRO EVIL COMMANDO"
.LC4306:
	.string	"0x1002"
.LC4307:
	.string	"0x2079"
.LC4308:
	.string	"RV280"
.LC4309:
	.string	"Saphire Radeon 9250"
	.align 4
.LC4310:
	.string	"Sapphire Radeon 9250 - Secondary"
.LC4311:
	.string	"RADEON 9000 ATLANTIS PRO"
	.align 4
.LC4312:
	.string	"RADEON 9000 ATLANTIS PRO - Secondary"
	.align 4
.LC4313:
	.string	"RADEON 9200 ATLANTIS - Secondary"
.LC4314:
	.string	"RADEON 9200 ATLANTIS"
.LC4315:
	.string	"RV670 "
.LC4316:
	.string	"ATI Radeon HD 3870 "
.LC4317:
	.string	"RV350"
.LC4318:
	.string	"Radeon 9550"
.LC4319:
	.string	"rev 1.5"
	.align 4
.LC4320:
	.string	"cPEG\357\277\275 C 3.0 DVD/MPEG2 decoder"
.LC4321:
	.string	"RTL8169S"
.LC4322:
	.string	"RealTek 8169S chip"
.LC4323:
	.string	"0637"
.LC4324:
	.string	"U.S. Robotics 56K Win INT"
.LC4325:
	.string	"11323A"
	.align 4
.LC4326:
	.string	"U.S. Robotics 56K Voice Host Int"
	.align 4
.LC4327:
	.string	"USRobotics 5660A - Internal Soft Modem"
	.align 4
.LC4328:
	.string	"http://www.usr.com/support/product-template.asp?prod=5660a"
.LC4329:
	.string	"E129336-1"
.LC4330:
	.string	"U.S.Robotic (A- Modem/PCI)"
	.align 4
.LC4331:
	.string	"Wireless Access Adapter Model 022415"
	.align 4
.LC4332:
	.string	"U.S. Robotics 56K Voice Host Int (A-Modem/ PCI)"
.LC4333:
	.string	"mx98715/25"
.LC4334:
	.string	"i740 PCI"
.LC4335:
	.string	"PCI to EISA Bridge"
.LC4336:
	.string	"ISA Bridge"
	.align 4
.LC4337:
	.string	" [URL=http://bjlsgpvs.com]zyqdruqt[/URL]  pkooxpbn http://khmycdty.com znrqsyvm syeowswq  <a href="
.LC4338:
	.string	"CPQB1A9"
	.align 4
.LC4339:
	.string	"StorageWorks Library Adapter (HVD)"
.LC4340:
	.string	"686P7"
.LC4341:
	.string	"NC7132"
.LC4342:
	.string	"Gigabit Upgrade Module"
.LC4343:
	.string	"NC6136"
.LC4344:
	.string	"Gigabit Server Adapter"
.LC4345:
	.string	"Adaptec AIC-7899G"
	.align 4
.LC4346:
	.string	"64Bit,66MHz,Dual Channel WideUltra3 SCSI"
.LC4347:
	.string	"Neteligent 4/16 TR"
.LC4348:
	.string	"PCI UTP/STP Controller"
.LC4349:
	.string	"Triflex Model 1000"
.LC4350:
	.string	"Pentium Bridge"
.LC4351:
	.string	"Triflex Model 2000"
.LC4352:
	.string	"QVision 1280/p v0"
.LC4353:
	.string	"QVision 1280/p v1"
.LC4354:
	.string	"QVision 1280/p v2"
.LC4355:
	.string	"Triflex Model 4000"
.LC4356:
	.string	"Model 6010"
.LC4357:
	.string	"HotPlug PCI Bridge"
	.align 4
.LC4358:
	.string	"Original Compaq fibre Channel HBA"
	.align 4
.LC4359:
	.string	"Advanced System Management Controller"
.LC4360:
	.string	"Triflex PCI to ISA PnP Bridge"
.LC4361:
	.string	"PCI Hotplug Controller"
.LC4362:
	.string	"ZFMicro"
.LC4363:
	.string	"USB Open Host Controller"
.LC4364:
	.string	"HPFC-5166A"
	.align 4
.LC4365:
	.string	"Tachyon TL 64-bit/66-Mhz FC HBA"
.LC4366:
	.string	"Smart-2 Array Controller"
.LC4367:
	.string	"MIS-L"
.LC4368:
	.string	"MPC"
.LC4369:
	.string	"CPU to PCI Bridge"
.LC4370:
	.string	"MIS-E"
.LC4371:
	.string	"PCI to ISA PnP Bridge"
.LC4372:
	.string	"System Management Controller"
	.align 4
.LC4373:
	.string	"Netelligent 10/100 TX PCI UTP TLAN 2.3"
.LC4374:
	.string	"Triflex"
.LC4375:
	.string	"Dual EIDE Controller"
	.align 4
.LC4376:
	.string	"Netelligent 10 T PCI UTP TLAN 2.3"
	.align 4
.LC4377:
	.string	"Integrated NetFlex 3/P TLAN 2.3"
	.align 4
.LC4378:
	.string	"Dual Port Netelligent 10/100 TX PCI TLAN"
	.align 4
.LC4379:
	.string	"Integrated Netelligent 10/100 TX PCI"
.LC4380:
	.string	"CETUS-L"
.LC4381:
	.string	"DRACO"
.LC4382:
	.string	"NorthStar"
	.align 4
.LC4383:
	.string	"Dual Port Netelligent 10/100 TX"
.LC4384:
	.string	"Netelligent 10 T/2"
.LC4385:
	.string	"UTP/Coax PCI"
.LC4386:
	.string	"NC3120"
.LC4387:
	.string	"Fast Ethernet NIC"
.LC4388:
	.string	"NC3122"
.LC4389:
	.string	"NC1120"
.LC4390:
	.string	"Ethernet NIC"
.LC4391:
	.string	"Netelligent WS 1500"
	.align 4
.LC4392:
	.string	"10/100TX Embedded UTP/Coax Controller"
.LC4393:
	.string	"699209-003"
.LC4394:
	.string	"10/100TX WOL UTP Controller"
.LC4395:
	.string	"CISS"
.LC4396:
	.string	"SMART2 Array Controller"
.LC4397:
	.string	"NC3161"
	.align 4
.LC4398:
	.string	"Fast Ethernet Embedded Controller w/ WOL"
.LC4399:
	.string	"NC3160"
.LC4400:
	.string	"NC3121 rev. A & B"
.LC4401:
	.string	"NC3131"
.LC4402:
	.string	"NC3132"
.LC4403:
	.string	"NC6132"
.LC4404:
	.string	"Gigabit Module"
.LC4405:
	.string	"NC6133"
.LC4406:
	.string	"NC3133"
.LC4407:
	.string	"Fast Ethernet Module"
.LC4408:
	.string	"NC6134"
.LC4409:
	.string	"Gigabit NIC"
.LC4410:
	.string	"NC3163"
.LC4411:
	.string	"NC3162"
.LC4412:
	.string	"NC3123"
.LC4413:
	.string	"NC3134"
.LC4414:
	.string	"NC3135"
.LC4415:
	.string	"Fast Ethernet Upgrade Module"
.LC4416:
	.string	"CISSB"
.LC4417:
	.string	"0230"
.LC4418:
	.string	"Conexant SoftK56 Modem"
.LC4419:
	.string	"NC7131"
.LC4420:
	.string	"iLo"
	.align 4
.LC4421:
	.string	"Integrated Lights Out Processor"
.LC4422:
	.string	"FCA2101"
	.align 4
.LC4423:
	.string	"HP StorageWorks 2 Gb, 64-Bit/66-MHz PCI-to-Fibre Channel Host Bus Adapter for Windows 2000, Windows"
.LC4424:
	.string	"ThunderLAN 1.0 NetFlex-3/P"
	.align 4
.LC4425:
	.string	"ThunderLAN 2.3 NetFlex-3/P with BNC"
	.align 4
.LC4426:
	.string	"LP7000 Compaq/Emulex Fibre Channel HBA"
	.align 4
.LC4427:
	.string	"LP8000 Compaq/Emulex Fibre Channel HBA"
.LC4428:
	.string	"LSI53C810"
.LC4429:
	.string	"PCI-SCSI I/O Processor"
.LC4430:
	.string	"53C820"
.LC4431:
	.string	"Fast-wide SCSI"
.LC4432:
	.string	"LSI53C1010-33"
.LC4433:
	.string	"PCI to SCSI I/O Processor"
.LC4434:
	.string	"53C815"
.LC4435:
	.string	"SCSI raid controllers"
.LC4436:
	.string	"53C810AP"
.LC4437:
	.string	"Fast SCSI"
.LC4438:
	.string	"LSI53C860/860E"
	.align 4
.LC4439:
	.string	"PCI to Ultra SCSI I/O Processor"
.LC4440:
	.string	"LSI53C1510"
	.align 4
.LC4441:
	.string	"PCI Dual Channel Wide Ultra2 SCSI Ctrlr"
.LC4442:
	.string	"LSI53C896/897"
.LC4443:
	.string	"LSI53C895"
	.align 4
.LC4444:
	.string	"PCI to Ultra2 SCSI I/O Processor"
.LC4445:
	.string	"53C885"
.LC4446:
	.string	"Ultra Wide SCSI, Ethernet"
.LC4447:
	.string	"53C875/875E/876/876E"
	.align 4
.LC4448:
	.string	"I2O-Ready PCI RAID Ultra2 SCSI Ctrlr"
.LC4449:
	.string	"LSI53C895A"
.LC4450:
	.string	"PCI to Ultra2 SCSI Controller"
.LC4451:
	.string	"LSI53C875A"
.LC4452:
	.string	"PCI to Ultra SCSI Controller"
	.align 4
.LC4453:
	.string	"PCI to Dual Channel Ultra3 SCSI Ctrlr"
	.align 4
.LC4454:
	.string	"LSI53C1000/1000R/1010R/1010-66"
	.align 4
.LC4455:
	.string	"PCI to Ultra160 SCSI Controller"
.LC4456:
	.string	"LSI53C1020/1030"
	.align 4
.LC4457:
	.string	"PCI-X to Ultra320 SCSI Controller"
.LC4458:
	.string	"LSI53C1030ZC"
.LC4459:
	.string	"PCI-X SCSI Controller"
.LC4460:
	.string	"LSI53C1035"
.LC4461:
	.string	"LSISAS1064"
.LC4462:
	.string	"PCI-X Fusion-MPT SAS"
.LC4463:
	.string	"LSISAS1068"
.LC4464:
	.string	"LSISAS1064ET"
.LC4465:
	.string	"PCI-Express Fusion-MPT SAS"
.LC4466:
	.string	"LSISAS1068E"
.LC4467:
	.string	"LSISAS1066"
.LC4468:
	.string	"0x1734"
.LC4469:
	.string	"0x10f9"
.LC4470:
	.string	"LSISAS1078"
.LC4471:
	.string	"53C810"
	.align 4
.LC4472:
	.string	"LSI 53C8xx SCSI host adapter chip"
.LC4473:
	.string	"LSIFC909"
.LC4474:
	.string	"Fibre Channel I/O Processor"
.LC4475:
	.string	"LSIFC929"
	.align 4
.LC4476:
	.string	"Dial Channel Fibre Channel I/O Processor"
	.align 4
.LC4477:
	.string	"Dual Channel Fibre Channel I/O Processor"
.LC4478:
	.string	"LSIFC919"
.LC4479:
	.string	"LSIFC929X"
.LC4480:
	.string	"LSIFC919X"
.LC4481:
	.string	"LSIFC920"
.LC4482:
	.string	"LSIFC949X"
.LC4483:
	.string	"LSIFC939X"
.LC4484:
	.string	"LSIFC949ES"
.LC4485:
	.string	"10/100 MBit Ethernet"
.LC4486:
	.string	"Yellowfin G-NIC"
.LC4487:
	.string	"61C102"
.LC4488:
	.string	"63C815"
.LC4489:
	.string	"Fast SCSI Controller"
.LC4490:
	.string	"53C895"
	.align 4
.LC4491:
	.string	"Symbios Ultra2 SCSI controller"
.LC4492:
	.string	"LSI 53C102000"
	.align 4
.LC4493:
	.string	"Single channel SCSI controller"
.LC4494:
	.string	"ati 1900"
.LC4495:
	.string	"M24 1P"
.LC4496:
	.string	"Radeon Mobility X600"
.LC4497:
	.string	"M24 1T"
.LC4498:
	.string	"FireGL"
.LC4499:
	.string	"RV380"
.LC4500:
	.string	"Radeon X600"
.LC4501:
	.string	"FireGL V3200"
.LC4502:
	.string	"A3"
.LC4503:
	.string	"Radeon IGP 320"
.LC4504:
	.string	"RS200"
.LC4505:
	.string	"Radeon IGP 340"
.LC4506:
	.string	"R300"
.LC4507:
	.string	"Radeon 9500 Series"
.LC4508:
	.string	"Radeon 9200 (M+X)"
.LC4509:
	.string	"Radeon 9700"
	.align 4
.LC4510:
	.string	"ATI Fire GL Z1  Video Accelerator"
.LC4511:
	.string	"R350"
.LC4512:
	.string	"Radeon 9800 SE"
.LC4513:
	.string	"rv350"
.LC4514:
	.string	"Radeon 9600 pro"
.LC4515:
	.string	"Radeon 9600"
.LC4516:
	.string	"RV360"
.LC4517:
	.string	"Radeon 9600 XT"
.LC4518:
	.string	"4c59h"
.LC4519:
	.string	"vga video"
.LC4520:
	.string	"Radeon 9500 Series, secondary"
.LC4521:
	.string	"R300 (128bit mem bus)"
	.align 4
.LC4522:
	.string	"ATI Fire GL Z1 4P SECONDARY Video"
.LC4523:
	.string	"Radeon 9800 SE - Secondary"
.LC4524:
	.string	"Radeon 9600 - Secondary"
.LC4525:
	.string	"Radeon 9600 Secondary"
.LC4526:
	.string	"Radeon 9600 XT - Secondary"
.LC4527:
	.string	"Radeon 9550 - Secondary"
.LC4528:
	.string	"R200AIW"
.LC4529:
	.string	"All-In-Wonder 8500DV"
	.align 4
.LC4530:
	.string	"Lucent OHCI IEEE1394 Host Controller"
.LC4531:
	.string	"rs200"
.LC4532:
	.string	"Radeon IGP 320M"
.LC4533:
	.string	"RS200M"
.LC4534:
	.string	"Mobility M6 (U2)"
.LC4535:
	.string	"AD1981"
.LC4536:
	.string	"IXP 150"
.LC4537:
	.string	"HUB Bridge"
.LC4538:
	.string	"EHCI USB Controller"
.LC4539:
	.string	"OHCI USB Controller #1"
.LC4540:
	.string	"OHCI USB Controller #2"
.LC4541:
	.string	"IXP 1xx/2xx"
.LC4542:
	.string	"PATA 100 Controller"
.LC4543:
	.string	"LPC Controller"
.LC4544:
	.string	"a75-s226"
	.align 4
.LC4545:
	.string	"Agere Systems AC'97 Modem device"
.LC4546:
	.string	"215r2qzua21"
.LC4547:
	.string	"mach64 ct pci"
.LC4548:
	.string	"216l0sas25"
.LC4549:
	.string	"Mach64 CX"
.LC4550:
	.string	"IXP 3xx"
.LC4551:
	.string	"PATA 133 Controller"
.LC4552:
	.string	"SATA/Raid controller"
.LC4553:
	.string	"IXP_AUDIO_400"
.LC4554:
	.string	"IXP AC'97 Audio Controller"
.LC4555:
	.string	"x200"
.LC4556:
	.string	"ATI SMBus"
.LC4557:
	.string	"SB4xx"
.LC4558:
	.string	"AC97 Modem"
.LC4559:
	.string	"SATA/Raid controller--1"
.LC4560:
	.string	"SATA/Raid controller--2"
	.align 4
.LC4561:
	.string	"IXP SB450 High Definition Audio Controller"
.LC4562:
	.string	"SATA2"
.LC4563:
	.string	"ATI ?"
.LC4564:
	.string	"AHCI/Raid Controller"
.LC4565:
	.string	"ATI RS690"
.LC4566:
	.string	"ATI RD600/RS600"
.LC4567:
	.string	"690G"
.LC4568:
	.string	"RD600/RS600"
	.align 4
.LC4569:
	.string	"ATI RD600/RS600 IDE Controller"
.LC4570:
	.string	"SB7xx"
.LC4571:
	.string	"ATI SB700"
.LC4572:
	.string	"ATI SB750"
.LC4573:
	.string	"Mach64 ET"
.LC4574:
	.string	"Mach64 VT"
.LC4575:
	.string	"113--34004-104"
.LC4576:
	.string	"(GT-C2U2)"
	.align 4
.LC4577:
	.string	"ATI  3D Rage Pro  AGP 2X 8mb (gt-c2u2)"
.LC4578:
	.string	"Rage 3D Pro AGP 2x"
.LC4579:
	.string	"Rage 3D Pro"
.LC4580:
	.string	"GT-C2U2"
.LC4581:
	.string	"RAGE PRO TURBO AGP 2X"
.LC4582:
	.string	"ATI ALL IN WONDER PRO (8MB)"
.LC4583:
	.string	"Rage XC PCI-66"
.LC4584:
	.string	"k7 som+"
.LC4585:
	.string	"Rage XL AGP 2x"
.LC4586:
	.string	"SLAT"
.LC4587:
	.string	"Rage XC AGP 2x"
.LC4588:
	.string	"Rage XL PCI-66"
.LC4589:
	.string	"I Need Driver for the Chip"
.LC4590:
	.string	"ATI 3D Rage Pro 215GP"
.LC4591:
	.string	"Rage 3D Pro PCI"
.LC4592:
	.string	"ATI (GT-C2U2)"
.LC4593:
	.string	"Rage XL PCI"
	.align 4
.LC4594:
	.string	"ATI On-Board VGA for HP Proliant 350 G3"
.LC4595:
	.string	"Rage XC PCI"
.LC4596:
	.string	"Mach 64 VT"
	.align 4
.LC4597:
	.string	"Rage 3D II Graphics Accelerator"
.LC4598:
	.string	"Rage 3D II+pci"
.LC4599:
	.string	"3d rage 2 + dvd"
.LC4600:
	.string	"Rage 3D IIC AGP"
.LC4601:
	.string	"Graphics Accelerator"
.LC4602:
	.string	"3D 11C AGP"
	.align 4
.LC4603:
	.string	"210888GXControladores ATI 210888GX [Mach64 GX]"
.LC4604:
	.string	"Mach 64 GT"
.LC4605:
	.string	"m3d agp card on agp slot"
.LC4606:
	.string	"215r2qua12"
.LC4607:
	.string	"Rage IIC AGP"
.LC4608:
	.string	"Radeon 9000/9000 Pro"
.LC4609:
	.string	"Radeon 9000"
	.align 4
.LC4610:
	.string	"Radeon 9000/9000 Pro - Secondary"
.LC4611:
	.string	"Radeon 9000 - Secondary"
.LC4612:
	.string	"R423"
.LC4613:
	.string	"Radeon X800 gt"
.LC4614:
	.string	"R420"
.LC4615:
	.string	"RADEON X800 XT"
.LC4616:
	.string	"RADEON X800 XT Secondary"
.LC4617:
	.string	"B10E0E11"
.LC4618:
	.string	"Rage 3D LT Pro AGP 133 MHz"
.LC4619:
	.string	"Rage 3D LT Pro AGP"
.LC4620:
	.string	"Rage Mobility M3 AGP"
.LC4621:
	.string	"Mobility M3 AGP"
.LC4622:
	.string	"0x4c46"
.LC4623:
	.string	"ati rage pro"
.LC4624:
	.string	"Rage 3D LT-G"
.LC4625:
	.string	"123"
.LC4626:
	.string	"Rage 3D LT Pro"
.LC4627:
	.string	"01541014"
.LC4628:
	.string	"Rage P/M Mobility AGP 2x"
.LC4629:
	.string	"216lo sasa25"
.LC4630:
	.string	"Rage Mobility l"
	.align 4
.LC4631:
	.string	"VEN_1002&DEV_4C50&SUBSYS_4C501002&REV_DC"
.LC4632:
	.string	"Rage 3D LT Pro PCI"
.LC4633:
	.string	"113"
.LC4634:
	.string	"1241243"
.LC4635:
	.string	"Rage P/M Mobility agp"
.LC4636:
	.string	"216L0SASA25"
.LC4637:
	.string	"Rage L Mobility PCI"
.LC4638:
	.string	"Mach 64 LT"
.LC4639:
	.string	"fdds"
.LC4640:
	.string	"Radeon Mobility M7 LW"
.LC4641:
	.string	"FireGL Mobility"
.LC4642:
	.string	"Mobility 6"
.LC4643:
	.string	"Radeon Mobility M6 Series"
.LC4644:
	.string	"Radeon Mobility M6 LZ"
.LC4645:
	.string	"Radeon Mobility M9-GL"
	.align 4
.LC4646:
	.string	"ATI MOBILITY RADEON 9000 (Microsoft Corporation -"
.LC4647:
	.string	"Radeon Mobility M9"
.LC4648:
	.string	"ATI mobility128"
.LC4649:
	.string	"Rage Mobility 128 AGP 4x"
.LC4650:
	.string	"216l0sasa25"
.LC4651:
	.string	"Rage Mobility 128 AGP"
.LC4652:
	.string	"ATI Theater 550 Pro"
.LC4653:
	.string	"Radeon 9700/9500 Series"
.LC4654:
	.string	"Radeon 9500 Pro"
.LC4655:
	.string	"Radeon 9600TX"
	.align 4
.LC4656:
	.string	"ATI Fire GL X1/Z1 Video Accelerator"
.LC4657:
	.string	"R360"
.LC4658:
	.string	"Radeon 9800 Pro"
.LC4659:
	.string	"Radeon 9800"
.LC4660:
	.string	"Radeon 9800 XT"
.LC4661:
	.string	"FGL9800XT"
.LC4662:
	.string	"ATI FIREGL X2-256T"
.LC4663:
	.string	"RV360M10"
.LC4664:
	.string	"Radeon Mobility 9600 Pro"
.LC4665:
	.string	"RV350-WS"
.LC4666:
	.string	"Radeon Mobility M10 NT"
.LC4667:
	.string	"Radeon 9700 Pro"
	.align 4
.LC4668:
	.string	"Radeon 9700/9500 Series - Secondary"
.LC4669:
	.string	"Radeon 9600TX - Secondary"
	.align 4
.LC4670:
	.string	"Fire GL X1/Z1 AGP [Pro] Secondary Video"
.LC4671:
	.string	"Radeon 9800 Pro - Secondary"
.LC4672:
	.string	"Radeon 9800 - Secondary"
.LC4673:
	.string	"Radeon 9800 XT - Secondary"
.LC4674:
	.string	"ATI FIREGL X2-256T Secondary"
.LC4675:
	.string	"gt"
.LC4676:
	.string	"Rage 128 Pro PA PCI"
.LC4677:
	.string	"rage 128 pf pro agp "
.LC4678:
	.string	"Rage 128 Pro PB AGP 2x"
.LC4679:
	.string	"1231324445"
.LC4680:
	.string	"Rage 128 Pro PC AGP 4x"
.LC4681:
	.string	"rv100"
.LC4682:
	.string	"Rage 128 Pro PD PCI"
.LC4683:
	.string	"Rage 128 Pro PE AGP 2x"
.LC4684:
	.string	"5046"
.LC4685:
	.string	"Rage 128 Pro PF AGP 4x"
.LC4686:
	.string	"215R3BUA22"
.LC4687:
	.string	" 3d Rage pro agp 2x"
.LC4688:
	.string	"Rage 128 Pro PH AGP"
.LC4689:
	.string	"Rage 128 Pro PH AGP 2x"
	.align 4
.LC4690:
	.string	"bk2.0.2.vr001.001.002.002.004.025.prt3.ty.t"
.LC4691:
	.string	"Rage 128 Pro PI AGP 4x"
.LC4692:
	.string	"Rage 128 Pro PJ PCI"
.LC4693:
	.string	"Rage 128 Pro PJ PCI (TMDS)"
.LC4694:
	.string	"Rage 128 Pro PK AGP"
.LC4695:
	.string	"Rage 128 Pro PK AGP 2x (TMDS)"
.LC4696:
	.string	"Rage 128 Pro PL AGP"
.LC4697:
	.string	"4x (TMDS)"
.LC4698:
	.string	"Rage 128 Pro PM PCI"
.LC4699:
	.string	"Rage 128 Pro PN AGP"
.LC4700:
	.string	"Rage 128 Pro PN AGP 2x"
.LC4701:
	.string	"Rage 128 Pro PO AGP"
.LC4702:
	.string	"Rage 128 Pro PO AGP 4x"
	.align 4
.LC4703:
	.string	"Scheda Grafica Standard PCI(VGA)"
.LC4704:
	.string	"Rage 128 Pro PP PCI (TMDS)"
.LC4705:
	.string	"Rage 128 Pro PQ AGP"
.LC4706:
	.string	"Rage 128 Pro PQ AGP 2x (TMDS)"
.LC4707:
	.string	"Rage 128 Pro PR AGP"
.LC4708:
	.string	"Rage 128 Pro PR AGP 4x (TMDS)"
.LC4709:
	.string	"Rage 128 Pro PS PCI"
.LC4710:
	.string	"Rage 128 Pro PT AGP"
.LC4711:
	.string	"Rage 128 Pro PT AGP 2x"
.LC4712:
	.string	"rage 128 pro agp 4x tmds"
.LC4713:
	.string	"Rage 128 Pro PV PCI"
.LC4714:
	.string	"Rage 128 Pro PV PCI (TMDS)"
.LC4715:
	.string	"Rage 128 Pro PW AGP"
.LC4716:
	.string	"Rage 128 Pro PW AGP 2x (TMDS)"
.LC4717:
	.string	"Rage 128 Pro"
.LC4718:
	.string	"PX AGP 4x (TMDS)"
.LC4719:
	.string	"Radeon 7200 QD SDR/DDR"
.LC4720:
	.string	"Radeon QE"
.LC4721:
	.string	"Radeon QF"
.LC4722:
	.string	"Radeon QG"
.LC4723:
	.string	"R200"
.LC4724:
	.string	"Radeon R200 QH"
.LC4725:
	.string	"Radeon R200 QI"
.LC4726:
	.string	"Radeon R200 QJ"
.LC4727:
	.string	"Radeon R200 QK"
.LC4728:
	.string	"Radeon 8500 / 8500LE"
.LC4729:
	.string	"Redeon 9100 Series"
.LC4730:
	.string	"Radeon R200 QM"
.LC4731:
	.string	"Radeon R200 QN"
.LC4732:
	.string	"RV200"
.LC4733:
	.string	"Radeon 7500"
.LC4734:
	.string	"radeon 9700 or 9200"
.LC4735:
	.string	"Radeon 7500 QX"
.LC4736:
	.string	"RV100"
.LC4737:
	.string	"Radeon 7000 / Radeon VE"
.LC4738:
	.string	"Radeon VE QZ"
.LC4739:
	.string	"Radeon ES1000"
.LC4740:
	.string	"ati"
.LC4741:
	.string	"Radeon R200 Qh"
.LC4742:
	.string	"Radeon R200 Qi"
.LC4743:
	.string	"Radeon R200 Qj"
.LC4744:
	.string	"Radeon R200 Qk"
	.align 4
.LC4745:
	.string	"Redeon 9100 Series - Secondary"
.LC4746:
	.string	"215R46ASA22"
.LC4747:
	.string	"Rage 128 GL PCI"
.LC4748:
	.string	"Rage 128 PRO"
.LC4749:
	.string	"Rage 32MB"
.LC4750:
	.string	"Rage 128 RG"
.LC4751:
	.string	"g01080-108"
.LC4752:
	.string	"Rage 128 VR RK PCI"
.LC4753:
	.string	"Rage 128 VR RL AGP 2x"
.LC4754:
	.string	"Rage 128 4x SE PCI"
.LC4755:
	.string	"Rage 128 SF 4x AGP 2x"
.LC4756:
	.string	"Rage 128 SG 4x AGP 4x"
.LC4757:
	.string	"Rage 128 4x SH"
.LC4758:
	.string	"Rage 128 SK PCI"
.LC4759:
	.string	"Rage 128 4x SK PCI"
.LC4760:
	.string	"Rage 128 SL AGP 2x"
.LC4761:
	.string	"Rage 128 4x SL AGP 2x"
.LC4762:
	.string	"Rage 128 SM AGP 4x"
.LC4763:
	.string	"Rage 128 4x SM AGP 4x"
.LC4764:
	.string	"Rage 128 4x"
.LC4765:
	.string	"Mach 64 ST"
.LC4766:
	.string	"Rage 128 PRO ULTRA"
	.align 4
.LC4767:
	.string	"Video Controller (VGA Compatible)"
.LC4768:
	.string	"Rage 128 Pro TL"
.LC4769:
	.string	"Rage 128 Pro TR"
.LC4770:
	.string	"Rage 128 Pro Ultra TU"
.LC4771:
	.string	"RV370"
.LC4772:
	.string	"Radeon X300 Mobility (M22)"
.LC4773:
	.string	"X800GT"
.LC4774:
	.string	"Primary"
.LC4775:
	.string	"R430"
.LC4776:
	.string	"Radeon X800 XL"
.LC4777:
	.string	"R423GL-SE"
	.align 4
.LC4778:
	.string	"ATI FIREGL V5100 PCI-EX Primary"
.LC4779:
	.string	"Secondary"
.LC4780:
	.string	"Radeon X800 XL - Secondary"
	.align 4
.LC4781:
	.string	"ATI FIREGL V5100 PCI-EX Secondary"
.LC4782:
	.string	"R410"
.LC4783:
	.string	"Mobility X700"
.LC4784:
	.string	"215VT2CA42"
.LC4785:
	.string	"Mach 64 VT VIDEO XPRESSION"
.LC4786:
	.string	"Mach 64 VT3"
.LC4787:
	.string	"Mach 64 VT4 PCI"
.LC4788:
	.string	"RS300"
.LC4789:
	.string	"Radeon 9100 IGP"
.LC4790:
	.string	"Mobilitiy Radeon 9100 IGP AGP"
	.align 4
.LC4791:
	.string	"www.ati.comRadeon 9200 Pro - Secondary"
.LC4792:
	.string	"ATI Radeon 9200 - Secondary"
.LC4793:
	.string	"na"
	.align 4
.LC4794:
	.string	"ATI Radeon Xpress 200 Series - RS480"
.LC4795:
	.string	"Mobility Radeon XPRESS 200"
.LC4796:
	.string	"Radeon 9200 Pro"
.LC4797:
	.string	"ATI RADEON 9200 se agp"
.LC4798:
	.string	"Radeon 9200"
.LC4799:
	.string	"Radeon 9200 SE Series"
.LC4800:
	.string	"Nvidia"
.LC4801:
	.string	"FireMV 2200"
.LC4802:
	.string	"Radeon Xpress 1100"
.LC4803:
	.string	"ATI Radeon X1100"
.LC4804:
	.string	"RC410"
	.align 4
.LC4805:
	.string	"Northbridge: Radeon Xpress 200"
.LC4806:
	.string	"X200M"
	.align 4
.LC4807:
	.string	"SUBSYS_11821043&REV_00\004&1CF2FBB4&0&2808"
.LC4808:
	.string	"Radeon XPress 200 (RC410)"
	.align 4
.LC4809:
	.string	"Radeon Xpress 200 (RC410) VGA card"
.LC4810:
	.string	"RC410M"
.LC4811:
	.string	"ATI RADEON XPRESS 1100"
.LC4812:
	.string	"Radeon X300"
	.align 4
.LC4813:
	.string	"ATI Technologies Inc RV370 5B60 [Radeon X300 (PCIE)]"
.LC4814:
	.string	"RADEON X600 Series 265MB"
.LC4815:
	.string	"ATI Radoen X1050"
.LC4816:
	.string	"RV370GL"
.LC4817:
	.string	"RADEON X300"
.LC4818:
	.string	"FireGL V3100"
	.align 4
.LC4819:
	.string	"ATI 128MB PCI Express\357\277\275 x16 ATI FireGL V3100"
.LC4820:
	.string	"bk-ati ver008.016m.085.006"
.LC4821:
	.string	"Mobility Radeon 9200"
.LC4822:
	.string	"RV280 (M9+)"
	.align 4
.LC4823:
	.string	"Radeon 9200 SE Series - Secondary"
.LC4824:
	.string	"ATI FireMV 2200 PCI Secondary"
.LC4825:
	.string	"Mobility Radeon X800"
	.align 4
.LC4826:
	.string	"PCI-E Graphics adapter from Clevo D900T notebook"
.LC4827:
	.string	"Radeon XT850"
.LC4828:
	.string	"r480"
.LC4829:
	.string	"x800gto 256 pci-e"
.LC4830:
	.string	"R480"
.LC4831:
	.string	"Radeon X850XT (PCIE) Primary"
.LC4832:
	.string	"N/A"
.LC4833:
	.string	"A3/U1"
.LC4834:
	.string	"PCI to AGP Bridge"
.LC4835:
	.string	"R520"
.LC4836:
	.string	"Radeon X1800 Series"
.LC4837:
	.string	"Radeon X1300 Pro or X1550"
.LC4838:
	.string	"x1400"
	.align 4
.LC4839:
	.string	"PCIVEN_1002&DEV_7145&SUBSYS_20031028&REV_004&1C9EC085&0&0008"
.LC4840:
	.string	"Radeon X1300 XGE"
.LC4841:
	.string	"216CZJAKA12FAG"
	.align 4
.LC4842:
	.string	"ATI Mobility Radeon X1300, M52-64"
.LC4843:
	.string	"Fire GL v3300"
.LC4844:
	.string	"HP Fire GL v3300"
.LC4845:
	.string	"RV505"
.LC4846:
	.string	"Radeon X1300/X1550 Series"
.LC4847:
	.string	"Mobility Radeon X1450"
	.align 4
.LC4848:
	.string	"PCIVEN_1002&DEV_7186&SUBSYS_12311043&REV_004&2D404BB6&0&0008"
.LC4849:
	.string	"Radeon 1300"
.LC4850:
	.string	"Mobility X2300"
.LC4851:
	.string	"ATI Mobility Radeon X2300"
.LC4852:
	.string	"ati graphics"
.LC4853:
	.string	"X1300"
.LC4854:
	.string	"ATI X1300 Pro"
.LC4855:
	.string	"Radeon 1300 Secondary"
.LC4856:
	.string	"RV535"
.LC4857:
	.string	"Radeon X1650 Pro"
.LC4858:
	.string	"ATI X1600 Pro PCI-E"
.LC4859:
	.string	"RV530?"
.LC4860:
	.string	"Radeon X1600 Mobility"
.LC4861:
	.string	"0x1043"
.LC4862:
	.string	"0x10b2"
.LC4863:
	.string	"RV530GL"
.LC4864:
	.string	"FireGL V3400"
.LC4865:
	.string	"Uknown"
.LC4866:
	.string	"Ati Radeon X2500 "
.LC4867:
	.string	"ATI FireGL V3400 Secondary"
.LC4868:
	.string	"1106"
.LC4869:
	.string	"S3G Unichrome IGP KM400/KN400"
.LC4870:
	.string	"180636911721"
.LC4871:
	.string	"R580LE"
.LC4872:
	.string	"Radeon X1950 Pro"
	.align 4
.LC4873:
	.string	"Radeon X1950 Pro Series AGP (0x7280)"
.LC4874:
	.string	"Radeon X1950 Pro Secondary"
	.align 4
.LC4875:
	.string	"Radeon X1950 Pro Series AGP (0x72A0)"
.LC4876:
	.string	"RS350"
.LC4877:
	.string	"Radeon 9100 Pro"
.LC4878:
	.string	"303017AA"
.LC4879:
	.string	"ATI xpress 1250"
.LC4880:
	.string	"RS690"
.LC4881:
	.string	"ATI Mobility Radeon x1250"
.LC4882:
	.string	"Samsung R25P"
.LC4883:
	.string	"ATI Technoligies Inc"
.LC4884:
	.string	"ATI XPress 1250M"
.LC4885:
	.string	"R600"
.LC4886:
	.string	"ATI Radeon HD 2900 XT"
.LC4887:
	.string	"Radeon 4870"
.LC4888:
	.string	"Graphics adapter"
.LC4889:
	.string	"REV_00"
.LC4890:
	.string	"ATI Radeon HD 2400 PRO"
.LC4891:
	.string	"RV610"
.LC4892:
	.string	"ATI Radeon HD 3470 PRO AGP"
.LC4893:
	.string	"ATI Radeon HD 2400 Series"
.LC4894:
	.string	"RV670"
.LC4895:
	.string	"ATI Radeon HD 3870"
.LC4896:
	.string	"ATI Radeon HD3850 AGP"
.LC4897:
	.string	"600458"
.LC4898:
	.string	"ATI Mobility Radeon HD2600"
.LC4899:
	.string	" Radeon hd 2600 pro (agp)"
.LC4900:
	.string	"RV530"
.LC4901:
	.string	"ATI Radeon HD 2600 XT"
.LC4902:
	.string	"RV630"
.LC4903:
	.string	"ATI Radeon HD 2600 PRO"
.LC4904:
	.string	"16331043"
.LC4905:
	.string	"ATI RADEON MOBILITY HD 3650"
	.align 4
.LC4906:
	.string	"ATI Mobility\357\277\275 Radeon\357\277\275 HD 3450"
.LC4907:
	.string	"Radeon"
.LC4908:
	.string	"HD 3400 Series"
.LC4909:
	.string	"780G"
	.align 4
.LC4910:
	.string	"Radeon HD 3200 Integrated Graphics Processor"
.LC4911:
	.string	"ATI GTC (GT-C2U2)"
.LC4912:
	.string	"ATI 3D Rage Pro AGP 2X"
	.align 4
.LC4913:
	.string	"Ati Function driver for high definition audio - AT"
.LC4914:
	.string	"Ati Mobility Radeon HD 2600"
.LC4915:
	.string	"HDMI Audio Support"
.LC4916:
	.string	"ATI Radeon HD 3600 Series"
.LC4917:
	.string	"3400"
.LC4918:
	.string	"Radeon HD 3400 Series"
.LC4919:
	.string	"S2K CPU to PCI Bridge"
.LC4920:
	.string	"Slot1 CPU to PCI Bridge"
.LC4921:
	.string	"0x0201"
.LC4922:
	.string	"82C591/2-FC1"
.LC4923:
	.string	"CPU Bridge"
.LC4924:
	.string	"82C593"
.LC4925:
	.string	"82C594"
.LC4926:
	.string	"Wildcat System Controller"
.LC4927:
	.string	"82C596/597"
.LC4928:
	.string	"Wildcat ISA Bridge"
.LC4929:
	.string	"82C597-AFC2"
.LC4930:
	.string	"82C541"
.LC4931:
	.string	"82C543"
.LC4932:
	.string	"dtdftdfz"
	.align 4
.LC4933:
	.string	"CPU to PCI Bridge for notebook"
.LC4934:
	.string	"82C532"
.LC4935:
	.string	"Peripheral Controller"
.LC4936:
	.string	"82C534"
.LC4937:
	.string	"82C538"
.LC4938:
	.string	"82C535"
.LC4939:
	.string	"82C147"
.LC4940:
	.string	"IrDA Controller"
.LC4941:
	.string	"82C975"
.LC4942:
	.string	"RISC GUI Accelerator"
.LC4943:
	.string	"82C925"
.LC4944:
	.string	"SAA7785"
	.align 4
.LC4945:
	.string	"ThunderBird PCI Audio Accelerator"
.LC4946:
	.string	"ThunderBird joystick port"
.LC4947:
	.string	"ThunderBird 16650 UART"
.LC4948:
	.string	"KTX0208X"
.LC4949:
	.string	"Philips Seismic Edge 705"
	.align 4
.LC4950:
	.string	"Philips PSC705 GamePort Enumerator"
.LC4951:
	.string	"VAS96011"
.LC4952:
	.string	"Golden Gate II"
.LC4953:
	.string	"DP83810"
.LC4954:
	.string	"10/100 Ethernet MAC"
.LC4955:
	.string	"PC87415"
	.align 4
.LC4956:
	.string	"PCI-IDE DMA Master Mode Interface Ctrlr"
.LC4957:
	.string	"PC87560"
.LC4958:
	.string	"Legacy I/O Controller"
.LC4959:
	.string	"CS4210"
.LC4960:
	.string	"IEEE 1394 OHCI Controller"
.LC4961:
	.string	"PCI System I/O"
.LC4962:
	.string	"LM4560"
	.align 4
.LC4963:
	.string	"Advanced PCI Audio Accelerator"
.LC4964:
	.string	"DP83815/16"
	.align 4
.LC4965:
	.string	"MacPhyter 10/100 Mb/s Ethernet MAC & PHY"
.LC4966:
	.string	"DP83815"
	.align 4
.LC4967:
	.string	"10/100 MacPhyter3v PCI Adapter"
.LC4968:
	.string	"PC82440"
.LC4969:
	.string	"DP83820/1"
	.align 4
.LC4970:
	.string	"10/100/1000 Mb/s PCI Ethernet NIC"
.LC4971:
	.string	"Geode GX2"
.LC4972:
	.string	"PCI Host Bridge"
.LC4973:
	.string	"CS5535"
.LC4974:
	.string	"GeodeLink PCI South Bridge"
.LC4975:
	.string	"5535"
.LC4976:
	.string	"Geode IDE Controller"
.LC4977:
	.string	"Castle ()"
.LC4978:
	.string	"GEODE - GX3 Audio CS5535"
.LC4979:
	.string	"Geode"
.LC4980:
	.string	"Geode VGA Compatible Device"
.LC4981:
	.string	"SCx200"
.LC4982:
	.string	"LPC Bridge and GPIO"
.LC4983:
	.string	"SMI Status and ACPI"
.LC4984:
	.string	"SC1100/SCx200"
.LC4985:
	.string	"XpressAUDIO"
.LC4986:
	.string	"Video Processor"
.LC4987:
	.string	"X-Bus Expansion Interface"
.LC4988:
	.string	"SC1100"
.LC4989:
	.string	"M2764AFI"
.LC4990:
	.string	"PCI-IDE Interface"
.LC4991:
	.string	"ET4000W32P-A"
.LC4992:
	.string	"ET4000W32P-B"
.LC4993:
	.string	"ET4000W32P-C"
.LC4994:
	.string	"ET4000W32P-D"
.LC4995:
	.string	"ET6000"
.LC4996:
	.string	"Graphics/Multimedia Engine"
.LC4997:
	.string	"ET6300"
	.align 4
.LC4998:
	.string	"BCM1125/BCM1250 PCI Configuration Header"
	.align 4
.LC4999:
	.string	"BCM1125/BCM1250 HyperTransport Configuration Heade"
	.align 4
.LC5000:
	.string	"MIPS BCM1125/BCM1250 processors"
.LC5001:
	.string	"STPC Client"
.LC5002:
	.string	"South Bridge"
.LC5003:
	.string	"P9000"
.LC5004:
	.string	"WeitekPower GUI Accelerator"
.LC5005:
	.string	"P9100"
.LC5006:
	.string	"DC21050"
.LC5007:
	.string	"PCI-PCI Bridge"
.LC5008:
	.string	"DC21040"
.LC5009:
	.string	"Tulip Ethernet Adapter"
.LC5010:
	.string	"DC21030"
.LC5011:
	.string	"PCI Graphics Accelerator"
.LC5012:
	.string	"Zephyr"
.LC5013:
	.string	"NV-RAM"
.LC5014:
	.string	"KZPSA"
.LC5015:
	.string	"SCSI to SCSI Adapter"
.LC5016:
	.string	"DC21140"
.LC5017:
	.string	"Fast Ethernet Ctrlr"
.LC5018:
	.string	"DC21230"
.LC5019:
	.string	"Video Codec"
.LC5020:
	.string	"1011"
.LC5021:
	.string	"TGA2"
.LC5022:
	.string	"TGA2 PDXGB"
.LC5023:
	.string	"DEFPA"
.LC5024:
	.string	"FDDI"
.LC5025:
	.string	"DC21041"
.LC5026:
	.string	"Tulip Plus Ethernet Adapter"
.LC5027:
	.string	"DGLPB"
.LC5028:
	.string	"DC21142/3"
	.align 4
.LC5029:
	.string	"PCI/CardBus 10/100 Mbit Ethernet Ctlr"
.LC5030:
	.string	"21052[-AB]"
.LC5031:
	.string	"DC21150-AA"
.LC5032:
	.string	"DC21150"
.LC5033:
	.string	"DC21151/2"
.LC5034:
	.string	"21153"
.LC5035:
	.string	"21154"
.LC5036:
	.string	"Modem56"
.LC5037:
	.string	"CardBus"
.LC5038:
	.string	"DC21553"
.LC5039:
	.string	"21554"
.LC5040:
	.string	"DAC960"
	.align 4
.LC5041:
	.string	"Mylex DAC1164P Disk Array Controller"
.LC5042:
	.string	"3X-KPCON-AA"
	.align 4
.LC5043:
	.string	"Fault Mgr (3.3v/5v Universal PCI)"
.LC5044:
	.string	"FW82371EB"
.LC5045:
	.string	"pci"
.LC5046:
	.string	"CL-GD7555"
.LC5047:
	.string	"Flat Panel GUI Accelerator"
.LC5048:
	.string	"CL-GD7556"
	.align 4
.LC5049:
	.string	"64-bit Accelerated LCD/CRT Controller"
.LC5050:
	.string	"CL-GD5440"
.LC5051:
	.string	"CL-GD5432"
.LC5052:
	.string	"Alpine GUI Accelerator"
.LC5053:
	.string	"CL-GD5434"
.LC5054:
	.string	"CL-GD5426"
.LC5055:
	.string	"Video card (i guess?)"
.LC5056:
	.string	"CL-GD5446"
	.align 4
.LC5057:
	.string	"64-bit VisualMedia Accelerator"
.LC5058:
	.string	"CL-GD5480"
.LC5059:
	.string	"64-bit SGRAM GUI accelerator"
.LC5060:
	.string	"CL-GD5462"
	.align 4
.LC5061:
	.string	"Laguna VisualMedia graphics accelerator"
.LC5062:
	.string	"CL-GD5455"
	.align 4
.LC5063:
	.string	"Laguna 3D VisualMedia Graphics Accel"
.LC5064:
	.string	"CL-GD5464"
.LC5065:
	.string	"Laguna BD"
.LC5066:
	.string	"CL-GD5465"
.LC5067:
	.string	"CL-GD5436U"
.LC5068:
	.string	"cs4630cm"
	.align 4
.LC5069:
	.string	"accelerator do audio do pci de sound fusion"
.LC5070:
	.string	"CL-PD6729"
.LC5071:
	.string	"PCI-to-PC Card host adapter"
.LC5072:
	.string	"CL-PD6832"
.LC5073:
	.string	"PCMCIA/CardBus Controller"
.LC5074:
	.string	"CL-PD6834"
.LC5075:
	.string	"CL-PD6833"
.LC5076:
	.string	"PCI-to-CardBus Host Adapter"
.LC5077:
	.string	"CL-GD7542"
.LC5078:
	.string	"Nordic GUI Accelerator"
.LC5079:
	.string	"CL-GD7543"
.LC5080:
	.string	"Viking GUI Accelerator"
.LC5081:
	.string	"CL-GD7541"
.LC5082:
	.string	"Nordic-lite VGA Cntrlr"
.LC5083:
	.string	"1085"
.LC5084:
	.string	"Ambient CLM Data Fax Voice"
.LC5085:
	.string	"CL-CD4400"
.LC5086:
	.string	"CS4610/4611"
	.align 4
.LC5087:
	.string	"CrystalClear SoundFusion PCI Audio Accelerator"
.LC5088:
	.string	"CS4614/22/24/"
	.align 4
.LC5089:
	.string	"Voyetra Turtle Beach Santa Cruz"
.LC5090:
	.string	"CS464"
.LC5091:
	.string	"CS4280/4297x"
	.align 4
.LC5092:
	.string	"Crystal AC'97 PCI Audio Interface"
.LC5093:
	.string	"cirrus logic crystal CS 4614"
	.align 4
.LC5094:
	.string	"SoundFusion PCI Audio Accelerator"
.LC5095:
	.string	"MCA Bridge"
.LC5096:
	.string	"Alta Lite"
.LC5097:
	.string	"Alta MP"
.LC5098:
	.string	"Fire Coral"
.LC5099:
	.string	"ISA Bridge w/PnP"
.LC5100:
	.string	"Auto LANStreamer"
.LC5101:
	.string	"TR Auto LANStreamer"
.LC5102:
	.string	"GXT-150P"
.LC5103:
	.string	"Graphics Adapter"
.LC5104:
	.string	"82G2675"
.LC5105:
	.string	"scsi-2 fast pci adapter"
.LC5106:
	.string	"82351/2"
.LC5107:
	.string	"Python"
.LC5108:
	.string	"ServeRAID I/II/3x/4H"
.LC5109:
	.string	"Coppertime RAID SCSI Adapter"
.LC5110:
	.string	"Miami/PCI"
.LC5111:
	.string	"32-bit LocalBus Bridge"
.LC5112:
	.string	"IBM27-82660"
	.align 4
.LC5113:
	.string	"PowerPC to PCI Bridge and Memory Ctrlr"
.LC5114:
	.string	"85H9533"
.LC5115:
	.string	"IBM Token Ring PCI"
.LC5116:
	.string	"SSA Adapter"
.LC5117:
	.string	"MPIC"
.LC5118:
	.string	"Interrupt Controller"
.LC5119:
	.string	"Warhead SCSI Controller"
.LC5120:
	.string	"IBM 3780IDSP"
.LC5121:
	.string	"MPEG-2 Decoder"
.LC5122:
	.string	"ATM Controller"
.LC5123:
	.string	"85h9533"
.LC5124:
	.string	"25 MBit ATM controller"
.LC5125:
	.string	"85g1897"
.LC5126:
	.string	"MPEG PCI Bridge"
.LC5127:
	.string	"i82557B"
.LC5128:
	.string	"10/100 PCI Ethernet Adapter"
.LC5129:
	.string	"05J3506"
.LC5130:
	.string	"TCP/IP networking device"
.LC5131:
	.string	"3780IDSP"
.LC5132:
	.string	"GXT-3000P"
.LC5133:
	.string	"20H2999"
.LC5134:
	.string	"PCI Docking Bridge"
	.align 4
.LC5135:
	.string	"Chukar chipset SCSI Controller"
.LC5136:
	.string	"PowerNP NPr2.7"
.LC5137:
	.string	"ATM support device"
.LC5138:
	.string	"ATM 155Mbps MM Controller"
.LC5139:
	.string	"GXT2000"
.LC5140:
	.string	"256-bit Graphics Rasterizer"
.LC5141:
	.string	"ATM 622Mbps Controller"
.LC5142:
	.string	"02li537"
.LC5143:
	.string	"Adapter 2 Token Ring Card"
.LC5144:
	.string	"CPC700"
	.align 4
.LC5145:
	.string	"Memory Controller and PCI Bridge"
.LC5146:
	.string	"CPC710"
.LC5147:
	.string	"PCI-64 Bridge"
.LC5148:
	.string	"PCI-32 Bridge"
	.align 4
.LC5149:
	.string	"Remote Supervisor+Serial Port+Mouse/Keyb"
.LC5150:
	.string	"Raid controller"
.LC5151:
	.string	"Yotta"
.LC5152:
	.string	"Video Compositor Input"
.LC5153:
	.string	"Video Compositor Output"
.LC5154:
	.string	"405GP"
.LC5155:
	.string	"PLB to PCI Bridge"
.LC5156:
	.string	"RC1000"
.LC5157:
	.string	"Rasterizer/IBM GT1000 Geometr"
.LC5158:
	.string	"x"
	.align 4
.LC5159:
	.string	"Modem: Intel Corporation 82440MX AC'97 Modem Controller (prog-if 00 [Generic])"
.LC5160:
	.string	"IBM 133"
.LC5161:
	.string	"PCI-X Bridge R1.1"
.LC5162:
	.string	"ServeRAID 4/5"
.LC5163:
	.string	"Morpheus SCSI RAID Controller"
.LC5164:
	.string	"440GP"
.LC5165:
	.string	"PLB to PCI-X Bridge"
.LC5166:
	.string	"440GX"
.LC5167:
	.string	"Embedded PowerPC CPU"
.LC5168:
	.string	"112"
.LC5169:
	.string	"SCSI Storage Controller"
.LC5170:
	.string	"NECSCE 11508082"
	.align 4
.LC5171:
	.string	"IBM SurePOS Riser Card Function 0"
	.align 4
.LC5172:
	.string	"IBM SurePOS Riser Card Function 1 (UARTs)"
.LC5173:
	.string	"PCI-X Host Bridge"
.LC5174:
	.string	"MPIC 2"
	.align 4
.LC5175:
	.string	"IBM Netfinity Advanced System Management Processor"
.LC5176:
	.string	"v7-mpeg modul"
.LC5177:
	.string	"SPEA 3D Accelerator"
.LC5178:
	.string	"sis-648D"
.LC5179:
	.string	"VIA chipset"
.LC5180:
	.string	"8156"
.LC5181:
	.string	"100VG/AnyLAN Adapter"
.LC5182:
	.string	"Altera FLEX"
.LC5183:
	.string	"??? Raid Controller ???"
.LC5184:
	.string	"MegaRAID 428"
	.align 4
.LC5185:
	.string	"Ultra Wide SCSI RAID Controller2"
.LC5186:
	.string	"IDE and SCSI Cntrlr"
.LC5187:
	.string	"I960"
.LC5188:
	.string	"Multimedia card"
.LC5189:
	.string	"MegaRAID 434"
.LC5190:
	.string	"Ultra GT RAID Controller"
.LC5191:
	.string	"MegaRAC"
.LC5192:
	.string	"Athlon 64 / Opteron"
	.align 4
.LC5193:
	.string	"HyperTransport Technology Configuration"
.LC5194:
	.string	"Address Map"
.LC5195:
	.string	"DRAM Controller"
.LC5196:
	.string	"Miscellaneous Control"
.LC5197:
	.string	"Am79C970/1/2/3/5/6"
	.align 4
.LC5198:
	.string	"PCnet LANCE PCI Ethernet Controller"
.LC5199:
	.string	"Am79C978"
	.align 4
.LC5200:
	.string	"PCnet-Home Networking Ctrlr (1/10 Mbps)"
.LC5201:
	.string	"Am1772"
	.align 4
.LC5202:
	.string	"Wireless LAN chipset SMC 2602W V3 http://www.smc.com/index.cfm?event=downloads.doSearchCriteria&loca"
.LC5203:
	.string	"Am53C974"
.LC5204:
	.string	"Am79C974"
.LC5205:
	.string	"Ethernet Controller"
.LC5206:
	.string	"GeodeLX graphics adapter"
.LC5207:
	.string	"GX3"
.LC5208:
	.string	"Geode GX3 AES Crypto Driver"
.LC5209:
	.string	"CS5536"
.LC5210:
	.string	"CS5536 Audio Controller"
	.align 4
.LC5211:
	.string	"CS5536 OHCI USB Host Controller"
	.align 4
.LC5212:
	.string	"CS5536 EHCI USB Host Controller"
.LC5213:
	.string	"Number: CS5536"
.LC5214:
	.string	"CS5536 USB Device Controller"
.LC5215:
	.string	"CS5536 USB OTG Controller"
.LC5216:
	.string	"CS5536 IDE Controller"
.LC5217:
	.string	"SC520"
	.align 4
.LC5218:
	.string	"ELAN Microcontroller PCI Host Bridge"
.LC5219:
	.string	"RV410"
.LC5220:
	.string	"Radeon X700 Pro"
.LC5221:
	.string	"AMD-751"
	.align 4
.LC5222:
	.string	"Processor-to-PCI Bridge / Memory Ctrlr"
	.align 4
.LC5223:
	.string	"AGP and PCI-to-PCI Bridge (1x/2x AGP)"
.LC5224:
	.string	"AMD-IGR4"
.LC5225:
	.string	"AGP Host to PCI Bridge"
.LC5226:
	.string	"AGP PCI to PCI Bridge"
.LC5227:
	.string	"AMD-762"
	.align 4
.LC5228:
	.string	"CPU to PCI Bridge (SMP chipset)"
.LC5229:
	.string	"CPU to PCI Bridge (AGP 4x)"
.LC5230:
	.string	"AMD-761"
.LC5231:
	.string	"North Bridge"
.LC5232:
	.string	"CPU to AGP Bridge  (AGP 4x)"
.LC5233:
	.string	"AMD-755"
.LC5234:
	.string	"Bus Master IDE Controller"
	.align 4
.LC5235:
	.string	"PCI to USB Open Host Controller"
.LC5236:
	.string	"AMD-756"
.LC5237:
	.string	"PCI-ISA Bridge"
.LC5238:
	.string	"AMD-766"
.LC5239:
	.string	"PCI to ISA/LPC Bridge"
.LC5240:
	.string	"Enhanced IDE Controller"
.LC5241:
	.string	"USB OpenHCI Host Controller"
.LC5242:
	.string	"AMD-768"
.LC5243:
	.string	"System Management"
.LC5244:
	.string	"AC97 Audio"
.LC5245:
	.string	"AMD-8131"
.LC5246:
	.string	"PCI-X IOAPIC"
.LC5247:
	.string	"AMD-8151"
.LC5248:
	.string	"AMD-8132"
.LC5249:
	.string	"AMD-8111"
.LC5250:
	.string	"USB 2.0 Controller"
.LC5251:
	.string	"USB Enhanced Host Controller"
.LC5252:
	.string	"UltraATA/133 Controller"
.LC5253:
	.string	"SMBus 2.0 Controller"
.LC5254:
	.string	"c-media cmi8738"
.LC5255:
	.string	" Audio Controller"
.LC5256:
	.string	"AC'97 Modem"
.LC5257:
	.string	"ACPI Controller"
.LC5258:
	.string	"4u"
	.align 4
.LC5259:
	.string	"Used to blow up the motherboard.  Highly explosive.  Use at ur own risk"
.LC5260:
	.string	"82C194"
.LC5261:
	.string	"4DWAVE-DX"
	.align 4
.LC5262:
	.string	"advanced PCI DirectSound accelerator"
.LC5263:
	.string	"4D WAVE DX SOUND ACCELERATOR"
.LC5264:
	.string	"PCI Audio"
.LC5265:
	.string	"Cyber-XP4"
.LC5266:
	.string	"Video Accelerator"
.LC5267:
	.string	"Volari V3"
.LC5268:
	.string	"Video adapter"
.LC5269:
	.string	"CyberBlade i7"
.LC5270:
	.string	"sausgauos"
.LC5271:
	.string	"51331071"
.LC5272:
	.string	"compaq 100"
.LC5273:
	.string	"VT8361"
	.align 4
.LC5274:
	.string	"Via Tech VT8361/VT8601 Graphics Controller"
	.align 4
.LC5275:
	.string	"Trident Video Accelerator CyberBlade i1"
.LC5276:
	.string	"Windows xp"
.LC5277:
	.string	"CyberBlade-i1"
.LC5278:
	.string	"trident"
.LC5279:
	.string	"CyberBlade XP"
.LC5280:
	.string	"zczxzczx"
.LC5281:
	.string	"TGUI9320"
.LC5282:
	.string	"32-bit GUI Accelerator"
.LC5283:
	.string	"TGUI9350"
.LC5284:
	.string	"Flat panel Cntrlr"
.LC5285:
	.string	"Cyber9382"
.LC5286:
	.string	"Cyber9383"
.LC5287:
	.string	"Cyber9385"
.LC5288:
	.string	"Cyber9386"
.LC5289:
	.string	"Cyber9388"
.LC5290:
	.string	"Cyber9397"
.LC5291:
	.string	"Video Accelerator 3D"
.LC5292:
	.string	"Cyber9397DVD"
.LC5293:
	.string	"TGUI9420"
.LC5294:
	.string	"DGi GUI Accelerator"
.LC5295:
	.string	"TGUI9430"
.LC5296:
	.string	"TGUI9682"
.LC5297:
	.string	"DGi GUI Acclerator"
.LC5298:
	.string	"TGUI9460"
.LC5299:
	.string	"TGUI9470"
.LC5300:
	.string	"Cyber9520"
.LC5301:
	.string	"Cyber9525"
.LC5302:
	.string	"Cyber9540"
.LC5303:
	.string	"Video Acclerator"
.LC5304:
	.string	"TGUI9660XGi"
.LC5305:
	.string	"TGUI9680"
.LC5306:
	.string	"Trident A CAB01"
.LC5307:
	.string	"TGUI9683"
.LC5308:
	.string	"ProVIDIA 9685"
.LC5309:
	.string	"2MB VGA"
.LC5310:
	.string	"3DImage 9750 PCI/AGP"
.LC5311:
	.string	"trident dgi"
.LC5312:
	.string	"TGUI9753"
.LC5313:
	.string	"Wave Video Accelerator"
.LC5314:
	.string	"TGUI975?"
.LC5315:
	.string	"Image GUI Accelerator"
.LC5316:
	.string	"TGUI9783"
.LC5317:
	.string	"TGUI9785"
.LC5318:
	.string	"3D Image 9850 AGP"
.LC5319:
	.string	"4mb"
.LC5320:
	.string	"Blade 3D 9880"
.LC5321:
	.string	"gggggg"
.LC5322:
	.string	"00011178"
.LC5323:
	.string	"CyberBlade XPm"
.LC5324:
	.string	"9960"
	.align 4
.LC5325:
	.string	"Trident Video Accelerator CyberBlade-XP2"
.LC5326:
	.string	"AC97 ID:SIL REV:0x27, 08"
.LC5327:
	.string	"Agere Systems soft modem chip"
.LC5328:
	.string	"M1435"
	.align 4
.LC5329:
	.string	"CPU to PCI & PCI to ISA Bridge"
.LC5330:
	.string	"M1445"
.LC5331:
	.string	"VL Bridge & EIDE"
.LC5332:
	.string	"M1449"
.LC5333:
	.string	"M1451"
.LC5334:
	.string	"Pentium Chipset"
.LC5335:
	.string	"M1461"
.LC5336:
	.string	"P54C Chipset"
.LC5337:
	.string	"M1489"
.LC5338:
	.string	"M1511"
.LC5339:
	.string	"M1512"
.LC5340:
	.string	"M1513"
.LC5341:
	.string	"M1521"
.LC5342:
	.string	"M1523"
.LC5343:
	.string	"M1531"
.LC5344:
	.string	"M1533"
.LC5345:
	.string	"ISA South Bridge"
.LC5346:
	.string	"M1535"
.LC5347:
	.string	"PCI South Bridge"
.LC5348:
	.string	"M1541"
	.align 4
.LC5349:
	.string	"AGP PCI North Bridge Aladdin V/V+"
.LC5350:
	.string	"M1542"
.LC5351:
	.string	"AGP+PCI North Bridge"
.LC5352:
	.string	"M1543C"
	.align 4
.LC5353:
	.string	"PCi South Bridge Aladdin IV+/V"
.LC5354:
	.string	"M1561"
.LC5355:
	.string	"M1621"
	.align 4
.LC5356:
	.string	"PCI North Bridge Aladdin Pro II"
.LC5357:
	.string	"M1631"
	.align 4
.LC5358:
	.string	"PCI North Bridge Aladdin Pro III"
.LC5359:
	.string	"M1641"
	.align 4
.LC5360:
	.string	"PCI North Bridge Aladdin Pro IV"
.LC5361:
	.string	"M3141"
.LC5362:
	.string	"M3143"
.LC5363:
	.string	"M3145"
.LC5364:
	.string	"M3147"
.LC5365:
	.string	"M3149"
.LC5366:
	.string	"M3151"
.LC5367:
	.string	"M3307"
.LC5368:
	.string	"MPEG-1 Decoder"
.LC5369:
	.string	"M3309"
.LC5370:
	.string	"MPEG Decoder"
.LC5371:
	.string	"M4803"
.LC5372:
	.string	"M5217"
.LC5373:
	.string	"I/O Controller"
.LC5374:
	.string	"M5219"
.LC5375:
	.string	"M5225"
.LC5376:
	.string	"M5229"
.LC5377:
	.string	"1025"
.LC5378:
	.string	"M5237"
.LC5379:
	.string	"PCI USB Host Controller"
.LC5380:
	.string	"General Purpose Controller"
.LC5381:
	.string	"Floppy Disk Controller"
.LC5382:
	.string	"M5451"
	.align 4
.LC5383:
	.string	"PCI AC-Link Controller Audio Device"
.LC5384:
	.string	"M5453"
	.align 4
.LC5385:
	.string	"M5453 AC-Link Controller Modem Device"
.LC5386:
	.string	"M7101"
	.align 4
.LC5387:
	.string	"PCI PMU Power Management Controller"
.LC5388:
	.string	"PowerEdge 2 /Si"
	.align 4
.LC5389:
	.string	"Expandable RAID Controller (PERC) (SCSI)"
.LC5390:
	.string	"PowerEdge 3/Di"
.LC5391:
	.string	"Expandable RAID Controller"
.LC5392:
	.string	"PowerEdge 3/Si"
.LC5393:
	.string	"Remote Assistant Card"
.LC5394:
	.string	"RAC Virtual UART Port"
.LC5395:
	.string	"53C885 23800 SCSI Adapter"
	.align 4
.LC5396:
	.string	"Embedded Systems Management Device 4"
	.align 4
.LC5397:
	.string	"LSI53C895 PCI to Ultra2 SCSI I/O Processor with LVD Link"
.LC5398:
	.string	"000E"
.LC5399:
	.string	"PERC 4/DI Raid Controller"
.LC5400:
	.string	"DRAC4"
	.align 4
.LC5401:
	.string	"Dell Remote Access Controller v4"
.LC5402:
	.string	"DRAC4-UART"
.LC5403:
	.string	"Dell RAC v4 Virtual UART"
.LC5404:
	.string	"PERC 4e/Si and PERC 4e/Di"
.LC5405:
	.string	"DRAC4-0"
	.align 4
.LC5406:
	.string	"Dell Remote Access Controller subsystem"
.LC5407:
	.string	"PERC 5/i RAID Controller"
.LC5408:
	.string	"Integrated RAID controller"
.LC5409:
	.string	"82545"
.LC5410:
	.string	"Intel Gigabit controller"
.LC5411:
	.string	"DELL PERC 320/DC"
	.align 4
.LC5412:
	.string	"Adaptec 2200S SCSI RAID controller"
.LC5413:
	.string	"FA82537EP"
	.align 4
.LC5414:
	.string	"A Intel 537 epg v.92 modem repackaged by dell"
.LC5415:
	.string	"1078"
	.align 4
.LC5416:
	.string	"Dell PERC 6/i Integrated RAID Controller"
.LC5417:
	.string	"HYDRA"
.LC5418:
	.string	"P5 Chipset"
.LC5419:
	.string	"ASPEN"
.LC5420:
	.string	"i486 Chipset"
.LC5421:
	.string	"P5 CHIPSET"
.LC5422:
	.string	"MGA-I"
.LC5423:
	.string	"Impression?"
.LC5424:
	.string	"chip=0x2539102b"
	.align 4
.LC5425:
	.string	"Matrox P650 very new model (20080724)"
.LC5426:
	.string	"MGA-2164W"
.LC5427:
	.string	"matrox"
.LC5428:
	.string	"MGA-PX2085"
.LC5429:
	.string	"Atlas GUI Accelerator"
.LC5430:
	.string	"MGA-2064W"
.LC5431:
	.string	"Strorm GUI Accelerator"
.LC5432:
	.string	"mga-1164sg-a"
	.align 4
.LC5433:
	.string	"Hurricane/Cyclone 64-bit graphics chip"
.LC5434:
	.string	"MGA-1164SG"
.LC5435:
	.string	"Chinook"
.LC5436:
	.string	"MGA-200B"
.LC5437:
	.string	"Mistral"
.LC5438:
	.string	"Matrox lnc MGA-G200B"
.LC5439:
	.string	"Eclipse/Calao"
.LC5440:
	.string	"G200e"
	.align 4
.LC5441:
	.string	"Matrox G200e (ServerEngines) - English"
.LC5442:
	.string	"MGA G450 Dual Head"
.LC5443:
	.string	"Chip of G450 graphics card"
.LC5444:
	.string	"Parhelia AGP"
.LC5445:
	.string	"Parhelia"
	.align 4
.LC5446:
	.string	"Parhelia 128MB/256MB/PCI/HR256"
.LC5447:
	.string	"Athena GUI accelerator"
.LC5448:
	.string	"MGA-G100"
.LC5449:
	.string	"Twister"
.LC5450:
	.string	"Twister AGP"
.LC5451:
	.string	"Fusion G450 AGP"
.LC5452:
	.string	"Fusion Plus G800 AGP"
.LC5453:
	.string	"GUI+3D Accelerator"
.LC5454:
	.string	"MGA-G550"
.LC5455:
	.string	"AGP Chipset"
.LC5456:
	.string	"Parhelia-LX"
.LC5457:
	.string	"Parhelia Chipset AGP"
	.align 4
.LC5458:
	.string	"Matrox Millennium P650 LP PCIe 64"
.LC5459:
	.string	"Meteor 2 STD/MC/Dig"
.LC5460:
	.string	"Video Capture Card"
.LC5461:
	.string	"MGA-G200E"
.LC5462:
	.string	"Matrox G200e (ServerEngines)"
.LC5463:
	.string	"G450"
.LC5464:
	.string	"G45+"
.LC5465:
	.string	"Shark"
.LC5466:
	.string	"10/100 Multiport Switch NIC"
.LC5467:
	.string	"RT.x10"
.LC5468:
	.string	"RT 2000"
.LC5469:
	.string	"Multimedia device"
.LC5470:
	.string	"64310"
	.align 4
.LC5471:
	.string	"Wingine DGX - DRAM Graphics Accelerator"
.LC5472:
	.string	"69000"
	.align 4
.LC5473:
	.string	"AGP/PCI Flat Panel/CRT VGA Accelerator"
.LC5474:
	.string	"65545"
.LC5475:
	.string	"Flat panel/crt VGA Cntrlr"
.LC5476:
	.string	"65540"
.LC5477:
	.string	"Flat Panel/CRT VGA Controller"
.LC5478:
	.string	"65548"
.LC5479:
	.string	"65550"
.LC5480:
	.string	"LCD/CRT controller"
.LC5481:
	.string	"65554"
	.align 4
.LC5482:
	.string	"Flat Panel/LCD CRT GUI Accelerator"
.LC5483:
	.string	"65555"
.LC5484:
	.string	"VGA GUI Accelerator"
.LC5485:
	.string	"68554"
.LC5486:
	.string	"vga Controller"
.LC5487:
	.string	"graphic driver"
.LC5488:
	.string	"68555"
.LC5489:
	.string	"GUI Controller"
.LC5490:
	.string	"65560"
	.align 4
.LC5491:
	.string	"PCI Flat Panel/CRT VGA Accelerator"
.LC5492:
	.string	"69030"
.LC5493:
	.string	"r4x00"
.LC5494:
	.string	"TX3927"
.LC5495:
	.string	"CPU Bridge?"
.LC5496:
	.string	"Meteor 155"
.LC5497:
	.string	"ATM PCI Adapter"
.LC5498:
	.string	"TC35815CF"
	.align 4
.LC5499:
	.string	"PCI 10/100 Mbit Ethernet Controller"
.LC5500:
	.string	"TX4938"
	.align 4
.LC5501:
	.string	"Integrated 10/100 Mbit Ethernet Controller"
.LC5502:
	.string	"TC86C001FG"
	.align 4
.LC5503:
	.string	"GOKU-S Bus Master IDE Controller"
.LC5504:
	.string	"GOKU-S USB Host Controller"
.LC5505:
	.string	"GOKU-S USB Device Controller"
	.align 4
.LC5506:
	.string	"GOKU-S I2C Bus/SIO/GPIO Controller"
.LC5507:
	.string	"TX4927"
.LC5508:
	.string	"MIPS Processor"
.LC5509:
	.string	"TX4925"
	.align 4
.LC5510:
	.string	"MIPS RISC PCI Controller (PCIC)"
.LC5511:
	.string	"TX4937"
.LC5512:
	.string	"MiroVIDEO DC20"
.LC5513:
	.string	"I/O & JPEG"
.LC5514:
	.string	"2IVDC-PCX1 1250400 033893932"
	.align 4
.LC5515:
	.string	"video in and out with motion jpeg compression and deco"
.LC5516:
	.string	"Media 3D"
.LC5517:
	.string	"MiroVIDEO DC30D"
.LC5518:
	.string	"DC30D-601601-4.0"
.LC5519:
	.string	"upD98409"
.LC5520:
	.string	"PCI to 486 like bus Bridge"
.LC5521:
	.string	"PCI to VL98 Bridge"
.LC5522:
	.string	"R4000"
.LC5523:
	.string	"PCI bus Bridge"
.LC5524:
	.string	"pci 7432"
	.align 4
.LC5525:
	.string	"PCI to 486 like peripheral bus Bridge"
.LC5526:
	.string	"unknown from Creative.com"
.LC5527:
	.string	"PCI to ux-bus Bridge"
	.align 4
.LC5528:
	.string	"GUI Accelerator (vga equivalent)"
.LC5529:
	.string	"graphic Cntrlr for 98"
.LC5530:
	.string	"Nile II"
.LC5531:
	.string	"uPD98405"
	.align 4
.LC5532:
	.string	"NEASCOT-S20 ATM Integrated SAR Ctrlr"
.LC5533:
	.string	"Vrc4373"
.LC5534:
	.string	"Nile I"
.LC5535:
	.string	"PoverVR PCX1"
.LC5536:
	.string	"PoverVR"
.LC5537:
	.string	"NEC D72874GC"
.LC5538:
	.string	"1394 Host Controller"
.LC5539:
	.string	"udp9210"
	.align 4
.LC5540:
	.string	"Dual OHCI controllers plus Single EHCI controller"
.LC5541:
	.string	"uPD98409"
	.align 4
.LC5542:
	.string	"NEASCOT-S40C ATM Light SAR Controller"
.LC5543:
	.string	"uPD66369"
.LC5544:
	.string	"NAPCCARD CardBus Controller"
.LC5545:
	.string	"PoverVR PCX2"
.LC5546:
	.string	"Vrc5074"
.LC5547:
	.string	"Nile 4"
.LC5548:
	.string	"uPD72862"
	.align 4
.LC5549:
	.string	"Firewarden IEEE1394 OHCI Host Controller"
.LC5550:
	.string	"PowerVR Neon 250"
	.align 4
.LC5551:
	.string	"PowerVR series II graphics processor"
.LC5552:
	.string	"56k Voice Modem"
.LC5553:
	.string	"Vrc5476"
.LC5554:
	.string	"VR4122"
.LC5555:
	.string	"64-bit CPU with Northbridge"
.LC5556:
	.string	"uPD72870"
	.align 4
.LC5557:
	.string	"IEEE1394 1-Chip OHCI Host Controller"
.LC5558:
	.string	"uPD72871/2"
.LC5559:
	.string	"uPD720100A"
.LC5560:
	.string	"USB 2.0 Host Controller"
.LC5561:
	.string	"uPD72874"
	.align 4
.LC5562:
	.string	"IEEE1394 OHCI 1.1 2-port PHY-Link Ctrlr"
.LC5563:
	.string	"D72874GC"
	.align 4
.LC5564:
	.string	"IEEE1394+OHCI+1.1+3-port+PHY-Link+Ctrlr"
.LC5565:
	.string	"1394 CARD"
.LC5566:
	.string	"TMC-18C30"
.LC5567:
	.string	"SiS760"
	.align 4
.LC5568:
	.string	"Virtual PCI-to-PCI bridge (AGP)"
.LC5569:
	.string	"520"
	.align 4
.LC5570:
	.string	"Virtual PCI to PCI Bridge (AGP)"
.LC5571:
	.string	"Pentium chipset"
.LC5572:
	.string	"SiS 85C501"
	.align 4
.LC5573:
	.string	"PCI/ISA Cache Memory Controller (PCMC)"
.LC5574:
	.string	"SiS 85C503"
.LC5575:
	.string	"PCI System I/O (PSIO)"
.LC5576:
	.string	"5595"
.LC5577:
	.string	"SIS PMU device"
.LC5578:
	.string	"SiS740"
.LC5579:
	.string	"SiS950"
.LC5580:
	.string	"vga"
.LC5581:
	.string	"SiS160"
	.align 4
.LC5582:
	.string	"SiS160 811 Wireless LAN Adapter"
.LC5583:
	.string	"SiS180"
.LC5584:
	.string	"Raid Controller(?Mode Raid0)"
.LC5585:
	.string	"Raid Controller(?Mode Raid1)"
	.align 4
.LC5586:
	.string	"Raid Controller(?Mode Raid0+1)"
.LC5587:
	.string	"?SIS965"
.LC5588:
	.string	"?SATA"
	.align 4
.LC5589:
	.string	" SiS966L, SiS965L, SiS966, SiS965, SiS968"
.LC5590:
	.string	"SiS LAN Ethernet"
.LC5591:
	.string	"SIS191"
.LC5592:
	.string	"SiS5597/98"
.LC5593:
	.string	"Onboard Graphics Controller"
.LC5594:
	.string	"SiS 6215"
.LC5595:
	.string	"PCI1"
.LC5596:
	.string	"SiS 6205"
	.align 4
.LC5597:
	.string	"PCI Graphics & Video Accelerator"
.LC5598:
	.string	"SiS330"
.LC5599:
	.string	"GUI Accelerator+3D"
.LC5600:
	.string	"SiS305"
.LC5601:
	.string	"2D/3D/Video/DVD Accelerator"
.LC5602:
	.string	"SiS 315"
.LC5603:
	.string	"2D/3D Accelerator"
.LC5604:
	.string	"SiS6330"
	.align 4
.LC5605:
	.string	"Silicon Integrated Systems (SiS)"
.LC5606:
	.string	"Xabre 2D/3D Accelerator"
.LC5607:
	.string	"85C501"
.LC5608:
	.string	"85C496"
.LC5609:
	.string	"SiS530"
.LC5610:
	.string	"Host-to-PCI bridge"
.LC5611:
	.string	"SiS540"
.LC5612:
	.string	"SiS550/1/2"
.LC5613:
	.string	"SiS596"
.LC5614:
	.string	"Pentium PCI chipset with IDE"
.LC5615:
	.string	"SiS5513"
.LC5616:
	.string	"EIDE Controller (step C)"
.LC5617:
	.string	"SiS83C601"
.LC5618:
	.string	"PCI EIDE Controller"
.LC5619:
	.string	"SiS620"
.LC5620:
	.string	"SiS630"
.LC5621:
	.string	"SiS 635"
.LC5622:
	.string	"SiS 640"
.LC5623:
	.string	"SiS 645"
.LC5624:
	.string	"SiS645DX"
.LC5625:
	.string	"SiS648MX"
.LC5626:
	.string	"sis649"
.LC5627:
	.string	"SiS961"
.LC5628:
	.string	"SiS651"
.LC5629:
	.string	"SiS655"
.LC5630:
	.string	"SiS R658"
.LC5631:
	.string	"SiS R659"
.LC5632:
	.string	"SiS 661FX"
.LC5633:
	.string	"SiS 730"
.LC5634:
	.string	"SiS 735"
.LC5635:
	.string	"SiS 740"
.LC5636:
	.string	"SiS741"
.LC5637:
	.string	"SiS745"
.LC5638:
	.string	"SiS746"
.LC5639:
	.string	"SiS748"
.LC5640:
	.string	"SiSM650?"
.LC5641:
	.string	"SiS755FX"
.LC5642:
	.string	"Athlon 64 CPU to PCI Bridge"
.LC5643:
	.string	"88e8056"
.LC5644:
	.string	"SiS 900"
.LC5645:
	.string	"sis 900 and integrated lan"
.LC5646:
	.string	"Device ID = 0900 SiS900"
	.align 4
.LC5647:
	.string	"SiS900 10/100 Ethernet Adapter"
.LC5648:
	.string	"SiS962"
.LC5649:
	.string	"SiS963"
.LC5650:
	.string	"SiS964"
.LC5651:
	.string	"sis950"
	.align 4
.LC5652:
	.string	"pci\013en_1039&subsys_200b163&rev_a0\003&61aaa01"
	.string	"&17"
.LC5653:
	.string	"SiS5597"
.LC5654:
	.string	"SiS5597 SVGA"
.LC5655:
	.string	"Raid Controller(?Mode Raid5)"
.LC5656:
	.string	"?SIS966/968 "
	.align 4
.LC5657:
	.string	"SIS966(AHCI)&#12289;SIS968(RAID)"
.LC5658:
	.string	"Raid/AHCI Controller"
.LC5659:
	.string	"SIS968"
.LC5660:
	.string	"SiS83C602"
.LC5661:
	.string	"SiS5107"
.LC5662:
	.string	"Hot Docking Controller"
.LC5663:
	.string	"AGP"
.LC5664:
	.string	"SiS530/1/2"
.LC5665:
	.string	"SiS5401"
.LC5666:
	.string	"486 PCI Chipset"
.LC5667:
	.string	"SiS5511/5512"
	.align 4
.LC5668:
	.string	"PCI/ISA System Memory Controller"
.LC5669:
	.string	"All SIS SouthBridge"
.LC5670:
	.string	"SiS5517"
.LC5671:
	.string	"SiS5518"
.LC5672:
	.string	"UDMA IDE Controller"
.LC5673:
	.string	"SiS5571"
.LC5674:
	.string	"Memory/PCI bridge"
.LC5675:
	.string	"SiS 5581"
.LC5676:
	.string	"p5 chipset"
.LC5677:
	.string	"SiS5582"
.LC5678:
	.string	"MTC0001"
.LC5679:
	.string	"PCI /ven_1039"
.LC5680:
	.string	"SiS5596"
.LC5681:
	.string	"PCI, Memory & VGA Controller"
.LC5682:
	.string	"Host to PCI bridge"
.LC5683:
	.string	"SiS600"
.LC5684:
	.string	"SiS6204"
.LC5685:
	.string	"video decoder/mpeg interface"
.LC5686:
	.string	"SiS6206"
.LC5687:
	.string	"PCI VGA Controller"
.LC5688:
	.string	"SiS 950 m2284dxs"
.LC5689:
	.string	"SiS6236"
.LC5690:
	.string	"Graphics"
.LC5691:
	.string	"SiS630/730"
.LC5692:
	.string	"SiS530/620"
	.align 4
.LC5693:
	.string	"Integrated 3D  SVGA Controller"
.LC5694:
	.string	"VEN_1039&DEV_6325"
	.align 4
.LC5695:
	.string	"Sis 650  Integrated GFX Controller  (IGP)"
.LC5696:
	.string	"1039"
.LC5697:
	.string	"sis 6326 AGP"
	.align 4
.LC5698:
	.string	"SiS661FX/M661FX/760/741/M760/M741"
.LC5699:
	.string	"GUI 2D/3D Accelerator"
.LC5700:
	.string	"SiS7001"
	.align 4
.LC5701:
	.string	"USB 2.0 Enhanced Host Controller"
.LC5702:
	.string	"SiS551/2"
.LC5703:
	.string	"Memory Stick Controller"
	.align 4
.LC5704:
	.string	"OHCI Compliant FireWire Controller"
.LC5705:
	.string	"SiS7012"
.LC5706:
	.string	"PCI Audio Accelerator"
.LC5707:
	.string	"SiS7013"
.LC5708:
	.string	"Smart Link 56K Voice Modem"
.LC5709:
	.string	"SiS550 dd"
.LC5710:
	.string	"Software Audio dd"
.LC5711:
	.string	"SiS7016"
.LC5712:
	.string	"10/100 Ethernet Adapter"
.LC5713:
	.string	"SiS7018"
	.align 4
.LC5714:
	.string	"AC97(CMI973X) or AMR Voice Modem Wave(7018M)"
.LC5715:
	.string	"Hardware Audio"
.LC5716:
	.string	"649"
.LC5717:
	.string	"sis6215"
	.align 4
.LC5718:
	.string	"pci vga card for winxp & win2k"
.LC5719:
	.string	"Standard Vista USB Keyboard"
.LC5720:
	.string	"A4977A"
.LC5721:
	.string	"Visialize EG"
.LC5722:
	.string	"Donner GFX"
.LC5723:
	.string	"001"
.LC5724:
	.string	"hpVisualizeFX"
	.align 4
.LC5725:
	.string	"Hewlett-Packard VisualizeFX Series Video"
	.align 4
.LC5726:
	.string	"Tachyon TL Fibre Channel Adapter"
.LC5727:
	.string	"HPFC-5200B"
	.align 4
.LC5728:
	.string	"Tachyon XL2 Fibre Channel Adapter"
.LC5729:
	.string	"Tach TS"
	.align 4
.LC5730:
	.string	"Tachyon TS Fibre Channel Host Adapter"
.LC5731:
	.string	"J2585A"
	.align 4
.LC5732:
	.string	"DeskDirect 10/100VG LAN Adapter"
.LC5733:
	.string	"J2585B222"
.LC5734:
	.string	"DeskDirect 10/100 NIC"
.LC5735:
	.string	"J2973A"
.LC5736:
	.string	"DeskDirect 10BaseT NIC"
.LC5737:
	.string	"J2585B"
.LC5738:
	.string	"DeskDirect 10/100VG NIC"
.LC5739:
	.string	"J2970A"
.LC5740:
	.string	"DeskDirect 10BaseT/2 NIC"
.LC5741:
	.string	"SAS"
.LC5742:
	.string	"DIVA1"
.LC5743:
	.string	"DIVA2"
.LC5744:
	.string	"SP2"
.LC5745:
	.string	"J3242A"
.LC5746:
	.string	"EL-10 Ethernet Adapter"
.LC5747:
	.string	"79C970"
.LC5748:
	.string	"PCnet Ethernet Controller"
.LC5749:
	.string	"NetServer Smart IRQ Router"
.LC5750:
	.string	"TopTools"
.LC5751:
	.string	"82557B"
.LC5752:
	.string	"10/100 NIC"
	.align 4
.LC5753:
	.string	"NetServer PCI Hot-Plug Controller"
.LC5754:
	.string	"NetServer SMIC Controller"
	.align 4
.LC5755:
	.string	"NetServer Legacy COM Port Decoder"
	.align 4
.LC5756:
	.string	"NetServer PCI COM Port Decoder"
.LC5757:
	.string	"zx1"
.LC5758:
	.string	"System Bus Adapter"
.LC5759:
	.string	"Local Bus Adapter"
.LC5760:
	.string	"Broadcom BCM4306"
	.align 4
.LC5761:
	.string	"Broadcom Wireless miniPCI in a HP laptop"
.LC5762:
	.string	"3G Broadband device"
.LC5763:
	.string	"E2910A"
.LC5764:
	.string	"PCI Bus Exerciser"
.LC5765:
	.string	"Fast Host Interface"
.LC5766:
	.string	"E2924A"
.LC5767:
	.string	"PCI Host Interface Adapter"
.LC5768:
	.string	"E2925A"
	.align 4
.LC5769:
	.string	"32 bit PCI Bus Exerciser and Analyzer"
.LC5770:
	.string	"E2926A"
	.align 4
.LC5771:
	.string	"64 bit PCI Bus Exerciser and Analyzer"
.LC5772:
	.string	"E2927A"
	.align 4
.LC5773:
	.string	"64 Bit, 66/50MHz PCI Analyzer & Exerciser"
.LC5774:
	.string	"E2940A"
	.align 4
.LC5775:
	.string	"64 bit, 66/50MHz CompactPCI Analyzer&Exerciser"
	.align 4
.LC5776:
	.string	"Adaptec Embedded Serial ATA HostRAID"
.LC5777:
	.string	"not sure"
.LC5778:
	.string	"P600"
	.align 4
.LC5779:
	.string	"P600 SmartArray Raid Controller"
.LC5780:
	.string	"Smart Array P400 Controller"
.LC5781:
	.string	"3305103C"
	.align 4
.LC5782:
	.string	"HP integrated Module with Bluetooth 2.0 Wireless support"
.LC5783:
	.string	"6600"
.LC5784:
	.string	"Cologne Chip"
.LC5785:
	.string	"M26-X"
	.align 4
.LC5786:
	.string	"ATI Radeon Graphics Processor x700 Mobility [M26-X]"
.LC5787:
	.string	"Domino"
.LC5788:
	.string	"RAID Engine"
.LC5789:
	.string	"2124A/9X"
	.align 4
.LC5790:
	.string	"SmartCache III/RAID SCSI Controller"
.LC5791:
	.string	"I2O SmartRAID V Controller"
.LC5792:
	.string	"Raptor"
.LC5793:
	.string	"SmartRAID Controller"
.LC5794:
	.string	"82C750"
.LC5795:
	.string	"PCI USB Controller"
.LC5796:
	.string	"82C264"
.LC5797:
	.string	"82C178"
.LC5798:
	.string	"pci usb card 2- port"
.LC5799:
	.string	"82C556"
.LC5800:
	.string	"Viper"
.LC5801:
	.string	"82C557"
.LC5802:
	.string	"CPU Bridge (Viper)"
.LC5803:
	.string	"82C558"
.LC5804:
	.string	"Vendetta chipset: host bridge"
.LC5805:
	.string	"Vendetta chipset: ISA bridge"
.LC5806:
	.string	"82C579"
.LC5807:
	.string	"Pentium to PCI Bridge"
.LC5808:
	.string	"82C621"
.LC5809:
	.string	"PCI IDE Controller (PIC)"
.LC5810:
	.string	"82C700"
	.align 4
.LC5811:
	.string	"82C700 FireStar PCI to ISA Bridge"
.LC5812:
	.string	"82C701"
	.align 4
.LC5813:
	.string	"FireStar mobile chipset: host bridge"
.LC5814:
	.string	"82C814"
	.align 4
.LC5815:
	.string	"FireBridge II Docking Station Controller"
.LC5816:
	.string	"82C822"
	.align 4
.LC5817:
	.string	"CPU to PCI & PCI to ISA PnP bridge"
.LC5818:
	.string	"82C824"
	.align 4
.LC5819:
	.string	"FireFox 32-Bit PC Card Controller"
.LC5820:
	.string	"82C825 function 0"
.LC5821:
	.string	"PCI-to-ISA Bridge"
.LC5822:
	.string	"82C832"
	.align 4
.LC5823:
	.string	"CPU-to-PCI and PCI-to-ISA Bridge"
.LC5824:
	.string	"82C861"
	.align 4
.LC5825:
	.string	"FireLink PCI-to- 5 x USB Bridge( usb1.1 )"
.LC5826:
	.string	"82C881"
	.align 4
.LC5827:
	.string	"FireLink 1394 OHCI Link Controller"
.LC5828:
	.string	"82C895"
.LC5829:
	.string	"82C931"
	.align 4
.LC5830:
	.string	"ISA Sound & Game Port controller."
.LC5831:
	.string	"82C935"
	.align 4
.LC5832:
	.string	"MachOne integrated PCI audio processor"
.LC5833:
	.string	"82C825"
.LC5834:
	.string	"PCI bus master IDE controller"
.LC5835:
	.string	"Ultra DMA IDE controller"
.LC5836:
	.string	"0x0c92"
.LC5837:
	.string	"ELSA GLADIAC 528"
.LC5838:
	.string	"Elsa Gladiac MX"
.LC5839:
	.string	"NVidia Geforce 2 MX"
.LC5840:
	.string	"Elsa Gladiac 721"
.LC5841:
	.string	"NVidia GeForce3 Ti 200"
.LC5842:
	.string	"Quick Step 1000"
.LC5843:
	.string	"QuickStep 3000"
.LC5844:
	.string	"ELSA GLoria XL"
.LC5845:
	.string	"STG 2000X"
.LC5846:
	.string	"diamond"
.LC5847:
	.string	"STG 1764X"
.LC5848:
	.string	"STG4000"
	.align 4
.LC5849:
	.string	"PowerVR KYRO series 3 graphics processor"
.LC5850:
	.string	"STPC Consmr/Indstrl"
.LC5851:
	.string	"North/South Bridges"
.LC5852:
	.string	"STPC Atlas/Elite"
.LC5853:
	.string	"STPC Atlas"
.LC5854:
	.string	"STPC Consmr-S/Elite"
.LC5855:
	.string	"STPC Consumer-II"
.LC5856:
	.string	"ST70137"
.LC5857:
	.string	"ADSL"
.LC5858:
	.string	"STG 1746X"
.LC5859:
	.string	"STE10/100A"
	.align 4
.LC5860:
	.string	"PCI 10/100 Ethernet Controller"
.LC5861:
	.string	"MPEG-II Video Decoder"
.LC5862:
	.string	"4610,4515,4610fm"
.LC5863:
	.string	"device"
.LC5864:
	.string	"TNETE100A/110A/211"
	.align 4
.LC5865:
	.string	"ThunderLAN 100 Mbit LAN Controller"
.LC5866:
	.string	"TI380PCI"
	.align 4
.LC5867:
	.string	"PCI interface for TI380 compressors"
.LC5868:
	.string	"TI PCI Eagle i/f AS"
.LC5869:
	.string	"PCI104c"
.LC5870:
	.string	"\004&2FA23535&0&0DF0"
.LC5871:
	.string	"TVP4010"
.LC5872:
	.string	"TVP4020"
.LC5873:
	.string	"AGP Permedia 2"
.LC5874:
	.string	"TSB12LV21"
	.align 4
.LC5875:
	.string	"LYNX IEEE1394 FireWire Host Controller"
.LC5876:
	.string	"TSB12LV22"
	.align 4
.LC5877:
	.string	"OHCI-Lynx PCI IEEE 1394 Host Controller"
.LC5878:
	.string	"TSB12LV26"
	.align 4
.LC5879:
	.string	"OHCI-Lynx IEEE 1394 Host Controller"
.LC5880:
	.string	"PCI4450"
	.align 4
.LC5881:
	.string	"OHCI-Lynx IEEE 1394 Controller"
.LC5882:
	.string	"PCI4410"
.LC5883:
	.string	"TSB12LV23"
.LC5884:
	.string	"TSB43AA22xxx"
	.align 4
.LC5885:
	.string	"1394a-2000 OHCI PHY/Link Layer Ctrlr xxx"
.LC5886:
	.string	"TSB43AB21/A"
	.align 4
.LC5887:
	.string	"IEEE1394a-2000 OHCI PHY/Link-Layer Ctrlr"
.LC5888:
	.string	"TSB43AB23"
	.align 4
.LC5889:
	.string	"1394a-2000 OHCI PHY/Link Layer Ctrl"
.LC5890:
	.string	"TSB82AA2"
	.align 4
.LC5891:
	.string	"1394b OHCI-Lynx IEEE 1394 Host Controller"
.LC5892:
	.string	"TSB43AB21"
	.align 4
.LC5893:
	.string	"1394a-2000 OHCI PHY/Link Layer Ctrlr"
.LC5894:
	.string	"PCI4451"
.LC5895:
	.string	"040803-2158"
	.align 4
.LC5896:
	.string	"OHCI Compliant IEEE-1394 FireWire Controller"
.LC5897:
	.string	"PCI7420"
	.align 4
.LC5898:
	.string	"1394a-2000 OHCI Two-Port PHY/Link-Layer Controller"
.LC5899:
	.string	"PCIxx21"
	.align 4
.LC5900:
	.string	"Integrated FlashMedia Controller"
.LC5901:
	.string	"10981734"
	.align 4
.LC5902:
	.string	"PCI GemCore based SmartCard controller"
.LC5903:
	.string	"PCI6515"
	.align 4
.LC5904:
	.string	"Texas Instruments PCIxxx12 Cardbus Controller"
.LC5905:
	.string	"ff101179"
	.align 4
.LC5906:
	.string	"Texas Instruments PCI GemCore SmartCard"
.LC5907:
	.string	"PCIxx12"
	.align 4
.LC5908:
	.string	"OHCI Compliant IEEE 1394 Host controller"
	.align 4
.LC5909:
	.string	"PCIxx12 VEN_104C&DEV_803B&SUBSYS_0753152D&REV_00\004"
	.align 4
.LC5910:
	.string	"Integrated Flash Media Controller"
	.align 4
.LC5911:
	.string	"Texas Instruments PCI GemCore based SmartCard controller"
.LC5912:
	.string	"iRDA Compatible Controller"
.LC5913:
	.string	"006D103C"
	.align 4
.LC5914:
	.string	"TI UltraMedia Firmware Loader Device"
.LC5915:
	.string	"4610, 4515, 4610FM, 7510"
	.align 4
.LC5916:
	.string	"PCI 7510/4510 Cardbus Controller"
.LC5917:
	.string	"XIO2000A"
	.align 4
.LC5918:
	.string	"PCI-Express to PCI/PCI-X bridge"
.LC5919:
	.string	"ACX100AGHK"
	.align 4
.LC5920:
	.string	"D-Link AirPlus DWL-520+, Uses a TI 802.11b 22 MBPS Chip"
.LC5921:
	.string	"bogus"
.LC5922:
	.string	"TMX320C6412"
	.align 4
.LC5923:
	.string	"Fixed Point Digital Signal Processor"
.LC5924:
	.string	"USR5410"
	.align 4
.LC5925:
	.string	"U.S. Robotics 802.11g Wireless Turbo PC Card "
.LC5926:
	.string	"TDC1570"
.LC5927:
	.string	"64-bit PCI ATM SAR"
.LC5928:
	.string	"TDC1561"
.LC5929:
	.string	"32-bit PCI ATM SAR"
.LC5930:
	.string	"TNETA1575"
	.align 4
.LC5931:
	.string	"HyperSAR Plus w/PCI host & UTOPIA i/f"
.LC5932:
	.string	"TMS320C6205"
.LC5933:
	.string	"TMS320C6416T"
.LC5934:
	.string	"TI C6416T DSP"
.LC5935:
	.string	"PCI2050BPDV"
.LC5936:
	.string	"PCI1050"
.LC5937:
	.string	"PC Card Controller"
.LC5938:
	.string	"PCI1030/1053"
.LC5939:
	.string	"PCI1130"
.LC5940:
	.string	"PC card CardBus Controller"
.LC5941:
	.string	"PCI9440"
	.align 4
.LC5942:
	.string	"PCIVEN_104C&DEV_803B&SUBSYS_30AA103C&REV_004&33F64D4&0&32F0 "
.LC5943:
	.string	"PCI-1131"
.LC5944:
	.string	"PCI1250"
.LC5945:
	.string	"PC Card CardBus Controller"
.LC5946:
	.string	"PCI1220"
.LC5947:
	.string	"PCI1260"
.LC5948:
	.string	"PCI1221"
.LC5949:
	.string	"PCI1210"
.LC5950:
	.string	"PCI1450"
.LC5951:
	.string	"PCI1211"
.LC5952:
	.string	"PCI To PCMCIA  bridge"
.LC5953:
	.string	"PCI1251B"
.LC5954:
	.string	"PCI2030"
.LC5955:
	.string	"PCI2031"
.LC5956:
	.string	"PCI2032"
.LC5957:
	.string	"PCI2250"
.LC5958:
	.string	"PCI2050/2050I"
.LC5959:
	.string	"PCI4550"
.LC5960:
	.string	"PCI4510SDFSDFSD"
	.align 4
.LC5961:
	.string	"PC Card Controller SDFSDAFSADFSDAFSDAF"
.LC5962:
	.string	"PCI4520"
.LC5963:
	.string	"PCCard CardBus Controller"
.LC5964:
	.string	"7510/4510"
.LC5965:
	.string	"Cardbus"
.LC5966:
	.string	"PCI1410"
.LC5967:
	.string	"PC card cardBus Controller"
.LC5968:
	.string	"PCI-1420"
.LC5969:
	.string	"Texas Instruments 1420"
.LC5970:
	.string	"PCI1451"
.LC5971:
	.string	"PCI1421"
	.align 4
.LC5972:
	.string	"PC card CardBus Controller - 5-in-1 Media Card Reader"
.LC5973:
	.string	"PCI-1510"
	.align 4
.LC5974:
	.string	"PCCard CardBus Controller w/UltraMedia"
.LC5975:
	.string	"PCI1520"
.LC5976:
	.string	"PCI1510"
.LC5977:
	.string	"PCI1530"
.LC5978:
	.string	"PCI1515"
.LC5979:
	.string	"PCI1620"
.LC5980:
	.string	"PCI1610"
.LC5981:
	.string	"PCI2040 PCI to DSP Bridge"
.LC5982:
	.string	"7420"
.LC5983:
	.string	"FlashMedia"
.LC5984:
	.string	"TMS320C645x"
.LC5985:
	.string	"Device ID: 0xB001 "
.LC5986:
	.string	"TMS320DM647-DM648"
	.align 4
.LC5987:
	.string	"DSP with a C64x+ core and M/S PCI interface"
.LC5988:
	.string	"tsb12lv26"
.LC5989:
	.string	"FireWire Host Controller"
.LC5990:
	.string	"12C01A"
.LC5991:
	.string	"CXD1947"
	.align 4
.LC5992:
	.string	"i.LINK FireWire PCI Host Controller"
.LC5993:
	.string	"CXD3222"
	.align 4
.LC5994:
	.string	"OHCI i.LINK (IEEE 1394) PCI Host Ctrlr"
.LC5995:
	.string	"0x127a"
.LC5996:
	.string	"Rockwell HCF 56K Modem"
.LC5997:
	.string	"Qc pass"
.LC5998:
	.string	"OTI-64017"
.LC5999:
	.string	"OTI107"
.LC6000:
	.string	"Spitfire VGA Accelerator"
.LC6001:
	.string	"Video Adapter"
.LC6002:
	.string	"OTI-64217"
.LC6003:
	.string	"OTI-64317"
.LC6004:
	.string	"OTI-610"
.LC6005:
	.string	"T9732"
.LC6006:
	.string	"iatca8262"
.LC6007:
	.string	"Multi I/O"
.LC6008:
	.string	"W6692/92A/92CF"
.LC6009:
	.string	"PCI BusISDN S/T-Controller"
.LC6010:
	.string	"004005-34c8c8"
	.align 4
.LC6011:
	.string	"Ethernet Controller (NE2000 compatible)"
.LC6012:
	.string	"W83769F"
.LC6013:
	.string	"PCI/IDE controller"
.LC6014:
	.string	"W89C33"
	.align 4
.LC6015:
	.string	"Winbond W89C33 mPCI 802.11 Wireless LAN Adapter"
.LC6016:
	.string	"W82C105"
.LC6017:
	.string	"W83628F/629D"
.LC6018:
	.string	"PCI to ISA Bridge Set"
.LC6019:
	.string	"W89C840F"
	.align 4
.LC6020:
	.string	"100/10Mbps Ethernet Controller"
.LC6021:
	.string	"w89c940f"
.LC6022:
	.string	"winbond pci ethernet"
.LC6023:
	.string	"W99200aF"
.LC6024:
	.string	"Video capture card mpeg-1"
.LC6025:
	.string	"W89C940F"
	.align 4
.LC6026:
	.string	"ELANC-PCI Twisted-pair Ether-LAN Ctrlr"
.LC6027:
	.string	"W6692CF"
.LC6028:
	.string	"W99200AF"
.LC6029:
	.string	"MPEG1 capture card"
.LC6030:
	.string	"W9922PF"
.LC6031:
	.string	"MPEG-1/2 Decoder"
.LC6032:
	.string	"W9960CF"
.LC6033:
	.string	"W9961CF"
.LC6034:
	.string	"H.263/H.261 Video Codec"
.LC6035:
	.string	"W9970CF"
.LC6036:
	.string	"VGA controller"
.LC6037:
	.string	"W9971CF"
.LC6038:
	.string	"Motorola MC145575"
.LC6039:
	.string	"PCI bus Cntrlr"
.LC6040:
	.string	"SH7751"
	.align 4
.LC6041:
	.string	"SuperH (SH) 32-Bit RISC MCU/MPU Series"
.LC6042:
	.string	"EFAR 486 host Bridge"
.LC6043:
	.string	"Pentium/p54c host Bridge"
	.align 4
.LC6044:
	.string	"I don\357\277\275t know pentium 133 intel   everex setpnot mx"
.LC6045:
	.string	"SLC90E66"
.LC6046:
	.string	"Ultra ATA/66 IDE Controller"
.LC6047:
	.string	"Victory66 PCI to ISA Bridge"
	.align 4
.LC6048:
	.string	"Victory66 UDMA EIDE Controller"
.LC6049:
	.string	"Victory66 USB Host Controller"
	.align 4
.LC6050:
	.string	"Victory66 Power Management Controller"
.LC6051:
	.string	"LAN9420/LAN9420i"
	.align 4
.LC6052:
	.string	"PCI 10/100 Ethernet controller"
.LC6053:
	.string	"52-6116-2A"
	.align 4
.LC6054:
	.string	"Motorola FM 56 PCI Speakerphone Modem"
.LC6055:
	.string	"MPC105"
	.align 4
.LC6056:
	.string	"PCI Bridge / Memory Controller (PCIB/MC)"
.LC6057:
	.string	"MPC106"
	.align 4
.LC6058:
	.string	"PCI Bridge/Memory Controller (PCIB/MC)"
.LC6059:
	.string	"MPC8240"
.LC6060:
	.string	"Integrated Processor"
.LC6061:
	.string	"MPC107"
	.align 4
.LC6062:
	.string	"PCI Bridge/Memory Controller for PPC"
.LC6063:
	.string	"MPC8245"
.LC6064:
	.string	"MC145575"
.LC6065:
	.string	"HCF-PCI"
.LC6066:
	.string	"KTI829c"
.LC6067:
	.string	"100VG Ethernet Controller"
.LC6068:
	.string	"DSP56301"
	.align 4
.LC6069:
	.string	"24-bit Digital Signal Processor"
.LC6070:
	.string	"DSP56305"
	.align 4
.LC6071:
	.string	"24-Bit Digital Signal Processor"
.LC6072:
	.string	"MPC8265A/66"
.LC6073:
	.string	"PowerQUICC II PCI Bridge"
.LC6074:
	.string	"0644dfea15"
.LC6075:
	.string	"MotorolaSM56Modem"
.LC6076:
	.string	"SM56"
.LC6077:
	.string	"Motorola SM56 Data Fax Modem"
	.align 4
.LC6078:
	.string	"HDAUDIOFUNC_02&VEN_1057&DEV_3057&SUBSYS_00010001&"
.LC6079:
	.string	"56IVMR/Phoenix 56ISM"
.LC6080:
	.string	"Modem"
.LC6081:
	.string	"Raven"
.LC6082:
	.string	"PowerPC Chipset"
.LC6083:
	.string	"Falcon"
.LC6084:
	.string	"memory control chipset"
.LC6085:
	.string	"Hawk"
.LC6086:
	.string	"CPX8216"
.LC6087:
	.string	"CPX8216T"
.LC6088:
	.string	"HotSwap Controller"
.LC6089:
	.string	"WDM MOT8888"
	.align 4
.LC6090:
	.string	"SM 56 PCI Speakerphone/Data,Fax  Modem"
.LC6091:
	.string	"PCI Modem"
.LC6092:
	.string	"52-6116-2A 21-864-4"
.LC6093:
	.string	"PCI Fax Voice Modem"
.LC6094:
	.string	"MPC5200"
	.align 4
.LC6095:
	.string	"32-Bit Embedded PowerPC Processor"
.LC6096:
	.string	"MPC190"
.LC6097:
	.string	"Security Co-Processor"
.LC6098:
	.string	"PDC20265/R"
	.align 4
.LC6099:
	.string	"MBUltra100/MBFastTrack100 Lite"
.LC6100:
	.string	"PDC20263"
	.align 4
.LC6101:
	.string	"FastTrak66 Lite EIDE Controller"
.LC6102:
	.string	"PDC20275"
.LC6103:
	.string	"MBUltra133"
.LC6104:
	.string	"SuperTrak 66/100 RAID"
.LC6105:
	.string	"SuperTrak SX 6000"
.LC6106:
	.string	"PDC20318"
.LC6107:
	.string	"SATA150 TX4"
.LC6108:
	.string	"PDC20319"
.LC6109:
	.string	"FastTrak S150 TX4"
.LC6110:
	.string	"PDC20371?"
.LC6111:
	.string	"FastTrak S150 TX2+"
.LC6112:
	.string	"PDC20378"
	.align 4
.LC6113:
	.string	"FastTrak 378/SATA 378 RAID Controller"
.LC6114:
	.string	"PDC20375"
.LC6115:
	.string	"SATA150 TX2+"
.LC6116:
	.string	"PDC20376"
.LC6117:
	.string	"FastTrak 376 Controller"
.LC6118:
	.string	"PDC40719"
.LC6119:
	.string	"FastTrak TX43xx"
.LC6120:
	.string	"PDC40519"
.LC6121:
	.string	"FastTrak TX42xx"
.LC6122:
	.string	"PDC20771"
	.align 4
.LC6123:
	.string	"FastTrak TX2300 SATA300 Controller"
.LC6124:
	.string	"PDC20571"
.LC6125:
	.string	"Fasttrack TX2200"
.LC6126:
	.string	"PDC20579"
.LC6127:
	.string	"SATAII 150 579"
.LC6128:
	.string	"PDC40718-GP"
.LC6129:
	.string	"SATA 300 TX4 Controller"
.LC6130:
	.string	"PDC20518/40518"
.LC6131:
	.string	"SATAII 150TX2+"
.LC6132:
	.string	"PDC40775"
.LC6133:
	.string	"SATAII 300 TX2+"
.LC6134:
	.string	"FastTrak TX2650/4650/4652"
.LC6135:
	.string	"PDC42819"
	.align 4
.LC6136:
	.string	"FastTrak TX2650(3F21)/4650(3F22)/PDC42819(3716)"
.LC6137:
	.string	"SuperTrak EX 43X0"
.LC6138:
	.string	"PDC20267"
	.align 4
.LC6139:
	.string	"FastTrack100 on Intel MB SE7500CW2"
.LC6140:
	.string	"PDC20246"
	.align 4
.LC6141:
	.string	"FastTrak/Ultra33 ATA RAID controller"
.LC6142:
	.string	"PDC20262"
.LC6143:
	.string	"Ultra66/FastTrak66"
.LC6144:
	.string	"PDC20268/R"
.LC6145:
	.string	"Ultra100TX2/FastTrak100TX/LP"
.LC6146:
	.string	"PDC20269"
.LC6147:
	.string	"Ultra133TX2"
.LC6148:
	.string	"PDC20276"
.LC6149:
	.string	"MBUltra133/MBFastTrack133"
.LC6150:
	.string	"DC5300"
.LC6151:
	.string	"PDC20270"
.LC6152:
	.string	"FastTrak100 TX2/TX4/LP"
.LC6153:
	.string	"PDC20271"
	.align 4
.LC6154:
	.string	"FastTrak TX2000 EIDE controller"
.LC6155:
	.string	"FastTrak SX 8300"
.LC6156:
	.string	"FastTrak SX8300-1"
.LC6157:
	.string	"FastTrak SX 4300"
.LC6158:
	.string	"FastTrak SX 4300-1"
.LC6159:
	.string	"FastTrak SX8300-2"
.LC6160:
	.string	"FastTrak SX8300-3"
.LC6161:
	.string	"FastTrak SX 4300-2"
.LC6162:
	.string	"FastTrak SX 4300-3"
.LC6163:
	.string	"PDC 20621(?)"
.LC6164:
	.string	"FastTrak SX4000"
.LC6165:
	.string	"PDC 20622 (?)"
.LC6166:
	.string	"FastTrak S150SX4"
.LC6167:
	.string	"PDC20619"
.LC6168:
	.string	"FastTrak TX4000"
.LC6169:
	.string	"Vitesse 7250 SAS RAID"
.LC6170:
	.string	"PDC 20277"
	.align 4
.LC6171:
	.string	"SBUltra133/SBFastTrak 133 Lite"
.LC6172:
	.string	"SATAII150 SX8"
	.align 4
.LC6173:
	.string	"SuperTrak EX8350/16350/8300/16300"
.LC6174:
	.string	"SuperTrak EX SAS RAID"
.LC6175:
	.string	"SuperTrak EX 123X0"
.LC6176:
	.string	"SuperTrak EX 243X0"
.LC6177:
	.string	"Imagine 128"
.LC6178:
	.string	"I128s2"
.LC6179:
	.string	"Imagine 128 Series 2"
.LC6180:
	.string	"T2R"
.LC6181:
	.string	"Revolution 3D"
.LC6182:
	.string	"Revolution IV"
.LC6183:
	.string	"UM82C881"
.LC6184:
	.string	"486 Chipset"
.LC6185:
	.string	"UM82C886"
.LC6186:
	.string	"UM8673F"
.LC6187:
	.string	"UM8881"
.LC6188:
	.string	"HB4 486 PCI Chipset"
.LC6189:
	.string	"UM8886F"
.LC6190:
	.string	"UM82C891"
.LC6191:
	.string	"Pentium CPU to PCI bridge"
.LC6192:
	.string	"UM886A"
.LC6193:
	.string	"IDE Cntrlr (dual function)"
.LC6194:
	.string	"UM8886BF"
.LC6195:
	.string	"EIDE Master/DMA"
.LC6196:
	.string	"UM8710"
.LC6197:
	.string	"VGA Cntrlr"
.LC6198:
	.string	"CPU/PCI Bridge"
.LC6199:
	.string	"PCI/ISA Bridge"
.LC6200:
	.string	"Pentium CPU/PCI Bridge"
.LC6201:
	.string	"Pentium CPU/ISA Bridge"
.LC6202:
	.string	"UM8886A"
.LC6203:
	.string	"ISA Bridge with EIDE"
.LC6204:
	.string	"UM8881F"
.LC6205:
	.string	"UM8886"
.LC6206:
	.string	"ISA Bridge (w/o IDE support)"
.LC6207:
	.string	"UM8891"
.LC6208:
	.string	"586 Chipset"
.LC6209:
	.string	"UM9017F"
.LC6210:
	.string	"Ethernet"
.LC6211:
	.string	"UM9018"
.LC6212:
	.string	"UM9026"
.LC6213:
	.string	"UM8886N"
.LC6214:
	.string	"ISA Bridge w/EIDE"
.LC6215:
	.string	"PCI / ISA Bridge"
.LC6216:
	.string	"UM8891N"
.LC6217:
	.string	"um8891n"
.LC6218:
	.string	"AGX013/016"
.LC6219:
	.string	"IIT3104"
.LC6220:
	.string	"5.10.00.5760"
.LC6221:
	.string	"Realtek AC' 97 Audio Driver"
.LC6222:
	.string	"Realtek 8139C Network Card"
.LC6223:
	.string	"PT80C826"
.LC6224:
	.string	"VL Bridge"
.LC6225:
	.string	"PT86C521"
	.align 4
.LC6226:
	.string	"Vesuvius V1-LS System Controller"
.LC6227:
	.string	"PT86C523"
.LC6228:
	.string	"Vesuvius V3-LS ISA Bridge"
.LC6229:
	.string	"PT80C524"
.LC6230:
	.string	"Nile PCI to PCI Bridge"
.LC6231:
	.string	"PT80C525"
.LC6232:
	.string	"Nile-II PCI to PCI Bridge"
.LC6233:
	.string	"PC87550"
.LC6234:
	.string	"VG500"
	.align 4
.LC6235:
	.string	"VolumePro Volume Rendering Accelerator"
.LC6236:
	.string	"ispLSI1032E"
	.align 4
.LC6237:
	.string	"PCI 1616, 16 TTL-IN, 16 TTL-OUT"
	.align 4
.LC6238:
	.string	"OPTO-PCI, 16 IN / 16 OUT 24 VDC"
	.align 4
.LC6239:
	.string	"PCI-AD, PCI-ADDA analog I/O-card"
	.align 4
.LC6240:
	.string	"PCI-OptoRel, PCI-Relais 16 Relais & Opto"
	.align 4
.LC6241:
	.string	"Timer, Pulse & Counter-card 16..32 bit"
	.align 4
.LC6242:
	.string	"PCI-DAC416, 4 channel D/A16bit precision"
.LC6243:
	.string	"PCI-MFB high-speed analog I/O"
	.align 4
.LC6244:
	.string	"PROTO-3 PCI, digital I/O with chipselect"
	.align 4
.LC6245:
	.string	"Universal digital I/O PCI-Interface"
.LC6246:
	.string	"5ACPCI.MFIO-K01"
.LC6247:
	.string	"Profibus DP / K-Feldbus / COM"
.LC6248:
	.string	"ME-2000/2600"
	.align 4
.LC6249:
	.string	"Multifunction Data Aquistion card"
.LC6250:
	.string	"ME-4610"
	.align 4
.LC6251:
	.string	"Multi-IO board (16x 16bit ADC, 32x TTL I/O)"
.LC6252:
	.string	"ME-4650"
.LC6253:
	.string	"Panacom 7"
.LC6254:
	.string	"Interface chip"
.LC6255:
	.string	"PCI-DAS1602/16"
.LC6256:
	.string	"PCI-GPIB"
.LC6257:
	.string	"PCI-DIO48H"
.LC6258:
	.string	"PCI-PDISO8"
.LC6259:
	.string	"PCI-PDISO16"
.LC6260:
	.string	"PCI-DAS1200"
.LC6261:
	.string	"PCI-DAS1602/12"
.LC6262:
	.string	"PCI-DIO24H"
.LC6263:
	.string	"PCI-DIO24H/CTR3"
.LC6264:
	.string	"PCI-DIO24H/CTR16"
.LC6265:
	.string	"PCI-DIO96H"
.LC6266:
	.string	"PCI-CTR05"
.LC6267:
	.string	"PCI-DAS1200/JR"
.LC6268:
	.string	"PCI-DAS1001"
.LC6269:
	.string	"PCI-DAS1002"
.LC6270:
	.string	"PCI-DAS1602JR/16"
.LC6271:
	.string	"PCI-DAS6402/16"
.LC6272:
	.string	"PCI-DAS6402/12"
.LC6273:
	.string	"PCI-DAS16/M1"
.LC6274:
	.string	"PCI-DDA02/12"
.LC6275:
	.string	"PCI-DDA04/12"
.LC6276:
	.string	"PCI-DDA08/12"
.LC6277:
	.string	"PCI-DDA02/16"
.LC6278:
	.string	"PCI-DDA04/16"
.LC6279:
	.string	"PCI-DDA08/16"
.LC6280:
	.string	"PCI-DAC04/12-HS"
.LC6281:
	.string	"PCI-DAC04/16-HS"
.LC6282:
	.string	"PCI-DIO24"
	.align 4
.LC6283:
	.string	"24 Bit Digital Input/Output Board"
.LC6284:
	.string	"PCI-DAS08"
.LC6285:
	.string	"PCI-INT32"
.LC6286:
	.string	"PCI-DUAL-AC5"
.LC6287:
	.string	"PCI-DAS-TC"
.LC6288:
	.string	"PCI-DAS64/M1/16"
.LC6289:
	.string	"PCI-DAS64/M2/16"
.LC6290:
	.string	"PCI-DAS64/M3/16"
.LC6291:
	.string	"PCI-DAS1000"
.LC6292:
	.string	"PCI-QUAD04"
.LC6293:
	.string	"PCI-CTR10"
	.align 4
.LC6294:
	.string	"10 channels, 16 bit counter/timer with 32-Bits of Digital I/O"
.LC6295:
	.string	"G-NIC II"
.LC6296:
	.string	"1000BT Network Interface Card"
.LC6297:
	.string	"FM0801-a1"
	.align 4
.LC6298:
	.string	"PCI Card MediaForte made in singapore"
.LC6299:
	.string	"FM801-as"
.LC6300:
	.string	"Xwave PCI Joystick"
.LC6301:
	.string	"FM801"
.LC6302:
	.string	"PCI Joystick"
.LC6303:
	.string	"FM0801-as"
.LC6304:
	.string	"Xwave PCI audio controller"
.LC6305:
	.string	"FM801-AU"
.LC6306:
	.string	"ForteMedia PCI Audio Card"
.LC6307:
	.string	"fm801-au"
.LC6308:
	.string	"ICE1712"
	.align 4
.LC6309:
	.string	"Envy24 PCI Multi-Channel I/O Ctrlr"
.LC6310:
	.string	"VT1720/24"
	.align 4
.LC6311:
	.string	"Envy24PT/HT PCI Multi-Channel Audio Controller"
.LC6312:
	.string	"CyberSerial 16850"
.LC6313:
	.string	"Duet 1S(16650)+1P"
.LC6314:
	.string	"Duet 1S(16850)+1P"
.LC6315:
	.string	"SIIG cyber8000"
.LC6316:
	.string	"Communication controller"
.LC6317:
	.string	"Trio 1S(16850)+2P"
	.align 4
.LC6318:
	.string	"Siig Inc CyberSerial (4-port) 16550"
.LC6319:
	.string	"CyberSerial 16650"
.LC6320:
	.string	"Trio 2S(16550)+1P"
.LC6321:
	.string	"Trio 2S(16650)+1P"
.LC6322:
	.string	"Trio 2S(16850)+1P"
.LC6323:
	.string	"0439"
.LC6324:
	.string	"Lava Dual Serial 550 PCI"
.LC6325:
	.string	"Lava Quattro PCI A/B"
.LC6326:
	.string	"Lava Quattro PCI C/D"
.LC6327:
	.string	"0110"
.LC6328:
	.string	"Lava DSerial PCI Port A"
.LC6329:
	.string	"Lava DSerial PCI Port B"
.LC6330:
	.string	"Lava Octopus PCI Ports 1-4"
.LC6331:
	.string	"Lava Octopus PCI Ports 5-8"
.LC6332:
	.string	"9923"
.LC6333:
	.string	"LavaPort Dual-650 PCI"
.LC6334:
	.string	"LavaPort Quad-650 PCI A/B"
.LC6335:
	.string	"LavaPort Quad-650 PCI C/D"
.LC6336:
	.string	"Lava 8255 PIO PCI"
.LC6337:
	.string	"Lava Single Serial 550 PCI"
.LC6338:
	.string	"Lava SP Serial 550 PCI"
.LC6339:
	.string	"Lava SP BIDIR Parallel PCI"
.LC6340:
	.string	"Lava RS422 SS-PCI"
.LC6341:
	.string	"4-0 9253"
.LC6342:
	.string	"LavaPort 650 PCI"
.LC6343:
	.string	"LavaPort PCI"
.LC6344:
	.string	"COM Port Accelerator"
.LC6345:
	.string	"Lava Quattro 550 PCI A/B"
.LC6346:
	.string	"Lava Quattro 550 PCI C/D"
.LC6347:
	.string	"Lava Parallel"
.LC6348:
	.string	"Lava Dual Parallel port A"
.LC6349:
	.string	"Lava Dual Parallel port B"
.LC6350:
	.string	"BOCA Research IOPPAR"
.LC6351:
	.string	"HT6565"
.LC6352:
	.string	"IDE Controller?"
.LC6353:
	.string	"TC-2550"
	.align 4
.LC6354:
	.string	"Single Chip Ultra (Wide) SCSI Processor"
.LC6355:
	.string	"EIDE"
.LC6356:
	.string	"TP-910/920/940"
.LC6357:
	.string	"PCI Ultra (Wide) SCSI Adapter"
.LC6358:
	.string	"JNIC-1460"
	.align 4
.LC6359:
	.string	"2-Gb/s Fibre Channel-PCI 64-bit 66 MHz"
.LC6360:
	.string	"JNIC-1560"
	.align 4
.LC6361:
	.string	"Dual Channel 2 Gb/s Fibre Channel-PCI-X"
.LC6362:
	.string	"JNI PCI 64-bit Fibrechannel"
	.align 4
.LC6363:
	.string	"JNI PCI 64-bit Fibrechannel (needs clone)"
.LC6364:
	.string	"Moselle Split Bridge"
.LC6365:
	.string	"Capilano Split Bridge"
.LC6366:
	.string	"Merlin Split Bridge"
.LC6367:
	.string	"PCI Serial Port"
.LC6368:
	.string	"PCI PS/2 Keyboard Port"
.LC6369:
	.string	"3103"
.LC6370:
	.string	"PCI PS/2 Mouse Port"
.LC6371:
	.string	"NetCelerator Adapter"
.LC6372:
	.string	"fa82537ep"
.LC6373:
	.string	"HSP688T"
.LC6374:
	.string	"82537"
.LC6375:
	.string	"V.92 MDC Modem"
.LC6376:
	.string	"537"
.LC6377:
	.string	"PCT 789T"
.LC6378:
	.string	"HSP MicroModem 56"
.LC6379:
	.string	"PCT 789T-A"
.LC6380:
	.string	"HSP56 MicroModem"
.LC6381:
	.string	"S911 K017"
.LC6382:
	.string	"688w"
.LC6383:
	.string	"PCT789T"
.LC6384:
	.string	"pct789t-c"
.LC6385:
	.string	"97860963"
.LC6386:
	.string	"HSP MicroModem 56/PCT789T"
.LC6387:
	.string	"PCT 288-1A"
.LC6388:
	.string	"pct388p-a"
.LC6389:
	.string	"pctel 56k modem"
.LC6390:
	.string	"hfp56"
.LC6391:
	.string	"dev"
.LC6392:
	.string	"5101"
.LC6393:
	.string	"Route 56"
.LC6394:
	.string	"PCI-ACB"
.LC6395:
	.string	"RS-232 synchronous card"
	.align 4
.LC6396:
	.string	"Single Port RS-232/422/485/520"
	.align 4
.LC6397:
	.string	"Dual Port RS-232/422/485 Interface"
.LC6398:
	.string	"Dual Port RS-232 Interface"
.LC6399:
	.string	"Four Port RS-232 Interface"
	.align 4
.LC6400:
	.string	"Four Port RS-422/485 Interface"
.LC6401:
	.string	"Eight Port RS-232 Interface"
.LC6402:
	.string	"8001"
.LC6403:
	.string	"Digital I/O Adapter"
.LC6404:
	.string	"MA301"
.LC6405:
	.string	"802.11b Wireless Adapter"
.LC6406:
	.string	"GA620"
.LC6407:
	.string	"GA622"
.LC6408:
	.string	"GA630"
.LC6409:
	.string	"GA311"
.LC6410:
	.string	"FA311"
.LC6411:
	.string	"Fast Ethernet Adapter"
.LC6412:
	.string	"PCI1500PFB"
.LC6413:
	.string	"Intelligent fieldbus Adapter"
.LC6414:
	.string	"PCI-CANIO"
.LC6415:
	.string	"PCI-CANIO adapter"
.LC6416:
	.string	"HFC-8S 16B8D8S0"
.LC6417:
	.string	"ISDN HDLC FIFO Controller"
.LC6418:
	.string	"HFC-PCI A ISDN 2BDS0"
.LC6419:
	.string	"HFC-4S ISDN 8B4D4S0"
.LC6420:
	.string	"B000"
.LC6421:
	.string	"HCF-PCI card"
.LC6422:
	.string	"B006"
.LC6423:
	.string	"B007"
.LC6424:
	.string	"B008"
.LC6425:
	.string	"B009"
.LC6426:
	.string	"B00A"
.LC6427:
	.string	"B00B"
.LC6428:
	.string	"B00C"
.LC6429:
	.string	"B100"
.LC6430:
	.string	"SyncLink Adapter"
	.align 4
.LC6431:
	.string	"single port multiprotocol serial adapter"
.LC6432:
	.string	"SyncLink SCC"
	.align 4
.LC6433:
	.string	"low speed single port multiprotocol serial adapter"
.LC6434:
	.string	"SyncLink 4 Port Adapter"
	.align 4
.LC6435:
	.string	"4 port multiprotocol serial adapter"
.LC6436:
	.string	"SyncLink GT Adapter"
.LC6437:
	.string	"SyncLink GT4 Adapter"
.LC6438:
	.string	"SyncLink AC Adapter"
	.align 4
.LC6439:
	.string	"one port asynchronous serial adapter"
.LC6440:
	.string	"SyncLink GT2 Adapter"
	.align 4
.LC6441:
	.string	"2 port multiprotocol serial adapter"
	.align 4
.LC6442:
	.string	"SyncLink Serial Adapter version 2"
.LC6443:
	.string	"9548qad"
.LC6444:
	.string	"ATA-RAID Controller"
.LC6445:
	.string	"7000/8000 series"
.LC6446:
	.string	"ATA-133 Storage Controller"
.LC6447:
	.string	"9000 series"
.LC6448:
	.string	"SATA/PATA Storage Controller"
.LC6449:
	.string	"9550SX/9590SE Series"
.LC6450:
	.string	"SATA2 Raid Controller"
.LC6451:
	.string	"9650SE Series"
	.align 4
.LC6452:
	.string	"PCI-Express SATA2 Raid Controller"
.LC6453:
	.string	"9690SA Series"
	.align 4
.LC6454:
	.string	"PCI-Express SATA2/SAS Raid Controller"
.LC6455:
	.string	"PCI56RVP"
.LC6456:
	.string	"pcnet ht2001 9932"
.LC6457:
	.string	"serlio"
.LC6458:
	.string	"520098396000734"
.LC6459:
	.string	"sound card"
.LC6460:
	.string	"CMI8338/PCI C3DX"
.LC6461:
	.string	"CMI8338-031"
.LC6462:
	.string	"vtc82c596b"
.LC6463:
	.string	"C-Media Audio Controller"
.LC6464:
	.string	"CMI-8378B/PCI-6CH"
.LC6465:
	.string	"PCI Audio Chip"
.LC6466:
	.string	"CMI8738/PCI-SX"
.LC6467:
	.string	"HSP56 MICROMODEM"
.LC6468:
	.string	"0x4005"
.LC6469:
	.string	"pci audio driver"
	.align 4
.LC6470:
	.string	"PCIVEN_13F6&DEV_0111&SUBSYS_011113F6&REV_102&EBB"
.LC6471:
	.string	"CMI8788/PCI-8CH"
.LC6472:
	.string	"C-Media Oxygen HD"
.LC6473:
	.string	"ADAT/EDIT"
.LC6474:
	.string	"Audio Editing"
.LC6475:
	.string	"F01 2ASV17184.1"
	.align 4
.LC6476:
	.string	"Domex DMX 3191 PCI SCSI Controller"
	.align 4
.LC6477:
	.string	"Domex DMX3192U/3194UP SCSI Adapter"
.LC6478:
	.string	"PCI-9052"
.LC6479:
	.string	"PLX PCI9052"
.LC6480:
	.string	"PCI-7250"
.LC6481:
	.string	"PCI-7256"
	.align 4
.LC6482:
	.string	"PCI-7256 16-CH Latching Relay & 16-CH Isolated Digital Input Card"
.LC6483:
	.string	"PCI-7296 (PLX PCI-9052)"
.LC6484:
	.string	"96-ch digital I/O card"
.LC6485:
	.string	"PCI-7432"
.LC6486:
	.string	"PCI-7433"
.LC6487:
	.string	"64-ch digital Input card"
.LC6488:
	.string	"PCI-7434"
.LC6489:
	.string	"PCI-7841"
	.align 4
.LC6490:
	.string	"SJA 1000- baseddual port  CAN bus card"
.LC6491:
	.string	"PCI-8133"
.LC6492:
	.string	"PCI-8554"
.LC6493:
	.string	"PCI-9111"
.LC6494:
	.string	"PCI-9113"
.LC6495:
	.string	"PCI-9114"
.LC6496:
	.string	"GeForce4 MX 440"
.LC6497:
	.string	"nVidia Corporation NV17"
.LC6498:
	.string	"NextMove PCI"
.LC6499:
	.string	"Multi-axis Motion Controller"
.LC6500:
	.string	"NextMove PCI-2"
.LC6501:
	.string	"Rockwell HCF chipset"
	.align 4
.LC6502:
	.string	"Creative ModemBlaster V.90 PCI DI5655"
.LC6503:
	.string	"9ff-usa-a99-99-0970"
.LC6504:
	.string	"DSL NIC"
.LC6505:
	.string	"Symphony 4110"
.LC6506:
	.string	"pci9052"
.LC6507:
	.string	"PC4800"
.LC6508:
	.string	"werwerwerwe"
	.align 4
.LC6509:
	.string	"Cisco Systems 340 PCI Wireless LAN Adptr"
.LC6510:
	.string	"PC2500 DS"
.LC6511:
	.string	"Wireless PCI LAN Adapter"
.LC6512:
	.string	"PC3100 FH"
.LC6513:
	.string	"PC3500 FH"
.LC6514:
	.string	"PC4500 DS"
.LC6515:
	.string	"PC4800 DS"
.LC6516:
	.string	"A504 Cisco MAC"
	.align 4
.LC6517:
	.string	"Cisco Aironet 350 Series Mini-PCI (MPI350)"
.LC6518:
	.string	"AIR-MP21G"
.LC6519:
	.string	"802.11b/g wireless adapter"
.LC6520:
	.string	"PCI IO 1S"
.LC6521:
	.string	"PCI IO 1S-650"
.LC6522:
	.string	"PCI IO 1S-850"
.LC6523:
	.string	"PCI IO 1S1P"
.LC6524:
	.string	"OX16PCI952"
.LC6525:
	.string	"PCI IO 1S1P-650"
.LC6526:
	.string	"PCI IO 1S1P-850"
.LC6527:
	.string	"TK9902"
.LC6528:
	.string	"Parallel Port device"
.LC6529:
	.string	"PCI IO 2P"
.LC6530:
	.string	"PCI IO 2S"
.LC6531:
	.string	"2 Port PCI Serial Card"
.LC6532:
	.string	"PCI IO 2S-650"
.LC6533:
	.string	"PCI IO 2S-850"
.LC6534:
	.string	"PCI IO 2P1S"
.LC6535:
	.string	"PCI IO 2P1S-650"
.LC6536:
	.string	"PCI IO 2P1S-850"
.LC6537:
	.string	"PCI IO 2P2S"
.LC6538:
	.string	"PCI IO 2P2S-650"
.LC6539:
	.string	"PCI IO 2P2S-850"
.LC6540:
	.string	"PCI IO 4S"
.LC6541:
	.string	"PCI IO 4S-654"
.LC6542:
	.string	"PCI IO 4S-850"
.LC6543:
	.string	"PCI IO 2S1P"
.LC6544:
	.string	"PCI IO 2S1P-650"
.LC6545:
	.string	"PCI IO 2S1P-850"
.LC6546:
	.string	"PCI IO 8S"
	.align 4
.LC6547:
	.string	"VEN_14DB&DEV_2180&SUBSYS_218014DB&REV_00"
.LC6548:
	.string	"PCI IO 8S-654"
.LC6549:
	.string	"Avlab Technology Inc"
.LC6550:
	.string	"PCI IO 8S-850"
.LC6551:
	.string	"PCI 230"
.LC6552:
	.string	"PCI242H"
.LC6553:
	.string	"4-port high speed RS-232"
.LC6554:
	.string	"PCI244H"
.LC6555:
	.string	"8-port high speed RS-232"
.LC6556:
	.string	"PCI247H"
.LC6557:
	.string	"2-port high speed RS-232"
.LC6558:
	.string	"PCI248H"
.LC6559:
	.string	"2-port high speed RS-422/485"
.LC6560:
	.string	"PCI249H"
	.align 4
.LC6561:
	.string	"2-port high speed RS-232 and RS-422/485"
.LC6562:
	.string	"PCI260"
	.align 4
.LC6563:
	.string	"16-channel analog input (with timers)"
.LC6564:
	.string	"PCI224"
	.align 4
.LC6565:
	.string	"16-chan 12-bit analog output (w/ timers)"
.LC6566:
	.string	"PCI234"
	.align 4
.LC6567:
	.string	"4-chan 16-bit analog output (w/ timers)"
.LC6568:
	.string	"PCI236"
.LC6569:
	.string	"24-channel digital I/O"
.LC6570:
	.string	"PCI272"
.LC6571:
	.string	"72-channel digital I/O"
.LC6572:
	.string	"PCI215"
	.align 4
.LC6573:
	.string	"48-channel digital I/O (w/ 6 timers)"
.LC6574:
	.string	"PCI263"
.LC6575:
	.string	"16-channel reed relay output"
.LC6576:
	.string	"MPC105 Eagle"
.LC6577:
	.string	"MPC106 Grackle"
.LC6578:
	.string	"MPC8240 Kahlua"
.LC6579:
	.string	"MPC145575 HFC-PCI"
.LC6580:
	.string	"KTI829c 100VG"
.LC6581:
	.string	"PCI-1002"
.LC6582:
	.string	"4370"
.LC6583:
	.string	"PCI-1004"
.LC6584:
	.string	"PCI-1008"
.LC6585:
	.string	"Fix2000"
.LC6586:
	.string	"PCI Y2K Compliance Card"
.LC6587:
	.string	"W83787IF"
.LC6588:
	.string	"Multi-IO Card"
.LC6589:
	.string	"W837871F"
.LC6590:
	.string	"Parallel Port Card (EPP)"
.LC6591:
	.string	"TC32001 PCI I/O"
.LC6592:
	.string	"907ab184740802"
.LC6593:
	.string	"Winbond w83787if"
.LC6594:
	.string	"winbond w83787if"
.LC6595:
	.string	"Multi-IO Card 2 series"
.LC6596:
	.string	"w837871f"
.LC6597:
	.string	"007AB192367002ND"
.LC6598:
	.string	"9500MGS"
.LC6599:
	.string	"Virtual SVGA"
.LC6600:
	.string	"VMXNET"
.LC6601:
	.string	"VMware PCI Ethernet Adapter"
.LC6602:
	.string	"0X0880"
	.align 4
.LC6603:
	.string	"Standard Enhanced PCI to USB Host Controller"
.LC6604:
	.string	"Argus 300"
.LC6605:
	.string	"PCI Cryptography Module"
.LC6606:
	.string	"HB2/HB6"
	.align 4
.LC6607:
	.string	"Universal PCI-PCI Bridge (transparent mode)"
.LC6608:
	.string	"HB1/1-SE/HB6"
	.align 4
.LC6609:
	.string	"Universal PCI-to-PCI Bridge (non-transparent mode)"
.LC6610:
	.string	"HB4"
.LC6611:
	.string	"HB8"
	.align 4
.LC6612:
	.string	"Dual Mode PCI-X-to-PCI-X Bridge (transparent mode)"
	.align 4
.LC6613:
	.string	"Dual Mode PCI-X-to-PCI-X Bridge (non-transparent mode)"
.LC6614:
	.string	"HB7"
	.align 4
.LC6615:
	.string	"Transparent PCI-X-to-PCI-X Bridge"
.LC6616:
	.string	"PCI 6156"
	.align 4
.LC6617:
	.string	"Synchronous 32-Bit, 33 MHz PCI-to-PCI Bridge for Video Capture Applications"
.LC6618:
	.string	"cmi 8330"
	.align 4
.LC6619:
	.string	"PLX Registration Record Management"
.LC6620:
	.string	"MQ-200"
.LC6621:
	.string	"Daytona Audio Adapter"
	.align 4
.LC6622:
	.string	"VPI General Digital Video Component"
	.align 4
.LC6623:
	.string	"Digital Video OEM computer module"
.LC6624:
	.string	"815"
.LC6625:
	.string	"PCCOM4"
.LC6626:
	.string	"PCCOM8"
.LC6627:
	.string	"PCI-488 GPIB"
.LC6628:
	.string	"IEEE 488"
.LC6629:
	.string	"9060"
.LC6630:
	.string	"CompactPCI Interface"
.LC6631:
	.string	"FPGA PCI Bridge"
.LC6632:
	.string	"nm0403A03461H121S122P"
.LC6633:
	.string	"ADMtek AN986"
.LC6634:
	.string	"AN981"
	.align 4
.LC6635:
	.string	"FastNIC 10/100 Fast Ethernet Adapter"
.LC6636:
	.string	"an983"
.LC6637:
	.string	"AN985"
	.align 4
.LC6638:
	.string	"CardBus 10/100 Fast Ethernet Controller"
.LC6639:
	.string	"016"
.LC6640:
	.string	"ADM5120"
.LC6641:
	.string	"ADMtek ADM5120 SOC (rev: 0)"
.LC6642:
	.string	"ADM8211"
.LC6643:
	.string	"802.11b Wireless PCI Card"
.LC6644:
	.string	"ADM9511"
	.align 4
.LC6645:
	.string	"PCI 10/100 Fast Ethernet Adapter"
.LC6646:
	.string	"ADM9513"
.LC6647:
	.string	"13d1"
.LC6648:
	.string	"1317"
.LC6649:
	.string	"SST-5136-PFB-PCI"
.LC6650:
	.string	"Industrial I/O Card"
	.align 4
.LC6651:
	.string	"CopperHead CopperTail SC1 AMC AC97"
.LC6652:
	.string	"MT8LLN21PADF"
.LC6653:
	.string	"21PAD"
.LC6654:
	.string	"MT7LLN22NCNE"
	.align 4
.LC6655:
	.string	"CopperHead CopperTail SC1 IDE Controller"
	.align 4
.LC6656:
	.string	"CopperHead CopperTail SC1 USB Controller"
.LC6657:
	.string	"PLX9050"
.LC6658:
	.string	"PLX PCI Bus Logic"
.LC6659:
	.string	"AlladinCARD"
.LC6660:
	.string	"CPC"
.LC6661:
	.string	"SCRAMNet GT200"
.LC6662:
	.string	"C104H/PCI"
.LC6663:
	.string	"Smartio"
.LC6664:
	.string	"CP-132"
.LC6665:
	.string	"Industio"
	.align 4
.LC6666:
	.string	"CP--134U-I-DB9 V2.3 UPCI Board"
	.align 4
.LC6667:
	.string	"UniversalPCI board, 4 ports RS-422/485 with Isolation DB9M"
.LC6668:
	.string	"C168H/PCI"
.LC6669:
	.string	"CP-168U"
.LC6670:
	.string	"CP-168U Smart Serial Board"
.LC6671:
	.string	"CP-204J"
.LC6672:
	.string	"Intellio"
.LC6673:
	.string	"C218"
.LC6674:
	.string	"Intellio Turbo PCI"
.LC6675:
	.string	"---"
.LC6676:
	.string	"C320"
.LC6677:
	.string	"0x0000"
.LC6678:
	.string	"dvr capture card"
.LC6679:
	.string	"SES2000"
.LC6680:
	.string	"Alacritech iSCSI Controller"
.LC6681:
	.string	"BSRV2-301A"
.LC6682:
	.string	"XR17C152"
.LC6683:
	.string	"Dual UART"
.LC6684:
	.string	"XR17C154"
.LC6685:
	.string	"Four Channel PCI Bus UART"
.LC6686:
	.string	"XR17C158"
	.align 4
.LC6687:
	.string	"Eight Channel PCI Bus UART (5V)"
.LC6688:
	.string	"PLUSTEST"
.LC6689:
	.string	"Diagnostics Device"
.LC6690:
	.string	"0x13b6"
.LC6691:
	.string	"sguiu"
	.align 4
.LC6692:
	.string	"Multi-Function Analogue/Digital IO card"
.LC6693:
	.string	"Parallel I/O Card"
.LC6694:
	.string	"Digital I/O Card"
.LC6695:
	.string	"Watchdog Card"
.LC6696:
	.string	"T228502"
	.align 4
.LC6697:
	.string	"B2C2 Sky2PC Core Chip sky star 2 <technisat>"
.LC6698:
	.string	"FE2000VX"
	.align 4
.LC6699:
	.string	"CardBus /Atelco Fibreline Ethernet Adptr"
.LC6700:
	.string	"SMC8035TX"
	.align 4
.LC6701:
	.string	"EZ Card\357\277\275 10/100 Fast Ethernet CardBus Adapter"
.LC6702:
	.string	"8086"
.LC6703:
	.string	"toshiba"
.LC6704:
	.string	"XQ11800FP"
	.align 4
.LC6705:
	.string	"XaQti 1000Mbit/sec Gbit Ethernet Controller"
.LC6706:
	.string	"Bandit"
.LC6707:
	.string	"PowerPC Host-PCI Bridge"
.LC6708:
	.string	"Grand Central"
.LC6709:
	.string	"Control Video"
.LC6710:
	.string	"PlanB"
.LC6711:
	.string	"Video-in"
.LC6712:
	.string	"OHare"
.LC6713:
	.string	"Hydra"
.LC6714:
	.string	"Mac I/O Controller"
.LC6715:
	.string	"Heathrow"
.LC6716:
	.string	"Paddington"
.LC6717:
	.string	"UniNorth"
.LC6718:
	.string	"FireWire Controller"
.LC6719:
	.string	"Host-PCI bridge"
.LC6720:
	.string	"AGP interface"
.LC6721:
	.string	"Pangea"
.LC6722:
	.string	"USB Interface"
.LC6723:
	.string	"UniNorth 1.5"
.LC6724:
	.string	"Internal PCI"
.LC6725:
	.string	"UniNorth/Pangea"
.LC6726:
	.string	"Intrepid"
.LC6727:
	.string	"Integrated ATA Controller"
.LC6728:
	.string	"Shasta"
.LC6729:
	.string	"Mac I/O controler"
.LC6730:
	.string	"IDE controler"
.LC6731:
	.string	"Sungem ethernet controler"
.LC6732:
	.string	"Firewire controler"
.LC6733:
	.string	"U3L"
	.align 4
.LC6734:
	.string	"Dual Pentium ISA/PCI Motherboard"
.LC6735:
	.string	"P54C Tr8"
.LC6736:
	.string	"PowerPC ISA/PCI Motherboard"
	.align 4
.LC6737:
	.string	"Dual Window Graphics Accelerator"
.LC6738:
	.string	"ht019a"
.LC6739:
	.string	"PCI LAN Controller"
.LC6740:
	.string	"100-BaseT LAN Controller"
.LC6741:
	.string	"88E8053"
	.align 4
.LC6742:
	.string	"Yukon PCI-E Gigabit Ethernet Controller (copper)"
.LC6743:
	.string	"BRE040"
.LC6744:
	.string	"Brocade 400 series PCIe HBA"
.LC6745:
	.string	"3D graphics Cntrlr"
.LC6746:
	.string	"YGV615"
.LC6747:
	.string	"RPA3 3D-Graphics Controller"
.LC6748:
	.string	"00011179"
.LC6749:
	.string	"YMF754B"
.LC6750:
	.string	"PCI Audio Controller"
.LC6751:
	.string	"DS1"
.LC6752:
	.string	"DS1 Audio"
.LC6753:
	.string	"YMF740"
.LC6754:
	.string	"DS-1L PCI Audio Controller"
.LC6755:
	.string	"YMF740C"
.LC6756:
	.string	"DS-1L PCI audio controller"
.LC6757:
	.string	"YMF724F"
.LC6758:
	.string	"Yamaha Onboard Sound System"
.LC6759:
	.string	"YMF744B-V"
.LC6760:
	.string	"DS-1 PCI audio controller"
.LC6761:
	.string	"DS-1E PCI Audio Controller"
.LC6762:
	.string	"744"
.LC6763:
	.string	"DS-1 Audio"
.LC6764:
	.string	"SW1000XG"
.LC6765:
	.string	"Sound system"
.LC6766:
	.string	"DS2416"
.LC6767:
	.string	"Digital Mixing Card"
.LC6768:
	.string	"82C500/1"
.LC6769:
	.string	"Nx586 Chipset"
.LC6770:
	.string	"ISP10160"
	.align 4
.LC6771:
	.string	"Single Channel Ultra3 SCSI Processor"
.LC6772:
	.string	"ISP1040B/1020A"
.LC6773:
	.string	"Fast-wide SCSI - Sparc PCI"
.LC6774:
	.string	"ISP1022A"
.LC6775:
	.string	"ISP1080"
.LC6776:
	.string	"SCSI Host Adapter"
.LC6777:
	.string	"ISP12160"
	.align 4
.LC6778:
	.string	"Dual Channel Ultra3 SCSI Processor"
.LC6779:
	.string	"ISP1240"
.LC6780:
	.string	"ISP1280"
.LC6781:
	.string	"ISP2020A"
.LC6782:
	.string	"Fast!SCSI Basic Adapter"
.LC6783:
	.string	"ISP2100"
.LC6784:
	.string	"64-bit Fibre Channel Adapter"
.LC6785:
	.string	"ISP2200"
.LC6786:
	.string	"PCI Fibre Channel Adapter"
.LC6787:
	.string	"ISP 2300"
.LC6788:
	.string	"64-bit PCI FC-AL Adapter"
.LC6789:
	.string	"ISP 2312"
.LC6790:
	.string	"ISP2422"
	.align 4
.LC6791:
	.string	"QLogic PCI to Fibre Channel Host Adapter for QLA2460"
.LC6792:
	.string	"ISP2432"
	.align 4
.LC6793:
	.string	"Dual Channel 4G PCIe Fibre Channel Adapter"
.LC6794:
	.string	"EP2422"
	.align 4
.LC6795:
	.string	"4-Gbps Fibre Channel to PCI-X 2.0 266MHz controller for Embedded Applications"
.LC6796:
	.string	"EP2432"
	.align 4
.LC6797:
	.string	"4-Gbps Fibre Channel to PCIe controller for Embedded Applications"
.LC6798:
	.string	"Cx5520"
.LC6799:
	.string	"MediaGXm"
.LC6800:
	.string	"Cyrix Integrated CPU"
.LC6801:
	.string	"Cx5530"
.LC6802:
	.string	"ISA bridge"
.LC6803:
	.string	"SMI status and ACPI timer"
.LC6804:
	.string	"Expansion Bus"
.LC6805:
	.string	"P86C850"
.LC6806:
	.string	"Graphic GLU-Logic"
.LC6807:
	.string	"FLIPPER"
	.align 4
.LC6808:
	.string	"FRED Local Bus I/F to PCI Peripheral"
.LC6809:
	.string	"100 vg anylan Cntrlr"
.LC6810:
	.string	"5526"
.LC6811:
	.string	"Fibre Channel Host Adapter"
.LC6812:
	.string	"x526"
.LC6813:
	.string	"4575/5525/5575/6575"
	.align 4
.LC6814:
	.string	"(i)chipSAR+ 155 MBit ATM controller"
.LC6815:
	.string	"5535-4P-BRI-ST"
.LC6816:
	.string	"5535-4P-BRI-U"
.LC6817:
	.string	"5535-1P-SR"
.LC6818:
	.string	"5535-1P-SR-ST"
.LC6819:
	.string	"5535-1P-SR-U"
.LC6820:
	.string	"5535-1P-PRI"
.LC6821:
	.string	"5535-2P-PRI"
.LC6822:
	.string	"5536-4P-BRI-U"
.LC6823:
	.string	"5536-2P-PRI"
.LC6824:
	.string	"Adapter"
.LC6825:
	.string	"6535"
	.align 4
.LC6826:
	.string	"CompactPCI T1/E1/J1Communications Ctrlr"
.LC6827:
	.string	"4538"
	.align 4
.LC6828:
	.string	"PMC T1/E1/J1 Communications Controller"
.LC6829:
	.string	"4532-002/005"
	.align 4
.LC6830:
	.string	"PMC ATM Over OC-3/STM-1 Comm Controller"
.LC6831:
	.string	"4532-001/004"
.LC6832:
	.string	"4532-000/003"
.LC6833:
	.string	"107"
	.align 4
.LC6834:
	.string	"PMC ATM Over T3/E3 Communications Ctrlr"
.LC6835:
	.string	"4539"
	.align 4
.LC6836:
	.string	"PMC Quad T1/E1/J1 Communications Ctrlr"
.LC6837:
	.string	"SL82C105"
.LC6838:
	.string	"EIDE Ctrlr"
.LC6839:
	.string	"EIDE Bus Master Controller"
.LC6840:
	.string	"82C596/9"
.LC6841:
	.string	"Cypress CY7c68001"
.LC6842:
	.string	"AN2131QC 0230"
.LC6843:
	.string	"82C693"
.LC6844:
	.string	"2330"
.LC6845:
	.string	"Radius PCI to NuBUS Bridge"
.LC6846:
	.string	"FR710"
.LC6847:
	.string	"PCI Enhanced IDE Adapter"
.LC6848:
	.string	"UsbDgn"
	.align 4
.LC6849:
	.string	"Datalaster Interface for OBD automotive"
.LC6850:
	.string	"Model 617"
.LC6851:
	.string	"PCI-VME Bus Adapter"
.LC6852:
	.string	"Model 618"
.LC6853:
	.string	"VME Bridge"
.LC6854:
	.string	"dataBLIZZARD"
.LC6855:
	.string	"Model 2106"
.LC6856:
	.string	"OC-3136/37"
.LC6857:
	.string	"Token-Ring 16/4 PCI Adapter"
.LC6858:
	.string	"OC-3139f"
	.align 4
.LC6859:
	.string	"Fastload 16/4 PCI/III Token Ring Adapter"
.LC6860:
	.string	"OC-3139/40"
	.align 4
.LC6861:
	.string	"RapidFire Token Ring 16/4 Adapter"
.LC6862:
	.string	"OC-3250"
	.align 4
.LC6863:
	.string	"GoCard Token Ring 16/4 Adapter"
.LC6864:
	.string	"OC-3530"
	.align 4
.LC6865:
	.string	"RapidFire Token Ring 100 Adapter"
.LC6866:
	.string	"OC-3141"
.LC6867:
	.string	"OC-3540"
	.align 4
.LC6868:
	.string	"RapidFire HSTR 100/16/4 Adapter"
.LC6869:
	.string	"OC-3150"
	.align 4
.LC6870:
	.string	"RapidFire Token-Ring 16/4 PCI Adapter"
.LC6871:
	.string	"OC-2805"
.LC6872:
	.string	"OC-2325"
	.align 4
.LC6873:
	.string	"Ethernet PCI/II 10/100 Controller"
.LC6874:
	.string	"OC-2183/85"
.LC6875:
	.string	"PCI/II Ethernet Controller"
.LC6876:
	.string	"OC-2326"
.LC6877:
	.string	"OC-2327/50"
.LC6878:
	.string	"10/100 Ethernet Controller"
.LC6879:
	.string	"OC-6151/52"
.LC6880:
	.string	"155 Mbit ATM Adapter"
.LC6881:
	.string	"SPARC EBUS"
.LC6882:
	.string	"PCIO"
.LC6883:
	.string	"PCI Input/Output Controller"
.LC6884:
	.string	"Happy Meal Ethernet"
.LC6885:
	.string	"RIO EBUS"
.LC6886:
	.string	"RIO GEM"
.LC6887:
	.string	"RIO 1394"
.LC6888:
	.string	"RIO USB"
.LC6889:
	.string	"GEM"
.LC6890:
	.string	"Sun Gigabit Ethernet Card"
.LC6891:
	.string	"SME2411"
	.align 4
.LC6892:
	.string	"UltraSPARC-IIi Advanced PCI Bridge"
.LC6893:
	.string	"SunPCI"
.LC6894:
	.string	"Co-processor"
.LC6895:
	.string	"SunPCi"
	.align 4
.LC6896:
	.string	"PCI card with Intel or AMD processor"
.LC6897:
	.string	"STP2223BGA"
.LC6898:
	.string	"UPA to PCI Interface (UPA)"
.LC6899:
	.string	"Schizo"
.LC6900:
	.string	"PCI Bus Module"
.LC6901:
	.string	"UltraSPARC IIi"
.LC6902:
	.string	"Sabre"
.LC6903:
	.string	"UltraSPARC IIe"
.LC6904:
	.string	"Hummingbird"
.LC6905:
	.string	"CE (Cassini Ethernet)"
.LC6906:
	.string	"10/100/1000 Ethernet adapter"
.LC6907:
	.string	"3D Graphics Processor"
	.align 4
.LC6908:
	.string	"3D graphics processor w/texturing"
.LC6909:
	.string	"3D graphics frame buffer"
.LC6910:
	.string	"Proprietary bus Bridge"
.LC6911:
	.string	"Powerstorm 4D50T"
.LC6912:
	.string	"Motion JPEG Codec"
.LC6913:
	.string	"SpeedStar Pro SE"
.LC6914:
	.string	"SpeedStar 64"
.LC6915:
	.string	"Viper V550"
.LC6916:
	.string	"Supra 2260"
.LC6917:
	.string	"WinModem"
.LC6918:
	.string	"SupraExpress 56i Pro"
.LC6919:
	.string	"SUP2761"
.LC6920:
	.string	"SupraExpress 56i Pro VCC"
.LC6921:
	.string	"R6793-12"
.LC6922:
	.string	"RS56-pci"
.LC6923:
	.string	"Viper V330"
.LC6924:
	.string	"2710a"
.LC6925:
	.string	"Maximum"
.LC6926:
	.string	"DVD"
.LC6927:
	.string	"Stealth SE"
.LC6928:
	.string	"Stealth 64/SE"
.LC6929:
	.string	"Stealth Video"
.LC6930:
	.string	"Stealth 64 Video"
.LC6931:
	.string	"Stealth 64"
.LC6932:
	.string	"Supra Express 56i Pro CW #2"
.LC6933:
	.string	"Monster Sound"
.LC6934:
	.string	"Diamand Technology DT0398"
.LC6935:
	.string	"PCI-DIO-96"
	.align 4
.LC6936:
	.string	"data adquisition input and output"
.LC6937:
	.string	"PCI-1200"
	.align 4
.LC6938:
	.string	"Multifunction data acquisition board"
.LC6939:
	.string	"PCI-MIO-16XE-50"
.LC6940:
	.string	"24MIO  6-03-2"
.LC6941:
	.string	"PCI-DIO-32HS"
.LC6942:
	.string	"High Speed Digital I/O Board"
.LC6943:
	.string	"PCI-MIO-16XE-10"
.LC6944:
	.string	"PCI-MIO-16E-1"
.LC6945:
	.string	"PCI-MIO-16E-4"
.LC6946:
	.string	"PCI-6032E"
	.align 4
.LC6947:
	.string	"Multifunction Data Acquisition Card"
.LC6948:
	.string	"PCI-6534"
.LC6949:
	.string	"High Speed DIO"
.LC6950:
	.string	"PCI-6602"
.LC6951:
	.string	"Data Acquisition Device"
.LC6952:
	.string	"PCI-6031E"
.LC6953:
	.string	"PCI-6033E"
.LC6954:
	.string	"PCI-6071E"
	.align 4
.LC6955:
	.string	" NI PCI-6071E Multifunction I/O & NI-DAQ"
.LC6956:
	.string	"PCI-6503"
.LC6957:
	.string	"NI 6014"
	.align 4
.LC6958:
	.string	"I/O Terminal NI-DAQ (Legacy) and NI-DAQmx"
.LC6959:
	.string	"PCI-6023E"
.LC6960:
	.string	"PCI-6024E"
.LC6961:
	.string	"PCI-6025E"
.LC6962:
	.string	"PCI-6035E"
.LC6963:
	.string	"PCI-6221"
	.align 4
.LC6964:
	.string	"16-Bit, 250 kS/s, 16 Analog Inputs"
.LC6965:
	.string	"NI PCI-6251"
.LC6966:
	.string	"Multifunction DAQ Device"
.LC6967:
	.string	"IMAQ-PCI-1408"
.LC6968:
	.string	"IMAQ-PXI-1408"
.LC6969:
	.string	"IMAQ-PCI-1424"
.LC6970:
	.string	"IMAQ-PCI-1413"
.LC6971:
	.string	"IMAQ-PCI-1407"
.LC6972:
	.string	"IMAQ-PXI-1407"
.LC6973:
	.string	"IMAQ-PCI-1411"
.LC6974:
	.string	"IMAQ-PCI-1422"
.LC6975:
	.string	"IMAQ-PXI-1422"
.LC6976:
	.string	"IMAQ-PXI-1411"
	.align 4
.LC6977:
	.string	"GPIB Controller Interface Board"
.LC6978:
	.string	"PCI-232/2"
	.align 4
.LC6979:
	.string	"2-port RS-232 Serial Interface Board"
.LC6980:
	.string	"SIL3112"
	.align 4
.LC6981:
	.string	"SATA/Raid controller(2XSATA150)"
.LC6982:
	.string	"SIL3132"
.LC6983:
	.string	"SATAII/Raid controller"
.LC6984:
	.string	"eSATA/Raid controller"
.LC6985:
	.string	"PCI0640A/B"
.LC6986:
	.string	"PCI0640"
.LC6987:
	.string	"PCI EIDE Adapter with RAID 1"
.LC6988:
	.string	"PCI0642"
.LC6989:
	.string	"IDE Cntrlr w/RAID 1"
.LC6990:
	.string	"PCI0643"
.LC6991:
	.string	"PCI EIDE controller"
.LC6992:
	.string	"PCI0646"
.LC6993:
	.string	"bus master IDE"
.LC6994:
	.string	"PCI0647"
.LC6995:
	.string	"9738"
.LC6996:
	.string	"PCI-648"
	.align 4
.LC6997:
	.string	"Bus Master Ultra DMA PCI-IDE/ATA Chip"
.LC6998:
	.string	"PCI-649"
.LC6999:
	.string	"PATA100 RAID Controller"
.LC7000:
	.string	"PBC0650A"
.LC7001:
	.string	"Fast SCSI-II Ctrlr"
.LC7002:
	.string	"USB0670"
.LC7003:
	.string	"PCI-USB"
.LC7004:
	.string	"USB0673"
.LC7005:
	.string	"PCI-USB ASIC"
.LC7006:
	.string	"SiI 0680"
	.align 4
.LC7007:
	.string	"PATA133 Controller/RAID Controller"
.LC7008:
	.string	"1392"
.LC7009:
	.string	"INTEL HDMI AUDIO"
.LC7010:
	.string	"SI3124"
	.align 4
.LC7011:
	.string	"SATALink 4-Port PCI-X Host Controller"
.LC7012:
	.string	"Sil 3114"
.LC7013:
	.string	"SATALink/SATARaid Controller"
.LC7014:
	.string	"SiI 3124"
.LC7015:
	.string	"SiI 3132"
	.align 4
.LC7016:
	.string	"PCI Express (1x) to 2 Port SATA300"
.LC7017:
	.string	"Sil 3512"
.LC7018:
	.string	"3531"
.LC7019:
	.string	"SiI 3531 SATA Controller"
.LC7020:
	.string	"0x3059"
.LC7021:
	.string	"0x47204005&RE"
.LC7022:
	.string	"EIDE Controller (single FIFO)"
.LC7023:
	.string	"QD8500"
.LC7024:
	.string	"QD8580"
.LC7025:
	.string	"0x8280"
.LC7026:
	.string	"BT848KPF"
.LC7027:
	.string	"Bt848AKPF video decoder"
.LC7028:
	.string	"Multimedia Video Controller"
.LC7029:
	.string	"B t878 khf"
.LC7030:
	.string	"tc card"
.LC7031:
	.string	"Bt878fusion 878a"
.LC7032:
	.string	"th&#305;k"
.LC7033:
	.string	"jfgj"
.LC7034:
	.string	"878Asad"
.LC7035:
	.string	"SVR-2000 V1.02"
.LC7036:
	.string	"Video Capturee"
.LC7037:
	.string	"Bt880"
	.align 4
.LC7038:
	.string	"7610144D&REV_02\004&1F7DBC9F&0&09F0"
.LC7039:
	.string	"TV Video Capture"
.LC7040:
	.string	"Bt879khf"
.LC7041:
	.string	"Video Capture (Audio Section)"
	.align 4
.LC7042:
	.string	"Brooktree Corp BT848 SVR-2000 V1.02"
.LC7043:
	.string	"BtV 2115 Mera Lun"
.LC7044:
	.string	"BtV Mediastream Controller 9x"
.LC7045:
	.string	"BtV 2125"
.LC7046:
	.string	"BtV Mediastream Controller"
.LC7047:
	.string	"BtV 2164"
.LC7048:
	.string	"Display Adapter"
.LC7049:
	.string	"BtV 2165"
.LC7050:
	.string	"MediaStream Controller"
.LC7051:
	.string	"878a"
.LC7052:
	.string	"25878-13"
.LC7053:
	.string	"Bt360 MediaStream Controller"
.LC7054:
	.string	"Brooktree Corp"
	.align 4
.LC7055:
	.string	"CONEXANT FUSION 878A 25878-13 E349764.7"
.LC7056:
	.string	"conexant 878a"
.LC7057:
	.string	"BtV 8230"
	.align 4
.LC7058:
	.string	"ATM Segment/Reassembly Controller (SRC)"
.LC7059:
	.string	"Bt8471/72"
	.align 4
.LC7060:
	.string	"32/64-channel HDLC Controllers"
.LC7061:
	.string	"Bt8474"
.LC7062:
	.string	"128-channel HDLC Controller"
.LC7063:
	.string	"SG2010"
	.align 4
.LC7064:
	.string	"PCI to high speed serial bridge"
.LC7065:
	.string	"SG1010"
	.align 4
.LC7066:
	.string	"6 port serial switch /PCI-to-PCI bridge"
.LC7067:
	.string	"64-bit GUI Accelerator"
.LC7068:
	.string	"O2 MACE"
.LC7069:
	.string	"RAD Audio"
.LC7070:
	.string	"HPCEX"
.LC7071:
	.string	"RPCEX"
.LC7072:
	.string	"DiVO VIP"
.LC7073:
	.string	"Video I/O"
.LC7074:
	.string	"GRIP"
.LC7075:
	.string	"SGH PSHAC GSN"
.LC7076:
	.string	"Magic Carpet"
.LC7077:
	.string	"Lithium"
.LC7078:
	.string	"Dual JPEG 1"
.LC7079:
	.string	"Dual JPEG 2"
.LC7080:
	.string	"Dual JPEG 3"
.LC7081:
	.string	"Dual JPEG 4"
.LC7082:
	.string	"Dual JPEG 5"
.LC7083:
	.string	"Cesium"
.LC7084:
	.string	"Fibre Channel"
.LC7085:
	.string	"ASDE"
.LC7086:
	.string	"O2 1394"
.LC7087:
	.string	"G-net NT"
	.align 4
.LC7088:
	.string	"USBVID_0000&PID_00005&5657949&0&8"
.LC7089:
	.string	"USB Bluetooth"
.LC7090:
	.string	"sl82c103"
.LC7091:
	.string	"PCI-ide mode 4.5 Cntrlr"
.LC7092:
	.string	"W83789F"
	.align 4
.LC7093:
	.string	"Sonata bus master PCI-IDE controller"
.LC7094:
	.string	"W83C553F"
.LC7095:
	.string	"PCI/ISA bridge"
.LC7096:
	.string	"IOP 480"
	.align 4
.LC7097:
	.string	"Integrated PowerPC I/O Processor"
.LC7098:
	.string	"PCI 9080RDK-960"
	.align 4
.LC7099:
	.string	"PCI Reference Design Kit for PCI 9080"
.LC7100:
	.string	"Gazel R685"
.LC7101:
	.string	"ISDN card"
.LC7102:
	.string	"Gazel R697"
.LC7103:
	.string	"dual channel ISDN card"
.LC7104:
	.string	"PCI 9050"
.LC7105:
	.string	"Vision Systems VScom PCI-210"
.LC7106:
	.string	"Vision Systems VScom PCI-200"
.LC7107:
	.string	"Vision Systems VScom PCI-010S"
.LC7108:
	.string	"Vision Systems VScom PCI-020S"
.LC7109:
	.string	"Gazel R753"
.LC7110:
	.string	"Thales PCSM Security Card"
.LC7111:
	.string	"plx9030"
.LC7112:
	.string	"gpscard"
.LC7113:
	.string	"PCI RDK9054-LITE"
	.align 4
.LC7114:
	.string	"PCI Reference Design Kit for PLX PCI 9054"
.LC7115:
	.string	"PCI 9056"
	.align 4
.LC7116:
	.string	"32-bit; 66MHz PCI Bus Master I/O Accelerator, 17 x 17mm FPBGA"
.LC7117:
	.string	"PCI6520"
.LC7118:
	.string	"PCI-X to PCI-X Bridge"
.LC7119:
	.string	"PEX 8111, PEX 8311"
	.align 4
.LC7120:
	.string	"1 Lane PCI Express to PCI bridge (PEX8111); 1 Lane PCI Express to Generic Local Bus bridge (PEX8311)"
.LC7121:
	.string	"PEX8112"
	.align 4
.LC7122:
	.string	"1 Lane PCI Express to PCI bridge"
.LC7123:
	.string	"PEX8509"
.LC7124:
	.string	"8-lane PCI-Express Switch"
.LC7125:
	.string	"PEX 8516"
.LC7126:
	.string	"Versatile PCI Express Switch"
.LC7127:
	.string	"PEX8518-AB25BI"
.LC7128:
	.string	"PLX PCI-e switch"
.LC7129:
	.string	"PEX 8532"
.LC7130:
	.string	"8548"
.LC7131:
	.string	"48-lane PCIe switch"
.LC7132:
	.string	"PCI 9030"
	.align 4
.LC7133:
	.string	"PCI SMARTarget I/O Accelerator"
.LC7134:
	.string	"PCI9036"
.LC7135:
	.string	"Interface chip - value 1k"
	.align 4
.LC7136:
	.string	"Target PCI Interface Chip - value 1k"
.LC7137:
	.string	"PCI 9052"
	.align 4
.LC7138:
	.string	"PCI 9052 Target PLX PCI Interface Chip"
.LC7139:
	.string	"PCI I/O Accelerator"
.LC7140:
	.string	"PCI9056"
	.align 4
.LC7141:
	.string	"32-bit, 66 MHz PCI Bus-Mastering I/O Accelerator for PowerQUICC and Generic 32-bit, 66 MHz Local Bus"
.LC7142:
	.string	"PCI9060"
.LC7143:
	.string	"PCI Bus Master Interface Chip"
.LC7144:
	.string	"PCI 9060SD"
.LC7145:
	.string	"PCI 9060ES"
.LC7146:
	.string	"PCI 9080"
	.align 4
.LC7147:
	.string	"High performance PCI to Local Bus chip"
.LC7148:
	.string	"Smart 16/4"
.LC7149:
	.string	"Ringnode (PCI1b)"
.LC7150:
	.string	"Ringnode (PCIBM2/CardBus)"
.LC7151:
	.string	"Ringnode"
	.align 4
.LC7152:
	.string	"Smart 16/4 Ringnode Mk1 (PCIBM1)"
.LC7153:
	.string	"16/4 CardBus Adapter (Eric 2)"
.LC7154:
	.string	"Presto PCI"
	.align 4
.LC7155:
	.string	"Smart 100/16/4 PCi-HS Ringnode"
.LC7156:
	.string	"Smart 100/16/4 PCI Ringnode"
.LC7157:
	.string	"16/4 CardBus  Adapter Mk2"
.LC7158:
	.string	"Horizon"
.LC7159:
	.string	"ATM adapter"
.LC7160:
	.string	"Ambassador"
.LC7161:
	.string	"3C985"
.LC7162:
	.string	"1000BaseSX Gigabit Etherlink"
.LC7163:
	.string	"3com p/n: 3CRDAG675"
	.align 4
.LC7164:
	.string	"3Com11a/b/g Wireless PCI Adapter "
.LC7165:
	.string	"3C905CX-TXNM"
	.align 4
.LC7166:
	.string	"3COM 3C905CX-TXNM with 40-0664-003 ASIC"
.LC7167:
	.string	"14e4:1645"
	.align 4
.LC7168:
	.string	"Broadcom Corporation NetXtreme BCM5701 Gigabit Ethernet"
.LC7169:
	.string	"3C556"
.LC7170:
	.string	"V.90 Mini-PCI Modem"
.LC7171:
	.string	"3C940"
.LC7172:
	.string	"Gigabit Ethernet PCI CODEC"
.LC7173:
	.string	"3CRWE777A"
	.align 4
.LC7174:
	.string	"AirConnect Wireless LAN PCI Card"
.LC7175:
	.string	"3C339"
.LC7176:
	.string	"Token Link Velocity"
.LC7177:
	.string	"3C359"
.LC7178:
	.string	"TokenLink Velocity XL Adapter"
.LC7179:
	.string	"3C450"
.LC7180:
	.string	"3C555"
.LC7181:
	.string	"Laptop Hurricane"
.LC7182:
	.string	"3C575"
	.align 4
.LC7183:
	.string	"Megahertz 10/100 LAN CardBus PC Card"
.LC7184:
	.string	"3C575B"
.LC7185:
	.string	"3CCFE575CT"
	.align 4
.LC7186:
	.string	"Cyclone Fast Ethernet CardBus PC Card"
.LC7187:
	.string	"3C590"
.LC7188:
	.string	"Ethernet III Bus Fast PCI"
.LC7189:
	.string	"3C592"
.LC7190:
	.string	"PCI/EISA 10Mbps Demon/Vortex"
.LC7191:
	.string	"3C595"
.LC7192:
	.string	"Fast EtherLink PCI TX"
.LC7193:
	.string	"Fast EtherLink PCI T4"
.LC7194:
	.string	"Fast EtherLink PCI MII"
.LC7195:
	.string	"3C597"
.LC7196:
	.string	"PCI/EISA Fast Demon/Vortex"
.LC7197:
	.string	"Megahertz 10/100 LAN CardBus"
	.align 4
.LC7198:
	.string	"10/100 Fast Ethernet MiniPCI Adapter"
.LC7199:
	.string	"3CN3AC1556B"
	.align 4
.LC7200:
	.string	"MiniPCI 10/100 Ethernet+Modem56k (see devid:1007)"
.LC7201:
	.string	"3CCFE656"
.LC7202:
	.string	"Cyclone CardBus PC Card"
.LC7203:
	.string	"FEM656"
	.align 4
.LC7204:
	.string	"10/100 LAN+56K Modem CardBus PC Card"
.LC7205:
	.string	"3CCFEM656"
.LC7206:
	.string	"FEM656B"
.LC7207:
	.string	"3CCFEM656C"
	.align 4
.LC7208:
	.string	"Global 10/100 Fast Ethernet+56K Modem"
.LC7209:
	.string	"3CSOHO100B-TX"
.LC7210:
	.string	"Hurricane"
.LC7211:
	.string	"AirConnect Wireless PCI"
.LC7212:
	.string	"Token Ring"
.LC7213:
	.string	"3C900-TPO"
.LC7214:
	.string	"Fast Etherlink PCI TPO NIC"
.LC7215:
	.string	"3C900-COMBO"
	.align 4
.LC7216:
	.string	"Fast Etherlink XL PCI Combo NIC"
.LC7217:
	.string	"EtherLink XL TPO 10Mb"
.LC7218:
	.string	"3C900B-COMBO"
	.align 4
.LC7219:
	.string	"Fast Etherlink 10Mbps Combo NIC"
.LC7220:
	.string	"3C900B-TPC"
.LC7221:
	.string	"EtherLink XL TPC"
.LC7222:
	.string	"3C900B-FL"
.LC7223:
	.string	"EtherLink PCI Fiber NIC"
.LC7224:
	.string	"3C905B - Combo"
.LC7225:
	.string	"Fast Etherlink XL PCI 10/100"
.LC7226:
	.string	"3C905-T4"
.LC7227:
	.string	"Fast Etherlink XL 10/100"
.LC7228:
	.string	"3C905-TX"
	.align 4
.LC7229:
	.string	"Fast Etherlink 10/100 PCI TX NIC"
.LC7230:
	.string	"3C905B-T4"
.LC7231:
	.string	"Fast EtherLink XL 10/100"
.LC7232:
	.string	"3C905B-COMBO"
	.align 4
.LC7233:
	.string	"Deluxe EtherLink 10/100 PCI Combo NIC"
.LC7234:
	.string	"3C905B-FX"
.LC7235:
	.string	"Fast EtherLink 100 Fiber NIC"
.LC7236:
	.string	"3C905 CX-TX-M"
	.align 4
.LC7237:
	.string	"Fast EtherLink for PC Management NIC"
.LC7238:
	.string	"3C920B-EMB"
	.align 4
.LC7239:
	.string	"Integrated Fast Ethernet Controller"
	.align 4
.LC7240:
	.string	"3C920B-EMB 3Com + Realtek 8201L"
.LC7241:
	.string	"3C920B-EMB-WNM"
.LC7242:
	.string	"3csoho100b-tx"
.LC7243:
	.string	"3ComSOHO100B-TX"
.LC7244:
	.string	"3C980-TX"
	.align 4
.LC7245:
	.string	"Fast EtherLink XL Server Adapter2"
.LC7246:
	.string	"Python-T 10/100baseTX NIC"
.LC7247:
	.string	"3CR990-TX-95"
	.align 4
.LC7248:
	.string	"EtherLink 10/100 PCI with 3XP Processor"
.LC7249:
	.string	"3CR990-TX-97"
.LC7250:
	.string	"3C990B-FX"
.LC7251:
	.string	"100FX PCI Server NIC w/3XP"
.LC7252:
	.string	"3CR990SVR95"
	.align 4
.LC7253:
	.string	"EtherLink 10/100 Server PCI with 3XP"
.LC7254:
	.string	"3CR990SVR97"
.LC7255:
	.string	"3C900B-TPO"
.LC7256:
	.string	"EtherLink XL PCI"
.LC7257:
	.string	"LAN83C170QF/171"
	.align 4
.LC7258:
	.string	"EPIC/XF 10/100 Mbps Fast Ethernet Ctrlr"
.LC7259:
	.string	"LAN83C175"
	.align 4
.LC7260:
	.string	"EPIC/C Ethernet CardBus Integrated Ctrlr"
.LC7261:
	.string	"37C665"
.LC7262:
	.string	"FDC"
.LC7263:
	.string	"37C922"
.LC7264:
	.string	"83C170QF"
.LC7265:
	.string	"Fast ethernet controller"
.LC7266:
	.string	"SMC34C90"
.LC7267:
	.string	"CMI8338/C3DX"
.LC7268:
	.string	"PCI Audio Device (OEM)"
.LC7269:
	.string	"CMI8738/C3DX"
.LC7270:
	.string	"C-Media Audio Device (OEM)"
.LC7271:
	.string	"ALI M5273 A1"
.LC7272:
	.string	"0539 TS05 CKB42321000B"
	.align 4
.LC7273:
	.string	"CPU to PCI & PCI to ISA Bridge w/EIDE"
.LC7274:
	.string	"Pentium CPU to PCI Bridge"
.LC7275:
	.string	"Aladdin 2 Host Bridge"
.LC7276:
	.string	"Aladdin 2 South Bridge"
.LC7277:
	.string	"Bios"
.LC7278:
	.string	"M1535+"
.LC7279:
	.string	"M1535x"
.LC7280:
	.string	"Aladdin V AGPset Host Bridge"
.LC7281:
	.string	"M1543 a1"
	.align 4
.LC7282:
	.string	"Aladdin V chipset South Bridge"
.LC7283:
	.string	"M1563"
	.align 4
.LC7284:
	.string	"South Bridge with Hypertransport Support"
.LC7285:
	.string	"M1632"
.LC7286:
	.string	"M1644"
.LC7287:
	.string	"AGP System Controller"
.LC7288:
	.string	"M1646"
.LC7289:
	.string	"M1647"
.LC7290:
	.string	"M1651"
.LC7291:
	.string	"M1661"
.LC7292:
	.string	"M1667"
.LC7293:
	.string	"M1671"
.LC7294:
	.string	"Super P4 Nouth Bridge"
.LC7295:
	.string	"M1672"
.LC7296:
	.string	"M1681"
	.align 4
.LC7297:
	.string	"P4 Nouth Bridge with HyperTransport"
.LC7298:
	.string	"M1687"
	.align 4
.LC7299:
	.string	"K8 North Bridge with HyperTransport"
.LC7300:
	.string	"MS4803"
.LC7301:
	.string	"m5217h"
.LC7302:
	.string	"I/O (?)"
	.align 4
.LC7303:
	.string	"Ali M5219 PCI BUS MASTER IDE Controller"
.LC7304:
	.string	"M5228 PATA/RAID Controller"
.LC7305:
	.string	"M5229 Southbridge"
.LC7306:
	.string	"Ali EIDE"
.LC7307:
	.string	"PATA 33"
.LC7308:
	.string	"PATA 66"
.LC7309:
	.string	"PATA 100"
.LC7310:
	.string	"PATA 133"
.LC7311:
	.string	"M5273"
.LC7312:
	.string	"EHCI USB 2.0"
.LC7313:
	.string	"M5273 A1 for windows 98"
.LC7314:
	.string	"OpenHCI 1.1 USB to  2.0"
.LC7315:
	.string	"527210B9"
.LC7316:
	.string	"USB EHCI2.0 Controller"
.LC7317:
	.string	"M5249"
.LC7318:
	.string	"HyperTransport to PCI Bridge"
.LC7319:
	.string	"M5251"
	.align 4
.LC7320:
	.string	"IEEE P1394 OpenHCI 1.0 Controller"
.LC7321:
	.string	"M5253"
.LC7322:
	.string	"M5261"
.LC7323:
	.string	"Albatron K8ULTRA-U Pro"
	.align 4
.LC7324:
	.string	"ULi PCI Fast Ethernet Controller"
.LC7325:
	.string	"M1565/1566"
	.align 4
.LC7326:
	.string	"ALI M5281/5283  SATA/RAID Controller"
.LC7327:
	.string	"ULI M1573"
.LC7328:
	.string	"ULI M1575/M1697 "
.LC7329:
	.string	"M5288 SATA/Raid controller"
.LC7330:
	.string	"ULI M1567/M1689 "
.LC7331:
	.string	"M5289 SATA/Raid controller"
.LC7332:
	.string	"65525"
.LC7333:
	.string	"Agere Systems AC97 Modem"
.LC7334:
	.string	"Ali Audio Accelerator"
.LC7335:
	.string	"M1563M Southbridge"
.LC7336:
	.string	"M1563M"
.LC7337:
	.string	"AC97 Modem controller"
.LC7338:
	.string	"MDV92XP NetoDragon"
.LC7339:
	.string	"PCI Soft Modem V92 NetoDragon"
.LC7340:
	.string	"M5461"
	.align 4
.LC7341:
	.string	"High Definition Audio Controller"
.LC7342:
	.string	"Memory Stick Host"
.LC7343:
	.string	"MMC/SD controller"
.LC7344:
	.string	"mdv92xp"
.LC7345:
	.string	"xhcth700000b"
	.align 4
.LC7346:
	.string	" MYSON Technology Inc SURECOM EP-320X-S 100/10M Et"
.LC7347:
	.string	"Ethernet PCI Adapter"
.LC7348:
	.string	"NE34"
	.align 4
.LC7349:
	.string	"Ethernet Adapter (NE2000 PCI clone)"
.LC7350:
	.string	"0055"
.LC7351:
	.string	"IDE Cntrlr"
.LC7352:
	.string	"General Purpose Cntrlr"
.LC7353:
	.string	"00000000"
.LC7354:
	.string	"Bus Cntrlr"
.LC7355:
	.string	"FCD Cntrlr"
	.align 4
.LC7356:
	.string	"surecom EP-320X-R adapter with realtek 8139c chip"
.LC7357:
	.string	"realtek 8139c"
.LC7358:
	.string	"5335fn800829"
.LC7359:
	.string	"s/n124102160"
.LC7360:
	.string	"pci pnp686"
.LC7361:
	.string	"Graphics Cntrlr"
.LC7362:
	.string	"NM2093"
	.align 4
.LC7363:
	.string	"MagicGraph 128ZV Video Controller"
.LC7364:
	.string	"NM2160"
.LC7365:
	.string	"MagicGraph 128XD"
.LC7366:
	.string	"NM2200"
.LC7367:
	.string	"MagicMedia 256AV"
.LC7368:
	.string	"NM2360"
.LC7369:
	.string	"MagicMedia 256ZX/256M6D"
.LC7370:
	.string	"NM2380"
.LC7371:
	.string	"MagicMedia 256XL+"
.LC7372:
	.string	"NM2230"
.LC7373:
	.string	"MagicMedia 256AV+"
.LC7374:
	.string	"NM2097"
	.align 4
.LC7375:
	.string	"Graphic Controller NeoMagic MagicGraph128ZV+"
.LC7376:
	.string	"MagicMedia 256AV Audio Device"
.LC7377:
	.string	"MagicMedia 256ZX Audio Device"
	.align 4
.LC7378:
	.string	"MagicMedia 256XL+ Audio Device"
.LC7379:
	.string	"ASC1100"
.LC7380:
	.string	"PCI SCSI Host Adapter"
.LC7381:
	.string	"ASC1200"
.LC7382:
	.string	"Fast SCSI-II"
.LC7383:
	.string	"ASC-3550b"
.LC7384:
	.string	"F914C536"
	.align 4
.LC7385:
	.string	"PCI Ultra Wide SCSI Host Adapter"
.LC7386:
	.string	"ASC38C0800/1600"
	.align 4
.LC7387:
	.string	"PCI Ultra 80/160 SCSI Controllers"
.LC7388:
	.string	"ASC30C0400"
.LC7389:
	.string	"IEEE-1394 OHCI PCI Controller"
.LC7390:
	.string	"FMV-103"
.LC7391:
	.string	"Serial Parallel Card"
.LC7392:
	.string	"MB86605"
	.align 4
.LC7393:
	.string	"PCI SCSI Host Adapter (Fast Wide SCSI-2)"
.LC7394:
	.string	"MB86606"
.LC7395:
	.string	"Fast Wide SCSI Controller"
.LC7396:
	.string	"MB86974"
.LC7397:
	.string	"10/100 Fast Ethernet Adapter"
.LC7398:
	.string	"IEEE1394 OpenHCI Controller"
.LC7399:
	.string	"OHCI FireWire Controller"
	.align 4
.LC7400:
	.string	"MPEG2 R-Engine (MPEG2 Hardware Encoder)"
.LC7401:
	.string	"MB86295"
.LC7402:
	.string	"Coral-P Graphics Chip"
.LC7403:
	.string	"MB86296"
.LC7404:
	.string	"Coral-PA Graphics Chip"
.LC7405:
	.string	"0x0100"
.LC7406:
	.string	"C87899D"
.LC7407:
	.string	"905410B5"
	.align 4
.LC7408:
	.string	"DIG 704 PCI - Interface with Millisecond Timer and Interrupts"
.LC7409:
	.string	"MX86101P"
.LC7410:
	.string	"sdas"
.LC7411:
	.string	"MX98713"
.LC7412:
	.string	"MX98723/727"
	.align 4
.LC7413:
	.string	"PCI/CardBus Fast Ethernet Controller"
.LC7414:
	.string	"MX987x5"
.LC7415:
	.string	"MX86250"
.LC7416:
	.string	"xiankasqudong"
.LC7417:
	.string	"MX86251"
.LC7418:
	.string	"9619E"
.LC7419:
	.string	"lc82c115"
.LC7420:
	.string	"STAR/RD24"
.LC7421:
	.string	"PCI-SCI  PMC  mezzanine"
.LC7422:
	.string	"ATT 2C15-3 (FPGA)"
	.align 4
.LC7423:
	.string	"SCI bridge  on PCI 5 Volt card"
.LC7424:
	.string	"EP20S780"
.LC7425:
	.string	"ALTERA STRATIX"
.LC7426:
	.string	"680-1110-150/400"
	.align 4
.LC7427:
	.string	"Simple PMC/PCI to S-LINK interface"
.LC7428:
	.string	"680-1110-200/450"
	.align 4
.LC7429:
	.string	"Simple S-LINK to PMC/PCI interface"
.LC7430:
	.string	"S32PCI64"
	.align 4
.LC7431:
	.string	"32-bit S-LINK to 64-bit PCI interface"
.LC7432:
	.string	"HIPPI destination"
.LC7433:
	.string	"HIPPI source"
.LC7434:
	.string	"EP20KE (APEX-FPGA)"
	.align 4
.LC7435:
	.string	"ALICE DDL to  PCI interface (RORC)"
.LC7436:
	.string	"SL651 7057 C200"
	.align 4
.LC7437:
	.string	"Acquisition card for the SPS Orbit System (MACI)"
.LC7438:
	.string	"XC4VFX100"
.LC7439:
	.string	"CALICE ODR"
	.align 4
.LC7440:
	.string	"TTC sr   first TTC chip receiver PMC"
.LC7441:
	.string	"PLX PCI 9030"
	.align 4
.LC7442:
	.string	"based on the PLX PCI 9030 to build a MIL1553 bus interface"
.LC7443:
	.string	"PLX PCI96556"
	.align 4
.LC7444:
	.string	"64 Bit/66MHz PCI to Local Bus Bridge"
.LC7445:
	.string	"3D graphics processor"
.LC7446:
	.string	"NV3"
.LC7447:
	.string	"Riva 128"
.LC7448:
	.string	"Lucent 0x00da"
	.align 4
.LC7449:
	.string	"SoundMAX Integrated Digital Audio"
	.align 4
.LC7450:
	.string	"It seems to be Realtek ALC888/9"
	.align 4
.LC7451:
	.string	"nVIDIA High Definition Audio/HDMI "
.LC7452:
	.string	"NV1"
.LC7453:
	.string	"Edge 3D"
.LC7454:
	.string	"NV2"
.LC7455:
	.string	"Mutara V08"
.LC7456:
	.string	"Riva 128ZX"
.LC7457:
	.string	"NV4"
.LC7458:
	.string	"Riva TNT"
.LC7459:
	.string	"NV5"
.LC7460:
	.string	"TNT2 / TNT2 Pro"
.LC7461:
	.string	"TNT2 Ultra"
.LC7462:
	.string	"TNT2"
.LC7463:
	.string	"Riva TNT2"
.LC7464:
	.string	"8.0"
.LC7465:
	.string	"Vanta/Vanta LT"
	.align 4
.LC7466:
	.string	"TNT2 Model 64 / TNT2 Model 64 Pro"
.LC7467:
	.string	"NV6"
.LC7468:
	.string	"VANTA"
.LC7469:
	.string	"MCP04"
.LC7470:
	.string	"MCP04 PATA Controller"
.LC7471:
	.string	"MCP04 SATA/RAID Controller"
.LC7472:
	.string	"NV40.0"
.LC7473:
	.string	"GeForce 6800 Ultra"
.LC7474:
	.string	"NV40.1"
.LC7475:
	.string	"GeForce 6800"
.LC7476:
	.string	"NV40.2"
.LC7477:
	.string	"Geforce 6800LE"
.LC7478:
	.string	"NV40.3"
.LC7479:
	.string	"nforce3 250"
.LC7480:
	.string	"NV40.5"
.LC7481:
	.string	"GeForce 6800 GT"
.LC7482:
	.string	"NV40GL"
.LC7483:
	.string	"Quadro FX 4000"
.LC7484:
	.string	"CK804"
.LC7485:
	.string	"CK804 PATA Controller"
.LC7486:
	.string	"CK804 SATA/RAID Controller"
.LC7487:
	.string	"nForce4 Ultra"
	.align 4
.LC7488:
	.string	"NVidia Network Bus Enumerator Description du p\357\277\275riph\357\277\275rique\tnVIDIA nForce4 SLI (CK8-04) - LAN Controll"
.LC7489:
	.string	"Realtek ALC850"
.LC7490:
	.string	"Realtek AC'97 Audio"
.LC7491:
	.string	"nForce MCP2"
.LC7492:
	.string	"nForce MCP-T"
.LC7493:
	.string	"nForce MCP2/MCP2-T/MCP2-U"
	.align 4
.LC7494:
	.string	"Ethernet Adapter Chip 10/100/HD/FD-Autosense"
.LC7495:
	.string	"OpenHCI USB Controller"
.LC7496:
	.string	"EHCI USB 2.0 Controller"
.LC7497:
	.string	"Audio Codec Interface"
.LC7498:
	.string	"nForce MCP-T?"
	.align 4
.LC7499:
	.string	"Audio Processing Unit (Dolby Digital)"
.LC7500:
	.string	"nForce"
	.align 4
.LC7501:
	.string	"OHCI Compliant IEEE 1394 Controller"
.LC7502:
	.string	"MCP2S"
.LC7503:
	.string	"MCP2S PATA Controller"
.LC7504:
	.string	"RLT8201BL"
	.align 4
.LC7505:
	.string	"Single-Port 10/100M Fast Ethernet PHYceiver"
.LC7506:
	.string	"MCP2S SATA/RAID Controller"
.LC7507:
	.string	"G70"
.LC7508:
	.string	"GeForce 7800 GTX"
.LC7509:
	.string	"NV47 (20x1,7vp)"
.LC7510:
	.string	"GeForce 7800GT"
.LC7511:
	.string	"G70.1"
.LC7512:
	.string	"Quadro FX 350M"
.LC7513:
	.string	"NVIDIA GPU Quadro FX 4500"
.LC7514:
	.string	"Aladdin TNT2"
.LC7515:
	.string	"NV41.0"
.LC7516:
	.string	"NV41GS"
.LC7517:
	.string	"NV41.1"
.LC7518:
	.string	"NVIDIA GeForce 6800"
.LC7519:
	.string	"NV41.2"
.LC7520:
	.string	"NV41"
.LC7521:
	.string	"GeForce FX 6800 Go"
.LC7522:
	.string	"GeForce FX 6800 Ultra Go"
.LC7523:
	.string	"Quadro FX 1400 Go"
.LC7524:
	.string	"NV41GL"
.LC7525:
	.string	"Quadro FX 3450/4000 SDI"
.LC7526:
	.string	"NVIDIA Quadro FX1400"
.LC7527:
	.string	"nForce 3"
.LC7528:
	.string	"nForce 3?"
.LC7529:
	.string	"nForce MCp2"
.LC7530:
	.string	"nForce3-150"
	.align 4
.LC7531:
	.string	"CK8 PATA 133/PATA to SATA Bridge"
.LC7532:
	.string	"nForce MCP3?"
.LC7533:
	.string	"Networking Controller"
.LC7534:
	.string	"OpenHCD USB Host Controller"
	.align 4
.LC7535:
	.string	"Enhanced PCI to USB Host Controller"
.LC7536:
	.string	"Agere System PCI Soft Modem"
.LC7537:
	.string	"Marvell 88E1111"
.LC7538:
	.string	"Network adapter"
.LC7539:
	.string	"nForce3 250"
.LC7540:
	.string	"Host/PCI Bridge"
.LC7541:
	.string	"nForce 250"
.LC7542:
	.string	"CK8S SATA/RAID Controller"
.LC7543:
	.string	"PCI System Management"
.LC7544:
	.string	"Parallel ATA Controller"
.LC7545:
	.string	"OpenHCD USB Controller"
	.align 4
.LC7546:
	.string	"Enhanced PCI to USB Controller"
.LC7547:
	.string	"NVBR02"
.LC7548:
	.string	"NV43+BR02"
.LC7549:
	.string	"GeForce 6600 GT AGP"
.LC7550:
	.string	"NV43"
.LC7551:
	.string	"GeForce 6600"
.LC7552:
	.string	"GeForce 7800 GS"
.LC7553:
	.string	"Geforce 6800GS"
.LC7554:
	.string	"NVIDIA Quadro FX 3400/4400"
.LC7555:
	.string	"GeForce 6800 GTO"
.LC7556:
	.string	"NVBR02.2"
.LC7557:
	.string	"GeForce PCX 5750"
.LC7558:
	.string	"NVBR02.3"
.LC7559:
	.string	"GeForce PCX 5900"
.LC7560:
	.string	"NVBR02.4"
.LC7561:
	.string	"GeForce PCX 5300"
.LC7562:
	.string	"NVBR02GL"
.LC7563:
	.string	"Quadro NVS 280 PCI-E"
.LC7564:
	.string	"Quadro FX 1300"
.LC7565:
	.string	"NVBR02.7"
.LC7566:
	.string	"GeForce PCX 4300"
.LC7567:
	.string	"NV10"
.LC7568:
	.string	"GeForce 256"
.LC7569:
	.string	"GeForce 256 DDR"
.LC7570:
	.string	"GeForce 256 Ultra"
.LC7571:
	.string	"NV10GL"
.LC7572:
	.string	"Quadro (GeForce 256 GL)"
.LC7573:
	.string	"NV11"
.LC7574:
	.string	"GeForce2 MX / MX 400"
.LC7575:
	.string	"NV11DDR"
	.align 4
.LC7576:
	.string	"GeForce2 MX 100/200\303\202\357\277\275  (DDR)"
.LC7577:
	.string	"GeForce2 Go / MX Ultra"
	.align 4
.LC7578:
	.string	"Nvidia GeForce2 Go/MX Ultra Video Adapter"
.LC7579:
	.string	"NV11GL"
.LC7580:
	.string	"Quadro2 MXR / EX / Go"
.LC7581:
	.string	"NVIDIA GeForce 6600"
.LC7582:
	.string	"NVIDIA GeForce 6610 XL"
.LC7583:
	.string	"GeForce Go 6600"
.LC7584:
	.string	"NVIDIA Quadro FX 5500"
.LC7585:
	.string	"NVIDIA Quadro FX 540"
.LC7586:
	.string	"NVIDIA GeForce 6200"
.LC7587:
	.string	"NV15"
.LC7588:
	.string	"GeForce2 GTS / Pro"
.LC7589:
	.string	"NV15 DDR"
.LC7590:
	.string	"GeForce2 Ti"
.LC7591:
	.string	"NV15BR"
.LC7592:
	.string	"GeForce2 Ultra (BladeRunner)"
.LC7593:
	.string	"NV15GL"
.LC7594:
	.string	"Quadro2 Pro"
.LC7595:
	.string	"NV44 (Code Name)"
.LC7596:
	.string	"GPU 6500 "
.LC7597:
	.string	"NV44?"
.LC7598:
	.string	"GeForce 6200SE TurboCache"
.LC7599:
	.string	"00"
.LC7600:
	.string	"Geforce 6200 LE"
.LC7601:
	.string	"GeForce FX 6200 Go"
.LC7602:
	.string	"NVS285"
.LC7603:
	.string	"Quadro NVS 285"
.LC7604:
	.string	"NVidia GeForce 7100 GS"
.LC7605:
	.string	"VGA"
.LC7606:
	.string	"NV17.2"
.LC7607:
	.string	"GeForce4 MX 460"
.LC7608:
	.string	"NV17.3"
.LC7609:
	.string	"GeForce4 MX 420"
.LC7610:
	.string	"NV17.4"
.LC7611:
	.string	"GeForce4 MX 440-SE"
.LC7612:
	.string	"NV17M"
.LC7613:
	.string	"GeForce4 440 Go 64MB"
.LC7614:
	.string	"GeForce4 420 Go"
.LC7615:
	.string	"GeForce4 420 Go 32M"
.LC7616:
	.string	"GeForce4 460 Go"
.LC7617:
	.string	"NV17GL.1"
.LC7618:
	.string	"Quadro4 500/550 XGL"
.LC7619:
	.string	"GeForce4 440 Go 64M"
.LC7620:
	.string	"NV17GL.2"
.LC7621:
	.string	"Quadro4 200/400 NVS"
.LC7622:
	.string	"NV17GL.3"
.LC7623:
	.string	"Quadro4 550 XGL"
.LC7624:
	.string	"Quadro4 500 GoGL"
.LC7625:
	.string	"NV18B"
	.align 4
.LC7626:
	.string	"NVIDIA GeForce MX440 with AGP8X"
.LC7627:
	.string	"NV18.2"
.LC7628:
	.string	"GeForce4 MX 440 with AGP 8X"
.LC7629:
	.string	"NV18.4"
.LC7630:
	.string	"GeForce4 MX 420 with AGP 8X"
.LC7631:
	.string	"NV18.6"
.LC7632:
	.string	"GeForce4 MX 4000"
.LC7633:
	.string	"NV18M"
.LC7634:
	.string	"GeForce4 448 Go"
.LC7635:
	.string	"nv18m"
.LC7636:
	.string	"Geforce4 488 Go"
.LC7637:
	.string	"Quadro NVS"
.LC7638:
	.string	"Quadro NVS with AGP8X"
.LC7639:
	.string	"G80"
.LC7640:
	.string	"Geforce 8800GTX 768MB"
.LC7641:
	.string	"NVIDIA GeForce 8800 GTS"
.LC7642:
	.string	"Nvidia Quadro FX 5600"
.LC7643:
	.string	"Nvidia Quadro FX4600"
.LC7644:
	.string	"NVCrush11"
.LC7645:
	.string	"GeForce2 Integrated Graphics"
.LC7646:
	.string	"AGP Controller"
.LC7647:
	.string	"nForce 220"
.LC7648:
	.string	"Memory Controller (SDR)"
.LC7649:
	.string	"nForce 420"
.LC7650:
	.string	"nForce 220/230"
.LC7651:
	.string	"Memory Controller (DDR)"
.LC7652:
	.string	"nForce 415/420/430"
.LC7653:
	.string	"nForce 2x0/415/4x0"
.LC7654:
	.string	"nForce MCP"
.LC7655:
	.string	"nForce MCP-S"
.LC7656:
	.string	"HUB Interface"
.LC7657:
	.string	"ATA Controller"
.LC7658:
	.string	"OHCI USB Controller"
.LC7659:
	.string	"Networking Adapter"
.LC7660:
	.string	"NVIDIA GeForce 7300 LE"
.LC7661:
	.string	"nVidia"
.LC7662:
	.string	"nVidia GeForce 7300 SE"
.LC7663:
	.string	"nVIDIA Quadro NVS 110M"
.LC7664:
	.string	"G72M"
.LC7665:
	.string	"GeForce Go 7400"
.LC7666:
	.string	"nvidia mobile graphics"
.LC7667:
	.string	"NVIDIA Quadro FX 350M"
.LC7668:
	.string	"7500LE"
.LC7669:
	.string	"0000"
.LC7670:
	.string	"nForce2"
.LC7671:
	.string	"Memory Controller 0"
.LC7672:
	.string	"Memory Controller 1"
.LC7673:
	.string	"Memory Controller 2"
.LC7674:
	.string	"Memory Controller 3"
.LC7675:
	.string	"Memory Controller 4"
.LC7676:
	.string	"Memory Controller 5"
.LC7677:
	.string	"NV20"
.LC7678:
	.string	"GeForce3"
.LC7679:
	.string	"GeForce3 Ti 200"
.LC7680:
	.string	"NV20BR"
.LC7681:
	.string	"GeForce3 Ti 500"
.LC7682:
	.string	"NV20DCC"
.LC7683:
	.string	"Quadro DCC"
.LC7684:
	.string	"NVS 210S"
	.align 4
.LC7685:
	.string	"nVidia GForce 6150, build in DELL Optiplex 740 (AMD Processor)"
.LC7686:
	.string	"NVIDIA GeForce 6100"
.LC7687:
	.string	"Geforce Go 6150"
.LC7688:
	.string	"NV25"
.LC7689:
	.string	"GeForce4 Ti 4600"
.LC7690:
	.string	"NV25.2"
.LC7691:
	.string	"Gforce4 Ti 4400"
.LC7692:
	.string	"NVIDIA Corporation"
.LC7693:
	.string	"Geforce4 TI 4200 128 Mo"
.LC7694:
	.string	"NV25GL.1"
.LC7695:
	.string	"Quadro4 900 XGL"
.LC7696:
	.string	"NV25GL.2"
.LC7697:
	.string	"Quadro4 750 XGL"
.LC7698:
	.string	"NV25GL.4"
.LC7699:
	.string	"Quadro4 700 XGL"
.LC7700:
	.string	"NVIDIA SMB Bus Controller"
	.align 4
.LC7701:
	.string	"NVIDIA nForce PCI System Management"
.LC7702:
	.string	"MCP51"
.LC7703:
	.string	"MCP51S"
	.align 4
.LC7704:
	.string	"NVIDIA nForce 430/410 Serial ATA Controller"
.LC7705:
	.string	"430"
	.align 4
.LC7706:
	.string	"NVIDIA nForce Networking Controller"
.LC7707:
	.string	"2A34103C"
.LC7708:
	.string	"MCP51 Ethernet Controller "
.LC7709:
	.string	"6150"
.LC7710:
	.string	"Coprocessor"
.LC7711:
	.string	"NV28.1"
.LC7712:
	.string	"GeForce4 Ti 4800"
.LC7713:
	.string	"NV28.2"
.LC7714:
	.string	"GeForce4 Ti 4200 with AGP 8X"
.LC7715:
	.string	"NV28.3"
.LC7716:
	.string	"GeForce4 Ti 4800 SE"
.LC7717:
	.string	"GeForce4 4200 Go"
.LC7718:
	.string	"NV28GL.1"
.LC7719:
	.string	"Quadro4 980 XGL"
.LC7720:
	.string	"NV28GL.2"
.LC7721:
	.string	"Quadro4 780 XGL"
.LC7722:
	.string	"NV28GL"
.LC7723:
	.string	"Quadro4 700 GoGL"
.LC7724:
	.string	"0x0401"
.LC7725:
	.string	"BLISS GeForce 7900 GT bios"
.LC7726:
	.string	"G71"
.LC7727:
	.string	"NVIDIA GeForce Go 7950 GTX"
.LC7728:
	.string	"Nvidia Quadro FX 5500"
.LC7729:
	.string	"Quadro FX 3500"
.LC7730:
	.string	"NV2A"
.LC7731:
	.string	"GeForce3 Integrated GPU"
.LC7732:
	.string	"GeForce 7600 GT"
	.align 4
.LC7733:
	.string	"Video Card GPU BFG 7300 512MB GT"
.LC7734:
	.string	"NV30.1"
.LC7735:
	.string	"GeForce FX"
.LC7736:
	.string	"NV30.2"
.LC7737:
	.string	"GeForce FX 5800 Ultra"
.LC7738:
	.string	"NV30.3"
.LC7739:
	.string	"GeForce FX 5800"
.LC7740:
	.string	"NV30GL.1"
.LC7741:
	.string	"Quadro FX 2000"
.LC7742:
	.string	"NV30GL.2"
.LC7743:
	.string	"Quadro FX 1000"
.LC7744:
	.string	"NV30GL"
.LC7745:
	.string	"ICE FX 2000"
.LC7746:
	.string	"NV31.1"
.LC7747:
	.string	"GeForce FX 5600 Ultra"
.LC7748:
	.string	"NV31.2"
.LC7749:
	.string	"GeForce FX 5600"
.LC7750:
	.string	"NV31?"
.LC7751:
	.string	"NV31"
.LC7752:
	.string	"GeForce FX 5600XT"
.LC7753:
	.string	"NV31GL.1"
.LC7754:
	.string	"NV31GL.2"
.LC7755:
	.string	"NV31GL"
.LC7756:
	.string	"NVIDIA NV31GL"
.LC7757:
	.string	"NV31B"
.LC7758:
	.string	"NVIDIA GeForce FX Go5600"
.LC7759:
	.string	"NV31C"
.LC7760:
	.string	"NVIDIA Quadro FX Go700"
.LC7761:
	.string	"NV34.2"
.LC7762:
	.string	"GeForce FX 5200 Ultra"
.LC7763:
	.string	"NV34.3"
.LC7764:
	.string	"GeForce FX 5200"
.LC7765:
	.string	"NV34.4"
.LC7766:
	.string	"GeForce FX 5200LE"
.LC7767:
	.string	"NV"
	.align 4
.LC7768:
	.string	"nVidia GeForce FX Go 5200, 128MB"
.LC7769:
	.string	"nv36m"
.LC7770:
	.string	"GeForce FX Go 5700"
.LC7771:
	.string	"NV34.6"
.LC7772:
	.string	"GeForce FX 5500"
.LC7773:
	.string	"NV34.7"
.LC7774:
	.string	"GeForce FX 5100"
.LC7775:
	.string	"NV34GL"
.LC7776:
	.string	"Nvidia NV34GL"
.LC7777:
	.string	"G73"
.LC7778:
	.string	"Geforce 7600GS"
.LC7779:
	.string	"NV34GL.3"
.LC7780:
	.string	"Quadro NVS 280"
.LC7781:
	.string	"NV34GL.4"
.LC7782:
	.string	"Quadro FX 500"
.LC7783:
	.string	"NVIDIA NV34GL"
.LC7784:
	.string	"NV34M"
.LC7785:
	.string	"GeForce FX Go5100"
.LC7786:
	.string	"GeForce FX 5900 Ultra"
.LC7787:
	.string	"GeForce FX 5900"
.LC7788:
	.string	"GeForce FX 5900XT"
.LC7789:
	.string	"NV38"
.LC7790:
	.string	"GeForce FX 5950 Ultra"
.LC7791:
	.string	"NV35.4"
.LC7792:
	.string	"GeForce FX 5900ZT"
.LC7793:
	.string	"NV35GL"
.LC7794:
	.string	"Quadro FX 3000"
.LC7795:
	.string	"NV36.1"
.LC7796:
	.string	"GeForce FX 5700 Ultra"
.LC7797:
	.string	"NV36.2"
.LC7798:
	.string	"NV36.3"
.LC7799:
	.string	"GeForce FX 5700LE"
.LC7800:
	.string	"NV36.4"
.LC7801:
	.string	"GeForce FX 5700VE"
.LC7802:
	.string	"NV36.5"
.LC7803:
	.string	"??"
.LC7804:
	.string	"Nvidia 5700 from hp"
.LC7805:
	.string	"NV36M"
.LC7806:
	.string	"GeForce FX Go5600"
.LC7807:
	.string	"nv36GL"
.LC7808:
	.string	"Quadro FX 1100"
.LC7809:
	.string	"NV36GL?"
.LC7810:
	.string	"81FB1043"
	.align 4
.LC7811:
	.string	"Standard OpenHCD USB Hostcontroller"
	.align 4
.LC7812:
	.string	"Standard PCI-to-USB Enhanced Hostcontroller"
.LC7813:
	.string	"MCP55"
.LC7814:
	.string	"MCP55 PATA Controller"
.LC7815:
	.string	"MCP55 SATA/RAID Controller"
.LC7816:
	.string	"ADI 1988"
.LC7817:
	.string	"MCP55 High Definition Audio"
.LC7818:
	.string	"MCP55S"
.LC7819:
	.string	"G73 B1"
.LC7820:
	.string	"Ge-Force 7600GT"
.LC7821:
	.string	"NVIDIA GeForce 7600 GS"
.LC7822:
	.string	"UNKOWN"
.LC7823:
	.string	"NVIDIA GeForce 7300GT"
.LC7824:
	.string	"NVIDIA GeForce Go 7600"
.LC7825:
	.string	"Quadro FX 560"
	.align 4
.LC7826:
	.string	"NVIDIA GeForce 6100 nForce 430"
.LC7827:
	.string	"nForce 430"
.LC7828:
	.string	"PCI standard ISA bridge"
.LC7829:
	.string	"MCP61"
.LC7830:
	.string	"MCP61 SATA/RAID Controller"
.LC7831:
	.string	"MCP61 PATA Controller"
.LC7832:
	.string	"nForce 405"
.LC7833:
	.string	"Nvidia Networking Card"
.LC7834:
	.string	"High Definition Audio"
.LC7835:
	.string	"0402"
	.align 4
.LC7836:
	.string	"gainward bliss 8600 gt 512mo silent fx pcx"
.LC7837:
	.string	"NVIDIA GeForce 8600M GT"
.LC7838:
	.string	"NVIDIA Quadro NVS 570M"
	.align 4
.LC7839:
	.string	"Mobile Quadro FX/NVS video card"
.LC7840:
	.string	"G86"
.LC7841:
	.string	"GeForce 8500 GT"
.LC7842:
	.string	"NVIDIA Geforce 8300 GS"
.LC7843:
	.string	"Geforce 8400M GS"
.LC7844:
	.string	"NVIDIA\357\277\275 GeForce 8400M G"
.LC7845:
	.string	"nVidia Quadro FX 570M"
.LC7846:
	.string	"8400 ??"
.LC7847:
	.string	"NVIDIA Quadro NVS 135M"
.LC7848:
	.string	"Quadro FX 360 M"
.LC7849:
	.string	"Quadro FX 360 M (Mobile)"
.LC7850:
	.string	"NVS 290"
.LC7851:
	.string	"NVIDIA Quadro NVS 290"
.LC7852:
	.string	"MCP65"
.LC7853:
	.string	"MCP65 PATA Controller"
.LC7854:
	.string	"MCP65 RAID"
.LC7855:
	.string	"MCP65 AHCI"
.LC7856:
	.string	"MCP67D"
.LC7857:
	.string	"MCP67D AHCI"
.LC7858:
	.string	"MCP65 ?AHCI"
	.align 4
.LC7859:
	.string	"MCP65 SATA Controller(IDE mode)"
.LC7860:
	.string	"NVidia nForce 4 SLI"
.LC7861:
	.string	"MCP67"
	.align 4
.LC7862:
	.string	"MCP67 SATA Controller(IDE mode)"
.LC7863:
	.string	"MCP67 AHCI"
.LC7864:
	.string	"MCP67 RAID"
.LC7865:
	.string	"MCP67 PATA Controller"
.LC7866:
	.string	"MCP73"
.LC7867:
	.string	"MCP73 PATA"
.LC7868:
	.string	"8800 GT"
.LC7869:
	.string	"Alphadog edition from XFX"
.LC7870:
	.string	"nVidia GeForce 9600GT"
.LC7871:
	.string	"G96-300-A1"
	.align 4
.LC7872:
	.string	"Nvidia 9500GT graphic controller"
.LC7873:
	.string	"G96"
.LC7874:
	.string	"GeForce 9500 GS"
.LC7875:
	.string	"nVidia GeForce 9600M GT"
.LC7876:
	.string	"MCP78 NIC"
.LC7877:
	.string	"NForce Network Controller"
.LC7878:
	.string	"MCP ?"
.LC7879:
	.string	"MCP72"
.LC7880:
	.string	"MCP72 AHCI"
.LC7881:
	.string	"MCP72 RAID"
.LC7882:
	.string	"nForce 7100-630i (MCP73PV)"
.LC7883:
	.string	"MCP73 SATA(IDE mode)"
.LC7884:
	.string	"MCP73 AHCI1"
.LC7885:
	.string	"MCP73 AHCI2"
.LC7886:
	.string	"MCP73 AHCI3"
.LC7887:
	.string	"MCP73 AHCI4"
.LC7888:
	.string	"MCP73 RAID1"
.LC7889:
	.string	"MCP73 RAID2"
.LC7890:
	.string	"MCP73 RAID3"
.LC7891:
	.string	"MCP73 RAID4"
	.align 4
.LC7892:
	.string	"NVIDIA nForce System Management Controller"
.LC7893:
	.string	"MCP79"
.LC7894:
	.string	"MCP79 AHCI1"
.LC7895:
	.string	"MCP79 AHCI2"
.LC7896:
	.string	"MCP79 RAID1"
.LC7897:
	.string	"MCP79 RAID2"
.LC7898:
	.string	"MCP78"
.LC7899:
	.string	"SATA Controller IDE mode"
.LC7900:
	.string	"MCP?"
.LC7901:
	.string	"nv11"
.LC7902:
	.string	"geforcemx/mx400"
.LC7903:
	.string	"NV44"
.LC7904:
	.string	"GeForce 6200 TurboCache"
.LC7905:
	.string	"GeForce4 MX 440 AGP 8X"
.LC7906:
	.string	"NVS210S"
.LC7907:
	.string	"GF6150"
.LC7908:
	.string	"nVidia MCP2T"
.LC7909:
	.string	"nVidia MCP2T in MSI MEGA 180"
	.align 4
.LC7910:
	.string	"nVidia MCP73 HDMI Audio Driver"
.LC7911:
	.string	"nVidia GeForce"
.LC7912:
	.string	"Light Pulse"
.LC7913:
	.string	"LP6000"
.LC7914:
	.string	"PL1050Ex"
	.align 4
.LC7915:
	.string	"Emulex 1050EX FC HBA - 2GB PCI-EXPRESS"
.LC7916:
	.string	"LPe1150"
.LC7917:
	.string	"LPe12000"
.LC7918:
	.string	"LP7000"
.LC7919:
	.string	"LP8000"
.LC7920:
	.string	"????"
.LC7921:
	.string	"Light Pulse LP9002 2Gb"
.LC7922:
	.string	"LP9802 / DC"
.LC7923:
	.string	"LP9802 & LP9802DC HBA adapter"
.LC7924:
	.string	"LP10000"
.LC7925:
	.string	"L2A2860 HELIOS v1.11"
.LC7926:
	.string	"Emulex LP11002"
.LC7927:
	.string	"LPe11002-M4"
.LC7928:
	.string	"Dual Channel 4Gb/s"
.LC7929:
	.string	"DC-690c"
.LC7930:
	.string	"DC-290"
.LC7931:
	.string	"62802"
.LC7932:
	.string	"62802-51"
.LC7933:
	.string	"oZ0030"
.LC7934:
	.string	"CA91C042/142"
.LC7935:
	.string	"Universe/II VMEbus Bridge"
.LC7936:
	.string	"Tundra Tsi148"
.LC7937:
	.string	"PCI/X-to-VME Bridge"
.LC7938:
	.string	"Tsi320"
	.align 4
.LC7939:
	.string	"Dual-Mode PCI-to-PCI Bus Bridge"
.LC7940:
	.string	"Tsi850"
.LC7941:
	.string	"Power PC Dual PCI Host Bridge"
	.align 4
.LC7942:
	.string	"Power PC Single PCI Host Bridge"
.LC7943:
	.string	"CA91C860"
	.align 4
.LC7944:
	.string	"QSpan Motorola Processor Bridge"
.LC7945:
	.string	"CA91L862A"
	.align 4
.LC7946:
	.string	"QSpan II PCI-to-Motorola CPU Bridge"
.LC7947:
	.string	"CA91L8200/8260"
	.align 4
.LC7948:
	.string	"PowerSpan II PowerPC-to-PCI Bus Switch"
.LC7949:
	.string	"Q-Motion pci 264"
.LC7950:
	.string	"Video Capture/Edit board"
.LC7951:
	.string	"S5920Q 00144 a038"
.LC7952:
	.string	"amcc PCI MatchMaker"
.LC7953:
	.string	"S5920q"
.LC7954:
	.string	"amcc"
.LC7955:
	.string	"BBK-PCI light"
.LC7956:
	.string	"Transputer Link Interface"
.LC7957:
	.string	"LANai4.x"
.LC7958:
	.string	"Myrinet LANai interface chip"
.LC7959:
	.string	"S5933"
.LC7960:
	.string	"Parastation"
.LC7961:
	.string	"PCI44"
.LC7962:
	.string	"FS"
	.align 4
.LC7963:
	.string	"Kingsberg Spacetec Format Synchronizer"
.LC7964:
	.string	"SOB"
	.align 4
.LC7965:
	.string	"Kingsberg Spacetec Serial Output Board"
.LC7966:
	.string	"Traquair HEPC3"
.LC7967:
	.string	"Data Fire Basic 4MB PCI"
.LC7968:
	.string	"Active ISDN Controller"
.LC7969:
	.string	"PCI MATCHMAKER S5933QC"
.LC7970:
	.string	"Some sort of Bridge?"
.LC7971:
	.string	"PCI-9112"
	.align 4
.LC7972:
	.string	"Data Acquisition Card (ADLINK)"
.LC7973:
	.string	"PCI-7200"
	.align 4
.LC7974:
	.string	"40MB/s 32-channels Digital I/O card (ADLINK)"
.LC7975:
	.string	"PCI-9118"
.LC7976:
	.string	"PCI-DSlink"
.LC7977:
	.string	"PCI-IEEE1355-DS-DE interface"
	.align 4
.LC7978:
	.string	"Matchmaker PCI Chipset Development Tool"
.LC7979:
	.string	"IGA-1680"
.LC7980:
	.string	"svga"
.LC7981:
	.string	"IGA-1682"
.LC7982:
	.string	"video"
.LC7983:
	.string	"IGA-1683"
.LC7984:
	.string	"CyberPro 2010"
	.align 4
.LC7985:
	.string	"TV output ram 2MB  Cyberpro2010"
.LC7986:
	.string	"CyberPro 20xx/2000A"
.LC7987:
	.string	"vbcvbcvbcvb"
.LC7988:
	.string	"CyberPro 5000"
.LC7989:
	.string	"CyberPro 5050"
.LC7990:
	.string	"3GA"
.LC7991:
	.string	"64 bit graphics processor"
.LC7992:
	.string	"Twist3"
.LC7993:
	.string	"Frame Grabber"
.LC7994:
	.string	"AIC-7890AB scsi controller"
	.align 4
.LC7995:
	.string	"AHA-2940U2W/U2B,2950U2W Ultra2 SCSI"
.LC7996:
	.string	"11111"
	.align 4
.LC7997:
	.string	"AHA-2930U2 Ultra2 SCSI Host Adapter"
.LC7998:
	.string	"AIC-7890/1"
.LC7999:
	.string	"AIC-7890 AB for Windows  XP"
.LC8000:
	.string	"Ultra2-Wide SCSI controller"
	.align 4
.LC8001:
	.string	"AHA-3940U2x/3950U2x Ultra2 SCSI Adapter"
	.align 4
.LC8002:
	.string	"AHA-3950U2x Ultra2 SCSI Adapter"
.LC8003:
	.string	"AIC-7896"
.LC8004:
	.string	"AIC-7896/7"
.LC8005:
	.string	"Ultra2 SCSI Controller"
.LC8006:
	.string	"AIC-7892Q"
	.align 4
.LC8007:
	.string	"Ultra160/m PCI SCSI Controller"
.LC8008:
	.string	"AIC-7892B"
.LC8009:
	.string	"Ultra160 SCSI Controller"
.LC8010:
	.string	"AIC-7892D"
.LC8011:
	.string	"AIC-7892"
.LC8012:
	.string	"AIC-7899A"
.LC8013:
	.string	"AIC-7899B"
.LC8014:
	.string	"AIC-7899D"
.LC8015:
	.string	"RAID Subsystem HBA"
.LC8016:
	.string	"AIC-7899G"
.LC8017:
	.string	"AAC-RAID"
	.align 4
.LC8018:
	.string	"Adaptec AAR-2610SA SATA 6-Port Raid"
.LC8019:
	.string	"Adaptec 2410SA SATA RAID"
.LC8020:
	.string	"PCIX133 32/64bit"
.LC8021:
	.string	"AIC 9410"
.LC8022:
	.string	"SAS/SATA Controller"
.LC8023:
	.string	"AIC9450W"
.LC8024:
	.string	"ASC-29320A"
.LC8025:
	.string	"Ultra320 SCSI Controller"
.LC8026:
	.string	"AIC-7901"
.LC8027:
	.string	"ASC-39320"
.LC8028:
	.string	"ASC-39320D"
.LC8029:
	.string	"ASC-29320"
.LC8030:
	.string	"ASC-29320LP"
.LC8031:
	.string	"ASC-39320A"
.LC8032:
	.string	"ASC-29320ALP"
.LC8033:
	.string	"AIC-?????"
.LC8034:
	.string	"AIC-7902B"
.LC8035:
	.string	"AIC-7902"
.LC8036:
	.string	"Ultra320 HostRAID Controller"
.LC8037:
	.string	"HostRAID SCSI Controller"
.LC8038:
	.string	"ASC-29320B"
.LC8039:
	.string	"AIC-7901A"
.LC8040:
	.string	"rtl8139B"
.LC8041:
	.string	"ethernet 10/100"
.LC8042:
	.string	"RTL260"
.LC8043:
	.string	"Driver MS UAA for HD Audio"
.LC8044:
	.string	"ALC882"
.LC8045:
	.string	"Realtek High Definition Audio"
.LC8046:
	.string	"Realtek ALC268"
	.align 4
.LC8047:
	.string	"Audio Device on High Definition Audio Bus"
.LC8048:
	.string	"Realtek HD Audio"
.LC8049:
	.string	"ALC662"
.LC8050:
	.string	"Realtek ALC662 HD Audio"
.LC8051:
	.string	"al880"
.LC8052:
	.string	"REALTEK ALC880"
.LC8053:
	.string	"alc888S"
.LC8054:
	.string	"ALC885"
	.align 4
.LC8055:
	.string	"7.1+2 Channel High-Performance HDA Codec with Content Protection"
.LC8056:
	.string	"realtek high definition audio"
.LC8057:
	.string	"Realtek Azak lia chipset"
.LC8058:
	.string	"RTL8029AS"
.LC8059:
	.string	"NIC"
.LC8060:
	.string	"RTL8029(as)pci ethernet nic"
.LC8061:
	.string	"8101E"
.LC8062:
	.string	"10/100 Ethernet"
.LC8063:
	.string	"10"
	.align 4
.LC8064:
	.string	"32BIT Card Bus 10/100 (10EC-8119)"
.LC8065:
	.string	"RTL8139d"
	.align 4
.LC8066:
	.string	"10/100 Fast Ethernet Controller"
.LC8067:
	.string	"LFE8139ATX"
	.align 4
.LC8068:
	.string	"RTL8100-8101E-8102E-PCIEXPRESS"
.LC8069:
	.string	"RTL8100E/RTL8101E/RTL8102E-GR"
.LC8070:
	.string	"RT8139B/C"
.LC8071:
	.string	"CardBus Fast Ethernet Adapter"
.LC8072:
	.string	"RTL-8139/8139C/8139C+"
	.align 4
.LC8073:
	.string	"Realtek RTL8139 Family PCI Fast Ethernet NIC"
.LC8074:
	.string	"8169"
.LC8075:
	.string	"PCI Gigabit Ethernet"
.LC8076:
	.string	"RTL8168/8111"
	.align 4
.LC8077:
	.string	"Gigabit Ethernet NIC(NDIS 6.0)"
.LC8078:
	.string	"RTL8119"
	.align 4
.LC8079:
	.string	"Single Gigabit LOM Ethernet Controller"
.LC8080:
	.string	"RTL8180"
	.align 4
.LC8081:
	.string	"Realtek RTL8180 Wireless LAN (Mini-)PCI NIC"
.LC8082:
	.string	"RTL-8185"
	.align 4
.LC8083:
	.string	"IEEE 802.11a/b/g Wireless LAN Controller (rev 20)"
.LC8084:
	.string	"RTL8111/8168B"
	.align 4
.LC8085:
	.string	"PCI Express Gigabit Ethernet controller"
.LC8086:
	.string	"8187B"
	.align 4
.LC8087:
	.string	"Wireless 802.11b/g 54Mbps USB 2.0 Network Adapter"
.LC8088:
	.string	"RTL8187SE"
	.align 4
.LC8089:
	.string	"Single-Chip IEEE 802.11b/g WLAN Controller w/PCI Express Interface"
.LC8090:
	.string	"RTL 8168/8111"
.LC8091:
	.string	"GIGABIT ETHERNET LOM"
.LC8092:
	.string	"V7310"
.LC8093:
	.string	"VGA Video Overlay Adapter"
.LC8094:
	.string	"Spartan XC2S50E"
.LC8095:
	.string	"8343176"
.LC8096:
	.string	"PCI to H.100 audio interface"
.LC8097:
	.string	"RME Digi96"
.LC8098:
	.string	"RME Digi96/8"
.LC8099:
	.string	"RME Digi 96/8 Pro"
.LC8100:
	.string	"RME Digi96/8 Pad"
.LC8101:
	.string	"Digi9652"
.LC8102:
	.string	"Hammerfall"
.LC8103:
	.string	"0"
.LC8104:
	.string	"HDSP 9632"
.LC8105:
	.string	"Seamont SC100"
.LC8106:
	.string	"Security Adapter"
.LC8107:
	.string	"Durango PMC"
	.align 4
.LC8108:
	.string	"Virtex-II Bridge, XC2V1000-4FG456C"
.LC8109:
	.string	"Santos"
.LC8110:
	.string	"XA3S1600E"
.LC8111:
	.string	"Spartan 3E"
.LC8112:
	.string	"M815x"
.LC8113:
	.string	"Token Ring Adapter"
.LC8114:
	.string	"VCL-P"
.LC8115:
	.string	"Graphics board"
.LC8116:
	.string	"VCL-M"
.LC8117:
	.string	"graphics board"
.LC8118:
	.string	"IDE/SCSI"
.LC8119:
	.string	"Multimedia"
.LC8120:
	.string	"RS-56 sp-pci"
.LC8121:
	.string	"Conexant RS-56 PCI Modem"
.LC8122:
	.string	"rev1.1"
	.align 4
.LC8123:
	.string	"PCI to S5U13x06B0B Bridge Adapter"
.LC8124:
	.string	"NDR4000"
.LC8125:
	.string	"NR4600 Bridge"
.LC8126:
	.string	"PCIVEN"
	.align 4
.LC8127:
	.string	"CMI8738/C3DX Multimedia Audio Controller"
.LC8128:
	.string	"Targa 1000"
.LC8129:
	.string	"Video Capture & Editing card"
.LC8130:
	.string	"TH6255"
.LC8131:
	.string	"4020011B"
.LC8132:
	.string	"VT6306L"
	.align 4
.LC8133:
	.string	"IEEE1394 Firewire 3 Port PCI Card"
.LC8134:
	.string	"INI-920"
.LC8135:
	.string	"Ultra SCSI Adapter"
.LC8136:
	.string	"INI-A100U2W"
	.align 4
.LC8137:
	.string	"Orchid Ultra-2 SCSI Controller"
.LC8138:
	.string	"INIC1620"
.LC8139:
	.string	"PCI SATA Controller"
.LC8140:
	.string	"INI-9010/9010W"
.LC8141:
	.string	"INIC-940"
.LC8142:
	.string	"INIC-935"
.LC8143:
	.string	"1101"
.LC8144:
	.string	"SCSI Initio ultra"
.LC8145:
	.string	"INIC-950P"
.LC8146:
	.string	"Ultrawide SCSI controller"
.LC8147:
	.string	"Fast Wide SCSI"
.LC8148:
	.string	"t4780010004541"
	.align 4
.LC8149:
	.string	"Sound Blaster Live! (Also Live! 5.1) - OEM from DELL - CT4780"
.LC8150:
	.string	"EMU8008"
.LC8151:
	.string	"AWE64D OEM (CT4600)"
.LC8152:
	.string	"Creative SB Audigy 2 ZS (WDM)"
.LC8153:
	.string	"Audigy Audio Processor"
.LC8154:
	.string	"SB0460"
.LC8155:
	.string	"SoundBlaster X-FI XtremeMusic"
.LC8156:
	.string	"emu10k1x"
.LC8157:
	.string	"Soundblaster Live! 5.1"
.LC8158:
	.string	"C6SB0410515017656A"
.LC8159:
	.string	"Audigy ls"
.LC8160:
	.string	"ca0108"
.LC8161:
	.string	"sound blaster Audigy 2"
.LC8162:
	.string	"CT6760"
.LC8163:
	.string	"3D Blaster Banshee PCI CT6760"
.LC8164:
	.string	"3D Blaster RIVA TNT2"
.LC8165:
	.string	"EV1938"
.LC8166:
	.string	"3D Blaster Annihilator 2"
.LC8167:
	.string	"ES1371-3"
.LC8168:
	.string	" ES1373 AudioPCI"
.LC8169:
	.string	"es2898"
.LC8170:
	.string	"es56t-p1"
.LC8171:
	.string	"EMU10K1"
	.align 4
.LC8172:
	.string	"Audigy IEEE1394a Firewire Controller"
.LC8173:
	.string	"EMU10000"
.LC8174:
	.string	"Game Port"
.LC8175:
	.string	"EMU10K2"
	.align 4
.LC8176:
	.string	"Creative Labs SB Audigy MIDI/Game port"
.LC8177:
	.string	"6"
.LC8178:
	.string	"Game port for SB Live! Series"
.LC8179:
	.string	"Audigy LS Series Game Port"
.LC8180:
	.string	"EMU1OK1-NGF"
	.align 4
.LC8181:
	.string	"Environmental Audio (SB  Live)"
.LC8182:
	.string	"Sound"
.LC8183:
	.string	"EM8400"
.LC8184:
	.string	"EM8475"
.LC8185:
	.string	"MPEG-4 Decoder"
.LC8186:
	.string	"VT6305"
	.align 4
.LC8187:
	.string	"VIA Fire 1394.A OHCI Link Layer Ctrlr"
.LC8188:
	.string	"K8T890"
.LC8189:
	.string	"KT880"
.LC8190:
	.string	"K8T880Pro"
.LC8191:
	.string	"VT8363A/8365"
.LC8192:
	.string	"VT8363/71"
.LC8193:
	.string	"VT8501"
.LC8194:
	.string	"82C505"
.LC8195:
	.string	"VLB to PCI Bridge"
.LC8196:
	.string	"82C570 MV"
	.align 4
.LC8197:
	.string	"VT82C586A/B/VT82C686/A/B/VT823x/A/C"
.LC8198:
	.string	"82C576"
.LC8199:
	.string	"P54 Ctrlr"
.LC8200:
	.string	"CX700"
.LC8201:
	.string	"SATA RAID"
.LC8202:
	.string	"VT82C585VP/VPX"
.LC8203:
	.string	"Host Bus-PCI Bridge"
.LC8204:
	.string	"VT82C586VP"
.LC8205:
	.string	"VT8237S"
	.align 4
.LC8206:
	.string	"VIA VT8237A SATA RAID Controller"
.LC8207:
	.string	"VT82C595"
.LC8208:
	.string	"Apollo VP2 PCI North Bridge"
.LC8209:
	.string	"VT82C596"
.LC8210:
	.string	"PCI ISA Bridge"
.LC8211:
	.string	"VT82C597"
.LC8212:
	.string	"Host Bridge (Apollo VP3)"
.LC8213:
	.string	"VT82C598"
.LC8214:
	.string	"VIA8601"
.LC8215:
	.string	"VT82c686b"
.LC8216:
	.string	"PM133 System Control"
.LC8217:
	.string	"VT82C680"
.LC8218:
	.string	"Apollo P6"
.LC8219:
	.string	"VT82C686/686A/686B"
.LC8220:
	.string	"PCI-to-ISA bridge"
.LC8221:
	.string	"VIA VT KN133"
.LC8222:
	.string	"Mainboard"
.LC8223:
	.string	"VT82C693"
.LC8224:
	.string	"VT86C926"
	.align 4
.LC8225:
	.string	"Amazon PCI Ethernet Controller"
.LC8226:
	.string	"82C570MV"
.LC8227:
	.string	"060000A"
.LC8228:
	.string	"ISA Bridge w/IDE"
.LC8229:
	.string	"CPU to PCI"
.LC8230:
	.string	"VT82C416"
.LC8231:
	.string	"VT82C595/97"
.LC8232:
	.string	"0x1708"
.LC8233:
	.string	"VEN_1106&DEV_1708"
.LC8234:
	.string	"VT6105M"
	.align 4
.LC8235:
	.string	"VIA Rhine III VT6105M Fast Ethernet controller"
.LC8236:
	.string	"K8M400 chipset"
	.align 4
.LC8237:
	.string	"VT83C572/6202/82C586A/B/82C596/A/B/82C686A/B etc"
.LC8238:
	.string	"USB&UHCI"
.LC8239:
	.string	"VT6202"
.LC8240:
	.string	"4 x USB1.0 PCI controller"
.LC8241:
	.string	"VT82C586A/B"
.LC8242:
	.string	"APM(or ACPIAPIC?)"
.LC8243:
	.string	"VT86C100A"
.LC8244:
	.string	"Rhine 10/100 Ethernet Adapter"
.LC8245:
	.string	"VT6307"
	.align 4
.LC8246:
	.string	"VIA Fire II 1394a OHCI Link Layer Ctrlr1"
.LC8247:
	.string	"VT82C596/596A/596"
	.align 4
.LC8248:
	.string	"Power Management and SMBus Controller"
.LC8249:
	.string	"Rhine III Management Adapter"
.LC8250:
	.string	"VT82C686A/B"
	.align 4
.LC8251:
	.string	"ACPI Power Management Controller"
	.align 4
.LC8252:
	.string	"AC97 Audio Codec (All VIA Chipsets)"
.LC8253:
	.string	"VT6102"
	.align 4
.LC8254:
	.string	"Rhine II PCI Fast Ethernet Controller||Used by GERICOM in laptop Webengine Advanced"
.LC8255:
	.string	"VT82C686A/B&VT8231"
	.align 4
.LC8256:
	.string	"&CC_0000=ACPIAPIC,&CC_0780=MC97 MODEM"
.LC8257:
	.string	"APM(or ACPI?)"
.LC8258:
	.string	"MC97 MODEM"
.LC8259:
	.string	"VT8233"
.LC8260:
	.string	"VT82C686"
.LC8261:
	.string	"Power"
.LC8262:
	.string	"VT8633"
.LC8263:
	.string	"VT8366/66A/67"
.LC8264:
	.string	"VT8653"
.LC8265:
	.string	"VT8362"
.LC8266:
	.string	"VT8615"
.LC8267:
	.string	"VT6105M/LOM"
	.align 4
.LC8268:
	.string	"Rhine III PCI Fast Ethernet Controller"
	.align 4
.LC8269:
	.string	"VT8233/A AC97' Enhance Audio Controller"
	.align 4
.LC8270:
	.string	"Via Unichrome S3 VGA - part of a VIA Northbridge"
.LC8271:
	.string	"VT8375"
.LC8272:
	.string	"CPU-to-PCI Bridge"
.LC8273:
	.string	"CN400"
	.align 4
.LC8274:
	.string	"Via Built-In VGA S3 Graphics UniChrome\357\277\275 Pro IGP Series CN400"
.LC8275:
	.string	"VT6120/VT6121/VT6122"
	.align 4
.LC8276:
	.string	"'Velocity' Gigabit Ethernet Controllers"
.LC8277:
	.string	"VT8623"
.LC8278:
	.string	"CastleRock AGP 8X Controller"
.LC8279:
	.string	"vt8753"
.LC8280:
	.string	"VT3133"
.LC8281:
	.string	"VT8751"
.LC8282:
	.string	"VT8237 Family/ VT6420"
.LC8283:
	.string	"VT8372"
.LC8284:
	.string	"VT6410"
	.align 4
.LC8285:
	.string	"VIA VT6410 PATA/PATA RAID Controller"
.LC8286:
	.string	"VT8374"
	.align 4
.LC8287:
	.string	"P4X400 Host Controller/AGP Bridge"
.LC8288:
	.string	"VT8235"
.LC8289:
	.string	"K8HTB-8237"
.LC8290:
	.string	"VT8377"
	.align 4
.LC8291:
	.string	"VEN_1106&DEV_B198&SUBSYS_00000000&REV_00"
.LC8292:
	.string	"1394 i2c"
.LC8293:
	.string	"PT890"
.LC8294:
	.string	"K8N890CE Display Driver"
.LC8295:
	.string	"Integrated Graphics"
.LC8296:
	.string	"VT6421"
.LC8297:
	.string	"VIA VT6421 RAID Controller"
.LC8298:
	.string	"PT880"
.LC8299:
	.string	"040300"
	.align 4
.LC8300:
	.string	"VIA VT8251/8237A High Definition Audio Controller - HDA Codec Realtek ALC660"
.LC8301:
	.string	"81CE1043"
.LC8302:
	.string	"P4M800PRO&8237R"
.LC8303:
	.string	"VIA/S3G UniChrome Pro IGP"
.LC8304:
	.string	"VT8251"
	.align 4
.LC8305:
	.string	"VIA VT8251 AHCI RAID Controller"
.LC8306:
	.string	"P4M900"
.LC8307:
	.string	"VIA Chrome9 HC IGP"
.LC8308:
	.string	"VT6420"
.LC8309:
	.string	"PATA"
.LC8310:
	.string	"VIA VT86C100A"
	.align 4
.LC8311:
	.string	"Rhine II PCI Fast SATA and ethernet controller"
.LC8312:
	.string	"K8M400"
.LC8313:
	.string	"KM400"
	.align 4
.LC8314:
	.string	"VIA Technologies, Inc. VT8378 [S3 UniChrome] Graphics Adapter"
.LC8315:
	.string	"PM880"
.LC8316:
	.string	"PT890?"
.LC8317:
	.string	"VT8231"
.LC8318:
	.string	"VT8363A/65"
.LC8319:
	.string	"PCI-to-PCI Bridge (AGP)"
.LC8320:
	.string	"VT82C601"
.LC8321:
	.string	"CPU to AGP Bridge"
.LC8322:
	.string	"VT8605"
.LC8323:
	.string	"PCI-to-PCI Bridge(AGP)"
.LC8324:
	.string	"VT82C691/693A/694X"
.LC8325:
	.string	"I/O APIC"
.LC8326:
	.string	"VT8601"
.LC8327:
	.string	"2D/3D Graphics Accelerator"
.LC8328:
	.string	"VT8366/A"
.LC8329:
	.string	"VT8363/65"
.LC8330:
	.string	"CPU to AGP Controller"
.LC8331:
	.string	"vt686b"
.LC8332:
	.string	"VT8751 Apollo"
.LC8333:
	.string	"PCI-to-Host"
	.align 4
.LC8334:
	.string	"PCI-to-PCI Bridge (AGP 2.0/3.0)"
.LC8335:
	.string	"3200+"
.LC8336:
	.string	"546546"
.LC8337:
	.string	"p1690plus-AA"
.LC8338:
	.string	"p1690plus-AB"
.LC8339:
	.string	"2-Port Token Ring Adapter"
.LC8340:
	.string	"P1690Plus"
.LC8341:
	.string	"EM110TX"
	.align 4
.LC8342:
	.string	"EX110TX PCI Fast Ethernet Adapter"
.LC8343:
	.string	"Mpact"
.LC8344:
	.string	"Media Processor"
.LC8345:
	.string	"GM90C7110VX"
.LC8346:
	.string	"MPACT DVD decoder."
.LC8347:
	.string	"DS3131"
	.align 4
.LC8348:
	.string	"BoSS Bit Synchronous HDLC Controller"
.LC8349:
	.string	"DS3134"
	.align 4
.LC8350:
	.string	"Chateau Channelized T1/E1/HDLC Controller"
.LC8351:
	.string	"FFK 8508"
	.align 4
.LC8352:
	.string	"Encore ENL832-TX-ICNT Fast  Ethernet PCI Adapter"
.LC8353:
	.string	"ST201"
.LC8354:
	.string	"Fast Ehternet Adapter"
.LC8355:
	.string	"NX1001"
.LC8356:
	.string	"Network Adapter"
.LC8357:
	.string	"NX1101"
	.align 4
.LC8358:
	.string	"-PCIVEN_13F0&DEV_1023&SUBSYS_81801043&REV_414&BC"
.LC8359:
	.string	"ST201 Fast Ethernet Adapter"
.LC8360:
	.string	"--"
.LC8361:
	.string	"m583mlr"
.LC8362:
	.string	"9432 TX"
.LC8363:
	.string	"hd 2600xt"
.LC8364:
	.string	"40371409"
	.align 4
.LC8365:
	.string	"PCI / ISA Asynchronous UART Signal Chips Solution"
	.align 4
.LC8366:
	.string	"PCI / ISA IEEE1284 ECP/EPP/SPP/BPP Signal Chips So"
.LC8367:
	.string	"PCI parallel port"
.LC8368:
	.string	"Na"
.LC8369:
	.string	"OX9162"
.LC8370:
	.string	"PCI Interface to local bus"
.LC8371:
	.string	"Parallel Port"
.LC8372:
	.string	"OX16PCI954"
.LC8373:
	.string	"Quad UART (disabled)"
.LC8374:
	.string	"OXm16PCI952"
.LC8375:
	.string	"Dual PCI UARTS"
.LC8376:
	.string	"OXCB950"
	.align 4
.LC8377:
	.string	"Integrated High Performance UART"
.LC8378:
	.string	"PCI Interface (disabled)"
.LC8379:
	.string	"OX9160"
	.align 4
.LC8380:
	.string	"PCI Interface to 8-bit local bus"
.LC8381:
	.string	"PCI Interface to 32-bit bus"
.LC8382:
	.string	"Integrated Parallel Port"
.LC8383:
	.string	"KFIR"
.LC8384:
	.string	"MPEG decoder"
.LC8385:
	.string	"NX6800-TD256E"
.LC8386:
	.string	"883"
.LC8387:
	.string	"Audio controller"
.LC8388:
	.string	"MCP2T"
.LC8389:
	.string	"RoadRunner 10"
.LC8390:
	.string	"ADSL PCI"
.LC8391:
	.string	"R6795-12"
.LC8392:
	.string	"RH56D-PCI"
.LC8393:
	.string	"LANai 9.2 0129"
.LC8394:
	.string	"MyriNet"
.LC8395:
	.string	"FPMC-FIO1-F100-1"
	.align 4
.LC8396:
	.string	"Serial I/O Controller aka FPMC-DFLEX64"
.LC8397:
	.string	"AP1011/SP1011"
	.align 4
.LC8398:
	.string	"Sturgeon HyperTransport-PCI Bridge"
.LC8399:
	.string	"BCM33xx/47xx"
	.align 4
.LC8400:
	.string	"Sentry5 Chipcommon I/O Controller"
.LC8401:
	.string	"Sentry5 PCI Bridge"
.LC8402:
	.string	"Sentry5 MIPS32 CPU"
.LC8403:
	.string	"Sentry5 Ethernet Controller"
.LC8404:
	.string	"Sentry5 Crypto Accelerator"
	.align 4
.LC8405:
	.string	"Sentry5 DDR/SDR RAM Controller"
.LC8406:
	.string	"Sentry5 External Interface"
.LC8407:
	.string	"BCM3302"
.LC8408:
	.string	"BCM5787M"
	.align 4
.LC8409:
	.string	"802.11b/g Wireless Lan Controller"
.LC8410:
	.string	"BCM5752"
	.align 4
.LC8411:
	.string	"NetXtreme BCM5752 Gigabit Ethernet PCI Express"
.LC8412:
	.string	"BCM5709"
.LC8413:
	.string	"NetXtreme II Gigabit Ethernet"
.LC8414:
	.string	" BCM5751F"
.LC8415:
	.string	"ven_1102dev_0004"
.LC8416:
	.string	"BCM5701"
	.align 4
.LC8417:
	.string	"broadtcomBCM5701 Gigabit Ethernet"
.LC8418:
	.string	"BCM5702x1"
.LC8419:
	.string	"NetXtreme Gigabit Ethernet"
.LC8420:
	.string	"BCM5704"
	.align 4
.LC8421:
	.string	"NetXtreme Dual Gigabit Adapter"
.LC8422:
	.string	"BCM5708"
	.align 4
.LC8423:
	.string	"Broadcom NetXtreme II Gigabit Ethernet Adapter"
.LC8424:
	.string	"BCM5702FE"
	.align 4
.LC8425:
	.string	"NetXtreme Fast Ethernet Controller"
.LC8426:
	.string	"BCM5788"
	.align 4
.LC8427:
	.string	"Broadcom NetXtreme Gigabit Ethernet"
.LC8428:
	.string	"BCM5705-"
.LC8429:
	.string	"BCM5750"
.LC8430:
	.string	"BCM5721"
	.align 4
.LC8431:
	.string	"NetXtreme Gigabit Ethernet PCI Express"
.LC8432:
	.string	"94309"
	.align 4
.LC8433:
	.string	"Broadcom NetXtreme BCM5722 Gigabit"
.LC8434:
	.string	"BCM5705M"
.LC8435:
	.string	"BCM5780"
	.align 4
.LC8436:
	.string	"Broadcom NetXtreme Gigabit Ethernet 5780"
.LC8437:
	.string	"BCM5780S"
.LC8438:
	.string	"BCM5705MFE"
.LC8439:
	.string	"NetXtreme Ethernet 100kB"
.LC8440:
	.string	"BCM5705"
.LC8441:
	.string	"BCM5751F"
.LC8442:
	.string	"BCM5754M"
.LC8443:
	.string	"B5755M"
.LC8444:
	.string	"BCM5750A1"
.LC8445:
	.string	"BCM5782"
	.align 4
.LC8446:
	.string	"Broadcom NetExtreme Gigabit Ethernet"
.LC8447:
	.string	"BCM5754"
	.align 4
.LC8448:
	.string	"Broadcom NetXtreme Gigabit Ethernet Controller"
.LC8449:
	.string	"BCM5755/5780"
.LC8450:
	.string	"BCM5751M"
.LC8451:
	.string	"BCM5751FKFB"
.LC8452:
	.string	"vierkant"
.LC8453:
	.string	"BCM5787A"
	.align 4
.LC8454:
	.string	"Ethernet Controller Broadcom Netlink Gigabit"
	.align 4
.LC8455:
	.string	"Broadcom NetXtreme Gigabit Ethernet for hp"
.LC8456:
	.string	"BCM5784M"
.LC8457:
	.string	"NetLink"
.LC8458:
	.string	"BCM5786"
.LC8459:
	.string	"BCM5787"
	.align 4
.LC8460:
	.string	"Broadcom NetLink (TM) Gigabit Ethernet"
.LC8461:
	.string	"BCM5782k FB"
.LC8462:
	.string	"Broadcom Ethernet Adapter"
.LC8463:
	.string	"BCM5702X"
.LC8464:
	.string	"BCM5703X"
.LC8465:
	.string	"B06BDRV"
.LC8466:
	.string	"BroadCom NetExtreme II Server"
.LC8467:
	.string	"BCM5702A3"
.LC8468:
	.string	"BCM 5703CKHB"
.LC8469:
	.string	"BCM5781"
.LC8470:
	.string	"BCM5753"
	.align 4
.LC8471:
	.string	"NetXtreme BCM5753 Gigabit PCI Express"
.LC8472:
	.string	"BCM5753M"
	.align 4
.LC8473:
	.string	"NetXtreme Gigabit Ethernet PciXpress"
.LC8474:
	.string	"BCM5753F"
.LC8475:
	.string	"BCM4401"
	.align 4
.LC8476:
	.string	"Broadcom NetLink 4401 10/100 Ethernet NIC"
.LC8477:
	.string	"BCM5901"
.LC8478:
	.string	"NetXtreme"
.LC8479:
	.string	"NetXtreme 100Base-TX"
.LC8480:
	.string	"BCM5906m"
	.align 4
.LC8481:
	.string	"Broadcom NetLink (TM) Fast Ethernet"
.LC8482:
	.string	"BCM3352"
	.align 4
.LC8483:
	.string	"BCM3352 QAMLink\357\277\275 Single-Chip 4-Line VoIP"
.LC8484:
	.string	"BCM3360"
	.align 4
.LC8485:
	.string	"Advanced PHY Broadband Gateway Cable Modem"
.LC8486:
	.string	"BCM HPNA"
.LC8487:
	.string	"10Mb/s NIC"
.LC8488:
	.string	"BCM V.90"
.LC8489:
	.string	"56k Modem"
.LC8490:
	.string	"BCM4301 802.11b"
	.align 4
.LC8491:
	.string	"Dell Truemobile 1180 802.11b MiniPCI"
.LC8492:
	.string	"BCM4303"
	.align 4
.LC8493:
	.string	"BCM4301 802.11b802.11b Wireless LAN Controller"
.LC8494:
	.string	"BCM4307"
.LC8495:
	.string	"V.90 56k Modem"
.LC8496:
	.string	"BCM4306"
.LC8497:
	.string	"Unknown device 4306 (rev 02)"
	.align 4
.LC8498:
	.string	"802.11b Wireless LAN Controller"
.LC8499:
	.string	"BCM4310"
	.align 4
.LC8500:
	.string	"BCM4301 802.11bChipcommon I/O Controller"
.LC8501:
	.string	"BCM4311"
	.align 4
.LC8502:
	.string	"Broadcom Corporation Dell Wireless 1390 WLAN Mini-PCI Card"
.LC8503:
	.string	"broadcom wireless 1490 (dell)"
	.align 4
.LC8504:
	.string	"usb controller, wireless network card"
.LC8505:
	.string	"BCM2046"
.LC8506:
	.string	"Broadcom Wireless "
.LC8507:
	.string	"BCM43XX"
.LC8508:
	.string	"Broadcom 802.11b/g"
.LC8509:
	.string	"BCM94309"
	.align 4
.LC8510:
	.string	"802.11b/g Wireless LAN Controller"
	.align 4
.LC8511:
	.string	"802.11a Wireless LAN Controller"
.LC8512:
	.string	"UART"
.LC8513:
	.string	"BCM4309"
	.align 4
.LC8514:
	.string	"802.11a/b/g Wireless LAN Controller"
.LC8515:
	.string	"Chipcommon I/O Controller?"
.LC8516:
	.string	"BCM94321KFBG"
	.align 4
.LC8517:
	.string	"Broadcom 4321AGN 802.11a/b/g/draft-n Wi-Fi Solution"
	.align 4
.LC8518:
	.string	"10/100 Integrated Ethernet Controller"
.LC8519:
	.string	"BCM4402"
.LC8520:
	.string	"BCM4413"
.LC8521:
	.string	"iLine32 HomePNA 2.0"
.LC8522:
	.string	"BCM4212"
.LC8523:
	.string	"BCM4412"
.LC8524:
	.string	"10/100BaseT Ethernet"
.LC8525:
	.string	"BCM44xx"
.LC8526:
	.string	"CardBus iLine32 HomePNA 2.0"
.LC8527:
	.string	"CardBus 10/100BaseT Ethernet"
.LC8528:
	.string	"BCM4610"
.LC8529:
	.string	"Sentry5 PCI to SB Bridge"
.LC8530:
	.string	"Sentry5 iLine32 HomePNA 1.0"
.LC8531:
	.string	"Sentry5 V.90 56k Modem"
.LC8532:
	.string	"Sentry5 USB Controller"
.LC8533:
	.string	"BCM4704"
.LC8534:
	.string	"BCM4710"
.LC8535:
	.string	"BCM47xx"
.LC8536:
	.string	"Sentry5 iLine32 HomePNA 2.0"
.LC8537:
	.string	"Sentry5 V.92 56k modem"
.LC8538:
	.string	"Sentry5 USB Host Controller"
.LC8539:
	.string	"Sentry5 USB Device Controller"
.LC8540:
	.string	"BCM4712"
.LC8541:
	.string	"MIPS CPU"
.LC8542:
	.string	"BCM5365P"
.LC8543:
	.string	"BCM5600"
	.align 4
.LC8544:
	.string	"StrataSwitch 24+2 Ethernet Switch Controller"
.LC8545:
	.string	"BCM5605"
.LC8546:
	.string	"BCM5615"
.LC8547:
	.string	"BCM5625"
.LC8548:
	.string	"BCM5645"
.LC8549:
	.string	"BCM5670"
	.align 4
.LC8550:
	.string	"8-Port 10GE Ethernet Switch Fabric"
.LC8551:
	.string	"BCM5680"
	.align 4
.LC8552:
	.string	"G-Switch 8-Port Gigabit Ethernet Switch Controller"
.LC8553:
	.string	"BCM5690"
	.align 4
.LC8554:
	.string	"12-port Multi-Layer Gigabit Ethernet Switch"
.LC8555:
	.string	"BCM5691"
	.align 4
.LC8556:
	.string	"GE/10GE 8+2 Gigabit Ethernet Switch Controller"
.LC8557:
	.string	"BCM5802"
	.align 4
.LC8558:
	.string	"The BCM5802 Security Processor integrates Broadcom\357\277\275s IPSec engine (DES, 3DES, HMAC-SHA-1, HMAC-MD5),"
.LC8559:
	.string	"BCM5805"
	.align 4
.LC8560:
	.string	"The BCM5805 Security Processor integrates a high-performance IPSec engine (DES, 3DES, HMAC-SHA-1, HM"
.LC8561:
	.string	"BCM5820"
.LC8562:
	.string	"BCM5821"
.LC8563:
	.string	"BCM5822"
.LC8564:
	.string	"BCM5823"
.LC8565:
	.string	"BCM5824"
.LC8566:
	.string	"BCM5840"
.LC8567:
	.string	"BCM5841"
.LC8568:
	.string	"BCM5850"
.LC8569:
	.string	"BCM5751"
.LC8570:
	.string	"network card integrated"
.LC8571:
	.string	"BCM7411"
	.align 4
.LC8572:
	.string	"High Definition Video/Audio Decoder"
.LC8573:
	.string	"1364103c"
.LC8574:
	.string	"subsys"
.LC8575:
	.string	"BEMx.x"
	.align 4
.LC8576:
	.string	"PCI to S5U13xxxB00B Bridge Adapter"
.LC8577:
	.string	"S1D13808"
	.align 4
.LC8578:
	.string	"Embedded Memory Display Controller"
.LC8579:
	.string	"9400-0931"
.LC8580:
	.string	"CharKey"
.LC8581:
	.string	"H260u"
	.align 4
.LC8582:
	.string	"H260u printer server for HP Printer"
.LC8583:
	.string	"PIXCI CL1"
	.align 4
.LC8584:
	.string	"PCI camera link video capture board"
.LC8585:
	.string	"PIXCI D2X"
	.align 4
.LC8586:
	.string	"PCI digital video capture board"
.LC8587:
	.string	"PIXCI D3X"
.LC8588:
	.string	"MTD800"
.LC8589:
	.string	"Myson MTD803/TAMARACK TC6020"
.LC8590:
	.string	"PCI Ethernet controller"
.LC8591:
	.string	"MTD891"
	.align 4
.LC8592:
	.string	"10/100/1000 Mbps Gigabit Ethernet Controller"
.LC8593:
	.string	"2200"
.LC8594:
	.string	"FDDI adapter"
.LC8595:
	.string	"2300"
.LC8596:
	.string	"Fast Ethernet adapter"
.LC8597:
	.string	"2340"
	.align 4
.LC8598:
	.string	"4 Port 10/100 UTP Fast Ethernet Adapter"
.LC8599:
	.string	"2400"
.LC8600:
	.string	"mpx en5038a1"
.LC8601:
	.string	"0A422T1 118F"
.LC8602:
	.string	"EN5251BE"
.LC8603:
	.string	"accton  EN5251BE"
.LC8604:
	.string	"EN-2242"
.LC8605:
	.string	"EN-1660"
.LC8606:
	.string	"EN-1207D"
.LC8607:
	.string	"SMC en5251be"
.LC8608:
	.string	"0445tabgf16143.1"
.LC8609:
	.string	"Ethernet Controller/ drivers"
.LC8610:
	.string	"saa1735hl"
.LC8611:
	.string	"tv"
.LC8612:
	.string	"AT76C506"
	.align 4
.LC8613:
	.string	"802.11b Wireless Network Adaptor"
.LC8614:
	.string	"AT97SC3202"
.LC8615:
	.string	"TPM - Trusted Platform Module"
.LC8616:
	.string	"DT3001"
.LC8617:
	.string	"DT3002"
.LC8618:
	.string	"DT3003"
.LC8619:
	.string	"DT3004"
.LC8620:
	.string	"Dt3005"
.LC8621:
	.string	"DT3001-PGL"
.LC8622:
	.string	"DT3003-PGL"
.LC8623:
	.string	"max-lc SVGA card"
.LC8624:
	.string	"MaxPCI image processing board"
.LC8625:
	.string	"GDT6000/6020/6050"
.LC8626:
	.string	"PCI SCSI RAID Controller"
.LC8627:
	.string	"GDT6000/6010"
	.align 4
.LC8628:
	.string	"PCI 1-channel SCSI RAID Controller"
.LC8629:
	.string	"GDT6110/6510"
.LC8630:
	.string	"GDT6120/6520"
	.align 4
.LC8631:
	.string	"PCI 2-channel SCSI RAID Controller"
.LC8632:
	.string	"GDT6530"
	.align 4
.LC8633:
	.string	"PCI 3-channel SCSI RAID Controller"
.LC8634:
	.string	"GDT6550"
	.align 4
.LC8635:
	.string	"PCI 5-channel SCSI RAID Controller"
.LC8636:
	.string	"GDT6117/6517"
.LC8637:
	.string	"Wide Ultra SCSI Controller"
.LC8638:
	.string	"GDT6127/6527"
.LC8639:
	.string	"GDT6537"
.LC8640:
	.string	"GDT6557/6557-ECC"
.LC8641:
	.string	"GDT6115/6515"
.LC8642:
	.string	"Ultra SCSI Controller"
.LC8643:
	.string	"GDT6125/6525"
.LC8644:
	.string	"Wide SCSI Controller"
.LC8645:
	.string	"GDT6535"
.LC8646:
	.string	"GDT6555/6555-ECC"
.LC8647:
	.string	"GDT6117RP/6517RP"
.LC8648:
	.string	"2 Channel Wide Ultra SCSI"
.LC8649:
	.string	"GDT6127RP/6527RP"
.LC8650:
	.string	"Wide Ultra SCSI HBA"
.LC8651:
	.string	"GDT6537RP"
.LC8652:
	.string	"GDT6557RP"
.LC8653:
	.string	"GDT6111RP/6511RP"
.LC8654:
	.string	"Ultra SCSI HBA"
.LC8655:
	.string	"GDT6121RP/6521RP"
.LC8656:
	.string	"GDT6117RD/6517RD"
.LC8657:
	.string	"GDT6127RD/6527RD"
.LC8658:
	.string	"GDT6537RD"
.LC8659:
	.string	"GDT6557RD"
.LC8660:
	.string	"GDT6111RD/6511RD"
.LC8661:
	.string	"GDT6x18RD"
.LC8662:
	.string	"Wide Ultra2 SCSI HBA"
.LC8663:
	.string	"GDT6x28RD"
.LC8664:
	.string	"GDT6538RD/6638RD"
.LC8665:
	.string	"GDT6558RD/6658RD"
.LC8666:
	.string	"GDT6117RP2/6517RP2"
.LC8667:
	.string	"GDT6127RP2/6527RP2"
.LC8668:
	.string	"GDT6537RP2"
.LC8669:
	.string	"GDT6557RP2"
.LC8670:
	.string	"GDT6111RP2/6511RP2"
.LC8671:
	.string	"GDT 6x13RS"
.LC8672:
	.string	"GDT 6x23RS"
.LC8673:
	.string	"Disk Array Controller"
.LC8674:
	.string	"GDT 6x18RS"
.LC8675:
	.string	"GDT 6x28RS"
.LC8676:
	.string	"GDT 6x38RS"
.LC8677:
	.string	"GDT 6x58RS"
.LC8678:
	.string	"GDT 6x33RS"
.LC8679:
	.string	"GDT 6x43RS"
.LC8680:
	.string	"GDT 6x53RS"
.LC8681:
	.string	"GDT 6x63RS"
.LC8682:
	.string	"GDT 7x13RN"
.LC8683:
	.string	"GDT 7x23RN"
.LC8684:
	.string	"GDT7x18RN"
	.align 4
.LC8685:
	.string	"64-bit PCI Wide Untra2 SCSI HBA"
.LC8686:
	.string	"GDT7x28RN"
	.align 4
.LC8687:
	.string	"64-bit PCI Wide Ultra2 SCSI HBA"
.LC8688:
	.string	"GDT7538RN/7638RN"
.LC8689:
	.string	"GDT7558RN/7658RN"
.LC8690:
	.string	"GDT 7x33RN"
.LC8691:
	.string	"GDT 7x43RN"
.LC8692:
	.string	"GDT 7x53RN"
.LC8693:
	.string	"GDT 7x63RN"
.LC8694:
	.string	"GDT 4x13RZ"
.LC8695:
	.string	"GDT 4x23RZ"
.LC8696:
	.string	"GDT 8x13RZ"
.LC8697:
	.string	"GDT 8x23RZ"
.LC8698:
	.string	"GDT 8x33RZ"
.LC8699:
	.string	"GDT 8x43RZ"
.LC8700:
	.string	"GDT 8x53RZ"
.LC8701:
	.string	"GDT 8x63RZ"
.LC8702:
	.string	"GDT6519RD/6619RD"
.LC8703:
	.string	"Fibre Channel HBA"
.LC8704:
	.string	"GDT6529RD/6629RD"
.LC8705:
	.string	"GDT7519RN/7619RN"
.LC8706:
	.string	"64-bit PCI Fibre Channel HBA"
.LC8707:
	.string	"GDT7529RN/7629RN"
.LC8708:
	.string	"GDT Rx"
.LC8709:
	.string	"155P-MF1"
.LC8710:
	.string	"166P-MF1"
.LC8711:
	.string	"ENI-25P"
.LC8712:
	.string	"Powerbus Bridge"
.LC8713:
	.string	"IDT77201/211"
.LC8714:
	.string	"NICStAR ATM Adapter"
.LC8715:
	.string	"IDT77222/252"
	.align 4
.LC8716:
	.string	"MICRO ABR SAR PCI ATM Controller"
.LC8717:
	.string	"IDT77V252"
.LC8718:
	.string	"92HD71B7"
.LC8719:
	.string	"IDT Audio"
.LC8720:
	.string	"Precision MX"
.LC8721:
	.string	"Video engine interface"
.LC8722:
	.string	"Frame Capture Bus Interface"
.LC8723:
	.string	"FireRunner PCA-200"
.LC8724:
	.string	"PCA-200PC"
.LC8725:
	.string	"PCA-200E"
.LC8726:
	.string	"ForeRunner HE"
.LC8727:
	.string	"T2-MP3-001"
	.align 4
.LC8728:
	.string	"MP3 player/FM radio/voice recorder 256 Mo flash"
.LC8729:
	.string	"EIDE/hdd and IDE/cd-rom Ctrlr"
.LC8730:
	.string	"0x010"
.LC8731:
	.string	"USB Audio Sound Card"
.LC8732:
	.string	"Philips Semic"
.LC8733:
	.string	"gthjy"
.LC8734:
	.string	"7130"
.LC8735:
	.string	"01384E428"
.LC8736:
	.string	"PTD3000"
.LC8737:
	.string	"VPN IPSEC coprocessor"
.LC8738:
	.string	"PTD3210"
.LC8739:
	.string	"SSL Accelerator"
.LC8740:
	.string	"ISP1561"
.LC8741:
	.string	"TDA2780AQ"
.LC8742:
	.string	"TV deflection controller"
.LC8743:
	.string	"UCB1500"
.LC8744:
	.string	"Multimedia Audio Device"
.LC8745:
	.string	"TriMedia TM1000/1100"
.LC8746:
	.string	"Multimedia processor"
.LC8747:
	.string	"TriMedia TM-1300EH"
.LC8748:
	.string	"TriMedia PNX1700"
.LC8749:
	.string	"73c0a1434628"
	.align 4
.LC8750:
	.string	"Philips SAA7135HL Multimedia Capture Device"
.LC8751:
	.string	"Pinnacle PCTV 110i"
	.align 4
.LC8752:
	.string	"Pinnacle PCTV 110i Capture Device"
.LC8753:
	.string	"SAA7130"
.LC8754:
	.string	"Hybrid Capture Device"
.LC8755:
	.string	"d145ah"
.LC8756:
	.string	"ddddf"
.LC8757:
	.string	"saa7135HL"
.LC8758:
	.string	"PCIVEN_1131&DEV7146"
.LC8759:
	.string	"SAA9730"
.LC8760:
	.string	"Ethernet controller"
.LC8761:
	.string	"EiconCard C91"
.LC8762:
	.string	"EiconCard S90"
.LC8763:
	.string	"EiconCard S94"
.LC8764:
	.string	"EiconCard P92"
.LC8765:
	.string	"DIVA Pro 2.0 S/T"
.LC8766:
	.string	"DIVA 2.0 S/T"
.LC8767:
	.string	"DIVA Pro 2.0 U"
.LC8768:
	.string	"DIVA 2.0 U"
.LC8769:
	.string	"DIVA 2.01 S/T"
	.align 4
.LC8770:
	.string	"Eicon ISDN card using Siemens IPAC chip"
.LC8771:
	.string	"DIVA ISDN 2.02 PCI"
	.align 4
.LC8772:
	.string	"Eicon ISDN card using Infineon chip"
.LC8773:
	.string	"Maestra"
.LC8774:
	.string	"DIVA Server BRI-2M"
.LC8775:
	.string	"MaestraQ"
.LC8776:
	.string	"DIVA Server BRI-8M"
.LC8777:
	.string	"MaestraQ-U"
.LC8778:
	.string	"DIVA Server 4BRI/PCI"
.LC8779:
	.string	"MaestraP"
.LC8780:
	.string	"DIVA Server PRI-30M"
.LC8781:
	.string	"Diva Server PRI-30M PCI v.2"
.LC8782:
	.string	"DIVA Server BRI-2M/-2F"
.LC8783:
	.string	"Raceway Bridge"
.LC8784:
	.string	"DPRB"
.LC8785:
	.string	"Dual PCI to RapidIO Bridge"
.LC8786:
	.string	"Printer Cntrlr"
.LC8787:
	.string	"8905"
.LC8788:
	.string	"STD 32 Bridge"
.LC8789:
	.string	"i960 Bridge"
	.align 4
.LC8790:
	.string	"i960 Bridge / Evaluation Platform"
.LC8791:
	.string	"PCI911"
.LC8792:
	.string	"i960Jx I/O Controller"
.LC8793:
	.string	"PCI912"
.LC8794:
	.string	"i960Cx I/O Controller"
.LC8795:
	.string	"PCI913"
.LC8796:
	.string	"i960Hx I/O Controller"
.LC8797:
	.string	"PCI914"
	.align 4
.LC8798:
	.string	"I/O Controller with secondary PCI bus"
.LC8799:
	.string	"SST-64P"
.LC8800:
	.string	"SST-128P"
.LC8801:
	.string	"EIDE/ATAPI super adapter"
.LC8802:
	.string	"ProMotion 3210"
.LC8803:
	.string	"VGA/AVI Playback Accelerator"
.LC8804:
	.string	"6410 6422"
.LC8805:
	.string	"ProMotion-6422"
.LC8806:
	.string	"ProVideo 6424"
	.align 4
.LC8807:
	.string	"ProMotion AT24 GUI Accelerator"
.LC8808:
	.string	"ProMotion AT25"
.LC8809:
	.string	"0752 20005"
.LC8810:
	.string	"AT25"
.LC8811:
	.string	"ProMotion-AT3D"
.LC8812:
	.string	"ProMotion 6422"
.LC8813:
	.string	"139K76B 9808"
.LC8814:
	.string	"9809"
.LC8815:
	.string	"139K76B"
.LC8816:
	.string	"Noservo Cntrlr"
.LC8817:
	.string	"CardBus ATAPI Host Adapter"
.LC8818:
	.string	"NPATA32"
.LC8819:
	.string	"CardBus CompactFlash Adapter"
.LC8820:
	.string	"NPATA-32"
.LC8821:
	.string	"131dq"
.LC8822:
	.string	"SK-NET"
.LC8823:
	.string	"SysKonnect Genesis"
	.align 4
.LC8824:
	.string	"SK-NET Gigabit Ethernet Adapter"
.LC8825:
	.string	"Marvell Yukon"
	.align 4
.LC8826:
	.string	"SysKonnect Gigabit Ethernet SK-98xx Version 2.0"
.LC8827:
	.string	"Marvell Yukon II PCI-X"
	.align 4
.LC8828:
	.string	"PCI-X 10/100/1000Base-T Server"
.LC8829:
	.string	"Marvell Yukon EC"
	.align 4
.LC8830:
	.string	"PCI Express 10/100/1000Base-T Desktop"
.LC8831:
	.string	"VMIPCI-5565"
	.align 4
.LC8832:
	.string	"Ultrahigh-Speed Fiber-Optics Reflective Memory w/ Interrupts"
.LC8833:
	.string	"VMIPCI-5579"
.LC8834:
	.string	"Reflective Memory Card"
.LC8835:
	.string	"VMICPCI5588"
	.align 4
.LC8836:
	.string	"VMICPCI5588 Reflective Memory Card"
.LC8837:
	.string	"Timer/SRAM FPGA"
.LC8838:
	.string	"VMIVME-7587"
.LC8839:
	.string	"0x1002114D"
.LC8840:
	.string	"PCTel HSP56 PCI Modem"
.LC8841:
	.string	"AccelePort EPC"
.LC8842:
	.string	"RightSwitch SE-6"
.LC8843:
	.string	"AccelePort Xem"
.LC8844:
	.string	"AccelePort Xr"
.LC8845:
	.string	"AccelePort C/X"
.LC8846:
	.string	"DataFire PCI 1 S/T"
.LC8847:
	.string	"Digi Data Fire PCI 1 S/T"
.LC8848:
	.string	"AccelePort Xr/J"
.LC8849:
	.string	"AccelePort EPC/J"
.LC8850:
	.string	"DataFirePRIme T1"
.LC8851:
	.string	"SyncPort"
.LC8852:
	.string	"X.25/FR 2-port"
.LC8853:
	.string	"AccelePort8r EIA-232"
.LC8854:
	.string	"AccelePort8r EIA-422"
.LC8855:
	.string	"AccelePort EPC/X"
.LC8856:
	.string	"DataFire PCI 1 U"
.LC8857:
	.string	"DataFirePRIme E1"
.LC8858:
	.string	"AccelePort C/X (IBM)"
.LC8859:
	.string	"DataFire RAS"
.LC8860:
	.string	"T1/E1/PRI"
.LC8861:
	.string	"ClydeNonCsu6034"
.LC8862:
	.string	"ClydeNonCsu6032"
.LC8863:
	.string	"ClydeNonCsu4"
.LC8864:
	.string	"ClydeNonCsu2"
.LC8865:
	.string	"AccelePort RAS"
.LC8866:
	.string	"DataFire RAS B4 ST/U"
.LC8867:
	.string	"AccelePort 4r 920"
.LC8868:
	.string	"AccelePort 8r 920"
.LC8869:
	.string	"DigiClassic PCI"
.LC8870:
	.string	"AccelePort 2r 920"
.LC8871:
	.string	"DataFire DSP"
.LC8872:
	.string	"T1/E1/PRI, Compact PCI"
.LC8873:
	.string	"AccelePort Xp"
.LC8874:
	.string	"AccelePort 2p PCI"
.LC8875:
	.string	"DataFire Micro V"
.LC8876:
	.string	"Avanstar"
.LC8877:
	.string	"486 CPU/PCI Bridge"
.LC8878:
	.string	"Tokenet/vg 1001/10m anylan"
.LC8879:
	.string	"Lanfleet/Truevalue"
.LC8880:
	.string	"MV1000"
.LC8881:
	.string	"MV-1500"
.LC8882:
	.string	"RBEM56G-100"
	.align 4
.LC8883:
	.string	"Cardbus Ethernet 10/100+Modem 56"
.LC8884:
	.string	"CardBus Ethernet 10/100"
.LC8885:
	.string	"MPCI 3A56GSP-100 PA"
.LC8886:
	.string	"Mini-PCI V.90 56k Modem"
	.align 4
.LC8887:
	.string	"Winmodem built into NEC Versa VXi"
	.align 4
.LC8888:
	.string	"Xircom MPCI3B-56G (Lucent SCORPIO) Soft"
.LC8889:
	.string	"2333333333333"
.LC8890:
	.string	"Xircom MPCI Modem 56"
.LC8891:
	.string	"MPCI"
.LC8892:
	.string	"Modem 56k"
.LC8893:
	.string	"CardBus 56k Modem"
.LC8894:
	.string	"CardBus Ehternet + 56k Modem"
.LC8895:
	.string	"Verite 1000"
.LC8896:
	.string	"3D Blaster"
.LC8897:
	.string	"Rendition V2200 (1179-002)"
	.align 4
.LC8898:
	.string	"Rendition V2200 (BLITZ 2200 AGP)"
.LC8899:
	.string	"Motion JPEG rec/play w/audio"
.LC8900:
	.string	"NB6536 (CNB20-LE)"
	.align 4
.LC8901:
	.string	"PCI to PCI Bridge, bus/dev/func 0/0/1"
.LC8902:
	.string	"NB6536 (CNB20-HE)"
	.align 4
.LC8903:
	.string	"Host Bridge, function 2 and function 3"
.LC8904:
	.string	"NB6635 (CNB20-LE/HE)"
	.align 4
.LC8905:
	.string	"Hostbridge & MCH, bus/dev/func 0/0/0"
.LC8906:
	.string	"CIOB30"
.LC8907:
	.string	"CMIC-HE"
.LC8908:
	.string	"CMIC-LE"
.LC8909:
	.string	"CNB20-HE"
.LC8910:
	.string	"Hostbridge and MCH"
.LC8911:
	.string	"CMIC-GC"
.LC8912:
	.string	"CMIC-SL"
.LC8913:
	.string	"CIOB-X2"
.LC8914:
	.string	"BCM5715"
	.align 4
.LC8915:
	.string	"Broadcom dual gigabit, pci bridge"
.LC8916:
	.string	"CIOB-E"
	.align 4
.LC8917:
	.string	"I/O Bridge with Gigabit Ethernet ServerWorks Grand Champion"
.LC8918:
	.string	"OSB4"
.LC8919:
	.string	"CSB5"
.LC8920:
	.string	"IDE interface"
.LC8921:
	.string	"OSB6"
	.align 4
.LC8922:
	.string	"PCI EIDE Controller (Tertiary)"
	.align 4
.LC8923:
	.string	"OpenHCI Compliant USB Controller"
.LC8924:
	.string	"OHCI Compliant USB Controller"
.LC8925:
	.string	"0x0223"
.LC8926:
	.string	"USB controller"
.LC8927:
	.string	"PCI to ISA bridge"
.LC8928:
	.string	"BC4852"
	.align 4
.LC8929:
	.string	"8-Channel RAIDCore\357\277\275 SATA RAID Host Bus Adapter"
.LC8930:
	.string	"QL5032"
	.align 4
.LC8931:
	.string	"32 Channel Digital Input Card Interface"
	.align 4
.LC8932:
	.string	"16 Channel Digital Output, 16 Channel Digital Input Interface"
	.align 4
.LC8933:
	.string	"32 Channel Analog Input Interface"
	.align 4
.LC8934:
	.string	"16 Channel Analog Output / Analog Input Interface"
.LC8935:
	.string	"QL5232"
	.align 4
.LC8936:
	.string	"8 Channel Timer Counter Interface"
	.align 4
.LC8937:
	.string	"PCI to TigerSHARC FPGA Interface"
.LC8938:
	.string	"Ql5032-33APQ208C"
	.align 4
.LC8939:
	.string	"PCI to C-DAC RTU bus interface FPGA"
.LC8940:
	.string	"Bus/Tag Channel"
.LC8941:
	.string	"Escon Channel"
.LC8942:
	.string	"VX120"
	.align 4
.LC8943:
	.string	"Fiery EX2000D RIP Card Melbourne VX120"
.LC8944:
	.string	"Vx500"
.LC8945:
	.string	"Printer ASIC"
.LC8946:
	.string	"EPF6016ATC144-2"
.LC8947:
	.string	"S CCA5000243A"
.LC8948:
	.string	"Multi-serial card"
.LC8949:
	.string	"42000133"
	.align 4
.LC8950:
	.string	"Conexant Multichannel Synchronous Communications Controller (MUSYCC)"
.LC8951:
	.string	"toshiba america info systems"
.LC8952:
	.string	"Extended PCI IDE Controller"
	.align 4
.LC8953:
	.string	"Extended PCI IDE Controller Type-B"
.LC8954:
	.string	"0x1179"
.LC8955:
	.string	"pci communication device"
.LC8956:
	.string	"Tecra a2"
.LC8957:
	.string	"Video Capture device"
.LC8958:
	.string	"0555873412"
.LC8959:
	.string	"Toshiba CPU to PCI bridge"
	.align 4
.LC8960:
	.string	"PCI to ISA Bridge for Notebooks"
.LC8961:
	.string	"ToPIC95"
	.align 4
.LC8962:
	.string	"PCI to CardBus Bridge for Notebooks"
	.align 4
.LC8963:
	.string	"PCI to PCI Bridge for Notebooks"
.LC8964:
	.string	"ToPIC95B"
	.align 4
.LC8965:
	.string	"Toshiba ToPIC95 CardBus Controller"
.LC8966:
	.string	"ToPIC97"
.LC8967:
	.string	"ToPIC100"
	.align 4
.LC8968:
	.string	"PCI to CardBus Bridge with ZV support"
	.align 4
.LC8969:
	.string	"CPU to PCI and PCI to ISA Bridge"
.LC8970:
	.string	"vt82c693"
.LC8971:
	.string	"PCI Communication Device"
.LC8972:
	.string	"0x0804"
	.align 4
.LC8973:
	.string	"Toshiba Smart Media Host Controller"
	.align 4
.LC8974:
	.string	"PCIVEN_1180&DEV_0592&SUBSYS_828D1033&REV_064&5A9"
.LC8975:
	.string	"SD Card Controller"
.LC8976:
	.string	"0x0D01"
.LC8977:
	.string	"FIR Port Type-O"
.LC8978:
	.string	"XR17C158/154/152"
.LC8979:
	.string	"Multi-channel PCI UART"
.LC8980:
	.string	"NOFM12"
.LC8981:
	.string	"USB DEVICE"
.LC8982:
	.string	"Printer Host"
.LC8983:
	.string	"88e8003"
.LC8984:
	.string	"DFE-550TX/580TX/DFE-550FX"
.LC8985:
	.string	"driv16c003206"
	.align 4
.LC8986:
	.string	"DL10038C or DL10038D (Remark of Realtek RTL-8139)"
.LC8987:
	.string	"DGE-528T "
.LC8988:
	.string	"DFE-690TXD"
.LC8989:
	.string	"CardBus PC Card"
.LC8990:
	.string	"DRP-32TXD"
.LC8991:
	.string	"14001186"
	.align 4
.LC8992:
	.string	"D-Link DFE-500Tx PCI fast Ethernet adapter Rev.A"
.LC8993:
	.string	"DFE 530TX+ rev E1"
	.align 4
.LC8994:
	.string	"D-Link Air Wireless Network (DWL-G510)"
.LC8995:
	.string	"IEEE 802.11g PCI card"
.LC8996:
	.string	"0x3b001186"
.LC8997:
	.string	"D-LINK DWL-650+"
.LC8998:
	.string	"DWL-G510 Version C1"
.LC8999:
	.string	"Ralink RT61"
.LC9000:
	.string	"DL2000"
.LC9001:
	.string	"DFE-650TX"
	.align 4
.LC9002:
	.string	"D Link Fast Ethernet PCMCIA Card"
.LC9003:
	.string	"dlg10028"
	.align 4
.LC9004:
	.string	"Used on DGE-528T Gigabit adaptor"
.LC9005:
	.string	"DGE-530T"
.LC9006:
	.string	"VL/PCI Bridge"
.LC9007:
	.string	"PCIB"
	.align 4
.LC9008:
	.string	"C-bus II to PCI bus host bridge chip"
.LC9009:
	.string	"MAC-94C201B3"
	.align 4
.LC9010:
	.string	"Corollary/Intel Memory Controller Chip"
.LC9011:
	.string	"Raptor-PCI framegrabber"
.LC9012:
	.string	"Model 12"
.LC9013:
	.string	"Road Runner Frame Grabber"
.LC9014:
	.string	"Model 14"
.LC9015:
	.string	"Model 24"
.LC9016:
	.string	"Model 44"
.LC9017:
	.string	"ATP850UF"
	.align 4
.LC9018:
	.string	"UltraDMA33 EIDE Controller (AEC6210UF)"
.LC9019:
	.string	"SCSI-2 cache Cntrlr"
.LC9020:
	.string	"ATP8400"
.LC9021:
	.string	"UltraDMA33 EIDE Controller"
.LC9022:
	.string	"ATP860A"
	.align 4
.LC9023:
	.string	"UltraDMA66 EDIE Controller (AEC6260)"
.LC9024:
	.string	"ATP860R"
	.align 4
.LC9025:
	.string	"UltraDMA66 EIDE Controller (AEC6260)"
.LC9026:
	.string	"ATP865"
	.align 4
.LC9027:
	.string	"2CH PCI UltraDMA133 IDE Controller"
.LC9028:
	.string	"aec6885"
	.align 4
.LC9029:
	.string	"ACARD AEC-6885/6895/6896 RAID Controller"
.LC9030:
	.string	"AEC6897/6898"
	.align 4
.LC9031:
	.string	"ACARD AEC-6897/6898 RAID Controller"
.LC9032:
	.string	"ATP8620"
	.align 4
.LC9033:
	.string	"2S1P PCI-X SATA(3G)/UDMA Combo Controller"
.LC9034:
	.string	"ATP8600"
	.align 4
.LC9035:
	.string	"SCSI-2 RAID (cache?) Adapter (AEC6820U)"
.LC9036:
	.string	"ATP850S"
	.align 4
.LC9037:
	.string	"SCSI-2 Host Adapter (AEC6710L/F/s)"
.LC9038:
	.string	"ATP870"
.LC9039:
	.string	"AEC671x"
.LC9040:
	.string	"AEC-67160"
	.align 4
.LC9041:
	.string	"PCI Ultra160 LVD/SE SCSI Adapter"
.LC9042:
	.string	"ATP885"
	.align 4
.LC9043:
	.string	"AEC67162 PCI Ultra3 LVD/SE Controller"
.LC9044:
	.string	"CompuScope 82G"
.LC9045:
	.string	"8-bit 2GS/s Analog Input Card"
.LC9046:
	.string	"IRMA 3270 PCI Adapter"
.LC9047:
	.string	"Advanced ISCA PCI Adapter"
.LC9048:
	.string	"SDLC PCI Adapter"
.LC9049:
	.string	"82C092G"
.LC9050:
	.string	"PCI PCMCIA bridge"
.LC9051:
	.string	"MB86697"
.LC9052:
	.string	"FireStream 155 ATM adapter"
.LC9053:
	.string	"MB86695"
.LC9054:
	.string	"FireStream 50 ATM adapter"
.LC9055:
	.string	"NTX-8023-PCI 2MB Long Card"
.LC9056:
	.string	"NTX-8023-PCI 8MB Long Card"
.LC9057:
	.string	"NTX-8023-PCI 2MB Short Card"
.LC9058:
	.string	"NTX-8023-PCI 8MB Short Card"
.LC9059:
	.string	"AMCC S5933Q"
.LC9060:
	.string	"pci matchmaker 9622qac"
.LC9061:
	.string	"GT-64010/A"
	.align 4
.LC9062:
	.string	"System Ctrlr for R4xxx/5000 Family CPUs"
.LC9063:
	.string	"88E8055 PCI-E"
.LC9064:
	.string	"Gigabit Ethernet Controler"
.LC9065:
	.string	"88E8055"
	.align 4
.LC9066:
	.string	"Marvell Yukon 88E8055 PCI-E Gigabit Ethernet Controller"
.LC9067:
	.string	"W8300"
.LC9068:
	.string	"802.11 Adapter"
.LC9069:
	.string	"88W8300"
.LC9070:
	.string	"The Libertas WLAN 802.11b/g"
.LC9071:
	.string	"Libertas WLAN 802.11b/g"
.LC9072:
	.string	"8335"
	.align 4
.LC9073:
	.string	"Marvell Libertas 802.11b/g Wireless (8335)"
.LC9074:
	.string	"88W8687"
.LC9075:
	.string	"PCI-Express 802.11bg Wireless"
.LC9076:
	.string	"88E8058"
.LC9077:
	.string	"Marvell Yukon PCI E Gigabit"
.LC9078:
	.string	"88E8036"
	.align 4
.LC9079:
	.string	"Yukon PCI-E Fast Ethernet Controller"
.LC9080:
	.string	"88E8038"
	.align 4
.LC9081:
	.string	"Marvell Yukon 88E8038 PCI-E Fast Ethernet Controller"
	.align 4
.LC9082:
	.string	"88E8039 - http://www.marvell.com/drivers/driverDis"
.LC9083:
	.string	"Gigabit"
.LC9084:
	.string	"88E8040"
	.align 4
.LC9085:
	.string	"Marvell Yukon 88E8040 PCI-E Fast Ethernet Controller"
.LC9086:
	.string	"88E8040T"
	.align 4
.LC9087:
	.string	"Marvell Yukon 88E8040T PCI-E Fast Ethernet Controller"
.LC9088:
	.string	"88E8050"
	.align 4
.LC9089:
	.string	"Yukon PCI-E ASF Gigabit Ethernet Controller"
	.align 4
.LC9090:
	.string	"Marvell Yukon -EC 88E8036 PCI Express Fast Ethernet Controller"
	.align 4
.LC9091:
	.string	"Marvell Yukon 88E8053 PCI-E Gigabit Ethernet Controller"
	.align 4
.LC9092:
	.string	"Yukon PCI-E Gigabit Ethernet Controller"
.LC9093:
	.string	"88E8056"
.LC9094:
	.string	"88E8070"
.LC9095:
	.string	"Yukon Gigabit Controller"
.LC9096:
	.string	"Marvell Yukon 88E8058"
.LC9097:
	.string	"88E8072"
.LC9098:
	.string	"GT-64115"
.LC9099:
	.string	"GT-64120"
	.align 4
.LC9100:
	.string	"System Controller for R5000 & R7000 (64-bit PCI)"
.LC9101:
	.string	"GT-48001"
	.align 4
.LC9102:
	.string	"8 port switched ethernet ctrlr"
.LC9103:
	.string	"EV-48300"
	.align 4
.LC9104:
	.string	"Evaluation board for the GT-48300"
.LC9105:
	.string	"F5D5005"
	.align 4
.LC9106:
	.string	"Belkin Desktop Gigabit PCI card"
.LC9107:
	.string	"88SX5040"
	.align 4
.LC9108:
	.string	"4-port SATA I PCI-X Controller"
.LC9109:
	.string	"88SX504"
.LC9110:
	.string	"RocketRAID 182x"
.LC9111:
	.string	"MV88SX6041"
	.align 4
.LC9112:
	.string	"Marvell Technology Group Ltd. MV88SX6041 4-port SATA II PCI-X Controller (rev 03)"
.LC9113:
	.string	"SATA II PCI-X Controller"
.LC9114:
	.string	"88SE6101"
.LC9115:
	.string	"PATA 133 One Channel"
.LC9116:
	.string	"61xx RAID"
.LC9117:
	.string	"88SE6121"
.LC9118:
	.string	"88SE6145"
	.align 4
.LC9119:
	.string	"Add-on IC to provide 4x SATA Ports, attached to ICH7 (SthBridge?) via PCI-Express."
.LC9120:
	.string	"GT-64130/131"
	.align 4
.LC9121:
	.string	"System Controller for PowerPC Processors"
.LC9122:
	.string	"64xx/63xx SAS"
.LC9123:
	.string	"MV6446x"
	.align 4
.LC9124:
	.string	"System Controller for PowerPC Processors, Revision B"
.LC9125:
	.string	"GT-96100A"
	.align 4
.LC9126:
	.string	"Advanced Communication Controller"
.LC9127:
	.string	"GT-64010"
	.align 4
.LC9128:
	.string	"Primary Image Piranha Image Generator"
.LC9129:
	.string	"GT64120"
	.align 4
.LC9130:
	.string	"Primary Image Barracuda Image Generator"
.LC9131:
	.string	"GT-64120A"
	.align 4
.LC9132:
	.string	"Primary Image Cruncher Geometry Accelerator"
.LC9133:
	.string	"88SA8040"
.LC9134:
	.string	"PATA2SATA/SATA2PATA Bridge"
.LC9135:
	.string	"LC82C168?"
.LC9136:
	.string	"LC82C169C"
	.align 4
.LC9137:
	.string	"NETGEAR FA310TX Fast Ethernet PCI Adapter"
.LC9138:
	.string	"LC82C115"
.LC9139:
	.string	"PNIC II PCI MAC/PHY"
.LC9140:
	.string	"Bridge Controller"
.LC9141:
	.string	"9704"
.LC9142:
	.string	"Cinema"
.LC9143:
	.string	"Nitris"
.LC9144:
	.string	"Nitris DX / Mojo DX"
.LC9145:
	.string	"V960PBC/PSC"
.LC9146:
	.string	"i960 Local Bus to PCI Bridge"
.LC9147:
	.string	"V961PBC/PSC"
	.align 4
.LC9148:
	.string	"i960Jx Local Bus to PCI Bridge"
.LC9149:
	.string	"V962PBC/PSC"
	.align 4
.LC9150:
	.string	"i960Cx/Hx Local Bus to PCI Bridge"
.LC9151:
	.string	"V292PBC/PSC"
.LC9152:
	.string	"Am29K Local Bus to PCI Bridge"
.LC9153:
	.string	"V363EPC"
	.align 4
.LC9154:
	.string	"i960Sx Local Bus to PCI Bridge"
.LC9155:
	.string	"V320USC"
	.align 4
.LC9156:
	.string	"PCI System Ctrlr for 32-bit MIPS CPU"
	.align 4
.LC9157:
	.string	"PCI System Ctrlr for Super-H SH3 CPU"
	.align 4
.LC9158:
	.string	"PCI System Ctrlr for Super-H SH4 CPU"
.LC9159:
	.string	"V370PDC"
	.align 4
.LC9160:
	.string	"High Performance PCI SDRAM Controller"
.LC9161:
	.string	"V292PBC"
.LC9162:
	.string	"Am29030/40 Bridge"
.LC9163:
	.string	"V340HPC"
	.align 4
.LC9164:
	.string	"PCI System Ctrlr for 64-bit MIPS CPU"
.LC9165:
	.string	"V96xPBC"
	.align 4
.LC9166:
	.string	"i960 Bridges for i960 Processors"
.LC9167:
	.string	"V96DPC"
.LC9168:
	.string	"i960 Dual PCI Bridge"
.LC9169:
	.string	"PMC/PMX1553"
.LC9170:
	.string	"1553 Bus Interface Card"
.LC9171:
	.string	"PMCF1"
.LC9172:
	.string	"FLASH memory Card"
.LC9173:
	.string	"PMCMMA"
.LC9174:
	.string	"Multi Media Adapter"
.LC9175:
	.string	"PMCVGO"
.LC9176:
	.string	"Video Graphics Overlay"
.LC9177:
	.string	"PMCPCIS"
.LC9178:
	.string	"PPzero Slave Interface Card"
.LC9179:
	.string	"PMCPCIM"
.LC9180:
	.string	"PPzero Master Interface Card"
.LC9181:
	.string	"PMCQ1"
.LC9182:
	.string	"Serial/1553 Interface Card"
.LC9183:
	.string	"EPMCQ2"
	.align 4
.LC9184:
	.string	"Intelligent Serial/Ethernet Card"
.LC9185:
	.string	"PMCPIO1"
.LC9186:
	.string	"Parallel I/O Module"
.LC9187:
	.string	"PMCFA1C"
.LC9188:
	.string	"PMCHH1"
.LC9189:
	.string	"High Speed DSP Gateway Module"
.LC9190:
	.string	"PMCMA2"
.LC9191:
	.string	"Memory Adaptor Module"
.LC9192:
	.string	"FLASH memory Card (V2)"
.LC9193:
	.string	"PMC1553EX"
.LC9194:
	.string	"PMC1553E"
.LC9195:
	.string	"PMCFA2C"
.LC9196:
	.string	"Dual Fibre Channel Adapter"
	.align 4
.LC9197:
	.string	"Hauppage Nova -TD-500 DVB-T Tuner Device"
.LC9198:
	.string	"Quad PeerMaster"
.LC9199:
	.string	"SSA Ctrlr"
.LC9200:
	.string	"NPI NuCard"
.LC9201:
	.string	"PCI FDDI"
.LC9202:
	.string	"660806-2.0"
.LC9203:
	.string	"rob2d"
.LC9204:
	.string	"51011810"
	.align 4
.LC9205:
	.string	"pinnacle, bendino V1.0A | Studio MovieBoard 500-PCI V.10"
.LC9206:
	.string	"51016494"
.LC9207:
	.string	"MB87J3560"
.LC9208:
	.string	"LT Winmodem 56k"
.LC9209:
	.string	"Data+Fax+Voice+DSVD"
.LC9210:
	.string	"4390143"
.LC9211:
	.string	"modem driver"
.LC9212:
	.string	"1648T00"
.LC9213:
	.string	"LT WinModem 56K Data+Fax"
.LC9214:
	.string	"LT Winmodem"
.LC9215:
	.string	"845G"
.LC9216:
	.string	"windowsme"
.LC9217:
	.string	"SV2P2"
.LC9218:
	.string	"0449144F"
.LC9219:
	.string	"9M56PML-G"
.LC9220:
	.string	"12232"
	.align 4
.LC9221:
	.string	"LT WinModem 56k Data+Fax or Agere F-1156IV/A3"
.LC9222:
	.string	"90094-1"
.LC9223:
	.string	"LT V.90+DSL WildFire Modem"
.LC9224:
	.string	"1456VQH19R-1(INT)"
.LC9225:
	.string	"LT Winmodem 56K"
	.align 4
.LC9226:
	.string	"LT WinModem 56k Data+Fax+Voice+DSVD"
.LC9227:
	.string	"1513144"
.LC9228:
	.string	"1648C"
.LC9229:
	.string	"Mars 3 Mercury v.92 v.44"
.LC9230:
	.string	"LT WinModem"
.LC9231:
	.string	"mars2"
.LC9232:
	.string	"V90 Wildfire Modem"
.LC9233:
	.string	"1690"
.LC9234:
	.string	"56K.V90/ADSL Wildwire Modem"
	.align 4
.LC9235:
	.string	"This is NOT a Riptide! (as previously stated)"
	.align 4
.LC9236:
	.string	"Lucent Wildwire v.90 + DSL modem"
.LC9237:
	.string	"Venus Winmodem"
.LC9238:
	.string	"56k.V90/ADSL Wildfire Modem"
	.align 4
.LC9239:
	.string	"creative modem blaster di5733-1"
.LC9240:
	.string	"1648c-tv5"
.LC9241:
	.string	"svp92pl-t00"
.LC9242:
	.string	"56k V.92modem"
.LC9243:
	.string	"SV92P-T00"
.LC9244:
	.string	"Agere PCI Soft Modem. SV92PL"
.LC9245:
	.string	"sv92p2"
	.align 4
.LC9246:
	.string	"SV92P-T00 Agere PCI Soft Modem. SV92PL"
.LC9247:
	.string	"SV92PP"
	.align 4
.LC9248:
	.string	"Agere PCI Soft Modem for linux unbuntu"
.LC9249:
	.string	"Prespa"
.LC9250:
	.string	"Agere Systems HDA Modem"
.LC9251:
	.string	"0x11c13026"
.LC9252:
	.string	"OR3TP12"
	.align 4
.LC9253:
	.string	"FPSC FPGA with 32/64bit, 33/66MHz core"
.LC9254:
	.string	"USS-312MC"
	.align 4
.LC9255:
	.string	"2-port PCI-to-USB OpenHCI Host Ctrlr"
.LC9256:
	.string	"USS-344"
	.align 4
.LC9257:
	.string	"QuadraBus 4-port USB OpenHCI Host Ctrlr"
.LC9258:
	.string	"uss344"
.LC9259:
	.string	"USB Advanced Host Controller"
.LC9260:
	.string	"FW322"
	.align 4
.LC9261:
	.string	"1394A PCI PHY/Link Open Host Ctrlr I/F"
.LC9262:
	.string	"firewire chip for macbook pro"
.LC9263:
	.string	"lucent 1646T00"
.LC9264:
	.string	"WaveLAN"
.LC9265:
	.string	"PCI Wireless LAN Adapter"
.LC9266:
	.string	"Hermes2?"
.LC9267:
	.string	"Mini-PCI WaveLAN a/b/g"
.LC9268:
	.string	"ET-131x"
.LC9269:
	.string	"PCI-E Ethernet Controller"
.LC9270:
	.string	"VM-1200 Opto Unit Controller"
.LC9271:
	.string	"PSB 32"
	.align 4
.LC9272:
	.string	"32 bit , 33 Mhz PCI-SCI Bridge"
.LC9273:
	.string	"PSB64"
	.align 4
.LC9274:
	.string	"64 bit , 33 Mhz PCI-SCI Bridge"
.LC9275:
	.string	"PSB66"
	.align 4
.LC9276:
	.string	"64 bit , 66 Mhz PCI-SCI Bridge. (D33x)"
.LC9277:
	.string	"16-line serial port w/DMA"
.LC9278:
	.string	"4-line serial port w/DMA"
.LC9279:
	.string	"PCI-9050-1100083-11"
.LC9280:
	.string	"port small IC"
.LC9281:
	.string	"SUPI-1"
.LC9282:
	.string	"XIO/SIO Host"
.LC9283:
	.string	"T225"
.LC9284:
	.string	"Bridge RIO Host"
.LC9285:
	.string	"1001"
.LC9286:
	.string	"FF00102B"
.LC9287:
	.string	"VxP524"
.LC9288:
	.string	"PCI Video Processor"
.LC9289:
	.string	"rev_03"
.LC9290:
	.string	"tuner card"
.LC9291:
	.string	"tag4769"
.LC9292:
	.string	"Video card"
.LC9293:
	.string	"ADSP-21535"
	.align 4
.LC9294:
	.string	"Blackfin DSP PCI Bus Interface"
.LC9295:
	.string	"62412-51"
.LC9296:
	.string	"U35545.2-0.6"
.LC9297:
	.string	"AD1884HD"
	.align 4
.LC9298:
	.string	"SoundMAX Integrated Digital HD Audio"
.LC9299:
	.string	"AD1980"
.LC9300:
	.string	"Sound Chip"
.LC9301:
	.string	"AD1981HD"
.LC9302:
	.string	"AD1983HD"
.LC9303:
	.string	"Analog Devices ADI 198x"
	.align 4
.LC9304:
	.string	"Analog Devices ADI 198x Integrated HD Audio"
.LC9305:
	.string	"AD198b"
.LC9306:
	.string	"AD1988B"
.LC9307:
	.string	"AD1988B HD Audio CODEC"
.LC9308:
	.string	"ADSP-2192"
	.align 4
.LC9309:
	.string	"DSP Microcomputer (function #0)"
	.align 4
.LC9310:
	.string	"DSP Microcomputer (function #1)"
	.align 4
.LC9311:
	.string	"DSP Microcomputer (function #2)"
.LC9312:
	.string	"ADSP-2141"
	.align 4
.LC9313:
	.string	"SafeNet Crypto Accelerator chip"
.LC9314:
	.string	"10115"
	.align 4
.LC9315:
	.string	"Versatec Parallel Interface (VPI) + Centronics"
.LC9316:
	.string	"10118"
.LC9317:
	.string	"DR11-W emulator"
.LC9318:
	.string	"10117"
.LC9319:
	.string	"BGE"
	.align 4
.LC9320:
	.string	"VGA BIOS Extensions Graphics Adapter"
	.data
	.align 32
	.type	PciDevTable, @object
	.size	PciDevTable, 64020
PciDevTable:
	.value	5724
	.value	2
	.long	.LC2364
	.long	.LC2364
	.value	5806
	.value	4417
	.long	.LC2365
	.long	.LC2366
	.value	4571
	.value	4660
	.long	.LC42
	.long	.LC2367
	.value	4574
	.value	24663
	.long	.LC2368
	.long	.LC2369
	.value	4574
	.value	24679
	.long	.LC2370
	.long	.LC2371
	.value	4574
	.value	24864
	.long	.LC2372
	.long	.LC2373
	.value	4574
	.value	24663
	.long	.LC2374
	.long	.LC2375
	.value	4574
	.value	-26506
	.long	.LC42
	.long	.LC42
	.value	4588
	.value	8292
	.long	.LC42
	.long	.LC42
	.value	4592
	.value	16945
	.long	.LC42
	.long	.LC42
	.value	4592
	.value	16946
	.long	.LC2376
	.long	.LC42
	.value	4592
	.value	16947
	.long	.LC2377
	.long	.LC42
	.value	4592
	.value	16948
	.long	.LC2378
	.long	.LC42
	.value	4592
	.value	16949
	.long	.LC2379
	.long	.LC42
	.value	4592
	.value	16950
	.long	.LC2380
	.long	.LC42
	.value	4592
	.value	18225
	.long	.LC2381
	.long	.LC2382
	.value	4596
	.value	10517
	.long	.LC2383
	.long	.LC42
	.value	4598
	.value	274
	.long	.LC2384
	.long	.LC2385
	.value	4598
	.value	275
	.long	.LC42
	.long	.LC2386
	.value	4598
	.value	5121
	.long	.LC2387
	.long	.LC2388
	.value	4598
	.value	8209
	.long	.LC2389
	.long	.LC2390
	.value	4598
	.value	8705
	.long	.LC2391
	.long	.LC2392
	.value	4598
	.value	-26495
	.long	.LC2393
	.long	.LC2394
	.value	4600
	.value	29540
	.long	.LC2395
	.long	.LC2396
	.value	4600
	.value	29542
	.long	.LC2395
	.long	.LC2397
	.value	4600
	.value	29543
	.long	.LC2398
	.long	.LC2399
	.value	4600
	.value	29557
	.long	.LC2400
	.long	.LC2401
	.value	4600
	.value	29568
	.long	.LC2402
	.long	.LC2403
	.value	4600
	.value	29570
	.long	.LC2404
	.long	.LC2405
	.value	4600
	.value	29572
	.long	.LC2406
	.long	.LC2407
	.value	4600
	.value	-32768
	.long	.LC2408
	.long	.LC2409
	.value	4600
	.value	-32752
	.long	.LC2410
	.long	.LC2411
	.value	4606
	.value	1
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	2
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	3
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	4
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	5
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	6
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	7
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	8
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	9
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	10
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	11
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	12
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	13
	.long	.LC2412
	.long	.LC42
	.value	4606
	.value	-32747
	.long	.LC2412
	.long	.LC2413
	.value	4610
	.value	1
	.long	.LC2414
	.long	.LC2415
	.value	4616
	.value	18515
	.long	.LC42
	.long	.LC2416
	.value	4965
	.value	-28592
	.long	.LC2417
	.long	.LC42
	.value	4617
	.value	256
	.long	.LC2418
	.long	.LC2419
	.value	4622
	.value	256
	.long	.LC2420
	.long	.LC2421
	.value	4622
	.value	257
	.long	.LC2420
	.long	.LC2421
	.value	4622
	.value	258
	.long	.LC2422
	.long	.LC2421
	.value	4622
	.value	259
	.long	.LC2422
	.long	.LC2421
	.value	4622
	.value	260
	.long	.LC2423
	.long	.LC2421
	.value	4622
	.value	261
	.long	.LC2423
	.long	.LC2421
	.value	4622
	.value	512
	.long	.LC2424
	.long	.LC2425
	.value	4622
	.value	513
	.long	.LC2424
	.long	.LC2426
	.value	4622
	.value	768
	.long	.LC2427
	.long	.LC42
	.value	4622
	.value	769
	.long	.LC2428
	.long	.LC42
	.value	4622
	.value	770
	.long	.LC2429
	.long	.LC42
	.value	4622
	.value	771
	.long	.LC2430
	.long	.LC42
	.value	4623
	.value	1
	.long	.LC2431
	.long	.LC42
	.value	4630
	.value	3
	.long	.LC2432
	.long	.LC2433
	.value	4631
	.value	247
	.long	.LC2434
	.long	.LC2435
	.value	4631
	.value	26409
	.long	.LC2436
	.long	.LC2437
	.value	4631
	.value	26426
	.long	.LC2438
	.long	.LC2437
	.value	4631
	.value	26674
	.long	.LC2439
	.long	.LC2440
	.value	4631
	.value	26678
	.long	.LC2441
	.long	.LC2440
	.value	4631
	.value	26738
	.long	.LC2442
	.long	.LC2440
	.value	4631
	.value	26917
	.long	.LC2443
	.long	.LC2440
	.value	4631
	.value	26931
	.long	.LC2444
	.long	.LC2440
	.value	4631
	.value	26994
	.long	.LC2445
	.long	.LC2440
	.value	4631
	.value	28944
	.long	.LC2446
	.long	.LC2447
	.value	4631
	.value	28947
	.long	.LC2448
	.long	.LC2449
	.value	4631
	.value	28948
	.long	.LC2450
	.long	.LC2440
	.value	4631
	.value	28960
	.long	.LC2451
	.long	.LC2452
	.value	4631
	.value	28976
	.long	.LC2453
	.long	.LC2454
	.value	4631
	.value	28980
	.long	.LC2455
	.long	.LC2456
	.value	4631
	.value	29218
	.long	.LC2457
	.long	.LC2458
	.value	4631
	.value	29219
	.long	.LC2459
	.long	.LC2460
	.value	4634
	.value	1
	.long	.LC2461
	.long	.LC2462
	.value	4634
	.value	2
	.long	.LC2463
	.long	.LC2464
	.value	4634
	.value	3
	.long	.LC2465
	.long	.LC2465
	.value	4634
	.value	5
	.long	.LC2466
	.long	.LC2467
	.value	4634
	.value	7
	.long	.LC2468
	.long	.LC42
	.value	4634
	.value	9
	.long	.LC2469
	.long	.LC42
	.value	4634
	.value	16
	.long	.LC2470
	.long	.LC2471
	.value	4634
	.value	87
	.long	.LC2472
	.long	.LC2473
	.value	4640
	.value	4640
	.long	.LC2474
	.long	.LC2475
	.value	4640
	.value	16962
	.long	.LC2476
	.long	.LC2477
	.value	4643
	.value	1
	.long	.LC2478
	.long	.LC2479
	.value	4643
	.value	2
	.long	.LC2480
	.long	.LC2481
	.value	4643
	.value	3
	.long	.LC2482
	.long	.LC2483
	.value	4643
	.value	4
	.long	.LC2484
	.long	.LC2483
	.value	4643
	.value	68
	.long	.LC2485
	.long	.LC2485
	.value	4643
	.value	5
	.long	.LC2486
	.long	.LC2487
	.value	4643
	.value	6
	.long	.LC2488
	.long	.LC2487
	.value	4643
	.value	7
	.long	.LC2489
	.long	.LC2490
	.value	4643
	.value	8
	.long	.LC2491
	.long	.LC2492
	.value	4643
	.value	9
	.long	.LC2493
	.long	.LC2494
	.value	4643
	.value	16
	.long	.LC2495
	.long	.LC2496
	.value	4643
	.value	17
	.long	.LC2497
	.long	.LC2498
	.value	4643
	.value	18
	.long	.LC2499
	.long	.LC2500
	.value	4643
	.value	19
	.long	.LC2501
	.long	.LC2502
	.value	4643
	.value	20
	.long	.LC2503
	.long	.LC2504
	.value	4643
	.value	21
	.long	.LC2505
	.long	.LC2506
	.value	4644
	.value	4096
	.long	.LC2507
	.long	.LC2508
	.value	4653
	.value	4614
	.long	.LC2509
	.long	.LC2510
	.value	4653
	.value	16897
	.long	.LC2511
	.long	.LC2512
	.value	4653
	.value	20700
	.long	.LC2513
	.long	.LC2514
	.value	4653
	.value	-32550
	.long	.LC2515
	.long	.LC2514
	.value	4655
	.value	14255
	.long	.LC2516
	.long	.LC2517
	.value	5736
	.value	256
	.long	.LC2518
	.long	.LC2519
	.value	4662
	.value	0
	.long	.LC2520
	.long	.LC2521
	.value	4662
	.value	1329
	.long	.LC2522
	.long	.LC2523
	.value	4662
	.value	15617
	.long	.LC2432
	.long	.LC2524
	.value	4662
	.value	25601
	.long	.LC2525
	.long	.LC2526
	.value	4662
	.value	-26872
	.long	.LC2527
	.long	.LC2528
	.value	4669
	.value	16
	.long	.LC2529
	.long	.LC2530
	.value	4671
	.value	228
	.long	.LC2531
	.long	.LC2532
	.value	4671
	.value	24864
	.long	.LC2533
	.long	.LC2534
	.value	4671
	.value	-32480
	.long	.LC2535
	.long	.LC2536
	.value	4671
	.value	-30584
	.long	.LC2533
	.long	.LC2537
	.value	4673
	.value	5635
	.long	.LC2538
	.long	.LC2539
	.value	4676
	.value	1792
	.long	.LC2540
	.long	.LC2541
	.value	4676
	.value	2048
	.long	.LC2542
	.long	.LC2543
	.value	4676
	.value	2560
	.long	.LC2544
	.long	.LC2543
	.value	4676
	.value	3584
	.long	.LC42
	.long	.LC2545
	.value	4676
	.value	4352
	.long	.LC2546
	.long	.LC2543
	.value	4676
	.value	4608
	.long	.LC2547
	.long	.LC2543
	.value	4676
	.value	9984
	.long	.LC2548
	.long	.LC2549
	.value	4682
	.value	4285
	.long	.LC2550
	.long	.LC2551
	.value	4684
	.value	544
	.long	.LC2552
	.long	.LC2552
	.value	4685
	.value	0
	.long	.LC2553
	.long	.LC42
	.value	4685
	.value	2
	.long	.LC2554
	.long	.LC42
	.value	4685
	.value	3
	.long	.LC2555
	.long	.LC42
	.value	4687
	.value	65
	.long	.LC2556
	.long	.LC2557
	.value	4688
	.value	6520
	.long	.LC42
	.long	.LC42
	.value	4688
	.value	10392
	.long	.LC42
	.long	.LC42
	.value	4693
	.value	4368
	.long	.LC2558
	.long	.LC42
	.value	4693
	.value	4624
	.long	.LC2559
	.long	.LC42
	.value	4693
	.value	8464
	.long	.LC2560
	.long	.LC2561
	.value	4693
	.value	8480
	.long	.LC2562
	.long	.LC2563
	.value	4693
	.value	8496
	.long	.LC2564
	.long	.LC42
	.value	4694
	.value	16897
	.long	.LC2565
	.long	.LC2566
	.value	4694
	.value	17409
	.long	.LC2567
	.long	.LC2568
	.value	4694
	.value	20993
	.long	.LC2569
	.long	.LC2570
	.value	4696
	.value	6536
	.long	.LC42
	.long	.LC42
	.value	4697
	.value	9475
	.long	.LC2571
	.long	.LC42
	.value	4697
	.value	9568
	.long	.LC42
	.long	.LC2572
	.value	4697
	.value	-16121
	.long	.LC2573
	.long	.LC42
	.value	4699
	.value	2965
	.long	.LC2574
	.long	.LC2575
	.value	4699
	.value	5120
	.long	.LC2576
	.long	.LC2577
	.value	4699
	.value	5920
	.long	.LC2578
	.long	.LC2579
	.value	4701
	.value	0
	.long	.LC2580
	.long	.LC2581
	.value	4701
	.value	6497
	.long	.LC2582
	.long	.LC2583
	.value	4701
	.value	6504
	.long	.LC2584
	.long	.LC2585
	.value	4701
	.value	6505
	.long	.LC2586
	.long	.LC2587
	.value	4701
	.value	6520
	.long	.LC2588
	.long	.LC2589
	.value	4701
	.value	6536
	.long	.LC2590
	.long	.LC2591
	.value	4701
	.value	6537
	.long	.LC2590
	.long	.LC2592
	.value	4701
	.value	6544
	.long	.LC2593
	.long	.LC42
	.value	4701
	.value	6546
	.long	.LC42
	.long	.LC42
	.value	4701
	.value	6552
	.long	.LC2594
	.long	.LC2594
	.value	4701
	.value	6555
	.long	.LC2595
	.long	.LC2596
	.value	4701
	.value	10248
	.long	.LC2597
	.long	.LC2598
	.value	4701
	.value	10280
	.long	.LC2599
	.long	.LC2600
	.value	4701
	.value	10296
	.long	.LC2601
	.long	.LC2602
	.value	4701
	.value	10297
	.long	.LC2603
	.long	.LC2604
	.value	4701
	.value	10392
	.long	.LC2605
	.long	.LC2606
	.value	4703
	.value	8324
	.long	.LC2607
	.long	.LC2608
	.value	4704
	.value	14450
	.long	.LC2609
	.long	.LC2610
	.value	4704
	.value	14451
	.long	.LC2611
	.long	.LC2612
	.value	4704
	.value	14470
	.long	.LC2613
	.long	.LC2614
	.value	4704
	.value	14480
	.long	.LC2615
	.long	.LC2616
	.value	4704
	.value	-32464
	.long	.LC2617
	.long	.LC2618
	.value	4704
	.value	-32463
	.long	.LC2619
	.long	.LC2618
	.value	4710
	.value	1
	.long	.LC42
	.long	.LC2620
	.value	4710
	.value	6416
	.long	.LC42
	.long	.LC2621
	.value	4711
	.value	4118
	.long	.LC42
	.long	.LC2622
	.value	4711
	.value	16963
	.long	.LC42
	.long	.LC2623
	.value	4711
	.value	21330
	.long	.LC2624
	.long	.LC42
	.value	4711
	.value	23115
	.long	.LC2625
	.long	.LC42
	.value	4994
	.value	1
	.long	.LC2626
	.long	.LC2627
	.value	4994
	.value	8201
	.long	.LC2628
	.long	.LC2629
	.value	4994
	.value	8264
	.long	.LC2630
	.long	.LC2631
	.value	4994
	.value	8328
	.long	.LC2632
	.long	.LC2633
	.value	4712
	.value	516
	.long	.LC2613
	.long	.LC2634
	.value	4716
	.value	7967
	.long	.LC42
	.long	.LC2635
	.value	4719
	.value	1808
	.long	.LC2636
	.long	.LC2637
	.value	4719
	.value	1810
	.long	.LC2638
	.long	.LC2639
	.value	4719
	.value	1824
	.long	.LC2640
	.long	.LC2641
	.value	4719
	.value	2064
	.long	.LC2642
	.long	.LC2643
	.value	4719
	.value	2065
	.long	.LC2644
	.long	.LC2643
	.value	4719
	.value	2080
	.long	.LC2645
	.long	.LC2646
	.value	4719
	.value	2320
	.long	.LC2647
	.long	.LC2648
	.value	4723
	.value	2
	.long	.LC2649
	.long	.LC2650
	.value	4724
	.value	4101
	.long	.LC42
	.long	.LC42
	.value	4724
	.value	4724
	.long	.LC2651
	.long	.LC2652
	.value	4724
	.value	4977
	.long	.LC2653
	.long	.LC2654
	.value	4724
	.value	4979
	.long	.LC2655
	.long	.LC2656
	.value	4724
	.value	20480
	.long	.LC2657
	.long	.LC2654
	.value	4724
	.value	22656
	.long	.LC2651
	.long	.LC2658
	.value	4724
	.value	-26506
	.long	.LC42
	.long	.LC42
	.value	4728
	.value	1793
	.long	.LC2659
	.long	.LC2660
	.value	4729
	.value	96
	.long	.LC2661
	.long	.LC2662
	.value	4729
	.value	97
	.long	.LC2663
	.long	.LC2664
	.value	4729
	.value	661
	.long	.LC42
	.long	.LC2665
	.value	4729
	.value	917
	.long	.LC2666
	.long	.LC2667
	.value	4729
	.value	918
	.long	.LC42
	.long	.LC2668
	.value	4729
	.value	919
	.long	.LC42
	.long	.LC2669
	.value	4738
	.value	-28663
	.long	.LC2670
	.long	.LC2671
	.value	4738
	.value	-28416
	.long	.LC42
	.long	.LC42
	.value	4738
	.value	-28414
	.long	.LC2672
	.long	.LC2673
	.value	4739
	.value	2049
	.long	.LC2674
	.long	.LC2675
	.value	4739
	.value	26426
	.long	.LC2676
	.long	.LC2677
	.value	4739
	.value	-32430
	.long	.LC2674
	.long	.LC2678
	.value	4739
	.value	-32398
	.long	.LC2679
	.long	.LC2680
	.value	4739
	.value	-32239
	.long	.LC2681
	.long	.LC2682
	.value	4739
	.value	-32238
	.long	.LC2683
	.long	.LC2684
	.value	4739
	.value	-32237
	.long	.LC2685
	.long	.LC2677
	.value	4739
	.value	-31952
	.long	.LC2676
	.long	.LC2686
	.value	4739
	.value	-30606
	.long	.LC2687
	.long	.LC2688
	.value	4739
	.value	-30603
	.long	.LC2689
	.long	.LC2690
	.value	4739
	.value	-30584
	.long	.LC2691
	.long	.LC2692
	.value	4739
	.value	-30583
	.long	.LC2693
	.long	.LC2694
	.value	4739
	.value	-26506
	.long	.LC2689
	.long	.LC2695
	.value	4739
	.value	-6010
	.long	.LC2676
	.long	.LC2692
	.value	4741
	.value	256
	.long	.LC2696
	.long	.LC2697
	.value	4743
	.value	30
	.long	.LC2698
	.long	.LC2699
	.value	4743
	.value	31
	.long	.LC2700
	.long	.LC2699
	.value	4743
	.value	32
	.long	.LC2701
	.long	.LC2702
	.value	4745
	.value	4102
	.long	.LC42
	.long	.LC42
	.value	4746
	.value	-4095
	.long	.LC2703
	.long	.LC2704
	.value	4749
	.value	33
	.long	.LC42
	.long	.LC2705
	.value	5118
	.value	4672
	.long	.LC2706
	.long	.LC2707
	.value	5118
	.value	5760
	.long	.LC2708
	.long	.LC2709
	.value	5118
	.value	5907
	.long	.LC2710
	.long	.LC2711
	.value	5118
	.value	5924
	.long	.LC2712
	.long	.LC2713
	.value	5118
	.value	5984
	.long	.LC42
	.long	.LC42
	.value	4762
	.value	1045
	.long	.LC2714
	.long	.LC2715
	.value	4762
	.value	1301
	.long	.LC2716
	.long	.LC2717
	.value	4762
	.value	1557
	.long	.LC2718
	.long	.LC2719
	.value	4762
	.value	1813
	.long	.LC2720
	.long	.LC2721
	.value	4762
	.value	-8944
	.long	.LC2722
	.long	.LC2723
	.value	4762
	.value	-8943
	.long	.LC2724
	.long	.LC2725
	.value	4762
	.value	-8942
	.long	.LC2726
	.long	.LC2727
	.value	4768
	.value	8
	.long	.LC2728
	.long	.LC2729
	.value	4771
	.value	-4936
	.long	.LC2730
	.long	.LC2731
	.value	4778
	.value	21864
	.long	.LC2732
	.long	.LC2733
	.value	4778
	.value	21868
	.long	.LC42
	.long	.LC2734
	.value	4779
	.value	12288
	.long	.LC2735
	.long	.LC2736
	.value	4781
	.value	16
	.long	.LC2538
	.long	.LC2737
	.value	4781
	.value	32
	.long	.LC2538
	.long	.LC2738
	.value	4781
	.value	128
	.long	.LC2538
	.long	.LC2739
	.value	4782
	.value	1
	.long	.LC2740
	.long	.LC2741
	.value	4782
	.value	2
	.long	.LC2742
	.long	.LC2743
	.value	4794
	.value	50
	.long	.LC2744
	.long	.LC2745
	.value	4801
	.value	-28544
	.long	.LC2746
	.long	.LC2747
	.value	5027
	.value	5
	.long	.LC2748
	.long	.LC2749
	.value	5027
	.value	6
	.long	.LC2750
	.long	.LC2751
	.value	5027
	.value	7
	.long	.LC2752
	.long	.LC2749
	.value	5027
	.value	18
	.long	.LC2753
	.long	.LC2749
	.value	5027
	.value	20
	.long	.LC2754
	.long	.LC2749
	.value	5027
	.value	21
	.long	.LC2755
	.long	.LC2749
	.value	5027
	.value	23
	.long	.LC2756
	.long	.LC2749
	.value	5027
	.value	24
	.long	.LC2757
	.long	.LC2749
	.value	5027
	.value	29
	.long	.LC2758
	.long	.LC2759
	.value	5027
	.value	32
	.long	.LC2760
	.long	.LC2759
	.value	5027
	.value	22
	.long	.LC2755
	.long	.LC2749
	.value	4803
	.value	88
	.long	.LC2761
	.long	.LC2762
	.value	4803
	.value	21912
	.long	.LC2763
	.long	.LC2764
	.value	4804
	.value	1
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	2
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	3
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	4
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	5
	.long	.LC2765
	.long	.LC2766
	.value	4804
	.value	6
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	7
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	8
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	9
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	10
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	11
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	12
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	13
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	14
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	15
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	768
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	769
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	770
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	771
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	772
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	773
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	774
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	775
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	776
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	777
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	778
	.long	.LC42
	.long	.LC42
	.value	4804
	.value	779
	.long	.LC42
	.long	.LC42
	.value	4805
	.value	127
	.long	.LC2767
	.long	.LC2768
	.value	4805
	.value	129
	.long	.LC2769
	.long	.LC2770
	.value	4805
	.value	133
	.long	.LC42
	.long	.LC2771
	.value	4805
	.value	134
	.long	.LC2772
	.long	.LC2773
	.value	4807
	.value	1350
	.long	.LC2774
	.long	.LC2775
	.value	4807
	.value	1377
	.long	.LC42
	.long	.LC2776
	.value	4807
	.value	1607
	.long	.LC42
	.long	.LC2777
	.value	4807
	.value	1608
	.long	.LC42
	.long	.LC2778
	.value	4807
	.value	1609
	.long	.LC42
	.long	.LC2778
	.value	4807
	.value	1617
	.long	.LC42
	.long	.LC2779
	.value	4807
	.value	1651
	.long	.LC42
	.long	.LC2780
	.value	4807
	.value	1652
	.long	.LC42
	.long	.LC2781
	.value	4807
	.value	1653
	.long	.LC42
	.long	.LC2782
	.value	4807
	.value	1654
	.long	.LC42
	.long	.LC2783
	.value	4807
	.value	1669
	.long	.LC42
	.long	.LC2784
	.value	4807
	.value	1671
	.long	.LC42
	.long	.LC2785
	.value	4807
	.value	1673
	.long	.LC2786
	.long	.LC2787
	.value	4807
	.value	1799
	.long	.LC42
	.long	.LC2788
	.value	4807
	.value	1800
	.long	.LC42
	.long	.LC2789
	.value	4811
	.value	39
	.long	.LC2790
	.long	.LC42
	.value	4811
	.value	45
	.long	.LC2791
	.long	.LC42
	.value	4811
	.value	46
	.long	.LC2792
	.long	.LC42
	.value	4811
	.value	47
	.long	.LC2793
	.long	.LC42
	.value	4811
	.value	48
	.long	.LC2794
	.long	.LC42
	.value	4811
	.value	49
	.long	.LC2795
	.long	.LC42
	.value	4811
	.value	50
	.long	.LC2796
	.long	.LC2797
	.value	4811
	.value	51
	.long	.LC2798
	.long	.LC42
	.value	4811
	.value	52
	.long	.LC2799
	.long	.LC42
	.value	4811
	.value	53
	.long	.LC2800
	.long	.LC42
	.value	4820
	.value	769
	.long	.LC2801
	.long	.LC2802
	.value	4821
	.value	4096
	.long	.LC2803
	.long	.LC2804
	.value	4821
	.value	4098
	.long	.LC2805
	.long	.LC2806
	.value	5973
	.value	0
	.long	.LC2807
	.long	.LC2808
	.value	4824
	.value	29154
	.long	.LC2809
	.long	.LC2810
	.value	4824
	.value	-32432
	.long	.LC2811
	.long	.LC2812
	.value	4824
	.value	-32430
	.long	.LC2813
	.long	.LC2814
	.value	4824
	.value	-7888
	.long	.LC2815
	.long	.LC2816
	.value	4827
	.value	3
	.long	.LC42
	.long	.LC2817
	.value	4830
	.value	512
	.long	.LC42
	.long	.LC2818
	.value	4831
	.value	8450
	.long	.LC2819
	.long	.LC2820
	.value	4831
	.value	-32202
	.long	.LC2613
	.long	.LC2821
	.value	4832
	.value	16
	.long	.LC2822
	.long	.LC2823
	.value	4832
	.value	32
	.long	.LC2822
	.long	.LC2823
	.value	4832
	.value	48
	.long	.LC2822
	.long	.LC2823
	.value	4836
	.value	4096
	.long	.LC2824
	.long	.LC2825
	.value	4836
	.value	4416
	.long	.LC42
	.long	.LC2543
	.value	4836
	.value	-20475
	.long	.LC2826
	.long	.LC2827
	.value	4836
	.value	-20474
	.long	.LC2826
	.long	.LC2827
	.value	4843
	.value	1
	.long	.LC2828
	.long	.LC2829
	.value	4843
	.value	2
	.long	.LC2830
	.long	.LC2831
	.value	4843
	.value	3
	.long	.LC2832
	.long	.LC2833
	.value	4844
	.value	-32455
	.long	.LC2834
	.long	.LC2834
	.value	4850
	.value	4098
	.long	.LC2835
	.long	.LC2836
	.value	4850
	.value	12377
	.long	.LC2837
	.long	.LC2838
	.value	4856
	.value	2
	.long	.LC2839
	.long	.LC2840
	.value	7649
	.value	913
	.long	.LC2841
	.long	.LC2842
	.value	7649
	.value	8224
	.long	.LC2843
	.long	.LC2844
	.value	7649
	.value	26892
	.long	.LC2845
	.long	.LC2846
	.value	7649
	.value	-9175
	.long	.LC2847
	.long	.LC2848
	.value	15677
	.value	1
	.long	.LC2849
	.long	.LC2850
	.value	15677
	.value	2
	.long	.LC2851
	.long	.LC2852
	.value	15677
	.value	3
	.long	.LC2853
	.long	.LC2854
	.value	15677
	.value	4
	.long	.LC2855
	.long	.LC2856
	.value	15677
	.value	5
	.long	.LC2857
	.long	.LC2856
	.value	15677
	.value	6
	.long	.LC2858
	.long	.LC2850
	.value	15677
	.value	7
	.long	.LC2859
	.long	.LC2860
	.value	15677
	.value	8
	.long	.LC2861
	.long	.LC42
	.value	15677
	.value	9
	.long	.LC2862
	.long	.LC2863
	.value	15677
	.value	10
	.long	.LC2864
	.long	.LC42
	.value	15677
	.value	12
	.long	.LC2864
	.long	.LC42
	.value	15677
	.value	13
	.long	.LC2865
	.long	.LC2850
	.value	15677
	.value	14
	.long	.LC2866
	.long	.LC42
	.value	15677
	.value	48
	.long	.LC2867
	.long	.LC2868
	.value	15677
	.value	256
	.long	.LC2869
	.long	.LC2856
	.value	15677
	.value	4100
	.long	.LC2857
	.long	.LC2870
	.value	15677
	.value	15620
	.long	.LC2857
	.long	.LC2856
	.value	15677
	.value	-1
	.long	.LC2871
	.long	.LC42
	.value	16389
	.value	768
	.long	.LC2872
	.long	.LC2873
	.value	16389
	.value	776
	.long	.LC2872
	.long	.LC2874
	.value	16389
	.value	777
	.long	.LC2875
	.long	.LC2876
	.value	16389
	.value	4196
	.long	.LC2877
	.long	.LC2878
	.value	16389
	.value	8292
	.long	.LC2879
	.long	.LC2878
	.value	16389
	.value	8488
	.long	.LC2880
	.long	.LC2878
	.value	16389
	.value	8961
	.long	.LC2881
	.long	.LC2878
	.value	16389
	.value	8962
	.long	.LC2882
	.long	.LC2878
	.value	16389
	.value	8963
	.long	.LC2883
	.long	.LC2878
	.value	16389
	.value	9060
	.long	.LC2884
	.long	.LC2878
	.value	16389
	.value	9316
	.long	.LC2885
	.long	.LC2878
	.value	16389
	.value	9473
	.long	.LC2886
	.long	.LC2878
	.value	16389
	.value	16384
	.long	.LC2887
	.long	.LC2888
	.value	21299
	.value	1361
	.long	.LC2889
	.long	.LC2890
	.value	21299
	.value	21299
	.long	.LC2298
	.long	.LC2891
	.value	21299
	.value	22065
	.long	.LC2892
	.long	.LC2893
	.value	21299
	.value	-30720
	.long	.LC2894
	.long	.LC2895
	.value	21299
	.value	-30719
	.long	.LC2896
	.long	.LC2897
	.value	21299
	.value	-30704
	.long	.LC2898
	.long	.LC2899
	.value	21299
	.value	-30703
	.long	.LC2900
	.long	.LC2901
	.value	21299
	.value	-30702
	.long	.LC2902
	.long	.LC2903
	.value	21299
	.value	-30701
	.long	.LC2904
	.long	.LC2905
	.value	21299
	.value	-30700
	.long	.LC2906
	.long	.LC2907
	.value	21299
	.value	-30699
	.long	.LC2908
	.long	.LC2909
	.value	21299
	.value	-30659
	.long	.LC2910
	.long	.LC2911
	.value	21299
	.value	-30608
	.long	.LC2912
	.long	.LC42
	.value	21299
	.value	-30592
	.long	.LC2913
	.long	.LC2914
	.value	21299
	.value	-30591
	.long	.LC2913
	.long	.LC2915
	.value	21299
	.value	-30590
	.long	.LC2913
	.long	.LC2916
	.value	21299
	.value	-30589
	.long	.LC2913
	.long	.LC2917
	.value	21299
	.value	-30544
	.long	.LC2918
	.long	.LC2919
	.value	21299
	.value	-30543
	.long	.LC2918
	.long	.LC2920
	.value	21299
	.value	-30542
	.long	.LC2918
	.long	.LC2921
	.value	21299
	.value	-30541
	.long	.LC2918
	.long	.LC2922
	.value	21299
	.value	-30528
	.long	.LC2923
	.long	.LC2924
	.value	21299
	.value	-30527
	.long	.LC2923
	.long	.LC2925
	.value	21299
	.value	-30526
	.long	.LC2923
	.long	.LC2926
	.value	21299
	.value	-30525
	.long	.LC2923
	.long	.LC2927
	.value	21299
	.value	-30512
	.long	.LC2896
	.long	.LC2928
	.value	21299
	.value	-30511
	.long	.LC2896
	.long	.LC2929
	.value	21299
	.value	-30510
	.long	.LC2896
	.long	.LC2930
	.value	21299
	.value	-30509
	.long	.LC2896
	.long	.LC2931
	.value	21299
	.value	-30480
	.long	.LC2932
	.long	.LC2933
	.value	21299
	.value	-30479
	.long	.LC2932
	.long	.LC2934
	.value	21299
	.value	-30478
	.long	.LC2932
	.long	.LC2935
	.value	21299
	.value	-30477
	.long	.LC2932
	.long	.LC2936
	.value	21299
	.value	-30464
	.long	.LC2937
	.long	.LC2938
	.value	21299
	.value	-30463
	.long	.LC2939
	.long	.LC2940
	.value	21299
	.value	-30462
	.long	.LC2889
	.long	.LC2941
	.value	21299
	.value	-30461
	.long	.LC42
	.long	.LC2942
	.value	21299
	.value	-30460
	.long	.LC2943
	.long	.LC2944
	.value	21299
	.value	-30459
	.long	.LC2945
	.long	.LC2946
	.value	21299
	.value	-30458
	.long	.LC2945
	.long	.LC2946
	.value	21299
	.value	-30457
	.long	.LC2945
	.long	.LC2946
	.value	21299
	.value	-30456
	.long	.LC2947
	.long	.LC2946
	.value	21299
	.value	-30455
	.long	.LC2948
	.long	.LC2946
	.value	21299
	.value	-30454
	.long	.LC2949
	.long	.LC2946
	.value	21299
	.value	-30453
	.long	.LC2950
	.long	.LC2946
	.value	21299
	.value	-30452
	.long	.LC2951
	.long	.LC2946
	.value	21299
	.value	-30451
	.long	.LC42
	.long	.LC2946
	.value	21299
	.value	-30450
	.long	.LC2947
	.long	.LC2946
	.value	21299
	.value	-30449
	.long	.LC2945
	.long	.LC2946
	.value	21299
	.value	-30207
	.long	.LC2952
	.long	.LC2953
	.value	21299
	.value	-30192
	.long	.LC2954
	.long	.LC2955
	.value	21299
	.value	-30191
	.long	.LC2956
	.long	.LC2957
	.value	21299
	.value	-30190
	.long	.LC2956
	.long	.LC2958
	.value	21299
	.value	-30189
	.long	.LC2959
	.long	.LC2960
	.value	21299
	.value	-30176
	.long	.LC2961
	.long	.LC2962
	.value	21299
	.value	-30175
	.long	.LC2963
	.long	.LC2964
	.value	21299
	.value	-30174
	.long	.LC2965
	.long	.LC2966
	.value	21299
	.value	-30173
	.long	.LC2967
	.long	.LC2966
	.value	21299
	.value	-30171
	.long	.LC2968
	.long	.LC2969
	.value	21299
	.value	-30170
	.long	.LC2970
	.long	.LC2971
	.value	21299
	.value	-29696
	.long	.LC2972
	.long	.LC2973
	.value	21299
	.value	-29695
	.long	.LC2974
	.long	.LC2975
	.value	21299
	.value	-29694
	.long	.LC2976
	.long	.LC2977
	.value	21299
	.value	-29693
	.long	.LC2978
	.long	.LC2979
	.value	21299
	.value	-29680
	.long	.LC2980
	.long	.LC2981
	.value	21299
	.value	-29678
	.long	.LC2980
	.long	.LC2981
	.value	21299
	.value	-29677
	.long	.LC2982
	.long	.LC2983
	.value	21299
	.value	-29662
	.long	.LC2984
	.long	.LC2985
	.value	21299
	.value	-29654
	.long	.LC2986
	.long	.LC2987
	.value	21299
	.value	-29653
	.long	.LC2988
	.long	.LC2989
	.value	21299
	.value	-29652
	.long	.LC2990
	.long	.LC2991
	.value	21299
	.value	-29651
	.long	.LC2992
	.long	.LC2993
	.value	21299
	.value	-29650
	.long	.LC2994
	.long	.LC2995
	.value	21299
	.value	-29649
	.long	.LC2996
	.long	.LC2997
	.value	21299
	.value	-29439
	.long	.LC2998
	.long	.LC2999
	.value	21299
	.value	-29438
	.long	.LC3000
	.long	.LC3001
	.value	21299
	.value	-29436
	.long	.LC3002
	.long	.LC3003
	.value	21299
	.value	-29184
	.long	.LC3004
	.long	.LC3005
	.value	21299
	.value	-29183
	.long	.LC3006
	.long	.LC3007
	.value	21299
	.value	-28414
	.long	.LC3008
	.long	.LC3009
	.value	21299
	.value	-13824
	.long	.LC3010
	.long	.LC3011
	.value	5727
	.value	8192
	.long	.LC3012
	.long	.LC3013
	.value	-32634
	.value	8
	.long	.LC42
	.long	.LC3014
	.value	-32634
	.value	10302
	.long	.LC3015
	.long	.LC3016
	.value	-32634
	.value	777
	.long	.LC3017
	.long	.LC3018
	.value	-32634
	.value	781
	.long	.LC3019
	.long	.LC3020
	.value	-32634
	.value	792
	.long	.LC3021
	.long	.LC3022
	.value	-32634
	.value	793
	.long	.LC3021
	.long	.LC3022
	.value	-32634
	.value	806
	.long	.LC3023
	.long	.LC3024
	.value	-32634
	.value	807
	.long	.LC3025
	.long	.LC3026
	.value	-32634
	.value	809
	.long	.LC3025
	.long	.LC3027
	.value	-32634
	.value	810
	.long	.LC3025
	.long	.LC3028
	.value	-32634
	.value	812
	.long	.LC3029
	.long	.LC3030
	.value	-32634
	.value	816
	.long	.LC3031
	.long	.LC3032
	.value	-32634
	.value	817
	.long	.LC3031
	.long	.LC3033
	.value	-32634
	.value	818
	.long	.LC3031
	.long	.LC3034
	.value	-32634
	.value	819
	.long	.LC3031
	.long	.LC3035
	.value	-32634
	.value	820
	.long	.LC3031
	.long	.LC3036
	.value	-32634
	.value	821
	.long	.LC3037
	.long	.LC2816
	.value	-32634
	.value	822
	.long	.LC3037
	.long	.LC3038
	.value	-32634
	.value	832
	.long	.LC3039
	.long	.LC3040
	.value	-32634
	.value	833
	.long	.LC3039
	.long	.LC3041
	.value	-32634
	.value	880
	.long	.LC3042
	.long	.LC3043
	.value	-32634
	.value	881
	.long	.LC3042
	.long	.LC3044
	.value	-32634
	.value	882
	.long	.LC3042
	.long	.LC3045
	.value	-32634
	.value	883
	.long	.LC3042
	.long	.LC3046
	.value	-32634
	.value	884
	.long	.LC3042
	.long	.LC3036
	.value	-32634
	.value	1154
	.long	.LC3047
	.long	.LC3048
	.value	-32634
	.value	1155
	.long	.LC3049
	.long	.LC3050
	.value	-32634
	.value	1156
	.long	.LC3051
	.long	.LC3052
	.value	-32634
	.value	1158
	.long	.LC3053
	.long	.LC42
	.value	-32634
	.value	1187
	.long	.LC3054
	.long	.LC3055
	.value	-32634
	.value	1280
	.long	.LC3056
	.long	.LC3057
	.value	-32634
	.value	1281
	.long	.LC3056
	.long	.LC3058
	.value	-32634
	.value	1282
	.long	.LC3056
	.long	.LC3059
	.value	-32634
	.value	1283
	.long	.LC3056
	.long	.LC3060
	.value	-32634
	.value	1296
	.long	.LC3061
	.long	.LC3062
	.value	-32634
	.value	1297
	.long	.LC3061
	.long	.LC3063
	.value	-32634
	.value	1298
	.long	.LC3061
	.long	.LC3064
	.value	-32634
	.value	1299
	.long	.LC3061
	.long	.LC3065
	.value	-32634
	.value	1300
	.long	.LC3061
	.long	.LC3066
	.value	-32634
	.value	1301
	.long	.LC3061
	.long	.LC3067
	.value	-32634
	.value	1302
	.long	.LC3061
	.long	.LC3068
	.value	-32634
	.value	1328
	.long	.LC3069
	.long	.LC3059
	.value	-32634
	.value	1329
	.long	.LC3069
	.long	.LC3070
	.value	-32634
	.value	1330
	.long	.LC3069
	.long	.LC3071
	.value	-32634
	.value	1331
	.long	.LC3069
	.long	.LC3072
	.value	-32634
	.value	1332
	.long	.LC3069
	.long	.LC3073
	.value	-32634
	.value	1333
	.long	.LC3069
	.long	.LC3074
	.value	-32634
	.value	1334
	.long	.LC3069
	.long	.LC3075
	.value	-32634
	.value	1335
	.long	.LC3069
	.long	.LC3076
	.value	-32634
	.value	1536
	.long	.LC3077
	.long	.LC3078
	.value	-32634
	.value	2400
	.long	.LC3079
	.long	.LC3080
	.value	-32634
	.value	2402
	.long	.LC3081
	.long	.LC3082
	.value	-32634
	.value	2404
	.long	.LC3079
	.long	.LC3083
	.value	-32634
	.value	4096
	.long	.LC3084
	.long	.LC3085
	.value	-32634
	.value	4097
	.long	.LC3086
	.long	.LC3087
	.value	-32634
	.value	4098
	.long	.LC42
	.long	.LC3088
	.value	-32634
	.value	4100
	.long	.LC3089
	.long	.LC3090
	.value	-32634
	.value	4104
	.long	.LC3091
	.long	.LC3090
	.value	-32634
	.value	4105
	.long	.LC3092
	.long	.LC3093
	.value	-32634
	.value	4108
	.long	.LC3094
	.long	.LC3090
	.value	-32634
	.value	4109
	.long	.LC3095
	.long	.LC3096
	.value	-32634
	.value	4110
	.long	.LC3097
	.long	.LC3085
	.value	-32634
	.value	4111
	.long	.LC3098
	.long	.LC3099
	.value	-32634
	.value	4112
	.long	.LC3100
	.long	.LC3101
	.value	-32634
	.value	4113
	.long	.LC3098
	.long	.LC3093
	.value	-32634
	.value	4114
	.long	.LC3100
	.long	.LC3102
	.value	-32634
	.value	4115
	.long	.LC3103
	.long	.LC3090
	.value	-32634
	.value	4116
	.long	.LC3104
	.long	.LC3085
	.value	-32634
	.value	4117
	.long	.LC3097
	.long	.LC3096
	.value	-32634
	.value	4118
	.long	.LC3105
	.long	.LC3096
	.value	-32634
	.value	4119
	.long	.LC3105
	.long	.LC3096
	.value	-32634
	.value	4120
	.long	.LC3103
	.long	.LC3106
	.value	-32634
	.value	4121
	.long	.LC3107
	.long	.LC3096
	.value	-32634
	.value	4122
	.long	.LC3107
	.long	.LC3096
	.value	-32634
	.value	4125
	.long	.LC3100
	.long	.LC3108
	.value	-32634
	.value	4126
	.long	.LC3105
	.long	.LC3109
	.value	-32634
	.value	4134
	.long	.LC3110
	.long	.LC3085
	.value	-32634
	.value	4135
	.long	.LC3111
	.long	.LC3093
	.value	-32634
	.value	4136
	.long	.LC3111
	.long	.LC3085
	.value	-32634
	.value	4137
	.long	.LC3112
	.long	.LC3113
	.value	-32634
	.value	4144
	.long	.LC3114
	.long	.LC3115
	.value	-32634
	.value	4145
	.long	.LC3116
	.long	.LC3117
	.value	-32634
	.value	4146
	.long	.LC3116
	.long	.LC3117
	.value	-32634
	.value	4147
	.long	.LC3116
	.long	.LC3118
	.value	-32634
	.value	4148
	.long	.LC3116
	.long	.LC3118
	.value	-32634
	.value	4149
	.long	.LC3119
	.long	.LC3120
	.value	-32634
	.value	4150
	.long	.LC3119
	.long	.LC3120
	.value	-32634
	.value	4151
	.long	.LC3116
	.long	.LC3121
	.value	-32634
	.value	4152
	.long	.LC3116
	.long	.LC3122
	.value	-32634
	.value	4153
	.long	.LC3123
	.long	.LC3124
	.value	-32634
	.value	4154
	.long	.LC3125
	.long	.LC3126
	.value	-32634
	.value	4155
	.long	.LC3125
	.long	.LC3127
	.value	-32634
	.value	4156
	.long	.LC3125
	.long	.LC3128
	.value	-32634
	.value	4157
	.long	.LC3125
	.long	.LC3117
	.value	-32634
	.value	4158
	.long	.LC3125
	.long	.LC3118
	.value	-32634
	.value	4160
	.long	.LC3129
	.long	.LC3130
	.value	-32634
	.value	4162
	.long	.LC42
	.long	.LC3131
	.value	-32634
	.value	4163
	.long	.LC3132
	.long	.LC3133
	.value	-32634
	.value	4168
	.long	.LC3134
	.long	.LC3135
	.value	-32634
	.value	4169
	.long	.LC3136
	.long	.LC3137
	.value	-32634
	.value	4170
	.long	.LC3138
	.long	.LC3139
	.value	-32634
	.value	4171
	.long	.LC3140
	.long	.LC3139
	.value	-32634
	.value	4176
	.long	.LC3141
	.long	.LC3117
	.value	-32634
	.value	4177
	.long	.LC3141
	.long	.LC3117
	.value	-32634
	.value	4178
	.long	.LC3141
	.long	.LC3118
	.value	-32634
	.value	4179
	.long	.LC3141
	.long	.LC3118
	.value	-32634
	.value	4180
	.long	.LC3141
	.long	.LC3142
	.value	-32634
	.value	4181
	.long	.LC3141
	.long	.LC3143
	.value	-32634
	.value	4185
	.long	.LC3144
	.long	.LC3113
	.value	-32634
	.value	4190
	.long	.LC3145
	.long	.LC3146
	.value	-32634
	.value	4196
	.long	.LC3147
	.long	.LC3148
	.value	-32634
	.value	4197
	.long	.LC3149
	.long	.LC3121
	.value	-32634
	.value	4200
	.long	.LC3150
	.long	.LC3151
	.value	-32634
	.value	4213
	.long	.LC3107
	.long	.LC3085
	.value	-32634
	.value	4214
	.long	.LC3103
	.long	.LC3085
	.value	-32634
	.value	4215
	.long	.LC3107
	.long	.LC3109
	.value	-32634
	.value	4216
	.long	.LC3104
	.long	.LC3085
	.value	-32634
	.value	4217
	.long	.LC3100
	.long	.LC3108
	.value	-32634
	.value	4218
	.long	.LC3100
	.long	.LC3102
	.value	-32634
	.value	4219
	.long	.LC3100
	.long	.LC3101
	.value	-32634
	.value	4220
	.long	.LC3152
	.long	.LC3153
	.value	-32634
	.value	4224
	.long	.LC3154
	.long	.LC3155
	.value	-32634
	.value	4235
	.long	.LC3156
	.long	.LC3157
	.value	-32634
	.value	4236
	.long	.LC3158
	.long	.LC3159
	.value	-32634
	.value	4238
	.long	.LC3160
	.long	.LC3161
	.value	-32634
	.value	4239
	.long	.LC3160
	.long	.LC3162
	.value	-32634
	.value	4242
	.long	.LC3163
	.long	.LC3164
	.value	-32634
	.value	4244
	.long	.LC3165
	.long	.LC3166
	.value	-32634
	.value	4246
	.long	.LC3167
	.long	.LC3167
	.value	-32634
	.value	4250
	.long	.LC3168
	.long	.LC3169
	.value	-32634
	.value	4281
	.long	.LC3170
	.long	.LC3171
	.value	-32634
	.value	4285
	.long	.LC3138
	.long	.LC3172
	.value	-32634
	.value	4288
	.long	.LC3173
	.long	.LC3174
	.value	-32634
	.value	4318
	.long	.LC3175
	.long	.LC2551
	.value	-32634
	.value	4341
	.long	.LC3176
	.long	.LC3177
	.value	-32634
	.value	4352
	.long	.LC3178
	.long	.LC3179
	.value	-32634
	.value	4353
	.long	.LC3178
	.long	.LC3180
	.value	-32634
	.value	4354
	.long	.LC3181
	.long	.LC3182
	.value	-32634
	.value	4368
	.long	.LC3181
	.long	.LC3179
	.value	-32634
	.value	4370
	.long	.LC3181
	.long	.LC3182
	.value	-32634
	.value	4384
	.long	.LC3181
	.long	.LC3179
	.value	-32634
	.value	4385
	.long	.LC3181
	.long	.LC3180
	.value	-32634
	.value	4400
	.long	.LC3183
	.long	.LC3179
	.value	-32634
	.value	4401
	.long	.LC3183
	.long	.LC3180
	.value	-32634
	.value	4402
	.long	.LC3184
	.long	.LC3185
	.value	-32634
	.value	4449
	.long	.LC3186
	.long	.LC3187
	.value	-32634
	.value	4450
	.long	.LC3188
	.long	.LC3189
	.value	-32634
	.value	4473
	.long	.LC3100
	.long	.LC3108
	.value	-32634
	.value	4608
	.long	.LC3190
	.long	.LC3191
	.value	-32634
	.value	4617
	.long	.LC3192
	.long	.LC3193
	.value	-32634
	.value	4641
	.long	.LC3194
	.long	.LC3195
	.value	-32634
	.value	4642
	.long	.LC3194
	.long	.LC3196
	.value	-32634
	.value	4643
	.long	.LC3197
	.long	.LC3198
	.value	-32634
	.value	4645
	.long	.LC3199
	.long	.LC3200
	.value	-32634
	.value	4646
	.long	.LC3201
	.long	.LC3202
	.value	-32634
	.value	4647
	.long	.LC3203
	.long	.LC3204
	.value	-32634
	.value	4648
	.long	.LC3205
	.long	.LC3206
	.value	-32634
	.value	4649
	.long	.LC3207
	.long	.LC3208
	.value	-32634
	.value	4653
	.long	.LC3209
	.long	.LC3210
	.value	-32634
	.value	4654
	.long	.LC3211
	.long	.LC3212
	.value	-32634
	.value	4656
	.long	.LC3213
	.long	.LC3214
	.value	-32634
	.value	4657
	.long	.LC3215
	.long	.LC3216
	.value	-32634
	.value	4660
	.long	.LC3217
	.long	.LC2692
	.value	-32634
	.value	4661
	.long	.LC3218
	.long	.LC3219
	.value	-32634
	.value	4663
	.long	.LC3220
	.long	.LC3221
	.value	-32634
	.value	4665
	.long	.LC3211
	.long	.LC3214
	.value	-32634
	.value	4667
	.long	.LC3222
	.long	.LC3223
	.value	-32634
	.value	4668
	.long	.LC3224
	.long	.LC3225
	.value	-32634
	.value	4669
	.long	.LC3226
	.long	.LC3227
	.value	-32634
	.value	4670
	.long	.LC3228
	.long	.LC3229
	.value	-32634
	.value	4671
	.long	.LC3228
	.long	.LC3229
	.value	-32634
	.value	4672
	.long	.LC3230
	.long	.LC3231
	.value	-32634
	.value	4683
	.long	.LC3232
	.long	.LC3233
	.value	-32634
	.value	4688
	.long	.LC3234
	.long	.LC3235
	.value	-32634
	.value	4824
	.long	.LC3236
	.long	.LC3237
	.value	-32634
	.value	4960
	.long	.LC3186
	.long	.LC3238
	.value	-32634
	.value	4961
	.long	.LC3186
	.long	.LC3239
	.value	-32634
	.value	5216
	.long	.LC3240
	.long	.LC3241
	.value	-32634
	.value	5217
	.long	.LC3242
	.long	.LC3024
	.value	-32634
	.value	5218
	.long	.LC3240
	.long	.LC3243
	.value	-32634
	.value	6496
	.long	.LC3079
	.long	.LC3244
	.value	-32634
	.value	6498
	.long	.LC2366
	.long	.LC3245
	.value	-32634
	.value	6674
	.long	.LC2366
	.long	.LC3246
	.value	-32634
	.value	6675
	.long	.LC2366
	.long	.LC3246
	.value	-32634
	.value	6688
	.long	.LC3247
	.long	.LC42
	.value	-32634
	.value	6689
	.long	.LC3247
	.long	.LC3248
	.value	-32634
	.value	6690
	.long	.LC3247
	.long	.LC3249
	.value	-32634
	.value	6691
	.long	.LC3247
	.long	.LC3180
	.value	-32634
	.value	6692
	.long	.LC3247
	.long	.LC3250
	.value	-32634
	.value	6704
	.long	.LC3251
	.long	.LC3252
	.value	-32634
	.value	6705
	.long	.LC3253
	.long	.LC3180
	.value	-32634
	.value	6712
	.long	.LC3254
	.long	.LC3255
	.value	-32634
	.value	8485
	.long	.LC3256
	.long	.LC3257
	.value	-32634
	.value	9232
	.long	.LC3256
	.long	.LC3258
	.value	-32634
	.value	9233
	.long	.LC3256
	.long	.LC3259
	.value	-32634
	.value	9234
	.long	.LC3256
	.long	.LC3260
	.value	-32634
	.value	9235
	.long	.LC3256
	.long	.LC3261
	.value	-32634
	.value	9237
	.long	.LC3262
	.long	.LC3263
	.value	-32634
	.value	9238
	.long	.LC3264
	.long	.LC3265
	.value	-32634
	.value	9240
	.long	.LC3256
	.long	.LC3241
	.value	-32634
	.value	9248
	.long	.LC3266
	.long	.LC3258
	.value	-32634
	.value	9249
	.long	.LC3266
	.long	.LC3267
	.value	-32634
	.value	9250
	.long	.LC3266
	.long	.LC3260
	.value	-32634
	.value	9251
	.long	.LC3266
	.long	.LC3261
	.value	-32634
	.value	9253
	.long	.LC3268
	.long	.LC3269
	.value	-32634
	.value	9254
	.long	.LC3266
	.long	.LC3270
	.value	-32634
	.value	9256
	.long	.LC3266
	.long	.LC3241
	.value	-32634
	.value	9265
	.long	.LC3271
	.long	.LC3272
	.value	-32634
	.value	9280
	.long	.LC3273
	.long	.LC3274
	.value	-32634
	.value	9281
	.long	.LC3273
	.long	.LC3259
	.value	-32634
	.value	9282
	.long	.LC3275
	.long	.LC3276
	.value	-32634
	.value	9283
	.long	.LC3277
	.long	.LC3261
	.value	-32634
	.value	9284
	.long	.LC3275
	.long	.LC3278
	.value	-32634
	.value	9285
	.long	.LC3279
	.long	.LC3280
	.value	-32634
	.value	9286
	.long	.LC3275
	.long	.LC3270
	.value	-32634
	.value	9288
	.long	.LC3281
	.long	.LC3238
	.value	-32634
	.value	9289
	.long	.LC3282
	.long	.LC3283
	.value	-32634
	.value	9290
	.long	.LC3284
	.long	.LC2677
	.value	-32634
	.value	9291
	.long	.LC3273
	.long	.LC2677
	.value	-32634
	.value	9292
	.long	.LC3284
	.long	.LC3285
	.value	-32634
	.value	9294
	.long	.LC3125
	.long	.LC3238
	.value	-32634
	.value	9296
	.long	.LC3286
	.long	.LC3285
	.value	-32634
	.value	9298
	.long	.LC3286
	.long	.LC3260
	.value	-32634
	.value	9299
	.long	.LC3286
	.long	.LC3261
	.value	-32634
	.value	9305
	.long	.LC3286
	.long	.LC3287
	.value	-32634
	.value	9307
	.long	.LC3286
	.long	.LC2677
	.value	-32634
	.value	9309
	.long	.LC3286
	.long	.LC3288
	.value	-32634
	.value	9310
	.long	.LC3286
	.long	.LC3238
	.value	-32634
	.value	9344
	.long	.LC3289
	.long	.LC3285
	.value	-32634
	.value	9345
	.long	.LC3289
	.long	.LC3259
	.value	-32634
	.value	9346
	.long	.LC3290
	.long	.LC3260
	.value	-32634
	.value	9347
	.long	.LC3290
	.long	.LC3261
	.value	-32634
	.value	9348
	.long	.LC3290
	.long	.LC3260
	.value	-32634
	.value	9349
	.long	.LC3290
	.long	.LC3280
	.value	-32634
	.value	9350
	.long	.LC3290
	.long	.LC3291
	.value	-32634
	.value	9351
	.long	.LC3290
	.long	.LC3260
	.value	-32634
	.value	9354
	.long	.LC3116
	.long	.LC3292
	.value	-32634
	.value	9355
	.long	.LC3289
	.long	.LC3293
	.value	-32634
	.value	9356
	.long	.LC3116
	.long	.LC3294
	.value	-32634
	.value	9357
	.long	.LC3295
	.long	.LC3296
	.value	-32634
	.value	9408
	.long	.LC3297
	.long	.LC3285
	.value	-32634
	.value	9410
	.long	.LC3298
	.long	.LC3299
	.value	-32634
	.value	9411
	.long	.LC3298
	.long	.LC3300
	.value	-32634
	.value	9412
	.long	.LC3298
	.long	.LC3301
	.value	-32634
	.value	9413
	.long	.LC3302
	.long	.LC3303
	.value	-32634
	.value	9413
	.long	.LC3304
	.long	.LC3305
	.value	-32634
	.value	9414
	.long	.LC3132
	.long	.LC3270
	.value	-32634
	.value	9415
	.long	.LC3298
	.long	.LC3306
	.value	-32634
	.value	9418
	.long	.LC3307
	.long	.LC3308
	.value	-32634
	.value	9419
	.long	.LC3297
	.long	.LC3308
	.value	-32634
	.value	9420
	.long	.LC3307
	.long	.LC3285
	.value	-32634
	.value	9421
	.long	.LC3298
	.long	.LC3309
	.value	-32634
	.value	9424
	.long	.LC3141
	.long	.LC3285
	.value	-32634
	.value	9425
	.long	.LC3141
	.long	.LC3310
	.value	-32634
	.value	9426
	.long	.LC3141
	.long	.LC3299
	.value	-32634
	.value	9427
	.long	.LC3141
	.long	.LC3261
	.value	-32634
	.value	9428
	.long	.LC3141
	.long	.LC3311
	.value	-32634
	.value	9429
	.long	.LC3312
	.long	.LC3313
	.value	-32634
	.value	9430
	.long	.LC3141
	.long	.LC3265
	.value	-32634
	.value	9431
	.long	.LC3141
	.long	.LC3306
	.value	-32634
	.value	9435
	.long	.LC3141
	.long	.LC3314
	.value	-32634
	.value	9436
	.long	.LC3315
	.long	.LC3316
	.value	-32634
	.value	9437
	.long	.LC3141
	.long	.LC3309
	.value	-32634
	.value	9438
	.long	.LC3141
	.long	.LC3317
	.value	-32634
	.value	9439
	.long	.LC3318
	.long	.LC3319
	.value	-32634
	.value	9472
	.long	.LC3320
	.long	.LC3179
	.value	-32634
	.value	9473
	.long	.LC3320
	.long	.LC3321
	.value	-32634
	.value	9474
	.long	.LC3320
	.long	.LC42
	.value	-32634
	.value	9475
	.long	.LC3320
	.long	.LC42
	.value	-32634
	.value	9476
	.long	.LC3320
	.long	.LC42
	.value	-32634
	.value	9483
	.long	.LC3320
	.long	.LC3321
	.value	-32634
	.value	9487
	.long	.LC3320
	.long	.LC3180
	.value	-32634
	.value	9504
	.long	.LC3322
	.long	.LC3323
	.value	-32634
	.value	9505
	.long	.LC3324
	.long	.LC3325
	.value	-32634
	.value	9520
	.long	.LC3326
	.long	.LC3327
	.value	-32634
	.value	9521
	.long	.LC3328
	.long	.LC3329
	.value	-32634
	.value	9522
	.long	.LC3330
	.long	.LC3180
	.value	-32634
	.value	9523
	.long	.LC3328
	.long	.LC3331
	.value	-32634
	.value	9524
	.long	.LC3328
	.long	.LC3332
	.value	-32634
	.value	9525
	.long	.LC3328
	.long	.LC3333
	.value	-32634
	.value	9526
	.long	.LC3328
	.long	.LC3333
	.value	-32634
	.value	9529
	.long	.LC3328
	.long	.LC3334
	.value	-32634
	.value	9536
	.long	.LC3335
	.long	.LC3336
	.value	-32634
	.value	9537
	.long	.LC3337
	.long	.LC3338
	.value	-32634
	.value	9539
	.long	.LC3337
	.long	.LC3339
	.value	-32634
	.value	9540
	.long	.LC3337
	.long	.LC3340
	.value	-32634
	.value	9541
	.long	.LC3337
	.long	.LC3341
	.value	-32634
	.value	9542
	.long	.LC3337
	.long	.LC3342
	.value	-32634
	.value	9543
	.long	.LC3337
	.long	.LC3343
	.value	-32634
	.value	9544
	.long	.LC3337
	.long	.LC3344
	.value	-32634
	.value	9548
	.long	.LC3345
	.long	.LC3346
	.value	-32634
	.value	9552
	.long	.LC3347
	.long	.LC3346
	.value	-32634
	.value	9553
	.long	.LC3348
	.long	.LC3349
	.value	-32634
	.value	9554
	.long	.LC3350
	.long	.LC3351
	.value	-32634
	.value	9555
	.long	.LC3347
	.long	.LC3352
	.value	-32634
	.value	9556
	.long	.LC3347
	.long	.LC3353
	.value	-32634
	.value	9565
	.long	.LC3354
	.long	.LC3346
	.value	-32634
	.value	9568
	.long	.LC3355
	.long	.LC3356
	.value	-32634
	.value	9569
	.long	.LC3355
	.long	.LC3357
	.value	-32634
	.value	9570
	.long	.LC3268
	.long	.LC3358
	.value	-32634
	.value	9584
	.long	.LC3359
	.long	.LC3360
	.value	-32634
	.value	9585
	.long	.LC3359
	.long	.LC3351
	.value	-32634
	.value	9586
	.long	.LC3361
	.long	.LC3358
	.value	-32634
	.value	9587
	.long	.LC3359
	.long	.LC3362
	.value	-32634
	.value	9590
	.long	.LC3359
	.long	.LC3363
	.value	-32634
	.value	9592
	.long	.LC3364
	.long	.LC3360
	.value	-32634
	.value	9593
	.long	.LC3365
	.long	.LC3351
	.value	-32634
	.value	9594
	.long	.LC42
	.long	.LC42
	.value	-32634
	.value	9595
	.long	.LC3364
	.long	.LC3366
	.value	-32634
	.value	9598
	.long	.LC3364
	.long	.LC3363
	.value	-32634
	.value	9600
	.long	.LC3367
	.long	.LC3368
	.value	-32634
	.value	9601
	.long	.LC3369
	.long	.LC3370
	.value	-32634
	.value	9602
	.long	.LC3371
	.long	.LC3372
	.value	-32634
	.value	9604
	.long	.LC3373
	.long	.LC3368
	.value	-32634
	.value	9608
	.long	.LC3374
	.long	.LC3375
	.value	-32634
	.value	9609
	.long	.LC3374
	.long	.LC3376
	.value	-32634
	.value	9610
	.long	.LC3374
	.long	.LC3377
	.value	-32634
	.value	9616
	.long	.LC3378
	.long	.LC3379
	.value	-32634
	.value	9618
	.long	.LC3380
	.long	.LC3381
	.value	-32634
	.value	9633
	.long	.LC3382
	.long	.LC3285
	.value	-32634
	.value	9634
	.long	.LC3382
	.long	.LC2677
	.value	-32634
	.value	9635
	.long	.LC3382
	.long	.LC3310
	.value	-32634
	.value	9636
	.long	.LC3382
	.long	.LC3261
	.value	-32634
	.value	9638
	.long	.LC3382
	.long	.LC3383
	.value	-32634
	.value	9639
	.long	.LC3382
	.long	.LC3265
	.value	-32634
	.value	9641
	.long	.LC3382
	.long	.LC3384
	.value	-32634
	.value	9642
	.long	.LC3382
	.long	.LC3385
	.value	-32634
	.value	9643
	.long	.LC3382
	.long	.LC3386
	.value	-32634
	.value	9644
	.long	.LC3382
	.long	.LC3387
	.value	-32634
	.value	9645
	.long	.LC3382
	.long	.LC3388
	.value	-32634
	.value	9646
	.long	.LC3382
	.long	.LC3389
	.value	-32634
	.value	9648
	.long	.LC3382
	.long	.LC3390
	.value	-32634
	.value	9728
	.long	.LC3391
	.long	.LC3392
	.value	-32634
	.value	9729
	.long	.LC3391
	.long	.LC3393
	.value	-32634
	.value	9730
	.long	.LC3391
	.long	.LC3394
	.value	-32634
	.value	9731
	.long	.LC3391
	.long	.LC3395
	.value	-32634
	.value	9732
	.long	.LC3391
	.long	.LC3396
	.value	-32634
	.value	9733
	.long	.LC3391
	.long	.LC3397
	.value	-32634
	.value	9734
	.long	.LC3391
	.long	.LC3398
	.value	-32634
	.value	9735
	.long	.LC3391
	.long	.LC3399
	.value	-32634
	.value	9792
	.long	.LC3400
	.long	.LC3285
	.value	-32634
	.value	9793
	.long	.LC3401
	.long	.LC3402
	.value	-32634
	.value	9809
	.long	.LC3403
	.long	.LC3310
	.value	-32634
	.value	9810
	.long	.LC3404
	.long	.LC3405
	.value	-32634
	.value	9810
	.long	.LC3406
	.long	.LC3310
	.value	-32634
	.value	9810
	.long	.LC3406
	.long	.LC3407
	.value	-32634
	.value	9810
	.long	.LC3406
	.long	.LC3408
	.value	-32634
	.value	9811
	.long	.LC3401
	.long	.LC3409
	.value	-32634
	.value	9811
	.long	.LC3401
	.long	.LC3410
	.value	-32634
	.value	9811
	.long	.LC3401
	.long	.LC3408
	.value	-32634
	.value	9816
	.long	.LC3149
	.long	.LC3299
	.value	-32634
	.value	9817
	.long	.LC3149
	.long	.LC3311
	.value	-32634
	.value	9818
	.long	.LC3149
	.long	.LC3306
	.value	-32634
	.value	9819
	.long	.LC3149
	.long	.LC3317
	.value	-32634
	.value	9820
	.long	.LC3149
	.long	.LC3388
	.value	-32634
	.value	9824
	.long	.LC3149
	.long	.LC3411
	.value	-32634
	.value	9826
	.long	.LC3149
	.long	.LC3412
	.value	-32634
	.value	9828
	.long	.LC3413
	.long	.LC3414
	.value	-32634
	.value	9830
	.long	.LC3149
	.long	.LC3415
	.value	-32634
	.value	9832
	.long	.LC3416
	.long	.LC3417
	.value	-32634
	.value	9833
	.long	.LC3418
	.long	.LC3419
	.value	-32634
	.value	9834
	.long	.LC3420
	.long	.LC3261
	.value	-32634
	.value	9836
	.long	.LC3149
	.long	.LC3121
	.value	-32634
	.value	9837
	.long	.LC3421
	.long	.LC3422
	.value	-32634
	.value	9838
	.long	.LC3423
	.long	.LC3424
	.value	-32634
	.value	9839
	.long	.LC3425
	.long	.LC3426
	.value	-32634
	.value	9857
	.long	.LC3427
	.long	.LC3428
	.value	-32634
	.value	10096
	.long	.LC3429
	.long	.LC3375
	.value	-32634
	.value	10097
	.long	.LC3429
	.long	.LC3430
	.value	-32634
	.value	10098
	.long	.LC3431
	.long	.LC3358
	.value	-32634
	.value	10108
	.long	.LC3432
	.long	.LC3433
	.value	-32634
	.value	10112
	.long	.LC3434
	.long	.LC3435
	.value	-32634
	.value	10114
	.long	.LC3434
	.long	.LC3436
	.value	-32634
	.value	10130
	.long	.LC3437
	.long	.LC3438
	.value	-32634
	.value	10144
	.long	.LC3439
	.long	.LC3440
	.value	-32634
	.value	10146
	.long	.LC3441
	.long	.LC3442
	.value	-32634
	.value	10150
	.long	.LC3443
	.long	.LC3444
	.value	-32634
	.value	10168
	.long	.LC3445
	.long	.LC3446
	.value	-32634
	.value	10176
	.long	.LC3447
	.long	.LC3448
	.value	-32634
	.value	10177
	.long	.LC3447
	.long	.LC3408
	.value	-32634
	.value	10179
	.long	.LC3449
	.long	.LC3450
	.value	-32634
	.value	10180
	.long	.LC3451
	.long	.LC3410
	.value	-32634
	.value	10181
	.long	.LC3451
	.long	.LC3408
	.value	-32634
	.value	10182
	.long	.LC3452
	.long	.LC3450
	.value	-32634
	.value	10184
	.long	.LC3453
	.long	.LC3301
	.value	-32634
	.value	10185
	.long	.LC3453
	.long	.LC3301
	.value	-32634
	.value	10186
	.long	.LC3453
	.long	.LC3301
	.value	-32634
	.value	10187
	.long	.LC42
	.long	.LC3301
	.value	-32634
	.value	10200
	.long	.LC3454
	.long	.LC3455
	.value	-32634
	.value	10200
	.long	.LC3456
	.long	.LC3457
	.value	-32634
	.value	10200
	.long	.LC42
	.long	.LC3458
	.value	-32634
	.value	10202
	.long	.LC3459
	.long	.LC3460
	.value	-32634
	.value	10204
	.long	.LC3461
	.long	.LC3462
	.value	-32634
	.value	10207
	.long	.LC3463
	.long	.LC3464
	.value	-32634
	.value	10272
	.long	.LC3465
	.long	.LC3466
	.value	-32634
	.value	10273
	.long	.LC3467
	.long	.LC3408
	.value	-32634
	.value	10274
	.long	.LC3468
	.long	.LC3450
	.value	-32634
	.value	10276
	.long	.LC3469
	.long	.LC3470
	.value	-32634
	.value	10277
	.long	.LC3465
	.long	.LC3471
	.value	-32634
	.value	10280
	.long	.LC3472
	.long	.LC3410
	.value	-32634
	.value	10281
	.long	.LC3472
	.long	.LC3408
	.value	-32634
	.value	10282
	.long	.LC3473
	.long	.LC3450
	.value	-32634
	.value	10298
	.long	.LC3474
	.long	.LC3475
	.value	-32634
	.value	10315
	.long	.LC3476
	.long	.LC3477
	.value	-32634
	.value	10320
	.long	.LC3472
	.long	.LC3478
	.value	-32634
	.value	10528
	.long	.LC3479
	.long	.LC3466
	.value	-32634
	.value	10529
	.long	.LC3480
	.long	.LC3481
	.value	-32634
	.value	10530
	.long	.LC3480
	.long	.LC3408
	.value	-32634
	.value	10531
	.long	.LC3482
	.long	.LC3483
	.value	-32634
	.value	10533
	.long	.LC3484
	.long	.LC3450
	.value	-32634
	.value	10534
	.long	.LC3480
	.long	.LC3485
	.value	-32634
	.value	10536
	.long	.LC3486
	.long	.LC3487
	.value	-32634
	.value	10537
	.long	.LC3488
	.long	.LC3489
	.value	-32634
	.value	10541
	.long	.LC3486
	.long	.LC3490
	.value	-32634
	.value	10542
	.long	.LC3486
	.long	.LC3491
	.value	-32634
	.value	10544
	.long	.LC2432
	.long	.LC3492
	.value	-32634
	.value	10558
	.long	.LC3493
	.long	.LC3494
	.value	-32634
	.value	10572
	.long	.LC3495
	.long	.LC3496
	.value	-32634
	.value	10610
	.long	.LC3497
	.long	.LC3498
	.value	-32634
	.value	10631
	.long	.LC3499
	.long	.LC3500
	.value	-32634
	.value	10642
	.long	.LC42
	.long	.LC3501
	.value	-32634
	.value	10643
	.long	.LC42
	.long	.LC3502
	.value	-32634
	.value	10644
	.long	.LC3503
	.long	.LC3504
	.value	-32634
	.value	10647
	.long	.LC3499
	.long	.LC3500
	.value	-32634
	.value	10656
	.long	.LC3505
	.long	.LC3506
	.value	-32634
	.value	10657
	.long	.LC3507
	.long	.LC3508
	.value	-32634
	.value	10660
	.long	.LC3509
	.long	.LC3510
	.value	-32634
	.value	10674
	.long	.LC3511
	.long	.LC3512
	.value	-32634
	.value	10675
	.long	.LC3511
	.long	.LC2308
	.value	-32634
	.value	10676
	.long	.LC3513
	.long	.LC3514
	.value	-32634
	.value	10679
	.long	.LC3513
	.long	.LC3515
	.value	-32634
	.value	10690
	.long	.LC3516
	.long	.LC3517
	.value	-32634
	.value	10708
	.long	.LC3132
	.long	.LC3518
	.value	-32634
	.value	10754
	.long	.LC3519
	.long	.LC3520
	.value	-32634
	.value	10755
	.long	.LC3521
	.long	.LC3522
	.value	-32634
	.value	10756
	.long	.LC3523
	.long	.LC3524
	.value	-32634
	.value	10759
	.long	.LC3499
	.long	.LC3500
	.value	-32634
	.value	10760
	.long	.LC3525
	.long	.LC3526
	.value	-32634
	.value	10820
	.long	.LC2626
	.long	.LC2626
	.value	-32634
	.value	10823
	.long	.LC3527
	.long	.LC3528
	.value	-32634
	.value	12032
	.long	.LC3312
	.long	.LC3313
	.value	-32634
	.value	12434
	.long	.LC3529
	.long	.LC3530
	.value	-32634
	.value	12800
	.long	.LC3531
	.long	.LC3532
	.value	-32634
	.value	13120
	.long	.LC3533
	.long	.LC3252
	.value	-32634
	.value	13121
	.long	.LC3533
	.long	.LC3180
	.value	-32634
	.value	13122
	.long	.LC3533
	.long	.LC3534
	.value	-32634
	.value	13453
	.long	.LC3103
	.long	.LC3085
	.value	-32634
	.value	13685
	.long	.LC3535
	.long	.LC3536
	.value	-32634
	.value	13686
	.long	.LC3537
	.long	.LC3538
	.value	-32634
	.value	13687
	.long	.LC3539
	.long	.LC3358
	.value	-32634
	.value	13688
	.long	.LC3535
	.long	.LC3540
	.value	-32634
	.value	13689
	.long	.LC3541
	.long	.LC3542
	.value	-32634
	.value	13691
	.long	.LC3541
	.long	.LC3358
	.value	-32634
	.value	13696
	.long	.LC3543
	.long	.LC3252
	.value	-32634
	.value	13697
	.long	.LC3544
	.long	.LC3545
	.value	-32634
	.value	13698
	.long	.LC3543
	.long	.LC3358
	.value	-32634
	.value	13700
	.long	.LC3543
	.long	.LC3546
	.value	-32634
	.value	13701
	.long	.LC3547
	.long	.LC3548
	.value	-32634
	.value	13712
	.long	.LC3549
	.long	.LC3550
	.value	-32634
	.value	13713
	.long	.LC3549
	.long	.LC3550
	.value	-32634
	.value	13714
	.long	.LC3551
	.long	.LC3550
	.value	-32634
	.value	13715
	.long	.LC3552
	.long	.LC3553
	.value	-32634
	.value	13716
	.long	.LC3549
	.long	.LC3554
	.value	-32634
	.value	13717
	.long	.LC3552
	.long	.LC3555
	.value	-32634
	.value	13718
	.long	.LC3552
	.long	.LC3556
	.value	-32634
	.value	13719
	.long	.LC3552
	.long	.LC3556
	.value	-32634
	.value	13720
	.long	.LC3549
	.long	.LC3397
	.value	-32634
	.value	13721
	.long	.LC3549
	.long	.LC3557
	.value	-32634
	.value	13722
	.long	.LC3549
	.long	.LC3395
	.value	-32634
	.value	13723
	.long	.LC3552
	.long	.LC3558
	.value	-32634
	.value	13726
	.long	.LC3552
	.long	.LC3559
	.value	-32634
	.value	13835
	.long	.LC42
	.long	.LC3560
	.value	-32634
	.value	14848
	.long	.LC3561
	.long	.LC3562
	.value	-32634
	.value	14850
	.long	.LC3563
	.long	.LC3564
	.value	-32634
	.value	14851
	.long	.LC3565
	.long	.LC3566
	.value	-32634
	.value	14854
	.long	.LC3561
	.long	.LC3567
	.value	-32634
	.value	14880
	.long	.LC3561
	.long	.LC3568
	.value	-32634
	.value	14882
	.long	.LC3563
	.long	.LC3408
	.value	-32634
	.value	14883
	.long	.LC3565
	.long	.LC3566
	.value	-32634
	.value	14886
	.long	.LC3561
	.long	.LC3569
	.value	-32634
	.value	14896
	.long	.LC3570
	.long	.LC3571
	.value	-32634
	.value	16384
	.long	.LC3572
	.long	.LC3573
	.value	-32634
	.value	16928
	.long	.LC3574
	.long	.LC3575
	.value	-32634
	.value	16930
	.long	.LC3576
	.long	.LC3577
	.value	-32634
	.value	16931
	.long	.LC3578
	.long	.LC3579
	.value	-32634
	.value	16932
	.long	.LC3580
	.long	.LC3581
	.value	-32634
	.value	16935
	.long	.LC3582
	.long	.LC3583
	.value	-32634
	.value	16937
	.long	.LC3584
	.long	.LC3585
	.value	-32634
	.value	16941
	.long	.LC3584
	.long	.LC3586
	.value	-32634
	.value	16944
	.long	.LC3584
	.long	.LC3586
	.value	-32634
	.value	16946
	.long	.LC3587
	.long	.LC3588
	.value	-32634
	.value	16947
	.long	.LC3584
	.long	.LC3586
	.value	-32634
	.value	16949
	.long	.LC3589
	.long	.LC3590
	.value	-32634
	.value	16951
	.long	.LC3591
	.long	.LC3592
	.value	-32634
	.value	17486
	.long	.LC3593
	.long	.LC3594
	.value	-32634
	.value	20481
	.long	.LC3595
	.long	.LC3596
	.value	-32634
	.value	20485
	.long	.LC3597
	.long	.LC3598
	.value	-32634
	.value	20521
	.long	.LC3599
	.long	.LC3408
	.value	-32634
	.value	20992
	.long	.LC3600
	.long	.LC2519
	.value	-32634
	.value	20993
	.long	.LC42
	.long	.LC3601
	.value	-32634
	.value	21257
	.long	.LC3017
	.long	.LC3602
	.value	-32634
	.value	21261
	.long	.LC3019
	.long	.LC3603
	.value	-32634
	.value	26976
	.long	.LC42
	.long	.LC3604
	.value	-32634
	.value	28672
	.long	.LC3605
	.long	.LC3606
	.value	-32634
	.value	28688
	.long	.LC3605
	.long	.LC3607
	.value	-32634
	.value	28704
	.long	.LC3605
	.long	.LC3608
	.value	-32634
	.value	28720
	.long	.LC3609
	.long	.LC3610
	.value	-32634
	.value	28753
	.long	.LC3611
	.long	.LC3612
	.value	-32634
	.value	28928
	.long	.LC3218
	.long	.LC3613
	.value	-32634
	.value	28944
	.long	.LC3614
	.long	.LC3615
	.value	-32634
	.value	28945
	.long	.LC3614
	.long	.LC3616
	.value	-32634
	.value	28946
	.long	.LC3614
	.long	.LC3617
	.value	-32634
	.value	28947
	.long	.LC3614
	.long	.LC3618
	.value	-32634
	.value	28960
	.long	.LC3271
	.long	.LC3179
	.value	-32634
	.value	28961
	.long	.LC3271
	.long	.LC3619
	.value	-32634
	.value	28962
	.long	.LC3620
	.long	.LC3179
	.value	-32634
	.value	28963
	.long	.LC3620
	.long	.LC3621
	.value	-32634
	.value	28964
	.long	.LC3622
	.long	.LC3179
	.value	-32634
	.value	28965
	.long	.LC3622
	.long	.LC3623
	.value	-32634
	.value	28966
	.long	.LC3624
	.long	.LC3625
	.value	-32634
	.value	28967
	.long	.LC3624
	.long	.LC3626
	.value	-32634
	.value	28968
	.long	.LC3627
	.long	.LC3625
	.value	-32634
	.value	28970
	.long	.LC3628
	.long	.LC3625
	.value	-32634
	.value	29056
	.long	.LC3629
	.long	.LC3630
	.value	-32634
	.value	29057
	.long	.LC3631
	.long	.LC3632
	.value	-32634
	.value	29058
	.long	.LC3633
	.long	.LC2021
	.value	-32634
	.value	29072
	.long	.LC3634
	.long	.LC3635
	.value	-32634
	.value	29073
	.long	.LC3634
	.long	.LC3636
	.value	-32634
	.value	29074
	.long	.LC3634
	.long	.LC3637
	.value	-32634
	.value	29076
	.long	.LC3638
	.long	.LC3639
	.value	-32634
	.value	29077
	.long	.LC3638
	.long	.LC3280
	.value	-32634
	.value	29078
	.long	.LC3640
	.long	.LC3641
	.value	-32634
	.value	29080
	.long	.LC3638
	.long	.LC2692
	.value	-32634
	.value	29081
	.long	.LC3638
	.long	.LC3314
	.value	-32634
	.value	29082
	.long	.LC3638
	.long	.LC3642
	.value	-32634
	.value	29083
	.long	.LC3638
	.long	.LC3643
	.value	-32634
	.value	29088
	.long	.LC3644
	.long	.LC3645
	.value	-32634
	.value	29089
	.long	.LC3646
	.long	.LC2308
	.value	-32634
	.value	29090
	.long	.LC3644
	.long	.LC3645
	.value	-32634
	.value	29217
	.long	.LC3271
	.long	.LC3647
	.value	-32634
	.value	30208
	.long	.LC3648
	.long	.LC3649
	.value	-32634
	.value	30209
	.long	.LC3648
	.long	.LC3314
	.value	-32634
	.value	30210
	.long	.LC3648
	.long	.LC3650
	.value	-32634
	.value	30211
	.long	.LC3648
	.long	.LC3651
	.value	-32634
	.value	30213
	.long	.LC3652
	.long	.LC3653
	.value	-32634
	.value	30720
	.long	.LC3654
	.long	.LC3231
	.value	-32634
	.value	-32634
	.long	.LC3655
	.long	.LC3504
	.value	-32634
	.value	-32486
	.long	.LC3656
	.long	.LC3657
	.value	-32634
	.value	-31548
	.long	.LC3658
	.long	.LC3659
	.value	-32634
	.value	-31547
	.long	.LC3660
	.long	.LC3661
	.value	-32634
	.value	-31542
	.long	.LC3662
	.long	.LC3663
	.value	-32634
	.value	-31541
	.long	.LC3664
	.long	.LC3665
	.value	-32634
	.value	-31520
	.long	.LC3666
	.long	.LC3667
	.value	-32634
	.value	-31519
	.long	.LC3668
	.long	.LC3669
	.value	-32634
	.value	-31518
	.long	.LC3670
	.long	.LC3671
	.value	-32634
	.value	-31517
	.long	.LC3672
	.long	.LC3673
	.value	-32634
	.value	-31516
	.long	.LC3674
	.long	.LC3675
	.value	-32634
	.value	-31514
	.long	.LC3228
	.long	.LC3676
	.value	-32634
	.value	-31510
	.long	.LC3677
	.long	.LC3678
	.value	-32634
	.value	-31327
	.long	.LC3382
	.long	.LC3679
	.value	-32634
	.value	-31326
	.long	.LC3382
	.long	.LC2677
	.value	-32634
	.value	-31325
	.long	.LC3382
	.long	.LC3680
	.value	-32634
	.value	-31324
	.long	.LC3382
	.long	.LC3261
	.value	-32634
	.value	-31322
	.long	.LC3382
	.long	.LC3383
	.value	-32634
	.value	-31321
	.long	.LC3382
	.long	.LC3265
	.value	-32634
	.value	-31319
	.long	.LC3382
	.long	.LC3384
	.value	-32634
	.value	-31318
	.long	.LC3382
	.long	.LC3385
	.value	-32634
	.value	-27104
	.long	.LC42
	.long	.LC3681
	.value	-32634
	.value	-27103
	.long	.LC3682
	.long	.LC3530
	.value	-32634
	.value	-27102
	.long	.LC3683
	.long	.LC3530
	.value	-32634
	.value	-27071
	.long	.LC3684
	.long	.LC3530
	.value	-32634
	.value	-26975
	.long	.LC3685
	.long	.LC3530
	.value	-32634
	.value	-26508
	.long	.LC3686
	.long	.LC3687
	.value	-32634
	.value	-26506
	.long	.LC3688
	.long	.LC3689
	.value	-32634
	.value	-20142
	.long	.LC3690
	.long	.LC2519
	.value	-32634
	.value	-20140
	.long	.LC3691
	.long	.LC2519
	.value	-32634
	.value	-19115
	.long	.LC3692
	.long	.LC3693
	.value	-32634
	.value	8671
	.long	.LC42
	.long	.LC42
	.value	-28668
	.value	120
	.long	.LC3694
	.long	.LC3695
	.value	-28668
	.value	4216
	.long	.LC3696
	.long	.LC3697
	.value	-28668
	.value	4405
	.long	.LC3698
	.long	.LC172
	.value	-28668
	.value	4448
	.long	.LC3699
	.long	.LC3700
	.value	-28668
	.value	8568
	.long	.LC3701
	.long	.LC2844
	.value	-28668
	.value	14432
	.long	.LC42
	.long	.LC3702
	.value	-28668
	.value	15224
	.long	.LC3703
	.long	.LC3704
	.value	-28668
	.value	20597
	.long	.LC3705
	.long	.LC3706
	.value	-28668
	.value	20600
	.long	.LC3707
	.long	.LC3708
	.value	-28668
	.value	20853
	.long	.LC3705
	.long	.LC3706
	.value	-28668
	.value	20856
	.long	.LC3709
	.long	.LC3710
	.value	-28668
	.value	21109
	.long	.LC3705
	.long	.LC3706
	.value	-28668
	.value	21112
	.long	.LC3709
	.long	.LC3711
	.value	-28668
	.value	21365
	.long	.LC3705
	.long	.LC3706
	.value	-28668
	.value	21368
	.long	.LC3709
	.long	.LC3711
	.value	-28668
	.value	21621
	.long	.LC3705
	.long	.LC3706
	.value	-28668
	.value	21624
	.long	.LC3709
	.long	.LC3711
	.value	-28668
	.value	21877
	.long	.LC3712
	.long	.LC3706
	.value	-28668
	.value	21880
	.long	.LC3713
	.long	.LC3711
	.value	-28668
	.value	22133
	.long	.LC3705
	.long	.LC3706
	.value	-28668
	.value	22136
	.long	.LC3714
	.long	.LC3711
	.value	-28668
	.value	22389
	.long	.LC3705
	.long	.LC3706
	.value	-28668
	.value	22392
	.long	.LC3709
	.long	.LC3711
	.value	-28668
	.value	22528
	.long	.LC3715
	.long	.LC3716
	.value	-28668
	.value	22784
	.long	.LC3717
	.long	.LC3718
	.value	-28668
	.value	22789
	.long	.LC3719
	.long	.LC3720
	.value	-28668
	.value	24632
	.long	.LC3721
	.long	.LC3722
	.value	-28668
	.value	24693
	.long	.LC3723
	.long	.LC3724
	.value	-28668
	.value	24696
	.long	.LC3725
	.long	.LC3726
	.value	-28668
	.value	24952
	.long	.LC3727
	.long	.LC3726
	.value	-28668
	.value	25208
	.long	.LC3725
	.long	.LC3706
	.value	-28668
	.value	25464
	.long	.LC3725
	.long	.LC3706
	.value	-28668
	.value	25720
	.long	.LC3728
	.long	.LC3706
	.value	-28668
	.value	25976
	.long	.LC3728
	.long	.LC3706
	.value	-28668
	.value	26232
	.long	.LC3728
	.long	.LC3706
	.value	-28668
	.value	26488
	.long	.LC3728
	.long	.LC3706
	.value	-28668
	.value	26901
	.long	.LC3729
	.long	.LC3730
	.value	-28668
	.value	28792
	.long	.LC3731
	.long	.LC3732
	.value	-28668
	.value	29048
	.long	.LC3733
	.long	.LC3734
	.value	-28668
	.value	29304
	.long	.LC3735
	.long	.LC3736
	.value	-28668
	.value	29560
	.long	.LC3737
	.long	.LC3738
	.value	-28668
	.value	29816
	.long	.LC3739
	.long	.LC3706
	.value	-28668
	.value	30072
	.long	.LC3740
	.long	.LC3741
	.value	-28668
	.value	30328
	.long	.LC3703
	.long	.LC3704
	.value	-28668
	.value	30584
	.long	.LC3742
	.long	.LC3706
	.value	-28668
	.value	30736
	.long	.LC3743
	.long	.LC3744
	.value	-28668
	.value	30741
	.long	.LC3745
	.long	.LC3746
	.value	-28668
	.value	30800
	.long	.LC3747
	.long	.LC3748
	.value	-28668
	.value	30805
	.long	.LC3749
	.long	.LC3750
	.value	-28668
	.value	30816
	.long	.LC3725
	.long	.LC3726
	.value	-28668
	.value	30832
	.long	.LC3731
	.long	.LC3748
	.value	-28668
	.value	30833
	.long	.LC3751
	.long	.LC3752
	.value	-28668
	.value	30834
	.long	.LC3753
	.long	.LC3754
	.value	-28668
	.value	30835
	.long	.LC3755
	.long	.LC3754
	.value	-28668
	.value	30836
	.long	.LC3756
	.long	.LC3757
	.value	-28668
	.value	30848
	.long	.LC3758
	.long	.LC3759
	.value	-28668
	.value	30864
	.long	.LC3760
	.long	.LC3761
	.value	-28668
	.value	30865
	.long	.LC3762
	.long	.LC3761
	.value	-28668
	.value	30866
	.long	.LC3762
	.long	.LC3761
	.value	-28668
	.value	30867
	.long	.LC3762
	.long	.LC3761
	.value	-28668
	.value	30868
	.long	.LC3762
	.long	.LC3761
	.value	-28668
	.value	30869
	.long	.LC3763
	.long	.LC3764
	.value	-28668
	.value	30870
	.long	.LC3762
	.long	.LC3761
	.value	-28668
	.value	30871
	.long	.LC3762
	.long	.LC3761
	.value	-28668
	.value	-32648
	.long	.LC3765
	.long	.LC3766
	.value	-28668
	.value	-32392
	.long	.LC3767
	.long	.LC3768
	.value	-28668
	.value	-32136
	.long	.LC3769
	.long	.LC3770
	.value	-28668
	.value	-31880
	.long	.LC3771
	.long	.LC2844
	.value	-28668
	.value	-31624
	.long	.LC3772
	.long	.LC3773
	.value	-28668
	.value	-31368
	.long	.LC3774
	.long	.LC3775
	.value	-28668
	.value	-31112
	.long	.LC3776
	.long	.LC3777
	.value	-28668
	.value	-30856
	.long	.LC3778
	.long	.LC3779
	.value	-28668
	.value	-30600
	.long	.LC3780
	.long	.LC3781
	.value	-28668
	.value	-29832
	.long	.LC3782
	.long	.LC3783
	.value	-28668
	.value	-5000
	.long	.LC3703
	.long	.LC3704
	.value	-11052
	.value	271
	.long	.LC3784
	.long	.LC3784
	.value	-11052
	.value	1537
	.long	.LC42
	.long	.LC3785
	.value	-8529
	.value	-28592
	.long	.LC42
	.long	.LC3786
	.value	-8529
	.value	-28591
	.long	.LC42
	.long	.LC3787
	.value	-8529
	.value	-28590
	.long	.LC42
	.long	.LC3788
	.value	-7847
	.value	1
	.long	.LC3789
	.long	.LC3790
	.value	-7847
	.value	2
	.long	.LC42
	.long	.LC3791
	.value	-7847
	.value	1536
	.long	.LC3792
	.long	.LC3793
	.value	-4648
	.value	-24431
	.long	.LC3794
	.long	.LC3795
	.value	-4648
	.value	-24423
	.long	.LC3796
	.long	.LC3795
	.value	-4648
	.value	-24415
	.long	.LC3797
	.long	.LC3798
	.value	-4648
	.value	-24407
	.long	.LC3799
	.long	.LC3800
	.value	-4648
	.value	-24399
	.long	.LC3801
	.long	.LC2878
	.value	5401
	.value	8196
	.long	.LC3802
	.long	.LC3803
	.value	5403
	.value	-28544
	.long	.LC3804
	.long	.LC3805
	.value	5407
	.value	1
	.long	.LC3806
	.long	.LC3806
	.value	5407
	.value	1384
	.long	.LC3807
	.long	.LC3808
	.value	5173
	.value	1329
	.long	.LC3809
	.long	.LC3809
	.value	5173
	.value	24608
	.long	.LC3810
	.long	.LC3811
	.value	5173
	.value	24624
	.long	.LC3812
	.long	.LC3813
	.value	5173
	.value	25632
	.long	.LC3814
	.long	.LC3813
	.value	5173
	.value	25648
	.long	.LC3815
	.long	.LC3813
	.value	5173
	.value	29984
	.long	.LC3816
	.long	.LC3817
	.value	5173
	.value	30016
	.long	.LC3818
	.long	.LC3819
	.value	5411
	.value	8
	.long	.LC3820
	.long	.LC3821
	.value	5412
	.value	1296
	.long	.LC3822
	.long	.LC3823
	.value	5412
	.value	1328
	.long	.LC3824
	.long	.LC3825
	.value	5412
	.value	1360
	.long	.LC3824
	.long	.LC3826
	.value	5412
	.value	1552
	.long	.LC2366
	.long	.LC3827
	.value	5412
	.value	4625
	.long	.LC3828
	.long	.LC2440
	.value	5412
	.value	4645
	.long	.LC3829
	.long	.LC2440
	.value	5412
	.value	5136
	.long	.LC3830
	.long	.LC2440
	.value	5412
	.value	5137
	.long	.LC3831
	.long	.LC3832
	.value	5412
	.value	5138
	.long	.LC3833
	.long	.LC3832
	.value	5412
	.value	5152
	.long	.LC3830
	.long	.LC2440
	.value	5412
	.value	5153
	.long	.LC3834
	.long	.LC2440
	.value	5412
	.value	5154
	.long	.LC3835
	.long	.LC2440
	.value	5412
	.value	1296
	.long	.LC3822
	.long	.LC3823
	.value	5432
	.value	769
	.long	.LC2432
	.long	.LC3836
	.value	5435
	.value	4373
	.long	.LC3837
	.long	.LC3838
	.value	5435
	.value	4419
	.long	.LC3839
	.long	.LC3840
	.value	5435
	.value	24579
	.long	.LC3841
	.long	.LC3842
	.value	5439
	.value	-8531
	.long	.LC3843
	.long	.LC3844
	.value	5440
	.value	-27356
	.long	.LC3845
	.long	.LC3846
	.value	5779
	.value	530
	.long	.LC3847
	.long	.LC3848
	.value	5779
	.value	531
	.long	.LC3849
	.long	.LC3850
	.value	5899
	.value	256
	.long	.LC3851
	.long	.LC3852
	.value	5955
	.value	-32455
	.long	.LC3853
	.long	.LC3854
	.value	5410
	.value	256
	.long	.LC3855
	.long	.LC3856
	.value	5443
	.value	12370
	.long	.LC3857
	.long	.LC3858
	.value	5443
	.value	12629
	.long	.LC2613
	.long	.LC3859
	.value	5461
	.value	2
	.long	.LC3860
	.long	.LC3861
	.value	5449
	.value	-32513
	.long	.LC3862
	.long	.LC3863
	.value	5464
	.value	5464
	.long	.LC42
	.long	.LC42
	.value	5470
	.value	32
	.long	.LC3864
	.long	.LC3865
	.value	5474
	.value	1
	.long	.LC3866
	.long	.LC3867
	.value	5474
	.value	2
	.long	.LC3868
	.long	.LC3869
	.value	5474
	.value	3
	.long	.LC3870
	.long	.LC3871
	.value	5482
	.value	20480
	.long	.LC3872
	.long	.LC3873
	.value	5482
	.value	20736
	.long	.LC3872
	.long	.LC3874
	.value	5834
	.value	1
	.long	.LC3875
	.long	.LC3876
	.value	5489
	.value	-24575
	.long	.LC3877
	.long	.LC3878
	.value	5489
	.value	-24574
	.long	.LC3879
	.long	.LC3880
	.value	5489
	.value	-24573
	.long	.LC3881
	.long	.LC3880
	.value	5489
	.value	-24572
	.long	.LC3882
	.long	.LC3880
	.value	5489
	.value	-24571
	.long	.LC3883
	.long	.LC3880
	.value	5489
	.value	-24570
	.long	.LC3884
	.long	.LC3880
	.value	5489
	.value	-24569
	.long	.LC3885
	.long	.LC3880
	.value	5489
	.value	-24568
	.long	.LC3886
	.long	.LC3880
	.value	5489
	.value	-24567
	.long	.LC3887
	.long	.LC3888
	.value	5489
	.value	-24566
	.long	.LC3889
	.long	.LC3888
	.value	5489
	.value	-24565
	.long	.LC3890
	.long	.LC3888
	.value	5489
	.value	-24564
	.long	.LC3891
	.long	.LC3888
	.value	5489
	.value	-24563
	.long	.LC3892
	.long	.LC3888
	.value	5489
	.value	-24562
	.long	.LC3893
	.long	.LC3894
	.value	5489
	.value	-24063
	.long	.LC3895
	.long	.LC3896
	.value	5489
	.value	-24062
	.long	.LC3897
	.long	.LC3896
	.value	5489
	.value	-24061
	.long	.LC3898
	.long	.LC3896
	.value	5489
	.value	-24060
	.long	.LC3899
	.long	.LC3896
	.value	5489
	.value	-24059
	.long	.LC3900
	.long	.LC3896
	.value	5489
	.value	-24058
	.long	.LC3901
	.long	.LC3896
	.value	5947
	.value	1000
	.long	.LC3902
	.long	.LC2382
	.value	5947
	.value	1002
	.long	.LC3903
	.long	.LC2382
	.value	5508
	.value	4003
	.long	.LC42
	.long	.LC42
	.value	5510
	.value	2051
	.long	.LC42
	.long	.LC42
	.value	5512
	.value	4352
	.long	.LC3904
	.long	.LC3905
	.value	5512
	.value	8192
	.long	.LC3906
	.long	.LC3907
	.value	5512
	.value	-32733
	.long	.LC3908
	.long	.LC3909
	.value	5515
	.value	21
	.long	.LC3910
	.long	.LC3911
	.value	5538
	.value	1
	.long	.LC3912
	.long	.LC3913
	.value	6063
	.value	16720
	.long	.LC3914
	.long	.LC3915
	.value	5552
	.value	1
	.long	.LC3916
	.long	.LC3917
	.value	5552
	.value	11216
	.long	.LC3918
	.long	.LC3919
	.value	5555
	.value	21108
	.long	.LC3920
	.long	.LC3921
	.value	5555
	.value	25208
	.long	.LC3922
	.long	.LC3923
	.value	5560
	.value	12297
	.long	.LC3924
	.long	.LC3925
	.value	5564
	.value	257
	.long	.LC3926
	.long	.LC3927
	.value	5564
	.value	259
	.long	.LC3928
	.long	.LC3929
	.value	5564
	.value	9520
	.long	.LC2366
	.long	.LC3930
	.value	5564
	.value	9521
	.long	.LC2366
	.long	.LC3931
	.value	5564
	.value	9522
	.long	.LC2366
	.long	.LC3931
	.value	5564
	.value	10537
	.long	.LC3932
	.long	.LC3933
	.value	5012
	.value	1
	.long	.LC3934
	.long	.LC2382
	.value	5585
	.value	1
	.long	.LC3935
	.long	.LC3936
	.value	5585
	.value	3
	.long	.LC3937
	.long	.LC3938
	.value	5585
	.value	4
	.long	.LC3939
	.long	.LC3940
	.value	5591
	.value	86
	.long	.LC3941
	.long	.LC3942
	.value	5592
	.value	-28671
	.long	.LC42
	.long	.LC42
	.value	5597
	.value	30308
	.long	.LC3943
	.long	.LC3944
	.value	5597
	.value	30336
	.long	.LC3945
	.long	.LC3237
	.value	5602
	.value	1280
	.long	.LC42
	.long	.LC3946
	.value	-5426
	.value	12544
	.long	.LC3947
	.long	.LC3948
	.value	-5426
	.value	12800
	.long	.LC3949
	.long	.LC3948
	.value	-5426
	.value	12814
	.long	.LC3950
	.long	.LC3730
	.value	-5426
	.value	13326
	.long	.LC3951
	.long	.LC3730
	.value	-5426
	.value	13342
	.long	.LC3952
	.long	.LC3730
	.value	-5426
	.value	13568
	.long	.LC3953
	.long	.LC3948
	.value	-5426
	.value	13596
	.long	.LC3954
	.long	.LC3730
	.value	-5426
	.value	16640
	.long	.LC3955
	.long	.LC3956
	.value	-5426
	.value	16656
	.long	.LC3957
	.long	.LC3956
	.value	-5426
	.value	16896
	.long	.LC3958
	.long	.LC3956
	.value	-5426
	.value	16910
	.long	.LC3959
	.long	.LC3960
	.value	-5426
	.value	17166
	.long	.LC3961
	.long	.LC3960
	.value	5606
	.value	2
	.long	.LC3962
	.long	.LC3963
	.value	5608
	.value	304
	.long	.LC3964
	.long	.LC3965
	.value	5608
	.value	305
	.long	.LC3966
	.long	.LC3967
	.value	5609
	.value	6209
	.long	.LC3968
	.long	.LC3969
	.value	5617
	.value	12080
	.long	.LC3970
	.long	.LC3971
	.value	5618
	.value	1
	.long	.LC3972
	.long	.LC3973
	.value	5618
	.value	2
	.long	.LC3974
	.long	.LC3973
	.value	5618
	.value	3
	.long	.LC3975
	.long	.LC3976
	.value	5657
	.value	1024
	.long	.LC3977
	.long	.LC3978
	.value	5657
	.value	1088
	.long	.LC3979
	.long	.LC3980
	.value	5657
	.value	1552
	.long	.LC3981
	.long	.LC3982
	.value	5657
	.value	1568
	.long	.LC3983
	.long	.LC3978
	.value	5657
	.value	1600
	.long	.LC3984
	.long	.LC3980
	.value	5657
	.value	5648
	.long	.LC3985
	.long	.LC3982
	.value	5657
	.value	5650
	.long	.LC3986
	.long	.LC3987
	.value	5657
	.value	9744
	.long	.LC3988
	.long	.LC3989
	.value	5657
	.value	13888
	.long	.LC3990
	.long	.LC3980
	.value	5657
	.value	17952
	.long	.LC3991
	.long	.LC3978
	.value	5657
	.value	17984
	.long	.LC3992
	.long	.LC3980
	.value	5665
	.value	32
	.long	.LC3993
	.long	.LC3994
	.value	5665
	.value	33
	.long	.LC3995
	.long	.LC3996
	.value	5665
	.value	34
	.long	.LC3997
	.long	.LC3998
	.value	5665
	.value	35
	.long	.LC3999
	.long	.LC4000
	.value	5665
	.value	36
	.long	.LC4001
	.long	.LC4002
	.value	5665
	.value	37
	.long	.LC4003
	.long	.LC4004
	.value	5673
	.value	4099
	.long	.LC42
	.long	.LC4005
	.value	5673
	.value	8194
	.long	.LC42
	.long	.LC4006
	.value	5677
	.value	256
	.long	.LC42
	.long	.LC4007
	.value	5677
	.value	257
	.long	.LC42
	.long	.LC4008
	.value	5677
	.value	258
	.long	.LC42
	.long	.LC4008
	.value	5677
	.value	259
	.long	.LC42
	.long	.LC4008
	.value	5679
	.value	4369
	.long	.LC4009
	.long	.LC4010
	.value	5679
	.value	4370
	.long	.LC4011
	.long	.LC4012
	.value	5688
	.value	4352
	.long	.LC4013
	.long	.LC4014
	.value	5692
	.value	12370
	.long	.LC4015
	.long	.LC4016
	.value	5692
	.value	-254
	.long	.LC4017
	.long	.LC4018
	.value	5940
	.value	122
	.long	.LC4019
	.long	.LC4020
	.value	5940
	.value	4113
	.long	.LC4021
	.long	.LC4022
	.value	5940
	.value	4114
	.long	.LC4023
	.long	.LC4024
	.value	5940
	.value	4115
	.long	.LC4025
	.long	.LC4026
	.value	5940
	.value	4281
	.long	.LC4027
	.long	.LC4028
	.value	5711
	.value	1
	.long	.LC4029
	.long	.LC4030
	.value	5711
	.value	2
	.long	.LC4029
	.long	.LC4031
	.value	6163
	.value	12377
	.long	.LC2837
	.long	.LC2838
	.value	6163
	.value	16384
	.long	.LC4032
	.long	.LC4033
	.value	6163
	.value	16640
	.long	.LC4034
	.long	.LC4035
	.value	6101
	.value	22577
	.long	.LC4036
	.long	.LC4037
	.value	6101
	.value	22578
	.long	.LC4038
	.long	.LC4039
	.value	6101
	.value	22579
	.long	.LC4040
	.long	.LC4041
	.value	-1449
	.value	1
	.long	.LC1777
	.long	.LC4042
	.value	6346
	.value	64
	.long	.LC4043
	.long	.LC4044
	.value	6345
	.value	4113
	.long	.LC4045
	.long	.LC4046
	.value	6345
	.value	4114
	.long	.LC4047
	.long	.LC4046
	.value	6345
	.value	4115
	.long	.LC4048
	.long	.LC4046
	.value	6345
	.value	4116
	.long	.LC4049
	.long	.LC4046
	.value	6345
	.value	4117
	.long	.LC4050
	.long	.LC4046
	.value	6345
	.value	4118
	.long	.LC4051
	.long	.LC4046
	.value	6345
	.value	8209
	.long	.LC4052
	.long	.LC4053
	.value	6345
	.value	8210
	.long	.LC4054
	.long	.LC4053
	.value	6345
	.value	8211
	.long	.LC4055
	.long	.LC4053
	.value	6345
	.value	8212
	.long	.LC4056
	.long	.LC4053
	.value	6345
	.value	8213
	.long	.LC4057
	.long	.LC4053
	.value	6345
	.value	8214
	.long	.LC4058
	.long	.LC4053
	.value	6345
	.value	8215
	.long	.LC4059
	.long	.LC4053
	.value	6345
	.value	8225
	.long	.LC4060
	.long	.LC4053
	.value	6345
	.value	12305
	.long	.LC4061
	.long	.LC4062
	.value	6416
	.value	1
	.long	.LC4063
	.long	.LC4064
	.value	4960
	.value	257
	.long	.LC4065
	.long	.LC4066
	.value	4960
	.value	258
	.long	.LC4067
	.long	.LC4066
	.value	4960
	.value	259
	.long	.LC4068
	.long	.LC4066
	.value	4960
	.value	260
	.long	.LC4069
	.long	.LC4066
	.value	4960
	.value	261
	.long	.LC4070
	.long	.LC4071
	.value	4960
	.value	513
	.long	.LC4072
	.long	.LC4073
	.value	4960
	.value	514
	.long	.LC4074
	.long	.LC4073
	.value	4960
	.value	515
	.long	.LC4075
	.long	.LC4073
	.value	4960
	.value	516
	.long	.LC4076
	.long	.LC4073
	.value	4960
	.value	517
	.long	.LC4077
	.long	.LC4073
	.value	4960
	.value	769
	.long	.LC4078
	.long	.LC4079
	.value	4960
	.value	770
	.long	.LC4080
	.long	.LC4079
	.value	4960
	.value	771
	.long	.LC4081
	.long	.LC4079
	.value	4960
	.value	772
	.long	.LC4082
	.long	.LC4083
	.value	5925
	.value	29044
	.long	.LC4084
	.long	.LC4085
	.value	5971
	.value	4097
	.long	.LC4086
	.long	.LC4087
	.value	5971
	.value	4100
	.long	.LC4088
	.long	.LC4089
	.value	6092
	.value	8832
	.long	.LC4090
	.long	.LC4091
	.value	5354
	.value	-21754
	.long	.LC4092
	.long	.LC4093
	.value	4793
	.value	4102
	.long	.LC4094
	.long	.LC4095
	.value	4793
	.value	4103
	.long	.LC4096
	.long	.LC4097
	.value	4793
	.value	4104
	.long	.LC4098
	.long	.LC4099
	.value	4793
	.value	1008
	.long	.LC4100
	.long	.LC4101
	.value	6164
	.value	257
	.long	.LC4102
	.long	.LC4103
	.value	6164
	.value	513
	.long	.LC4104
	.long	.LC4105
	.value	6164
	.value	513
	.long	.LC4106
	.long	.LC4107
	.value	6164
	.value	513
	.long	.LC4108
	.long	.LC4109
	.value	6164
	.value	769
	.long	.LC4110
	.long	.LC4111
	.value	6164
	.value	770
	.long	.LC4112
	.long	.LC4113
	.value	6164
	.value	1921
	.long	.LC4114
	.long	.LC4115
	.value	4355
	.value	3
	.long	.LC4116
	.long	.LC3314
	.value	4355
	.value	4
	.long	.LC4117
	.long	.LC4118
	.value	4355
	.value	5
	.long	.LC4119
	.long	.LC4120
	.value	4355
	.value	6
	.long	.LC4121
	.long	.LC4118
	.value	4355
	.value	7
	.long	.LC4122
	.long	.LC4123
	.value	4355
	.value	8
	.long	.LC4124
	.long	.LC4118
	.value	4355
	.value	5920
	.long	.LC4125
	.long	.LC4126
	.value	4355
	.value	5952
	.long	.LC4127
	.long	.LC4128
	.value	4355
	.value	5954
	.long	.LC4127
	.long	.LC4128
	.value	4355
	.value	8720
	.long	.LC4129
	.long	.LC4130
	.value	4355
	.value	8960
	.long	.LC4131
	.long	.LC4132
	.value	4355
	.value	8976
	.long	.LC4133
	.long	.LC4134
	.value	4355
	.value	9024
	.long	.LC4135
	.long	.LC4136
	.value	4355
	.value	9506
	.long	.LC4137
	.long	.LC4138
	.value	4355
	.value	12576
	.long	.LC4139
	.long	.LC4140
	.value	4355
	.value	12832
	.long	.LC4141
	.long	.LC4142
	.value	4355
	.value	13088
	.long	.LC4143
	.long	.LC4144
	.value	4355
	.value	13328
	.long	.LC4145
	.long	.LC4146
	.value	4355
	.value	13584
	.long	.LC4147
	.long	.LC4148
	.value	4355
	.value	13585
	.long	.LC4147
	.long	.LC4148
	.value	4355
	.value	13600
	.long	.LC4147
	.long	.LC4148
	.value	4355
	.value	13601
	.long	.LC4147
	.long	.LC4148
	.value	4355
	.value	13602
	.long	.LC4147
	.long	.LC4148
	.value	4355
	.value	13632
	.long	.LC4147
	.long	.LC4148
	.value	4355
	.value	17184
	.long	.LC4149
	.long	.LC4150
	.value	4355
	.value	20609
	.long	.LC4151
	.long	.LC4152
	.value	4355
	.value	24705
	.long	.LC4153
	.long	.LC4154
	.value	4355
	.value	28738
	.long	.LC4133
	.long	.LC4134
	.value	5761
	.value	80
	.long	.LC4155
	.long	.LC4156
	.value	6391
	.value	1
	.long	.LC4157
	.long	.LC4158
	.value	6391
	.value	2
	.long	.LC4159
	.long	.LC4160
	.value	6391
	.value	4
	.long	.LC4161
	.long	.LC4162
	.value	6391
	.value	10
	.long	.LC4163
	.long	.LC4164
	.value	5943
	.value	4146
	.long	.LC4165
	.long	.LC4166
	.value	6572
	.value	1
	.long	.LC4167
	.long	.LC4168
	.value	4362
	.value	8449
	.long	.LC4169
	.long	.LC4170
	.value	4362
	.value	8450
	.long	.LC4171
	.long	.LC4172
	.value	4362
	.value	12609
	.long	.LC4173
	.long	.LC4174
	.value	4362
	.value	16435
	.long	.LC4175
	.long	.LC4176
	.value	4171
	.value	4160
	.long	.LC42
	.long	.LC4177
	.value	4171
	.value	-32464
	.long	.LC3453
	.long	.LC4178
	.value	4480
	.value	1141
	.long	.LC4179
	.long	.LC3832
	.value	4480
	.value	1142
	.long	.LC2626
	.long	.LC4180
	.value	4480
	.value	1144
	.long	.LC4181
	.long	.LC3832
	.value	4480
	.value	1362
	.long	.LC4182
	.long	.LC4183
	.value	4480
	.value	1426
	.long	.LC4184
	.long	.LC4185
	.value	4480
	.value	2082
	.long	.LC4186
	.long	.LC4187
	.value	4480
	.value	2098
	.long	.LC2626
	.long	.LC4188
	.value	4480
	.value	2115
	.long	.LC4189
	.long	.LC4190
	.value	4480
	.value	2130
	.long	.LC4191
	.long	.LC4192
	.value	4480
	.value	21841
	.long	.LC2613
	.long	.LC4193
	.value	5361
	.value	4149
	.long	.LC2626
	.long	.LC2626
	.value	5361
	.value	4185
	.long	.LC4194
	.long	.LC4195
	.value	5361
	.value	5206
	.long	.LC4196
	.long	.LC4197
	.value	5361
	.value	5649
	.long	.LC2432
	.long	.LC4198
	.value	5361
	.value	9216
	.long	.LC2626
	.long	.LC2626
	.value	5361
	.value	9986
	.long	.LC4199
	.long	.LC4200
	.value	5361
	.value	11258
	.long	.LC2613
	.long	.LC4201
	.value	5361
	.value	11270
	.long	.LC4202
	.long	.LC4203
	.value	5361
	.value	12032
	.long	.LC4204
	.long	.LC4205
	.value	5361
	.value	12064
	.long	.LC4206
	.long	.LC4207
	.value	5361
	.value	12080
	.long	.LC4173
	.long	.LC4208
	.value	5361
	.value	12080
	.long	.LC4173
	.long	.LC4209
	.value	5361
	.value	12096
	.long	.LC4210
	.long	.LC4211
	.value	5361
	.value	12162
	.long	.LC4212
	.long	.LC4213
	.value	5361
	.value	20549
	.long	.LC4214
	.long	.LC4215
	.value	5361
	.value	20561
	.long	.LC4216
	.long	.LC2514
	.value	5361
	.value	20561
	.long	.LC2457
	.long	.LC4217
	.value	5361
	.value	20561
	.long	.LC4218
	.long	.LC4219
	.value	5361
	.value	23418
	.long	.LC4220
	.long	.LC4221
	.value	5361
	.value	-30720
	.long	.LC4222
	.long	.LC4223
	.value	5361
	.value	-30638
	.long	.LC4224
	.long	.LC4225
	.value	6513
	.value	1
	.long	.LC42
	.long	.LC4226
	.value	6513
	.value	4113
	.long	.LC4227
	.long	.LC4228
	.value	6513
	.value	4129
	.long	.LC42
	.long	.LC4229
	.value	6080
	.value	4779
	.long	.LC42
	.long	.LC42
	.value	5762
	.value	-26507
	.long	.LC42
	.long	.LC42
	.value	5772
	.value	7
	.long	.LC4230
	.long	.LC4231
	.value	5772
	.value	17
	.long	.LC4232
	.long	.LC4231
	.value	5772
	.value	18
	.long	.LC4233
	.long	.LC4234
	.value	5772
	.value	19
	.long	.LC4235
	.long	.LC4236
	.value	5772
	.value	26
	.long	.LC4237
	.long	.LC4238
	.value	5772
	.value	27
	.long	.LC4239
	.long	.LC4240
	.value	5772
	.value	28
	.long	.LC4241
	.long	.LC4242
	.value	5772
	.value	35
	.long	.LC4243
	.long	.LC4244
	.value	5772
	.value	36
	.long	.LC4245
	.long	.LC4246
	.value	5772
	.value	42
	.long	.LC4247
	.long	.LC4248
	.value	5772
	.value	4116
	.long	.LC4235
	.long	.LC4249
	.value	5772
	.value	-106
	.long	.LC4235
	.long	.LC4250
	.value	4867
	.value	1
	.long	.LC4251
	.long	.LC4252
	.value	4867
	.value	2
	.long	.LC2538
	.long	.LC4253
	.value	4867
	.value	3
	.long	.LC2538
	.long	.LC4254
	.value	4867
	.value	4
	.long	.LC2538
	.long	.LC4255
	.value	4867
	.value	5
	.long	.LC2538
	.long	.LC4256
	.value	4867
	.value	6
	.long	.LC2538
	.long	.LC4257
	.value	4867
	.value	7
	.long	.LC2538
	.long	.LC4258
	.value	4867
	.value	8
	.long	.LC2538
	.long	.LC4259
	.value	4867
	.value	9
	.long	.LC2538
	.long	.LC4260
	.value	16708
	.value	64
	.long	.LC4261
	.long	.LC4262
	.value	16708
	.value	65
	.long	.LC4263
	.long	.LC4264
	.value	16708
	.value	66
	.long	.LC4265
	.long	.LC4264
	.value	16708
	.value	67
	.long	.LC4266
	.long	.LC4267
	.value	16708
	.value	68
	.long	.LC4268
	.long	.LC4269
	.value	16708
	.value	69
	.long	.LC4270
	.long	.LC4264
	.value	16708
	.value	70
	.long	.LC4271
	.long	.LC4264
	.value	16708
	.value	73
	.long	.LC4272
	.long	.LC4273
	.value	16708
	.value	74
	.long	.LC4274
	.long	.LC4275
	.value	16708
	.value	79
	.long	.LC4276
	.long	.LC4275
	.value	16708
	.value	80
	.long	.LC4277
	.long	.LC4278
	.value	16708
	.value	81
	.long	.LC4279
	.long	.LC4279
	.value	4914
	.value	21520
	.long	.LC4280
	.long	.LC4281
	.value	4914
	.value	21525
	.long	.LC4282
	.long	.LC4283
	.value	4914
	.value	21541
	.long	.LC4284
	.long	.LC4285
	.value	4914
	.value	24896
	.long	.LC4286
	.long	.LC4287
	.value	6280
	.value	769
	.long	.LC42
	.long	.LC42
	.value	6280
	.value	1537
	.long	.LC42
	.long	.LC42
	.value	6280
	.value	1808
	.long	.LC42
	.long	.LC42
	.value	6280
	.value	1824
	.long	.LC42
	.long	.LC42
	.value	6280
	.value	9475
	.long	.LC4288
	.long	.LC4289
	.value	6280
	.value	9476
	.long	.LC4290
	.long	.LC4291
	.value	6280
	.value	13571
	.long	.LC4292
	.long	.LC4293
	.value	6280
	.value	13573
	.long	.LC4292
	.long	.LC4294
	.value	5759
	.value	17972
	.long	.LC42
	.long	.LC4295
	.value	5759
	.value	19506
	.long	.LC42
	.long	.LC4296
	.value	5759
	.value	21316
	.long	.LC42
	.long	.LC4297
	.value	5759
	.value	21571
	.long	.LC42
	.long	.LC4298
	.value	5301
	.value	512
	.long	.LC4299
	.long	.LC42
	.value	5301
	.value	768
	.long	.LC4300
	.long	.LC42
	.value	5301
	.value	1024
	.long	.LC4301
	.long	.LC42
	.value	5301
	.value	1536
	.long	.LC4302
	.long	.LC42
	.value	5301
	.value	2048
	.long	.LC42
	.long	.LC4303
	.value	5301
	.value	2304
	.long	.LC42
	.long	.LC4303
	.value	5301
	.value	2560
	.long	.LC42
	.long	.LC4303
	.value	5301
	.value	2816
	.long	.LC42
	.long	.LC4303
	.value	5260
	.value	16401
	.long	.LC4304
	.long	.LC4305
	.value	5260
	.value	16722
	.long	.LC4306
	.long	.LC4307
	.value	5963
	.value	608
	.long	.LC4308
	.long	.LC4309
	.value	5963
	.value	609
	.long	.LC4308
	.long	.LC4310
	.value	5963
	.value	29046
	.long	.LC4304
	.long	.LC4311
	.value	5963
	.value	29047
	.long	.LC4308
	.long	.LC4312
	.value	5963
	.value	31762
	.long	.LC4308
	.long	.LC4313
	.value	5963
	.value	31763
	.long	.LC4308
	.long	.LC4314
	.value	5963
	.value	-27391
	.long	.LC4315
	.long	.LC4316
	.value	6126
	.value	16723
	.long	.LC4317
	.long	.LC4318
	.value	4904
	.value	8264
	.long	.LC42
	.long	.LC42
	.value	4904
	.value	-30584
	.long	.LC4319
	.long	.LC4320
	.value	5868
	.value	278
	.long	.LC4321
	.long	.LC4322
	.value	5868
	.value	4103
	.long	.LC4323
	.long	.LC4324
	.value	5868
	.value	8211
	.long	.LC4325
	.long	.LC4326
	.value	5868
	.value	12032
	.long	.LC4327
	.long	.LC4328
	.value	5868
	.value	12050
	.long	.LC4329
	.long	.LC4330
	.value	5868
	.value	13957
	.long	.LC2366
	.long	.LC4331
	.value	5868
	.value	22149
	.long	.LC4329
	.long	.LC4332
	.value	61
	.value	209
	.long	.LC4333
	.long	.LC4334
	.value	3601
	.value	1
	.long	.LC42
	.long	.LC4335
	.value	3601
	.value	2
	.long	.LC4336
	.long	.LC4337
	.value	3601
	.value	15
	.long	.LC4338
	.long	.LC4339
	.value	3601
	.value	18
	.long	.LC4340
	.long	.LC4340
	.value	3601
	.value	73
	.long	.LC4341
	.long	.LC4342
	.value	3601
	.value	74
	.long	.LC4343
	.long	.LC4344
	.value	3601
	.value	192
	.long	.LC4345
	.long	.LC4346
	.value	3601
	.value	1288
	.long	.LC4347
	.long	.LC4348
	.value	3601
	.value	4096
	.long	.LC4349
	.long	.LC4350
	.value	3601
	.value	8192
	.long	.LC4351
	.long	.LC4350
	.value	3601
	.value	12338
	.long	.LC4352
	.long	.LC2878
	.value	3601
	.value	12339
	.long	.LC4353
	.long	.LC2878
	.value	3601
	.value	12340
	.long	.LC4354
	.long	.LC2878
	.value	3601
	.value	16384
	.long	.LC4355
	.long	.LC4350
	.value	3601
	.value	24592
	.long	.LC4356
	.long	.LC4357
	.value	3601
	.value	28704
	.long	.LC42
	.long	.LC3260
	.value	3601
	.value	-24340
	.long	.LC42
	.long	.LC4358
	.value	3601
	.value	-24336
	.long	.LC42
	.long	.LC4359
	.value	3601
	.value	-24333
	.long	.LC42
	.long	.LC4360
	.value	3601
	.value	-24329
	.long	.LC42
	.long	.LC4361
	.value	3601
	.value	-24328
	.long	.LC4362
	.long	.LC4363
	.value	3601
	.value	-24324
	.long	.LC4364
	.long	.LC4365
	.value	3601
	.value	-20976
	.long	.LC42
	.long	.LC4366
	.value	3601
	.value	-20951
	.long	.LC4367
	.long	.LC2692
	.value	3601
	.value	-20950
	.long	.LC4368
	.long	.LC4369
	.value	3601
	.value	-20949
	.long	.LC4370
	.long	.LC4371
	.value	3601
	.value	-20943
	.long	.LC42
	.long	.LC4372
	.value	3601
	.value	-20942
	.long	.LC42
	.long	.LC4373
	.value	3601
	.value	-20941
	.long	.LC4374
	.long	.LC4375
	.value	3601
	.value	-20940
	.long	.LC42
	.long	.LC4376
	.value	3601
	.value	-20939
	.long	.LC42
	.long	.LC4377
	.value	3601
	.value	-20928
	.long	.LC42
	.long	.LC4378
	.value	3601
	.value	-20925
	.long	.LC42
	.long	.LC4379
	.value	3601
	.value	-20887
	.long	.LC4380
	.long	.LC2692
	.value	3601
	.value	-20884
	.long	.LC4381
	.long	.LC3333
	.value	3601
	.value	-20883
	.long	.LC4382
	.long	.LC4369
	.value	3601
	.value	-20463
	.long	.LC42
	.long	.LC4383
	.value	3601
	.value	-20462
	.long	.LC4384
	.long	.LC4385
	.value	3601
	.value	-20450
	.long	.LC4386
	.long	.LC4387
	.value	3601
	.value	-20449
	.long	.LC4388
	.long	.LC4387
	.value	3601
	.value	-20433
	.long	.LC4389
	.long	.LC4390
	.value	3601
	.value	-20432
	.long	.LC4391
	.long	.LC4392
	.value	3601
	.value	-20406
	.long	.LC4393
	.long	.LC4394
	.value	3601
	.value	-20384
	.long	.LC4395
	.long	.LC4396
	.value	3601
	.value	-20282
	.long	.LC4397
	.long	.LC4398
	.value	3601
	.value	-20281
	.long	.LC4399
	.long	.LC4387
	.value	3601
	.value	-20265
	.long	.LC4400
	.long	.LC4387
	.value	3601
	.value	-20259
	.long	.LC4401
	.long	.LC4387
	.value	3601
	.value	-20258
	.long	.LC4402
	.long	.LC4387
	.value	3601
	.value	-20257
	.long	.LC4403
	.long	.LC4404
	.value	3601
	.value	-20256
	.long	.LC4405
	.long	.LC4404
	.value	3601
	.value	-20255
	.long	.LC4406
	.long	.LC4407
	.value	3601
	.value	-20189
	.long	.LC4408
	.long	.LC4409
	.value	3601
	.value	-20172
	.long	.LC4410
	.long	.LC4387
	.value	3601
	.value	-20164
	.long	.LC4411
	.long	.LC4387
	.value	3601
	.value	-20156
	.long	.LC4412
	.long	.LC4387
	.value	3601
	.value	-20125
	.long	.LC4413
	.long	.LC4387
	.value	3601
	.value	-20124
	.long	.LC4414
	.long	.LC4415
	.value	3601
	.value	-20104
	.long	.LC4416
	.long	.LC4396
	.value	3601
	.value	-20074
	.long	.LC4417
	.long	.LC4418
	.value	3601
	.value	-20060
	.long	.LC4419
	.long	.LC4344
	.value	3601
	.value	-19965
	.long	.LC4420
	.long	.LC4421
	.value	3601
	.value	-19964
	.long	.LC4420
	.long	.LC4421
	.value	3601
	.value	-3947
	.long	.LC4422
	.long	.LC4423
	.value	3601
	.value	-3792
	.long	.LC42
	.long	.LC4424
	.value	3601
	.value	-3760
	.long	.LC42
	.long	.LC4425
	.value	3601
	.value	-2304
	.long	.LC42
	.long	.LC4426
	.value	3601
	.value	-2048
	.long	.LC42
	.long	.LC4427
	.value	4096
	.value	1
	.long	.LC4428
	.long	.LC4429
	.value	4096
	.value	2
	.long	.LC4430
	.long	.LC4431
	.value	4096
	.value	3
	.long	.LC4432
	.long	.LC4433
	.value	4096
	.value	4
	.long	.LC4434
	.long	.LC4435
	.value	4096
	.value	5
	.long	.LC4436
	.long	.LC4437
	.value	4096
	.value	6
	.long	.LC4438
	.long	.LC4439
	.value	4096
	.value	10
	.long	.LC4440
	.long	.LC4441
	.value	4096
	.value	11
	.long	.LC4442
	.long	.LC4441
	.value	4096
	.value	12
	.long	.LC4443
	.long	.LC4444
	.value	4096
	.value	13
	.long	.LC4445
	.long	.LC4446
	.value	4096
	.value	15
	.long	.LC4447
	.long	.LC4439
	.value	4096
	.value	16
	.long	.LC4440
	.long	.LC4448
	.value	4096
	.value	18
	.long	.LC4449
	.long	.LC4450
	.value	4096
	.value	19
	.long	.LC4451
	.long	.LC4452
	.value	4096
	.value	32
	.long	.LC4432
	.long	.LC4453
	.value	4096
	.value	33
	.long	.LC4454
	.long	.LC4455
	.value	4096
	.value	48
	.long	.LC4456
	.long	.LC4457
	.value	4096
	.value	49
	.long	.LC4458
	.long	.LC4459
	.value	4096
	.value	50
	.long	.LC4460
	.long	.LC4457
	.value	4096
	.value	53
	.long	.LC4460
	.long	.LC4459
	.value	4096
	.value	64
	.long	.LC4460
	.long	.LC4457
	.value	4096
	.value	80
	.long	.LC4461
	.long	.LC4462
	.value	4096
	.value	84
	.long	.LC4463
	.long	.LC4462
	.value	4096
	.value	86
	.long	.LC4464
	.long	.LC4465
	.value	4096
	.value	88
	.long	.LC4466
	.long	.LC4465
	.value	4096
	.value	94
	.long	.LC4467
	.long	.LC4462
	.value	4096
	.value	96
	.long	.LC4468
	.long	.LC4469
	.value	4096
	.value	98
	.long	.LC4470
	.long	.LC4465
	.value	4096
	.value	143
	.long	.LC4471
	.long	.LC4472
	.value	4096
	.value	1569
	.long	.LC4473
	.long	.LC4474
	.value	4096
	.value	1570
	.long	.LC4475
	.long	.LC4476
	.value	4096
	.value	1571
	.long	.LC4475
	.long	.LC4477
	.value	4096
	.value	1572
	.long	.LC4478
	.long	.LC4474
	.value	4096
	.value	1573
	.long	.LC4478
	.long	.LC4474
	.value	4096
	.value	1574
	.long	.LC4479
	.long	.LC3700
	.value	4096
	.value	1576
	.long	.LC4480
	.long	.LC3700
	.value	4096
	.value	1584
	.long	.LC4481
	.long	.LC4474
	.value	4096
	.value	1600
	.long	.LC4482
	.long	.LC3700
	.value	4096
	.value	1602
	.long	.LC4483
	.long	.LC3700
	.value	4096
	.value	1606
	.long	.LC4484
	.long	.LC3700
	.value	4096
	.value	1793
	.long	.LC4445
	.long	.LC4485
	.value	4096
	.value	1794
	.long	.LC4486
	.long	.LC3085
	.value	4096
	.value	2305
	.long	.LC4487
	.long	.LC3260
	.value	4096
	.value	4096
	.long	.LC4488
	.long	.LC4489
	.value	4096
	.value	4097
	.long	.LC4490
	.long	.LC4491
	.value	4096
	.value	4112
	.long	.LC4492
	.long	.LC4493
	.value	4098
	.value	2834
	.long	.LC4494
	.long	.LC4494
	.value	4098
	.value	12624
	.long	.LC4495
	.long	.LC4496
	.value	4098
	.value	12628
	.long	.LC4497
	.long	.LC4498
	.value	4098
	.value	15952
	.long	.LC4499
	.long	.LC4500
	.value	4098
	.value	15956
	.long	.LC4499
	.long	.LC4501
	.value	4098
	.value	16694
	.long	.LC4502
	.long	.LC4503
	.value	4098
	.value	16695
	.long	.LC4504
	.long	.LC4505
	.value	4098
	.value	16708
	.long	.LC4506
	.long	.LC4507
	.value	4098
	.value	16709
	.long	.LC4506
	.long	.LC4508
	.value	4098
	.value	16710
	.long	.LC4506
	.long	.LC4509
	.value	4098
	.value	16711
	.long	.LC42
	.long	.LC4510
	.value	4098
	.value	16712
	.long	.LC4511
	.long	.LC4512
	.value	4098
	.value	16720
	.long	.LC4513
	.long	.LC4514
	.value	4098
	.value	16721
	.long	.LC4317
	.long	.LC4515
	.value	4098
	.value	16722
	.long	.LC4516
	.long	.LC4517
	.value	4098
	.value	16723
	.long	.LC4317
	.long	.LC4318
	.value	4098
	.value	16728
	.long	.LC4518
	.long	.LC4519
	.value	4098
	.value	16740
	.long	.LC4520
	.long	.LC4521
	.value	4098
	.value	16743
	.long	.LC42
	.long	.LC4522
	.value	4098
	.value	16744
	.long	.LC4511
	.long	.LC4523
	.value	4098
	.value	16752
	.long	.LC4317
	.long	.LC4524
	.value	4098
	.value	16753
	.long	.LC4317
	.long	.LC4525
	.value	4098
	.value	16754
	.long	.LC4516
	.long	.LC4526
	.value	4098
	.value	16755
	.long	.LC4317
	.long	.LC4527
	.value	4098
	.value	16962
	.long	.LC4528
	.long	.LC4529
	.value	4098
	.value	16963
	.long	.LC42
	.long	.LC4530
	.value	4098
	.value	17206
	.long	.LC4531
	.long	.LC4532
	.value	4098
	.value	17207
	.long	.LC4533
	.long	.LC4534
	.value	4098
	.value	17217
	.long	.LC4535
	.long	.LC3383
	.value	4098
	.value	17218
	.long	.LC4536
	.long	.LC4537
	.value	4098
	.value	17221
	.long	.LC4536
	.long	.LC4538
	.value	4098
	.value	17223
	.long	.LC4536
	.long	.LC4539
	.value	4098
	.value	17224
	.long	.LC4536
	.long	.LC4540
	.value	4098
	.value	17225
	.long	.LC4541
	.long	.LC4542
	.value	4098
	.value	17228
	.long	.LC4536
	.long	.LC4543
	.value	4098
	.value	17229
	.long	.LC4544
	.long	.LC4545
	.value	4098
	.value	17235
	.long	.LC4536
	.long	.LC3261
	.value	4098
	.value	17236
	.long	.LC4546
	.long	.LC4547
	.value	4098
	.value	17240
	.long	.LC4548
	.long	.LC4549
	.value	4098
	.value	17257
	.long	.LC4550
	.long	.LC4551
	.value	4098
	.value	17262
	.long	.LC4550
	.long	.LC4552
	.value	4098
	.value	17264
	.long	.LC4553
	.long	.LC4554
	.value	4098
	.value	17266
	.long	.LC4555
	.long	.LC4556
	.value	4098
	.value	17270
	.long	.LC4557
	.long	.LC4551
	.value	4098
	.value	17272
	.long	.LC3686
	.long	.LC4558
	.value	4098
	.value	17273
	.long	.LC4557
	.long	.LC4559
	.value	4098
	.value	17274
	.long	.LC4557
	.long	.LC4560
	.value	4098
	.value	17275
	.long	.LC2309
	.long	.LC4561
	.value	4098
	.value	17280
	.long	.LC5
	.long	.LC4562
	.value	4098
	.value	17280
	.long	.LC4563
	.long	.LC4564
	.value	4098
	.value	17280
	.long	.LC4565
	.long	.LC3408
	.value	4098
	.value	17281
	.long	.LC4563
	.long	.LC4564
	.value	4098
	.value	17285
	.long	.LC4566
	.long	.LC4556
	.value	4098
	.value	17286
	.long	.LC4567
	.long	.LC2667
	.value	4098
	.value	17292
	.long	.LC4568
	.long	.LC4569
	.value	4098
	.value	17296
	.long	.LC4570
	.long	.LC4562
	.value	4098
	.value	17297
	.long	.LC4571
	.long	.LC3408
	.value	4098
	.value	17298
	.long	.LC4571
	.long	.LC3450
	.value	4098
	.value	17299
	.long	.LC4572
	.long	.LC4564
	.value	4098
	.value	17308
	.long	.LC4570
	.long	.LC4551
	.value	4098
	.value	17748
	.long	.LC4573
	.long	.LC42
	.value	4098
	.value	18004
	.long	.LC4574
	.long	.LC4575
	.value	4098
	.value	18242
	.long	.LC4576
	.long	.LC4577
	.value	4098
	.value	18244
	.long	.LC4578
	.long	.LC4578
	.value	4098
	.value	18247
	.long	.LC4579
	.long	.LC4580
	.value	4098
	.value	18249
	.long	.LC4581
	.long	.LC4582
	.value	4098
	.value	18252
	.long	.LC4583
	.long	.LC4584
	.value	4098
	.value	18253
	.long	.LC4585
	.long	.LC4586
	.value	4098
	.value	18254
	.long	.LC4587
	.long	.LC42
	.value	4098
	.value	18255
	.long	.LC4588
	.long	.LC4589
	.value	4098
	.value	18256
	.long	.LC4590
	.long	.LC4590
	.value	4098
	.value	18257
	.long	.LC4591
	.long	.LC4592
	.value	4098
	.value	18258
	.long	.LC4593
	.long	.LC4594
	.value	4098
	.value	18259
	.long	.LC4595
	.long	.LC42
	.value	4098
	.value	18260
	.long	.LC4596
	.long	.LC4597
	.value	4098
	.value	18261
	.long	.LC4598
	.long	.LC4599
	.value	4098
	.value	18262
	.long	.LC4600
	.long	.LC4601
	.value	4098
	.value	18263
	.long	.LC4602
	.long	.LC4600
	.value	4098
	.value	18264
	.long	.LC4603
	.long	.LC4604
	.value	4098
	.value	18265
	.long	.LC4546
	.long	.LC4605
	.value	4098
	.value	18266
	.long	.LC4606
	.long	.LC4607
	.value	4098
	.value	18790
	.long	.LC4304
	.long	.LC4608
	.value	4098
	.value	18791
	.long	.LC4304
	.long	.LC4609
	.value	4098
	.value	18798
	.long	.LC4304
	.long	.LC4610
	.value	4098
	.value	18799
	.long	.LC4304
	.long	.LC4611
	.value	4098
	.value	19017
	.long	.LC4612
	.long	.LC4613
	.value	4098
	.value	19019
	.long	.LC4614
	.long	.LC4615
	.value	4098
	.value	19051
	.long	.LC4614
	.long	.LC4616
	.value	4098
	.value	19522
	.long	.LC4617
	.long	.LC4618
	.value	4098
	.value	19524
	.long	.LC4619
	.long	.LC4618
	.value	4098
	.value	19525
	.long	.LC42
	.long	.LC4620
	.value	4098
	.value	19526
	.long	.LC4621
	.long	.LC4622
	.value	4098
	.value	19527
	.long	.LC4623
	.long	.LC4624
	.value	4098
	.value	19529
	.long	.LC4625
	.long	.LC4626
	.value	4098
	.value	19533
	.long	.LC4627
	.long	.LC4628
	.value	4098
	.value	19534
	.long	.LC4629
	.long	.LC4630
	.value	4098
	.value	19536
	.long	.LC4631
	.long	.LC4632
	.value	4098
	.value	19537
	.long	.LC4633
	.long	.LC4632
	.value	4098
	.value	19538
	.long	.LC4634
	.long	.LC4635
	.value	4098
	.value	19539
	.long	.LC4636
	.long	.LC4637
	.value	4098
	.value	19540
	.long	.LC42
	.long	.LC4638
	.value	4098
	.value	19543
	.long	.LC4639
	.long	.LC4640
	.value	4098
	.value	19544
	.long	.LC42
	.long	.LC4641
	.value	4098
	.value	19545
	.long	.LC4642
	.long	.LC4643
	.value	4098
	.value	19546
	.long	.LC42
	.long	.LC4644
	.value	4098
	.value	19556
	.long	.LC42
	.long	.LC4645
	.value	4098
	.value	19558
	.long	.LC4646
	.long	.LC4647
	.value	4098
	.value	19782
	.long	.LC4648
	.long	.LC4649
	.value	4098
	.value	19788
	.long	.LC4650
	.long	.LC4651
	.value	4098
	.value	19794
	.long	.LC4652
	.long	.LC4652
	.value	4098
	.value	20036
	.long	.LC4506
	.long	.LC4653
	.value	4098
	.value	20037
	.long	.LC4506
	.long	.LC4654
	.value	4098
	.value	20038
	.long	.LC4506
	.long	.LC4655
	.value	4098
	.value	20039
	.long	.LC42
	.long	.LC4656
	.value	4098
	.value	20040
	.long	.LC4657
	.long	.LC4658
	.value	4098
	.value	20041
	.long	.LC4511
	.long	.LC4659
	.value	4098
	.value	20042
	.long	.LC4657
	.long	.LC4660
	.value	4098
	.value	20043
	.long	.LC4661
	.long	.LC4662
	.value	4098
	.value	20048
	.long	.LC4663
	.long	.LC4664
	.value	4098
	.value	20052
	.long	.LC4665
	.long	.LC4666
	.value	4098
	.value	20068
	.long	.LC4506
	.long	.LC4667
	.value	4098
	.value	20069
	.long	.LC4506
	.long	.LC4668
	.value	4098
	.value	20070
	.long	.LC4506
	.long	.LC4669
	.value	4098
	.value	20071
	.long	.LC42
	.long	.LC4670
	.value	4098
	.value	20072
	.long	.LC4511
	.long	.LC4671
	.value	4098
	.value	20073
	.long	.LC4511
	.long	.LC4672
	.value	4098
	.value	20074
	.long	.LC4511
	.long	.LC4673
	.value	4098
	.value	20075
	.long	.LC4661
	.long	.LC4674
	.value	4098
	.value	20545
	.long	.LC4675
	.long	.LC4676
	.value	4098
	.value	20546
	.long	.LC4677
	.long	.LC4678
	.value	4098
	.value	20547
	.long	.LC4679
	.long	.LC4680
	.value	4098
	.value	20548
	.long	.LC4681
	.long	.LC4682
	.value	4098
	.value	20549
	.long	.LC42
	.long	.LC4683
	.value	4098
	.value	20550
	.long	.LC4684
	.long	.LC4685
	.value	4098
	.value	20551
	.long	.LC4686
	.long	.LC4687
	.value	4098
	.value	20552
	.long	.LC4688
	.long	.LC4689
	.value	4098
	.value	20553
	.long	.LC4690
	.long	.LC4691
	.value	4098
	.value	20554
	.long	.LC4692
	.long	.LC4693
	.value	4098
	.value	20555
	.long	.LC4694
	.long	.LC4695
	.value	4098
	.value	20556
	.long	.LC4696
	.long	.LC4697
	.value	4098
	.value	20557
	.long	.LC4698
	.long	.LC4698
	.value	4098
	.value	20558
	.long	.LC4699
	.long	.LC4700
	.value	4098
	.value	20559
	.long	.LC4701
	.long	.LC4702
	.value	4098
	.value	20560
	.long	.LC4703
	.long	.LC4704
	.value	4098
	.value	20561
	.long	.LC4705
	.long	.LC4706
	.value	4098
	.value	20562
	.long	.LC4707
	.long	.LC4708
	.value	4098
	.value	20563
	.long	.LC4709
	.long	.LC4709
	.value	4098
	.value	20564
	.long	.LC4710
	.long	.LC4711
	.value	4098
	.value	20565
	.long	.LC4712
	.long	.LC4712
	.value	4098
	.value	20566
	.long	.LC4713
	.long	.LC4714
	.value	4098
	.value	20567
	.long	.LC4715
	.long	.LC4716
	.value	4098
	.value	20568
	.long	.LC4717
	.long	.LC4718
	.value	4098
	.value	20804
	.long	.LC4719
	.long	.LC4719
	.value	4098
	.value	20805
	.long	.LC42
	.long	.LC4720
	.value	4098
	.value	20806
	.long	.LC42
	.long	.LC4721
	.value	4098
	.value	20807
	.long	.LC42
	.long	.LC4722
	.value	4098
	.value	20808
	.long	.LC4723
	.long	.LC4724
	.value	4098
	.value	20809
	.long	.LC42
	.long	.LC4725
	.value	4098
	.value	20810
	.long	.LC42
	.long	.LC4726
	.value	4098
	.value	20811
	.long	.LC42
	.long	.LC4727
	.value	4098
	.value	20812
	.long	.LC4723
	.long	.LC4728
	.value	4098
	.value	20813
	.long	.LC4723
	.long	.LC4729
	.value	4098
	.value	20814
	.long	.LC42
	.long	.LC4730
	.value	4098
	.value	20815
	.long	.LC42
	.long	.LC4731
	.value	4098
	.value	20823
	.long	.LC4732
	.long	.LC4733
	.value	4098
	.value	20824
	.long	.LC4734
	.long	.LC4735
	.value	4098
	.value	20825
	.long	.LC4736
	.long	.LC4737
	.value	4098
	.value	20826
	.long	.LC42
	.long	.LC4738
	.value	4098
	.value	20830
	.long	.LC4739
	.long	.LC4739
	.value	4098
	.value	20840
	.long	.LC4740
	.long	.LC4741
	.value	4098
	.value	20841
	.long	.LC42
	.long	.LC4742
	.value	4098
	.value	20842
	.long	.LC42
	.long	.LC4743
	.value	4098
	.value	20843
	.long	.LC42
	.long	.LC4744
	.value	4098
	.value	20844
	.long	.LC3347
	.long	.LC4728
	.value	4098
	.value	20845
	.long	.LC4723
	.long	.LC4745
	.value	4098
	.value	21061
	.long	.LC4746
	.long	.LC4747
	.value	4098
	.value	21062
	.long	.LC4748
	.long	.LC4749
	.value	4098
	.value	21063
	.long	.LC42
	.long	.LC4750
	.value	4098
	.value	21067
	.long	.LC4751
	.long	.LC4752
	.value	4098
	.value	21068
	.long	.LC42
	.long	.LC4753
	.value	4098
	.value	21317
	.long	.LC42
	.long	.LC4754
	.value	4098
	.value	21318
	.long	.LC4755
	.long	.LC4755
	.value	4098
	.value	21319
	.long	.LC42
	.long	.LC4756
	.value	4098
	.value	21320
	.long	.LC42
	.long	.LC4757
	.value	4098
	.value	21323
	.long	.LC4758
	.long	.LC4759
	.value	4098
	.value	21324
	.long	.LC4760
	.long	.LC4761
	.value	4098
	.value	21325
	.long	.LC4762
	.long	.LC4763
	.value	4098
	.value	21326
	.long	.LC4764
	.long	.LC42
	.value	4098
	.value	21332
	.long	.LC42
	.long	.LC4765
	.value	4098
	.value	21574
	.long	.LC4766
	.long	.LC4767
	.value	4098
	.value	21580
	.long	.LC42
	.long	.LC4768
	.value	4098
	.value	21586
	.long	.LC42
	.long	.LC4769
	.value	4098
	.value	21589
	.long	.LC42
	.long	.LC4770
	.value	4098
	.value	21600
	.long	.LC4771
	.long	.LC4772
	.value	4098
	.value	21835
	.long	.LC4773
	.long	.LC4774
	.value	4098
	.value	21837
	.long	.LC4775
	.long	.LC4776
	.value	4098
	.value	21841
	.long	.LC4777
	.long	.LC4778
	.value	4098
	.value	21867
	.long	.LC4773
	.long	.LC4779
	.value	4098
	.value	21869
	.long	.LC4775
	.long	.LC4780
	.value	4098
	.value	21873
	.long	.LC4777
	.long	.LC4781
	.value	4098
	.value	22099
	.long	.LC4782
	.long	.LC4783
	.value	4098
	.value	22100
	.long	.LC4784
	.long	.LC4785
	.value	4098
	.value	22101
	.long	.LC42
	.long	.LC4786
	.value	4098
	.value	22102
	.long	.LC4787
	.long	.LC4787
	.value	4098
	.value	22576
	.long	.LC4788
	.long	.LC2686
	.value	4098
	.value	22577
	.long	.LC4788
	.long	.LC2686
	.value	4098
	.value	22578
	.long	.LC4788
	.long	.LC2686
	.value	4098
	.value	22579
	.long	.LC4789
	.long	.LC2686
	.value	4098
	.value	22580
	.long	.LC4788
	.long	.LC4789
	.value	4098
	.value	22581
	.long	.LC4788
	.long	.LC4790
	.value	4098
	.value	22584
	.long	.LC4789
	.long	.LC3180
	.value	4098
	.value	22848
	.long	.LC4308
	.long	.LC4791
	.value	4098
	.value	22849
	.long	.LC4308
	.long	.LC4792
	.value	4098
	.value	22868
	.long	.LC4793
	.long	.LC4794
	.value	4098
	.value	22869
	.long	.LC2366
	.long	.LC4795
	.value	4098
	.value	22880
	.long	.LC4308
	.long	.LC4796
	.value	4098
	.value	22881
	.long	.LC4308
	.long	.LC4797
	.value	4098
	.value	22884
	.long	.LC4798
	.long	.LC4799
	.value	4098
	.value	22885
	.long	.LC4800
	.long	.LC4801
	.value	4098
	.value	22901
	.long	.LC4802
	.long	.LC4803
	.value	4098
	.value	23089
	.long	.LC2626
	.long	.LC2626
	.value	4098
	.value	23091
	.long	.LC4804
	.long	.LC4805
	.value	4098
	.value	23106
	.long	.LC4806
	.long	.LC4807
	.value	4098
	.value	23137
	.long	.LC4808
	.long	.LC4809
	.value	4098
	.value	23138
	.long	.LC4810
	.long	.LC4811
	.value	4098
	.value	23392
	.long	.LC4812
	.long	.LC4813
	.value	4098
	.value	23394
	.long	.LC4499
	.long	.LC4814
	.value	4098
	.value	23395
	.long	.LC2613
	.long	.LC4815
	.value	4098
	.value	23396
	.long	.LC4816
	.long	.LC2626
	.value	4098
	.value	23408
	.long	.LC4817
	.long	.LC4817
	.value	4098
	.value	23412
	.long	.LC4818
	.long	.LC4819
	.value	4098
	.value	23649
	.long	.LC4820
	.long	.LC4821
	.value	4098
	.value	23651
	.long	.LC4822
	.long	.LC4821
	.value	4098
	.value	23876
	.long	.LC4308
	.long	.LC4823
	.value	4098
	.value	23877
	.long	.LC4308
	.long	.LC4824
	.value	4098
	.value	23882
	.long	.LC4825
	.long	.LC4826
	.value	4098
	.value	23885
	.long	.LC4827
	.long	.LC4827
	.value	4098
	.value	23887
	.long	.LC4828
	.long	.LC4829
	.value	4098
	.value	23890
	.long	.LC4830
	.long	.LC4831
	.value	4098
	.value	23917
	.long	.LC4827
	.long	.LC4827
	.value	4098
	.value	23922
	.long	.LC4832
	.long	.LC4832
	.value	4098
	.value	28687
	.long	.LC4833
	.long	.LC4834
	.value	4098
	.value	28688
	.long	.LC4504
	.long	.LC4834
	.value	4098
	.value	28937
	.long	.LC4835
	.long	.LC4836
	.value	4098
	.value	28994
	.long	.LC4832
	.long	.LC4837
	.value	4098
	.value	28997
	.long	.LC4838
	.long	.LC4839
	.value	4098
	.value	28998
	.long	.LC4832
	.long	.LC4840
	.value	4098
	.value	29001
	.long	.LC4841
	.long	.LC4842
	.value	4098
	.value	29010
	.long	.LC4843
	.long	.LC4844
	.value	4098
	.value	29059
	.long	.LC4845
	.long	.LC4846
	.value	4098
	.value	29062
	.long	.LC4847
	.long	.LC4848
	.value	4098
	.value	29063
	.long	.LC4849
	.long	.LC4849
	.value	4098
	.value	29064
	.long	.LC4850
	.long	.LC4851
	.value	4098
	.value	29066
	.long	.LC2476
	.long	.LC4851
	.value	4098
	.value	29089
	.long	.LC2432
	.long	.LC4852
	.value	4098
	.value	29091
	.long	.LC4853
	.long	.LC4854
	.value	4098
	.value	29095
	.long	.LC4849
	.long	.LC4855
	.value	4098
	.value	29121
	.long	.LC4856
	.long	.LC4857
	.value	4098
	.value	29122
	.long	.LC4858
	.long	.LC4858
	.value	4098
	.value	29125
	.long	.LC4859
	.long	.LC4860
	.value	4098
	.value	29126
	.long	.LC3453
	.long	.LC3453
	.value	4098
	.value	29134
	.long	.LC4861
	.long	.LC4862
	.value	4098
	.value	29138
	.long	.LC4863
	.long	.LC4864
	.value	4098
	.value	29150
	.long	.LC4865
	.long	.LC4866
	.value	4098
	.value	29170
	.long	.LC4863
	.long	.LC4867
	.value	4098
	.value	29189
	.long	.LC4868
	.long	.LC4869
	.value	4098
	.value	29257
	.long	.LC4494
	.long	.LC4494
	.value	4098
	.value	29259
	.long	.LC4870
	.long	.LC4871
	.value	4098
	.value	29312
	.long	.LC4872
	.long	.LC4873
	.value	4098
	.value	29344
	.long	.LC4874
	.long	.LC4875
	.value	4098
	.value	30771
	.long	.LC4876
	.long	.LC4877
	.value	4098
	.value	31006
	.long	.LC4878
	.long	.LC4879
	.value	4098
	.value	31007
	.long	.LC4880
	.long	.LC4881
	.value	4098
	.value	31031
	.long	.LC4882
	.long	.LC4883
	.value	4098
	.value	31042
	.long	.LC3453
	.long	.LC4884
	.value	4098
	.value	-27648
	.long	.LC4885
	.long	.LC4886
	.value	4098
	.value	-27584
	.long	.LC4887
	.long	.LC4888
	.value	4098
	.value	-27455
	.long	.LC4889
	.long	.LC4890
	.value	4098
	.value	-27453
	.long	.LC4891
	.long	.LC4890
	.value	4098
	.value	-27452
	.long	.LC4891
	.long	.LC4892
	.value	4098
	.value	-27444
	.long	.LC4893
	.long	.LC4893
	.value	4098
	.value	-27391
	.long	.LC4894
	.long	.LC4895
	.value	4098
	.value	-27371
	.long	.LC3453
	.long	.LC4896
	.value	4098
	.value	-27263
	.long	.LC4897
	.long	.LC4898
	.value	4098
	.value	-27257
	.long	.LC4899
	.long	.LC4899
	.value	4098
	.value	-27256
	.long	.LC4900
	.long	.LC4901
	.value	4098
	.value	-27255
	.long	.LC4902
	.long	.LC4903
	.value	4098
	.value	-27247
	.long	.LC4904
	.long	.LC4905
	.value	4098
	.value	-27196
	.long	.LC4906
	.long	.LC4906
	.value	4098
	.value	-27195
	.long	.LC4907
	.long	.LC4908
	.value	4098
	.value	-27120
	.long	.LC4909
	.long	.LC4910
	.value	4098
	.value	-26506
	.long	.LC4911
	.long	.LC4912
	.value	4098
	.value	-22015
	.long	.LC4913
	.long	.LC4914
	.value	4098
	.value	-22000
	.long	.LC2366
	.long	.LC4915
	.value	4098
	.value	-21984
	.long	.LC4902
	.long	.LC4916
	.value	4098
	.value	-21976
	.long	.LC4917
	.long	.LC4918
	.value	4098
	.value	-13648
	.long	.LC4833
	.long	.LC4919
	.value	4098
	.value	-13647
	.long	.LC4833
	.long	.LC4920
	.value	4098
	.value	-13646
	.long	.LC4504
	.long	.LC4369
	.value	4098
	.value	-13390
	.long	.LC4504
	.long	.LC4369
	.value	4098
	.value	7800
	.long	.LC42
	.long	.LC42
	.value	4099
	.value	513
	.long	.LC4921
	.long	.LC2878
	.value	4100
	.value	5
	.long	.LC4922
	.long	.LC4923
	.value	4100
	.value	6
	.long	.LC4924
	.long	.LC4336
	.value	4100
	.value	7
	.long	.LC4925
	.long	.LC4926
	.value	4100
	.value	8
	.long	.LC4927
	.long	.LC4928
	.value	4100
	.value	9
	.long	.LC4929
	.long	.LC42
	.value	4100
	.value	12
	.long	.LC4930
	.long	.LC42
	.value	4100
	.value	13
	.long	.LC4931
	.long	.LC42
	.value	4100
	.value	256
	.long	.LC4932
	.long	.LC4933
	.value	4100
	.value	257
	.long	.LC4934
	.long	.LC4935
	.value	4100
	.value	258
	.long	.LC4936
	.long	.LC2519
	.value	4100
	.value	259
	.long	.LC4937
	.long	.LC2692
	.value	4100
	.value	260
	.long	.LC4938
	.long	.LC2686
	.value	4100
	.value	261
	.long	.LC4939
	.long	.LC4940
	.value	4100
	.value	512
	.long	.LC4941
	.long	.LC4942
	.value	4100
	.value	640
	.long	.LC4943
	.long	.LC4942
	.value	4100
	.value	772
	.long	.LC4944
	.long	.LC4945
	.value	4100
	.value	773
	.long	.LC4944
	.long	.LC4946
	.value	4100
	.value	774
	.long	.LC4944
	.long	.LC4947
	.value	4100
	.value	775
	.long	.LC4948
	.long	.LC4949
	.value	4100
	.value	776
	.long	.LC2538
	.long	.LC4950
	.value	4100
	.value	1794
	.long	.LC4951
	.long	.LC4952
	.value	4107
	.value	1
	.long	.LC4953
	.long	.LC4954
	.value	4107
	.value	2
	.long	.LC4955
	.long	.LC4956
	.value	4107
	.value	14
	.long	.LC4957
	.long	.LC4958
	.value	4107
	.value	15
	.long	.LC4959
	.long	.LC4960
	.value	4107
	.value	17
	.long	.LC4957
	.long	.LC4961
	.value	4107
	.value	18
	.long	.LC42
	.long	.LC3260
	.value	4107
	.value	27
	.long	.LC4962
	.long	.LC4963
	.value	4107
	.value	32
	.long	.LC4964
	.long	.LC4965
	.value	4107
	.value	32
	.long	.LC4966
	.long	.LC4967
	.value	4107
	.value	33
	.long	.LC4968
	.long	.LC2692
	.value	4107
	.value	34
	.long	.LC4969
	.long	.LC4970
	.value	4107
	.value	40
	.long	.LC4971
	.long	.LC4972
	.value	4107
	.value	42
	.long	.LC4973
	.long	.LC4974
	.value	4107
	.value	45
	.long	.LC4975
	.long	.LC4976
	.value	4107
	.value	46
	.long	.LC4977
	.long	.LC4978
	.value	4107
	.value	47
	.long	.LC4979
	.long	.LC3260
	.value	4107
	.value	48
	.long	.LC72
	.long	.LC4980
	.value	4107
	.value	1280
	.long	.LC4981
	.long	.LC4982
	.value	4107
	.value	1281
	.long	.LC4981
	.long	.LC4983
	.value	4107
	.value	1282
	.long	.LC4984
	.long	.LC2677
	.value	4107
	.value	1283
	.long	.LC4984
	.long	.LC4985
	.value	4107
	.value	1284
	.long	.LC4981
	.long	.LC4986
	.value	4107
	.value	1285
	.long	.LC4981
	.long	.LC4987
	.value	4107
	.value	1296
	.long	.LC4988
	.long	.LC4982
	.value	4107
	.value	1297
	.long	.LC4988
	.long	.LC4983
	.value	4107
	.value	1301
	.long	.LC4988
	.long	.LC4987
	.value	4107
	.value	35
	.long	.LC42
	.long	.LC42
	.value	4107
	.value	-12287
	.long	.LC4989
	.long	.LC4990
	.value	4108
	.value	12802
	.long	.LC4991
	.long	.LC2878
	.value	4108
	.value	12805
	.long	.LC4992
	.long	.LC2878
	.value	4108
	.value	12806
	.long	.LC4993
	.long	.LC2878
	.value	4108
	.value	12807
	.long	.LC4994
	.long	.LC2878
	.value	4108
	.value	12808
	.long	.LC4995
	.long	.LC4996
	.value	4108
	.value	18178
	.long	.LC4997
	.long	.LC42
	.value	5741
	.value	1
	.long	.LC4998
	.long	.LC42
	.value	5741
	.value	2
	.long	.LC4999
	.long	.LC5000
	.value	4110
	.value	1380
	.long	.LC5001
	.long	.LC2686
	.value	4110
	.value	21964
	.long	.LC5001
	.long	.LC5002
	.value	4110
	.value	-28672
	.long	.LC5003
	.long	.LC5004
	.value	4110
	.value	-28671
	.long	.LC5003
	.long	.LC2878
	.value	4110
	.value	-28416
	.long	.LC5005
	.long	.LC2878
	.value	4113
	.value	1
	.long	.LC5006
	.long	.LC5007
	.value	4113
	.value	2
	.long	.LC5008
	.long	.LC5009
	.value	4113
	.value	4
	.long	.LC5010
	.long	.LC5011
	.value	4113
	.value	7
	.long	.LC5012
	.long	.LC5013
	.value	4113
	.value	8
	.long	.LC5014
	.long	.LC5015
	.value	4113
	.value	9
	.long	.LC5016
	.long	.LC5017
	.value	4113
	.value	10
	.long	.LC5018
	.long	.LC5019
	.value	4113
	.value	12
	.long	.LC5020
	.long	.LC42
	.value	4113
	.value	13
	.long	.LC5021
	.long	.LC5022
	.value	4113
	.value	15
	.long	.LC5023
	.long	.LC5024
	.value	4113
	.value	20
	.long	.LC5025
	.long	.LC5026
	.value	4113
	.value	22
	.long	.LC5027
	.long	.LC963
	.value	4113
	.value	25
	.long	.LC5028
	.long	.LC5029
	.value	4113
	.value	33
	.long	.LC5030
	.long	.LC5007
	.value	4113
	.value	34
	.long	.LC5031
	.long	.LC5007
	.value	4113
	.value	35
	.long	.LC5032
	.long	.LC2519
	.value	4113
	.value	36
	.long	.LC5033
	.long	.LC5007
	.value	4113
	.value	37
	.long	.LC5034
	.long	.LC5007
	.value	4113
	.value	38
	.long	.LC5035
	.long	.LC5007
	.value	4113
	.value	52
	.long	.LC5036
	.long	.LC5037
	.value	4113
	.value	69
	.long	.LC5038
	.long	.LC2519
	.value	4113
	.value	70
	.long	.LC5039
	.long	.LC3793
	.value	4113
	.value	4197
	.long	.LC5040
	.long	.LC5041
	.value	4113
	.value	8192
	.long	.LC5042
	.long	.LC5043
	.value	4115
	.value	56
	.long	.LC5044
	.long	.LC5045
	.value	4115
	.value	64
	.long	.LC5046
	.long	.LC5047
	.value	4115
	.value	76
	.long	.LC5048
	.long	.LC5049
	.value	4115
	.value	160
	.long	.LC5050
	.long	.LC2878
	.value	4115
	.value	162
	.long	.LC5051
	.long	.LC5052
	.value	4115
	.value	164
	.long	.LC5053
	.long	.LC5052
	.value	4115
	.value	168
	.long	.LC5053
	.long	.LC5052
	.value	4115
	.value	172
	.long	.LC5054
	.long	.LC5055
	.value	4115
	.value	184
	.long	.LC5056
	.long	.LC5057
	.value	4115
	.value	188
	.long	.LC5058
	.long	.LC5059
	.value	4115
	.value	208
	.long	.LC5060
	.long	.LC5061
	.value	4115
	.value	212
	.long	.LC5062
	.long	.LC5063
	.value	4115
	.value	213
	.long	.LC5064
	.long	.LC5065
	.value	4115
	.value	214
	.long	.LC5066
	.long	.LC5063
	.value	4115
	.value	232
	.long	.LC5067
	.long	.LC42
	.value	4115
	.value	4115
	.long	.LC5068
	.long	.LC5069
	.value	4115
	.value	4352
	.long	.LC5070
	.long	.LC5071
	.value	4115
	.value	4368
	.long	.LC5072
	.long	.LC5073
	.value	4115
	.value	4370
	.long	.LC5074
	.long	.LC5073
	.value	4115
	.value	4371
	.long	.LC5075
	.long	.LC5076
	.value	4115
	.value	4608
	.long	.LC5077
	.long	.LC5078
	.value	4115
	.value	4610
	.long	.LC5079
	.long	.LC5080
	.value	4115
	.value	4612
	.long	.LC5081
	.long	.LC5082
	.value	4115
	.value	16384
	.long	.LC5083
	.long	.LC5084
	.value	4115
	.value	17408
	.long	.LC5085
	.long	.LC2820
	.value	4115
	.value	24577
	.long	.LC5086
	.long	.LC5087
	.value	4115
	.value	24579
	.long	.LC5088
	.long	.LC5089
	.value	4115
	.value	24580
	.long	.LC5090
	.long	.LC3842
	.value	4115
	.value	24581
	.long	.LC5091
	.long	.LC5092
	.value	4115
	.value	-26506
	.long	.LC5093
	.long	.LC5094
	.value	4116
	.value	2
	.long	.LC5095
	.long	.LC5095
	.value	4116
	.value	5
	.long	.LC5096
	.long	.LC4923
	.value	4116
	.value	7
	.long	.LC5097
	.long	.LC4923
	.value	4116
	.value	10
	.long	.LC5098
	.long	.LC5099
	.value	4116
	.value	23
	.long	.LC42
	.long	.LC4369
	.value	4116
	.value	24
	.long	.LC5100
	.long	.LC5101
	.value	4116
	.value	27
	.long	.LC5102
	.long	.LC5103
	.value	4116
	.value	29
	.long	.LC5104
	.long	.LC5105
	.value	4116
	.value	32
	.long	.LC42
	.long	.LC5095
	.value	4116
	.value	34
	.long	.LC5106
	.long	.LC2519
	.value	4116
	.value	45
	.long	.LC5107
	.long	.LC42
	.value	4116
	.value	46
	.long	.LC5108
	.long	.LC5109
	.value	4116
	.value	54
	.long	.LC5110
	.long	.LC5111
	.value	4116
	.value	55
	.long	.LC5112
	.long	.LC5113
	.value	4116
	.value	58
	.long	.LC42
	.long	.LC4369
	.value	4116
	.value	62
	.long	.LC5114
	.long	.LC5115
	.value	4116
	.value	69
	.long	.LC42
	.long	.LC5116
	.value	4116
	.value	70
	.long	.LC5117
	.long	.LC5118
	.value	4116
	.value	71
	.long	.LC42
	.long	.LC2519
	.value	4116
	.value	72
	.long	.LC42
	.long	.LC2519
	.value	4116
	.value	73
	.long	.LC42
	.long	.LC5119
	.value	4116
	.value	77
	.long	.LC5120
	.long	.LC5121
	.value	4116
	.value	78
	.long	.LC42
	.long	.LC5122
	.value	4116
	.value	79
	.long	.LC42
	.long	.LC5122
	.value	4116
	.value	80
	.long	.LC42
	.long	.LC5122
	.value	4116
	.value	83
	.long	.LC5123
	.long	.LC5124
	.value	4116
	.value	87
	.long	.LC5125
	.long	.LC5126
	.value	4116
	.value	92
	.long	.LC5127
	.long	.LC5128
	.value	4116
	.value	93
	.long	.LC5129
	.long	.LC5130
	.value	4116
	.value	124
	.long	.LC42
	.long	.LC5122
	.value	4116
	.value	125
	.long	.LC5131
	.long	.LC5121
	.value	4116
	.value	144
	.long	.LC5132
	.long	.LC42
	.value	4116
	.value	149
	.long	.LC5133
	.long	.LC5134
	.value	4116
	.value	150
	.long	.LC42
	.long	.LC5135
	.value	4116
	.value	161
	.long	.LC5136
	.long	.LC5137
	.value	4116
	.value	165
	.long	.LC42
	.long	.LC5122
	.value	4116
	.value	166
	.long	.LC42
	.long	.LC5138
	.value	4116
	.value	183
	.long	.LC5139
	.long	.LC5140
	.value	4116
	.value	190
	.long	.LC42
	.long	.LC5141
	.value	4116
	.value	206
	.long	.LC5142
	.long	.LC5143
	.value	4116
	.value	249
	.long	.LC5144
	.long	.LC5145
	.value	4116
	.value	252
	.long	.LC5146
	.long	.LC5147
	.value	4116
	.value	261
	.long	.LC5146
	.long	.LC5148
	.value	4116
	.value	271
	.long	.LC42
	.long	.LC5149
	.value	4116
	.value	283
	.long	.LC42
	.long	.LC5150
	.value	4116
	.value	322
	.long	.LC5151
	.long	.LC5152
	.value	4116
	.value	324
	.long	.LC5151
	.long	.LC5153
	.value	4116
	.value	339
	.long	.LC42
	.long	.LC42
	.value	4116
	.value	342
	.long	.LC5154
	.long	.LC5155
	.value	4116
	.value	368
	.long	.LC5156
	.long	.LC5157
	.value	4116
	.value	392
	.long	.LC5158
	.long	.LC3333
	.value	4116
	.value	418
	.long	.LC3132
	.long	.LC5159
	.value	4116
	.value	423
	.long	.LC5160
	.long	.LC5161
	.value	4116
	.value	445
	.long	.LC5162
	.long	.LC5163
	.value	4116
	.value	495
	.long	.LC5164
	.long	.LC5165
	.value	4116
	.value	582
	.long	.LC42
	.long	.LC42
	.value	4116
	.value	639
	.long	.LC5166
	.long	.LC5167
	.value	4116
	.value	652
	.long	.LC5168
	.long	.LC5169
	.value	4116
	.value	661
	.long	.LC5170
	.long	.LC5171
	.value	4116
	.value	663
	.long	.LC5170
	.long	.LC5172
	.value	4116
	.value	770
	.long	.LC42
	.long	.LC5173
	.value	4116
	.value	-1
	.long	.LC5174
	.long	.LC5118
	.value	4116
	.value	14272
	.long	.LC2613
	.long	.LC5175
	.value	4116
	.value	14288
	.long	.LC3509
	.long	.LC3509
	.value	4119
	.value	21315
	.long	.LC5176
	.long	.LC5177
	.value	4121
	.value	6928
	.long	.LC5178
	.long	.LC5179
	.value	4122
	.value	5
	.long	.LC5180
	.long	.LC5181
	.value	4122
	.value	9
	.long	.LC5182
	.long	.LC5183
	.value	4126
	.value	-28656
	.long	.LC5184
	.long	.LC5185
	.value	4126
	.value	-28624
	.long	.LC42
	.long	.LC3314
	.value	4126
	.value	-28623
	.long	.LC42
	.long	.LC3314
	.value	4126
	.value	-28622
	.long	.LC42
	.long	.LC5186
	.value	4126
	.value	-28621
	.long	.LC5187
	.long	.LC2844
	.value	4126
	.value	-28608
	.long	.LC42
	.long	.LC5188
	.value	4126
	.value	-28576
	.long	.LC5189
	.long	.LC5190
	.value	4126
	.value	-28573
	.long	.LC5191
	.long	.LC42
	.value	4130
	.value	4352
	.long	.LC5192
	.long	.LC5193
	.value	4130
	.value	4353
	.long	.LC5192
	.long	.LC5194
	.value	4130
	.value	4354
	.long	.LC5192
	.long	.LC5195
	.value	4130
	.value	4355
	.long	.LC5192
	.long	.LC5196
	.value	4130
	.value	8192
	.long	.LC5197
	.long	.LC5198
	.value	4130
	.value	8193
	.long	.LC5199
	.long	.LC5200
	.value	4130
	.value	8195
	.long	.LC5201
	.long	.LC5202
	.value	4130
	.value	8224
	.long	.LC5203
	.long	.LC2844
	.value	4130
	.value	8256
	.long	.LC5204
	.long	.LC5205
	.value	4130
	.value	8321
	.long	.LC2613
	.long	.LC5206
	.value	4130
	.value	8322
	.long	.LC5207
	.long	.LC5208
	.value	4130
	.value	8335
	.long	.LC5209
	.long	.LC4974
	.value	4130
	.value	8339
	.long	.LC5209
	.long	.LC5210
	.value	4130
	.value	8340
	.long	.LC5209
	.long	.LC5211
	.value	4130
	.value	8341
	.long	.LC5209
	.long	.LC5212
	.value	4130
	.value	8342
	.long	.LC5213
	.long	.LC5214
	.value	4130
	.value	8343
	.long	.LC5209
	.long	.LC5215
	.value	4130
	.value	8346
	.long	.LC5209
	.long	.LC5216
	.value	4130
	.value	12288
	.long	.LC5217
	.long	.LC5218
	.value	4130
	.value	24139
	.long	.LC5219
	.long	.LC5220
	.value	4130
	.value	28676
	.long	.LC5221
	.long	.LC4369
	.value	4130
	.value	28678
	.long	.LC5221
	.long	.LC5222
	.value	4130
	.value	28679
	.long	.LC5221
	.long	.LC5223
	.value	4130
	.value	28682
	.long	.LC5224
	.long	.LC5225
	.value	4130
	.value	28683
	.long	.LC5224
	.long	.LC5226
	.value	4130
	.value	28684
	.long	.LC5227
	.long	.LC5228
	.value	4130
	.value	28685
	.long	.LC5227
	.long	.LC5229
	.value	4130
	.value	28686
	.long	.LC5230
	.long	.LC5231
	.value	4130
	.value	28687
	.long	.LC5230
	.long	.LC5232
	.value	4130
	.value	29696
	.long	.LC5233
	.long	.LC2692
	.value	4130
	.value	29697
	.long	.LC5233
	.long	.LC5234
	.value	4130
	.value	29699
	.long	.LC5233
	.long	.LC3643
	.value	4130
	.value	29700
	.long	.LC5233
	.long	.LC5235
	.value	4130
	.value	29704
	.long	.LC5236
	.long	.LC5237
	.value	4130
	.value	29705
	.long	.LC5236
	.long	.LC3314
	.value	4130
	.value	29707
	.long	.LC5236
	.long	.LC3534
	.value	4130
	.value	29708
	.long	.LC5236
	.long	.LC4363
	.value	4130
	.value	29712
	.long	.LC5238
	.long	.LC5239
	.value	4130
	.value	29713
	.long	.LC5238
	.long	.LC5240
	.value	4130
	.value	29714
	.long	.LC5238
	.long	.LC3260
	.value	4130
	.value	29715
	.long	.LC5238
	.long	.LC3643
	.value	4130
	.value	29716
	.long	.LC5238
	.long	.LC5241
	.value	4130
	.value	29760
	.long	.LC5242
	.long	.LC3679
	.value	4130
	.value	29761
	.long	.LC5242
	.long	.LC3314
	.value	4130
	.value	29763
	.long	.LC5242
	.long	.LC5243
	.value	4130
	.value	29765
	.long	.LC5242
	.long	.LC5244
	.value	4130
	.value	29766
	.long	.LC5242
	.long	.LC4558
	.value	4130
	.value	29768
	.long	.LC5242
	.long	.LC3333
	.value	4130
	.value	29769
	.long	.LC5242
	.long	.LC3260
	.value	4130
	.value	29776
	.long	.LC5245
	.long	.LC2816
	.value	4130
	.value	29777
	.long	.LC5245
	.long	.LC5246
	.value	4130
	.value	29780
	.long	.LC5247
	.long	.LC3610
	.value	4130
	.value	29781
	.long	.LC5247
	.long	.LC3180
	.value	4130
	.value	29784
	.long	.LC5248
	.long	.LC2816
	.value	4130
	.value	29785
	.long	.LC5248
	.long	.LC5246
	.value	4130
	.value	29792
	.long	.LC5249
	.long	.LC3333
	.value	4130
	.value	29793
	.long	.LC5249
	.long	.LC5250
	.value	4130
	.value	29794
	.long	.LC5249
	.long	.LC5205
	.value	4130
	.value	29795
	.long	.LC5249
	.long	.LC5251
	.value	4130
	.value	29796
	.long	.LC5249
	.long	.LC5241
	.value	4130
	.value	29800
	.long	.LC5249
	.long	.LC3679
	.value	4130
	.value	29801
	.long	.LC5249
	.long	.LC5252
	.value	4130
	.value	29802
	.long	.LC5249
	.long	.LC5253
	.value	4130
	.value	29803
	.long	.LC5249
	.long	.LC5243
	.value	4130
	.value	29805
	.long	.LC5254
	.long	.LC5255
	.value	4130
	.value	29806
	.long	.LC5249
	.long	.LC5256
	.value	4130
	.value	30059
	.long	.LC5249
	.long	.LC5257
	.value	4130
	.value	2112
	.long	.LC5258
	.long	.LC5259
	.value	4131
	.value	404
	.long	.LC5260
	.long	.LC2440
	.value	4131
	.value	8192
	.long	.LC5261
	.long	.LC5262
	.value	4131
	.value	8193
	.long	.LC5263
	.long	.LC5264
	.value	4131
	.value	8448
	.long	.LC5265
	.long	.LC5266
	.value	4131
	.value	8704
	.long	.LC5267
	.long	.LC5268
	.value	4131
	.value	-31744
	.long	.LC5269
	.long	.LC5270
	.value	4131
	.value	-31712
	.long	.LC5271
	.long	.LC5272
	.value	4131
	.value	-31488
	.long	.LC5273
	.long	.LC5274
	.value	4131
	.value	-31456
	.long	.LC5275
	.long	.LC5276
	.value	4131
	.value	-31200
	.long	.LC5277
	.long	.LC5278
	.value	4131
	.value	-30688
	.long	.LC5279
	.long	.LC5280
	.value	4131
	.value	-27872
	.long	.LC5281
	.long	.LC5282
	.value	4131
	.value	-27824
	.long	.LC5283
	.long	.LC5282
	.value	4131
	.value	-27808
	.long	.LC42
	.long	.LC5284
	.value	4131
	.value	-27774
	.long	.LC5285
	.long	.LC42
	.value	4131
	.value	-27773
	.long	.LC5286
	.long	.LC42
	.value	4131
	.value	-27771
	.long	.LC5287
	.long	.LC42
	.value	4131
	.value	-27770
	.long	.LC5288
	.long	.LC5266
	.value	4131
	.value	-27768
	.long	.LC5289
	.long	.LC5266
	.value	4131
	.value	-27753
	.long	.LC5290
	.long	.LC5291
	.value	4131
	.value	-27750
	.long	.LC5292
	.long	.LC5266
	.value	4131
	.value	-27616
	.long	.LC5293
	.long	.LC5294
	.value	4131
	.value	-27600
	.long	.LC5295
	.long	.LC2878
	.value	4131
	.value	-27584
	.long	.LC5296
	.long	.LC5297
	.value	4131
	.value	-27552
	.long	.LC5298
	.long	.LC5282
	.value	4131
	.value	-27536
	.long	.LC5299
	.long	.LC42
	.value	4131
	.value	-27360
	.long	.LC5300
	.long	.LC5266
	.value	4131
	.value	-27355
	.long	.LC5301
	.long	.LC5266
	.value	4131
	.value	-27328
	.long	.LC5302
	.long	.LC5303
	.value	4131
	.value	-27040
	.long	.LC5304
	.long	.LC2878
	.value	4131
	.value	-27008
	.long	.LC5305
	.long	.LC2878
	.value	4131
	.value	-27006
	.long	.LC5296
	.long	.LC5306
	.value	4131
	.value	-27005
	.long	.LC5307
	.long	.LC2878
	.value	4131
	.value	-27003
	.long	.LC5308
	.long	.LC5309
	.value	4131
	.value	-26800
	.long	.LC5310
	.long	.LC5311
	.value	4131
	.value	-26797
	.long	.LC5312
	.long	.LC5266
	.value	4131
	.value	-26796
	.long	.LC5312
	.long	.LC5313
	.value	4131
	.value	-26791
	.long	.LC5314
	.long	.LC5315
	.value	4131
	.value	-26749
	.long	.LC5316
	.long	.LC42
	.value	4131
	.value	-26747
	.long	.LC5317
	.long	.LC42
	.value	4131
	.value	-26544
	.long	.LC5318
	.long	.LC5319
	.value	4131
	.value	-26496
	.long	.LC5320
	.long	.LC5321
	.value	4131
	.value	-26352
	.long	.LC5322
	.long	.LC5279
	.value	4131
	.value	-26320
	.long	.LC5323
	.long	.LC42
	.value	4131
	.value	-26272
	.long	.LC5324
	.long	.LC5325
	.value	4133
	.value	40
	.long	.LC5326
	.long	.LC5327
	.value	4133
	.value	5173
	.long	.LC5328
	.long	.LC5329
	.value	4133
	.value	5189
	.long	.LC5330
	.long	.LC5331
	.value	4133
	.value	5193
	.long	.LC5332
	.long	.LC4336
	.value	4133
	.value	5201
	.long	.LC5333
	.long	.LC5334
	.value	4133
	.value	5217
	.long	.LC5335
	.long	.LC5336
	.value	4133
	.value	5257
	.long	.LC5337
	.long	.LC42
	.value	4133
	.value	5393
	.long	.LC5338
	.long	.LC42
	.value	4133
	.value	5394
	.long	.LC5339
	.long	.LC42
	.value	4133
	.value	5395
	.long	.LC5340
	.long	.LC42
	.value	4133
	.value	5409
	.long	.LC5341
	.long	.LC4923
	.value	4133
	.value	5411
	.long	.LC5342
	.long	.LC4336
	.value	4133
	.value	5425
	.long	.LC5343
	.long	.LC5231
	.value	4133
	.value	5427
	.long	.LC5344
	.long	.LC5345
	.value	4133
	.value	5429
	.long	.LC5346
	.long	.LC5347
	.value	4133
	.value	5441
	.long	.LC5348
	.long	.LC5349
	.value	4133
	.value	5442
	.long	.LC5350
	.long	.LC5351
	.value	4133
	.value	5443
	.long	.LC5352
	.long	.LC5353
	.value	4133
	.value	5473
	.long	.LC5354
	.long	.LC2667
	.value	4133
	.value	5665
	.long	.LC5355
	.long	.LC5356
	.value	4133
	.value	5681
	.long	.LC5357
	.long	.LC5358
	.value	4133
	.value	5697
	.long	.LC5359
	.long	.LC5360
	.value	4133
	.value	12609
	.long	.LC5361
	.long	.LC2878
	.value	4133
	.value	12611
	.long	.LC5362
	.long	.LC2878
	.value	4133
	.value	12613
	.long	.LC5363
	.long	.LC2878
	.value	4133
	.value	12615
	.long	.LC5364
	.long	.LC2878
	.value	4133
	.value	12617
	.long	.LC5365
	.long	.LC2878
	.value	4133
	.value	12625
	.long	.LC5366
	.long	.LC2878
	.value	4133
	.value	13063
	.long	.LC5367
	.long	.LC5368
	.value	4133
	.value	13065
	.long	.LC5369
	.long	.LC5370
	.value	4133
	.value	21010
	.long	.LC5371
	.long	.LC42
	.value	4133
	.value	21013
	.long	.LC5372
	.long	.LC3314
	.value	4133
	.value	21015
	.long	.LC5372
	.long	.LC5373
	.value	4133
	.value	21017
	.long	.LC5374
	.long	.LC5373
	.value	4133
	.value	21029
	.long	.LC5375
	.long	.LC3314
	.value	4133
	.value	21033
	.long	.LC5376
	.long	.LC3314
	.value	4133
	.value	21045
	.long	.LC5377
	.long	.LC5373
	.value	4133
	.value	21047
	.long	.LC5378
	.long	.LC5379
	.value	4133
	.value	21049
	.long	.LC42
	.long	.LC42
	.value	4133
	.value	21056
	.long	.LC42
	.long	.LC3314
	.value	4133
	.value	21057
	.long	.LC42
	.long	.LC3195
	.value	4133
	.value	21058
	.long	.LC42
	.long	.LC5380
	.value	4133
	.value	21059
	.long	.LC42
	.long	.LC2519
	.value	4133
	.value	21060
	.long	.LC42
	.long	.LC5381
	.value	4133
	.value	21063
	.long	.LC5348
	.long	.LC5007
	.value	4133
	.value	21543
	.long	.LC42
	.long	.LC4834
	.value	4133
	.value	21585
	.long	.LC5382
	.long	.LC5383
	.value	4133
	.value	21587
	.long	.LC5384
	.long	.LC5385
	.value	4133
	.value	28929
	.long	.LC5386
	.long	.LC5387
	.value	4136
	.value	1
	.long	.LC5388
	.long	.LC5389
	.value	4136
	.value	2
	.long	.LC5390
	.long	.LC5391
	.value	4136
	.value	3
	.long	.LC5392
	.long	.LC5391
	.value	4136
	.value	4
	.long	.LC5392
	.long	.LC5391
	.value	4136
	.value	5
	.long	.LC5390
	.long	.LC5391
	.value	4136
	.value	6
	.long	.LC5390
	.long	.LC5391
	.value	4136
	.value	7
	.long	.LC42
	.long	.LC5393
	.value	4136
	.value	8
	.long	.LC5390
	.long	.LC5394
	.value	4136
	.value	10
	.long	.LC5390
	.long	.LC5391
	.value	4136
	.value	12
	.long	.LC5395
	.long	.LC5396
	.value	4136
	.value	13
	.long	.LC2432
	.long	.LC5397
	.value	4136
	.value	14
	.long	.LC5398
	.long	.LC5399
	.value	4136
	.value	17
	.long	.LC5400
	.long	.LC5401
	.value	4136
	.value	18
	.long	.LC5402
	.long	.LC5403
	.value	4136
	.value	19
	.long	.LC5404
	.long	.LC5391
	.value	4136
	.value	20
	.long	.LC5405
	.long	.LC5406
	.value	4136
	.value	21
	.long	.LC5407
	.long	.LC5408
	.value	4136
	.value	300
	.long	.LC5409
	.long	.LC5410
	.value	4136
	.value	647
	.long	.LC5411
	.long	.LC5412
	.value	4136
	.value	4096
	.long	.LC5413
	.long	.LC5414
	.value	4136
	.value	7948
	.long	.LC5415
	.long	.LC5416
	.value	4138
	.value	0
	.long	.LC5417
	.long	.LC5418
	.value	4138
	.value	16
	.long	.LC5419
	.long	.LC5420
	.value	4138
	.value	-26506
	.long	.LC5417
	.long	.LC5421
	.value	4139
	.value	16
	.long	.LC5422
	.long	.LC5423
	.value	4139
	.value	64
	.long	.LC5424
	.long	.LC5425
	.value	4139
	.value	81
	.long	.LC5426
	.long	.LC5427
	.value	4139
	.value	1304
	.long	.LC5428
	.long	.LC5429
	.value	4139
	.value	1305
	.long	.LC5430
	.long	.LC5431
	.value	4139
	.value	1306
	.long	.LC5432
	.long	.LC5433
	.value	4139
	.value	1307
	.long	.LC5426
	.long	.LC118
	.value	4139
	.value	1310
	.long	.LC5434
	.long	.LC5435
	.value	4139
	.value	1311
	.long	.LC5436
	.long	.LC5437
	.value	4139
	.value	1312
	.long	.LC5438
	.long	.LC5439
	.value	4139
	.value	1313
	.long	.LC5438
	.long	.LC5439
	.value	4139
	.value	1314
	.long	.LC5440
	.long	.LC5441
	.value	4139
	.value	1317
	.long	.LC5442
	.long	.LC5443
	.value	4139
	.value	1319
	.long	.LC5444
	.long	.LC42
	.value	4139
	.value	1320
	.long	.LC5445
	.long	.LC5446
	.value	4139
	.value	3344
	.long	.LC5422
	.long	.LC5447
	.value	4139
	.value	4096
	.long	.LC5448
	.long	.LC5449
	.value	4139
	.value	4097
	.long	.LC5448
	.long	.LC5450
	.value	4139
	.value	5413
	.long	.LC5451
	.long	.LC42
	.value	4139
	.value	5415
	.long	.LC5452
	.long	.LC42
	.value	4139
	.value	8199
	.long	.LC5437
	.long	.LC5453
	.value	4139
	.value	9511
	.long	.LC5454
	.long	.LC5455
	.value	4139
	.value	9527
	.long	.LC5456
	.long	.LC5457
	.value	4139
	.value	9528
	.long	.LC5458
	.long	.LC5458
	.value	4139
	.value	17718
	.long	.LC5459
	.long	.LC5460
	.value	4139
	.value	1314
	.long	.LC5461
	.long	.LC5462
	.value	4139
	.value	1317
	.long	.LC5463
	.long	.LC5464
	.value	4139
	.value	25971
	.long	.LC5465
	.long	.LC5466
	.value	4139
	.value	-32608
	.long	.LC5467
	.long	.LC2582
	.value	4139
	.value	-26506
	.long	.LC5468
	.long	.LC5469
	.value	4140
	.value	184
	.long	.LC5470
	.long	.LC5471
	.value	4140
	.value	192
	.long	.LC5472
	.long	.LC5473
	.value	4140
	.value	208
	.long	.LC5474
	.long	.LC5475
	.value	4140
	.value	216
	.long	.LC5476
	.long	.LC5477
	.value	4140
	.value	220
	.long	.LC5478
	.long	.LC2878
	.value	4140
	.value	224
	.long	.LC5479
	.long	.LC5480
	.value	4140
	.value	228
	.long	.LC5481
	.long	.LC5482
	.value	4140
	.value	229
	.long	.LC5483
	.long	.LC5484
	.value	4140
	.value	240
	.long	.LC5485
	.long	.LC5486
	.value	4140
	.value	244
	.long	.LC5485
	.long	.LC5487
	.value	4140
	.value	245
	.long	.LC5488
	.long	.LC5489
	.value	4140
	.value	480
	.long	.LC5490
	.long	.LC5491
	.value	4140
	.value	3120
	.long	.LC5492
	.long	.LC5473
	.value	4141
	.value	20700
	.long	.LC2515
	.long	.LC2514
	.value	4143
	.value	9
	.long	.LC5493
	.long	.LC4923
	.value	4143
	.value	10
	.long	.LC5494
	.long	.LC5495
	.value	4143
	.value	32
	.long	.LC5496
	.long	.LC5497
	.value	4143
	.value	48
	.long	.LC5498
	.long	.LC5499
	.value	4143
	.value	49
	.long	.LC5500
	.long	.LC5501
	.value	4143
	.value	261
	.long	.LC5502
	.long	.LC5503
	.value	4143
	.value	262
	.long	.LC5502
	.long	.LC5504
	.value	4143
	.value	263
	.long	.LC5502
	.long	.LC5505
	.value	4143
	.value	264
	.long	.LC5502
	.long	.LC5506
	.value	4143
	.value	384
	.long	.LC5507
	.long	.LC5508
	.value	4143
	.value	385
	.long	.LC5509
	.long	.LC5510
	.value	4143
	.value	386
	.long	.LC5511
	.long	.LC5510
	.value	4145
	.value	22017
	.long	.LC5512
	.long	.LC5513
	.value	4145
	.value	22023
	.long	.LC5514
	.long	.LC5515
	.value	4145
	.value	22065
	.long	.LC5516
	.long	.LC42
	.value	4145
	.value	24663
	.long	.LC5517
	.long	.LC5518
	.value	4147
	.value	1
	.long	.LC5519
	.long	.LC5520
	.value	4147
	.value	2
	.long	.LC42
	.long	.LC5521
	.value	4147
	.value	3
	.long	.LC42
	.long	.LC5122
	.value	4147
	.value	4
	.long	.LC5522
	.long	.LC5523
	.value	4147
	.value	5
	.long	.LC5524
	.long	.LC5525
	.value	4147
	.value	6
	.long	.LC42
	.long	.LC2878
	.value	4147
	.value	7
	.long	.LC5526
	.long	.LC5527
	.value	4147
	.value	8
	.long	.LC42
	.long	.LC5528
	.value	4147
	.value	9
	.long	.LC42
	.long	.LC5529
	.value	4147
	.value	26
	.long	.LC5530
	.long	.LC42
	.value	4147
	.value	29
	.long	.LC5531
	.long	.LC5532
	.value	4147
	.value	33
	.long	.LC5533
	.long	.LC5534
	.value	4147
	.value	41
	.long	.LC5535
	.long	.LC2850
	.value	4147
	.value	42
	.long	.LC5536
	.long	.LC2850
	.value	4147
	.value	47
	.long	.LC5537
	.long	.LC5538
	.value	4147
	.value	53
	.long	.LC5539
	.long	.LC5540
	.value	4147
	.value	54
	.long	.LC5541
	.long	.LC5542
	.value	4147
	.value	62
	.long	.LC5543
	.long	.LC5544
	.value	4147
	.value	70
	.long	.LC5545
	.long	.LC2850
	.value	4147
	.value	90
	.long	.LC5546
	.long	.LC5547
	.value	4147
	.value	99
	.long	.LC5548
	.long	.LC5549
	.value	4147
	.value	103
	.long	.LC5550
	.long	.LC5551
	.value	4147
	.value	116
	.long	.LC42
	.long	.LC5552
	.value	4147
	.value	155
	.long	.LC5553
	.long	.LC42
	.value	4147
	.value	166
	.long	.LC42
	.long	.LC42
	.value	4147
	.value	190
	.long	.LC5554
	.long	.LC5555
	.value	4147
	.value	205
	.long	.LC5556
	.long	.LC5557
	.value	4147
	.value	206
	.long	.LC5558
	.long	.LC5557
	.value	4147
	.value	224
	.long	.LC5559
	.long	.LC5560
	.value	4147
	.value	231
	.long	.LC5561
	.long	.LC5562
	.value	4147
	.value	242
	.long	.LC5563
	.long	.LC5564
	.value	4147
	.value	1312
	.long	.LC5537
	.long	.LC5565
	.value	4147
	.value	10315
	.long	.LC3509
	.long	.LC3509
	.value	4150
	.value	0
	.long	.LC5566
	.long	.LC4437
	.value	4153
	.value	0
	.long	.LC42
	.long	.LC42
	.value	4153
	.value	0
	.long	.LC42
	.long	.LC42
	.value	4153
	.value	1
	.long	.LC5567
	.long	.LC5568
	.value	4153
	.value	2
	.long	.LC5569
	.long	.LC5570
	.value	4153
	.value	3
	.long	.LC5567
	.long	.LC5570
	.value	4153
	.value	5
	.long	.LC42
	.long	.LC5571
	.value	4153
	.value	6
	.long	.LC5572
	.long	.LC5573
	.value	4153
	.value	8
	.long	.LC5574
	.long	.LC5575
	.value	4153
	.value	9
	.long	.LC5576
	.long	.LC5577
	.value	4153
	.value	22
	.long	.LC5578
	.long	.LC3261
	.value	4153
	.value	24
	.long	.LC5579
	.long	.LC5580
	.value	4153
	.value	352
	.long	.LC5581
	.long	.LC5582
	.value	4153
	.value	384
	.long	.LC5583
	.long	.LC5584
	.value	4153
	.value	385
	.long	.LC2432
	.long	.LC5585
	.value	4153
	.value	386
	.long	.LC2432
	.long	.LC5586
	.value	4153
	.value	387
	.long	.LC5587
	.long	.LC5588
	.value	4153
	.value	390
	.long	.LC2432
	.long	.LC2432
	.value	4153
	.value	400
	.long	.LC5589
	.long	.LC5590
	.value	4153
	.value	401
	.long	.LC5591
	.long	.LC5591
	.value	4153
	.value	512
	.long	.LC5592
	.long	.LC5593
	.value	4153
	.value	516
	.long	.LC5594
	.long	.LC5595
	.value	4153
	.value	517
	.long	.LC5596
	.long	.LC5597
	.value	4153
	.value	768
	.long	.LC5598
	.long	.LC5599
	.value	4153
	.value	773
	.long	.LC5600
	.long	.LC5601
	.value	4153
	.value	789
	.long	.LC5602
	.long	.LC5603
	.value	4153
	.value	805
	.long	.LC5604
	.long	.LC5605
	.value	4153
	.value	816
	.long	.LC5598
	.long	.LC5606
	.value	4153
	.value	1030
	.long	.LC5607
	.long	.LC5573
	.value	4153
	.value	1174
	.long	.LC5608
	.long	.LC5329
	.value	4153
	.value	1328
	.long	.LC5609
	.long	.LC5610
	.value	4153
	.value	1344
	.long	.LC5611
	.long	.LC3645
	.value	4153
	.value	1360
	.long	.LC5612
	.long	.LC5231
	.value	4153
	.value	1430
	.long	.LC5613
	.long	.LC5614
	.value	4153
	.value	1431
	.long	.LC5615
	.long	.LC5616
	.value	4153
	.value	1537
	.long	.LC5617
	.long	.LC5618
	.value	4153
	.value	1568
	.long	.LC5619
	.long	.LC3645
	.value	4153
	.value	1584
	.long	.LC5620
	.long	.LC3645
	.value	4153
	.value	1589
	.long	.LC5621
	.long	.LC3645
	.value	4153
	.value	1600
	.long	.LC5622
	.long	.LC3645
	.value	4153
	.value	1605
	.long	.LC5623
	.long	.LC3645
	.value	4153
	.value	1606
	.long	.LC5624
	.long	.LC3645
	.value	4153
	.value	1608
	.long	.LC5625
	.long	.LC3645
	.value	4153
	.value	1609
	.long	.LC5626
	.long	.LC3645
	.value	4153
	.value	1616
	.long	.LC5627
	.long	.LC3645
	.value	4153
	.value	1617
	.long	.LC5628
	.long	.LC3645
	.value	4153
	.value	1621
	.long	.LC5629
	.long	.LC3645
	.value	4153
	.value	1622
	.long	.LC2366
	.long	.LC4369
	.value	4153
	.value	1624
	.long	.LC5630
	.long	.LC4369
	.value	4153
	.value	1625
	.long	.LC5631
	.long	.LC4369
	.value	4153
	.value	1632
	.long	.LC42
	.long	.LC3645
	.value	4153
	.value	1633
	.long	.LC5632
	.long	.LC4369
	.value	4153
	.value	1634
	.long	.LC2366
	.long	.LC4369
	.value	4153
	.value	1635
	.long	.LC2366
	.long	.LC4369
	.value	4153
	.value	1840
	.long	.LC5633
	.long	.LC3645
	.value	4153
	.value	1845
	.long	.LC5634
	.long	.LC3645
	.value	4153
	.value	1856
	.long	.LC5635
	.long	.LC3679
	.value	4153
	.value	1857
	.long	.LC5636
	.long	.LC4369
	.value	4153
	.value	1861
	.long	.LC5637
	.long	.LC3645
	.value	4153
	.value	1862
	.long	.LC5638
	.long	.LC3645
	.value	4153
	.value	1864
	.long	.LC5639
	.long	.LC4369
	.value	4153
	.value	1877
	.long	.LC5640
	.long	.LC3645
	.value	4153
	.value	1878
	.long	.LC5641
	.long	.LC4369
	.value	4153
	.value	1888
	.long	.LC5567
	.long	.LC5642
	.value	4153
	.value	1889
	.long	.LC5643
	.long	.LC5642
	.value	4153
	.value	1890
	.long	.LC2366
	.long	.LC5642
	.value	4153
	.value	2304
	.long	.LC5644
	.long	.LC5645
	.value	4153
	.value	2305
	.long	.LC5646
	.long	.LC5647
	.value	4153
	.value	2402
	.long	.LC5648
	.long	.LC3679
	.value	4153
	.value	2403
	.long	.LC5649
	.long	.LC2692
	.value	4153
	.value	2404
	.long	.LC5650
	.long	.LC3679
	.value	4153
	.value	2457
	.long	.LC5651
	.long	.LC5652
	.value	4153
	.value	4153
	.long	.LC5653
	.long	.LC5654
	.value	4153
	.value	4160
	.long	.LC42
	.long	.LC42
	.value	4153
	.value	4332
	.long	.LC42
	.long	.LC42
	.value	4153
	.value	4482
	.long	.LC2432
	.long	.LC5655
	.value	4153
	.value	4483
	.long	.LC5656
	.long	.LC5588
	.value	4153
	.value	4484
	.long	.LC5657
	.long	.LC5658
	.value	4153
	.value	4485
	.long	.LC5659
	.long	.LC3408
	.value	4153
	.value	13826
	.long	.LC5660
	.long	.LC2677
	.value	4153
	.value	20743
	.long	.LC5661
	.long	.LC5662
	.value	4153
	.value	21248
	.long	.LC5611
	.long	.LC5663
	.value	4153
	.value	21269
	.long	.LC5664
	.long	.LC2878
	.value	4153
	.value	21505
	.long	.LC5665
	.long	.LC5666
	.value	4153
	.value	21777
	.long	.LC5667
	.long	.LC5668
	.value	4153
	.value	21779
	.long	.LC5669
	.long	.LC3478
	.value	4153
	.value	21783
	.long	.LC5670
	.long	.LC4369
	.value	4153
	.value	21784
	.long	.LC5671
	.long	.LC5672
	.value	4153
	.value	21873
	.long	.LC5673
	.long	.LC5674
	.value	4153
	.value	21889
	.long	.LC5675
	.long	.LC5676
	.value	4153
	.value	21890
	.long	.LC5677
	.long	.LC2692
	.value	4153
	.value	21905
	.long	.LC5678
	.long	.LC5679
	.value	4153
	.value	21910
	.long	.LC5680
	.long	.LC5681
	.value	4153
	.value	21911
	.long	.LC5653
	.long	.LC5682
	.value	4153
	.value	22016
	.long	.LC5683
	.long	.LC3645
	.value	4153
	.value	22064
	.long	.LC5620
	.long	.LC3645
	.value	4153
	.value	22545
	.long	.LC42
	.long	.LC42
	.value	4153
	.value	25092
	.long	.LC5684
	.long	.LC5685
	.value	4153
	.value	25093
	.long	.LC5686
	.long	.LC5687
	.value	4153
	.value	25125
	.long	.LC5688
	.long	.LC5597
	.value	4153
	.value	25142
	.long	.LC5689
	.long	.LC5690
	.value	4153
	.value	25344
	.long	.LC5691
	.long	.LC5599
	.value	4153
	.value	25350
	.long	.LC5692
	.long	.LC5693
	.value	4153
	.value	25381
	.long	.LC5694
	.long	.LC5695
	.value	4153
	.value	25382
	.long	.LC5696
	.long	.LC5697
	.value	4153
	.value	25392
	.long	.LC5698
	.long	.LC5699
	.value	4153
	.value	26994
	.long	.LC42
	.long	.LC42
	.value	4153
	.value	28673
	.long	.LC5700
	.long	.LC3650
	.value	4153
	.value	28674
	.long	.LC5700
	.long	.LC5701
	.value	4153
	.value	28677
	.long	.LC5702
	.long	.LC5703
	.value	4153
	.value	28679
	.long	.LC5696
	.long	.LC5704
	.value	4153
	.value	28690
	.long	.LC5705
	.long	.LC5706
	.value	4153
	.value	28691
	.long	.LC5707
	.long	.LC5708
	.value	4153
	.value	28693
	.long	.LC5709
	.long	.LC5710
	.value	4153
	.value	28694
	.long	.LC5711
	.long	.LC5712
	.value	4153
	.value	28696
	.long	.LC5713
	.long	.LC5714
	.value	4153
	.value	28697
	.long	.LC5612
	.long	.LC5715
	.value	4153
	.value	29440
	.long	.LC5707
	.long	.LC5599
	.value	4153
	.value	29954
	.long	.LC5716
	.long	.LC2432
	.value	4153
	.value	-32455
	.long	.LC42
	.long	.LC42
	.value	4153
	.value	-26506
	.long	.LC5717
	.long	.LC5718
	.value	4153
	.value	5811
	.long	.LC42
	.long	.LC42
	.value	4156
	.value	36
	.long	.LC2432
	.long	.LC5719
	.value	4156
	.value	4101
	.long	.LC5720
	.long	.LC5721
	.value	4156
	.value	4104
	.long	.LC5722
	.long	.LC5723
	.value	4156
	.value	4106
	.long	.LC5724
	.long	.LC5725
	.value	4156
	.value	4136
	.long	.LC42
	.long	.LC5726
	.value	4156
	.value	4137
	.long	.LC5727
	.long	.LC5728
	.value	4156
	.value	4138
	.long	.LC5729
	.long	.LC5730
	.value	4156
	.value	4144
	.long	.LC5731
	.long	.LC5732
	.value	4156
	.value	4145
	.long	.LC5733
	.long	.LC5734
	.value	4156
	.value	4160
	.long	.LC5735
	.long	.LC5736
	.value	4156
	.value	4161
	.long	.LC5737
	.long	.LC5738
	.value	4156
	.value	4162
	.long	.LC5739
	.long	.LC5740
	.value	4156
	.value	4168
	.long	.LC5741
	.long	.LC42
	.value	4156
	.value	4169
	.long	.LC5742
	.long	.LC42
	.value	4156
	.value	4170
	.long	.LC5743
	.long	.LC42
	.value	4156
	.value	4171
	.long	.LC5744
	.long	.LC42
	.value	4156
	.value	4173
	.long	.LC5745
	.long	.LC5746
	.value	4156
	.value	4196
	.long	.LC5747
	.long	.LC5748
	.value	4156
	.value	4289
	.long	.LC42
	.long	.LC5749
	.value	4156
	.value	4333
	.long	.LC5750
	.long	.LC3930
	.value	4156
	.value	4608
	.long	.LC5751
	.long	.LC5752
	.value	4156
	.value	4633
	.long	.LC42
	.long	.LC5753
	.value	4156
	.value	4634
	.long	.LC42
	.long	.LC5754
	.value	4156
	.value	4635
	.long	.LC42
	.long	.LC5755
	.value	4156
	.value	4636
	.long	.LC42
	.long	.LC5756
	.value	4156
	.value	4649
	.long	.LC5757
	.long	.LC5758
	.value	4156
	.value	4650
	.long	.LC5757
	.long	.LC5373
	.value	4156
	.value	4651
	.long	.LC5757
	.long	.LC5759
	.value	4156
	.value	4858
	.long	.LC5760
	.long	.LC5761
	.value	4156
	.value	8221
	.long	.LC2432
	.long	.LC5762
	.value	4156
	.value	10512
	.long	.LC5763
	.long	.LC5764
	.value	4156
	.value	10528
	.long	.LC42
	.long	.LC5765
	.value	4156
	.value	10532
	.long	.LC5766
	.long	.LC5767
	.value	4156
	.value	10533
	.long	.LC5768
	.long	.LC5769
	.value	4156
	.value	10534
	.long	.LC5770
	.long	.LC5771
	.value	4156
	.value	10535
	.long	.LC5772
	.long	.LC5773
	.value	4156
	.value	10560
	.long	.LC5774
	.long	.LC5775
	.value	4156
	.value	12806
	.long	.LC2626
	.long	.LC5776
	.value	4156
	.value	12807
	.long	.LC5777
	.long	.LC5777
	.value	4156
	.value	12832
	.long	.LC5778
	.long	.LC5779
	.value	4156
	.value	12848
	.long	.LC5780
	.long	.LC5780
	.value	4156
	.value	13058
	.long	.LC5781
	.long	.LC2626
	.value	4156
	.value	21601
	.long	.LC2626
	.long	.LC5782
	.value	4163
	.value	1653
	.long	.LC5783
	.long	.LC5784
	.value	4163
	.value	6505
	.long	.LC42
	.long	.LC42
	.value	4163
	.value	22099
	.long	.LC5785
	.long	.LC5786
	.value	4164
	.value	4114
	.long	.LC5787
	.long	.LC5788
	.value	4164
	.value	-23552
	.long	.LC5789
	.long	.LC5790
	.value	4164
	.value	-23296
	.long	.LC42
	.long	.LC3333
	.value	4164
	.value	-23295
	.long	.LC42
	.long	.LC5791
	.value	4164
	.value	-23279
	.long	.LC5792
	.long	.LC5793
	.value	4165
	.value	5
	.long	.LC42
	.long	.LC42
	.value	4165
	.value	-24328
	.long	.LC5794
	.long	.LC5795
	.value	4165
	.value	-16127
	.long	.LC5796
	.long	.LC2878
	.value	4165
	.value	-16008
	.long	.LC5797
	.long	.LC5798
	.value	4165
	.value	-15018
	.long	.LC5799
	.long	.LC5800
	.value	4165
	.value	-15017
	.long	.LC5801
	.long	.LC5802
	.value	4165
	.value	-15016
	.long	.LC5803
	.long	.LC5099
	.value	4165
	.value	-15001
	.long	.LC5794
	.long	.LC5804
	.value	4165
	.value	-15000
	.long	.LC5794
	.long	.LC5805
	.value	4165
	.value	-14999
	.long	.LC5806
	.long	.LC5807
	.value	4165
	.value	-14815
	.long	.LC5808
	.long	.LC5809
	.value	4165
	.value	-14592
	.long	.LC5810
	.long	.LC5811
	.value	4165
	.value	-14591
	.long	.LC5812
	.long	.LC5813
	.value	4165
	.value	-14316
	.long	.LC5814
	.long	.LC5815
	.value	4165
	.value	-14302
	.long	.LC5816
	.long	.LC5817
	.value	4165
	.value	-14300
	.long	.LC5818
	.long	.LC5819
	.value	4165
	.value	-14299
	.long	.LC5820
	.long	.LC5821
	.value	4165
	.value	-14286
	.long	.LC5822
	.long	.LC5823
	.value	4165
	.value	-14239
	.long	.LC5824
	.long	.LC5825
	.value	4165
	.value	-14207
	.long	.LC5826
	.long	.LC5827
	.value	4165
	.value	-14187
	.long	.LC5828
	.long	.LC42
	.value	4165
	.value	-14031
	.long	.LC5829
	.long	.LC5830
	.value	4165
	.value	-14027
	.long	.LC5831
	.long	.LC5832
	.value	4165
	.value	-10904
	.long	.LC5833
	.long	.LC5834
	.value	4165
	.value	-10392
	.long	.LC5794
	.long	.LC5835
	.value	4168
	.value	595
	.long	.LC5836
	.long	.LC5837
	.value	4168
	.value	3168
	.long	.LC5838
	.long	.LC5839
	.value	4168
	.value	3185
	.long	.LC5840
	.long	.LC5841
	.value	4168
	.value	4096
	.long	.LC5842
	.long	.LC2543
	.value	4168
	.value	12288
	.long	.LC5843
	.long	.LC42
	.value	4168
	.value	-30463
	.long	.LC42
	.long	.LC5844
	.value	4170
	.value	8
	.long	.LC5845
	.long	.LC5846
	.value	4170
	.value	9
	.long	.LC5847
	.long	.LC42
	.value	4170
	.value	16
	.long	.LC5848
	.long	.LC5849
	.value	4170
	.value	521
	.long	.LC5850
	.long	.LC5851
	.value	4170
	.value	522
	.long	.LC5852
	.long	.LC5231
	.value	4170
	.value	528
	.long	.LC5853
	.long	.LC4336
	.value	4170
	.value	538
	.long	.LC5854
	.long	.LC4336
	.value	4170
	.value	539
	.long	.LC5855
	.long	.LC4336
	.value	4170
	.value	552
	.long	.LC5853
	.long	.LC2677
	.value	4170
	.value	560
	.long	.LC5853
	.long	.LC3260
	.value	4170
	.value	1280
	.long	.LC5856
	.long	.LC5857
	.value	4170
	.value	2433
	.long	.LC42
	.long	.LC5712
	.value	4170
	.value	5958
	.long	.LC5858
	.long	.LC42
	.value	4170
	.value	10100
	.long	.LC5859
	.long	.LC5860
	.value	4170
	.value	13600
	.long	.LC42
	.long	.LC5861
	.value	4172
	.value	334
	.long	.LC5862
	.long	.LC5863
	.value	4172
	.value	1280
	.long	.LC5864
	.long	.LC5865
	.value	4172
	.value	1288
	.long	.LC5866
	.long	.LC5867
	.value	4172
	.value	4096
	.long	.LC5868
	.long	.LC42
	.value	4172
	.value	4172
	.long	.LC5869
	.long	.LC5870
	.value	4172
	.value	15620
	.long	.LC5871
	.long	.LC2857
	.value	4172
	.value	15623
	.long	.LC5872
	.long	.LC5873
	.value	4172
	.value	-32768
	.long	.LC5874
	.long	.LC5875
	.value	4172
	.value	-32759
	.long	.LC5876
	.long	.LC5877
	.value	4172
	.value	-32752
	.long	.LC5878
	.long	.LC5879
	.value	4172
	.value	-32751
	.long	.LC5880
	.long	.LC5881
	.value	4172
	.value	-32745
	.long	.LC5882
	.long	.LC5881
	.value	4172
	.value	-32743
	.long	.LC5883
	.long	.LC5877
	.value	4172
	.value	-32736
	.long	.LC5878
	.long	.LC5877
	.value	4172
	.value	-32735
	.long	.LC5884
	.long	.LC5885
	.value	4172
	.value	-32733
	.long	.LC5886
	.long	.LC5887
	.value	4172
	.value	-32732
	.long	.LC5888
	.long	.LC5889
	.value	4172
	.value	-32731
	.long	.LC5890
	.long	.LC5891
	.value	4172
	.value	-32730
	.long	.LC5892
	.long	.LC5893
	.value	4172
	.value	-32729
	.long	.LC5894
	.long	.LC5881
	.value	4172
	.value	-32727
	.long	.LC5895
	.long	.LC5896
	.value	4172
	.value	-32722
	.long	.LC5897
	.long	.LC5898
	.value	4172
	.value	-32717
	.long	.LC5899
	.long	.LC5900
	.value	4172
	.value	-32716
	.long	.LC5901
	.long	.LC4187
	.value	4172
	.value	-32715
	.long	.LC4832
	.long	.LC5902
	.value	4172
	.value	-32714
	.long	.LC5903
	.long	.LC5904
	.value	4172
	.value	-32712
	.long	.LC5905
	.long	.LC5906
	.value	4172
	.value	-32710
	.long	.LC5907
	.long	.LC5908
	.value	4172
	.value	-32709
	.long	.LC5909
	.long	.LC5910
	.value	4172
	.value	-32708
	.long	.LC5907
	.long	.LC4187
	.value	4172
	.value	-32707
	.long	.LC4832
	.long	.LC5911
	.value	4172
	.value	-32487
	.long	.LC4793
	.long	.LC5912
	.value	4172
	.value	-32255
	.long	.LC5913
	.long	.LC5914
	.value	4172
	.value	-32252
	.long	.LC5915
	.long	.LC5916
	.value	4172
	.value	-32207
	.long	.LC5917
	.long	.LC5918
	.value	4172
	.value	-31744
	.long	.LC5919
	.long	.LC5920
	.value	4172
	.value	-31119
	.long	.LC5921
	.long	.LC5921
	.value	4172
	.value	-28571
	.long	.LC5922
	.long	.LC5923
	.value	4172
	.value	-28570
	.long	.LC5924
	.long	.LC5925
	.value	4172
	.value	-24575
	.long	.LC5926
	.long	.LC5927
	.value	4172
	.value	-24320
	.long	.LC5928
	.long	.LC5929
	.value	4172
	.value	-24318
	.long	.LC5930
	.long	.LC5931
	.value	4172
	.value	-24314
	.long	.LC5932
	.long	.LC5923
	.value	4172
	.value	-24186
	.long	.LC5933
	.long	.LC5934
	.value	4172
	.value	-22488
	.long	.LC5935
	.long	.LC3793
	.value	4172
	.value	-21488
	.long	.LC5936
	.long	.LC5937
	.value	4172
	.value	-21487
	.long	.LC5938
	.long	.LC5937
	.value	4172
	.value	-21486
	.long	.LC5939
	.long	.LC5940
	.value	4172
	.value	-21485
	.long	.LC5941
	.long	.LC5942
	.value	4172
	.value	-21483
	.long	.LC5943
	.long	.LC2440
	.value	4172
	.value	-21482
	.long	.LC5944
	.long	.LC5945
	.value	4172
	.value	-21481
	.long	.LC5946
	.long	.LC2440
	.value	4172
	.value	-21480
	.long	.LC5947
	.long	.LC5940
	.value	4172
	.value	-21479
	.long	.LC5948
	.long	.LC5940
	.value	4172
	.value	-21478
	.long	.LC5949
	.long	.LC5940
	.value	4172
	.value	-21477
	.long	.LC5950
	.long	.LC5940
	.value	4172
	.value	-21474
	.long	.LC5951
	.long	.LC5952
	.value	4172
	.value	-21473
	.long	.LC5953
	.long	.LC5940
	.value	4172
	.value	-21472
	.long	.LC5954
	.long	.LC2519
	.value	4172
	.value	-21471
	.long	.LC5955
	.long	.LC2519
	.value	4172
	.value	-21470
	.long	.LC5956
	.long	.LC5134
	.value	4172
	.value	-21469
	.long	.LC5957
	.long	.LC3793
	.value	4172
	.value	-21464
	.long	.LC5958
	.long	.LC3793
	.value	4172
	.value	-21456
	.long	.LC5947
	.long	.LC5940
	.value	4172
	.value	-21440
	.long	.LC5880
	.long	.LC5940
	.value	4172
	.value	-21439
	.long	.LC5882
	.long	.LC5940
	.value	4172
	.value	-21438
	.long	.LC5894
	.long	.LC5940
	.value	4172
	.value	-21437
	.long	.LC5959
	.long	.LC5940
	.value	4172
	.value	-21436
	.long	.LC5960
	.long	.LC5961
	.value	4172
	.value	-21434
	.long	.LC5962
	.long	.LC5963
	.value	4172
	.value	-21433
	.long	.LC5964
	.long	.LC5965
	.value	4172
	.value	-21424
	.long	.LC5966
	.long	.LC5967
	.value	4172
	.value	-21423
	.long	.LC5968
	.long	.LC5969
	.value	4172
	.value	-21422
	.long	.LC5970
	.long	.LC5940
	.value	4172
	.value	-21421
	.long	.LC5971
	.long	.LC5972
	.value	4172
	.value	-21420
	.long	.LC5973
	.long	.LC5974
	.value	4172
	.value	-21419
	.long	.LC5975
	.long	.LC5963
	.value	4172
	.value	-21418
	.long	.LC5976
	.long	.LC5963
	.value	4172
	.value	-21417
	.long	.LC5977
	.long	.LC5963
	.value	4172
	.value	-21416
	.long	.LC5978
	.long	.LC5963
	.value	4172
	.value	-21415
	.long	.LC5979
	.long	.LC5974
	.value	4172
	.value	-21414
	.long	.LC5980
	.long	.LC5974
	.value	4172
	.value	-21408
	.long	.LC2476
	.long	.LC5981
	.value	4172
	.value	-21362
	.long	.LC5897
	.long	.LC2440
	.value	4172
	.value	-21361
	.long	.LC5982
	.long	.LC5983
	.value	4172
	.value	-20480
	.long	.LC5984
	.long	.LC5985
	.value	4172
	.value	-20479
	.long	.LC5986
	.long	.LC5987
	.value	4172
	.value	-512
	.long	.LC5988
	.long	.LC5989
	.value	4172
	.value	-509
	.long	.LC5990
	.long	.LC5989
	.value	4173
	.value	-32759
	.long	.LC5991
	.long	.LC5992
	.value	4173
	.value	-32711
	.long	.LC5993
	.long	.LC5994
	.value	4173
	.value	-32682
	.long	.LC5995
	.long	.LC5996
	.value	4173
	.value	-32630
	.long	.LC5997
	.long	.LC5703
	.value	4174
	.value	23
	.long	.LC5998
	.long	.LC42
	.value	4174
	.value	263
	.long	.LC5999
	.long	.LC6000
	.value	4174
	.value	265
	.long	.LC42
	.long	.LC6001
	.value	4174
	.value	535
	.long	.LC6002
	.long	.LC42
	.value	4174
	.value	791
	.long	.LC6003
	.long	.LC42
	.value	4174
	.value	1553
	.long	.LC6004
	.long	.LC6005
	.value	4175
	.value	4175
	.long	.LC6006
	.long	.LC6007
	.value	4176
	.value	26258
	.long	.LC6008
	.long	.LC6009
	.value	4176
	.value	0
	.long	.LC6010
	.long	.LC6011
	.value	4176
	.value	1
	.long	.LC6012
	.long	.LC6013
	.value	4176
	.value	51
	.long	.LC6014
	.long	.LC6015
	.value	4176
	.value	261
	.long	.LC6016
	.long	.LC2671
	.value	4176
	.value	1576
	.long	.LC6017
	.long	.LC6018
	.value	4176
	.value	2112
	.long	.LC6019
	.long	.LC6020
	.value	4176
	.value	2368
	.long	.LC6021
	.long	.LC6022
	.value	4176
	.value	4176
	.long	.LC6023
	.long	.LC6024
	.value	4176
	.value	23130
	.long	.LC6025
	.long	.LC6026
	.value	4176
	.value	26258
	.long	.LC6027
	.long	.LC6009
	.value	4176
	.value	-26335
	.long	.LC6028
	.long	.LC6029
	.value	4176
	.value	-26334
	.long	.LC6030
	.long	.LC6031
	.value	4176
	.value	-26272
	.long	.LC6032
	.long	.LC5019
	.value	4176
	.value	-26271
	.long	.LC6033
	.long	.LC6034
	.value	4176
	.value	-26256
	.long	.LC6035
	.long	.LC6036
	.value	4176
	.value	-26255
	.long	.LC6037
	.long	.LC6037
	.value	4176
	.value	26258
	.long	.LC42
	.long	.LC42
	.value	4177
	.value	256
	.long	.LC6038
	.long	.LC42
	.value	4180
	.value	3
	.long	.LC42
	.long	.LC42
	.value	4180
	.value	1
	.long	.LC42
	.long	.LC3333
	.value	4180
	.value	2
	.long	.LC42
	.long	.LC6039
	.value	4180
	.value	13573
	.long	.LC6040
	.long	.LC6041
	.value	4181
	.value	2064
	.long	.LC42
	.long	.LC6042
	.value	4181
	.value	2338
	.long	.LC42
	.long	.LC6043
	.value	4181
	.value	2342
	.long	.LC6044
	.long	.LC4336
	.value	4181
	.value	-28368
	.long	.LC6045
	.long	.LC6046
	.value	4181
	.value	-27552
	.long	.LC6045
	.long	.LC6047
	.value	4181
	.value	-27551
	.long	.LC6045
	.long	.LC6048
	.value	4181
	.value	-27550
	.long	.LC6045
	.long	.LC6049
	.value	4181
	.value	-27549
	.long	.LC6045
	.long	.LC6050
	.value	4181
	.value	-7136
	.long	.LC6051
	.long	.LC6052
	.value	4183
	.value	22016
	.long	.LC6053
	.long	.LC6054
	.value	4183
	.value	1
	.long	.LC6055
	.long	.LC6056
	.value	4183
	.value	2
	.long	.LC6057
	.long	.LC6058
	.value	4183
	.value	3
	.long	.LC6059
	.long	.LC6060
	.value	4183
	.value	4
	.long	.LC6061
	.long	.LC6062
	.value	4183
	.value	6
	.long	.LC6063
	.long	.LC6060
	.value	4183
	.value	256
	.long	.LC6064
	.long	.LC6065
	.value	4183
	.value	1073
	.long	.LC6066
	.long	.LC6067
	.value	4183
	.value	6145
	.long	.LC6068
	.long	.LC6069
	.value	4183
	.value	6146
	.long	.LC6070
	.long	.LC6071
	.value	4183
	.value	6336
	.long	.LC6072
	.long	.LC6073
	.value	4183
	.value	12370
	.long	.LC6074
	.long	.LC6075
	.value	4183
	.value	12373
	.long	.LC6076
	.long	.LC6077
	.value	4183
	.value	12375
	.long	.LC6078
	.long	.LC3859
	.value	4183
	.value	13345
	.long	.LC6079
	.long	.LC6080
	.value	4183
	.value	18433
	.long	.LC6081
	.long	.LC6082
	.value	4183
	.value	18434
	.long	.LC6083
	.long	.LC6084
	.value	4183
	.value	18435
	.long	.LC6085
	.long	.LC42
	.value	4183
	.value	18438
	.long	.LC6086
	.long	.LC42
	.value	4183
	.value	18441
	.long	.LC6087
	.long	.LC6088
	.value	4183
	.value	22016
	.long	.LC6089
	.long	.LC6090
	.value	4183
	.value	22018
	.long	.LC6076
	.long	.LC6091
	.value	4183
	.value	22024
	.long	.LC6092
	.long	.LC6093
	.value	4183
	.value	22531
	.long	.LC6094
	.long	.LC6095
	.value	4183
	.value	25600
	.long	.LC6096
	.long	.LC6097
	.value	4186
	.value	3376
	.long	.LC6098
	.long	.LC6099
	.value	4186
	.value	3384
	.long	.LC6100
	.long	.LC6101
	.value	4186
	.value	4725
	.long	.LC6102
	.long	.LC6103
	.value	4186
	.value	6496
	.long	.LC2432
	.long	.LC6104
	.value	4186
	.value	6498
	.long	.LC2432
	.long	.LC6105
	.value	4186
	.value	13080
	.long	.LC6106
	.long	.LC6107
	.value	4186
	.value	13081
	.long	.LC6108
	.long	.LC6109
	.value	4186
	.value	13169
	.long	.LC6110
	.long	.LC6111
	.value	4186
	.value	13171
	.long	.LC6112
	.long	.LC6113
	.value	4186
	.value	13173
	.long	.LC6114
	.long	.LC6115
	.value	4186
	.value	13174
	.long	.LC6116
	.long	.LC6117
	.value	4186
	.value	13589
	.long	.LC6118
	.long	.LC6119
	.value	4186
	.value	13593
	.long	.LC6120
	.long	.LC6121
	.value	4186
	.value	13680
	.long	.LC6122
	.long	.LC6123
	.value	4186
	.value	13681
	.long	.LC6124
	.long	.LC6125
	.value	4186
	.value	13684
	.long	.LC6126
	.long	.LC6127
	.value	4186
	.value	15639
	.long	.LC6128
	.long	.LC6129
	.value	4186
	.value	15640
	.long	.LC6130
	.long	.LC6131
	.value	4186
	.value	15731
	.long	.LC6132
	.long	.LC6133
	.value	4186
	.value	16153
	.long	.LC2432
	.long	.LC6134
	.value	4186
	.value	16160
	.long	.LC6135
	.long	.LC6136
	.value	4186
	.value	17154
	.long	.LC2432
	.long	.LC6137
	.value	4186
	.value	19760
	.long	.LC6138
	.long	.LC6139
	.value	4186
	.value	19763
	.long	.LC6140
	.long	.LC6141
	.value	4186
	.value	19768
	.long	.LC6142
	.long	.LC6143
	.value	4186
	.value	19816
	.long	.LC6144
	.long	.LC6145
	.value	4186
	.value	19817
	.long	.LC6146
	.long	.LC6147
	.value	4186
	.value	21109
	.long	.LC6148
	.long	.LC6149
	.value	4186
	.value	21248
	.long	.LC6150
	.long	.LC3314
	.value	4186
	.value	25192
	.long	.LC6151
	.long	.LC6152
	.value	4186
	.value	25193
	.long	.LC6153
	.long	.LC6154
	.value	4186
	.value	25344
	.long	.LC2432
	.long	.LC6155
	.value	4186
	.value	25345
	.long	.LC2432
	.long	.LC6156
	.value	4186
	.value	25346
	.long	.LC2432
	.long	.LC6157
	.value	4186
	.value	25347
	.long	.LC2432
	.long	.LC6158
	.value	4186
	.value	25348
	.long	.LC2432
	.long	.LC6159
	.value	4186
	.value	25349
	.long	.LC2432
	.long	.LC6160
	.value	4186
	.value	25350
	.long	.LC2432
	.long	.LC6161
	.value	4186
	.value	25351
	.long	.LC2432
	.long	.LC6162
	.value	4186
	.value	26145
	.long	.LC6163
	.long	.LC6164
	.value	4186
	.value	26146
	.long	.LC6165
	.long	.LC6166
	.value	4186
	.value	26153
	.long	.LC6167
	.long	.LC6168
	.value	4186
	.value	29264
	.long	.LC2432
	.long	.LC6169
	.value	4186
	.value	29301
	.long	.LC6170
	.long	.LC6171
	.value	4186
	.value	-32768
	.long	.LC2432
	.long	.LC6172
	.value	4186
	.value	-32766
	.long	.LC2432
	.long	.LC6172
	.value	4186
	.value	-32764
	.long	.LC2432
	.long	.LC6172
	.value	4186
	.value	-32762
	.long	.LC2432
	.long	.LC6172
	.value	4186
	.value	-31920
	.long	.LC2432
	.long	.LC6173
	.value	4186
	.value	-31152
	.long	.LC2432
	.long	.LC6174
	.value	4186
	.value	-15536
	.long	.LC2432
	.long	.LC6175
	.value	4186
	.value	-7344
	.long	.LC2432
	.long	.LC6176
	.value	4189
	.value	8969
	.long	.LC6177
	.long	.LC2878
	.value	4189
	.value	9017
	.long	.LC6178
	.long	.LC6179
	.value	4189
	.value	18749
	.long	.LC6180
	.long	.LC6181
	.value	4189
	.value	21320
	.long	.LC6182
	.long	.LC6182
	.value	4192
	.value	1
	.long	.LC6183
	.long	.LC6184
	.value	4192
	.value	2
	.long	.LC6185
	.long	.LC4336
	.value	4192
	.value	257
	.long	.LC6186
	.long	.LC3314
	.value	4192
	.value	2177
	.long	.LC6187
	.long	.LC6188
	.value	4192
	.value	2182
	.long	.LC6189
	.long	.LC4336
	.value	4192
	.value	2193
	.long	.LC6190
	.long	.LC6191
	.value	4192
	.value	4097
	.long	.LC6192
	.long	.LC6193
	.value	4192
	.value	26426
	.long	.LC6194
	.long	.LC3314
	.value	4192
	.value	26427
	.long	.LC42
	.long	.LC6195
	.value	4192
	.value	-30960
	.long	.LC6196
	.long	.LC6197
	.value	4192
	.value	-30687
	.long	.LC42
	.long	.LC6198
	.value	4192
	.value	-30686
	.long	.LC42
	.long	.LC6199
	.value	4192
	.value	-30639
	.long	.LC42
	.long	.LC6200
	.value	4192
	.value	-30638
	.long	.LC42
	.long	.LC6201
	.value	4192
	.value	-30614
	.long	.LC6202
	.long	.LC6203
	.value	4192
	.value	-30591
	.long	.LC6204
	.long	.LC6188
	.value	4192
	.value	-30586
	.long	.LC6205
	.long	.LC6206
	.value	4192
	.value	-30582
	.long	.LC6202
	.long	.LC42
	.value	4192
	.value	-30575
	.long	.LC6207
	.long	.LC6208
	.value	4192
	.value	-28649
	.long	.LC6209
	.long	.LC6210
	.value	4192
	.value	-28648
	.long	.LC6211
	.long	.LC6210
	.value	4192
	.value	-28634
	.long	.LC6212
	.long	.LC3730
	.value	4192
	.value	-6015
	.long	.LC6187
	.long	.LC6184
	.value	4192
	.value	-6010
	.long	.LC6213
	.long	.LC6214
	.value	4192
	.value	-6006
	.long	.LC6213
	.long	.LC6215
	.value	4192
	.value	-5999
	.long	.LC6216
	.long	.LC6217
	.value	4193
	.value	1
	.long	.LC6218
	.long	.LC2878
	.value	4193
	.value	2
	.long	.LC6219
	.long	.LC5370
	.value	5750
	.value	4097
	.long	.LC6220
	.long	.LC6221
	.value	4197
	.value	-32455
	.long	.LC42
	.long	.LC6222
	.value	4198
	.value	0
	.long	.LC6223
	.long	.LC6224
	.value	4198
	.value	1
	.long	.LC6225
	.long	.LC6226
	.value	4198
	.value	2
	.long	.LC6227
	.long	.LC6228
	.value	4198
	.value	3
	.long	.LC6229
	.long	.LC6230
	.value	4198
	.value	4
	.long	.LC6231
	.long	.LC6232
	.value	4198
	.value	5
	.long	.LC6233
	.long	.LC3610
	.value	4198
	.value	-32766
	.long	.LC6227
	.long	.LC4336
	.value	4199
	.value	4098
	.long	.LC6234
	.long	.LC6235
	.value	4097
	.value	16
	.long	.LC6236
	.long	.LC6237
	.value	4097
	.value	17
	.long	.LC6236
	.long	.LC6238
	.value	4097
	.value	18
	.long	.LC6236
	.long	.LC6239
	.value	4097
	.value	19
	.long	.LC6236
	.long	.LC6240
	.value	4097
	.value	20
	.long	.LC6236
	.long	.LC6241
	.value	4097
	.value	21
	.long	.LC6236
	.long	.LC6242
	.value	4097
	.value	22
	.long	.LC6236
	.long	.LC6243
	.value	4097
	.value	23
	.long	.LC6236
	.long	.LC6244
	.value	4097
	.value	32
	.long	.LC6236
	.long	.LC6245
	.value	5751
	.value	8365
	.long	.LC6246
	.long	.LC6247
	.value	5195
	.value	1537
	.long	.LC42
	.long	.LC42
	.value	5122
	.value	11776
	.long	.LC6248
	.long	.LC6249
	.value	5122
	.value	17936
	.long	.LC6250
	.long	.LC6251
	.value	5122
	.value	18000
	.long	.LC6252
	.long	.LC6251
	.value	5332
	.value	1024
	.long	.LC6253
	.long	.LC6254
	.value	4871
	.value	1
	.long	.LC6255
	.long	.LC42
	.value	4871
	.value	6
	.long	.LC6256
	.long	.LC42
	.value	4871
	.value	11
	.long	.LC6257
	.long	.LC42
	.value	4871
	.value	12
	.long	.LC6258
	.long	.LC42
	.value	4871
	.value	13
	.long	.LC6259
	.long	.LC42
	.value	4871
	.value	15
	.long	.LC6260
	.long	.LC42
	.value	4871
	.value	16
	.long	.LC6261
	.long	.LC42
	.value	4871
	.value	20
	.long	.LC6262
	.long	.LC42
	.value	4871
	.value	21
	.long	.LC6263
	.long	.LC42
	.value	4871
	.value	22
	.long	.LC6264
	.long	.LC42
	.value	4871
	.value	23
	.long	.LC6265
	.long	.LC42
	.value	4871
	.value	24
	.long	.LC6266
	.long	.LC42
	.value	4871
	.value	25
	.long	.LC6267
	.long	.LC42
	.value	4871
	.value	26
	.long	.LC6268
	.long	.LC42
	.value	4871
	.value	27
	.long	.LC6269
	.long	.LC42
	.value	4871
	.value	28
	.long	.LC6270
	.long	.LC42
	.value	4871
	.value	29
	.long	.LC6271
	.long	.LC42
	.value	4871
	.value	30
	.long	.LC6272
	.long	.LC42
	.value	4871
	.value	31
	.long	.LC6273
	.long	.LC42
	.value	4871
	.value	32
	.long	.LC6274
	.long	.LC42
	.value	4871
	.value	33
	.long	.LC6275
	.long	.LC42
	.value	4871
	.value	34
	.long	.LC6276
	.long	.LC42
	.value	4871
	.value	35
	.long	.LC6277
	.long	.LC42
	.value	4871
	.value	36
	.long	.LC6278
	.long	.LC42
	.value	4871
	.value	37
	.long	.LC6279
	.long	.LC42
	.value	4871
	.value	38
	.long	.LC6280
	.long	.LC42
	.value	4871
	.value	39
	.long	.LC6281
	.long	.LC42
	.value	4871
	.value	40
	.long	.LC6282
	.long	.LC6283
	.value	4871
	.value	41
	.long	.LC6284
	.long	.LC42
	.value	4871
	.value	44
	.long	.LC6285
	.long	.LC42
	.value	4871
	.value	51
	.long	.LC6286
	.long	.LC42
	.value	4871
	.value	52
	.long	.LC6287
	.long	.LC42
	.value	4871
	.value	53
	.long	.LC6288
	.long	.LC42
	.value	4871
	.value	54
	.long	.LC6289
	.long	.LC42
	.value	4871
	.value	55
	.long	.LC6290
	.long	.LC42
	.value	4871
	.value	76
	.long	.LC6291
	.long	.LC42
	.value	4871
	.value	77
	.long	.LC6292
	.long	.LC42
	.value	4871
	.value	100
	.long	.LC6293
	.long	.LC6294
	.value	4888
	.value	2321
	.long	.LC6295
	.long	.LC6296
	.value	4889
	.value	2049
	.long	.LC6297
	.long	.LC6298
	.value	4889
	.value	2050
	.long	.LC6299
	.long	.LC6300
	.value	4889
	.value	4096
	.long	.LC6299
	.long	.LC5264
	.value	4889
	.value	4097
	.long	.LC6301
	.long	.LC6302
	.value	4889
	.value	4889
	.long	.LC6303
	.long	.LC6304
	.value	4889
	.value	18689
	.long	.LC6305
	.long	.LC6306
	.value	4889
	.value	802
	.long	.LC6307
	.long	.LC5264
	.value	5138
	.value	5906
	.long	.LC6308
	.long	.LC6309
	.value	5138
	.value	5924
	.long	.LC6310
	.long	.LC6311
	.value	4895
	.value	8194
	.long	.LC42
	.long	.LC6312
	.value	4895
	.value	8209
	.long	.LC42
	.long	.LC6313
	.value	4895
	.value	8210
	.long	.LC42
	.long	.LC6314
	.value	4895
	.value	8224
	.long	.LC6315
	.long	.LC6316
	.value	4895
	.value	8258
	.long	.LC42
	.long	.LC6317
	.value	4895
	.value	8272
	.long	.LC6318
	.long	.LC6318
	.value	4895
	.value	8273
	.long	.LC42
	.long	.LC6319
	.value	4895
	.value	8274
	.long	.LC42
	.long	.LC6312
	.value	4895
	.value	8288
	.long	.LC42
	.long	.LC6320
	.value	4895
	.value	8289
	.long	.LC42
	.long	.LC6321
	.value	4895
	.value	8290
	.long	.LC42
	.long	.LC6322
	.value	5127
	.value	256
	.long	.LC6323
	.long	.LC6324
	.value	5127
	.value	257
	.long	.LC42
	.long	.LC6325
	.value	5127
	.value	258
	.long	.LC42
	.long	.LC6326
	.value	5127
	.value	272
	.long	.LC6327
	.long	.LC6328
	.value	5127
	.value	273
	.long	.LC42
	.long	.LC6329
	.value	5127
	.value	384
	.long	.LC42
	.long	.LC6330
	.value	5127
	.value	385
	.long	.LC42
	.long	.LC6331
	.value	5127
	.value	512
	.long	.LC6332
	.long	.LC6333
	.value	5127
	.value	513
	.long	.LC42
	.long	.LC6334
	.value	5127
	.value	514
	.long	.LC42
	.long	.LC6335
	.value	5127
	.value	544
	.long	.LC42
	.long	.LC6334
	.value	5127
	.value	545
	.long	.LC42
	.long	.LC6335
	.value	5127
	.value	1024
	.long	.LC42
	.long	.LC6336
	.value	5127
	.value	1280
	.long	.LC42
	.long	.LC6337
	.value	5127
	.value	1296
	.long	.LC42
	.long	.LC6338
	.value	5127
	.value	1297
	.long	.LC42
	.long	.LC6339
	.value	5127
	.value	1312
	.long	.LC42
	.long	.LC6340
	.value	5127
	.value	1536
	.long	.LC6341
	.long	.LC6342
	.value	5127
	.value	2560
	.long	.LC6343
	.long	.LC6344
	.value	5127
	.value	288
	.long	.LC42
	.long	.LC6345
	.value	5127
	.value	289
	.long	.LC42
	.long	.LC6346
	.value	5127
	.value	-32768
	.long	.LC42
	.long	.LC6347
	.value	5127
	.value	-32767
	.long	.LC42
	.long	.LC6348
	.value	5127
	.value	-32766
	.long	.LC6332
	.long	.LC6348
	.value	5127
	.value	-32765
	.long	.LC42
	.long	.LC6349
	.value	5127
	.value	-30720
	.long	.LC42
	.long	.LC6350
	.value	-27630
	.value	25957
	.long	.LC6351
	.long	.LC6352
	.value	4496
	.value	9552
	.long	.LC6353
	.long	.LC6354
	.value	4496
	.value	-14559
	.long	.LC42
	.long	.LC6355
	.value	4496
	.value	-14543
	.long	.LC6356
	.long	.LC6357
	.value	4674
	.value	5216
	.long	.LC6358
	.long	.LC6359
	.value	4674
	.value	5472
	.long	.LC6360
	.long	.LC6361
	.value	4674
	.value	17987
	.long	.LC6362
	.long	.LC6363
	.value	5362
	.value	1
	.long	.LC42
	.long	.LC6364
	.value	5362
	.value	2
	.long	.LC42
	.long	.LC6365
	.value	5362
	.value	288
	.long	.LC42
	.long	.LC6366
	.value	5362
	.value	289
	.long	.LC42
	.long	.LC2690
	.value	5362
	.value	290
	.long	.LC2626
	.long	.LC6367
	.value	5362
	.value	291
	.long	.LC42
	.long	.LC6368
	.value	5362
	.value	292
	.long	.LC6369
	.long	.LC6370
	.value	4872
	.value	1
	.long	.LC42
	.long	.LC6371
	.value	4941
	.value	8584
	.long	.LC6372
	.long	.LC2021
	.value	4941
	.value	8585
	.long	.LC6373
	.long	.LC2079
	.value	4941
	.value	9350
	.long	.LC6374
	.long	.LC6375
	.value	4941
	.value	30864
	.long	.LC6376
	.long	.LC2021
	.value	4941
	.value	30865
	.long	.LC6377
	.long	.LC6378
	.value	4941
	.value	30866
	.long	.LC6379
	.long	.LC6380
	.value	4941
	.value	30867
	.long	.LC6381
	.long	.LC6378
	.value	4941
	.value	30868
	.long	.LC6382
	.long	.LC6378
	.value	4941
	.value	30869
	.long	.LC6383
	.long	.LC6378
	.value	4941
	.value	30870
	.long	.LC6384
	.long	.LC6378
	.value	4941
	.value	30871
	.long	.LC6385
	.long	.LC6386
	.value	4941
	.value	-26860
	.long	.LC6387
	.long	.LC1389
	.value	4941
	.value	-10240
	.long	.LC6388
	.long	.LC6389
	.value	4941
	.value	8086
	.long	.LC6390
	.long	.LC6391
	.value	4958
	.value	20737
	.long	.LC6392
	.long	.LC6393
	.value	4958
	.value	20738
	.long	.LC6394
	.long	.LC6395
	.value	4958
	.value	28929
	.long	.LC42
	.long	.LC6396
	.value	4958
	.value	29185
	.long	.LC42
	.long	.LC6397
	.value	4958
	.value	29186
	.long	.LC42
	.long	.LC6398
	.value	4958
	.value	29697
	.long	.LC42
	.long	.LC6399
	.value	4958
	.value	29698
	.long	.LC42
	.long	.LC6400
	.value	4958
	.value	30721
	.long	.LC42
	.long	.LC6401
	.value	4958
	.value	-32767
	.long	.LC6402
	.long	.LC6403
	.value	4997
	.value	16640
	.long	.LC6404
	.long	.LC6405
	.value	4997
	.value	16645
	.long	.LC42
	.long	.LC42
	.value	4997
	.value	25098
	.long	.LC6406
	.long	.LC42
	.value	4997
	.value	25130
	.long	.LC6407
	.long	.LC42
	.value	4997
	.value	25354
	.long	.LC6408
	.long	.LC42
	.value	4997
	.value	-32407
	.long	.LC6409
	.long	.LC2382
	.value	4997
	.value	-3311
	.long	.LC6410
	.long	.LC6411
	.value	4997
	.value	-3310
	.long	.LC42
	.long	.LC42
	.value	5001
	.value	1
	.long	.LC6412
	.long	.LC6413
	.value	5001
	.value	260
	.long	.LC6414
	.long	.LC6415
	.value	5015
	.value	2893
	.long	.LC6416
	.long	.LC6417
	.value	5015
	.value	11216
	.long	.LC6418
	.long	.LC6417
	.value	5015
	.value	-29875
	.long	.LC6419
	.long	.LC6417
	.value	5015
	.value	-20480
	.long	.LC6420
	.long	.LC6421
	.value	5015
	.value	-20474
	.long	.LC6422
	.long	.LC6421
	.value	5015
	.value	-20473
	.long	.LC6423
	.long	.LC6421
	.value	5015
	.value	-20472
	.long	.LC6424
	.long	.LC6421
	.value	5015
	.value	-20471
	.long	.LC6425
	.long	.LC6421
	.value	5015
	.value	-20470
	.long	.LC6426
	.long	.LC6421
	.value	5015
	.value	-20469
	.long	.LC6427
	.long	.LC6421
	.value	5015
	.value	-20468
	.long	.LC6428
	.long	.LC6421
	.value	5015
	.value	-20224
	.long	.LC6429
	.long	.LC6421
	.value	5056
	.value	16
	.long	.LC6430
	.long	.LC6431
	.value	5056
	.value	32
	.long	.LC6432
	.long	.LC6433
	.value	5056
	.value	48
	.long	.LC6434
	.long	.LC6435
	.value	5056
	.value	112
	.long	.LC6436
	.long	.LC6431
	.value	5056
	.value	128
	.long	.LC6437
	.long	.LC6435
	.value	5056
	.value	144
	.long	.LC6438
	.long	.LC6439
	.value	5056
	.value	160
	.long	.LC6440
	.long	.LC6441
	.value	5056
	.value	528
	.long	.LC6442
	.long	.LC6431
	.value	5057
	.value	4096
	.long	.LC6443
	.long	.LC6444
	.value	5057
	.value	4097
	.long	.LC6445
	.long	.LC6446
	.value	5057
	.value	4098
	.long	.LC6447
	.long	.LC6448
	.value	5057
	.value	4099
	.long	.LC6449
	.long	.LC6450
	.value	5057
	.value	4100
	.long	.LC6451
	.long	.LC6452
	.value	5057
	.value	4101
	.long	.LC6453
	.long	.LC6454
	.value	5087
	.value	1
	.long	.LC6455
	.long	.LC6080
	.value	5110
	.value	137
	.long	.LC6456
	.long	.LC6457
	.value	5110
	.value	273
	.long	.LC6458
	.long	.LC6459
	.value	5110
	.value	256
	.long	.LC6460
	.long	.LC2736
	.value	5110
	.value	257
	.long	.LC6461
	.long	.LC2873
	.value	5110
	.value	273
	.long	.LC6462
	.long	.LC6463
	.value	5110
	.value	274
	.long	.LC6464
	.long	.LC6465
	.value	5110
	.value	529
	.long	.LC6466
	.long	.LC6467
	.value	5110
	.value	768
	.long	.LC6468
	.long	.LC6469
	.value	5110
	.value	273
	.long	.LC6470
	.long	.LC6463
	.value	5110
	.value	-30840
	.long	.LC6471
	.long	.LC6472
	.value	5192
	.value	1
	.long	.LC6473
	.long	.LC6474
	.value	4938
	.value	1
	.long	.LC6475
	.long	.LC6476
	.value	4938
	.value	2
	.long	.LC42
	.long	.LC6477
	.value	5194
	.value	29256
	.long	.LC6478
	.long	.LC6479
	.value	5194
	.value	29264
	.long	.LC6480
	.long	.LC6479
	.value	5194
	.value	29270
	.long	.LC6481
	.long	.LC6482
	.value	5194
	.value	29334
	.long	.LC6483
	.long	.LC6484
	.value	5194
	.value	29746
	.long	.LC6485
	.long	.LC42
	.value	5194
	.value	29747
	.long	.LC6486
	.long	.LC6487
	.value	5194
	.value	29748
	.long	.LC6488
	.long	.LC42
	.value	5194
	.value	30785
	.long	.LC6489
	.long	.LC6490
	.value	5194
	.value	-32461
	.long	.LC6491
	.long	.LC42
	.value	5194
	.value	-31404
	.long	.LC6492
	.long	.LC42
	.value	5194
	.value	-28399
	.long	.LC6493
	.long	.LC42
	.value	5194
	.value	-28397
	.long	.LC6494
	.long	.LC42
	.value	5194
	.value	-28396
	.long	.LC6495
	.long	.LC42
	.value	6931
	.value	1
	.long	.LC6496
	.long	.LC6497
	.value	5215
	.value	1
	.long	.LC6498
	.long	.LC6499
	.value	5215
	.value	2
	.long	.LC6500
	.long	.LC6499
	.value	5261
	.value	4099
	.long	.LC6501
	.long	.LC6502
	.value	5299
	.value	0
	.long	.LC6503
	.long	.LC6504
	.value	5303
	.value	1
	.long	.LC6505
	.long	.LC6506
	.value	5305
	.value	1
	.long	.LC6507
	.long	.LC6508
	.value	5305
	.value	832
	.long	.LC42
	.long	.LC6509
	.value	5305
	.value	9472
	.long	.LC6510
	.long	.LC6511
	.value	5305
	.value	12544
	.long	.LC6512
	.long	.LC6511
	.value	5305
	.value	12545
	.long	.LC6512
	.long	.LC6511
	.value	5305
	.value	13568
	.long	.LC6513
	.long	.LC6511
	.value	5305
	.value	17664
	.long	.LC6514
	.long	.LC6511
	.value	5305
	.value	18432
	.long	.LC6515
	.long	.LC6511
	.value	5305
	.value	-23292
	.long	.LC6516
	.long	.LC6517
	.value	5305
	.value	-23290
	.long	.LC6518
	.long	.LC6519
	.value	5339
	.value	8448
	.long	.LC6520
	.long	.LC42
	.value	5339
	.value	8449
	.long	.LC6521
	.long	.LC42
	.value	5339
	.value	8450
	.long	.LC6522
	.long	.LC42
	.value	5339
	.value	8464
	.long	.LC6523
	.long	.LC6524
	.value	5339
	.value	8465
	.long	.LC6525
	.long	.LC42
	.value	5339
	.value	8466
	.long	.LC6526
	.long	.LC42
	.value	5339
	.value	8480
	.long	.LC6527
	.long	.LC6528
	.value	5339
	.value	8481
	.long	.LC6529
	.long	.LC42
	.value	5339
	.value	8496
	.long	.LC6530
	.long	.LC6531
	.value	5339
	.value	8497
	.long	.LC6532
	.long	.LC42
	.value	5339
	.value	8498
	.long	.LC6533
	.long	.LC42
	.value	5339
	.value	8512
	.long	.LC6534
	.long	.LC42
	.value	5339
	.value	8513
	.long	.LC6535
	.long	.LC42
	.value	5339
	.value	8514
	.long	.LC6536
	.long	.LC42
	.value	5339
	.value	8516
	.long	.LC6537
	.long	.LC42
	.value	5339
	.value	8517
	.long	.LC6538
	.long	.LC42
	.value	5339
	.value	8518
	.long	.LC6539
	.long	.LC42
	.value	5339
	.value	8528
	.long	.LC6540
	.long	.LC42
	.value	5339
	.value	8529
	.long	.LC6541
	.long	.LC42
	.value	5339
	.value	8530
	.long	.LC6542
	.long	.LC42
	.value	5339
	.value	8544
	.long	.LC6543
	.long	.LC42
	.value	5339
	.value	8545
	.long	.LC6544
	.long	.LC42
	.value	5339
	.value	8546
	.long	.LC6545
	.long	.LC42
	.value	5339
	.value	8576
	.long	.LC6546
	.long	.LC6547
	.value	5339
	.value	8577
	.long	.LC6548
	.long	.LC6549
	.value	5339
	.value	8578
	.long	.LC6550
	.long	.LC6549
	.value	5340
	.value	0
	.long	.LC6551
	.long	.LC42
	.value	5340
	.value	1
	.long	.LC6552
	.long	.LC6553
	.value	5340
	.value	2
	.long	.LC6554
	.long	.LC6555
	.value	5340
	.value	3
	.long	.LC6556
	.long	.LC6557
	.value	5340
	.value	4
	.long	.LC6558
	.long	.LC6559
	.value	5340
	.value	5
	.long	.LC6560
	.long	.LC6561
	.value	5340
	.value	6
	.long	.LC6562
	.long	.LC6563
	.value	5340
	.value	7
	.long	.LC6564
	.long	.LC6565
	.value	5340
	.value	8
	.long	.LC6566
	.long	.LC6567
	.value	5340
	.value	9
	.long	.LC6568
	.long	.LC6569
	.value	5340
	.value	10
	.long	.LC6570
	.long	.LC6571
	.value	5340
	.value	11
	.long	.LC6572
	.long	.LC6573
	.value	5340
	.value	12
	.long	.LC6574
	.long	.LC6575
	.value	5383
	.value	1
	.long	.LC6576
	.long	.LC42
	.value	5383
	.value	2
	.long	.LC6577
	.long	.LC42
	.value	5383
	.value	3
	.long	.LC6578
	.long	.LC42
	.value	5383
	.value	256
	.long	.LC6579
	.long	.LC42
	.value	5383
	.value	1073
	.long	.LC6580
	.long	.LC42
	.value	5383
	.value	18433
	.long	.LC6081
	.long	.LC42
	.value	5383
	.value	18434
	.long	.LC6083
	.long	.LC42
	.value	5383
	.value	18435
	.long	.LC6085
	.long	.LC42
	.value	5383
	.value	18438
	.long	.LC6086
	.long	.LC42
	.value	5402
	.value	4098
	.long	.LC6581
	.long	.LC6582
	.value	5402
	.value	4100
	.long	.LC6583
	.long	.LC42
	.value	5402
	.value	4104
	.long	.LC6584
	.long	.LC42
	.value	5500
	.value	-32767
	.long	.LC6585
	.long	.LC6586
	.value	5522
	.value	1921
	.long	.LC6587
	.long	.LC6588
	.value	5522
	.value	1922
	.long	.LC6589
	.long	.LC6590
	.value	5522
	.value	1923
	.long	.LC6591
	.long	.LC6588
	.value	5522
	.value	1925
	.long	.LC6592
	.long	.LC6588
	.value	5522
	.value	1926
	.long	.LC6593
	.long	.LC6588
	.value	5522
	.value	1927
	.long	.LC6594
	.long	.LC6595
	.value	5522
	.value	1928
	.long	.LC6596
	.long	.LC6588
	.value	5522
	.value	1930
	.long	.LC6597
	.long	.LC6588
	.value	5549
	.value	1029
	.long	.LC6598
	.long	.LC422
	.value	5549
	.value	1808
	.long	.LC42
	.long	.LC6599
	.value	5549
	.value	1824
	.long	.LC6600
	.long	.LC6601
	.value	5549
	.value	1856
	.long	.LC6602
	.long	.LC2432
	.value	5549
	.value	1904
	.long	.LC3509
	.long	.LC6603
	.value	5549
	.value	2049
	.long	.LC3509
	.long	.LC3509
	.value	5596
	.value	1
	.long	.LC6604
	.long	.LC6605
	.value	13192
	.value	32
	.long	.LC6606
	.long	.LC6607
	.value	13192
	.value	33
	.long	.LC6608
	.long	.LC6609
	.value	13192
	.value	34
	.long	.LC6610
	.long	.LC3793
	.value	13192
	.value	40
	.long	.LC6611
	.long	.LC6612
	.value	13192
	.value	41
	.long	.LC6611
	.long	.LC6613
	.value	13192
	.value	48
	.long	.LC6614
	.long	.LC6615
	.value	13192
	.value	49
	.long	.LC6616
	.long	.LC6617
	.value	13192
	.value	-32751
	.long	.LC1348
	.long	.LC4369
	.value	13192
	.value	-32750
	.long	.LC6618
	.long	.LC2692
	.value	13192
	.value	-32749
	.long	.LC6619
	.long	.LC3314
	.value	19793
	.value	512
	.long	.LC6620
	.long	.LC42
	.value	20563
	.value	8208
	.long	.LC42
	.long	.LC6621
	.value	21845
	.value	3
	.long	.LC6622
	.long	.LC6623
	.value	26214
	.value	1
	.long	.LC6624
	.long	.LC6625
	.value	26214
	.value	2
	.long	.LC42
	.long	.LC6626
	.value	4860
	.value	23788
	.long	.LC6627
	.long	.LC6628
	.value	4880
	.value	3
	.long	.LC6629
	.long	.LC6630
	.value	4880
	.value	13
	.long	.LC42
	.long	.LC6631
	.value	4887
	.value	1329
	.long	.LC6632
	.long	.LC6633
	.value	4887
	.value	2433
	.long	.LC6634
	.long	.LC6635
	.value	4887
	.value	2437
	.long	.LC6636
	.long	.LC6635
	.value	4887
	.value	6533
	.long	.LC6637
	.long	.LC6638
	.value	4887
	.value	10320
	.long	.LC6639
	.long	.LC6380
	.value	4887
	.value	20768
	.long	.LC6640
	.long	.LC6641
	.value	4887
	.value	30866
	.long	.LC6379
	.long	.LC6380
	.value	4887
	.value	-32255
	.long	.LC6642
	.long	.LC6643
	.value	4887
	.value	-27375
	.long	.LC6644
	.long	.LC6645
	.value	4887
	.value	-27373
	.long	.LC6646
	.long	.LC6645
	.value	4887
	.value	8201
	.long	.LC6647
	.long	.LC6648
	.value	4925
	.value	4096
	.long	.LC6649
	.long	.LC6650
	.value	4932
	.value	12864
	.long	.LC42
	.long	.LC6651
	.value	4932
	.value	13088
	.long	.LC6652
	.long	.LC5231
	.value	4932
	.value	13089
	.long	.LC6653
	.long	.LC5231
	.value	4932
	.value	13424
	.long	.LC6654
	.long	.LC5002
	.value	4932
	.value	16416
	.long	.LC42
	.long	.LC6655
	.value	4932
	.value	16432
	.long	.LC42
	.long	.LC6656
	.value	4954
	.value	548
	.long	.LC6657
	.long	.LC6658
	.value	4981
	.value	9585
	.long	.LC3872
	.long	.LC3872
	.value	16748
	.value	256
	.long	.LC6659
	.long	.LC42
	.value	16748
	.value	512
	.long	.LC6660
	.long	.LC42
	.value	4986
	.value	1
	.long	.LC42
	.long	.LC42
	.value	4999
	.value	21264
	.long	.LC4832
	.long	.LC6661
	.value	5011
	.value	4112
	.long	.LC42
	.long	.LC42
	.value	5011
	.value	4128
	.long	.LC42
	.long	.LC42
	.value	5011
	.value	4160
	.long	.LC6662
	.long	.LC6663
	.value	5011
	.value	4161
	.long	.LC42
	.long	.LC42
	.value	5011
	.value	4162
	.long	.LC42
	.long	.LC42
	.value	5011
	.value	4416
	.long	.LC42
	.long	.LC42
	.value	5011
	.value	4417
	.long	.LC42
	.long	.LC42
	.value	5011
	.value	4896
	.long	.LC6664
	.long	.LC6665
	.value	5011
	.value	4897
	.long	.LC42
	.long	.LC42
	.value	5011
	.value	4928
	.long	.LC6666
	.long	.LC6667
	.value	5011
	.value	5121
	.long	.LC42
	.long	.LC42
	.value	5011
	.value	5760
	.long	.LC6668
	.long	.LC6663
	.value	5011
	.value	5761
	.long	.LC6669
	.long	.LC6670
	.value	5011
	.value	8256
	.long	.LC6671
	.long	.LC6672
	.value	5011
	.value	8576
	.long	.LC6673
	.long	.LC6674
	.value	5011
	.value	8720
	.long	.LC6675
	.long	.LC6675
	.value	5011
	.value	8768
	.long	.LC6675
	.long	.LC6675
	.value	5011
	.value	12800
	.long	.LC6676
	.long	.LC6674
	.value	5011
	.value	20512
	.long	.LC42
	.long	.LC42
	.value	5011
	.value	26624
	.long	.LC6677
	.long	.LC6678
	.value	5018
	.value	7
	.long	.LC6679
	.long	.LC6680
	.value	5031
	.value	25152
	.long	.LC3601
	.long	.LC6681
	.value	5032
	.value	338
	.long	.LC6682
	.long	.LC6683
	.value	5032
	.value	340
	.long	.LC6684
	.long	.LC6685
	.value	5032
	.value	344
	.long	.LC6686
	.long	.LC6687
	.value	19539
	.value	0
	.long	.LC6688
	.long	.LC6689
	.value	5046
	.value	5046
	.long	.LC6690
	.long	.LC6691
	.value	5063
	.value	2780
	.long	.LC42
	.long	.LC6692
	.value	5063
	.value	2832
	.long	.LC2552
	.long	.LC6693
	.value	5063
	.value	3344
	.long	.LC2552
	.long	.LC6694
	.value	5063
	.value	22340
	.long	.LC2552
	.long	.LC6695
	.value	5072
	.value	8451
	.long	.LC6696
	.long	.LC6697
	.value	5072
	.value	8704
	.long	.LC42
	.long	.LC42
	.value	5073
	.value	-21758
	.long	.LC42
	.long	.LC42
	.value	5073
	.value	-21757
	.long	.LC42
	.long	.LC42
	.value	5073
	.value	-21754
	.long	.LC6698
	.long	.LC6699
	.value	5073
	.value	-21752
	.long	.LC6700
	.long	.LC6701
	.value	5079
	.value	-32634
	.long	.LC6702
	.long	.LC6703
	.value	5080
	.value	4096
	.long	.LC6704
	.long	.LC6705
	.value	4203
	.value	1
	.long	.LC6706
	.long	.LC6707
	.value	4203
	.value	2
	.long	.LC6708
	.long	.LC5373
	.value	4203
	.value	3
	.long	.LC6709
	.long	.LC42
	.value	4203
	.value	4
	.long	.LC6710
	.long	.LC6711
	.value	4203
	.value	7
	.long	.LC6712
	.long	.LC5373
	.value	4203
	.value	12
	.long	.LC42
	.long	.LC42
	.value	4203
	.value	14
	.long	.LC6713
	.long	.LC6714
	.value	4203
	.value	16
	.long	.LC6715
	.long	.LC6714
	.value	4203
	.value	23
	.long	.LC6716
	.long	.LC6714
	.value	4203
	.value	24
	.long	.LC6717
	.long	.LC6718
	.value	4203
	.value	31
	.long	.LC6717
	.long	.LC6719
	.value	4203
	.value	32
	.long	.LC6717
	.long	.LC6720
	.value	4203
	.value	38
	.long	.LC6721
	.long	.LC6722
	.value	4203
	.value	39
	.long	.LC6721
	.long	.LC6720
	.value	4203
	.value	45
	.long	.LC6723
	.long	.LC3180
	.value	4203
	.value	46
	.long	.LC6723
	.long	.LC3333
	.value	4203
	.value	47
	.long	.LC6723
	.long	.LC6724
	.value	4203
	.value	48
	.long	.LC6725
	.long	.LC6718
	.value	4203
	.value	59
	.long	.LC6726
	.long	.LC6727
	.value	4203
	.value	79
	.long	.LC6728
	.long	.LC6729
	.value	4203
	.value	80
	.long	.LC6728
	.long	.LC6730
	.value	4203
	.value	81
	.long	.LC6728
	.long	.LC6731
	.value	4203
	.value	82
	.long	.LC6728
	.long	.LC6732
	.value	4203
	.value	83
	.long	.LC6728
	.long	.LC3333
	.value	4203
	.value	84
	.long	.LC6728
	.long	.LC3333
	.value	4203
	.value	85
	.long	.LC6728
	.long	.LC3333
	.value	4203
	.value	88
	.long	.LC6733
	.long	.LC3180
	.value	4204
	.value	-30719
	.long	.LC42
	.long	.LC6734
	.value	4204
	.value	-30718
	.long	.LC6735
	.long	.LC6736
	.value	4204
	.value	-30717
	.long	.LC42
	.long	.LC6737
	.value	4204
	.value	-30716
	.long	.LC6738
	.long	.LC6739
	.value	4204
	.value	-30715
	.long	.LC42
	.long	.LC6740
	.value	4206
	.value	17250
	.long	.LC6741
	.long	.LC6742
	.value	5719
	.value	1606
	.long	.LC6743
	.long	.LC6744
	.value	4211
	.value	1
	.long	.LC42
	.long	.LC6745
	.value	4211
	.value	2
	.long	.LC6746
	.long	.LC6747
	.value	4211
	.value	3
	.long	.LC6748
	.long	.LC42
	.value	4211
	.value	4
	.long	.LC6749
	.long	.LC6750
	.value	4211
	.value	5
	.long	.LC6751
	.long	.LC6752
	.value	4211
	.value	6
	.long	.LC6751
	.long	.LC6752
	.value	4211
	.value	8
	.long	.LC6751
	.long	.LC6752
	.value	4211
	.value	10
	.long	.LC6753
	.long	.LC6754
	.value	4211
	.value	12
	.long	.LC6755
	.long	.LC6756
	.value	4211
	.value	13
	.long	.LC6757
	.long	.LC6758
	.value	4211
	.value	16
	.long	.LC6759
	.long	.LC6760
	.value	4211
	.value	18
	.long	.LC6749
	.long	.LC6761
	.value	4211
	.value	32
	.long	.LC6762
	.long	.LC6763
	.value	4211
	.value	4096
	.long	.LC6764
	.long	.LC6765
	.value	4211
	.value	8192
	.long	.LC6766
	.long	.LC6767
	.value	4212
	.value	20088
	.long	.LC6768
	.long	.LC6769
	.value	4215
	.value	4118
	.long	.LC6770
	.long	.LC6771
	.value	4215
	.value	4128
	.long	.LC6772
	.long	.LC6773
	.value	4215
	.value	4130
	.long	.LC6774
	.long	.LC4431
	.value	4215
	.value	4224
	.long	.LC6775
	.long	.LC6776
	.value	4215
	.value	4630
	.long	.LC6777
	.long	.LC6778
	.value	4215
	.value	4672
	.long	.LC6779
	.long	.LC6776
	.value	4215
	.value	4736
	.long	.LC6780
	.long	.LC6776
	.value	4215
	.value	8224
	.long	.LC6781
	.long	.LC6782
	.value	4215
	.value	8448
	.long	.LC6783
	.long	.LC6784
	.value	4215
	.value	8704
	.long	.LC6785
	.long	.LC6786
	.value	4215
	.value	8960
	.long	.LC6787
	.long	.LC6788
	.value	4215
	.value	8978
	.long	.LC6789
	.long	.LC3700
	.value	4215
	.value	9250
	.long	.LC6790
	.long	.LC6791
	.value	4215
	.value	9266
	.long	.LC6792
	.long	.LC6793
	.value	4215
	.value	12304
	.long	.LC3509
	.long	.LC3509
	.value	4215
	.value	16384
	.long	.LC42
	.long	.LC42
	.value	4215
	.value	16400
	.long	.LC42
	.long	.LC42
	.value	4215
	.value	25634
	.long	.LC6794
	.long	.LC6795
	.value	4215
	.value	25650
	.long	.LC6796
	.long	.LC6797
	.value	4216
	.value	0
	.long	.LC6798
	.long	.LC4336
	.value	4216
	.value	1
	.long	.LC6799
	.long	.LC6800
	.value	4216
	.value	2
	.long	.LC6798
	.long	.LC4336
	.value	4216
	.value	256
	.long	.LC6801
	.long	.LC6802
	.value	4216
	.value	257
	.long	.LC6801
	.long	.LC6803
	.value	4216
	.value	258
	.long	.LC6801
	.long	.LC2677
	.value	4216
	.value	259
	.long	.LC6801
	.long	.LC4985
	.value	4216
	.value	260
	.long	.LC6801
	.long	.LC3198
	.value	4216
	.value	1024
	.long	.LC4362
	.long	.LC4369
	.value	4216
	.value	1025
	.long	.LC4362
	.long	.LC3643
	.value	4216
	.value	1026
	.long	.LC4362
	.long	.LC2677
	.value	4216
	.value	1027
	.long	.LC4362
	.long	.LC6804
	.value	4217
	.value	3329
	.long	.LC42
	.long	.LC42
	.value	21580
	.value	848
	.long	.LC42
	.long	.LC42
	.value	4221
	.value	0
	.long	.LC6805
	.long	.LC6806
	.value	4222
	.value	1
	.long	.LC6807
	.long	.LC6808
	.value	4222
	.value	2
	.long	.LC42
	.long	.LC6809
	.value	4222
	.value	4
	.long	.LC6810
	.long	.LC6811
	.value	4222
	.value	5
	.long	.LC6812
	.long	.LC6811
	.value	4222
	.value	8
	.long	.LC6813
	.long	.LC6814
	.value	4222
	.value	-28669
	.long	.LC6815
	.long	.LC42
	.value	4222
	.value	-28665
	.long	.LC6816
	.long	.LC42
	.value	4222
	.value	-28664
	.long	.LC6817
	.long	.LC42
	.value	4222
	.value	-28660
	.long	.LC6818
	.long	.LC42
	.value	4222
	.value	-28658
	.long	.LC6819
	.long	.LC42
	.value	4222
	.value	-28655
	.long	.LC6820
	.long	.LC42
	.value	4222
	.value	-28653
	.long	.LC6821
	.long	.LC42
	.value	4222
	.value	-28637
	.long	.LC6815
	.long	.LC42
	.value	4222
	.value	-28633
	.long	.LC6822
	.long	.LC42
	.value	4222
	.value	-28623
	.long	.LC6820
	.long	.LC42
	.value	4222
	.value	-28621
	.long	.LC6823
	.long	.LC6824
	.value	4222
	.value	-28576
	.long	.LC6825
	.long	.LC6826
	.value	4222
	.value	-28560
	.long	.LC6827
	.long	.LC6828
	.value	4222
	.value	-28544
	.long	.LC6829
	.long	.LC6830
	.value	4222
	.value	-28543
	.long	.LC6831
	.long	.LC6830
	.value	4222
	.value	-28542
	.long	.LC6832
	.long	.LC6830
	.value	4222
	.value	-28528
	.long	.LC6833
	.long	.LC6834
	.value	4222
	.value	-28512
	.long	.LC6835
	.long	.LC6836
	.value	4223
	.value	2050
	.long	.LC6837
	.long	.LC6838
	.value	4223
	.value	2051
	.long	.LC42
	.long	.LC6839
	.value	4223
	.value	2054
	.long	.LC42
	.long	.LC3314
	.value	4223
	.value	8213
	.long	.LC42
	.long	.LC3314
	.value	4224
	.value	1536
	.long	.LC6840
	.long	.LC5329
	.value	4224
	.value	-14703
	.long	.LC6841
	.long	.LC6842
	.value	4224
	.value	-14701
	.long	.LC6843
	.long	.LC2692
	.value	4225
	.value	3399
	.long	.LC6844
	.long	.LC6845
	.value	4227
	.value	1
	.long	.LC6846
	.long	.LC6847
	.value	4227
	.value	1555
	.long	.LC42
	.long	.LC2686
	.value	4229
	.value	1
	.long	.LC6848
	.long	.LC6849
	.value	4231
	.value	-28160
	.long	.LC42
	.long	.LC42
	.value	4234
	.value	1
	.long	.LC6850
	.long	.LC6851
	.value	4234
	.value	16
	.long	.LC6852
	.long	.LC6853
	.value	4234
	.value	64
	.long	.LC6854
	.long	.LC42
	.value	4234
	.value	12288
	.long	.LC6855
	.long	.LC6853
	.value	4237
	.value	1
	.long	.LC6856
	.long	.LC6857
	.value	4237
	.value	2
	.long	.LC6858
	.long	.LC6859
	.value	4237
	.value	4
	.long	.LC6860
	.long	.LC6861
	.value	4237
	.value	5
	.long	.LC6862
	.long	.LC6863
	.value	4237
	.value	6
	.long	.LC6864
	.long	.LC6865
	.value	4237
	.value	7
	.long	.LC6866
	.long	.LC6861
	.value	4237
	.value	8
	.long	.LC6867
	.long	.LC6868
	.value	4237
	.value	10
	.long	.LC6869
	.long	.LC6870
	.value	4237
	.value	17
	.long	.LC6871
	.long	.LC5205
	.value	4237
	.value	18
	.long	.LC6872
	.long	.LC6873
	.value	4237
	.value	19
	.long	.LC6874
	.long	.LC6875
	.value	4237
	.value	20
	.long	.LC6876
	.long	.LC6873
	.value	4237
	.value	25
	.long	.LC6877
	.long	.LC6878
	.value	4237
	.value	33
	.long	.LC6879
	.long	.LC6880
	.value	4237
	.value	34
	.long	.LC42
	.long	.LC2705
	.value	4238
	.value	1
	.long	.LC6881
	.long	.LC42
	.value	4238
	.value	4096
	.long	.LC6882
	.long	.LC6883
	.value	4238
	.value	4097
	.long	.LC6882
	.long	.LC6884
	.value	4238
	.value	4352
	.long	.LC6885
	.long	.LC42
	.value	4238
	.value	4353
	.long	.LC6886
	.long	.LC42
	.value	4238
	.value	4354
	.long	.LC6887
	.long	.LC42
	.value	4238
	.value	4355
	.long	.LC6888
	.long	.LC42
	.value	4238
	.value	11181
	.long	.LC6889
	.long	.LC6890
	.value	4238
	.value	20480
	.long	.LC6891
	.long	.LC6892
	.value	4238
	.value	20547
	.long	.LC6893
	.long	.LC6894
	.value	4238
	.value	28771
	.long	.LC6895
	.long	.LC6896
	.value	4238
	.value	-32768
	.long	.LC6897
	.long	.LC6898
	.value	4238
	.value	-32767
	.long	.LC6899
	.long	.LC6900
	.value	4238
	.value	-24576
	.long	.LC6901
	.long	.LC6902
	.value	4238
	.value	-24575
	.long	.LC6903
	.long	.LC6904
	.value	4238
	.value	-21574
	.long	.LC6905
	.long	.LC6906
	.value	4241
	.value	32
	.long	.LC42
	.long	.LC6907
	.value	4241
	.value	33
	.long	.LC42
	.long	.LC6908
	.value	4241
	.value	64
	.long	.LC42
	.long	.LC6909
	.value	4241
	.value	65
	.long	.LC42
	.long	.LC6909
	.value	4241
	.value	96
	.long	.LC42
	.long	.LC6910
	.value	4241
	.value	228
	.long	.LC6911
	.long	.LC42
	.value	4241
	.value	1824
	.long	.LC42
	.long	.LC6912
	.value	4242
	.value	160
	.long	.LC6913
	.long	.LC2878
	.value	4242
	.value	168
	.long	.LC6914
	.long	.LC2878
	.value	4242
	.value	1360
	.long	.LC6915
	.long	.LC42
	.value	4242
	.value	2260
	.long	.LC6916
	.long	.LC6917
	.value	4242
	.value	2380
	.long	.LC6918
	.long	.LC6918
	.value	4242
	.value	2504
	.long	.LC6919
	.long	.LC6920
	.value	4242
	.value	4098
	.long	.LC6921
	.long	.LC6922
	.value	4242
	.value	4242
	.long	.LC6923
	.long	.LC6924
	.value	4242
	.value	24864
	.long	.LC6925
	.long	.LC6926
	.value	4242
	.value	-30704
	.long	.LC6927
	.long	.LC2878
	.value	4242
	.value	-30703
	.long	.LC6928
	.long	.LC2878
	.value	4242
	.value	-30592
	.long	.LC6929
	.long	.LC42
	.value	4242
	.value	-30591
	.long	.LC6929
	.long	.LC2878
	.value	4242
	.value	-30544
	.long	.LC6930
	.long	.LC2878
	.value	4242
	.value	-30543
	.long	.LC6930
	.long	.LC2878
	.value	4242
	.value	-30528
	.long	.LC6931
	.long	.LC2878
	.value	4242
	.value	-30527
	.long	.LC6931
	.long	.LC2878
	.value	4242
	.value	-30512
	.long	.LC6931
	.long	.LC2878
	.value	4242
	.value	-30511
	.long	.LC6931
	.long	.LC2878
	.value	4242
	.value	-30480
	.long	.LC6930
	.long	.LC2878
	.value	4242
	.value	-30479
	.long	.LC6930
	.long	.LC2878
	.value	4242
	.value	-26506
	.long	.LC42
	.long	.LC6932
	.value	4242
	.value	-26215
	.long	.LC6933
	.long	.LC6934
	.value	4243
	.value	352
	.long	.LC6935
	.long	.LC6936
	.value	4243
	.value	353
	.long	.LC6937
	.long	.LC6938
	.value	4243
	.value	354
	.long	.LC6939
	.long	.LC6940
	.value	4243
	.value	4432
	.long	.LC6941
	.long	.LC6942
	.value	4243
	.value	4464
	.long	.LC6943
	.long	.LC42
	.value	4243
	.value	4480
	.long	.LC6944
	.long	.LC42
	.value	4243
	.value	4496
	.long	.LC6945
	.long	.LC42
	.value	4243
	.value	4528
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	4544
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	4560
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	4576
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	4720
	.long	.LC6946
	.long	.LC6947
	.value	4243
	.value	4784
	.long	.LC6948
	.long	.LC6949
	.value	4243
	.value	4880
	.long	.LC6950
	.long	.LC6951
	.value	4243
	.value	4896
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	4912
	.long	.LC6952
	.long	.LC42
	.value	4243
	.value	4928
	.long	.LC6953
	.long	.LC6947
	.value	4243
	.value	4944
	.long	.LC6954
	.long	.LC6955
	.value	4243
	.value	4960
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	6096
	.long	.LC6956
	.long	.LC42
	.value	4243
	.value	6320
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	10416
	.long	.LC6957
	.long	.LC6958
	.value	4243
	.value	10848
	.long	.LC6959
	.long	.LC42
	.value	4243
	.value	10864
	.long	.LC6960
	.long	.LC6947
	.value	4243
	.value	10880
	.long	.LC6961
	.long	.LC6947
	.value	4243
	.value	11040
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	11392
	.long	.LC6962
	.long	.LC42
	.value	4243
	.value	11424
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	28847
	.long	.LC6963
	.long	.LC6964
	.value	4243
	.value	28856
	.long	.LC6965
	.long	.LC6966
	.value	4243
	.value	-20479
	.long	.LC6967
	.long	.LC42
	.value	4243
	.value	-20463
	.long	.LC6968
	.long	.LC42
	.value	4243
	.value	-20447
	.long	.LC6969
	.long	.LC42
	.value	4243
	.value	-20431
	.long	.LC6970
	.long	.LC42
	.value	4243
	.value	-20415
	.long	.LC6971
	.long	.LC42
	.value	4243
	.value	-20399
	.long	.LC6972
	.long	.LC42
	.value	4243
	.value	-20383
	.long	.LC6973
	.long	.LC42
	.value	4243
	.value	-20367
	.long	.LC6974
	.long	.LC42
	.value	4243
	.value	-20351
	.long	.LC6975
	.long	.LC42
	.value	4243
	.value	-20335
	.long	.LC6976
	.long	.LC42
	.value	4243
	.value	-14335
	.long	.LC6256
	.long	.LC6977
	.value	4243
	.value	-14319
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	-14303
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	-14287
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	-14272
	.long	.LC42
	.long	.LC42
	.value	4243
	.value	-11984
	.long	.LC6978
	.long	.LC6979
	.value	4245
	.value	576
	.long	.LC6980
	.long	.LC6981
	.value	4245
	.value	578
	.long	.LC6982
	.long	.LC6983
	.value	4245
	.value	580
	.long	.LC6982
	.long	.LC6984
	.value	4245
	.value	1600
	.long	.LC6985
	.long	.LC6838
	.value	4245
	.value	1601
	.long	.LC6986
	.long	.LC6987
	.value	4245
	.value	1602
	.long	.LC6988
	.long	.LC6989
	.value	4245
	.value	1603
	.long	.LC6990
	.long	.LC6991
	.value	4245
	.value	1606
	.long	.LC6992
	.long	.LC6993
	.value	4245
	.value	1607
	.long	.LC6994
	.long	.LC6995
	.value	4245
	.value	1608
	.long	.LC6996
	.long	.LC6997
	.value	4245
	.value	1609
	.long	.LC6998
	.long	.LC6999
	.value	4245
	.value	1616
	.long	.LC7000
	.long	.LC7001
	.value	4245
	.value	1648
	.long	.LC7002
	.long	.LC7003
	.value	4245
	.value	1651
	.long	.LC7004
	.long	.LC7005
	.value	4245
	.value	1664
	.long	.LC7006
	.long	.LC7007
	.value	4245
	.value	5010
	.long	.LC7008
	.long	.LC7009
	.value	4245
	.value	9301
	.long	.LC7010
	.long	.LC7011
	.value	4245
	.value	12562
	.long	.LC6980
	.long	.LC6981
	.value	4245
	.value	12564
	.long	.LC7012
	.long	.LC7013
	.value	4245
	.value	12580
	.long	.LC7014
	.long	.LC3532
	.value	4245
	.value	12594
	.long	.LC7015
	.long	.LC7016
	.value	4245
	.value	13586
	.long	.LC7017
	.long	.LC7013
	.value	4245
	.value	13617
	.long	.LC7018
	.long	.LC7019
	.value	4246
	.value	4358
	.long	.LC7020
	.long	.LC7021
	.value	4247
	.value	56
	.long	.LC42
	.long	.LC7022
	.value	4248
	.value	1
	.long	.LC7023
	.long	.LC3314
	.value	4248
	.value	2
	.long	.LC7024
	.long	.LC3314
	.value	4250
	.value	-32128
	.long	.LC7025
	.long	.LC7025
	.value	4254
	.value	848
	.long	.LC7026
	.long	.LC7027
	.value	4254
	.value	848
	.long	.LC4290
	.long	.LC7028
	.value	4254
	.value	849
	.long	.LC7029
	.long	.LC7030
	.value	4254
	.value	873
	.long	.LC7031
	.long	.LC4291
	.value	4254
	.value	876
	.long	.LC7032
	.long	.LC7033
	.value	4254
	.value	878
	.long	.LC7034
	.long	.LC7035
	.value	4254
	.value	879
	.long	.LC4290
	.long	.LC7036
	.value	4254
	.value	880
	.long	.LC7037
	.long	.LC4289
	.value	4254
	.value	2168
	.long	.LC7038
	.long	.LC7039
	.value	4254
	.value	2169
	.long	.LC7040
	.long	.LC7041
	.value	4254
	.value	2176
	.long	.LC7037
	.long	.LC7041
	.value	4254
	.value	4254
	.long	.LC7042
	.long	.LC7028
	.value	4254
	.value	8469
	.long	.LC7043
	.long	.LC7044
	.value	4254
	.value	8485
	.long	.LC7045
	.long	.LC7046
	.value	4254
	.value	8548
	.long	.LC7047
	.long	.LC7048
	.value	4254
	.value	8549
	.long	.LC7049
	.long	.LC7050
	.value	4254
	.value	878
	.long	.LC7051
	.long	.LC7052
	.value	4254
	.value	878
	.long	.LC7053
	.long	.LC7054
	.value	4254
	.value	878
	.long	.LC7055
	.long	.LC7056
	.value	4254
	.value	-32208
	.long	.LC7057
	.long	.LC7058
	.value	4254
	.value	-31630
	.long	.LC7059
	.long	.LC7060
	.value	4254
	.value	-31628
	.long	.LC7061
	.long	.LC7062
	.value	4260
	.value	22889
	.long	.LC42
	.long	.LC42
	.value	-26366
	.value	1
	.long	.LC7063
	.long	.LC3793
	.value	-26366
	.value	2
	.long	.LC7063
	.long	.LC7064
	.value	-26366
	.value	3
	.long	.LC7065
	.long	.LC7066
	.value	4264
	.value	0
	.long	.LC2432
	.long	.LC7067
	.value	4265
	.value	4
	.long	.LC7068
	.long	.LC42
	.value	4265
	.value	5
	.long	.LC7069
	.long	.LC42
	.value	4265
	.value	6
	.long	.LC7070
	.long	.LC42
	.value	4265
	.value	7
	.long	.LC7071
	.long	.LC42
	.value	4265
	.value	8
	.long	.LC7072
	.long	.LC42
	.value	4265
	.value	9
	.long	.LC1220
	.long	.LC3139
	.value	4265
	.value	16
	.long	.LC139
	.long	.LC7073
	.value	4265
	.value	17
	.long	.LC7074
	.long	.LC42
	.value	4265
	.value	18
	.long	.LC7075
	.long	.LC42
	.value	4265
	.value	4097
	.long	.LC7076
	.long	.LC42
	.value	4265
	.value	4098
	.long	.LC7077
	.long	.LC42
	.value	4265
	.value	4099
	.long	.LC7078
	.long	.LC42
	.value	4265
	.value	4100
	.long	.LC7079
	.long	.LC42
	.value	4265
	.value	4101
	.long	.LC7080
	.long	.LC42
	.value	4265
	.value	4102
	.long	.LC7081
	.long	.LC42
	.value	4265
	.value	4103
	.long	.LC7082
	.long	.LC42
	.value	4265
	.value	4104
	.long	.LC7083
	.long	.LC42
	.value	4265
	.value	8193
	.long	.LC42
	.long	.LC7084
	.value	4265
	.value	8194
	.long	.LC7085
	.long	.LC42
	.value	4265
	.value	-32767
	.long	.LC7086
	.long	.LC42
	.value	4265
	.value	-32766
	.long	.LC7087
	.long	.LC42
	.value	4267
	.value	4101
	.long	.LC7088
	.long	.LC7089
	.value	4269
	.value	1
	.long	.LC6012
	.long	.LC6838
	.value	4269
	.value	259
	.long	.LC7090
	.long	.LC7091
	.value	4269
	.value	261
	.long	.LC7092
	.long	.LC7093
	.value	4269
	.value	1381
	.long	.LC7094
	.long	.LC7095
	.value	4277
	.value	804
	.long	.LC42
	.long	.LC42
	.value	4277
	.value	1152
	.long	.LC7096
	.long	.LC7097
	.value	4277
	.value	2400
	.long	.LC7098
	.long	.LC7099
	.value	4277
	.value	4144
	.long	.LC7100
	.long	.LC7101
	.value	4277
	.value	4180
	.long	.LC7102
	.long	.LC7103
	.value	4277
	.value	4216
	.long	.LC7104
	.long	.LC7105
	.value	4277
	.value	4355
	.long	.LC7104
	.long	.LC7106
	.value	4277
	.value	4422
	.long	.LC7104
	.long	.LC7107
	.value	4277
	.value	4423
	.long	.LC7104
	.long	.LC7108
	.value	4277
	.value	4433
	.long	.LC7109
	.long	.LC7101
	.value	4277
	.value	4434
	.long	.LC7109
	.long	.LC7101
	.value	4277
	.value	10020
	.long	.LC42
	.long	.LC7110
	.value	4277
	.value	12289
	.long	.LC7111
	.long	.LC7112
	.value	4277
	.value	21510
	.long	.LC7113
	.long	.LC7114
	.value	4277
	.value	22017
	.long	.LC7115
	.long	.LC7116
	.value	4277
	.value	25888
	.long	.LC7117
	.long	.LC7118
	.value	4277
	.value	-32495
	.long	.LC7119
	.long	.LC7120
	.value	4277
	.value	-32494
	.long	.LC7121
	.long	.LC7122
	.value	4277
	.value	-31479
	.long	.LC7123
	.long	.LC7124
	.value	4277
	.value	-31466
	.long	.LC7125
	.long	.LC7126
	.value	4277
	.value	-31464
	.long	.LC7127
	.long	.LC7128
	.value	4277
	.value	-31438
	.long	.LC7129
	.long	.LC7126
	.value	4277
	.value	-31416
	.long	.LC7130
	.long	.LC7131
	.value	4277
	.value	-28624
	.long	.LC7132
	.long	.LC7133
	.value	4277
	.value	-28618
	.long	.LC7134
	.long	.LC7135
	.value	4277
	.value	-28592
	.long	.LC7104
	.long	.LC7136
	.value	4277
	.value	-28590
	.long	.LC7137
	.long	.LC7138
	.value	4277
	.value	-28588
	.long	.LC2418
	.long	.LC7139
	.value	4277
	.value	-28586
	.long	.LC7140
	.long	.LC7141
	.value	4277
	.value	-28576
	.long	.LC7142
	.long	.LC7143
	.value	4277
	.value	-28563
	.long	.LC7144
	.long	.LC7143
	.value	4277
	.value	-28562
	.long	.LC7145
	.long	.LC7143
	.value	4277
	.value	-28544
	.long	.LC7146
	.long	.LC7147
	.value	4278
	.value	1
	.long	.LC7148
	.long	.LC7149
	.value	4278
	.value	2
	.long	.LC7148
	.long	.LC7150
	.value	4278
	.value	3
	.long	.LC7148
	.long	.LC7151
	.value	4278
	.value	4
	.long	.LC42
	.long	.LC7152
	.value	4278
	.value	6
	.long	.LC42
	.long	.LC7153
	.value	4278
	.value	7
	.long	.LC7154
	.long	.LC42
	.value	4278
	.value	9
	.long	.LC42
	.long	.LC7155
	.value	4278
	.value	10
	.long	.LC42
	.long	.LC7156
	.value	4278
	.value	11
	.long	.LC42
	.long	.LC7157
	.value	4278
	.value	4096
	.long	.LC7158
	.long	.LC7159
	.value	4278
	.value	4097
	.long	.LC7160
	.long	.LC7159
	.value	4278
	.value	4098
	.long	.LC7160
	.long	.LC2705
	.value	4279
	.value	1
	.long	.LC7161
	.long	.LC7162
	.value	4279
	.value	19
	.long	.LC7163
	.long	.LC7164
	.value	4279
	.value	4096
	.long	.LC7165
	.long	.LC7166
	.value	4279
	.value	4102
	.long	.LC7167
	.long	.LC7168
	.value	4279
	.value	4103
	.long	.LC7169
	.long	.LC7170
	.value	4279
	.value	5888
	.long	.LC7171
	.long	.LC7172
	.value	4279
	.value	7967
	.long	.LC7173
	.long	.LC7174
	.value	4279
	.value	13200
	.long	.LC7175
	.long	.LC7176
	.value	4279
	.value	13712
	.long	.LC7177
	.long	.LC7178
	.value	4279
	.value	17664
	.long	.LC7179
	.long	.LC577
	.value	4279
	.value	20565
	.long	.LC7180
	.long	.LC7181
	.value	4279
	.value	20567
	.long	.LC7182
	.long	.LC7183
	.value	4279
	.value	20823
	.long	.LC7184
	.long	.LC7183
	.value	4279
	.value	21079
	.long	.LC7185
	.long	.LC7186
	.value	4279
	.value	22784
	.long	.LC7187
	.long	.LC7188
	.value	4279
	.value	22816
	.long	.LC7189
	.long	.LC7190
	.value	4279
	.value	22864
	.long	.LC7191
	.long	.LC7192
	.value	4279
	.value	22865
	.long	.LC7191
	.long	.LC7193
	.value	4279
	.value	22866
	.long	.LC7191
	.long	.LC7194
	.value	4279
	.value	22896
	.long	.LC7195
	.long	.LC7196
	.value	4279
	.value	23383
	.long	.LC7191
	.long	.LC7197
	.value	4279
	.value	24661
	.long	.LC7169
	.long	.LC7198
	.value	4279
	.value	24662
	.long	.LC7199
	.long	.LC7200
	.value	4279
	.value	25952
	.long	.LC7201
	.long	.LC7202
	.value	4279
	.value	25953
	.long	.LC7203
	.long	.LC7204
	.value	4279
	.value	25954
	.long	.LC7205
	.long	.LC7202
	.value	4279
	.value	25955
	.long	.LC7206
	.long	.LC7204
	.value	4279
	.value	25956
	.long	.LC7205
	.long	.LC7202
	.value	4279
	.value	25957
	.long	.LC7207
	.long	.LC7208
	.value	4279
	.value	30278
	.long	.LC7209
	.long	.LC7210
	.value	4279
	.value	30576
	.long	.LC2366
	.long	.LC7211
	.value	4279
	.value	-30703
	.long	.LC42
	.long	.LC7212
	.value	4279
	.value	-28672
	.long	.LC7213
	.long	.LC7214
	.value	4279
	.value	-28671
	.long	.LC7215
	.long	.LC7216
	.value	4279
	.value	-28668
	.long	.LC7213
	.long	.LC7217
	.value	4279
	.value	-28667
	.long	.LC7218
	.long	.LC7219
	.value	4279
	.value	-28666
	.long	.LC7220
	.long	.LC7221
	.value	4279
	.value	-28662
	.long	.LC7222
	.long	.LC7223
	.value	4279
	.value	-28592
	.long	.LC7224
	.long	.LC7225
	.value	4279
	.value	-28591
	.long	.LC7226
	.long	.LC7227
	.value	4279
	.value	-28587
	.long	.LC7228
	.long	.LC7229
	.value	4279
	.value	-28586
	.long	.LC7230
	.long	.LC7231
	.value	4279
	.value	-28584
	.long	.LC7232
	.long	.LC7233
	.value	4279
	.value	-28582
	.long	.LC7234
	.long	.LC7235
	.value	4279
	.value	-28160
	.long	.LC7236
	.long	.LC7237
	.value	4279
	.value	-28159
	.long	.LC7238
	.long	.LC7239
	.value	4279
	.value	-28158
	.long	.LC7238
	.long	.LC7240
	.value	4279
	.value	-28144
	.long	.LC7241
	.long	.LC7239
	.value	4279
	.value	-27904
	.long	.LC7242
	.long	.LC7243
	.value	4279
	.value	-26624
	.long	.LC7244
	.long	.LC7245
	.value	4279
	.value	-26619
	.long	.LC7244
	.long	.LC7246
	.value	4279
	.value	-26366
	.long	.LC7247
	.long	.LC7248
	.value	4279
	.value	-26365
	.long	.LC7249
	.long	.LC7248
	.value	4279
	.value	-26363
	.long	.LC7250
	.long	.LC7251
	.value	4279
	.value	-26360
	.long	.LC7252
	.long	.LC7253
	.value	4279
	.value	-26359
	.long	.LC7254
	.long	.LC7253
	.value	4279
	.value	-12284
	.long	.LC7255
	.long	.LC7256
	.value	4280
	.value	5
	.long	.LC7257
	.long	.LC7258
	.value	4280
	.value	6
	.long	.LC7259
	.long	.LC7260
	.value	4280
	.value	4096
	.long	.LC7261
	.long	.LC7262
	.value	4280
	.value	4097
	.long	.LC7263
	.long	.LC7262
	.value	4280
	.value	-24559
	.long	.LC7264
	.long	.LC7265
	.value	4280
	.value	-20218
	.long	.LC7266
	.long	.LC2440
	.value	4281
	.value	257
	.long	.LC7267
	.long	.LC7268
	.value	4281
	.value	258
	.long	.LC7267
	.long	.LC7268
	.value	4281
	.value	273
	.long	.LC7269
	.long	.LC7270
	.value	4281
	.value	1920
	.long	.LC2366
	.long	.LC6588
	.value	4281
	.value	1922
	.long	.LC2366
	.long	.LC6588
	.value	4281
	.value	4281
	.long	.LC7271
	.long	.LC7272
	.value	4281
	.value	5173
	.long	.LC5328
	.long	.LC6224
	.value	4281
	.value	5189
	.long	.LC5330
	.long	.LC7273
	.value	4281
	.value	5193
	.long	.LC5332
	.long	.LC4336
	.value	4281
	.value	5201
	.long	.LC5333
	.long	.LC7274
	.value	4281
	.value	5217
	.long	.LC5335
	.long	.LC5336
	.value	4281
	.value	5257
	.long	.LC5337
	.long	.LC5666
	.value	4281
	.value	5393
	.long	.LC5338
	.long	.LC7275
	.value	4281
	.value	5395
	.long	.LC5340
	.long	.LC7276
	.value	4281
	.value	5409
	.long	.LC5341
	.long	.LC7277
	.value	4281
	.value	5411
	.long	.LC5342
	.long	.LC4336
	.value	4281
	.value	5427
	.long	.LC7278
	.long	.LC5347
	.value	4281
	.value	5429
	.long	.LC7279
	.long	.LC4336
	.value	4281
	.value	5441
	.long	.LC5348
	.long	.LC7280
	.value	4281
	.value	5443
	.long	.LC7281
	.long	.LC7282
	.value	4281
	.value	5473
	.long	.LC5354
	.long	.LC5231
	.value	4281
	.value	5475
	.long	.LC7283
	.long	.LC7284
	.value	4281
	.value	5682
	.long	.LC7285
	.long	.LC5231
	.value	4281
	.value	5697
	.long	.LC5359
	.long	.LC4369
	.value	4281
	.value	5700
	.long	.LC7286
	.long	.LC7287
	.value	4281
	.value	5702
	.long	.LC7288
	.long	.LC7287
	.value	4281
	.value	5703
	.long	.LC7289
	.long	.LC4369
	.value	4281
	.value	5713
	.long	.LC7290
	.long	.LC4369
	.value	4281
	.value	5729
	.long	.LC7291
	.long	.LC7287
	.value	4281
	.value	5735
	.long	.LC7292
	.long	.LC7287
	.value	4281
	.value	5745
	.long	.LC7293
	.long	.LC7294
	.value	4281
	.value	5746
	.long	.LC7295
	.long	.LC7287
	.value	4281
	.value	5761
	.long	.LC7296
	.long	.LC7297
	.value	4281
	.value	5767
	.long	.LC7298
	.long	.LC7299
	.value	4281
	.value	12609
	.long	.LC5361
	.long	.LC2878
	.value	4281
	.value	12611
	.long	.LC5362
	.long	.LC2878
	.value	4281
	.value	12613
	.long	.LC5363
	.long	.LC2878
	.value	4281
	.value	12615
	.long	.LC5364
	.long	.LC2878
	.value	4281
	.value	12617
	.long	.LC5365
	.long	.LC2878
	.value	4281
	.value	12625
	.long	.LC5366
	.long	.LC2878
	.value	4281
	.value	13063
	.long	.LC5367
	.long	.LC5368
	.value	4281
	.value	13065
	.long	.LC5369
	.long	.LC5370
	.value	4281
	.value	21010
	.long	.LC5371
	.long	.LC42
	.value	4281
	.value	21013
	.long	.LC7300
	.long	.LC6838
	.value	4281
	.value	21015
	.long	.LC7301
	.long	.LC7302
	.value	4281
	.value	21017
	.long	.LC2432
	.long	.LC7303
	.value	4281
	.value	21029
	.long	.LC5375
	.long	.LC2677
	.value	4281
	.value	21032
	.long	.LC7283
	.long	.LC7304
	.value	4281
	.value	21033
	.long	.LC7305
	.long	.LC3314
	.value	4281
	.value	21033
	.long	.LC2432
	.long	.LC7306
	.value	4281
	.value	21033
	.long	.LC2432
	.long	.LC7307
	.value	4281
	.value	21033
	.long	.LC2432
	.long	.LC7308
	.value	4281
	.value	21033
	.long	.LC2432
	.long	.LC7309
	.value	4281
	.value	21033
	.long	.LC2432
	.long	.LC7310
	.value	4281
	.value	21045
	.long	.LC5355
	.long	.LC5373
	.value	4281
	.value	21046
	.long	.LC7311
	.long	.LC7312
	.value	4281
	.value	21047
	.long	.LC7313
	.long	.LC7314
	.value	4281
	.value	21049
	.long	.LC7315
	.long	.LC7316
	.value	4281
	.value	21065
	.long	.LC7317
	.long	.LC7318
	.value	4281
	.value	21073
	.long	.LC7319
	.long	.LC7320
	.value	4281
	.value	21075
	.long	.LC7321
	.long	.LC7320
	.value	4281
	.value	21089
	.long	.LC7322
	.long	.LC5205
	.value	4281
	.value	21091
	.long	.LC7323
	.long	.LC7324
	.value	4281
	.value	21121
	.long	.LC7325
	.long	.LC7326
	.value	4281
	.value	21127
	.long	.LC7327
	.long	.LC4552
	.value	4281
	.value	21128
	.long	.LC7328
	.long	.LC7329
	.value	4281
	.value	21129
	.long	.LC7330
	.long	.LC7331
	.value	4281
	.value	21584
	.long	.LC7332
	.long	.LC7333
	.value	4281
	.value	21585
	.long	.LC5382
	.long	.LC7334
	.value	4281
	.value	21589
	.long	.LC7335
	.long	.LC3383
	.value	4281
	.value	21591
	.long	.LC7336
	.long	.LC7337
	.value	4281
	.value	21593
	.long	.LC7338
	.long	.LC7339
	.value	4281
	.value	21601
	.long	.LC7340
	.long	.LC7341
	.value	4281
	.value	21617
	.long	.LC7335
	.long	.LC7342
	.value	4281
	.value	21619
	.long	.LC7335
	.long	.LC7343
	.value	4281
	.value	28929
	.long	.LC5386
	.long	.LC3643
	.value	4281
	.value	29809
	.long	.LC7335
	.long	.LC7342
	.value	4281
	.value	-26506
	.long	.LC7344
	.long	.LC7345
	.value	4282
	.value	772
	.long	.LC42
	.long	.LC2878
	.value	4285
	.value	2051
	.long	.LC7346
	.long	.LC7347
	.value	4285
	.value	3636
	.long	.LC7348
	.long	.LC7349
	.value	4285
	.value	21056
	.long	.LC7350
	.long	.LC7351
	.value	4285
	.value	21057
	.long	.LC42
	.long	.LC3195
	.value	4285
	.value	21058
	.long	.LC42
	.long	.LC7352
	.value	4285
	.value	21059
	.long	.LC7353
	.long	.LC7354
	.value	4285
	.value	21060
	.long	.LC42
	.long	.LC7355
	.value	4285
	.value	-32455
	.long	.LC7356
	.long	.LC7357
	.value	4291
	.value	-30432
	.long	.LC7358
	.long	.LC42
	.value	4291
	.value	-30427
	.long	.LC42
	.long	.LC42
	.value	4292
	.value	-31901
	.long	.LC7359
	.long	.LC7360
	.value	4296
	.value	4
	.long	.LC42
	.long	.LC42
	.value	4296
	.value	0
	.long	.LC42
	.long	.LC7361
	.value	4296
	.value	3
	.long	.LC7362
	.long	.LC7363
	.value	4296
	.value	4
	.long	.LC7364
	.long	.LC7365
	.value	4296
	.value	5
	.long	.LC7366
	.long	.LC7367
	.value	4296
	.value	6
	.long	.LC7368
	.long	.LC7369
	.value	4296
	.value	22
	.long	.LC7370
	.long	.LC7371
	.value	4296
	.value	37
	.long	.LC7372
	.long	.LC7373
	.value	4296
	.value	131
	.long	.LC7374
	.long	.LC7375
	.value	4296
	.value	-32763
	.long	.LC7366
	.long	.LC7376
	.value	4296
	.value	-32762
	.long	.LC7368
	.long	.LC7377
	.value	4296
	.value	-32746
	.long	.LC7370
	.long	.LC7378
	.value	4301
	.value	4352
	.long	.LC7379
	.long	.LC7380
	.value	4301
	.value	4608
	.long	.LC7381
	.long	.LC7382
	.value	4301
	.value	4864
	.long	.LC7383
	.long	.LC7383
	.value	4301
	.value	8960
	.long	.LC7384
	.long	.LC7385
	.value	4301
	.value	9472
	.long	.LC7386
	.long	.LC7387
	.value	4301
	.value	16384
	.long	.LC7388
	.long	.LC7389
	.value	4303
	.value	4293
	.long	.LC7390
	.long	.LC7391
	.value	4303
	.value	8193
	.long	.LC7392
	.long	.LC7393
	.value	4303
	.value	8194
	.long	.LC7394
	.long	.LC7395
	.value	4303
	.value	8197
	.long	.LC7396
	.long	.LC7397
	.value	4303
	.value	8204
	.long	.LC7396
	.long	.LC7398
	.value	4303
	.value	8208
	.long	.LC42
	.long	.LC7399
	.value	4303
	.value	8209
	.long	.LC42
	.long	.LC7400
	.value	4303
	.value	8217
	.long	.LC7401
	.long	.LC7402
	.value	4303
	.value	8222
	.long	.LC7403
	.long	.LC7404
	.value	4310
	.value	-175
	.long	.LC7405
	.long	.LC7406
	.value	4310
	.value	-154
	.long	.LC7405
	.long	.LC7406
	.value	5720
	.value	1796
	.long	.LC7407
	.long	.LC7408
	.value	4313
	.value	102
	.long	.LC7409
	.long	.LC7410
	.value	4313
	.value	1298
	.long	.LC7411
	.long	.LC6411
	.value	4313
	.value	1329
	.long	.LC2522
	.long	.LC2523
	.value	4313
	.value	1330
	.long	.LC7412
	.long	.LC7413
	.value	4313
	.value	1363
	.long	.LC7414
	.long	.LC2671
	.value	4313
	.value	-31195
	.long	.LC7415
	.long	.LC7416
	.value	4313
	.value	-31194
	.long	.LC7417
	.long	.LC42
	.value	4313
	.value	-31193
	.long	.LC7417
	.long	.LC42
	.value	4313
	.value	-30584
	.long	.LC7415
	.long	.LC7418
	.value	4313
	.value	-16107
	.long	.LC7419
	.long	.LC42
	.value	4316
	.value	1
	.long	.LC7420
	.long	.LC7421
	.value	4316
	.value	2
	.long	.LC7422
	.long	.LC7423
	.value	4316
	.value	4
	.long	.LC7424
	.long	.LC7425
	.value	4316
	.value	16
	.long	.LC7426
	.long	.LC7427
	.value	4316
	.value	17
	.long	.LC7428
	.long	.LC7429
	.value	4316
	.value	18
	.long	.LC7430
	.long	.LC7431
	.value	4316
	.value	33
	.long	.LC42
	.long	.LC7432
	.value	4316
	.value	34
	.long	.LC42
	.long	.LC7433
	.value	4316
	.value	51
	.long	.LC7434
	.long	.LC7435
	.value	4316
	.value	257
	.long	.LC7436
	.long	.LC7437
	.value	4316
	.value	362
	.long	.LC7438
	.long	.LC7439
	.value	4316
	.value	4316
	.long	.LC7422
	.long	.LC7440
	.value	4316
	.value	769
	.long	.LC7441
	.long	.LC7442
	.value	4316
	.value	804
	.long	.LC7443
	.long	.LC7444
	.value	4317
	.value	1
	.long	.LC42
	.long	.LC7445
	.value	4318
	.value	1263
	.long	.LC7446
	.long	.LC7447
	.value	4318
	.value	1
	.long	.LC7448
	.long	.LC7449
	.value	4318
	.value	3
	.long	.LC7450
	.long	.LC7451
	.value	4318
	.value	8
	.long	.LC7452
	.long	.LC7453
	.value	4318
	.value	9
	.long	.LC7452
	.long	.LC7453
	.value	4318
	.value	16
	.long	.LC7454
	.long	.LC7455
	.value	4318
	.value	24
	.long	.LC7446
	.long	.LC7447
	.value	4318
	.value	25
	.long	.LC7446
	.long	.LC7456
	.value	4318
	.value	32
	.long	.LC7457
	.long	.LC7458
	.value	4318
	.value	40
	.long	.LC7459
	.long	.LC7460
	.value	4318
	.value	41
	.long	.LC7459
	.long	.LC7461
	.value	4318
	.value	42
	.long	.LC7459
	.long	.LC7462
	.value	4318
	.value	43
	.long	.LC7459
	.long	.LC7463
	.value	4318
	.value	44
	.long	.LC7464
	.long	.LC7465
	.value	4318
	.value	45
	.long	.LC7459
	.long	.LC7466
	.value	4318
	.value	46
	.long	.LC7467
	.long	.LC7468
	.value	4318
	.value	47
	.long	.LC7467
	.long	.LC7468
	.value	4318
	.value	53
	.long	.LC7469
	.long	.LC7470
	.value	4318
	.value	54
	.long	.LC7469
	.long	.LC7471
	.value	4318
	.value	62
	.long	.LC7469
	.long	.LC7471
	.value	4318
	.value	64
	.long	.LC7472
	.long	.LC7473
	.value	4318
	.value	65
	.long	.LC7474
	.long	.LC7475
	.value	4318
	.value	66
	.long	.LC7476
	.long	.LC7477
	.value	4318
	.value	67
	.long	.LC7478
	.long	.LC7479
	.value	4318
	.value	69
	.long	.LC7480
	.long	.LC7481
	.value	4318
	.value	73
	.long	.LC7482
	.long	.LC2366
	.value	4318
	.value	78
	.long	.LC7482
	.long	.LC7483
	.value	4318
	.value	83
	.long	.LC7484
	.long	.LC7485
	.value	4318
	.value	84
	.long	.LC7484
	.long	.LC7486
	.value	4318
	.value	85
	.long	.LC7484
	.long	.LC7486
	.value	4318
	.value	87
	.long	.LC7487
	.long	.LC7488
	.value	4318
	.value	89
	.long	.LC7489
	.long	.LC7490
	.value	4318
	.value	96
	.long	.LC7491
	.long	.LC4336
	.value	4318
	.value	100
	.long	.LC7492
	.long	.LC3261
	.value	4318
	.value	101
	.long	.LC7493
	.long	.LC3478
	.value	4318
	.value	102
	.long	.LC7492
	.long	.LC7494
	.value	4318
	.value	103
	.long	.LC7491
	.long	.LC7495
	.value	4318
	.value	104
	.long	.LC7491
	.long	.LC7496
	.value	4318
	.value	106
	.long	.LC7491
	.long	.LC7497
	.value	4318
	.value	107
	.long	.LC7498
	.long	.LC7499
	.value	4318
	.value	108
	.long	.LC7500
	.long	.LC2519
	.value	4318
	.value	109
	.long	.LC7492
	.long	.LC7497
	.value	4318
	.value	110
	.long	.LC7491
	.long	.LC7501
	.value	4318
	.value	133
	.long	.LC7502
	.long	.LC7503
	.value	4318
	.value	140
	.long	.LC7504
	.long	.LC7505
	.value	4318
	.value	142
	.long	.LC7502
	.long	.LC7506
	.value	4318
	.value	145
	.long	.LC7507
	.long	.LC7508
	.value	4318
	.value	146
	.long	.LC7509
	.long	.LC7510
	.value	4318
	.value	156
	.long	.LC7511
	.long	.LC7512
	.value	4318
	.value	157
	.long	.LC2432
	.long	.LC7513
	.value	4318
	.value	160
	.long	.LC7459
	.long	.LC7514
	.value	4318
	.value	192
	.long	.LC7515
	.long	.LC7516
	.value	4318
	.value	193
	.long	.LC7517
	.long	.LC7518
	.value	4318
	.value	194
	.long	.LC7519
	.long	.LC2366
	.value	4318
	.value	200
	.long	.LC7520
	.long	.LC7521
	.value	4318
	.value	201
	.long	.LC7520
	.long	.LC7522
	.value	4318
	.value	204
	.long	.LC7520
	.long	.LC7523
	.value	4318
	.value	205
	.long	.LC7524
	.long	.LC7525
	.value	4318
	.value	206
	.long	.LC7524
	.long	.LC7526
	.value	4318
	.value	208
	.long	.LC7527
	.long	.LC3679
	.value	4318
	.value	209
	.long	.LC7527
	.long	.LC2686
	.value	4318
	.value	210
	.long	.LC7528
	.long	.LC3793
	.value	4318
	.value	212
	.long	.LC7529
	.long	.LC3261
	.value	4318
	.value	213
	.long	.LC7530
	.long	.LC7531
	.value	4318
	.value	214
	.long	.LC7532
	.long	.LC7533
	.value	4318
	.value	215
	.long	.LC7532
	.long	.LC7534
	.value	4318
	.value	216
	.long	.LC7532
	.long	.LC7535
	.value	4318
	.value	217
	.long	.LC7527
	.long	.LC7536
	.value	4318
	.value	218
	.long	.LC1199
	.long	.LC7449
	.value	4318
	.value	221
	.long	.LC7532
	.long	.LC3793
	.value	4318
	.value	223
	.long	.LC7537
	.long	.LC7538
	.value	4318
	.value	224
	.long	.LC7539
	.long	.LC3285
	.value	4318
	.value	225
	.long	.LC7539
	.long	.LC7540
	.value	4318
	.value	226
	.long	.LC7539
	.long	.LC5225
	.value	4318
	.value	227
	.long	.LC7541
	.long	.LC7542
	.value	4318
	.value	228
	.long	.LC7539
	.long	.LC7543
	.value	4318
	.value	229
	.long	.LC7539
	.long	.LC7544
	.value	4318
	.value	231
	.long	.LC7539
	.long	.LC7545
	.value	4318
	.value	232
	.long	.LC7539
	.long	.LC7546
	.value	4318
	.value	234
	.long	.LC7539
	.long	.LC7497
	.value	4318
	.value	237
	.long	.LC7539
	.long	.LC5007
	.value	4318
	.value	238
	.long	.LC7541
	.long	.LC7542
	.value	4318
	.value	240
	.long	.LC7547
	.long	.LC2366
	.value	4318
	.value	241
	.long	.LC7548
	.long	.LC7549
	.value	4318
	.value	242
	.long	.LC7550
	.long	.LC7551
	.value	4318
	.value	245
	.long	.LC7507
	.long	.LC7552
	.value	4318
	.value	246
	.long	.LC7520
	.long	.LC7553
	.value	4318
	.value	248
	.long	.LC7547
	.long	.LC7554
	.value	4318
	.value	249
	.long	.LC7547
	.long	.LC7555
	.value	4318
	.value	250
	.long	.LC7556
	.long	.LC7557
	.value	4318
	.value	251
	.long	.LC7558
	.long	.LC7559
	.value	4318
	.value	252
	.long	.LC7560
	.long	.LC7561
	.value	4318
	.value	253
	.long	.LC7562
	.long	.LC7563
	.value	4318
	.value	254
	.long	.LC7562
	.long	.LC7564
	.value	4318
	.value	255
	.long	.LC7565
	.long	.LC7566
	.value	4318
	.value	256
	.long	.LC7567
	.long	.LC7568
	.value	4318
	.value	257
	.long	.LC7567
	.long	.LC7569
	.value	4318
	.value	258
	.long	.LC7567
	.long	.LC7570
	.value	4318
	.value	259
	.long	.LC7571
	.long	.LC7572
	.value	4318
	.value	272
	.long	.LC7573
	.long	.LC7574
	.value	4318
	.value	273
	.long	.LC7575
	.long	.LC7576
	.value	4318
	.value	274
	.long	.LC7573
	.long	.LC7577
	.value	4318
	.value	274
	.long	.LC2366
	.long	.LC7578
	.value	4318
	.value	275
	.long	.LC7579
	.long	.LC7580
	.value	4318
	.value	321
	.long	.LC7550
	.long	.LC7581
	.value	4318
	.value	325
	.long	.LC7550
	.long	.LC7582
	.value	4318
	.value	328
	.long	.LC2626
	.long	.LC7583
	.value	4318
	.value	333
	.long	.LC2626
	.long	.LC7584
	.value	4318
	.value	334
	.long	.LC7550
	.long	.LC7585
	.value	4318
	.value	335
	.long	.LC7550
	.long	.LC7586
	.value	4318
	.value	336
	.long	.LC7587
	.long	.LC7588
	.value	4318
	.value	337
	.long	.LC7589
	.long	.LC7590
	.value	4318
	.value	338
	.long	.LC7591
	.long	.LC7592
	.value	4318
	.value	339
	.long	.LC7593
	.long	.LC7594
	.value	4318
	.value	352
	.long	.LC7595
	.long	.LC7596
	.value	4318
	.value	354
	.long	.LC7597
	.long	.LC7598
	.value	4318
	.value	355
	.long	.LC7599
	.long	.LC7600
	.value	4318
	.value	356
	.long	.LC7597
	.long	.LC7601
	.value	4318
	.value	357
	.long	.LC7602
	.long	.LC7603
	.value	4318
	.value	362
	.long	.LC7604
	.long	.LC7605
	.value	4318
	.value	368
	.long	.LC7606
	.long	.LC7607
	.value	4318
	.value	369
	.long	.LC7606
	.long	.LC6496
	.value	4318
	.value	370
	.long	.LC7608
	.long	.LC7609
	.value	4318
	.value	371
	.long	.LC7610
	.long	.LC7611
	.value	4318
	.value	372
	.long	.LC7612
	.long	.LC7613
	.value	4318
	.value	373
	.long	.LC7612
	.long	.LC7614
	.value	4318
	.value	374
	.long	.LC7612
	.long	.LC7615
	.value	4318
	.value	375
	.long	.LC7612
	.long	.LC7616
	.value	4318
	.value	376
	.long	.LC7617
	.long	.LC7618
	.value	4318
	.value	377
	.long	.LC7612
	.long	.LC7619
	.value	4318
	.value	378
	.long	.LC7620
	.long	.LC7621
	.value	4318
	.value	379
	.long	.LC7622
	.long	.LC7623
	.value	4318
	.value	380
	.long	.LC7612
	.long	.LC7624
	.value	4318
	.value	385
	.long	.LC7625
	.long	.LC7626
	.value	4318
	.value	386
	.long	.LC7627
	.long	.LC7628
	.value	4318
	.value	387
	.long	.LC7629
	.long	.LC7630
	.value	4318
	.value	389
	.long	.LC7631
	.long	.LC7632
	.value	4318
	.value	390
	.long	.LC7633
	.long	.LC7634
	.value	4318
	.value	391
	.long	.LC7635
	.long	.LC7636
	.value	4318
	.value	394
	.long	.LC7637
	.long	.LC7638
	.value	4318
	.value	397
	.long	.LC7633
	.long	.LC7634
	.value	4318
	.value	401
	.long	.LC7639
	.long	.LC7640
	.value	4318
	.value	403
	.long	.LC7639
	.long	.LC7641
	.value	4318
	.value	413
	.long	.LC7639
	.long	.LC7642
	.value	4318
	.value	414
	.long	.LC7639
	.long	.LC7643
	.value	4318
	.value	416
	.long	.LC7644
	.long	.LC7645
	.value	4318
	.value	420
	.long	.LC7500
	.long	.LC7646
	.value	4318
	.value	421
	.long	.LC7500
	.long	.LC7646
	.value	4318
	.value	422
	.long	.LC7500
	.long	.LC7646
	.value	4318
	.value	424
	.long	.LC7647
	.long	.LC7648
	.value	4318
	.value	425
	.long	.LC7649
	.long	.LC7648
	.value	4318
	.value	426
	.long	.LC7650
	.long	.LC7651
	.value	4318
	.value	427
	.long	.LC7652
	.long	.LC7651
	.value	4318
	.value	428
	.long	.LC7653
	.long	.LC3058
	.value	4318
	.value	429
	.long	.LC7653
	.long	.LC3058
	.value	4318
	.value	432
	.long	.LC7654
	.long	.LC7499
	.value	4318
	.value	433
	.long	.LC7655
	.long	.LC7497
	.value	4318
	.value	434
	.long	.LC7500
	.long	.LC7656
	.value	4318
	.value	436
	.long	.LC7654
	.long	.LC3261
	.value	4318
	.value	439
	.long	.LC7500
	.long	.LC3180
	.value	4318
	.value	440
	.long	.LC7500
	.long	.LC3333
	.value	4318
	.value	444
	.long	.LC7654
	.long	.LC7657
	.value	4318
	.value	449
	.long	.LC7654
	.long	.LC4558
	.value	4318
	.value	450
	.long	.LC7654
	.long	.LC7658
	.value	4318
	.value	451
	.long	.LC7654
	.long	.LC7659
	.value	4318
	.value	465
	.long	.LC2626
	.long	.LC7660
	.value	4318
	.value	467
	.long	.LC7661
	.long	.LC7662
	.value	4318
	.value	471
	.long	.LC2626
	.long	.LC7663
	.value	4318
	.value	472
	.long	.LC7664
	.long	.LC7665
	.value	4318
	.value	476
	.long	.LC7666
	.long	.LC7667
	.value	4318
	.value	477
	.long	.LC7668
	.long	.LC2432
	.value	4318
	.value	479
	.long	.LC7669
	.long	.LC7669
	.value	4318
	.value	480
	.long	.LC7670
	.long	.LC7646
	.value	4318
	.value	481
	.long	.LC7670
	.long	.LC7646
	.value	4318
	.value	488
	.long	.LC7670
	.long	.LC5225
	.value	4318
	.value	490
	.long	.LC7670
	.long	.LC7671
	.value	4318
	.value	491
	.long	.LC7670
	.long	.LC7672
	.value	4318
	.value	492
	.long	.LC7670
	.long	.LC7673
	.value	4318
	.value	493
	.long	.LC7670
	.long	.LC7674
	.value	4318
	.value	494
	.long	.LC7670
	.long	.LC7675
	.value	4318
	.value	495
	.long	.LC7670
	.long	.LC7676
	.value	4318
	.value	512
	.long	.LC7677
	.long	.LC7678
	.value	4318
	.value	513
	.long	.LC7454
	.long	.LC7679
	.value	4318
	.value	514
	.long	.LC7680
	.long	.LC7681
	.value	4318
	.value	515
	.long	.LC7682
	.long	.LC7683
	.value	4318
	.value	545
	.long	.LC2626
	.long	.LC7586
	.value	4318
	.value	577
	.long	.LC7684
	.long	.LC7685
	.value	4318
	.value	578
	.long	.LC2626
	.long	.LC7686
	.value	4318
	.value	580
	.long	.LC7687
	.long	.LC7687
	.value	4318
	.value	592
	.long	.LC7688
	.long	.LC7689
	.value	4318
	.value	593
	.long	.LC7690
	.long	.LC7691
	.value	4318
	.value	595
	.long	.LC7692
	.long	.LC7693
	.value	4318
	.value	600
	.long	.LC7694
	.long	.LC7695
	.value	4318
	.value	601
	.long	.LC7696
	.long	.LC7697
	.value	4318
	.value	603
	.long	.LC7698
	.long	.LC7699
	.value	4318
	.value	612
	.long	.LC7700
	.long	.LC7701
	.value	4318
	.value	613
	.long	.LC7702
	.long	.LC3478
	.value	4318
	.value	614
	.long	.LC7703
	.long	.LC7704
	.value	4318
	.value	615
	.long	.LC7703
	.long	.LC7704
	.value	4318
	.value	616
	.long	.LC7705
	.long	.LC7706
	.value	4318
	.value	617
	.long	.LC7707
	.long	.LC7708
	.value	4318
	.value	620
	.long	.LC7709
	.long	.LC109
	.value	4318
	.value	625
	.long	.LC2626
	.long	.LC7710
	.value	4318
	.value	640
	.long	.LC7711
	.long	.LC7712
	.value	4318
	.value	641
	.long	.LC7713
	.long	.LC7714
	.value	4318
	.value	642
	.long	.LC7715
	.long	.LC7716
	.value	4318
	.value	646
	.long	.LC2366
	.long	.LC7717
	.value	4318
	.value	648
	.long	.LC7718
	.long	.LC7719
	.value	4318
	.value	649
	.long	.LC7720
	.long	.LC7721
	.value	4318
	.value	652
	.long	.LC7722
	.long	.LC7723
	.value	4318
	.value	657
	.long	.LC7724
	.long	.LC7725
	.value	4318
	.value	663
	.long	.LC7726
	.long	.LC7727
	.value	4318
	.value	668
	.long	.LC7726
	.long	.LC7728
	.value	4318
	.value	669
	.long	.LC7726
	.long	.LC7729
	.value	4318
	.value	672
	.long	.LC7730
	.long	.LC7731
	.value	4318
	.value	736
	.long	.LC2366
	.long	.LC7732
	.value	4318
	.value	738
	.long	.LC3453
	.long	.LC7733
	.value	4318
	.value	768
	.long	.LC7734
	.long	.LC7735
	.value	4318
	.value	769
	.long	.LC7736
	.long	.LC7737
	.value	4318
	.value	770
	.long	.LC7738
	.long	.LC7739
	.value	4318
	.value	776
	.long	.LC7740
	.long	.LC7741
	.value	4318
	.value	777
	.long	.LC7742
	.long	.LC7743
	.value	4318
	.value	778
	.long	.LC7744
	.long	.LC7745
	.value	4318
	.value	785
	.long	.LC7746
	.long	.LC7747
	.value	4318
	.value	786
	.long	.LC7748
	.long	.LC7749
	.value	4318
	.value	787
	.long	.LC7750
	.long	.LC2366
	.value	4318
	.value	788
	.long	.LC7751
	.long	.LC7752
	.value	4318
	.value	792
	.long	.LC7753
	.long	.LC2366
	.value	4318
	.value	793
	.long	.LC7754
	.long	.LC2366
	.value	4318
	.value	794
	.long	.LC7755
	.long	.LC7756
	.value	4318
	.value	795
	.long	.LC7757
	.long	.LC7758
	.value	4318
	.value	796
	.long	.LC7759
	.long	.LC7760
	.value	4318
	.value	801
	.long	.LC7761
	.long	.LC7762
	.value	4318
	.value	802
	.long	.LC7763
	.long	.LC7764
	.value	4318
	.value	803
	.long	.LC7765
	.long	.LC7766
	.value	4318
	.value	804
	.long	.LC7767
	.long	.LC7768
	.value	4318
	.value	805
	.long	.LC7769
	.long	.LC7770
	.value	4318
	.value	806
	.long	.LC7771
	.long	.LC7772
	.value	4318
	.value	807
	.long	.LC7773
	.long	.LC7774
	.value	4318
	.value	808
	.long	.LC7775
	.long	.LC7776
	.value	4318
	.value	809
	.long	.LC7777
	.long	.LC7778
	.value	4318
	.value	810
	.long	.LC7779
	.long	.LC7780
	.value	4318
	.value	811
	.long	.LC7781
	.long	.LC7782
	.value	4318
	.value	812
	.long	.LC7775
	.long	.LC7783
	.value	4318
	.value	813
	.long	.LC7784
	.long	.LC7785
	.value	4318
	.value	815
	.long	.LC7775
	.long	.LC2366
	.value	4318
	.value	816
	.long	.LC2366
	.long	.LC7786
	.value	4318
	.value	817
	.long	.LC2366
	.long	.LC7787
	.value	4318
	.value	818
	.long	.LC2366
	.long	.LC7788
	.value	4318
	.value	819
	.long	.LC7789
	.long	.LC7790
	.value	4318
	.value	820
	.long	.LC7791
	.long	.LC7792
	.value	4318
	.value	824
	.long	.LC7793
	.long	.LC7794
	.value	4318
	.value	833
	.long	.LC7795
	.long	.LC7796
	.value	4318
	.value	834
	.long	.LC7797
	.long	.LC7739
	.value	4318
	.value	835
	.long	.LC7798
	.long	.LC7799
	.value	4318
	.value	836
	.long	.LC7800
	.long	.LC7801
	.value	4318
	.value	837
	.long	.LC7802
	.long	.LC2366
	.value	4318
	.value	839
	.long	.LC7803
	.long	.LC7804
	.value	4318
	.value	840
	.long	.LC7805
	.long	.LC7806
	.value	4318
	.value	846
	.long	.LC7807
	.long	.LC7808
	.value	4318
	.value	847
	.long	.LC7809
	.long	.LC2366
	.value	4318
	.value	876
	.long	.LC7810
	.long	.LC7811
	.value	4318
	.value	877
	.long	.LC7810
	.long	.LC7812
	.value	4318
	.value	878
	.long	.LC7813
	.long	.LC7814
	.value	4318
	.value	879
	.long	.LC7813
	.long	.LC7815
	.value	4318
	.value	881
	.long	.LC7816
	.long	.LC7817
	.value	4318
	.value	894
	.long	.LC7813
	.long	.LC7815
	.value	4318
	.value	895
	.long	.LC7818
	.long	.LC7815
	.value	4318
	.value	913
	.long	.LC7819
	.long	.LC7820
	.value	4318
	.value	914
	.long	.LC7821
	.long	.LC7821
	.value	4318
	.value	915
	.long	.LC7822
	.long	.LC7823
	.value	4318
	.value	920
	.long	.LC7777
	.long	.LC7824
	.value	4318
	.value	926
	.long	.LC7825
	.long	.LC7825
	.value	4318
	.value	976
	.long	.LC2626
	.long	.LC7826
	.value	4318
	.value	992
	.long	.LC7827
	.long	.LC7828
	.value	4318
	.value	999
	.long	.LC7829
	.long	.LC7830
	.value	4318
	.value	1004
	.long	.LC7829
	.long	.LC7831
	.value	4318
	.value	1007
	.long	.LC7832
	.long	.LC7833
	.value	4318
	.value	1008
	.long	.LC7829
	.long	.LC7834
	.value	4318
	.value	1014
	.long	.LC7829
	.long	.LC7830
	.value	4318
	.value	1015
	.long	.LC7829
	.long	.LC7830
	.value	4318
	.value	1026
	.long	.LC7835
	.long	.LC7836
	.value	4318
	.value	1031
	.long	.LC7837
	.long	.LC7837
	.value	4318
	.value	1036
	.long	.LC7838
	.long	.LC7839
	.value	4318
	.value	1057
	.long	.LC7840
	.long	.LC7841
	.value	4318
	.value	1059
	.long	.LC7840
	.long	.LC7842
	.value	4318
	.value	1063
	.long	.LC2626
	.long	.LC7843
	.value	4318
	.value	1064
	.long	.LC7844
	.long	.LC7844
	.value	4318
	.value	1065
	.long	.LC2613
	.long	.LC7845
	.value	4318
	.value	1067
	.long	.LC7846
	.long	.LC7847
	.value	4318
	.value	1069
	.long	.LC7848
	.long	.LC7849
	.value	4318
	.value	1071
	.long	.LC7850
	.long	.LC7851
	.value	4318
	.value	1096
	.long	.LC7852
	.long	.LC7853
	.value	4318
	.value	1100
	.long	.LC7852
	.long	.LC7854
	.value	4318
	.value	1101
	.long	.LC7852
	.long	.LC7855
	.value	4318
	.value	1102
	.long	.LC7856
	.long	.LC7857
	.value	4318
	.value	1103
	.long	.LC7852
	.long	.LC7858
	.value	4318
	.value	1117
	.long	.LC7852
	.long	.LC7859
	.value	4318
	.value	84
	.long	.LC7860
	.long	.LC2677
	.value	4318
	.value	1360
	.long	.LC7861
	.long	.LC7862
	.value	4318
	.value	1364
	.long	.LC7861
	.long	.LC7863
	.value	4318
	.value	1365
	.long	.LC7861
	.long	.LC7863
	.value	4318
	.value	1366
	.long	.LC7861
	.long	.LC7863
	.value	4318
	.value	1368
	.long	.LC7861
	.long	.LC7864
	.value	4318
	.value	1369
	.long	.LC7861
	.long	.LC7864
	.value	4318
	.value	1370
	.long	.LC7861
	.long	.LC7864
	.value	4318
	.value	1376
	.long	.LC7861
	.long	.LC7865
	.value	4318
	.value	1388
	.long	.LC7866
	.long	.LC7867
	.value	4318
	.value	1553
	.long	.LC7868
	.long	.LC7869
	.value	4318
	.value	1570
	.long	.LC7870
	.long	.LC7661
	.value	4318
	.value	1600
	.long	.LC7871
	.long	.LC7872
	.value	4318
	.value	1604
	.long	.LC7873
	.long	.LC7874
	.value	4318
	.value	1605
	.long	.LC7873
	.long	.LC7874
	.value	4318
	.value	1609
	.long	.LC7873
	.long	.LC7875
	.value	4318
	.value	1888
	.long	.LC7876
	.long	.LC7877
	.value	4318
	.value	1896
	.long	.LC7878
	.long	.LC3408
	.value	4318
	.value	1973
	.long	.LC7879
	.long	.LC7880
	.value	4318
	.value	1977
	.long	.LC7879
	.long	.LC7881
	.value	4318
	.value	2008
	.long	.LC7882
	.long	.LC7882
	.value	4318
	.value	2012
	.long	.LC7882
	.long	.LC7882
	.value	4318
	.value	2032
	.long	.LC7866
	.long	.LC7883
	.value	4318
	.value	2036
	.long	.LC7866
	.long	.LC7884
	.value	4318
	.value	2037
	.long	.LC7866
	.long	.LC7885
	.value	4318
	.value	2038
	.long	.LC7866
	.long	.LC7886
	.value	4318
	.value	2039
	.long	.LC7866
	.long	.LC7887
	.value	4318
	.value	2040
	.long	.LC7866
	.long	.LC7888
	.value	4318
	.value	2041
	.long	.LC7866
	.long	.LC7889
	.value	4318
	.value	2042
	.long	.LC7866
	.long	.LC7890
	.value	4318
	.value	2043
	.long	.LC7866
	.long	.LC7891
	.value	4318
	.value	2723
	.long	.LC7500
	.long	.LC7892
	.value	4318
	.value	2744
	.long	.LC7893
	.long	.LC7894
	.value	4318
	.value	2745
	.long	.LC7893
	.long	.LC7895
	.value	4318
	.value	2748
	.long	.LC7893
	.long	.LC7896
	.value	4318
	.value	2749
	.long	.LC7893
	.long	.LC7897
	.value	4318
	.value	2768
	.long	.LC7898
	.long	.LC7899
	.value	4318
	.value	3012
	.long	.LC7900
	.long	.LC3408
	.value	4318
	.value	3013
	.long	.LC7900
	.long	.LC3408
	.value	4318
	.value	3020
	.long	.LC7900
	.long	.LC3450
	.value	4318
	.value	3021
	.long	.LC7900
	.long	.LC3450
	.value	4318
	.value	4318
	.long	.LC7446
	.long	.LC7447
	.value	4318
	.value	272
	.long	.LC7901
	.long	.LC7902
	.value	4318
	.value	353
	.long	.LC7903
	.long	.LC7904
	.value	4318
	.value	385
	.long	.LC7625
	.long	.LC7905
	.value	4318
	.value	583
	.long	.LC7906
	.long	.LC7907
	.value	4318
	.value	620
	.long	.LC7709
	.long	.LC109
	.value	4318
	.value	105
	.long	.LC7908
	.long	.LC7909
	.value	4318
	.value	-32767
	.long	.LC7866
	.long	.LC7910
	.value	4318
	.value	620
	.long	.LC7709
	.long	.LC7911
	.value	4319
	.value	4319
	.long	.LC7912
	.long	.LC3700
	.value	4319
	.value	6885
	.long	.LC7913
	.long	.LC6811
	.value	4319
	.value	-3931
	.long	.LC7914
	.long	.LC7915
	.value	4319
	.value	-3867
	.long	.LC2432
	.long	.LC7916
	.value	4319
	.value	-3840
	.long	.LC7917
	.long	.LC3700
	.value	4319
	.value	-2304
	.long	.LC7918
	.long	.LC6811
	.value	4319
	.value	-2048
	.long	.LC7919
	.long	.LC6811
	.value	4319
	.value	-1792
	.long	.LC7920
	.long	.LC7921
	.value	4319
	.value	-1664
	.long	.LC7922
	.long	.LC7923
	.value	4319
	.value	-1536
	.long	.LC7924
	.long	.LC6811
	.value	4319
	.value	-768
	.long	.LC7925
	.long	.LC7926
	.value	4319
	.value	-512
	.long	.LC7927
	.long	.LC7928
	.value	4321
	.value	913
	.long	.LC2841
	.long	.LC7669
	.value	4321
	.value	26892
	.long	.LC7929
	.long	.LC42
	.value	4321
	.value	-9184
	.long	.LC7930
	.long	.LC3314
	.value	-16162
	.value	22016
	.long	.LC7931
	.long	.LC42
	.value	-16162
	.value	-16162
	.long	.LC7932
	.long	.LC7933
	.value	4323
	.value	0
	.long	.LC7934
	.long	.LC7935
	.value	4323
	.value	328
	.long	.LC7936
	.long	.LC7937
	.value	4323
	.value	1299
	.long	.LC7938
	.long	.LC7939
	.value	4323
	.value	2128
	.long	.LC7940
	.long	.LC7941
	.value	4323
	.value	2132
	.long	.LC7940
	.long	.LC7942
	.value	4323
	.value	2144
	.long	.LC7943
	.long	.LC7944
	.value	4323
	.value	2146
	.long	.LC7945
	.long	.LC7946
	.value	4323
	.value	-32160
	.long	.LC7947
	.long	.LC7948
	.value	4323
	.value	-32159
	.long	.LC7947
	.long	.LC7948
	.value	4328
	.value	8209
	.long	.LC7949
	.long	.LC7950
	.value	4328
	.value	18256
	.long	.LC7951
	.long	.LC7952
	.value	4328
	.value	22816
	.long	.LC7953
	.long	.LC7954
	.value	4328
	.value	-32717
	.long	.LC7955
	.long	.LC7956
	.value	4328
	.value	-32701
	.long	.LC7957
	.long	.LC7958
	.value	4328
	.value	-32670
	.long	.LC7959
	.long	.LC7960
	.value	4328
	.value	-32643
	.long	.LC7959
	.long	.LC7961
	.value	4328
	.value	-32632
	.long	.LC7962
	.long	.LC7963
	.value	4328
	.value	-32631
	.long	.LC7964
	.long	.LC7965
	.value	4328
	.value	-32612
	.long	.LC7959
	.long	.LC7966
	.value	4328
	.value	-32591
	.long	.LC7967
	.long	.LC7968
	.value	4328
	.value	-32583
	.long	.LC7969
	.long	.LC7970
	.value	4328
	.value	-32553
	.long	.LC7971
	.long	.LC7972
	.value	4328
	.value	-32552
	.long	.LC7973
	.long	.LC7974
	.value	4328
	.value	-32551
	.long	.LC7975
	.long	.LC7972
	.value	4328
	.value	-32550
	.long	.LC42
	.long	.LC42
	.value	4328
	.value	-32486
	.long	.LC7976
	.long	.LC7977
	.value	4328
	.value	-32400
	.long	.LC7959
	.long	.LC7978
	.value	4330
	.value	5760
	.long	.LC7979
	.long	.LC7980
	.value	4330
	.value	5762
	.long	.LC7981
	.long	.LC7982
	.value	4330
	.value	5763
	.long	.LC7983
	.long	.LC42
	.value	4330
	.value	8192
	.long	.LC7984
	.long	.LC7985
	.value	4330
	.value	8208
	.long	.LC7986
	.long	.LC7987
	.value	4330
	.value	20480
	.long	.LC7988
	.long	.LC42
	.value	4330
	.value	20560
	.long	.LC7989
	.long	.LC42
	.value	4331
	.value	257
	.long	.LC7990
	.long	.LC7991
	.value	4331
	.value	-32495
	.long	.LC7992
	.long	.LC7993
	.value	-28667
	.value	16
	.long	.LC7994
	.long	.LC7995
	.value	-28667
	.value	17
	.long	.LC7996
	.long	.LC7997
	.value	-28667
	.value	19
	.long	.LC7998
	.long	.LC2844
	.value	-28667
	.value	31
	.long	.LC7999
	.long	.LC8000
	.value	-28667
	.value	32
	.long	.LC3762
	.long	.LC2844
	.value	-28667
	.value	47
	.long	.LC3762
	.long	.LC2844
	.value	-28667
	.value	48
	.long	.LC3762
	.long	.LC2844
	.value	-28667
	.value	63
	.long	.LC3762
	.long	.LC2844
	.value	-28667
	.value	80
	.long	.LC42
	.long	.LC8001
	.value	-28667
	.value	81
	.long	.LC42
	.long	.LC8002
	.value	-28667
	.value	83
	.long	.LC8003
	.long	.LC2844
	.value	-28667
	.value	95
	.long	.LC8004
	.long	.LC8005
	.value	-28667
	.value	128
	.long	.LC8006
	.long	.LC8007
	.value	-28667
	.value	129
	.long	.LC8008
	.long	.LC8009
	.value	-28667
	.value	131
	.long	.LC8010
	.long	.LC8009
	.value	-28667
	.value	143
	.long	.LC8011
	.long	.LC8009
	.value	-28667
	.value	192
	.long	.LC8012
	.long	.LC8009
	.value	-28667
	.value	193
	.long	.LC8013
	.long	.LC8009
	.value	-28667
	.value	195
	.long	.LC8014
	.long	.LC8009
	.value	-28667
	.value	197
	.long	.LC42
	.long	.LC8015
	.value	-28667
	.value	207
	.long	.LC8016
	.long	.LC8009
	.value	-28667
	.value	600
	.long	.LC8017
	.long	.LC8018
	.value	-28667
	.value	645
	.long	.LC8019
	.long	.LC8020
	.value	-28667
	.value	1055
	.long	.LC8021
	.long	.LC8022
	.value	-28667
	.value	1086
	.long	.LC8023
	.long	.LC8022
	.value	-28667
	.value	-32768
	.long	.LC8024
	.long	.LC8025
	.value	-28667
	.value	-32753
	.long	.LC8026
	.long	.LC8025
	.value	-28667
	.value	-32752
	.long	.LC8027
	.long	.LC8025
	.value	-28667
	.value	-32751
	.long	.LC8028
	.long	.LC8025
	.value	-28667
	.value	-32750
	.long	.LC8029
	.long	.LC8025
	.value	-28667
	.value	-32748
	.long	.LC8030
	.long	.LC8025
	.value	-28667
	.value	-32747
	.long	.LC8027
	.long	.LC8025
	.value	-28667
	.value	-32746
	.long	.LC8031
	.long	.LC8025
	.value	-28667
	.value	-32745
	.long	.LC8032
	.long	.LC8025
	.value	-28667
	.value	-32740
	.long	.LC8033
	.long	.LC8025
	.value	-28667
	.value	-32739
	.long	.LC8034
	.long	.LC8025
	.value	-28667
	.value	-32738
	.long	.LC8026
	.long	.LC8025
	.value	-28667
	.value	-32737
	.long	.LC8035
	.long	.LC8025
	.value	-28667
	.value	-32640
	.long	.LC8024
	.long	.LC8036
	.value	-28667
	.value	-32625
	.long	.LC8026
	.long	.LC8036
	.value	-28667
	.value	-32624
	.long	.LC8027
	.long	.LC8037
	.value	-28667
	.value	-32623
	.long	.LC8028
	.long	.LC8037
	.value	-28667
	.value	-32622
	.long	.LC8029
	.long	.LC8037
	.value	-28667
	.value	-32621
	.long	.LC8038
	.long	.LC8037
	.value	-28667
	.value	-32620
	.long	.LC8030
	.long	.LC8037
	.value	-28667
	.value	-32619
	.long	.LC8027
	.long	.LC8037
	.value	-28667
	.value	-32618
	.long	.LC8031
	.long	.LC8037
	.value	-28667
	.value	-32617
	.long	.LC8032
	.long	.LC8037
	.value	-28667
	.value	-32612
	.long	.LC8028
	.long	.LC8037
	.value	-28667
	.value	-32611
	.long	.LC8034
	.long	.LC8037
	.value	-28667
	.value	-32610
	.long	.LC8039
	.long	.LC8037
	.value	-28667
	.value	-32609
	.long	.LC8034
	.long	.LC8037
	.value	4332
	.value	313
	.long	.LC8040
	.long	.LC8041
	.value	4332
	.value	313
	.long	.LC8040
	.long	.LC8041
	.value	4332
	.value	608
	.long	.LC8042
	.long	.LC8043
	.value	4332
	.value	610
	.long	.LC8044
	.long	.LC8045
	.value	4332
	.value	616
	.long	.LC8046
	.long	.LC8047
	.value	4332
	.value	1632
	.long	.LC8048
	.long	.LC7834
	.value	4332
	.value	1634
	.long	.LC8049
	.long	.LC8050
	.value	4332
	.value	2176
	.long	.LC8051
	.long	.LC8052
	.value	4332
	.value	2179
	.long	.LC8053
	.long	.LC8045
	.value	4332
	.value	2181
	.long	.LC8054
	.long	.LC8055
	.value	4332
	.value	2184
	.long	.LC8056
	.long	.LC8057
	.value	4332
	.value	-32735
	.long	.LC8058
	.long	.LC8059
	.value	4332
	.value	-32727
	.long	.LC8060
	.long	.LC8060
	.value	4332
	.value	-32511
	.long	.LC8061
	.long	.LC8062
	.value	4332
	.value	-32487
	.long	.LC8063
	.long	.LC8064
	.value	4332
	.value	-32471
	.long	.LC8065
	.long	.LC8066
	.value	4332
	.value	-32463
	.long	.LC8067
	.long	.LC42
	.value	4332
	.value	-32458
	.long	.LC8068
	.long	.LC8069
	.value	4332
	.value	-32456
	.long	.LC8070
	.long	.LC8071
	.value	4332
	.value	-32455
	.long	.LC8072
	.long	.LC8073
	.value	4332
	.value	-32409
	.long	.LC8074
	.long	.LC8075
	.value	4332
	.value	-32408
	.long	.LC8076
	.long	.LC8077
	.value	4332
	.value	-32407
	.long	.LC8078
	.long	.LC8079
	.value	4332
	.value	-32384
	.long	.LC8080
	.long	.LC8081
	.value	4332
	.value	-32379
	.long	.LC8082
	.long	.LC8083
	.value	4332
	.value	-32378
	.long	.LC8084
	.long	.LC8085
	.value	4332
	.value	-32361
	.long	.LC8086
	.long	.LC8087
	.value	4332
	.value	-32359
	.long	.LC8088
	.long	.LC8089
	.value	4332
	.value	-26506
	.long	.LC8090
	.long	.LC8091
	.value	4333
	.value	29456
	.long	.LC8092
	.long	.LC8093
	.value	4334
	.value	788
	.long	.LC8094
	.long	.LC2820
	.value	4334
	.value	4097
	.long	.LC8095
	.long	.LC8096
	.value	4334
	.value	16320
	.long	.LC8097
	.long	.LC42
	.value	4334
	.value	16321
	.long	.LC8098
	.long	.LC42
	.value	4334
	.value	16322
	.long	.LC8099
	.long	.LC42
	.value	4334
	.value	16323
	.long	.LC8100
	.long	.LC8100
	.value	4334
	.value	16324
	.long	.LC8101
	.long	.LC8102
	.value	4334
	.value	16325
	.long	.LC8103
	.long	.LC8104
	.value	4334
	.value	21315
	.long	.LC8105
	.long	.LC8106
	.value	4334
	.value	-32464
	.long	.LC8107
	.long	.LC8108
	.value	4334
	.value	-31871
	.long	.LC8109
	.long	.LC7993
	.value	4334
	.value	-24285
	.long	.LC8110
	.long	.LC8111
	.value	4334
	.value	-24284
	.long	.LC8111
	.long	.LC8110
	.value	4335
	.value	-32428
	.long	.LC8112
	.long	.LC8113
	.value	4336
	.value	-22528
	.long	.LC8114
	.long	.LC8115
	.value	4336
	.value	-19712
	.long	.LC8116
	.long	.LC8117
	.value	4337
	.value	5478
	.long	.LC42
	.long	.LC8118
	.value	4337
	.value	5751
	.long	.LC42
	.long	.LC8119
	.value	4337
	.value	8211
	.long	.LC8120
	.long	.LC8121
	.value	4340
	.value	4864
	.long	.LC8122
	.long	.LC8123
	.value	4341
	.value	-24575
	.long	.LC8124
	.long	.LC8125
	.value	4342
	.value	273
	.long	.LC8126
	.long	.LC8127
	.value	4346
	.value	0
	.long	.LC7026
	.long	.LC2878
	.value	4346
	.value	1
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	2
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	3
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	4
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	5
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	6
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	7
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	8
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	9
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	10
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	11
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	12
	.long	.LC8128
	.long	.LC8129
	.value	4346
	.value	13
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	14
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	15
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	16
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	17
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	18
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	19
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	20
	.long	.LC42
	.long	.LC2878
	.value	4346
	.value	21
	.long	.LC42
	.long	.LC2878
	.value	4347
	.value	6255
	.long	.LC8130
	.long	.LC42
	.value	4348
	.value	-32455
	.long	.LC8131
	.long	.LC8063
	.value	4349
	.value	32336
	.long	.LC3453
	.long	.LC3453
	.value	4352
	.value	12356
	.long	.LC8132
	.long	.LC8133
	.value	4353
	.value	2
	.long	.LC8134
	.long	.LC8135
	.value	4353
	.value	4192
	.long	.LC8136
	.long	.LC8137
	.value	4353
	.value	4938
	.long	.LC42
	.long	.LC8135
	.value	4353
	.value	5666
	.long	.LC8138
	.long	.LC8139
	.value	4353
	.value	-28416
	.long	.LC8140
	.long	.LC7395
	.value	4353
	.value	-27648
	.long	.LC8141
	.long	.LC7395
	.value	4353
	.value	-27647
	.long	.LC8142
	.long	.LC7395
	.value	4353
	.value	-27392
	.long	.LC8143
	.long	.LC8144
	.value	4353
	.value	-27390
	.long	.LC8145
	.long	.LC8146
	.value	4353
	.value	-26880
	.long	.LC42
	.long	.LC8147
	.value	4354
	.value	2
	.long	.LC8148
	.long	.LC8149
	.value	4354
	.value	3
	.long	.LC8150
	.long	.LC8151
	.value	4354
	.value	4
	.long	.LC8152
	.long	.LC8153
	.value	4354
	.value	5
	.long	.LC8154
	.long	.LC8155
	.value	4354
	.value	6
	.long	.LC8156
	.long	.LC8157
	.value	4354
	.value	7
	.long	.LC8158
	.long	.LC8159
	.value	4354
	.value	8
	.long	.LC8160
	.long	.LC8161
	.value	4354
	.value	6
	.long	.LC8156
	.long	.LC8157
	.value	4354
	.value	4119
	.long	.LC8162
	.long	.LC8163
	.value	4354
	.value	4128
	.long	.LC7459
	.long	.LC8164
	.value	4354
	.value	4167
	.long	.LC8165
	.long	.LC8166
	.value	4354
	.value	4977
	.long	.LC8167
	.long	.LC8168
	.value	4354
	.value	10392
	.long	.LC8169
	.long	.LC8170
	.value	4354
	.value	16385
	.long	.LC8171
	.long	.LC8172
	.value	4354
	.value	28674
	.long	.LC8173
	.long	.LC8174
	.value	4354
	.value	28675
	.long	.LC8175
	.long	.LC8176
	.value	4354
	.value	28676
	.long	.LC8177
	.long	.LC8178
	.value	4354
	.value	28677
	.long	.LC2366
	.long	.LC8179
	.value	4354
	.value	30722
	.long	.LC8180
	.long	.LC8181
	.value	4354
	.value	-30408
	.long	.LC8165
	.long	.LC8182
	.value	4354
	.value	1371
	.long	.LC42
	.long	.LC42
	.value	4357
	.value	20480
	.long	.LC42
	.long	.LC8119
	.value	4357
	.value	-32000
	.long	.LC8183
	.long	.LC5121
	.value	4357
	.value	-31744
	.long	.LC8183
	.long	.LC5121
	.value	4357
	.value	-31627
	.long	.LC8184
	.long	.LC8185
	.value	4358
	.value	304
	.long	.LC8186
	.long	.LC8187
	.value	4358
	.value	408
	.long	.LC42
	.long	.LC4369
	.value	4358
	.value	568
	.long	.LC8188
	.long	.LC4369
	.value	4358
	.value	601
	.long	.LC2626
	.long	.LC2686
	.value	4358
	.value	617
	.long	.LC8189
	.long	.LC4369
	.value	4358
	.value	642
	.long	.LC8190
	.long	.LC4369
	.value	4358
	.value	773
	.long	.LC8191
	.long	.LC2686
	.value	4358
	.value	913
	.long	.LC8192
	.long	.LC2686
	.value	4358
	.value	1281
	.long	.LC8193
	.long	.LC2686
	.value	4358
	.value	1285
	.long	.LC8194
	.long	.LC8195
	.value	4358
	.value	1377
	.long	.LC8196
	.long	.LC2677
	.value	4358
	.value	1393
	.long	.LC8197
	.long	.LC5234
	.value	4358
	.value	1398
	.long	.LC8198
	.long	.LC8199
	.value	4358
	.value	1409
	.long	.LC8200
	.long	.LC8201
	.value	4358
	.value	1413
	.long	.LC8202
	.long	.LC8203
	.value	4358
	.value	1414
	.long	.LC8204
	.long	.LC5821
	.value	4358
	.value	1425
	.long	.LC8205
	.long	.LC8206
	.value	4358
	.value	1429
	.long	.LC8207
	.long	.LC8208
	.value	4358
	.value	1430
	.long	.LC8209
	.long	.LC8210
	.value	4358
	.value	1431
	.long	.LC8211
	.long	.LC8212
	.value	4358
	.value	1432
	.long	.LC8213
	.long	.LC2686
	.value	4358
	.value	1537
	.long	.LC8214
	.long	.LC3610
	.value	4358
	.value	1541
	.long	.LC8215
	.long	.LC8216
	.value	4358
	.value	1664
	.long	.LC8217
	.long	.LC8218
	.value	4358
	.value	1670
	.long	.LC8219
	.long	.LC8220
	.value	4358
	.value	1681
	.long	.LC8221
	.long	.LC8222
	.value	4358
	.value	1682
	.long	.LC42
	.long	.LC5231
	.value	4358
	.value	1683
	.long	.LC8223
	.long	.LC2686
	.value	4358
	.value	2342
	.long	.LC8224
	.long	.LC8225
	.value	4358
	.value	4096
	.long	.LC8226
	.long	.LC2686
	.value	4358
	.value	4358
	.long	.LC8227
	.long	.LC8228
	.value	4358
	.value	4612
	.long	.LC2366
	.long	.LC8229
	.value	4358
	.value	4664
	.long	.LC8188
	.long	.LC4369
	.value	4358
	.value	4697
	.long	.LC2626
	.long	.LC2686
	.value	4358
	.value	4713
	.long	.LC8189
	.long	.LC4369
	.value	4358
	.value	4738
	.long	.LC8190
	.long	.LC4369
	.value	4358
	.value	5489
	.long	.LC8230
	.long	.LC2677
	.value	4358
	.value	5525
	.long	.LC8231
	.long	.LC2686
	.value	4358
	.value	5896
	.long	.LC8232
	.long	.LC8233
	.value	4358
	.value	8198
	.long	.LC8234
	.long	.LC8235
	.value	4358
	.value	516
	.long	.LC8236
	.long	.LC8229
	.value	4358
	.value	8708
	.long	.LC2366
	.long	.LC8229
	.value	4358
	.value	8760
	.long	.LC8188
	.long	.LC4369
	.value	4358
	.value	8793
	.long	.LC2626
	.long	.LC2686
	.value	4358
	.value	8809
	.long	.LC8189
	.long	.LC4369
	.value	4358
	.value	8834
	.long	.LC8190
	.long	.LC4369
	.value	4358
	.value	12344
	.long	.LC8237
	.long	.LC8238
	.value	4358
	.value	12344
	.long	.LC8239
	.long	.LC8240
	.value	4358
	.value	12352
	.long	.LC8241
	.long	.LC8242
	.value	4358
	.value	12353
	.long	.LC8226
	.long	.LC8228
	.value	4358
	.value	12355
	.long	.LC8243
	.long	.LC8244
	.value	4358
	.value	12356
	.long	.LC8245
	.long	.LC8246
	.value	4358
	.value	12368
	.long	.LC8247
	.long	.LC8248
	.value	4358
	.value	12369
	.long	.LC42
	.long	.LC3643
	.value	4358
	.value	12371
	.long	.LC8234
	.long	.LC8249
	.value	4358
	.value	12375
	.long	.LC8250
	.long	.LC8251
	.value	4358
	.value	12376
	.long	.LC2837
	.long	.LC8252
	.value	4358
	.value	12377
	.long	.LC2837
	.long	.LC2838
	.value	4358
	.value	12389
	.long	.LC8253
	.long	.LC8254
	.value	4358
	.value	12392
	.long	.LC8255
	.long	.LC8256
	.value	4358
	.value	12392
	.long	.LC8255
	.long	.LC8257
	.value	4358
	.value	12392
	.long	.LC8255
	.long	.LC8258
	.value	4358
	.value	12404
	.long	.LC8259
	.long	.LC2692
	.value	4358
	.value	12422
	.long	.LC8260
	.long	.LC8261
	.value	4358
	.value	12433
	.long	.LC8262
	.long	.LC4369
	.value	4358
	.value	12441
	.long	.LC8263
	.long	.LC4369
	.value	4358
	.value	12545
	.long	.LC8264
	.long	.LC4369
	.value	4358
	.value	12546
	.long	.LC8265
	.long	.LC4369
	.value	4358
	.value	12547
	.long	.LC8266
	.long	.LC4369
	.value	4358
	.value	12548
	.long	.LC8239
	.long	.LC5701
	.value	4358
	.value	12550
	.long	.LC8267
	.long	.LC8268
	.value	4358
	.value	12551
	.long	.LC8269
	.long	.LC2692
	.value	4358
	.value	12552
	.long	.LC2613
	.long	.LC8270
	.value	4358
	.value	12553
	.long	.LC8269
	.long	.LC2692
	.value	4358
	.value	12562
	.long	.LC5273
	.long	.LC4369
	.value	4358
	.value	12563
	.long	.LC42
	.long	.LC2519
	.value	4358
	.value	12566
	.long	.LC8271
	.long	.LC8272
	.value	4358
	.value	12568
	.long	.LC8273
	.long	.LC8274
	.value	4358
	.value	12569
	.long	.LC8275
	.long	.LC8276
	.value	4358
	.value	12578
	.long	.LC8277
	.long	.LC8278
	.value	4358
	.value	12579
	.long	.LC8277
	.long	.LC4369
	.value	4358
	.value	12584
	.long	.LC8279
	.long	.LC8272
	.value	4358
	.value	12595
	.long	.LC8280
	.long	.LC4369
	.value	4358
	.value	12615
	.long	.LC8259
	.long	.LC2692
	.value	4358
	.value	12616
	.long	.LC8281
	.long	.LC8272
	.value	4358
	.value	12617
	.long	.LC8282
	.long	.LC3405
	.value	4358
	.value	12630
	.long	.LC8283
	.long	.LC4369
	.value	4358
	.value	12632
	.long	.LC42
	.long	.LC8272
	.value	4358
	.value	12644
	.long	.LC8284
	.long	.LC8285
	.value	4358
	.value	12648
	.long	.LC8286
	.long	.LC8287
	.value	4358
	.value	12663
	.long	.LC8288
	.long	.LC2692
	.value	4358
	.value	12664
	.long	.LC42
	.long	.LC4369
	.value	4358
	.value	12680
	.long	.LC8289
	.long	.LC4369
	.value	4358
	.value	12681
	.long	.LC8290
	.long	.LC4369
	.value	4358
	.value	12696
	.long	.LC8291
	.long	.LC8272
	.value	4358
	.value	12802
	.long	.LC42
	.long	.LC4369
	.value	4358
	.value	12804
	.long	.LC8292
	.long	.LC4369
	.value	4358
	.value	12805
	.long	.LC42
	.long	.LC4369
	.value	4358
	.value	12808
	.long	.LC8293
	.long	.LC4369
	.value	4358
	.value	12809
	.long	.LC42
	.long	.LC4369
	.value	4358
	.value	12819
	.long	.LC42
	.long	.LC2519
	.value	4358
	.value	12839
	.long	.LC2837
	.long	.LC5821
	.value	4358
	.value	12848
	.long	.LC8294
	.long	.LC8295
	.value	4358
	.value	12856
	.long	.LC8188
	.long	.LC8272
	.value	4358
	.value	12873
	.long	.LC8296
	.long	.LC8297
	.value	4358
	.value	12888
	.long	.LC8298
	.long	.LC8272
	.value	4358
	.value	12889
	.long	.LC2366
	.long	.LC4369
	.value	4358
	.value	12905
	.long	.LC8189
	.long	.LC4369
	.value	4358
	.value	12930
	.long	.LC8190
	.long	.LC4369
	.value	4358
	.value	12936
	.long	.LC8299
	.long	.LC8300
	.value	4358
	.value	13123
	.long	.LC8301
	.long	.LC2432
	.value	4358
	.value	13124
	.long	.LC8302
	.long	.LC8303
	.value	4358
	.value	13129
	.long	.LC8304
	.long	.LC8305
	.value	4358
	.value	13169
	.long	.LC8306
	.long	.LC8307
	.value	4358
	.value	16713
	.long	.LC8308
	.long	.LC8309
	.value	4358
	.value	16900
	.long	.LC2366
	.long	.LC4369
	.value	4358
	.value	16952
	.long	.LC2366
	.long	.LC4369
	.value	4358
	.value	16984
	.long	.LC2366
	.long	.LC4369
	.value	4358
	.value	16985
	.long	.LC2366
	.long	.LC4369
	.value	4358
	.value	17001
	.long	.LC8189
	.long	.LC4369
	.value	4358
	.value	17026
	.long	.LC8190
	.long	.LC4369
	.value	4358
	.value	20528
	.long	.LC8209
	.long	.LC8251
	.value	4358
	.value	24832
	.long	.LC8310
	.long	.LC8311
	.value	4358
	.value	29188
	.long	.LC8312
	.long	.LC4369
	.value	4358
	.value	29189
	.long	.LC8313
	.long	.LC8314
	.value	4358
	.value	29240
	.long	.LC8188
	.long	.LC4369
	.value	4358
	.value	29272
	.long	.LC8298
	.long	.LC4369
	.value	4358
	.value	29273
	.long	.LC8315
	.long	.LC4369
	.value	4358
	.value	29289
	.long	.LC8189
	.long	.LC4369
	.value	4358
	.value	29314
	.long	.LC8190
	.long	.LC4369
	.value	4358
	.value	29523
	.long	.LC8200
	.long	.LC8201
	.value	4358
	.value	29554
	.long	.LC2837
	.long	.LC8201
	.value	4358
	.value	-32248
	.long	.LC8316
	.long	.LC4834
	.value	4358
	.value	-32207
	.long	.LC8317
	.long	.LC2692
	.value	4358
	.value	-32203
	.long	.LC8281
	.long	.LC5580
	.value	4358
	.value	-32201
	.long	.LC2837
	.long	.LC2838
	.value	4358
	.value	-31995
	.long	.LC8318
	.long	.LC4834
	.value	4358
	.value	-31855
	.long	.LC8192
	.long	.LC4834
	.value	4358
	.value	-31487
	.long	.LC8193
	.long	.LC4834
	.value	4358
	.value	-31338
	.long	.LC8209
	.long	.LC4834
	.value	4358
	.value	-31337
	.long	.LC8211
	.long	.LC8319
	.value	4358
	.value	-31336
	.long	.LC8213
	.long	.LC8319
	.value	4358
	.value	-31231
	.long	.LC8320
	.long	.LC8319
	.value	4358
	.value	-31230
	.long	.LC42
	.long	.LC8321
	.value	4358
	.value	-31227
	.long	.LC8322
	.long	.LC8323
	.value	4358
	.value	-31087
	.long	.LC8324
	.long	.LC8319
	.value	4358
	.value	-31085
	.long	.LC8223
	.long	.LC8319
	.value	4358
	.value	-28104
	.long	.LC8188
	.long	.LC8325
	.value	4358
	.value	-27752
	.long	.LC8326
	.long	.LC8327
	.value	4358
	.value	-26506
	.long	.LC8269
	.long	.LC2692
	.value	4358
	.value	-24056
	.long	.LC8293
	.long	.LC3793
	.value	4358
	.value	-24008
	.long	.LC8188
	.long	.LC3793
	.value	4358
	.value	-20335
	.long	.LC8262
	.long	.LC8319
	.value	4358
	.value	-20327
	.long	.LC8328
	.long	.LC8319
	.value	4358
	.value	-20223
	.long	.LC8264
	.long	.LC8319
	.value	4358
	.value	-20222
	.long	.LC8265
	.long	.LC8319
	.value	4358
	.value	-20221
	.long	.LC8266
	.long	.LC8319
	.value	4358
	.value	-20206
	.long	.LC5273
	.long	.LC8319
	.value	4358
	.value	-20205
	.long	.LC42
	.long	.LC8325
	.value	4358
	.value	-20203
	.long	.LC8329
	.long	.LC8330
	.value	4358
	.value	-20202
	.long	.LC8271
	.long	.LC8319
	.value	4358
	.value	-20173
	.long	.LC8331
	.long	.LC8330
	.value	4358
	.value	-20152
	.long	.LC8332
	.long	.LC8333
	.value	4358
	.value	-20138
	.long	.LC8283
	.long	.LC8319
	.value	4358
	.value	-20136
	.long	.LC42
	.long	.LC8319
	.value	4358
	.value	-20120
	.long	.LC8288
	.long	.LC8334
	.value	4358
	.value	-20088
	.long	.LC8335
	.long	.LC8334
	.value	4358
	.value	-20072
	.long	.LC8336
	.long	.LC8334
	.value	4358
	.value	-19949
	.long	.LC42
	.long	.LC8325
	.value	4358
	.value	-15864
	.long	.LC8293
	.long	.LC3793
	.value	4358
	.value	-15816
	.long	.LC8188
	.long	.LC3793
	.value	4358
	.value	-11768
	.long	.LC8293
	.long	.LC3793
	.value	4358
	.value	-11757
	.long	.LC42
	.long	.LC2519
	.value	4358
	.value	-11720
	.long	.LC8188
	.long	.LC3793
	.value	4358
	.value	-7672
	.long	.LC8293
	.long	.LC3793
	.value	4358
	.value	-7624
	.long	.LC8188
	.long	.LC3793
	.value	4358
	.value	-3576
	.long	.LC8293
	.long	.LC3793
	.value	4358
	.value	-3528
	.long	.LC8188
	.long	.LC3793
	.value	4359
	.value	-31370
	.long	.LC42
	.long	.LC4972
	.value	4360
	.value	256
	.long	.LC8337
	.long	.LC8113
	.value	4360
	.value	257
	.long	.LC8338
	.long	.LC8339
	.value	4360
	.value	261
	.long	.LC8340
	.long	.LC8113
	.value	4360
	.value	264
	.long	.LC8340
	.long	.LC8113
	.value	4360
	.value	312
	.long	.LC8340
	.long	.LC8113
	.value	4360
	.value	313
	.long	.LC8340
	.long	.LC8113
	.value	4360
	.value	316
	.long	.LC8340
	.long	.LC8113
	.value	4360
	.value	317
	.long	.LC8340
	.long	.LC8113
	.value	4361
	.value	5120
	.long	.LC8341
	.long	.LC8342
	.value	4363
	.value	1
	.long	.LC8343
	.long	.LC8344
	.value	4363
	.value	2
	.long	.LC8345
	.long	.LC8346
	.value	4363
	.value	4
	.long	.LC42
	.long	.LC42
	.value	5098
	.value	12593
	.long	.LC8347
	.long	.LC8348
	.value	5098
	.value	12596
	.long	.LC8349
	.long	.LC8350
	.value	5104
	.value	512
	.long	.LC8351
	.long	.LC8352
	.value	5104
	.value	513
	.long	.LC8353
	.long	.LC8354
	.value	5104
	.value	768
	.long	.LC8355
	.long	.LC8356
	.value	5104
	.value	4131
	.long	.LC8357
	.long	.LC3085
	.value	5104
	.value	5104
	.long	.LC8358
	.long	.LC8359
	.value	5117
	.value	5646
	.long	.LC8360
	.long	.LC8360
	.value	5120
	.value	1
	.long	.LC42
	.long	.LC42
	.value	5120
	.value	3
	.long	.LC42
	.long	.LC42
	.value	5120
	.value	4
	.long	.LC8361
	.long	.LC8361
	.value	5120
	.value	5121
	.long	.LC8362
	.long	.LC8363
	.value	5129
	.value	29032
	.long	.LC8364
	.long	.LC8365
	.value	5129
	.value	29288
	.long	.LC8366
	.long	.LC8367
	.value	5131
	.value	1552
	.long	.LC42
	.long	.LC42
	.value	5131
	.value	1557
	.long	.LC3872
	.long	.LC8368
	.value	5131
	.value	1666
	.long	.LC3872
	.long	.LC3872
	.value	5141
	.value	-31743
	.long	.LC8369
	.long	.LC8370
	.value	5141
	.value	-31741
	.long	.LC8369
	.long	.LC8371
	.value	5141
	.value	-27392
	.long	.LC8372
	.long	.LC8373
	.value	5141
	.value	-27391
	.long	.LC8372
	.long	.LC2823
	.value	5141
	.value	-27387
	.long	.LC8374
	.long	.LC6683
	.value	5141
	.value	-27382
	.long	.LC8372
	.long	.LC8375
	.value	5141
	.value	-27381
	.long	.LC8376
	.long	.LC8377
	.value	5141
	.value	-27376
	.long	.LC8372
	.long	.LC8378
	.value	5141
	.value	-27375
	.long	.LC8379
	.long	.LC8380
	.value	5141
	.value	-27374
	.long	.LC8372
	.long	.LC8381
	.value	5141
	.value	-27373
	.long	.LC8372
	.long	.LC8371
	.value	5141
	.value	-27359
	.long	.LC6524
	.long	.LC6683
	.value	5141
	.value	-27357
	.long	.LC6524
	.long	.LC8382
	.value	5151
	.value	24961
	.long	.LC8383
	.long	.LC8384
	.value	5218
	.value	193
	.long	.LC7517
	.long	.LC8385
	.value	5218
	.value	18208
	.long	.LC8386
	.long	.LC8387
	.value	5218
	.value	20593
	.long	.LC8386
	.long	.LC8387
	.value	5218
	.value	28960
	.long	.LC42
	.long	.LC42
	.value	5218
	.value	31072
	.long	.LC8388
	.long	.LC8388
	.value	5233
	.value	392
	.long	.LC8389
	.long	.LC8390
	.value	5289
	.value	-21217
	.long	.LC2538
	.long	.LC2538
	.value	5297
	.value	4147
	.long	.LC8391
	.long	.LC8392
	.value	5313
	.value	-32701
	.long	.LC8393
	.long	.LC8394
	.value	5327
	.value	10528
	.long	.LC8395
	.long	.LC8396
	.value	5337
	.value	16
	.long	.LC8397
	.long	.LC8398
	.value	5348
	.value	847
	.long	.LC7809
	.long	.LC2366
	.value	5348
	.value	2048
	.long	.LC8399
	.long	.LC8400
	.value	5348
	.value	2052
	.long	.LC8399
	.long	.LC8401
	.value	5348
	.value	2053
	.long	.LC8399
	.long	.LC8402
	.value	5348
	.value	2054
	.long	.LC8399
	.long	.LC8403
	.value	5348
	.value	2059
	.long	.LC8399
	.long	.LC8404
	.value	5348
	.value	2063
	.long	.LC8399
	.long	.LC8405
	.value	5348
	.value	2065
	.long	.LC8399
	.long	.LC8406
	.value	5348
	.value	2070
	.long	.LC8407
	.long	.LC8402
	.value	5348
	.value	5348
	.long	.LC8408
	.long	.LC8409
	.value	5348
	.value	5632
	.long	.LC8410
	.long	.LC8411
	.value	5348
	.value	5689
	.long	.LC8412
	.long	.LC8413
	.value	5348
	.value	5700
	.long	.LC8414
	.long	.LC8415
	.value	5348
	.value	5701
	.long	.LC8416
	.long	.LC8417
	.value	5348
	.value	5702
	.long	.LC8418
	.long	.LC8419
	.value	5348
	.value	5703
	.long	.LC4025
	.long	.LC8419
	.value	5348
	.value	5704
	.long	.LC8420
	.long	.LC8421
	.value	5348
	.value	5708
	.long	.LC8422
	.long	.LC8423
	.value	5348
	.value	5709
	.long	.LC8424
	.long	.LC8425
	.value	5348
	.value	5715
	.long	.LC8426
	.long	.LC8427
	.value	5348
	.value	5716
	.long	.LC8428
	.long	.LC8419
	.value	5348
	.value	5720
	.long	.LC8429
	.long	.LC8419
	.value	5348
	.value	5721
	.long	.LC8430
	.long	.LC8431
	.value	5348
	.value	5722
	.long	.LC8432
	.long	.LC8433
	.value	5348
	.value	5725
	.long	.LC8434
	.long	.LC8427
	.value	5348
	.value	5726
	.long	.LC8434
	.long	.LC8419
	.value	5348
	.value	5738
	.long	.LC8435
	.long	.LC8436
	.value	5348
	.value	5739
	.long	.LC8437
	.long	.LC8419
	.value	5348
	.value	5741
	.long	.LC8438
	.long	.LC8439
	.value	5348
	.value	5742
	.long	.LC8440
	.long	.LC8419
	.value	5348
	.value	359
	.long	.LC8441
	.long	.LC8425
	.value	5348
	.value	5746
	.long	.LC8442
	.long	.LC8419
	.value	5348
	.value	5747
	.long	.LC8443
	.long	.LC8419
	.value	5348
	.value	5750
	.long	.LC8429
	.long	.LC8419
	.value	5348
	.value	5751
	.long	.LC8444
	.long	.LC8431
	.value	5348
	.value	5751
	.long	.LC8445
	.long	.LC8446
	.value	5348
	.value	5754
	.long	.LC8447
	.long	.LC8448
	.value	5348
	.value	5755
	.long	.LC8449
	.long	.LC8419
	.value	5348
	.value	5756
	.long	.LC8429
	.long	.LC8419
	.value	5348
	.value	5757
	.long	.LC8450
	.long	.LC8427
	.value	5348
	.value	5758
	.long	.LC8451
	.long	.LC8452
	.value	5348
	.value	5779
	.long	.LC8453
	.long	.LC8454
	.value	5348
	.value	5782
	.long	.LC8445
	.long	.LC8455
	.value	5348
	.value	5784
	.long	.LC8456
	.long	.LC8457
	.value	5348
	.value	5786
	.long	.LC8458
	.long	.LC8419
	.value	5348
	.value	5787
	.long	.LC8459
	.long	.LC8419
	.value	5348
	.value	5788
	.long	.LC8426
	.long	.LC8460
	.value	5348
	.value	5789
	.long	.LC8461
	.long	.LC8462
	.value	5348
	.value	5790
	.long	.LC8447
	.long	.LC8431
	.value	5348
	.value	5798
	.long	.LC8463
	.long	.LC3139
	.value	5348
	.value	5799
	.long	.LC8464
	.long	.LC3139
	.value	5348
	.value	5800
	.long	.LC8420
	.long	.LC8419
	.value	5348
	.value	5802
	.long	.LC8465
	.long	.LC8466
	.value	5348
	.value	5830
	.long	.LC8467
	.long	.LC8419
	.value	5348
	.value	5831
	.long	.LC8468
	.long	.LC3139
	.value	5348
	.value	5853
	.long	.LC8469
	.long	.LC8419
	.value	5348
	.value	5879
	.long	.LC8470
	.long	.LC8471
	.value	5348
	.value	5885
	.long	.LC8472
	.long	.LC8473
	.value	5348
	.value	5886
	.long	.LC8474
	.long	.LC8419
	.value	5348
	.value	5900
	.long	.LC8475
	.long	.LC8476
	.value	5348
	.value	5901
	.long	.LC8477
	.long	.LC8478
	.value	5348
	.value	5902
	.long	.LC8477
	.long	.LC8479
	.value	5348
	.value	5907
	.long	.LC8480
	.long	.LC8481
	.value	5348
	.value	13138
	.long	.LC8482
	.long	.LC8483
	.value	5348
	.value	13152
	.long	.LC8484
	.long	.LC8485
	.value	5348
	.value	16913
	.long	.LC8486
	.long	.LC8487
	.value	5348
	.value	16914
	.long	.LC8488
	.long	.LC8489
	.value	5348
	.value	17153
	.long	.LC8490
	.long	.LC8491
	.value	5348
	.value	17155
	.long	.LC8492
	.long	.LC8493
	.value	5348
	.value	17157
	.long	.LC8494
	.long	.LC8495
	.value	5348
	.value	17158
	.long	.LC8496
	.long	.LC8497
	.value	5348
	.value	17159
	.long	.LC8494
	.long	.LC8498
	.value	5348
	.value	17168
	.long	.LC8499
	.long	.LC8500
	.value	5348
	.value	17169
	.long	.LC8501
	.long	.LC8502
	.value	5348
	.value	17170
	.long	.LC8499
	.long	.LC8503
	.value	5348
	.value	17171
	.long	.LC8499
	.long	.LC8504
	.value	5348
	.value	17173
	.long	.LC8505
	.long	.LC8506
	.value	5348
	.value	17176
	.long	.LC8507
	.long	.LC8508
	.value	5348
	.value	17184
	.long	.LC8509
	.long	.LC8510
	.value	5348
	.value	17185
	.long	.LC8496
	.long	.LC8511
	.value	5348
	.value	17186
	.long	.LC8496
	.long	.LC8512
	.value	5348
	.value	17187
	.long	.LC8496
	.long	.LC8495
	.value	5348
	.value	17188
	.long	.LC8513
	.long	.LC8514
	.value	5348
	.value	17189
	.long	.LC8496
	.long	.LC8510
	.value	5348
	.value	17190
	.long	.LC8496
	.long	.LC8515
	.value	5348
	.value	17192
	.long	.LC8516
	.long	.LC8517
	.value	5348
	.value	17193
	.long	.LC2432
	.long	.LC2432
	.value	5348
	.value	17409
	.long	.LC8475
	.long	.LC8518
	.value	5348
	.value	17410
	.long	.LC8519
	.long	.LC8518
	.value	5348
	.value	17411
	.long	.LC8519
	.long	.LC8495
	.value	5348
	.value	17424
	.long	.LC8520
	.long	.LC8521
	.value	5348
	.value	17425
	.long	.LC8522
	.long	.LC8495
	.value	5348
	.value	17426
	.long	.LC8523
	.long	.LC8524
	.value	5348
	.value	17456
	.long	.LC8525
	.long	.LC8526
	.value	5348
	.value	17458
	.long	.LC8525
	.long	.LC8527
	.value	5348
	.value	17936
	.long	.LC8528
	.long	.LC8529
	.value	5348
	.value	17937
	.long	.LC8528
	.long	.LC8530
	.value	5348
	.value	17938
	.long	.LC8528
	.long	.LC8531
	.value	5348
	.value	17939
	.long	.LC8528
	.long	.LC8403
	.value	5348
	.value	17940
	.long	.LC8528
	.long	.LC8406
	.value	5348
	.value	17941
	.long	.LC8528
	.long	.LC8532
	.value	5348
	.value	18180
	.long	.LC8533
	.long	.LC8529
	.value	5348
	.value	18184
	.long	.LC8533
	.long	.LC4168
	.value	5348
	.value	18192
	.long	.LC8534
	.long	.LC8529
	.value	5348
	.value	18193
	.long	.LC8535
	.long	.LC8536
	.value	5348
	.value	18194
	.long	.LC8535
	.long	.LC8537
	.value	5348
	.value	18195
	.long	.LC8535
	.long	.LC8403
	.value	5348
	.value	18196
	.long	.LC8535
	.long	.LC8406
	.value	5348
	.value	18197
	.long	.LC8535
	.long	.LC8532
	.value	5348
	.value	18198
	.long	.LC8535
	.long	.LC8538
	.value	5348
	.value	18199
	.long	.LC8535
	.long	.LC8539
	.value	5348
	.value	18200
	.long	.LC8535
	.long	.LC8404
	.value	5348
	.value	18208
	.long	.LC8540
	.long	.LC8541
	.value	5348
	.value	21349
	.long	.LC8542
	.long	.LC8529
	.value	5348
	.value	22016
	.long	.LC8543
	.long	.LC8544
	.value	5348
	.value	22021
	.long	.LC8545
	.long	.LC8544
	.value	5348
	.value	22037
	.long	.LC8546
	.long	.LC8544
	.value	5348
	.value	22053
	.long	.LC8547
	.long	.LC8544
	.value	5348
	.value	22085
	.long	.LC8548
	.long	.LC8544
	.value	5348
	.value	22128
	.long	.LC8549
	.long	.LC8550
	.value	5348
	.value	22144
	.long	.LC8551
	.long	.LC8552
	.value	5348
	.value	22160
	.long	.LC8553
	.long	.LC8554
	.value	5348
	.value	22161
	.long	.LC8555
	.long	.LC8556
	.value	5348
	.value	22530
	.long	.LC8557
	.long	.LC8558
	.value	5348
	.value	22533
	.long	.LC8559
	.long	.LC8560
	.value	5348
	.value	22560
	.long	.LC8561
	.long	.LC4168
	.value	5348
	.value	22561
	.long	.LC8562
	.long	.LC4168
	.value	5348
	.value	22562
	.long	.LC8563
	.long	.LC4168
	.value	5348
	.value	22563
	.long	.LC8564
	.long	.LC4168
	.value	5348
	.value	22564
	.long	.LC8565
	.long	.LC4168
	.value	5348
	.value	22592
	.long	.LC8566
	.long	.LC4168
	.value	5348
	.value	22593
	.long	.LC8567
	.long	.LC4168
	.value	5348
	.value	22608
	.long	.LC8568
	.long	.LC4168
	.value	5348
	.value	29473
	.long	.LC8569
	.long	.LC8570
	.value	5348
	.value	29713
	.long	.LC8571
	.long	.LC8572
	.value	5348
	.value	17169
	.long	.LC8573
	.long	.LC8574
	.value	5355
	.value	32
	.long	.LC8575
	.long	.LC8576
	.value	5355
	.value	3073
	.long	.LC8577
	.long	.LC8578
	.value	5365
	.value	12032
	.long	.LC5158
	.long	.LC5158
	.value	-21950
	.value	931
	.long	.LC8579
	.long	.LC8580
	.value	5373
	.value	1
	.long	.LC8581
	.long	.LC8582
	.value	5722
	.value	-16128
	.long	.LC8583
	.long	.LC8584
	.value	5722
	.value	-11776
	.long	.LC8585
	.long	.LC8586
	.value	5722
	.value	-11520
	.long	.LC8587
	.long	.LC8586
	.value	5398
	.value	2048
	.long	.LC8588
	.long	.LC2673
	.value	5398
	.value	2051
	.long	.LC8589
	.long	.LC8590
	.value	5398
	.value	2193
	.long	.LC8591
	.long	.LC8592
	.value	4370
	.value	8704
	.long	.LC8593
	.long	.LC8594
	.value	4370
	.value	8960
	.long	.LC8595
	.long	.LC8596
	.value	4370
	.value	9024
	.long	.LC8597
	.long	.LC8598
	.value	4370
	.value	9216
	.long	.LC8599
	.long	.LC7159
	.value	4371
	.value	4625
	.long	.LC8600
	.long	.LC8601
	.value	4371
	.value	4630
	.long	.LC8602
	.long	.LC8603
	.value	4371
	.value	4631
	.long	.LC8604
	.long	.LC2671
	.value	4371
	.value	20741
	.long	.LC8605
	.long	.LC42
	.value	4371
	.value	-28143
	.long	.LC8606
	.long	.LC6411
	.value	4371
	.value	-27375
	.long	.LC8607
	.long	.LC8608
	.value	4371
	.value	-26506
	.long	.LC8602
	.long	.LC8609
	.value	-24064
	.value	-24064
	.long	.LC8610
	.long	.LC8611
	.value	4372
	.value	1286
	.long	.LC8612
	.long	.LC8613
	.value	4372
	.value	12802
	.long	.LC8614
	.long	.LC8615
	.value	4374
	.value	34
	.long	.LC8616
	.long	.LC42
	.value	4374
	.value	35
	.long	.LC8617
	.long	.LC42
	.value	4374
	.value	36
	.long	.LC8618
	.long	.LC42
	.value	4374
	.value	37
	.long	.LC8619
	.long	.LC42
	.value	4374
	.value	38
	.long	.LC8620
	.long	.LC42
	.value	4374
	.value	39
	.long	.LC8621
	.long	.LC42
	.value	4374
	.value	40
	.long	.LC8622
	.long	.LC42
	.value	4375
	.value	-27392
	.long	.LC42
	.long	.LC8623
	.value	4375
	.value	-27391
	.long	.LC42
	.long	.LC8624
	.value	4377
	.value	0
	.long	.LC8625
	.long	.LC8626
	.value	4377
	.value	1
	.long	.LC8627
	.long	.LC8628
	.value	4377
	.value	2
	.long	.LC8629
	.long	.LC8628
	.value	4377
	.value	3
	.long	.LC8630
	.long	.LC8631
	.value	4377
	.value	4
	.long	.LC8632
	.long	.LC8633
	.value	4377
	.value	5
	.long	.LC8634
	.long	.LC8635
	.value	4377
	.value	6
	.long	.LC8636
	.long	.LC8637
	.value	4377
	.value	7
	.long	.LC8638
	.long	.LC8637
	.value	4377
	.value	8
	.long	.LC8639
	.long	.LC8637
	.value	4377
	.value	9
	.long	.LC8640
	.long	.LC8637
	.value	4377
	.value	10
	.long	.LC8641
	.long	.LC8642
	.value	4377
	.value	11
	.long	.LC8643
	.long	.LC8644
	.value	4377
	.value	12
	.long	.LC8645
	.long	.LC8644
	.value	4377
	.value	13
	.long	.LC8646
	.long	.LC8644
	.value	4377
	.value	256
	.long	.LC8647
	.long	.LC8648
	.value	4377
	.value	257
	.long	.LC8649
	.long	.LC8650
	.value	4377
	.value	258
	.long	.LC8651
	.long	.LC8650
	.value	4377
	.value	259
	.long	.LC8652
	.long	.LC8650
	.value	4377
	.value	260
	.long	.LC8653
	.long	.LC8654
	.value	4377
	.value	261
	.long	.LC8655
	.long	.LC8654
	.value	4377
	.value	272
	.long	.LC8656
	.long	.LC8650
	.value	4377
	.value	273
	.long	.LC8657
	.long	.LC8650
	.value	4377
	.value	274
	.long	.LC8658
	.long	.LC8650
	.value	4377
	.value	275
	.long	.LC8659
	.long	.LC8650
	.value	4377
	.value	276
	.long	.LC8660
	.long	.LC8654
	.value	4377
	.value	277
	.long	.LC8657
	.long	.LC8654
	.value	4377
	.value	280
	.long	.LC8661
	.long	.LC8662
	.value	4377
	.value	281
	.long	.LC8663
	.long	.LC8662
	.value	4377
	.value	282
	.long	.LC8664
	.long	.LC8662
	.value	4377
	.value	283
	.long	.LC8665
	.long	.LC8662
	.value	4377
	.value	288
	.long	.LC8666
	.long	.LC42
	.value	4377
	.value	289
	.long	.LC8667
	.long	.LC42
	.value	4377
	.value	290
	.long	.LC8668
	.long	.LC42
	.value	4377
	.value	291
	.long	.LC8669
	.long	.LC42
	.value	4377
	.value	292
	.long	.LC8670
	.long	.LC42
	.value	4377
	.value	293
	.long	.LC8667
	.long	.LC42
	.value	4377
	.value	310
	.long	.LC8671
	.long	.LC42
	.value	4377
	.value	311
	.long	.LC8672
	.long	.LC8673
	.value	4377
	.value	312
	.long	.LC8674
	.long	.LC42
	.value	4377
	.value	313
	.long	.LC8675
	.long	.LC42
	.value	4377
	.value	314
	.long	.LC8676
	.long	.LC42
	.value	4377
	.value	315
	.long	.LC8677
	.long	.LC42
	.value	4377
	.value	316
	.long	.LC8678
	.long	.LC42
	.value	4377
	.value	317
	.long	.LC8679
	.long	.LC42
	.value	4377
	.value	318
	.long	.LC8680
	.long	.LC42
	.value	4377
	.value	319
	.long	.LC8681
	.long	.LC42
	.value	4377
	.value	358
	.long	.LC8682
	.long	.LC42
	.value	4377
	.value	359
	.long	.LC8683
	.long	.LC42
	.value	4377
	.value	360
	.long	.LC8684
	.long	.LC8685
	.value	4377
	.value	361
	.long	.LC8686
	.long	.LC8687
	.value	4377
	.value	362
	.long	.LC8688
	.long	.LC8687
	.value	4377
	.value	363
	.long	.LC8689
	.long	.LC8687
	.value	4377
	.value	364
	.long	.LC8690
	.long	.LC42
	.value	4377
	.value	365
	.long	.LC8691
	.long	.LC42
	.value	4377
	.value	366
	.long	.LC8692
	.long	.LC42
	.value	4377
	.value	367
	.long	.LC8693
	.long	.LC42
	.value	4377
	.value	470
	.long	.LC8694
	.long	.LC42
	.value	4377
	.value	471
	.long	.LC8695
	.long	.LC42
	.value	4377
	.value	502
	.long	.LC8696
	.long	.LC42
	.value	4377
	.value	503
	.long	.LC8697
	.long	.LC42
	.value	4377
	.value	508
	.long	.LC8698
	.long	.LC42
	.value	4377
	.value	509
	.long	.LC8699
	.long	.LC42
	.value	4377
	.value	510
	.long	.LC8700
	.long	.LC42
	.value	4377
	.value	511
	.long	.LC8701
	.long	.LC42
	.value	4377
	.value	528
	.long	.LC8702
	.long	.LC8703
	.value	4377
	.value	529
	.long	.LC8704
	.long	.LC8703
	.value	4377
	.value	608
	.long	.LC8705
	.long	.LC8706
	.value	4377
	.value	609
	.long	.LC8707
	.long	.LC8706
	.value	4377
	.value	768
	.long	.LC8708
	.long	.LC42
	.value	4378
	.value	0
	.long	.LC8709
	.long	.LC42
	.value	4378
	.value	2
	.long	.LC8710
	.long	.LC42
	.value	4378
	.value	3
	.long	.LC8711
	.long	.LC2705
	.value	4380
	.value	1
	.long	.LC42
	.long	.LC8712
	.value	4381
	.value	1
	.long	.LC8713
	.long	.LC8714
	.value	4381
	.value	3
	.long	.LC8715
	.long	.LC8716
	.value	4381
	.value	4
	.long	.LC8717
	.long	.LC8716
	.value	4381
	.value	30386
	.long	.LC8718
	.long	.LC8719
	.value	4383
	.value	19015
	.long	.LC8720
	.long	.LC8721
	.value	4383
	.value	21059
	.long	.LC42
	.long	.LC8722
	.value	4391
	.value	512
	.long	.LC8723
	.long	.LC963
	.value	4391
	.value	528
	.long	.LC8724
	.long	.LC963
	.value	4391
	.value	592
	.long	.LC42
	.long	.LC963
	.value	4391
	.value	768
	.long	.LC8725
	.long	.LC7159
	.value	4391
	.value	784
	.long	.LC42
	.long	.LC963
	.value	4391
	.value	1024
	.long	.LC8726
	.long	.LC2705
	.value	-30618
	.value	5769
	.long	.LC8727
	.long	.LC8728
	.value	4398
	.value	0
	.long	.LC42
	.long	.LC8729
	.value	4398
	.value	11
	.long	.LC42
	.long	.LC8729
	.value	4400
	.value	-3567
	.long	.LC8730
	.long	.LC8731
	.value	4401
	.value	4401
	.long	.LC8732
	.long	.LC8733
	.value	4401
	.value	4401
	.long	.LC8734
	.long	.LC8735
	.value	4401
	.value	4609
	.long	.LC8736
	.long	.LC8737
	.value	4401
	.value	4660
	.long	.LC42
	.long	.LC7496
	.value	4401
	.value	4865
	.long	.LC8738
	.long	.LC8739
	.value	4401
	.value	5474
	.long	.LC8740
	.long	.LC7496
	.value	4401
	.value	10112
	.long	.LC8741
	.long	.LC8742
	.value	4401
	.value	13312
	.long	.LC8743
	.long	.LC6080
	.value	4401
	.value	13313
	.long	.LC8743
	.long	.LC8744
	.value	4401
	.value	21504
	.long	.LC8745
	.long	.LC8746
	.value	4401
	.value	21506
	.long	.LC8747
	.long	.LC8344
	.value	4401
	.value	21510
	.long	.LC42
	.long	.LC8748
	.value	4401
	.value	28976
	.long	.LC8749
	.long	.LC8750
	.value	4401
	.value	28979
	.long	.LC8751
	.long	.LC8752
	.value	4401
	.value	28980
	.long	.LC8753
	.long	.LC8754
	.value	4401
	.value	28997
	.long	.LC8755
	.long	.LC8756
	.value	4401
	.value	28998
	.long	.LC8757
	.long	.LC8758
	.value	4401
	.value	-26832
	.long	.LC8759
	.long	.LC8760
	.value	4403
	.value	30481
	.long	.LC8761
	.long	.LC42
	.value	4403
	.value	30977
	.long	.LC8762
	.long	.LC42
	.value	4403
	.value	30978
	.long	.LC42
	.long	.LC42
	.value	4403
	.value	30993
	.long	.LC42
	.long	.LC42
	.value	4403
	.value	30994
	.long	.LC42
	.long	.LC42
	.value	4403
	.value	31041
	.long	.LC42
	.long	.LC42
	.value	4403
	.value	31042
	.long	.LC42
	.long	.LC42
	.value	4403
	.value	31043
	.long	.LC42
	.long	.LC8763
	.value	4403
	.value	31044
	.long	.LC42
	.long	.LC8763
	.value	4403
	.value	-18143
	.long	.LC42
	.long	.LC42
	.value	4403
	.value	-18142
	.long	.LC42
	.long	.LC42
	.value	4403
	.value	-18141
	.long	.LC42
	.long	.LC8764
	.value	4403
	.value	-8191
	.long	.LC8765
	.long	.LC42
	.value	4403
	.value	-8190
	.long	.LC8766
	.long	.LC42
	.value	4403
	.value	-8189
	.long	.LC8767
	.long	.LC42
	.value	4403
	.value	-8188
	.long	.LC8768
	.long	.LC42
	.value	4403
	.value	-8187
	.long	.LC8769
	.long	.LC8770
	.value	4403
	.value	-8181
	.long	.LC8771
	.long	.LC8772
	.value	4403
	.value	-8176
	.long	.LC8773
	.long	.LC8774
	.value	4403
	.value	-8174
	.long	.LC8775
	.long	.LC8776
	.value	4403
	.value	-8173
	.long	.LC8777
	.long	.LC8778
	.value	4403
	.value	-8172
	.long	.LC8779
	.long	.LC8780
	.value	4403
	.value	-8171
	.long	.LC42
	.long	.LC8781
	.value	4403
	.value	-8168
	.long	.LC42
	.long	.LC8782
	.value	4404
	.value	1
	.long	.LC42
	.long	.LC8783
	.value	4404
	.value	2
	.long	.LC8784
	.long	.LC8785
	.value	4405
	.value	1
	.long	.LC42
	.long	.LC8786
	.value	4408
	.value	-30459
	.long	.LC8787
	.long	.LC8788
	.value	4412
	.value	0
	.long	.LC7142
	.long	.LC8789
	.value	4412
	.value	1
	.long	.LC7142
	.long	.LC8790
	.value	4412
	.value	2321
	.long	.LC8791
	.long	.LC8792
	.value	4412
	.value	2322
	.long	.LC8793
	.long	.LC8794
	.value	4412
	.value	2323
	.long	.LC8795
	.long	.LC8796
	.value	4412
	.value	2324
	.long	.LC8797
	.long	.LC8798
	.value	4415
	.value	2056
	.long	.LC8799
	.long	.LC6824
	.value	4415
	.value	4112
	.long	.LC8800
	.long	.LC6824
	.value	4415
	.value	-32576
	.long	.LC42
	.long	.LC42
	.value	4415
	.value	-32572
	.long	.LC42
	.long	.LC42
	.value	4415
	.value	-32568
	.long	.LC42
	.long	.LC42
	.value	4415
	.value	-30584
	.long	.LC42
	.long	.LC42
	.value	4415
	.value	-28528
	.long	.LC42
	.long	.LC42
	.value	4417
	.value	1
	.long	.LC42
	.long	.LC8801
	.value	4418
	.value	12816
	.long	.LC8802
	.long	.LC8803
	.value	4418
	.value	25616
	.long	.LC8804
	.long	.LC2878
	.value	4418
	.value	25618
	.long	.LC42
	.long	.LC2878
	.value	4418
	.value	25632
	.long	.LC42
	.long	.LC2878
	.value	4418
	.value	25634
	.long	.LC8805
	.long	.LC8805
	.value	4418
	.value	25636
	.long	.LC8806
	.long	.LC8807
	.value	4418
	.value	25637
	.long	.LC8808
	.long	.LC8809
	.value	4418
	.value	25638
	.long	.LC42
	.long	.LC2878
	.value	4418
	.value	25661
	.long	.LC8810
	.long	.LC8811
	.value	4418
	.value	-26506
	.long	.LC8812
	.long	.LC8813
	.value	4418
	.value	3210
	.long	.LC8814
	.long	.LC8815
	.value	4420
	.value	1
	.long	.LC42
	.long	.LC8816
	.value	4421
	.value	-4064
	.long	.LC42
	.long	.LC8817
	.value	4421
	.value	-4063
	.long	.LC8818
	.long	.LC8819
	.value	4421
	.value	-4060
	.long	.LC8820
	.long	.LC8819
	.value	4423
	.value	4387
	.long	.LC4625
	.long	.LC8821
	.value	4424
	.value	16384
	.long	.LC8822
	.long	.LC8594
	.value	4424
	.value	16896
	.long	.LC42
	.long	.LC8113
	.value	4424
	.value	17152
	.long	.LC8823
	.long	.LC8824
	.value	4424
	.value	17184
	.long	.LC8825
	.long	.LC8826
	.value	4424
	.value	-28672
	.long	.LC8827
	.long	.LC8828
	.value	4424
	.value	-25088
	.long	.LC8829
	.long	.LC8830
	.value	4426
	.value	21861
	.long	.LC8831
	.long	.LC8832
	.value	4426
	.value	21881
	.long	.LC8833
	.long	.LC8834
	.value	4426
	.value	21896
	.long	.LC8835
	.long	.LC8836
	.value	4426
	.value	25860
	.long	.LC42
	.long	.LC8837
	.value	4426
	.value	30087
	.long	.LC8838
	.long	.LC42
	.value	4429
	.value	8585
	.long	.LC8839
	.long	.LC8840
	.value	4431
	.value	2
	.long	.LC8841
	.long	.LC42
	.value	4431
	.value	3
	.long	.LC8842
	.long	.LC42
	.value	4431
	.value	4
	.long	.LC8843
	.long	.LC42
	.value	4431
	.value	5
	.long	.LC8844
	.long	.LC42
	.value	4431
	.value	6
	.long	.LC8845
	.long	.LC42
	.value	4431
	.value	7
	.long	.LC8846
	.long	.LC8847
	.value	4431
	.value	9
	.long	.LC8848
	.long	.LC42
	.value	4431
	.value	10
	.long	.LC8849
	.long	.LC42
	.value	4431
	.value	12
	.long	.LC8850
	.long	.LC42
	.value	4431
	.value	13
	.long	.LC8851
	.long	.LC8852
	.value	4431
	.value	17
	.long	.LC8853
	.long	.LC42
	.value	4431
	.value	18
	.long	.LC8854
	.long	.LC42
	.value	4431
	.value	19
	.long	.LC8844
	.long	.LC42
	.value	4431
	.value	20
	.long	.LC8854
	.long	.LC42
	.value	4431
	.value	21
	.long	.LC8843
	.long	.LC42
	.value	4431
	.value	22
	.long	.LC8855
	.long	.LC42
	.value	4431
	.value	23
	.long	.LC8845
	.long	.LC42
	.value	4431
	.value	25
	.long	.LC8856
	.long	.LC42
	.value	4431
	.value	26
	.long	.LC8857
	.long	.LC42
	.value	4431
	.value	27
	.long	.LC8858
	.long	.LC42
	.value	4431
	.value	29
	.long	.LC8859
	.long	.LC8860
	.value	4431
	.value	31
	.long	.LC42
	.long	.LC8861
	.value	4431
	.value	32
	.long	.LC42
	.long	.LC8862
	.value	4431
	.value	33
	.long	.LC42
	.long	.LC8863
	.value	4431
	.value	34
	.long	.LC42
	.long	.LC8864
	.value	4431
	.value	35
	.long	.LC8865
	.long	.LC42
	.value	4431
	.value	36
	.long	.LC8866
	.long	.LC42
	.value	4431
	.value	38
	.long	.LC8867
	.long	.LC42
	.value	4431
	.value	39
	.long	.LC8868
	.long	.LC42
	.value	4431
	.value	41
	.long	.LC8869
	.long	.LC42
	.value	4431
	.value	52
	.long	.LC8870
	.long	.LC42
	.value	4431
	.value	53
	.long	.LC8871
	.long	.LC8872
	.value	4431
	.value	64
	.long	.LC8873
	.long	.LC42
	.value	4431
	.value	66
	.long	.LC8874
	.long	.LC42
	.value	4431
	.value	112
	.long	.LC8875
	.long	.LC42
	.value	4431
	.value	113
	.long	.LC8875
	.long	.LC42
	.value	4431
	.value	114
	.long	.LC8875
	.long	.LC42
	.value	4431
	.value	115
	.long	.LC8875
	.long	.LC42
	.value	4431
	.value	24577
	.long	.LC8876
	.long	.LC42
	.value	4437
	.value	2064
	.long	.LC42
	.long	.LC8877
	.value	4437
	.value	2338
	.long	.LC2603
	.long	.LC6200
	.value	4437
	.value	2342
	.long	.LC42
	.long	.LC6199
	.value	4440
	.value	12305
	.long	.LC42
	.long	.LC8878
	.value	4440
	.value	-28592
	.long	.LC42
	.long	.LC8879
	.value	4440
	.value	-28591
	.long	.LC42
	.long	.LC8879
	.value	4441
	.value	1
	.long	.LC8880
	.long	.LC42
	.value	4441
	.value	2
	.long	.LC8881
	.long	.LC7993
	.value	4445
	.value	3
	.long	.LC8882
	.long	.LC8883
	.value	4445
	.value	5
	.long	.LC42
	.long	.LC8884
	.value	4445
	.value	7
	.long	.LC42
	.long	.LC8884
	.value	4445
	.value	11
	.long	.LC42
	.long	.LC8884
	.value	4445
	.value	12
	.long	.LC8885
	.long	.LC8886
	.value	4445
	.value	15
	.long	.LC42
	.long	.LC8884
	.value	4445
	.value	43
	.long	.LC42
	.long	.LC8887
	.value	4445
	.value	118
	.long	.LC42
	.long	.LC8888
	.value	4445
	.value	211
	.long	.LC8889
	.long	.LC8890
	.value	4445
	.value	212
	.long	.LC8891
	.long	.LC8892
	.value	4445
	.value	257
	.long	.LC42
	.long	.LC8893
	.value	4445
	.value	259
	.long	.LC42
	.long	.LC8894
	.value	4449
	.value	1
	.long	.LC42
	.long	.LC2686
	.value	4451
	.value	1
	.long	.LC8895
	.long	.LC8896
	.value	4451
	.value	8192
	.long	.LC8897
	.long	.LC8898
	.value	4453
	.value	1
	.long	.LC42
	.long	.LC8899
	.value	4454
	.value	5
	.long	.LC8900
	.long	.LC8901
	.value	4454
	.value	6
	.long	.LC8902
	.long	.LC8903
	.value	4454
	.value	7
	.long	.LC8904
	.long	.LC4369
	.value	4454
	.value	8
	.long	.LC8902
	.long	.LC8905
	.value	4454
	.value	9
	.long	.LC8900
	.long	.LC6720
	.value	4454
	.value	16
	.long	.LC8906
	.long	.LC42
	.value	4454
	.value	17
	.long	.LC8907
	.long	.LC42
	.value	4454
	.value	18
	.long	.LC8908
	.long	.LC42
	.value	4454
	.value	19
	.long	.LC8909
	.long	.LC8910
	.value	4454
	.value	20
	.long	.LC8909
	.long	.LC2686
	.value	4454
	.value	21
	.long	.LC8911
	.long	.LC8910
	.value	4454
	.value	22
	.long	.LC8911
	.long	.LC2686
	.value	4454
	.value	23
	.long	.LC8912
	.long	.LC42
	.value	4454
	.value	257
	.long	.LC8913
	.long	.LC42
	.value	4454
	.value	259
	.long	.LC8914
	.long	.LC8915
	.value	4454
	.value	272
	.long	.LC8916
	.long	.LC8917
	.value	4454
	.value	512
	.long	.LC8918
	.long	.LC2692
	.value	4454
	.value	513
	.long	.LC8919
	.long	.LC6802
	.value	4454
	.value	515
	.long	.LC4023
	.long	.LC2692
	.value	4454
	.value	529
	.long	.LC8918
	.long	.LC3314
	.value	4454
	.value	530
	.long	.LC8919
	.long	.LC8920
	.value	4454
	.value	531
	.long	.LC8921
	.long	.LC5618
	.value	4454
	.value	535
	.long	.LC8921
	.long	.LC8922
	.value	4454
	.value	544
	.long	.LC8918
	.long	.LC8923
	.value	4454
	.value	545
	.long	.LC8921
	.long	.LC8924
	.value	4454
	.value	547
	.long	.LC8925
	.long	.LC8926
	.value	4454
	.value	549
	.long	.LC8919
	.long	.LC3333
	.value	4454
	.value	551
	.long	.LC4023
	.long	.LC3333
	.value	4454
	.value	560
	.long	.LC2366
	.long	.LC8927
	.value	4454
	.value	577
	.long	.LC8928
	.long	.LC8929
	.value	4457
	.value	258
	.long	.LC8930
	.long	.LC8931
	.value	4457
	.value	514
	.long	.LC8930
	.long	.LC8932
	.value	4457
	.value	770
	.long	.LC8930
	.long	.LC8933
	.value	4457
	.value	1026
	.long	.LC8930
	.long	.LC8934
	.value	4457
	.value	1282
	.long	.LC8935
	.long	.LC8936
	.value	4457
	.value	2306
	.long	.LC8935
	.long	.LC8937
	.value	4457
	.value	8193
	.long	.LC8938
	.long	.LC8939
	.value	4458
	.value	24832
	.long	.LC42
	.long	.LC8940
	.value	4458
	.value	26624
	.long	.LC42
	.long	.LC8941
	.value	4458
	.value	28928
	.long	.LC42
	.long	.LC8940
	.value	4458
	.value	30720
	.long	.LC42
	.long	.LC8941
	.value	4462
	.value	21
	.long	.LC8942
	.long	.LC8943
	.value	4462
	.value	1280
	.long	.LC8944
	.long	.LC8945
	.value	4466
	.value	1
	.long	.LC8946
	.long	.LC8947
	.value	4466
	.value	4
	.long	.LC3453
	.long	.LC8948
	.value	4470
	.value	-31628
	.long	.LC8949
	.long	.LC8950
	.value	4472
	.value	-20575
	.long	.LC42
	.long	.LC3730
	.value	4473
	.value	258
	.long	.LC8951
	.long	.LC8952
	.value	4473
	.value	259
	.long	.LC42
	.long	.LC8953
	.value	4473
	.value	377
	.long	.LC8954
	.long	.LC8955
	.value	4473
	.value	1028
	.long	.LC42
	.long	.LC42
	.value	4473
	.value	1030
	.long	.LC8956
	.long	.LC8957
	.value	4473
	.value	1031
	.long	.LC42
	.long	.LC42
	.value	4473
	.value	1537
	.long	.LC8958
	.long	.LC8959
	.value	4473
	.value	1538
	.long	.LC42
	.long	.LC8960
	.value	4473
	.value	1539
	.long	.LC8961
	.long	.LC8962
	.value	4473
	.value	1540
	.long	.LC42
	.long	.LC8963
	.value	4473
	.value	1541
	.long	.LC42
	.long	.LC8960
	.value	4473
	.value	1542
	.long	.LC42
	.long	.LC8960
	.value	4473
	.value	1545
	.long	.LC42
	.long	.LC8963
	.value	4473
	.value	1546
	.long	.LC8964
	.long	.LC8965
	.value	4473
	.value	1551
	.long	.LC8966
	.long	.LC2440
	.value	4473
	.value	1553
	.long	.LC42
	.long	.LC2692
	.value	4473
	.value	1559
	.long	.LC8967
	.long	.LC8968
	.value	4473
	.value	1560
	.long	.LC42
	.long	.LC8969
	.value	4473
	.value	1793
	.long	.LC8970
	.long	.LC8971
	.value	4473
	.value	2052
	.long	.LC8972
	.long	.LC8973
	.value	4473
	.value	2053
	.long	.LC8974
	.long	.LC8975
	.value	4473
	.value	3329
	.long	.LC8976
	.long	.LC8977
	.value	4473
	.value	5032
	.long	.LC8978
	.long	.LC8979
	.value	4475
	.value	-31968
	.long	.LC8980
	.long	.LC8981
	.value	4478
	.value	1
	.long	.LC42
	.long	.LC8982
	.value	4485
	.value	-30423
	.long	.LC42
	.long	.LC3314
	.value	4486
	.value	256
	.long	.LC8983
	.long	.LC2671
	.value	4486
	.value	4098
	.long	.LC8984
	.long	.LC6411
	.value	4486
	.value	4352
	.long	.LC8985
	.long	.LC6411
	.value	4486
	.value	4864
	.long	.LC8986
	.long	.LC6411
	.value	4486
	.value	4865
	.long	.LC8987
	.long	.LC6411
	.value	4486
	.value	4928
	.long	.LC8988
	.long	.LC8989
	.value	4486
	.value	5473
	.long	.LC8990
	.long	.LC8989
	.value	4486
	.value	12389
	.long	.LC8991
	.long	.LC8992
	.value	4486
	.value	12550
	.long	.LC8993
	.long	.LC6411
	.value	4486
	.value	13056
	.long	.LC8994
	.long	.LC8995
	.value	4486
	.value	15104
	.long	.LC8996
	.long	.LC8997
	.value	4486
	.value	15369
	.long	.LC8998
	.long	.LC8999
	.value	4486
	.value	16384
	.long	.LC9000
	.long	.LC2382
	.value	4486
	.value	16385
	.long	.LC9001
	.long	.LC9002
	.value	4486
	.value	17152
	.long	.LC9003
	.long	.LC9004
	.value	4486
	.value	19201
	.long	.LC9005
	.long	.LC2382
	.value	4486
	.value	19456
	.long	.LC9005
	.long	.LC2382
	.value	4489
	.value	5522
	.long	.LC42
	.long	.LC9006
	.value	4492
	.value	20
	.long	.LC9007
	.long	.LC9008
	.value	4492
	.value	4375
	.long	.LC9009
	.long	.LC9010
	.value	4493
	.value	1
	.long	.LC3509
	.long	.LC9011
	.value	4493
	.value	18
	.long	.LC9012
	.long	.LC9013
	.value	4493
	.value	20
	.long	.LC9014
	.long	.LC9013
	.value	4493
	.value	36
	.long	.LC9015
	.long	.LC9013
	.value	4493
	.value	68
	.long	.LC9016
	.long	.LC9013
	.value	4493
	.value	274
	.long	.LC9012
	.long	.LC9013
	.value	4493
	.value	276
	.long	.LC9014
	.long	.LC9013
	.value	4493
	.value	292
	.long	.LC9015
	.long	.LC9013
	.value	4493
	.value	324
	.long	.LC9016
	.long	.LC9013
	.value	4493
	.value	530
	.long	.LC9012
	.long	.LC9013
	.value	4493
	.value	532
	.long	.LC9014
	.long	.LC9013
	.value	4493
	.value	548
	.long	.LC9015
	.long	.LC9013
	.value	4493
	.value	580
	.long	.LC9016
	.long	.LC9013
	.value	4493
	.value	786
	.long	.LC9012
	.long	.LC9013
	.value	4493
	.value	788
	.long	.LC9014
	.long	.LC9013
	.value	4493
	.value	804
	.long	.LC9015
	.long	.LC9013
	.value	4493
	.value	836
	.long	.LC9016
	.long	.LC9013
	.value	4494
	.value	66
	.long	.LC42
	.long	.LC42
	.value	4494
	.value	322
	.long	.LC42
	.long	.LC42
	.value	4494
	.value	578
	.long	.LC42
	.long	.LC42
	.value	4494
	.value	834
	.long	.LC42
	.long	.LC42
	.value	4494
	.value	1088
	.long	.LC42
	.long	.LC42
	.value	4494
	.value	1090
	.long	.LC42
	.long	.LC42
	.value	4494
	.value	2114
	.long	.LC42
	.long	.LC42
	.value	4497
	.value	1
	.long	.LC42
	.long	.LC3196
	.value	4497
	.value	2
	.long	.LC9017
	.long	.LC9018
	.value	4497
	.value	3
	.long	.LC42
	.long	.LC9019
	.value	4497
	.value	4
	.long	.LC9020
	.long	.LC9021
	.value	4497
	.value	5
	.long	.LC9017
	.long	.LC9018
	.value	4497
	.value	6
	.long	.LC9022
	.long	.LC9023
	.value	4497
	.value	7
	.long	.LC9024
	.long	.LC9025
	.value	4497
	.value	8
	.long	.LC9026
	.long	.LC9027
	.value	4497
	.value	9
	.long	.LC9026
	.long	.LC9027
	.value	4497
	.value	10
	.long	.LC9028
	.long	.LC9029
	.value	4497
	.value	11
	.long	.LC9030
	.long	.LC9031
	.value	4497
	.value	13
	.long	.LC9032
	.long	.LC9033
	.value	4497
	.value	-32767
	.long	.LC9034
	.long	.LC9035
	.value	4497
	.value	-32766
	.long	.LC9036
	.long	.LC9037
	.value	4497
	.value	-32752
	.long	.LC9038
	.long	.LC3781
	.value	4497
	.value	-32736
	.long	.LC9038
	.long	.LC8642
	.value	4497
	.value	-32720
	.long	.LC9038
	.long	.LC8642
	.value	4497
	.value	-32704
	.long	.LC9038
	.long	.LC2844
	.value	4497
	.value	-32688
	.long	.LC42
	.long	.LC3781
	.value	4497
	.value	-32672
	.long	.LC9039
	.long	.LC6776
	.value	4497
	.value	-32639
	.long	.LC9040
	.long	.LC9041
	.value	4497
	.value	-32630
	.long	.LC9042
	.long	.LC9043
	.value	4503
	.value	268
	.long	.LC9044
	.long	.LC9045
	.value	4505
	.value	1
	.long	.LC42
	.long	.LC9046
	.value	4505
	.value	2
	.long	.LC42
	.long	.LC9047
	.value	4505
	.value	513
	.long	.LC42
	.long	.LC9048
	.value	4507
	.value	4641
	.long	.LC9049
	.long	.LC9050
	.value	4510
	.value	1
	.long	.LC9051
	.long	.LC9052
	.value	4510
	.value	3
	.long	.LC9053
	.long	.LC9054
	.value	-4928
	.value	80
	.long	.LC42
	.long	.LC42
	.value	-4928
	.value	81
	.long	.LC42
	.long	.LC42
	.value	-4928
	.value	96
	.long	.LC42
	.long	.LC42
	.value	-4928
	.value	112
	.long	.LC42
	.long	.LC42
	.value	-4928
	.value	113
	.long	.LC42
	.long	.LC42
	.value	-4928
	.value	114
	.long	.LC42
	.long	.LC42
	.value	-4928
	.value	128
	.long	.LC42
	.long	.LC42
	.value	4520
	.value	29442
	.long	.LC42
	.long	.LC9055
	.value	4520
	.value	29448
	.long	.LC42
	.long	.LC9056
	.value	4520
	.value	29698
	.long	.LC42
	.long	.LC9057
	.value	4520
	.value	29704
	.long	.LC42
	.long	.LC9058
	.value	4521
	.value	16960
	.long	.LC9059
	.long	.LC9060
	.value	4523
	.value	326
	.long	.LC9061
	.long	.LC9062
	.value	4523
	.value	4523
	.long	.LC9063
	.long	.LC9064
	.value	4523
	.value	4523
	.long	.LC9065
	.long	.LC9066
	.value	4523
	.value	5112
	.long	.LC9067
	.long	.LC9068
	.value	4523
	.value	8102
	.long	.LC9069
	.long	.LC9070
	.value	4523
	.value	8103
	.long	.LC7353
	.long	.LC9071
	.value	4523
	.value	8106
	.long	.LC9072
	.long	.LC9073
	.value	4523
	.value	10800
	.long	.LC9074
	.long	.LC9075
	.value	4523
	.value	17184
	.long	.LC9076
	.long	.LC9077
	.value	4523
	.value	17232
	.long	.LC9078
	.long	.LC9079
	.value	4523
	.value	17233
	.long	.LC9080
	.long	.LC9079
	.value	4523
	.value	17234
	.long	.LC9080
	.long	.LC9081
	.value	4523
	.value	17235
	.long	.LC9082
	.long	.LC9083
	.value	4523
	.value	17236
	.long	.LC9084
	.long	.LC9085
	.value	4523
	.value	17237
	.long	.LC9086
	.long	.LC9087
	.value	4523
	.value	17248
	.long	.LC9088
	.long	.LC9089
	.value	4523
	.value	17249
	.long	.LC9078
	.long	.LC9090
	.value	4523
	.value	17250
	.long	.LC6741
	.long	.LC9091
	.value	4523
	.value	17251
	.long	.LC6741
	.long	.LC9092
	.value	4523
	.value	17252
	.long	.LC9093
	.long	.LC9092
	.value	4523
	.value	17253
	.long	.LC9094
	.long	.LC9095
	.value	4523
	.value	17258
	.long	.LC9076
	.long	.LC9096
	.value	4523
	.value	17259
	.long	.LC9097
	.long	.LC3139
	.value	4523
	.value	17937
	.long	.LC9098
	.long	.LC3610
	.value	4523
	.value	17952
	.long	.LC9099
	.long	.LC9100
	.value	4523
	.value	18433
	.long	.LC9101
	.long	.LC9102
	.value	4523
	.value	18441
	.long	.LC9103
	.long	.LC9104
	.value	4523
	.value	20485
	.long	.LC9105
	.long	.LC9106
	.value	4523
	.value	20544
	.long	.LC9107
	.long	.LC9108
	.value	4523
	.value	20545
	.long	.LC9109
	.long	.LC9108
	.value	4523
	.value	20608
	.long	.LC9110
	.long	.LC3310
	.value	4523
	.value	20609
	.long	.LC9110
	.long	.LC3310
	.value	4523
	.value	24641
	.long	.LC9111
	.long	.LC9112
	.value	4523
	.value	24705
	.long	.LC2432
	.long	.LC9113
	.value	4523
	.value	24833
	.long	.LC9114
	.long	.LC9115
	.value	4523
	.value	24849
	.long	.LC2432
	.long	.LC9116
	.value	4523
	.value	24864
	.long	.LC2432
	.long	.LC9116
	.value	4523
	.value	24865
	.long	.LC9117
	.long	.LC9116
	.value	4523
	.value	24866
	.long	.LC2432
	.long	.LC9116
	.value	4523
	.value	24896
	.long	.LC2432
	.long	.LC9116
	.value	4523
	.value	24901
	.long	.LC9118
	.long	.LC9119
	.value	4523
	.value	25376
	.long	.LC9120
	.long	.LC9121
	.value	4523
	.value	25664
	.long	.LC2432
	.long	.LC9122
	.value	4523
	.value	25728
	.long	.LC2432
	.long	.LC9122
	.value	4523
	.value	25733
	.long	.LC9123
	.long	.LC9124
	.value	4523
	.value	-27053
	.long	.LC9125
	.long	.LC9126
	.value	4523
	.value	-4093
	.long	.LC9127
	.long	.LC9128
	.value	4523
	.value	-4092
	.long	.LC9129
	.long	.LC9130
	.value	4523
	.value	-4090
	.long	.LC9131
	.long	.LC9132
	.value	4523
	.value	-1
	.long	.LC9133
	.long	.LC9134
	.value	4525
	.value	1
	.long	.LC9135
	.long	.LC6411
	.value	4525
	.value	2
	.long	.LC9136
	.long	.LC9137
	.value	4525
	.value	-16107
	.long	.LC9138
	.long	.LC9139
	.value	4526
	.value	16723
	.long	.LC42
	.long	.LC9140
	.value	4526
	.value	22594
	.long	.LC42
	.long	.LC9140
	.value	4527
	.value	1
	.long	.LC9141
	.long	.LC9142
	.value	4527
	.value	10
	.long	.LC2476
	.long	.LC9143
	.value	4527
	.value	11
	.long	.LC2476
	.long	.LC9144
	.value	4528
	.value	1
	.long	.LC9145
	.long	.LC9146
	.value	4528
	.value	2
	.long	.LC9147
	.long	.LC9148
	.value	4528
	.value	4
	.long	.LC9149
	.long	.LC9150
	.value	4528
	.value	16
	.long	.LC9151
	.long	.LC9152
	.value	4528
	.value	33
	.long	.LC9153
	.long	.LC9154
	.value	4528
	.value	34
	.long	.LC9153
	.long	.LC9148
	.value	4528
	.value	36
	.long	.LC9153
	.long	.LC9150
	.value	4528
	.value	48
	.long	.LC9153
	.long	.LC9152
	.value	4528
	.value	256
	.long	.LC9155
	.long	.LC9156
	.value	4528
	.value	257
	.long	.LC9155
	.long	.LC9156
	.value	4528
	.value	258
	.long	.LC9155
	.long	.LC9157
	.value	4528
	.value	259
	.long	.LC9155
	.long	.LC9158
	.value	4528
	.value	512
	.long	.LC9159
	.long	.LC9160
	.value	4528
	.value	658
	.long	.LC9161
	.long	.LC9162
	.value	4528
	.value	1280
	.long	.LC9163
	.long	.LC9164
	.value	4528
	.value	2400
	.long	.LC9165
	.long	.LC9166
	.value	4528
	.value	-13984
	.long	.LC9167
	.long	.LC9168
	.value	4533
	.value	1
	.long	.LC9169
	.long	.LC9170
	.value	4533
	.value	2
	.long	.LC9171
	.long	.LC9172
	.value	4533
	.value	3
	.long	.LC9173
	.long	.LC9174
	.value	4533
	.value	4
	.long	.LC9175
	.long	.LC9176
	.value	4533
	.value	5
	.long	.LC9177
	.long	.LC9178
	.value	4533
	.value	6
	.long	.LC9179
	.long	.LC9180
	.value	4533
	.value	7
	.long	.LC9181
	.long	.LC9182
	.value	4533
	.value	8
	.long	.LC9183
	.long	.LC9184
	.value	4533
	.value	9
	.long	.LC9185
	.long	.LC9186
	.value	4533
	.value	10
	.long	.LC9187
	.long	.LC3700
	.value	4533
	.value	11
	.long	.LC9188
	.long	.LC9189
	.value	4533
	.value	12
	.long	.LC9190
	.long	.LC9191
	.value	4533
	.value	18
	.long	.LC9171
	.long	.LC9192
	.value	4533
	.value	19
	.long	.LC9193
	.long	.LC9170
	.value	4533
	.value	20
	.long	.LC9194
	.long	.LC9170
	.value	4533
	.value	8704
	.long	.LC9195
	.long	.LC9196
	.value	112
	.value	26624
	.long	.LC2476
	.long	.LC9197
	.value	4536
	.value	1
	.long	.LC9198
	.long	.LC42
	.value	4537
	.value	-16147
	.long	.LC9199
	.long	.LC42
	.value	4540
	.value	1
	.long	.LC9200
	.long	.LC9201
	.value	4541
	.value	21
	.long	.LC9202
	.long	.LC9203
	.value	4541
	.value	-16706
	.long	.LC9204
	.long	.LC9205
	.value	4541
	.value	-16674
	.long	.LC9206
	.long	.LC9207
	.value	4545
	.value	1088
	.long	.LC9208
	.long	.LC9209
	.value	4545
	.value	1089
	.long	.LC9210
	.long	.LC9211
	.value	4545
	.value	1090
	.long	.LC9212
	.long	.LC9213
	.value	4545
	.value	1091
	.long	.LC9214
	.long	.LC2730
	.value	4545
	.value	1092
	.long	.LC9214
	.long	.LC9215
	.value	4545
	.value	1093
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1094
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1095
	.long	.LC9214
	.long	.LC9216
	.value	4545
	.value	1096
	.long	.LC9208
	.long	.LC9217
	.value	4545
	.value	1097
	.long	.LC9208
	.long	.LC9218
	.value	4545
	.value	1098
	.long	.LC9208
	.long	.LC42
	.value	4545
	.value	1099
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1100
	.long	.LC9214
	.long	.LC9219
	.value	4545
	.value	1101
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1102
	.long	.LC9220
	.long	.LC9221
	.value	4545
	.value	1103
	.long	.LC9222
	.long	.LC9223
	.value	4545
	.value	1104
	.long	.LC9224
	.long	.LC9225
	.value	4545
	.value	1105
	.long	.LC9214
	.long	.LC9226
	.value	4545
	.value	1106
	.long	.LC9214
	.long	.LC9227
	.value	4545
	.value	1107
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1108
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1109
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1110
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1111
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1112
	.long	.LC9228
	.long	.LC9229
	.value	4545
	.value	1113
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1114
	.long	.LC9214
	.long	.LC42
	.value	4545
	.value	1117
	.long	.LC9230
	.long	.LC9231
	.value	4545
	.value	1121
	.long	.LC42
	.long	.LC9232
	.value	4545
	.value	1122
	.long	.LC9233
	.long	.LC9234
	.value	4545
	.value	1124
	.long	.LC9235
	.long	.LC9236
	.value	4545
	.value	1152
	.long	.LC9237
	.long	.LC9238
	.value	4545
	.value	1163
	.long	.LC9212
	.long	.LC9239
	.value	4545
	.value	1164
	.long	.LC9240
	.long	.LC9239
	.value	4545
	.value	1166
	.long	.LC9241
	.long	.LC9242
	.value	4545
	.value	1167
	.long	.LC9243
	.long	.LC9244
	.value	4545
	.value	1344
	.long	.LC42
	.long	.LC42
	.value	4545
	.value	1536
	.long	.LC9245
	.long	.LC9246
	.value	4545
	.value	1568
	.long	.LC9247
	.long	.LC9248
	.value	4545
	.value	4160
	.long	.LC9249
	.long	.LC9250
	.value	4545
	.value	12326
	.long	.LC9251
	.long	.LC9250
	.value	4545
	.value	21504
	.long	.LC9252
	.long	.LC9253
	.value	4545
	.value	22529
	.long	.LC42
	.long	.LC4363
	.value	4545
	.value	22530
	.long	.LC9254
	.long	.LC9255
	.value	4545
	.value	22531
	.long	.LC9256
	.long	.LC9257
	.value	4545
	.value	22533
	.long	.LC9258
	.long	.LC9259
	.value	4545
	.value	22545
	.long	.LC9260
	.long	.LC9261
	.value	4545
	.value	22785
	.long	.LC2626
	.long	.LC9262
	.value	4545
	.value	-26506
	.long	.LC9263
	.long	.LC9213
	.value	4545
	.value	-21728
	.long	.LC9264
	.long	.LC9265
	.value	4545
	.value	-21712
	.long	.LC9266
	.long	.LC9267
	.value	4545
	.value	-4864
	.long	.LC9268
	.long	.LC9269
	.value	4545
	.value	7121
	.long	.LC42
	.long	.LC42
	.value	4550
	.value	12289
	.long	.LC2538
	.long	.LC9270
	.value	4552
	.value	1624
	.long	.LC9271
	.long	.LC9272
	.value	4552
	.value	-10651
	.long	.LC9273
	.long	.LC9274
	.value	4552
	.value	-10649
	.long	.LC9275
	.long	.LC9276
	.value	4553
	.value	16
	.long	.LC42
	.long	.LC9277
	.value	4553
	.value	17
	.long	.LC42
	.long	.LC9278
	.value	4555
	.value	8192
	.long	.LC9279
	.long	.LC9280
	.value	4555
	.value	16384
	.long	.LC9281
	.long	.LC9282
	.value	4555
	.value	-32768
	.long	.LC9283
	.long	.LC9284
	.value	4558
	.value	4139
	.long	.LC9285
	.long	.LC9286
	.value	4561
	.value	503
	.long	.LC9287
	.long	.LC9288
	.value	4561
	.value	504
	.long	.LC9287
	.long	.LC9288
	.value	4561
	.value	505
	.long	.LC9289
	.long	.LC9290
	.value	4561
	.value	5408
	.long	.LC9291
	.long	.LC9292
	.value	4564
	.value	5429
	.long	.LC9293
	.long	.LC9294
	.value	4564
	.value	6149
	.long	.LC9295
	.long	.LC9296
	.value	4564
	.value	6276
	.long	.LC9297
	.long	.LC9298
	.value	4564
	.value	6281
	.long	.LC9299
	.long	.LC9300
	.value	4564
	.value	6529
	.long	.LC9301
	.long	.LC9298
	.value	4564
	.value	6531
	.long	.LC9302
	.long	.LC9298
	.value	4564
	.value	6532
	.long	.LC9303
	.long	.LC9304
	.value	4564
	.value	6534
	.long	.LC9305
	.long	.LC9298
	.value	4564
	.value	6539
	.long	.LC9306
	.long	.LC9307
	.value	4564
	.value	8594
	.long	.LC9308
	.long	.LC9309
	.value	4564
	.value	8602
	.long	.LC9308
	.long	.LC9310
	.value	4564
	.value	8606
	.long	.LC9308
	.long	.LC9311
	.value	4564
	.value	12100
	.long	.LC9312
	.long	.LC9313
	.value	4565
	.value	277
	.long	.LC9314
	.long	.LC9315
	.value	4565
	.value	278
	.long	.LC9316
	.long	.LC9317
	.value	4565
	.value	279
	.long	.LC9318
	.long	.LC9315
	.value	4565
	.value	280
	.long	.LC9316
	.long	.LC9317
	.value	4660
	.value	4369
	.long	.LC9319
	.long	.LC9320
	.globl	PciClassCodeTable
	.section	.rodata
	.align 4
.LC9321:
	.string	"Pre-2.0 PCI Specification Device"
.LC9322:
	.string	"Non-VGA"
.LC9323:
	.string	"VGA Compatible"
.LC9324:
	.string	"Mass Storage Controller"
.LC9325:
	.string	"IDE"
.LC9326:
	.string	"Floppy"
.LC9327:
	.string	"IPI"
.LC9328:
	.string	"RAID"
.LC9329:
	.string	"Other"
.LC9330:
	.string	"Display Controller"
.LC9331:
	.string	"PC Compatible"
.LC9332:
	.string	"8514"
.LC9333:
	.string	"XGA"
.LC9334:
	.string	"Video"
.LC9335:
	.string	"RAM"
.LC9336:
	.string	"Flash"
.LC9337:
	.string	"Bridge Device"
.LC9338:
	.string	"Host/PCI"
.LC9339:
	.string	"PCI/ISA"
.LC9340:
	.string	"PCI/EISA"
.LC9341:
	.string	"PCI/Micro Channel"
.LC9342:
	.string	"PCI/PCI"
.LC9343:
	.string	"PCI/PCMCIA"
.LC9344:
	.string	"PCI/NuBus"
.LC9345:
	.string	"PCI/CardBus"
	.align 4
.LC9346:
	.string	"Simple Communications Controller"
.LC9347:
	.string	"Serial"
.LC9348:
	.string	"Generic XT Compatible"
.LC9349:
	.string	"16450 Compatible"
.LC9350:
	.string	"16550 Compatible"
.LC9351:
	.string	"Parallel"
.LC9352:
	.string	"Standard"
.LC9353:
	.string	"Bidirectional"
.LC9354:
	.string	"ECP 1.X Compliant"
.LC9355:
	.string	"Base Systems Peripheral"
	.align 4
.LC9356:
	.string	"PIC (Programmable Interrupt Controller)"
.LC9357:
	.string	"Generic 8259"
.LC9358:
	.string	"ISA"
.LC9359:
	.string	"DMA (Direct Memory Access)"
.LC9360:
	.string	"EISA"
.LC9361:
	.string	"System Timer"
.LC9362:
	.string	"RTC (Real Time Clock)"
.LC9363:
	.string	"Generic"
.LC9364:
	.string	"Input Device"
.LC9365:
	.string	"Keyboard"
.LC9366:
	.string	"Digitizer (Pen)"
.LC9367:
	.string	"Mouse"
.LC9368:
	.string	"Docking Station"
.LC9369:
	.string	"Processor"
.LC9370:
	.string	"i386"
.LC9371:
	.string	"i486"
.LC9372:
	.string	"Pentium"
.LC9373:
	.string	"Alpha"
.LC9374:
	.string	"Power PC"
.LC9375:
	.string	"Serial Bus Controller"
.LC9376:
	.string	"Firewire (IEEE 1394)"
.LC9377:
	.string	"ACCESS.bus"
	.align 4
.LC9378:
	.string	"SSA (Serial Storage Archetecture)"
.LC9379:
	.string	"USB (Universal Serial Bus)"
	.align 4
.LC9380:
	.string	"Device Does Not Fit In Class Codes"
.LC9381:
	.string	"UDF"
	.data
	.align 32
	.type	PciClassCodeTable, @object
	.size	PciClassCodeTable, 1104
PciClassCodeTable:
	.byte	0
	.byte	0
	.byte	0
	.zero	1
	.long	.LC9321
	.long	.LC9322
	.long	.LC42
	.byte	0
	.byte	1
	.byte	0
	.zero	1
	.long	.LC9321
	.long	.LC9323
	.long	.LC42
	.byte	1
	.byte	0
	.byte	0
	.zero	1
	.long	.LC9324
	.long	.LC3752
	.long	.LC42
	.byte	1
	.byte	1
	.byte	0
	.zero	1
	.long	.LC9324
	.long	.LC9325
	.long	.LC42
	.byte	1
	.byte	2
	.byte	0
	.zero	1
	.long	.LC9324
	.long	.LC9326
	.long	.LC42
	.byte	1
	.byte	3
	.byte	0
	.zero	1
	.long	.LC9324
	.long	.LC9327
	.long	.LC42
	.byte	1
	.byte	4
	.byte	0
	.zero	1
	.long	.LC9324
	.long	.LC9328
	.long	.LC42
	.byte	1
	.byte	-128
	.byte	0
	.zero	1
	.long	.LC9324
	.long	.LC9329
	.long	.LC42
	.byte	2
	.byte	0
	.byte	0
	.zero	1
	.long	.LC3601
	.long	.LC6210
	.long	.LC42
	.byte	2
	.byte	1
	.byte	0
	.zero	1
	.long	.LC3601
	.long	.LC7212
	.long	.LC42
	.byte	2
	.byte	2
	.byte	0
	.zero	1
	.long	.LC3601
	.long	.LC5024
	.long	.LC42
	.byte	2
	.byte	3
	.byte	0
	.zero	1
	.long	.LC3601
	.long	.LC963
	.long	.LC42
	.byte	2
	.byte	-128
	.byte	0
	.zero	1
	.long	.LC3601
	.long	.LC9329
	.long	.LC42
	.byte	3
	.byte	0
	.byte	0
	.zero	1
	.long	.LC9330
	.long	.LC9331
	.long	.LC7605
	.byte	3
	.byte	0
	.byte	1
	.zero	1
	.long	.LC9330
	.long	.LC9331
	.long	.LC9332
	.byte	3
	.byte	1
	.byte	0
	.zero	1
	.long	.LC9330
	.long	.LC9333
	.long	.LC42
	.byte	3
	.byte	-128
	.byte	0
	.zero	1
	.long	.LC9330
	.long	.LC9329
	.long	.LC42
	.byte	4
	.byte	0
	.byte	0
	.zero	1
	.long	.LC2582
	.long	.LC9334
	.long	.LC42
	.byte	4
	.byte	1
	.byte	0
	.zero	1
	.long	.LC2582
	.long	.LC2514
	.long	.LC42
	.byte	4
	.byte	-128
	.byte	0
	.zero	1
	.long	.LC2582
	.long	.LC9329
	.long	.LC42
	.byte	5
	.byte	0
	.byte	0
	.zero	1
	.long	.LC3058
	.long	.LC9335
	.long	.LC42
	.byte	5
	.byte	1
	.byte	0
	.zero	1
	.long	.LC3058
	.long	.LC9336
	.long	.LC42
	.byte	5
	.byte	-128
	.byte	0
	.zero	1
	.long	.LC3058
	.long	.LC9329
	.long	.LC42
	.byte	6
	.byte	0
	.byte	0
	.zero	1
	.long	.LC9337
	.long	.LC9338
	.long	.LC42
	.byte	6
	.byte	1
	.byte	0
	.zero	1
	.long	.LC9337
	.long	.LC9339
	.long	.LC42
	.byte	6
	.byte	2
	.byte	0
	.zero	1
	.long	.LC9337
	.long	.LC9340
	.long	.LC42
	.byte	6
	.byte	3
	.byte	0
	.zero	1
	.long	.LC9337
	.long	.LC9341
	.long	.LC42
	.byte	6
	.byte	4
	.byte	0
	.zero	1
	.long	.LC9337
	.long	.LC9342
	.long	.LC42
	.byte	6
	.byte	5
	.byte	0
	.zero	1
	.long	.LC9337
	.long	.LC9343
	.long	.LC42
	.byte	6
	.byte	6
	.byte	0
	.zero	1
	.long	.LC9337
	.long	.LC9344
	.long	.LC42
	.byte	6
	.byte	7
	.byte	0
	.zero	1
	.long	.LC9337
	.long	.LC9345
	.long	.LC42
	.byte	6
	.byte	-128
	.byte	0
	.zero	1
	.long	.LC9337
	.long	.LC9329
	.long	.LC42
	.byte	7
	.byte	0
	.byte	0
	.zero	1
	.long	.LC9346
	.long	.LC9347
	.long	.LC9348
	.byte	7
	.byte	0
	.byte	1
	.zero	1
	.long	.LC9346
	.long	.LC9347
	.long	.LC9349
	.byte	7
	.byte	0
	.byte	2
	.zero	1
	.long	.LC9346
	.long	.LC9347
	.long	.LC9350
	.byte	7
	.byte	1
	.byte	0
	.zero	1
	.long	.LC9346
	.long	.LC9351
	.long	.LC9352
	.byte	7
	.byte	1
	.byte	0
	.zero	1
	.long	.LC9346
	.long	.LC9351
	.long	.LC9353
	.byte	7
	.byte	1
	.byte	1
	.zero	1
	.long	.LC9346
	.long	.LC9351
	.long	.LC9354
	.byte	7
	.byte	-128
	.byte	2
	.zero	1
	.long	.LC9346
	.long	.LC9329
	.long	.LC42
	.byte	8
	.byte	0
	.byte	0
	.zero	1
	.long	.LC9355
	.long	.LC9356
	.long	.LC9357
	.byte	8
	.byte	0
	.byte	1
	.zero	1
	.long	.LC9355
	.long	.LC9356
	.long	.LC9358
	.byte	8
	.byte	0
	.byte	2
	.zero	1
	.long	.LC9355
	.long	.LC9356
	.long	.LC2736
	.byte	8
	.byte	1
	.byte	0
	.zero	1
	.long	.LC9355
	.long	.LC9359
	.long	.LC9357
	.byte	8
	.byte	1
	.byte	1
	.zero	1
	.long	.LC9355
	.long	.LC9359
	.long	.LC9358
	.byte	8
	.byte	1
	.byte	2
	.zero	1
	.long	.LC9355
	.long	.LC9359
	.long	.LC9360
	.byte	8
	.byte	2
	.byte	0
	.zero	1
	.long	.LC9355
	.long	.LC9361
	.long	.LC9357
	.byte	8
	.byte	2
	.byte	1
	.zero	1
	.long	.LC9355
	.long	.LC9361
	.long	.LC9358
	.byte	8
	.byte	2
	.byte	2
	.zero	1
	.long	.LC9355
	.long	.LC9361
	.long	.LC9360
	.byte	8
	.byte	3
	.byte	0
	.zero	1
	.long	.LC9355
	.long	.LC9362
	.long	.LC9363
	.byte	8
	.byte	3
	.byte	1
	.zero	1
	.long	.LC9355
	.long	.LC9362
	.long	.LC9358
	.byte	8
	.byte	-128
	.byte	0
	.zero	1
	.long	.LC9355
	.long	.LC9329
	.long	.LC42
	.byte	9
	.byte	0
	.byte	0
	.zero	1
	.long	.LC9364
	.long	.LC9365
	.long	.LC42
	.byte	9
	.byte	1
	.byte	0
	.zero	1
	.long	.LC9364
	.long	.LC9366
	.long	.LC42
	.byte	9
	.byte	2
	.byte	0
	.zero	1
	.long	.LC9364
	.long	.LC9367
	.long	.LC42
	.byte	9
	.byte	-128
	.byte	0
	.zero	1
	.long	.LC9364
	.long	.LC9329
	.long	.LC42
	.byte	10
	.byte	0
	.byte	0
	.zero	1
	.long	.LC9368
	.long	.LC9363
	.long	.LC42
	.byte	10
	.byte	-128
	.byte	0
	.zero	1
	.long	.LC9368
	.long	.LC9329
	.long	.LC42
	.byte	11
	.byte	0
	.byte	0
	.zero	1
	.long	.LC9369
	.long	.LC9370
	.long	.LC42
	.byte	11
	.byte	1
	.byte	0
	.zero	1
	.long	.LC9369
	.long	.LC9371
	.long	.LC42
	.byte	11
	.byte	2
	.byte	0
	.zero	1
	.long	.LC9369
	.long	.LC9372
	.long	.LC42
	.byte	11
	.byte	16
	.byte	0
	.zero	1
	.long	.LC9369
	.long	.LC9373
	.long	.LC42
	.byte	11
	.byte	32
	.byte	0
	.zero	1
	.long	.LC9369
	.long	.LC9374
	.long	.LC42
	.byte	11
	.byte	-128
	.byte	0
	.zero	1
	.long	.LC9369
	.long	.LC6894
	.long	.LC42
	.byte	12
	.byte	0
	.byte	0
	.zero	1
	.long	.LC9375
	.long	.LC9376
	.long	.LC42
	.byte	12
	.byte	1
	.byte	0
	.zero	1
	.long	.LC9375
	.long	.LC9377
	.long	.LC42
	.byte	12
	.byte	2
	.byte	0
	.zero	1
	.long	.LC9375
	.long	.LC9378
	.long	.LC42
	.byte	12
	.byte	3
	.byte	0
	.zero	1
	.long	.LC9375
	.long	.LC9379
	.long	.LC42
	.byte	12
	.byte	4
	.byte	0
	.zero	1
	.long	.LC9375
	.long	.LC7084
	.long	.LC42
	.byte	-1
	.byte	0
	.byte	0
	.zero	1
	.long	.LC2613
	.long	.LC9380
	.long	.LC9381
	.globl	PciCommandFlags
	.section	.rodata
.LC9382:
	.string	"I/O Access"
.LC9383:
	.string	"Memory Access"
.LC9384:
	.string	"Bus Mastering"
.LC9385:
	.string	"Special Cycles"
.LC9386:
	.string	"Memory Write & Invalidate"
.LC9387:
	.string	"Palette Snoop"
.LC9388:
	.string	"Parity Errors"
.LC9389:
	.string	"Wait Cycles"
.LC9390:
	.string	"System Errors"
.LC9391:
	.string	"Fast Back-To-Back"
.LC9392:
	.string	"Reserved 10"
.LC9393:
	.string	"Reserved 11"
.LC9394:
	.string	"Reserved 12"
.LC9395:
	.string	"Reserved 13"
.LC9396:
	.string	"Reserved 14"
.LC9397:
	.string	"Reserved 15"
	.data
	.align 32
	.type	PciCommandFlags, @object
	.size	PciCommandFlags, 64
PciCommandFlags:
	.long	.LC9382
	.long	.LC9383
	.long	.LC9384
	.long	.LC9385
	.long	.LC9386
	.long	.LC9387
	.long	.LC9388
	.long	.LC9389
	.long	.LC9390
	.long	.LC9391
	.long	.LC9392
	.long	.LC9393
	.long	.LC9394
	.long	.LC9395
	.long	.LC9396
	.long	.LC9397
	.globl	PciStatusFlags
	.section	.rodata
.LC9398:
	.string	"Reserved 0"
.LC9399:
	.string	"Reserved 1"
.LC9400:
	.string	"Reserved 2"
.LC9401:
	.string	"Reserved 3"
.LC9402:
	.string	"Reserved 4"
.LC9403:
	.string	"66 MHz Capable"
.LC9404:
	.string	"User-Defined Features"
.LC9405:
	.string	"Data Parity Reported"
.LC9406:
	.string	"Signalled Target Abort"
.LC9407:
	.string	"Received Target Abort"
.LC9408:
	.string	"Received Master Abort"
.LC9409:
	.string	"Signalled System Error"
.LC9410:
	.string	"Detected Parity Error"
	.data
	.align 32
	.type	PciStatusFlags, @object
	.size	PciStatusFlags, 64
PciStatusFlags:
	.long	.LC9398
	.long	.LC9399
	.long	.LC9400
	.long	.LC9401
	.long	.LC9402
	.long	.LC9403
	.long	.LC9404
	.long	.LC9391
	.long	.LC9405
	.long	.LC42
	.long	.LC42
	.long	.LC9406
	.long	.LC9407
	.long	.LC9408
	.long	.LC9409
	.long	.LC9410
	.globl	PciDevSelFlags
	.section	.rodata
.LC9411:
	.string	"Fast Devsel Speed"
.LC9412:
	.string	"Medium Devsel Speed"
.LC9413:
	.string	"Slow Devsel Speed"
.LC9414:
	.string	"Reserved 9&10"
	.data
	.align 4
	.type	PciDevSelFlags, @object
	.size	PciDevSelFlags, 16
PciDevSelFlags:
	.long	.LC9411
	.long	.LC9412
	.long	.LC9413
	.long	.LC9414
	.local	devices
	.comm	devices,229376,32
	.local	AHCI_Devices
	.comm	AHCI_Devices,896,32
	.local	TotalAHCIDevices
	.comm	TotalAHCIDevices,4,4
	.globl	test
	.align 4
	.type	test, @object
	.size	test, 20
test:
	.string	"6317065029"
	.zero	9
	.globl	AHCI_BASE
	.section	.bss
	.align 4
	.type	AHCI_BASE, @object
	.size	AHCI_BASE, 4
AHCI_BASE:
	.zero	4
	.comm	Disk_dev,4,4
	.comm	Disk_dev_start,4,4
	.comm	ahci,4,4
	.comm	ahci_start,4,4
	.globl	sata
	.align 4
	.type	sata, @object
	.size	sata, 4
sata:
	.zero	4
	.comm	fs_buf,1024,32
	.comm	start_handle,4,4
	.comm	end,4,4
	.comm	current,4,4
	.comm	curr_dir,232,32
	.comm	current_,128,32
	.comm	curr_port,4,4
	.comm	curr_disk,4,4
	.comm	curr_ahci,4,4
	.comm	sectors,4,4
	.comm	bytemap_off,4,4
	.comm	bytemap_end,4,4
	.comm	curr_file,128,32
	.comm	fsbuf,4,4
	.globl	header_data
	.data
	.align 4
	.type	header_data, @object
	.size	header_data, 4
header_data:
	.long	988
	.globl	BITMAP_LOCATION
	.align 4
	.type	BITMAP_LOCATION, @object
	.size	BITMAP_LOCATION, 4
BITMAP_LOCATION:
	.long	8388608
	.comm	vga,4,4
	.globl	TIME_MASK
	.section	.rodata
	.align 4
	.type	TIME_MASK, @object
	.size	TIME_MASK, 4
TIME_MASK:
	.long	1044480
	.globl	top_queue
	.data
	.align 4
	.type	top_queue, @object
	.size	top_queue, 4
top_queue:
	.long	33636352
	.globl	reached_bottom
	.section	.bss
	.align 4
	.type	reached_bottom, @object
	.size	reached_bottom, 4
reached_bottom:
	.zero	4
	.globl	bottom_task
	.data
	.align 4
	.type	bottom_task, @object
	.size	bottom_task, 4
bottom_task:
	.long	1
	.globl	cli_already
	.section	.bss
	.align 4
	.type	cli_already, @object
	.size	cli_already, 4
cli_already:
	.zero	4
	.globl	multitasking_ON
	.align 4
	.type	multitasking_ON, @object
	.size	multitasking_ON, 4
multitasking_ON:
	.zero	4
	.comm	Kernel_task,4,4
	.comm	Idle_task,4,4
	.comm	Shell_task,4,4
	.comm	Spurious_task,4,4
	.comm	SAS_booster,4,4
	.comm	SAS_eraser,4,4
	.comm	Shell_Istream_task,4,4
	.comm	Shell_Ostream_task,4,4
	.comm	kernel_proc,4,4
	.comm	Shell_proc,4,4
	.comm	SAS_proc,4,4
	.globl	bottom_queue
	.data
	.align 4
	.type	bottom_queue, @object
	.size	bottom_queue, 4
bottom_queue:
	.long	33636352
	.globl	sas_bottom_task
	.align 4
	.type	sas_bottom_task, @object
	.size	sas_bottom_task, 4
sas_bottom_task:
	.long	1
	.globl	last_highest_priority
	.section	.bss
	.align 4
	.type	last_highest_priority, @object
	.size	last_highest_priority, 4
last_highest_priority:
	.zero	4
	.globl	sas_cleaning_complete
	.data
	.align 4
	.type	sas_cleaning_complete, @object
	.size	sas_cleaning_complete, 4
sas_cleaning_complete:
	.long	1
	.globl	highest_task_entry
	.section	.bss
	.align 4
	.type	highest_task_entry, @object
	.size	highest_task_entry, 4
highest_task_entry:
	.zero	4
	.comm	Shell_Commands_list,4,4
	.globl	up_input
	.align 4
	.type	up_input, @object
	.size	up_input, 4
up_input:
	.zero	4
	.globl	Main_CSI_struct
	.data
	.align 4
	.type	Main_CSI_struct, @object
	.size	Main_CSI_struct, 4
Main_CSI_struct:
	.long	52428800
	.comm	CSI_entries_ptr,4,4
	.comm	tot_entries,4,4
	.globl	CSI_mem_start
	.align 4
	.type	CSI_mem_start, @object
	.size	CSI_mem_start, 4
CSI_mem_start:
	.long	52428800
	.globl	key_pressed
	.section	.bss
	.type	key_pressed, @object
	.size	key_pressed, 1
key_pressed:
	.zero	1
	.globl	enter_pressed
	.align 4
	.type	enter_pressed, @object
	.size	enter_pressed, 4
enter_pressed:
	.zero	4
	.comm	Istream_ptr,4,4
	.comm	Current_buf,4,4
	.globl	kb_buff
	.align 4
	.type	kb_buff, @object
	.size	kb_buff, 4
kb_buff:
	.zero	4
	.comm	shell_buf,4,4
	.globl	shell_in
	.align 4
	.type	shell_in, @object
	.size	shell_in, 4
shell_in:
	.zero	4
	.globl	Current_strlen
	.align 4
	.type	Current_strlen, @object
	.size	Current_strlen, 4
Current_strlen:
	.zero	4
	.globl	shell_awake
	.data
	.align 4
	.type	shell_awake, @object
	.size	shell_awake, 4
shell_awake:
	.long	1
	.globl	shell_sleeping
	.section	.bss
	.align 4
	.type	shell_sleeping, @object
	.size	shell_sleeping, 4
shell_sleeping:
	.zero	4
	.comm	Shell_Istream,4,4
	.comm	Input_stream,4,4
	.comm	Istream_end,4,4
	.globl	LAPIC_EOI_send
	.data
	.align 4
	.type	LAPIC_EOI_send, @object
	.size	LAPIC_EOI_send, 4
LAPIC_EOI_send:
	.long	-18874192
	.section	.rodata
.LC9415:
	.string	"\nFault1"
	.text
	.align 16
	.globl	divByZero_handler
	.type	divByZero_handler, @function
divByZero_handler:
.LFB100:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9415
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L482:
	jmp	.L482
	.cfi_endproc
.LFE100:
	.size	divByZero_handler, .-divByZero_handler
	.section	.rodata
.LC9416:
	.string	"\nFault2"
	.text
	.align 16
	.globl	debug_handler
	.type	debug_handler, @function
debug_handler:
.LFB101:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9416
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L485:
	jmp	.L485
	.cfi_endproc
.LFE101:
	.size	debug_handler, .-debug_handler
	.section	.rodata
.LC9417:
	.string	"\nFault3"
	.text
	.align 16
	.globl	NMI_handler
	.type	NMI_handler, @function
NMI_handler:
.LFB102:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9417
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L488:
	jmp	.L488
	.cfi_endproc
.LFE102:
	.size	NMI_handler, .-NMI_handler
	.section	.rodata
.LC9418:
	.string	"\nFault4"
	.text
	.align 16
	.globl	breakpoint_handler
	.type	breakpoint_handler, @function
breakpoint_handler:
.LFB103:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9418
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L491:
	jmp	.L491
	.cfi_endproc
.LFE103:
	.size	breakpoint_handler, .-breakpoint_handler
	.section	.rodata
.LC9419:
	.string	"\nFault5"
	.text
	.align 16
	.globl	overflow_handler
	.type	overflow_handler, @function
overflow_handler:
.LFB104:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9419
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L494:
	jmp	.L494
	.cfi_endproc
.LFE104:
	.size	overflow_handler, .-overflow_handler
	.section	.rodata
.LC9420:
	.string	"\nFault6"
	.text
	.align 16
	.globl	outOfBounds_handler
	.type	outOfBounds_handler, @function
outOfBounds_handler:
.LFB105:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9420
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L497:
	jmp	.L497
	.cfi_endproc
.LFE105:
	.size	outOfBounds_handler, .-outOfBounds_handler
	.section	.rodata
.LC9421:
	.string	"\nFault7"
	.text
	.align 16
	.globl	invalidInstr_handler
	.type	invalidInstr_handler, @function
invalidInstr_handler:
.LFB106:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9421
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L500:
	jmp	.L500
	.cfi_endproc
.LFE106:
	.size	invalidInstr_handler, .-invalidInstr_handler
	.section	.rodata
.LC9422:
	.string	"\nFault8"
	.text
	.align 16
	.globl	noCoprocessor_handler
	.type	noCoprocessor_handler, @function
noCoprocessor_handler:
.LFB107:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9422
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L503:
	jmp	.L503
	.cfi_endproc
.LFE107:
	.size	noCoprocessor_handler, .-noCoprocessor_handler
	.section	.rodata
.LC9423:
	.string	"\nFault9"
	.text
	.align 16
	.globl	doubleFault_handler
	.type	doubleFault_handler, @function
doubleFault_handler:
.LFB108:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9423
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L506:
	jmp	.L506
	.cfi_endproc
.LFE108:
	.size	doubleFault_handler, .-doubleFault_handler
	.section	.rodata
.LC9424:
	.string	"\nFault10"
	.text
	.align 16
	.globl	coprocessor_handler
	.type	coprocessor_handler, @function
coprocessor_handler:
.LFB109:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9424
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L509:
	jmp	.L509
	.cfi_endproc
.LFE109:
	.size	coprocessor_handler, .-coprocessor_handler
	.section	.rodata
.LC9425:
	.string	"\nFault11"
	.text
	.align 16
	.globl	badTSS_handler
	.type	badTSS_handler, @function
badTSS_handler:
.LFB110:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9425
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L512:
	jmp	.L512
	.cfi_endproc
.LFE110:
	.size	badTSS_handler, .-badTSS_handler
	.section	.rodata
.LC9426:
	.string	"\nFault12"
	.text
	.align 16
	.globl	segmentNotPresent_handler
	.type	segmentNotPresent_handler, @function
segmentNotPresent_handler:
.LFB111:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9426
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L515:
	jmp	.L515
	.cfi_endproc
.LFE111:
	.size	segmentNotPresent_handler, .-segmentNotPresent_handler
	.section	.rodata
.LC9427:
	.string	"\nFault13"
	.text
	.align 16
	.globl	stackFault_handler
	.type	stackFault_handler, @function
stackFault_handler:
.LFB112:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9427
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L518:
	jmp	.L518
	.cfi_endproc
.LFE112:
	.size	stackFault_handler, .-stackFault_handler
	.section	.rodata
	.align 4
.LC9428:
	.string	"\nFaul14t ticks: %x Ax%x Bx%x %x %x"
	.text
	.align 16
	.globl	generalProtectionFault_handler
	.type	generalProtectionFault_handler, @function
generalProtectionFault_handler:
.LFB113:
	.cfi_startproc
	subl	$20, %esp
	.cfi_def_cfa_offset 24
/APP
/  136 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	76(%esp)
	.cfi_def_cfa_offset 28
	pushl	76(%esp)
	.cfi_def_cfa_offset 32
	pushl	76(%esp)
	.cfi_def_cfa_offset 36
	pushl	76(%esp)
	.cfi_def_cfa_offset 40
	pushl	tick
	.cfi_def_cfa_offset 44
	pushl	$.LC9428
	.cfi_def_cfa_offset 48
	call	printf
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	call	Shell_Double_buffer
.L521:
	jmp	.L521
	.cfi_endproc
.LFE113:
	.size	generalProtectionFault_handler, .-generalProtectionFault_handler
	.section	.rodata
.LC9429:
	.string	"\nPage fault! ( "
	.align 4
.LC9430:
	.string	"present, Allocating page for it "
.LC9431:
	.string	"read-only "
.LC9432:
	.string	"user-mode "
.LC9433:
	.string	"reserved "
.LC9434:
	.string	"id "
.LC9435:
	.string	") at 0x"
.LC9436:
	.string	" - EIP: "
.LC9437:
	.string	"\n"
	.text
	.align 16
	.globl	pageFault_handler
	.type	pageFault_handler, @function
pageFault_handler:
.LFB114:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$40, %esp
	.cfi_def_cfa_offset 60
	movl	100(%esp), %edi
/APP
/  145 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/  149 "Source/Interrupts/int_handlers.c" 1
	mov %cr2, %esi
/  0 "" 2
/NO_APP
	movl	%edi, %eax
	movl	%edi, %ebp
	movl	%edi, %ebx
	andl	$4, %eax
	andl	$2, %ebp
	andl	$16, %ebx
	movl	%eax, 20(%esp)
	movl	%edi, %eax
	andl	$8, %eax
	movl	%eax, 24(%esp)
	pushl	$.LC9429
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	andl	$1, %edi
	je	.L543
.L524:
	testl	%ebp, %ebp
	jne	.L544
.L525:
	movl	8(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L545
.L526:
	movl	12(%esp), %edx
	testl	%edx, %edx
	jne	.L546
.L527:
	testl	%ebx, %ebx
	jne	.L547
.L528:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9435
	.cfi_def_cfa_offset 64
	call	printf
	movl	%esi, (%esp)
	call	console_write_dec
	movl	$.LC9436, (%esp)
	call	printf
	popl	%eax
	.cfi_def_cfa_offset 60
	pushl	104(%esp)
	.cfi_def_cfa_offset 64
	call	console_write_dec
	movl	$.LC9437, (%esp)
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.L529:
	jmp	.L529
.L547:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9434
	.cfi_def_cfa_offset 64
	call	printf
	movl	%ebx, (%esp)
	call	console_write_dec
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L528
.L546:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9433
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L527
.L545:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9432
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L526
.L544:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9431
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L525
.L543:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9430
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L524
	.cfi_endproc
.LFE114:
	.size	pageFault_handler, .-pageFault_handler
	.section	.rodata
.LC9438:
	.string	"\nFaul15t"
	.text
	.align 16
	.globl	unknownInterrupt_handler
	.type	unknownInterrupt_handler, @function
unknownInterrupt_handler:
.LFB115:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9438
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L549:
	jmp	.L549
	.cfi_endproc
.LFE115:
	.size	unknownInterrupt_handler, .-unknownInterrupt_handler
	.section	.rodata
.LC9439:
	.string	"\nFault16"
	.text
	.align 16
	.globl	coprocessorFault_handler
	.type	coprocessorFault_handler, @function
coprocessorFault_handler:
.LFB116:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9439
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L552:
	jmp	.L552
	.cfi_endproc
.LFE116:
	.size	coprocessorFault_handler, .-coprocessorFault_handler
	.section	.rodata
.LC9440:
	.string	"\nFault17"
	.text
	.align 16
	.globl	alignmentCheck_handler
	.type	alignmentCheck_handler, @function
alignmentCheck_handler:
.LFB117:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9440
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L555:
	jmp	.L555
	.cfi_endproc
.LFE117:
	.size	alignmentCheck_handler, .-alignmentCheck_handler
	.section	.rodata
.LC9441:
	.string	"\nFault18"
	.text
	.align 16
	.globl	machineCheck_handler
	.type	machineCheck_handler, @function
machineCheck_handler:
.LFB118:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9441
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L558:
	jmp	.L558
	.cfi_endproc
.LFE118:
	.size	machineCheck_handler, .-machineCheck_handler
	.section	.rodata
.LC9442:
	.string	"\nFault19"
	.text
	.align 16
	.globl	reserved_handler
	.type	reserved_handler, @function
reserved_handler:
.LFB119:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9442
	.cfi_def_cfa_offset 32
	call	printf
	call	Shell_Double_buffer
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L561:
	jmp	.L561
	.cfi_endproc
.LFE119:
	.size	reserved_handler, .-reserved_handler
	.align 16
	.globl	PIT_handler
	.type	PIT_handler, @function
PIT_handler:
.LFB120:
	.cfi_startproc
/APP
/  233 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	movl	$32, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $32
/  0 "" 2
/  235 "Source/Interrupts/int_handlers.c" 1
	iret
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE120:
	.size	PIT_handler, .-PIT_handler
	.globl	ag
	.data
	.align 4
	.type	ag, @object
	.size	ag, 4
ag:
	.long	1
	.globl	ab
	.section	.bss
	.align 4
	.type	ab, @object
	.size	ab, 4
ab:
	.zero	4
	.text
	.align 16
	.globl	keyboardInterrupt_handler
	.type	keyboardInterrupt_handler, @function
keyboardInterrupt_handler:
.LFB121:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	in_system_dir, %ecx
	testl	%ecx, %ecx
	jne	.L565
	movl	system_dir, %eax
/APP
/  89 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
	movl	_cur_directory, %eax
	movl	multitasking_ON, %edx
	movl	%eax, _prev_directory
	movl	system_dir, %eax
	testl	%edx, %edx
	movl	%eax, _cur_directory
	je	.L566
	movl	current_task, %edx
	movl	%eax, 12(%edx)
.L565:
/APP
/  45 "Library/sys.h" 1
	inb $96, %al
/  0 "" 2
/NO_APP
	testb	%al, %al
	movzbl	%al, %edx
	js	.L638
	movl	scancodes, %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L639
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	keyboard_scancodes
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	cmpl	$13, %eax
	movl	%eax, call
	je	.L640
	cmpl	$8, %eax
	je	.L641
	movl	Istream_ptr, %edx
	movb	%al, (%edx)
	movl	Istream_ptr, %ecx
	leal	1(%ecx), %edx
	movl	kb_buff, %ecx
	movl	%edx, Istream_ptr
	addl	$1, %ecx
	movl	%ecx, kb_buff
	movl	Istream_end, %ecx
	cmpl	%ecx, %edx
	je	.L642
.L604:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movsbl	%al, %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	_putchar
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L568:
	movl	in_system_dir, %eax
	testl	%eax, %eax
	je	.L564
	movl	multitasking_ON, %eax
	testl	%eax, %eax
	je	.L606
	movl	current_task, %edx
	movl	32(%edx), %eax
	movl	%eax, _cur_directory
	movl	%eax, 12(%edx)
.L607:
	movl	system_dir, %edx
	movl	%edx, _prev_directory
/APP
/  118 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
.L564:
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L639:
	.cfi_restore_state
	movl	Special_key_codes(,%edx,4), %eax
	cmpl	$16387, %eax
	je	.L577
	jg	.L578
	cmpl	$12303, %eax
	je	.L579
	jg	.L580
	cmpl	$4352, %eax
	je	.L581
	cmpl	$4353, %eax
	jne	.L568
	movl	$1, _arrow_down
	jmp	.L568
	.align 16
.L566:
	movl	$1, in_system_dir
	jmp	.L565
	.align 16
.L606:
	movl	_prev_directory, %eax
	movl	$0, in_system_dir
	movl	%eax, _cur_directory
	jmp	.L607
	.align 16
.L638:
	movl	Special_key_codes-512(,%edx,4), %eax
	cmpl	$16387, %eax
	je	.L569
	jg	.L570
	cmpl	$4353, %eax
	je	.L571
	cmpl	$16386, %eax
	je	.L572
	cmpl	$4352, %eax
	jne	.L568
	movl	$0, _arrow_up
	jmp	.L568
	.align 16
.L578:
	cmpl	$16391, %eax
	je	.L585
	jg	.L586
	cmpl	$16388, %eax
	je	.L587
	cmpl	$16390, %eax
	jne	.L568
	movl	$2, _shift
	jmp	.L568
	.align 16
.L570:
	cmpl	$16390, %eax
	je	.L572
	jle	.L643
	cmpl	$16391, %eax
	je	.L569
	cmpl	$16392, %eax
	jne	.L568
.L575:
	movl	$0, _alt
	jmp	.L568
	.align 16
.L642:
	movl	Input_stream, %edx
	movl	%edx, Istream_ptr
	jmp	.L604
	.align 16
.L641:
	movl	kb_buff, %eax
	testl	%eax, %eax
	je	.L568
	movl	Istream_ptr, %eax
	leal	-1(%eax), %edx
	movl	%edx, Istream_ptr
	movb	$0, -1(%eax)
	movl	kb_buff, %eax
	subl	$1, %eax
	movl	%eax, kb_buff
	call	backspace
	jmp	.L568
	.align 16
.L586:
	cmpl	$16392, %eax
	je	.L589
	cmpl	$16400, %eax
	jne	.L568
	movl	_scrolllock, %edx
	xorl	%eax, %eax
	movl	_capslock, %ecx
	testl	%edx, %edx
	movl	_numlock, %edx
	sete	%al
	movl	%eax, _scrolllock
	movl	%edx, %eax
	andl	$4, %edx
	orl	$4, %eax
	testl	%ecx, %ecx
	cmovne	%eax, %edx
	.align 16
.L600:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L600
	movl	$-19, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $96
/  0 "" 2
	.align 16
/NO_APP
.L601:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L601
.L637:
	movl	%edx, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $96
/  0 "" 2
/NO_APP
	jmp	.L568
	.align 16
.L580:
	cmpl	$16385, %eax
	je	.L583
	cmpl	$16386, %eax
	jne	.L568
	movl	$1, _shift
	jmp	.L568
	.align 16
.L640:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	Shell_Istream_task
	.cfi_def_cfa_offset 32
	movl	$1, enter_pressed
	call	Priority_promoter
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L568
	.align 16
.L587:
	movl	$1, _alt
	jmp	.L568
	.align 16
.L581:
	movl	$1, _arrow_up
	movl	$1, up_input
	jmp	.L568
	.align 16
.L583:
	movl	_capslock, %eax
	xorl	%edx, %edx
	testl	%eax, %eax
	sete	%dl
	movl	%edx, _capslock
	movl	_numlock, %edx
	movl	%edx, %ecx
	andl	$4, %edx
	orl	$4, %ecx
	testl	%eax, %eax
	cmove	%ecx, %edx
	.align 16
.L593:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L593
	movl	$-19, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $96
/  0 "" 2
	.align 16
/NO_APP
.L594:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L594
	jmp	.L637
	.align 16
.L589:
	movl	$2, _alt
	jmp	.L568
	.align 16
.L569:
	movl	$0, _ctrl
	jmp	.L568
	.align 16
.L571:
	movl	$0, _arrow_down
	jmp	.L568
	.align 16
.L572:
	movl	$0, _shift
	jmp	.L568
	.align 16
.L643:
	cmpl	$16388, %eax
	je	.L575
	jmp	.L568
	.align 16
.L585:
	movl	$2, _ctrl
	jmp	.L568
	.align 16
.L579:
	movl	_numlock, %eax
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %edx
	orl	$4, %eax
	movl	%edx, _numlock
	movl	_capslock, %edx
	testl	%edx, %edx
	movl	$0, %edx
	cmovne	%eax, %edx
	.align 16
.L596:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L596
	movl	$-19, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $96
/  0 "" 2
	.align 16
/NO_APP
.L597:
/APP
/  45 "Library/sys.h" 1
	inb $100, %al
/  0 "" 2
/NO_APP
	testb	$2, %al
	jne	.L597
	jmp	.L637
	.align 16
.L577:
	movl	$1, _ctrl
	jmp	.L568
	.cfi_endproc
.LFE121:
	.size	keyboardInterrupt_handler, .-keyboardInterrupt_handler
	.section	.rodata
.LC9443:
	.string	"\nInterrupt 2"
	.text
	.align 16
	.globl	cascade_handler
	.type	cascade_handler, @function
cascade_handler:
.LFB122:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  387 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9443
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L645:
	jmp	.L645
	.cfi_endproc
.LFE122:
	.size	cascade_handler, .-cascade_handler
	.section	.rodata
.LC9444:
	.string	"\nInterrupt 3"
	.text
	.align 16
	.globl	COM2_handler
	.type	COM2_handler, @function
COM2_handler:
.LFB123:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  396 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9444
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L648:
	jmp	.L648
	.cfi_endproc
.LFE123:
	.size	COM2_handler, .-COM2_handler
	.section	.rodata
.LC9445:
	.string	"\nInterrupt 4"
	.text
	.align 16
	.globl	COM1_handler
	.type	COM1_handler, @function
COM1_handler:
.LFB124:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  405 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9445
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L651:
	jmp	.L651
	.cfi_endproc
.LFE124:
	.size	COM1_handler, .-COM1_handler
	.section	.rodata
.LC9446:
	.string	"\nInterrupt 5"
	.text
	.align 16
	.globl	LPT2_handler
	.type	LPT2_handler, @function
LPT2_handler:
.LFB125:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  414 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9446
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L654:
	jmp	.L654
	.cfi_endproc
.LFE125:
	.size	LPT2_handler, .-LPT2_handler
	.section	.rodata
.LC9447:
	.string	"\nInterrupt 6"
	.text
	.align 16
	.globl	floppyDisk_handler
	.type	floppyDisk_handler, @function
floppyDisk_handler:
.LFB126:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  423 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9447
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L657:
	jmp	.L657
	.cfi_endproc
.LFE126:
	.size	floppyDisk_handler, .-floppyDisk_handler
	.section	.rodata
.LC9448:
	.string	"\nInterrupt 7"
	.text
	.align 16
	.globl	LPT1_handler
	.type	LPT1_handler, @function
LPT1_handler:
.LFB127:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  432 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9448
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L660:
	jmp	.L660
	.cfi_endproc
.LFE127:
	.size	LPT1_handler, .-LPT1_handler
	.section	.rodata
.LC9449:
	.string	"\nInterrupt 8"
	.text
	.align 16
	.globl	RTC_handler
	.type	RTC_handler, @function
RTC_handler:
.LFB128:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  441 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9449
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L663:
	jmp	.L663
	.cfi_endproc
.LFE128:
	.size	RTC_handler, .-RTC_handler
	.section	.rodata
.LC9450:
	.string	"\nInterrupt 9"
	.text
	.align 16
	.globl	periph1_handler
	.type	periph1_handler, @function
periph1_handler:
.LFB129:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  450 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9450
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L666:
	jmp	.L666
	.cfi_endproc
.LFE129:
	.size	periph1_handler, .-periph1_handler
	.section	.rodata
.LC9451:
	.string	"\nInterrupt 10"
	.text
	.align 16
	.globl	periph2_handler
	.type	periph2_handler, @function
periph2_handler:
.LFB130:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  459 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9451
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L669:
	jmp	.L669
	.cfi_endproc
.LFE130:
	.size	periph2_handler, .-periph2_handler
	.section	.rodata
.LC9452:
	.string	"\nInterrupt 11"
	.text
	.align 16
	.globl	periph3_handler
	.type	periph3_handler, @function
periph3_handler:
.LFB131:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  468 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9452
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L672:
	jmp	.L672
	.cfi_endproc
.LFE131:
	.size	periph3_handler, .-periph3_handler
	.align 16
	.globl	mouse_handler
	.type	mouse_handler, @function
mouse_handler:
.LFB132:
	.cfi_startproc
	movl	cycle, %eax
	cmpl	$2, %eax
	leal	mouse_bytes(%eax), %edx
	ja	.L679
	.align 16
.L682:
/APP
/  45 "Library/sys.h" 1
	inb $96, %al
/  0 "" 2
/NO_APP
	movb	%al, (%edx)
	addl	$1, %edx
	cmpl	$mouse_bytes+3, %edx
	jne	.L682
.L679:
	movzbl	mouse_bytes, %eax
	movl	$0, cycle
	testb	%al, %al
	js	.L685
	testb	$64, %al
	jne	.L674
	testb	$32, %al
	jne	.L680
	movl	mousedeltay, %edx
	orl	$-256, %edx
	movl	%edx, mousedeltay
.L680:
	testb	$16, %al
	jne	.L681
	movl	mousedeltax, %eax
	orl	$-256, %eax
	movl	%eax, mousedeltax
.L681:
	movsbl	mouse_bytes+1, %eax
	movl	%eax, mousedeltax
	movsbl	mouse_bytes+2, %eax
	movl	%eax, mousedeltay
.L674:
	rep ret
	.align 16
.L685:
	rep ret
	.cfi_endproc
.LFE132:
	.size	mouse_handler, .-mouse_handler
	.section	.rodata
.LC9453:
	.string	"\nInterrupt 13"
	.text
	.align 16
	.globl	FPU_handler
	.type	FPU_handler, @function
FPU_handler:
.LFB133:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  519 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9453
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L687:
	jmp	.L687
	.cfi_endproc
.LFE133:
	.size	FPU_handler, .-FPU_handler
	.section	.rodata
.LC9454:
	.string	"\nInterrupt 14"
	.text
	.align 16
	.globl	primaryHDD_handler
	.type	primaryHDD_handler, @function
primaryHDD_handler:
.LFB134:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  528 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9454
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L690:
	jmp	.L690
	.cfi_endproc
.LFE134:
	.size	primaryHDD_handler, .-primaryHDD_handler
	.section	.rodata
.LC9455:
	.string	"\nInterrupt 15"
	.text
	.align 16
	.globl	secondaryHDD_handler
	.type	secondaryHDD_handler, @function
secondaryHDD_handler:
.LFB135:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
/APP
/  537 "Source/Interrupts/int_handlers.c" 1
	cli
/  0 "" 2
/NO_APP
	pushl	$.LC9455
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L693:
	jmp	.L693
	.cfi_endproc
.LFE135:
	.size	secondaryHDD_handler, .-secondaryHDD_handler
	.globl	SSE_available
	.data
	.align 4
	.type	SSE_available, @object
	.size	SSE_available, 4
SSE_available:
	.long	1
	.globl	CPUID_FLAG_MSR
	.section	.rodata
	.align 4
	.type	CPUID_FLAG_MSR, @object
	.size	CPUID_FLAG_MSR, 4
CPUID_FLAG_MSR:
	.long	32
	.text
	.align 16
	.globl	cpuHasMSR
	.type	cpuHasMSR, @function
cpuHasMSR:
.LFB136:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$1, %eax
/APP
/  9 "Source/arch/x86/cpu.c" 1
	cpuid
/  0 "" 2
/NO_APP
	movl	%edx, %eax
	shrl	$5, %eax
	andl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE136:
	.size	cpuHasMSR, .-cpuHasMSR
	.comm	_FileSystems,104,32
	.align 16
	.globl	volOpenFile
	.type	volOpenFile, @function
volOpenFile:
.LFB139:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$68, %esp
	.cfi_def_cfa_offset 80
	movl	84(%esp), %eax
	movl	80(%esp), %ebx
	testl	%eax, %eax
	je	.L698
	xorl	%edx, %edx
	cmpb	$58, 1(%eax)
	movl	$97, %esi
	je	.L709
.L699:
	movl	_FileSystems(,%edx,4), %edx
	testl	%edx, %edx
	je	.L698
	leal	4(%esp), %ecx
	subl	$8, %esp
	.cfi_def_cfa_offset 88
	pushl	%eax
	.cfi_def_cfa_offset 92
	movl	24(%edx), %eax
	pushl	%ecx
	.cfi_def_cfa_offset 96
	call	*%eax
	.cfi_def_cfa_offset 92
	movl	%esi, %eax
	movzbl	%al, %esi
	movl	16(%esp), %eax
	movl	%esi, 56(%ebx)
	movl	%eax, (%ebx)
	movl	20(%esp), %eax
	movl	%eax, 4(%ebx)
	movl	24(%esp), %eax
	movl	%eax, 8(%ebx)
	movl	28(%esp), %eax
	movl	%eax, 12(%ebx)
	movl	32(%esp), %eax
	movl	%eax, 16(%ebx)
	movl	36(%esp), %eax
	movl	%eax, 20(%ebx)
	movl	40(%esp), %eax
	movl	%eax, 24(%ebx)
	movl	44(%esp), %eax
	movl	%eax, 28(%ebx)
	movl	48(%esp), %eax
	movl	%eax, 32(%ebx)
	movl	52(%esp), %eax
	movl	%eax, 36(%ebx)
	movl	56(%esp), %eax
	movl	%eax, 40(%ebx)
	movl	60(%esp), %eax
	movl	%eax, 44(%ebx)
	movl	64(%esp), %eax
	movl	%eax, 48(%ebx)
	movl	68(%esp), %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 80
	movl	%eax, 52(%ebx)
	addl	$68, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.align 16
.L698:
	.cfi_restore_state
	movb	$0, (%ebx)
	movb	$0, 1(%ebx)
	movl	%ebx, %eax
	movb	$0, 2(%ebx)
	movb	$0, 3(%ebx)
	movb	$0, 4(%ebx)
	movb	$0, 5(%ebx)
	movb	$0, 6(%ebx)
	movb	$0, 7(%ebx)
	movb	$0, 8(%ebx)
	movb	$0, 9(%ebx)
	movb	$0, 10(%ebx)
	movb	$0, 11(%ebx)
	movb	$0, 12(%ebx)
	movb	$0, 13(%ebx)
	movb	$0, 14(%ebx)
	movb	$0, 15(%ebx)
	movb	$0, 16(%ebx)
	movb	$0, 17(%ebx)
	movb	$0, 18(%ebx)
	movb	$0, 19(%ebx)
	movb	$0, 20(%ebx)
	movb	$0, 21(%ebx)
	movb	$0, 22(%ebx)
	movb	$0, 23(%ebx)
	movb	$0, 24(%ebx)
	movb	$0, 25(%ebx)
	movb	$0, 26(%ebx)
	movb	$0, 27(%ebx)
	movb	$0, 28(%ebx)
	movb	$0, 29(%ebx)
	movb	$0, 30(%ebx)
	movb	$0, 31(%ebx)
	movl	$2, 32(%ebx)
	movl	$0, 36(%ebx)
	movl	$0, 40(%ebx)
	movl	$0, 44(%ebx)
	movl	$0, 48(%ebx)
	movl	$0, 52(%ebx)
	movl	$0, 56(%ebx)
	addl	$68, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.align 16
.L709:
	.cfi_restore_state
	movzbl	(%eax), %esi
	addl	$2, %eax
	movl	%esi, %ecx
	movzbl	%cl, %edx
	subl	$97, %edx
	jmp	.L699
	.cfi_endproc
.LFE139:
	.size	volOpenFile, .-volOpenFile
	.align 16
	.globl	volReadFile
	.type	volReadFile, @function
volReadFile:
.LFB140:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %eax
	testl	%eax, %eax
	je	.L710
	movl	56(%eax), %edx
	movl	_FileSystems-388(,%edx,4), %edx
	testl	%edx, %edx
	je	.L710
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	movl	16(%edx), %eax
	jmp	*%eax
	.align 16
.L710:
	.cfi_restore_state
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE140:
	.size	volReadFile, .-volReadFile
	.align 16
	.globl	volCloseFile
	.type	volCloseFile, @function
volCloseFile:
.LFB141:
	.cfi_startproc
	movl	4(%esp), %eax
	testl	%eax, %eax
	je	.L719
	movl	56(%eax), %edx
	movl	_FileSystems-388(,%edx,4), %edx
	testl	%edx, %edx
	je	.L719
	jmp	*20(%edx)
	.align 16
.L719:
	rep ret
	.cfi_endproc
.LFE141:
	.size	volCloseFile, .-volCloseFile
	.align 16
	.globl	volRegisterFileSystem
	.type	volRegisterFileSystem, @function
volRegisterFileSystem:
.LFB142:
	.cfi_startproc
	movl	i.3846, %eax
	movl	4(%esp), %edx
	cmpl	$25, %eax
	jg	.L727
	testl	%edx, %edx
	je	.L727
	movl	8(%esp), %ecx
	addl	$1, %eax
	movl	%eax, i.3846
	movl	%edx, _FileSystems(,%ecx,4)
.L727:
	rep ret
	.cfi_endproc
.LFE142:
	.size	volRegisterFileSystem, .-volRegisterFileSystem
	.align 16
	.globl	volUnregisterFileSystem
	.type	volUnregisterFileSystem, @function
volUnregisterFileSystem:
.LFB143:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	$_FileSystems, %eax
	jmp	.L737
	.align 16
.L736:
	addl	$4, %eax
	cmpl	$_FileSystems+104, %eax
	je	.L739
.L737:
	cmpl	%edx, (%eax)
	jne	.L736
	movl	$0, (%eax)
	addl	$4, %eax
	cmpl	$_FileSystems+104, %eax
	jne	.L737
.L739:
	rep ret
	.cfi_endproc
.LFE143:
	.size	volUnregisterFileSystem, .-volUnregisterFileSystem
	.align 16
	.globl	volUnregisterFileSystemByID
	.type	volUnregisterFileSystemByID, @function
volUnregisterFileSystemByID:
.LFB144:
	.cfi_startproc
	movl	4(%esp), %eax
	cmpl	$25, %eax
	ja	.L740
	movl	$0, _FileSystems(,%eax,4)
.L740:
	rep ret
	.cfi_endproc
.LFE144:
	.size	volUnregisterFileSystemByID, .-volUnregisterFileSystemByID
	.align 16
	.globl	__cmos_get_short_day
	.type	__cmos_get_short_day, @function
__cmos_get_short_day:
.LFB145:
	.cfi_startproc
	movzbl	4(%esp), %eax
	leal	-2(%eax), %edx
	movl	$.LC287, %eax
	cmpb	$5, %dl
	ja	.L742
	movzbl	%dl, %edx
	movl	CSWTCH.941(,%edx,4), %eax
.L742:
	rep ret
	.cfi_endproc
.LFE145:
	.size	__cmos_get_short_day, .-__cmos_get_short_day
	.section	.rodata
.LC9456:
	.string	"Sunday"
	.text
	.align 16
	.globl	__cmos_get_day
	.type	__cmos_get_day, @function
__cmos_get_day:
.LFB146:
	.cfi_startproc
	movzbl	4(%esp), %eax
	leal	-2(%eax), %edx
	movl	$.LC9456, %eax
	cmpb	$5, %dl
	ja	.L745
	movzbl	%dl, %edx
	movl	CSWTCH.943(,%edx,4), %eax
.L745:
	rep ret
	.cfi_endproc
.LFE146:
	.size	__cmos_get_day, .-__cmos_get_day
	.section	.rodata
.LC9457:
	.string	"Jan"
	.text
	.align 16
	.globl	__cmos_get_short_month
	.type	__cmos_get_short_month, @function
__cmos_get_short_month:
.LFB147:
	.cfi_startproc
	movzbl	4(%esp), %eax
	leal	-2(%eax), %edx
	movl	$.LC9457, %eax
	cmpb	$10, %dl
	ja	.L748
	movzbl	%dl, %edx
	movl	CSWTCH.945(,%edx,4), %eax
.L748:
	rep ret
	.cfi_endproc
.LFE147:
	.size	__cmos_get_short_month, .-__cmos_get_short_month
	.section	.rodata
.LC9458:
	.string	"January"
	.text
	.align 16
	.globl	__cmos_get_month
	.type	__cmos_get_month, @function
__cmos_get_month:
.LFB148:
	.cfi_startproc
	movzbl	4(%esp), %eax
	leal	-2(%eax), %edx
	movl	$.LC9458, %eax
	cmpb	$10, %dl
	ja	.L751
	movzbl	%dl, %edx
	movl	CSWTCH.947(,%edx,4), %eax
.L751:
	rep ret
	.cfi_endproc
.LFE148:
	.size	__cmos_get_month, .-__cmos_get_month
	.align 16
	.globl	__cmos_do_doomsday
	.type	__cmos_do_doomsday, @function
__cmos_do_doomsday:
.LFB149:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	16(%esp), %ebx
	movl	12(%esp), %eax
	movl	20(%esp), %esi
	cmpb	$2, %bl
	ja	.L756
	leal	13(%ebx), %edx
	leal	-1(%esi), %ecx
.L755:
	movl	%ecx, %ebx
	movzbl	%al, %eax
	movzbl	%dl, %edx
	shrb	$2, %bl
	movzbl	%bl, %esi
	movzbl	%cl, %ebx
	leal	0(,%ebx,4), %ecx
	addl	%ebx, %eax
	addl	%esi, %eax
	movl	%ebx, %esi
	addl	%ebx, %ecx
	leal	(%esi,%ecx,8), %ecx
	shrw	$12, %cx
	subl	%ecx, %eax
	movl	%eax, %ecx
	leal	(%edx,%edx,2), %eax
	leal	-27(%edx,%eax,4), %ebx
	movl	$1717986919, %edx
	movl	%ebx, %eax
	sarl	$31, %ebx
	imull	%edx
	sarl	%edx
	subl	%ebx, %edx
	leal	(%ecx,%edx), %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	movzwl	%ax, %edx
	imull	$9363, %edx, %edx
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	movl	%edx, %ecx
	movl	%eax, %edx
	shrl	$16, %ecx
	subl	%ecx, %edx
	shrw	%dx
	addl	%ecx, %edx
	shrw	$2, %dx
	leal	0(,%edx,8), %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	subl	%edx, %eax
	addl	$1, %eax
	ret
	.align 16
.L756:
	.cfi_restore_state
	movl	%ebx, %edx
	movl	%esi, %ecx
	jmp	.L755
	.cfi_endproc
.LFE149:
	.size	__cmos_do_doomsday, .-__cmos_do_doomsday
	.align 16
	.globl	decode_bcd
	.type	decode_bcd, @function
decode_bcd:
.LFB150:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %eax
	movzbl	%al, %ebx
	andl	$15, %eax
	movl	%ebx, %edx
	sarl	$3, %ebx
	sarl	%edx
	andl	$30, %ebx
	movl	%edx, %ecx
	andl	$120, %ecx
	leal	(%ecx,%ebx), %edx
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	addl	%edx, %eax
	ret
	.cfi_endproc
.LFE150:
	.size	decode_bcd, .-decode_bcd
	.comm	cmos,2,1
	.align 16
	.globl	init_cmos
	.type	init_cmos, @function
init_cmos:
.LFB151:
	.cfi_startproc
/APP
/  151 "Source/Drivers/timer/cmos.c" 1
	cli
/  0 "" 2
/NO_APP
	movl	$11, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $112
/  0 "" 2
/  45 "Library/sys.h" 1
	inb $113, %al
/  0 "" 2
/  154 "Source/Drivers/timer/cmos.c" 1
	sti
/  0 "" 2
/NO_APP
	movl	%eax, %edx
	shrb	$2, %al
	shrb	%dl
	xorl	$1, %eax
	andl	$1, %edx
	andl	$1, %eax
	movb	%dl, cmos
	movb	%al, cmos+1
	ret
	.cfi_endproc
.LFE151:
	.size	init_cmos, .-init_cmos
	.align 16
	.globl	cmos_24hour
	.type	cmos_24hour, @function
cmos_24hour:
.LFB152:
	.cfi_startproc
	movzbl	cmos, %eax
	ret
	.cfi_endproc
.LFE152:
	.size	cmos_24hour, .-cmos_24hour
	.align 16
	.globl	cmos_bcd_encoded
	.type	cmos_bcd_encoded, @function
cmos_bcd_encoded:
.LFB153:
	.cfi_startproc
	movzbl	cmos+1, %eax
	ret
	.cfi_endproc
.LFE153:
	.size	cmos_bcd_encoded, .-cmos_bcd_encoded
	.align 16
	.globl	cmos_updating
	.type	cmos_updating, @function
cmos_updating:
.LFB154:
	.cfi_startproc
/APP
/  151 "Source/Drivers/timer/cmos.c" 1
	cli
/  0 "" 2
/NO_APP
	movl	$10, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $112
/  0 "" 2
/  45 "Library/sys.h" 1
	inb $113, %al
/  0 "" 2
/  154 "Source/Drivers/timer/cmos.c" 1
	sti
/  0 "" 2
/NO_APP
	shrb	$7, %al
	ret
	.cfi_endproc
.LFE154:
	.size	cmos_updating, .-cmos_updating
	.align 16
	.globl	cmos_rtc_get_value
	.type	cmos_rtc_get_value, @function
cmos_rtc_get_value:
.LFB156:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %ecx
	movl	12(%esp), %ebx
/APP
/  151 "Source/Drivers/timer/cmos.c" 1
	cli
/  0 "" 2
/NO_APP
	movl	%ecx, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $112
/  0 "" 2
/  45 "Library/sys.h" 1
	inb $113, %al
/  0 "" 2
/NO_APP
	movl	%eax, %edx
/APP
/  154 "Source/Drivers/timer/cmos.c" 1
	sti
/  0 "" 2
/NO_APP
	cmpb	$0, cmos+1
	je	.L764
	testb	%bl, %bl
	je	.L764
	cmpl	$50, %ecx
	ja	.L764
	jmp	*.L767(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L767:
	.long	.L766
	.long	.L764
	.long	.L766
	.long	.L764
	.long	.L766
	.long	.L764
	.long	.L766
	.long	.L766
	.long	.L766
	.long	.L766
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L764
	.long	.L766
	.text
	.align 16
.L766:
	movzbl	%al, %edx
	andl	$15, %eax
	movl	%edx, %ecx
	sarl	$3, %edx
	sarl	%ecx
	andl	$30, %edx
	movl	%ecx, %ebx
	andl	$120, %ebx
	leal	(%ebx,%edx), %ecx
	leal	(%ecx,%eax), %edx
.L764:
	movl	%edx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE156:
	.size	cmos_rtc_get_value, .-cmos_rtc_get_value
	.align 16
	.globl	pci_vendor_lookup
	.type	pci_vendor_lookup, @function
pci_vendor_lookup:
.LFB157:
	.cfi_startproc
	movzwl	4(%esp), %ecx
	movl	$PciVenTable, %edx
	xorl	%eax, %eax
	jmp	.L772
	.align 16
.L770:
	addl	$1, %eax
	addl	$12, %edx
	cmpl	$1498, %eax
	je	.L774
.L772:
	cmpw	%cx, (%edx)
	jne	.L770
	leal	(%eax,%eax,2), %eax
	movl	PciVenTable+8(,%eax,4), %eax
	ret
	.align 16
.L774:
	movl	$.LC42, %eax
	ret
	.cfi_endproc
.LFE157:
	.size	pci_vendor_lookup, .-pci_vendor_lookup
	.align 16
	.globl	pci_device_lookup
	.type	pci_device_lookup, @function
pci_device_lookup:
.LFB158:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$PciDevTable, %eax
	movzwl	8(%esp), %ecx
	movzwl	12(%esp), %ebx
	xorl	%edx, %edx
	jmp	.L778
	.align 16
.L776:
	addl	$1, %edx
	addl	$12, %eax
	cmpl	$5335, %edx
	je	.L781
.L778:
	cmpw	%cx, (%eax)
	jne	.L776
	cmpw	%bx, 2(%eax)
	jne	.L776
	leal	(%edx,%edx,2), %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	movl	PciDevTable+8(,%eax,4), %eax
	ret
	.align 16
.L781:
	.cfi_restore_state
	movl	$.LC42, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE158:
	.size	pci_device_lookup, .-pci_device_lookup
	.align 16
	.globl	pciConfigReadWord
	.type	pciConfigReadWord, @function
pciConfigReadWord:
.LFB159:
	.cfi_startproc
	movl	16(%esp), %ecx
	movzwl	12(%esp), %edx
	movl	%ecx, %eax
	andl	$252, %eax
	sall	$8, %edx
	orl	$-2147483648, %eax
	orl	%edx, %eax
	movzwl	8(%esp), %edx
	sall	$11, %edx
	orl	%edx, %eax
	movzwl	4(%esp), %edx
	sall	$16, %edx
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	$3324, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	andl	$2, %ecx
	movzwl	%cx, %ecx
	sall	$3, %ecx
	shrl	%cl, %eax
	ret
	.cfi_endproc
.LFE159:
	.size	pciConfigReadWord, .-pciConfigReadWord
	.align 16
	.globl	PciRead32
	.type	PciRead32, @function
PciRead32:
.LFB160:
	.cfi_startproc
	movl	16(%esp), %eax
	movl	12(%esp), %edx
	andl	$252, %eax
	sall	$8, %edx
	orl	$-2147483648, %eax
	orl	%edx, %eax
	movl	8(%esp), %edx
	sall	$11, %edx
	orl	%edx, %eax
	movl	4(%esp), %edx
	sall	$16, %edx
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	$3324, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE160:
	.size	PciRead32, .-PciRead32
	.align 16
	.globl	PciRead16
	.type	PciRead16, @function
PciRead16:
.LFB161:
	.cfi_startproc
	movl	16(%esp), %ecx
	movl	12(%esp), %edx
	movl	%ecx, %eax
	sall	$8, %edx
	andl	$252, %eax
	orl	$-2147483648, %eax
	orl	%edx, %eax
	movl	8(%esp), %edx
	sall	$11, %edx
	orl	%edx, %eax
	movl	4(%esp), %edx
	sall	$16, %edx
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	andl	$2, %ecx
	leal	3324(%ecx), %edx
/APP
/  61 "Library/sys.h" 1
	inw %dx, %ax
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE161:
	.size	PciRead16, .-PciRead16
	.align 16
	.globl	PciRead8
	.type	PciRead8, @function
PciRead8:
.LFB162:
	.cfi_startproc
	movl	16(%esp), %ecx
	movl	12(%esp), %edx
	movl	%ecx, %eax
	sall	$8, %edx
	andl	$252, %eax
	orl	$-2147483648, %eax
	orl	%edx, %eax
	movl	8(%esp), %edx
	sall	$11, %edx
	orl	%edx, %eax
	movl	4(%esp), %edx
	sall	$16, %edx
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	andl	$3, %ecx
	leal	3324(%ecx), %edx
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE162:
	.size	PciRead8, .-PciRead8
	.align 16
	.globl	PciWrite32
	.type	PciWrite32, @function
PciWrite32:
.LFB163:
	.cfi_startproc
	movl	16(%esp), %eax
	movl	12(%esp), %edx
	andl	$252, %eax
	sall	$8, %edx
	orl	$-2147483648, %eax
	orl	%edx, %eax
	movl	8(%esp), %edx
	sall	$11, %edx
	orl	%edx, %eax
	movl	4(%esp), %edx
	sall	$16, %edx
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	$3324, %edx
	movl	20(%esp), %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE163:
	.size	PciWrite32, .-PciWrite32
	.align 16
	.globl	PciWrite16
	.type	PciWrite16, @function
PciWrite16:
.LFB164:
	.cfi_startproc
	movl	16(%esp), %ecx
	movl	12(%esp), %edx
	movl	%ecx, %eax
	sall	$8, %edx
	andl	$252, %eax
	orl	$-2147483648, %eax
	orl	%edx, %eax
	movl	8(%esp), %edx
	sall	$11, %edx
	orl	%edx, %eax
	movl	4(%esp), %edx
	sall	$16, %edx
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	andl	$2, %ecx
	movl	20(%esp), %eax
	leal	3324(%ecx), %edx
/APP
/  53 "Library/sys.h" 1
	outw %ax, %dx
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE164:
	.size	PciWrite16, .-PciWrite16
	.align 16
	.globl	PciWrite8
	.type	PciWrite8, @function
PciWrite8:
.LFB165:
	.cfi_startproc
	movl	16(%esp), %ecx
	movl	12(%esp), %edx
	movl	%ecx, %eax
	sall	$8, %edx
	andl	$252, %eax
	orl	$-2147483648, %eax
	orl	%edx, %eax
	movl	8(%esp), %edx
	sall	$11, %edx
	orl	%edx, %eax
	movl	4(%esp), %edx
	sall	$16, %edx
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	andl	$3, %ecx
	movl	20(%esp), %eax
	leal	3324(%ecx), %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE165:
	.size	PciWrite8, .-PciWrite8
	.align 16
	.globl	PciDeviceRead
	.type	PciDeviceRead, @function
PciDeviceRead:
.LFB166:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	16(%esp), %eax
	movl	8(%esp), %edx
	movl	12(%esp), %ecx
	cmpl	$1, %eax
	je	.L794
	cmpl	$2, %eax
	movl	8(%edx), %eax
	je	.L795
	andl	$252, %ecx
	sall	$11, %eax
	orl	$-2147483648, %ecx
	orl	%ecx, %eax
	movl	12(%edx), %ecx
	sall	$8, %ecx
	orl	%ecx, %eax
	movl	4(%edx), %ecx
	movl	$3320, %edx
	sall	$16, %ecx
	orl	%ecx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	$3324, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L794:
	.cfi_restore_state
	movl	8(%edx), %eax
	movl	%ecx, %ebx
	andl	$252, %ebx
	orl	$-2147483648, %ebx
	sall	$11, %eax
	orl	%ebx, %eax
	movl	12(%edx), %ebx
	movl	4(%edx), %edx
	sall	$8, %ebx
	sall	$16, %edx
	orl	%ebx, %eax
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	andl	$3, %ecx
	leal	3324(%ecx), %edx
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	movzbl	%al, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L795:
	.cfi_restore_state
	movl	%ecx, %ebx
	sall	$11, %eax
	andl	$252, %ebx
	orl	$-2147483648, %ebx
	orl	%ebx, %eax
	movl	12(%edx), %ebx
	movl	4(%edx), %edx
	sall	$8, %ebx
	sall	$16, %edx
	orl	%ebx, %eax
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	andl	$2, %ecx
	leal	3324(%ecx), %edx
/APP
/  61 "Library/sys.h" 1
	inw %dx, %ax
/  0 "" 2
/NO_APP
	movzwl	%ax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE166:
	.size	PciDeviceRead, .-PciDeviceRead
	.align 16
	.globl	PciDeviceWrite
	.type	PciDeviceWrite, @function
PciDeviceWrite:
.LFB167:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	20(%esp), %eax
	movl	8(%esp), %edx
	movl	12(%esp), %ecx
	cmpl	$1, %eax
	je	.L801
	cmpl	$2, %eax
	movl	8(%edx), %eax
	je	.L802
	andl	$252, %ecx
	sall	$11, %eax
	orl	$-2147483648, %ecx
	orl	%ecx, %eax
	movl	12(%edx), %ecx
	movl	4(%edx), %edx
	sall	$8, %ecx
	sall	$16, %edx
	orl	%ecx, %eax
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	$3324, %edx
	movl	16(%esp), %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L801:
	.cfi_restore_state
	movl	8(%edx), %eax
	movl	%ecx, %ebx
	andl	$252, %ebx
	orl	$-2147483648, %ebx
	sall	$11, %eax
	orl	%ebx, %eax
	movl	12(%edx), %ebx
	movl	4(%edx), %edx
	sall	$8, %ebx
	sall	$16, %edx
	orl	%ebx, %eax
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	andl	$3, %ecx
	movzbl	16(%esp), %eax
	leal	3324(%ecx), %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L802:
	.cfi_restore_state
	movl	%ecx, %ebx
	sall	$11, %eax
	andl	$252, %ebx
	orl	$-2147483648, %ebx
	orl	%ebx, %eax
	movl	12(%edx), %ebx
	movl	4(%edx), %edx
	sall	$8, %ebx
	sall	$16, %edx
	orl	%ebx, %eax
	orl	%edx, %eax
	movl	$3320, %edx
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	andl	$2, %ecx
	movzwl	16(%esp), %eax
	leal	3324(%ecx), %edx
/APP
/  53 "Library/sys.h" 1
	outw %ax, %dx
/  0 "" 2
/NO_APP
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE167:
	.size	PciDeviceWrite, .-PciDeviceWrite
	.comm	tempPCS,4,4
	.align 16
	.globl	checkDevice
	.type	checkDevice, @function
checkDevice:
.LFB168:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	tempPCS, %eax
	movl	52(%esp), %ecx
	movl	56(%esp), %ebx
	leal	64(%eax), %edx
	.align 16
.L804:
	addl	$1, %eax
	movb	$0, -1(%eax)
	cmpl	%edx, %eax
	jne	.L804
	movl	tempPCS, %eax
	movzbl	%cl, %edi
	movl	$3320, %ebp
	movl	%edi, 12(%esp)
	xorl	%ecx, %ecx
	movl	%eax, %esi
	movl	%eax, 4(%esp)
	movzbl	%bl, %eax
	movl	%edi, %ebx
	movl	%eax, 8(%esp)
	sall	$11, %eax
	sall	$16, %ebx
	movl	$3324, %edi
	orl	$-2147483648, %ebx
	orl	%eax, %ebx
.L805:
	movl	%ecx, %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, (%esi)
	leal	4(%ecx), %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 4(%esi)
	leal	8(%ecx), %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 8(%esi)
	leal	12(%ecx), %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	addl	$16, %ecx
	movl	%eax, 12(%esi)
	addl	$16, %esi
	cmpl	$64, %ecx
	jne	.L805
	movl	4(%esp), %eax
	cmpw	$-1, (%eax)
	je	.L813
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	movl	$3320, %ebp
	movl	$3324, %edi
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$64
	.cfi_def_cfa_offset 64
	call	kmalloc_int
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	%eax, %esi
	xorl	%ecx, %ecx
.L808:
	movl	%ecx, %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, (%ecx,%esi)
	leal	4(%ecx), %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 4(%ecx,%esi)
	leal	8(%ecx), %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 8(%ecx,%esi)
	leal	12(%ecx), %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 12(%ecx,%esi)
	addl	$16, %ecx
	cmpl	$64, %ecx
	jne	.L808
	movl	48(%esp), %eax
	movl	12(%esp), %edi
	movl	%edi, 4(%eax)
	movl	8(%esp), %edi
	movl	$0, (%eax)
	movl	$0, 12(%eax)
	movl	%esi, 16(%eax)
	movl	$0, 20(%eax)
	movl	%edi, 8(%eax)
	movl	$0, 24(%eax)
	movl	48(%esp), %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.L813:
	.cfi_restore_state
	movl	48(%esp), %eax
	movl	$-1, (%eax)
	movl	$-1, 4(%eax)
	movl	$-1, 8(%eax)
	movl	$-1, 12(%eax)
	movl	$0, 16(%eax)
	movl	$0, 20(%eax)
	movl	$0, 24(%eax)
	movl	48(%esp), %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE168:
	.size	checkDevice, .-checkDevice
	.section	.rodata
	.align 4
.LC9459:
	.string	"\n\tSecondary DEVICE: %s CLASS: %x SUBCLASS: %x"
	.text
	.align 16
	.globl	checkSecBus
	.type	checkSecBus, @function
checkSecBus:
.LFB169:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	$3320, %ebp
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	movl	$3324, %edi
	subl	$36, %esp
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$60
	.cfi_def_cfa_offset 64
	call	kmalloc_int
	movl	68(%esp), %ebx
	movl	%eax, %esi
	movl	64(%esp), %eax
	xorl	%ecx, %ecx
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	sall	$11, %ebx
	sall	$16, %eax
	orl	$-2147483648, %ebx
	orl	%eax, %ebx
.L815:
	movl	%ecx, %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, (%ecx,%esi)
	leal	4(%ecx), %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 4(%ecx,%esi)
	leal	8(%ecx), %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 8(%ecx,%esi)
	leal	12(%ecx), %eax
	movl	%ebp, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%edi, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 12(%ecx,%esi)
	addl	$16, %ecx
	cmpl	$64, %ecx
	jne	.L815
	movzbl	25(%esi), %eax
	movl	$0, (%esp)
	movl	$3320, %esi
	movl	$3324, %ebp
	sall	$16, %eax
	movl	%eax, 4(%esp)
	.align 16
.L822:
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$64
	.cfi_def_cfa_offset 64
	call	kmalloc_int
	movl	%eax, %edi
	movl	16(%esp), %eax
	xorl	%ecx, %ecx
	leal	0(,%eax,8), %ebx
	orl	20(%esp), %ebx
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	orl	$-2147483648, %ebx
	orl	%eax, %ebx
.L816:
	movl	%ecx, %eax
	movl	%esi, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%ebp, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, (%ecx,%edi)
	leal	4(%ecx), %eax
	movl	%esi, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%ebp, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 4(%ecx,%edi)
	leal	8(%ecx), %eax
	movl	%esi, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%ebp, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 8(%ecx,%edi)
	leal	12(%ecx), %eax
	movl	%esi, %edx
	andl	$252, %eax
	orl	%ebx, %eax
/APP
/  86 "Library/sys.h" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	movl	%ebp, %edx
/APP
/  94 "Library/sys.h" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, 12(%ecx,%edi)
	addl	$16, %ecx
	cmpl	$64, %ecx
	jne	.L816
	movzwl	(%edi), %ecx
	cmpw	$-1, %cx
	je	.L828
	movzbl	10(%edi), %eax
	movzwl	2(%edi), %ebx
	xorl	%edx, %edx
	movl	%eax, 8(%esp)
	movzbl	11(%edi), %eax
	movl	%eax, 12(%esp)
	movl	$PciDevTable, %eax
	jmp	.L821
	.align 16
.L819:
	addl	$1, %edx
	addl	$12, %eax
	cmpl	$5335, %edx
	je	.L829
.L821:
	cmpw	(%eax), %cx
	jne	.L819
	cmpw	2(%eax), %bx
	jne	.L819
	leal	(%edx,%edx,2), %eax
	movl	PciDevTable+8(,%eax,4), %eax
.L820:
	pushl	8(%esp)
	.cfi_def_cfa_offset 52
	pushl	16(%esp)
	.cfi_def_cfa_offset 56
	pushl	%eax
	.cfi_def_cfa_offset 60
	pushl	$.LC9459
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.L818:
	addl	$256, (%esp)
	addl	$65536, 4(%esp)
	movl	(%esp), %eax
	cmpl	$2048, %eax
	jne	.L822
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L829:
	.cfi_restore_state
	movl	$.LC42, %eax
	jmp	.L820
.L828:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%edi
	.cfi_def_cfa_offset 64
	call	kfree
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L818
	.cfi_endproc
.LFE169:
	.size	checkSecBus, .-checkSecBus
	.section	.rodata
.LC9460:
	.string	"\n\n  Secondary Bus number "
.LC9461:
	.string	"\n\n  BUS number "
.LC9462:
	.string	"\n\tDEVICE: "
.LC9463:
	.string	" CLASS: "
.LC9464:
	.string	" subCLASS: "
.LC9465:
	.string	"\n\n"
	.text
	.align 16
	.globl	checkAllBuses
	.type	checkAllBuses, @function
checkAllBuses:
.LFB170:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$84, %esp
	.cfi_def_cfa_offset 104
	pushl	$0
	.cfi_def_cfa_offset 108
	pushl	$64
	.cfi_def_cfa_offset 112
	call	kmalloc_int
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	movl	%eax, tempPCS
	movl	$0, 28(%esp)
	movl	$0, 12(%esp)
.L831:
	movl	28(%esp), %eax
	xorl	%edi, %edi
	movb	$0, 23(%esp)
	leal	devices(%eax), %ebp
	imull	$896, 12(%esp), %eax
	movl	%eax, 16(%esp)
	.align 16
.L839:
	subl	$4, %esp
	.cfi_def_cfa_offset 100
	imull	$28, %edi, %esi
	addl	20(%esp), %esi
	pushl	%edi
	.cfi_def_cfa_offset 104
	pushl	20(%esp)
	.cfi_def_cfa_offset 108
	leal	44(%esp), %eax
	pushl	%eax
	.cfi_def_cfa_offset 112
	call	checkDevice
	.cfi_def_cfa_offset 108
	movl	44(%esp), %eax
	movl	%eax, devices(%esi)
	movl	48(%esp), %eax
	movl	%eax, devices+4(%esi)
	movl	52(%esp), %eax
	movl	%eax, devices+8(%esi)
	movl	56(%esp), %eax
	movl	%eax, devices+12(%esi)
	movl	60(%esp), %eax
	movl	%eax, devices+16(%esi)
	movl	64(%esp), %eax
	movl	%eax, devices+20(%esi)
	movl	68(%esp), %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 96
	movl	%eax, devices+24(%esi)
	movl	16(%ebp), %eax
	cmpb	$1, 14(%eax)
	je	.L850
	cmpl	$-1, 4(%ebp)
	je	.L833
	movl	16(%ebp), %edx
	cmpb	$-1, 11(%edx)
	je	.L833
	movzwl	(%eax), %ecx
	movzbl	10(%eax), %edx
	movzwl	2(%eax), %esi
	movw	%cx, 24(%esp)
	movzbl	11(%eax), %ecx
	movb	%dl, 27(%esp)
	cmpb	$1, %cl
	movb	%cl, 26(%esp)
	jne	.L834
	cmpb	$6, %dl
	jne	.L834
	imull	$28, TotalAHCIDevices, %ecx
	movl	0(%ebp), %ebx
	leal	AHCI_Devices(%ecx), %edx
	movl	%ebx, AHCI_Devices(%ecx)
	movl	4(%ebp), %ecx
	movl	%eax, 16(%edx)
	movl	20(%ebp), %eax
	movl	%ecx, 4(%edx)
	movl	8(%ebp), %ecx
	movl	%eax, 20(%edx)
	movl	24(%ebp), %eax
	movl	%ecx, 8(%edx)
	movl	12(%ebp), %ecx
	movl	%eax, 24(%edx)
	movl	TotalAHCIDevices, %eax
	movl	%ecx, 12(%edx)
	addl	$1, %eax
	movl	%eax, TotalAHCIDevices
.L834:
	cmpb	$0, 23(%esp)
	je	.L851
.L835:
	subl	$12, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC9462
	.cfi_def_cfa_offset 112
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	movl	$PciDevTable, %eax
	xorl	%edx, %edx
	movzwl	24(%esp), %ebx
	jmp	.L838
	.align 16
.L836:
	addl	$1, %edx
	addl	$12, %eax
	cmpl	$5335, %edx
	je	.L852
.L838:
	cmpw	(%eax), %bx
	jne	.L836
	cmpw	2(%eax), %si
	jne	.L836
	leal	(%edx,%edx,2), %eax
	movl	PciDevTable+8(,%eax,4), %eax
.L837:
	subl	$12, %esp
	.cfi_def_cfa_offset 108
	pushl	%eax
	.cfi_def_cfa_offset 112
	call	printf
	movl	$.LC9463, (%esp)
	call	printf
	movzbl	42(%esp), %eax
	movl	%eax, (%esp)
	call	console_write_dec
	movl	$.LC9464, (%esp)
	call	printf
	movzbl	43(%esp), %eax
	movl	%eax, (%esp)
	call	console_write_dec
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	movb	$1, 23(%esp)
.L833:
	addl	$1, %edi
	addl	$28, %ebp
	cmpl	$32, %edi
	jne	.L839
	addl	$1, 12(%esp)
	addl	$896, 28(%esp)
	movl	12(%esp), %eax
	cmpl	$255, %eax
	jne	.L831
	subl	$12, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC9465
	.cfi_def_cfa_offset 112
	call	printf
	addl	$92, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L852:
	.cfi_def_cfa_offset 96
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movl	$.LC42, %eax
	jmp	.L837
.L850:
	subl	$12, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC9460
	.cfi_def_cfa_offset 112
	call	printf
	popl	%edx
	.cfi_def_cfa_offset 108
	popl	%ecx
	.cfi_def_cfa_offset 104
	pushl	%edi
	.cfi_def_cfa_offset 108
	pushl	24(%esp)
	.cfi_def_cfa_offset 112
	call	checkSecBus
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	jmp	.L833
.L851:
	subl	$12, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC9461
	.cfi_def_cfa_offset 112
	call	printf
	popl	%eax
	.cfi_def_cfa_offset 108
	pushl	24(%esp)
	.cfi_def_cfa_offset 112
	call	console_write_dec
	movl	$.LC9437, (%esp)
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	jmp	.L835
	.cfi_endproc
.LFE170:
	.size	checkAllBuses, .-checkAllBuses
	.align 16
	.globl	PciGetBar_1
	.type	PciGetBar_1, @function
PciGetBar_1:
.LFB171:
	.cfi_startproc
	movl	12(%esp), %edx
	testl	%edx, %edx
	je	.L861
	cmpl	$1, %edx
	je	.L862
	cmpl	$2, %edx
	je	.L863
	cmpl	$3, %edx
	je	.L864
	cmpl	$4, %edx
	je	.L865
	cmpl	$5, %edx
	movl	$-1, %eax
	je	.L866
	rep ret
	.align 16
.L861:
	imull	$28, 8(%esp), %edx
	imull	$896, 4(%esp), %eax
	movl	devices+16(%edx,%eax), %eax
	movl	16(%eax), %eax
	ret
	.align 16
.L862:
	imull	$28, 8(%esp), %edx
	imull	$896, 4(%esp), %eax
	movl	devices+16(%edx,%eax), %eax
	movl	20(%eax), %eax
	ret
	.align 16
.L863:
	imull	$28, 8(%esp), %edx
	imull	$896, 4(%esp), %eax
	movl	devices+16(%edx,%eax), %eax
	movl	24(%eax), %eax
	ret
	.align 16
.L864:
	imull	$28, 8(%esp), %edx
	imull	$896, 4(%esp), %eax
	movl	devices+16(%edx,%eax), %eax
	movl	28(%eax), %eax
	ret
	.align 16
.L865:
	imull	$28, 8(%esp), %edx
	imull	$896, 4(%esp), %eax
	movl	devices+16(%edx,%eax), %eax
	movl	32(%eax), %eax
	ret
	.align 16
.L866:
	imull	$28, 8(%esp), %edx
	imull	$896, 4(%esp), %eax
	movl	devices+16(%edx,%eax), %eax
	movl	36(%eax), %eax
	ret
	.cfi_endproc
.LFE171:
	.size	PciGetBar_1, .-PciGetBar_1
	.align 16
	.globl	PciGetBar_2
	.type	PciGetBar_2, @function
PciGetBar_2:
.LFB172:
	.cfi_startproc
	movl	8(%esp), %edx
	testl	%edx, %edx
	je	.L875
	cmpl	$1, %edx
	je	.L876
	cmpl	$2, %edx
	je	.L877
	cmpl	$3, %edx
	je	.L878
	cmpl	$4, %edx
	je	.L879
	cmpl	$5, %edx
	movl	$-1, %eax
	je	.L880
	rep ret
	.align 16
.L875:
	movl	4(%esp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	ret
	.align 16
.L876:
	movl	4(%esp), %eax
	movl	16(%eax), %eax
	movl	20(%eax), %eax
	ret
	.align 16
.L877:
	movl	4(%esp), %eax
	movl	16(%eax), %eax
	movl	24(%eax), %eax
	ret
	.align 16
.L878:
	movl	4(%esp), %eax
	movl	16(%eax), %eax
	movl	28(%eax), %eax
	ret
	.align 16
.L879:
	movl	4(%esp), %eax
	movl	16(%eax), %eax
	movl	32(%eax), %eax
	ret
	.align 16
.L880:
	movl	4(%esp), %eax
	movl	16(%eax), %eax
	movl	36(%eax), %eax
	ret
	.cfi_endproc
.LFE172:
	.size	PciGetBar_2, .-PciGetBar_2
	.comm	test1,4,4
	.comm	disks,4,4
	.comm	controllers,4,4
	.comm	bus,4,4
	.comm	device,4,4
	.comm	func,4,4
	.comm	abar,4,4
	.comm	AHCI,1,1
	.align 16
	.globl	get_device_info
	.type	get_device_info, @function
get_device_info:
.LFB173:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$4098, %edx
	movzwl	8(%esp), %ecx
	movzwl	12(%esp), %ebx
	movl	$kSupportedDevices, %eax
	jmp	.L884
	.align 16
.L882:
	addl	$8, %eax
	movzwl	(%eax), %edx
	testw	%dx, %dx
	je	.L887
.L884:
	cmpw	%dx, %cx
	jne	.L882
	cmpw	%bx, 2(%eax)
	jne	.L882
	movl	4(%eax), %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L887:
	.cfi_restore_state
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE173:
	.size	get_device_info, .-get_device_info
	.globl	ahci_found
	.section	.bss
	.type	ahci_found, @object
	.size	ahci_found, 1
ahci_found:
	.zero	1
	.globl	data_base
	.align 4
	.type	data_base, @object
	.size	data_base, 4
data_base:
	.zero	4
	.section	.rodata
.LC9466:
	.string	"\nAHCI disk sent an intterupt\n"
	.text
	.align 16
	.globl	ahci_handler
	.type	ahci_handler, @function
ahci_handler:
.LFB174:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9466
	.cfi_def_cfa_offset 32
	call	printf
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE174:
	.size	ahci_handler, .-ahci_handler
	.section	.rodata
.LC9467:
	.string	"\n\tAHCI CONTROLLER #"
	.align 4
.LC9468:
	.string	" FOUND, INITIALIZING AHCI CONTROLLER and Disks"
	.align 4
.LC9469:
	.string	"\n\tAHCI CONTROLLER Initialized\n"
	.text
	.align 16
	.globl	checkAHCI
	.type	checkAHCI, @function
checkAHCI:
.LFB175:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	$0
	.cfi_def_cfa_offset 28
	pushl	$4096
	.cfi_def_cfa_offset 32
	call	kmalloc_int
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%ebx
	.cfi_def_cfa_offset 24
	pushl	$0
	.cfi_def_cfa_offset 28
	pushl	$4096
	.cfi_def_cfa_offset 32
	movl	%eax, ahci
	movl	%eax, ahci_start
	call	kmalloc_int
	popl	%esi
	.cfi_def_cfa_offset 28
	popl	%edi
	.cfi_def_cfa_offset 24
	pushl	$0
	.cfi_def_cfa_offset 28
	pushl	$1048576
	.cfi_def_cfa_offset 32
	movl	%eax, Disk_dev
	movl	%eax, Disk_dev_start
	call	kmalloc_int
	movl	%eax, AHCI_BASE
	movl	TotalAHCIDevices, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L896
	movl	controllers, %edx
	movl	ahci, %eax
	movl	$AHCI_Devices, %ebx
	xorl	%esi, %esi
	.align 16
.L895:
	addl	$1, %edx
	movl	%edx, controllers
	movl	%ebx, (%eax)
	movl	$4098, %edx
	movl	16(%ebx), %eax
	movzwl	2(%eax), %edi
	movzwl	(%eax), %ecx
	movl	$kSupportedDevices, %eax
	jmp	.L894
	.align 16
.L892:
	addl	$8, %eax
	movzwl	(%eax), %edx
	testw	%dx, %dx
	je	.L901
.L894:
	cmpw	%dx, %cx
	jne	.L892
	cmpw	2(%eax), %di
	jne	.L892
	movl	4(%eax), %eax
.L893:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	addl	$1, %esi
	addl	$28, %ebx
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	printf
	movl	$.LC9467, (%esp)
	call	printf
	popl	%eax
	.cfi_def_cfa_offset 28
	pushl	controllers
	.cfi_def_cfa_offset 32
	call	console_write_dec
	movl	$.LC9468, (%esp)
	call	printf
	popl	%edx
	.cfi_def_cfa_offset 28
	pushl	ahci
	.cfi_def_cfa_offset 32
	call	probe_port
	movl	$.LC9469, (%esp)
	call	printf
	movl	ahci, %eax
	movl	controllers, %edx
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movb	$1, ahci_found
	movw	%dx, 4(%eax)
	addl	$520, %eax
	cmpl	%esi, TotalAHCIDevices
	movl	%eax, ahci
	ja	.L895
.L896:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9437
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	controllers, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L901:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L893
	.cfi_endproc
.LFE175:
	.size	checkAHCI, .-checkAHCI
	.comm	satatest,4,4
	.section	.rodata
	.align 4
.LC9470:
	.string	"\n\t The Data we Recieved from identity command:\n\t"
	.align 4
.LC9471:
	.string	"\n\t\tSerial Number: %s \n\t\tModel Number: %s\n\t\tFirmware: %s\n"
.LC9472:
	.string	"\t\tTotal Logical Sectors: %x "
	.align 4
.LC9473:
	.string	"  Heads: %x Sectors: %x Cyclinders: %x Bytes per sectors: %x Bytes per track: %x"
	.text
	.align 16
	.globl	IDENTIFYdrive
	.type	IDENTIFYdrive, @function
IDENTIFYdrive:
.LFB176:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	movl	24(%esp), %ebx
	pushl	$0
	.cfi_def_cfa_offset 28
	pushl	$512
	.cfi_def_cfa_offset 32
	call	kmalloc_int
	movl	%eax, 8(%ebx)
	movl	$0, (%esp)
	pushl	$0
	.cfi_def_cfa_offset 36
	pushl	$0
	.cfi_def_cfa_offset 40
	pushl	$512
	.cfi_def_cfa_offset 44
	pushl	$1
	.cfi_def_cfa_offset 48
	pushl	%eax
	.cfi_def_cfa_offset 52
	pushl	$0
	.cfi_def_cfa_offset 56
	pushl	$236
	.cfi_def_cfa_offset 60
	pushl	4(%ebx)
	.cfi_def_cfa_offset 64
	call	SATA_Commander
	movl	8(%ebx), %ebx
	addl	$36, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9470
	.cfi_def_cfa_offset 32
	call	printf
	leal	46(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 36
	leal	54(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 40
	leal	20(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	$.LC9471
	.cfi_def_cfa_offset 48
	call	printf
	addl	$24, %esp
	.cfi_def_cfa_offset 24
	pushl	120(%ebx)
	.cfi_def_cfa_offset 28
	pushl	$.LC9472
	.cfi_def_cfa_offset 32
	call	printf
	popl	%eax
	.cfi_def_cfa_offset 28
	movzwl	8(%ebx), %eax
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	%eax
	.cfi_def_cfa_offset 28
	movzwl	10(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	movzwl	2(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 36
	movzwl	12(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 40
	movzwl	6(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	$.LC9473
	.cfi_def_cfa_offset 48
	call	printf
	addl	$40, %esp
	.cfi_def_cfa_offset 8
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE176:
	.size	IDENTIFYdrive, .-IDENTIFYdrive
	.section	.rodata
.LC9474:
	.string	"\n\t\tSATAPI drive found \n"
.LC9475:
	.string	"\n\t\tSEMB drive found \n"
.LC9476:
	.string	"\n\t\tPM drive found \n"
	.align 4
.LC9477:
	.string	"\n\t\tNo Drives Recognized on this controller\n"
	.align 4
.LC9478:
	.string	"\n\n\t\tSata Disk #%x at port %x Found!\n"
	.text
	.align 16
	.globl	probe_port
	.type	probe_port, @function
probe_port:
.LFB177:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	xorl	%ebx, %ebx
	subl	$36, %esp
	.cfi_def_cfa_offset 56
	movl	56(%esp), %eax
	movl	%eax, 12(%esp)
	pushl	$0
	.cfi_def_cfa_offset 60
	movl	%eax, %edi
	pushl	$4096
	.cfi_def_cfa_offset 64
	call	kmalloc_int
	movl	%eax, Disk_dev
	movl	(%edi), %eax
	movl	16(%eax), %eax
	movl	36(%eax), %eax
	movl	%eax, abar
	movl	12(%eax), %esi
	movl	%edi, %eax
	addl	$8, %eax
	movl	%eax, 28(%esp)
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	%eax, %ebp
	movl	$0, 8(%esp)
	jmp	.L910
	.align 16
.L905:
	addl	$1, %ebx
	shrl	%esi
	addl	$16, %ebp
	cmpl	$32, %ebx
	je	.L928
.L910:
	testl	$1, %esi
	je	.L905
	movl	abar, %eax
	leal	2(%ebx), %edi
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	sall	$7, %edi
	addl	%edi, %eax
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	check_type
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	testl	%eax, %eax
	je	.L905
	movl	abar, %ecx
	movl	%ebx, %edx
	sall	$7, %edx
	addl	%ecx, %edx
	movl	%ecx, (%esp)
	movl	280(%edx), %ecx
	andl	$1, %ecx
	jne	.L906
	movl	280(%edx), %ecx
	orl	$1, %ecx
	movl	%ecx, 280(%edx)
.L906:
	cmpl	$1, %eax
	jne	.L907
	movl	sata, %ecx
	addl	(%esp), %edi
	shrl	%esi
	movb	$1, AHCI
	addl	$16, %ebp
	movl	%ecx, %edx
	addl	$1, %ecx
	sall	$4, %edx
	addl	Disk_dev, %edx
	movl	$1, (%edx)
	movl	%edi, 4(%edx)
	movl	$1, -16(%ebp)
	movl	4(%edx), %edi
	movl	%edi, -12(%ebp)
	movl	8(%edx), %edi
	movl	%edi, -8(%ebp)
	movl	12(%edx), %edx
	movl	4(%esp), %edi
	movl	%edx, -4(%ebp)
	movl	disks, %edx
	movl	%ecx, sata
	movl	%ebx, %ecx
	addl	$1, %ebx
	sall	%cl, %eax
	orl	%eax, 8(%esp)
	movw	%dx, 6(%edi)
	addl	$1, %edx
	cmpl	$32, %ebx
	movl	%edx, disks
	jne	.L910
	.align 16
.L928:
	xorl	%ebx, %ebx
	cmpb	$0, AHCI
	movl	$1, %eax
	movl	$1, %edi
	je	.L929
	movl	8(%esp), %ebp
	movl	12(%esp), %esi
	jmp	.L920
	.align 16
.L912:
	addl	$1, %ebx
	addl	$16, %esi
	cmpl	$32, %ebx
	je	.L930
.L920:
	movl	%edi, %edx
	movl	%ebx, %ecx
	sall	%cl, %edx
	testl	%ebp, %edx
	je	.L912
	leal	1(%eax), %ecx
	subl	$4, %esp
	.cfi_def_cfa_offset 52
	movl	%ecx, 4(%esp)
	pushl	%ebx
	.cfi_def_cfa_offset 56
	pushl	%eax
	.cfi_def_cfa_offset 60
	pushl	$.LC9478
	.cfi_def_cfa_offset 64
	call	printf
	popl	%eax
	.cfi_def_cfa_offset 60
	leal	2(%ebx), %eax
	popl	%edx
	.cfi_def_cfa_offset 56
	sall	$7, %eax
	addl	abar, %eax
	pushl	%ebx
	.cfi_def_cfa_offset 60
	addl	$1, %ebx
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	port_rebase
	movl	%esi, (%esp)
	addl	$16, %esi
	call	IDENTIFYdrive
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	$32, %ebx
	movl	(%esp), %eax
	jne	.L920
.L930:
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L907:
	.cfi_restore_state
	cmpl	$4, %eax
	je	.L931
	cmpl	$2, %eax
	jne	.L909
	addl	(%esp), %edi
	movl	Disk_dev, %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movb	$1, AHCI
	movl	$3, (%eax)
	addl	$16, %eax
	movl	%edi, -12(%eax)
	movl	$3, 0(%ebp)
	movl	-12(%eax), %edx
	movl	16(%esp), %edi
	movl	%edx, 4(%ebp)
	movl	-8(%eax), %edx
	movl	%edx, 8(%ebp)
	movl	-4(%eax), %edx
	movl	%edx, 12(%ebp)
	movl	disks, %edx
	movl	%eax, Disk_dev
	movw	%dx, 6(%edi)
	pushl	$.LC9475
	.cfi_def_cfa_offset 64
	addl	$1, %edx
	movl	%edx, disks
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L905
	.align 16
.L931:
	addl	(%esp), %edi
	movl	Disk_dev, %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movb	$1, AHCI
	movl	$2, (%eax)
	addl	$16, %eax
	movl	%edi, -12(%eax)
	movl	$2, 0(%ebp)
	movl	-12(%eax), %edx
	movl	16(%esp), %edi
	movl	%edx, 4(%ebp)
	movl	-8(%eax), %edx
	movl	%edx, 8(%ebp)
	movl	-4(%eax), %edx
	movl	%edx, 12(%ebp)
	movl	disks, %edx
	movl	%eax, Disk_dev
	movw	%dx, 6(%edi)
	pushl	$.LC9474
	.cfi_def_cfa_offset 64
	addl	$1, %edx
	movl	%edx, disks
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L905
	.align 16
.L909:
	cmpl	$3, %eax
	jne	.L905
	addl	(%esp), %edi
	movl	Disk_dev, %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movb	$1, AHCI
	movl	$4, (%eax)
	addl	$16, %eax
	movl	%edi, -12(%eax)
	movl	$4, 0(%ebp)
	movl	-12(%eax), %edx
	movl	16(%esp), %edi
	movl	%edx, 4(%ebp)
	movl	-8(%eax), %edx
	movl	%edx, 8(%ebp)
	movl	-4(%eax), %edx
	movl	%edx, 12(%ebp)
	movl	disks, %edx
	movl	%eax, Disk_dev
	movw	%dx, 6(%edi)
	pushl	$.LC9476
	.cfi_def_cfa_offset 64
	addl	$1, %edx
	movl	%edx, disks
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L905
.L929:
	movl	$.LC9477, 48(%esp)
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	jmp	printf
	.cfi_endproc
.LFE177:
	.size	probe_port, .-probe_port
	.align 16
	.globl	check_type
	.type	check_type, @function
check_type:
.LFB178:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %edx
	movl	52(%edx), %ecx
	movl	40(%edx), %eax
	movl	%eax, %ebx
	andl	$15, %ebx
	cmpb	$3, %bl
	setne	%bl
	testl	%ecx, %ecx
	sete	%cl
	orb	%cl, %bl
	jne	.L937
	shrl	$8, %eax
	andl	$15, %eax
	cmpb	$1, %al
	jne	.L937
	movl	36(%edx), %edx
	movl	$2, %eax
	cmpl	$-1019477759, %edx
	je	.L932
	cmpl	$-351010559, %edx
	movl	$4, %eax
	je	.L932
	xorl	%eax, %eax
	cmpl	$-1771503359, %edx
	sete	%al
	leal	1(%eax,%eax), %eax
.L932:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L937:
	.cfi_restore_state
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE178:
	.size	check_type, .-check_type
	.align 16
	.globl	port_rebase
	.type	port_rebase, @function
port_rebase:
.LFB179:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	abar, %eax
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	movl	20(%esp), %esi
	movl	$-2147483648, 4(%eax)
	movl	$1, 4(%eax)
	movl	$-2147483648, 4(%eax)
	movl	$2, 4(%eax)
	movl	24(%esi), %eax
	movl	24(%esp), %edi
	andl	$-2, %eax
	movl	%eax, 24(%esi)
	movl	24(%esi), %eax
	andl	$-17, %eax
	movl	%eax, 24(%esi)
.L943:
	movl	24(%esi), %eax
	testb	$64, %ah
	jne	.L943
	movl	24(%esi), %ebx
	andl	$32768, %ebx
	jne	.L943
	movl	24(%esi), %eax
	andl	$-17, %eax
	movl	%eax, 24(%esi)
	movl	24(%esi), %eax
	andb	$127, %ah
	movl	%eax, 24(%esi)
	movl	24(%esi), %eax
	andb	$191, %ah
	movl	%eax, 24(%esi)
	movl	24(%esi), %eax
	andl	$-2, %eax
	movl	%eax, 24(%esi)
	movl	24(%esi), %eax
	andl	$-9, %eax
	movl	%eax, 24(%esi)
	movl	%edi, %eax
	movl	$65535, 48(%esi)
	sall	$10, %eax
	addl	AHCI_BASE, %eax
	movl	$0, 16(%esi)
	movl	%eax, (%esi)
	movl	$0, 4(%esi)
	movl	(%esi), %eax
	leal	1024(%eax), %edx
	.align 16
.L945:
	addl	$1, %eax
	movb	$0, -1(%eax)
	cmpl	%edx, %eax
	jne	.L945
	movl	AHCI_BASE, %edx
	movl	%edi, %eax
	sall	$8, %eax
	leal	32768(%edx,%eax), %eax
	movl	%eax, 8(%esi)
	movl	$0, 12(%esi)
	movl	8(%esi), %eax
	leal	256(%eax), %edx
	.align 16
.L946:
	addl	$1, %eax
	movb	$0, -1(%eax)
	cmpl	%edx, %eax
	jne	.L946
	movl	(%esi), %ebp
	sall	$13, %edi
	leal	2(%ebp), %ecx
	addl	$1026, %ebp
	.align 16
.L948:
	movl	$8, %eax
	movw	%ax, (%ecx)
	movl	AHCI_BASE, %eax
	movl	$0, 10(%ecx)
	leal	40960(%edi,%eax), %eax
	addl	%ebx, %eax
	leal	256(%eax), %edx
	movl	%eax, 6(%ecx)
	.align 16
.L947:
	addl	$1, %eax
	movb	$0, -1(%eax)
	cmpl	%eax, %edx
	jne	.L947
	addl	$32, %ecx
	addl	$256, %ebx
	cmpl	%ebp, %ecx
	jne	.L948
	movl	24(%esi), %eax
	orl	$16, %eax
	movl	%eax, 24(%esi)
	movl	24(%esi), %eax
	orl	$1, %eax
	movl	%eax, 24(%esi)
	movl	$0, 16(%esi)
	movl	$0, 20(%esi)
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE179:
	.size	port_rebase, .-port_rebase
	.align 16
	.globl	start_cmd
	.type	start_cmd, @function
start_cmd:
.LFB180:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	24(%eax), %edx
	orl	$16, %edx
	movl	%edx, 24(%eax)
	movl	24(%eax), %edx
	orl	$1, %edx
	movl	%edx, 24(%eax)
	ret
	.cfi_endproc
.LFE180:
	.size	start_cmd, .-start_cmd
	.align 16
	.globl	stop_cmd
	.type	stop_cmd, @function
stop_cmd:
.LFB181:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	24(%eax), %edx
	andl	$-2, %edx
	movl	%edx, 24(%eax)
	movl	24(%eax), %edx
	andl	$-17, %edx
	movl	%edx, 24(%eax)
	.align 16
.L958:
	movl	24(%eax), %edx
	andb	$64, %dh
	jne	.L958
	movl	24(%eax), %edx
	andb	$128, %dh
	jne	.L958
	movl	24(%eax), %edx
	andl	$-17, %edx
	movl	%edx, 24(%eax)
	ret
	.cfi_endproc
.LFE181:
	.size	stop_cmd, .-stop_cmd
	.section	.rodata
.LC9479:
	.string	"Read disk error\n"
	.text
	.align 16
	.globl	read
	.type	read, @function
read:
.LFB182:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	movl	40(%esp), %eax
	movl	28(%esp), %ebx
	movl	%eax, %edx
	pushl	%eax
	.cfi_def_cfa_offset 32
	subl	$1, %eax
	shrl	$4, %eax
	sall	$9, %edx
	pushl	40(%esp)
	.cfi_def_cfa_offset 36
	movzwl	%ax, %eax
	pushl	40(%esp)
	.cfi_def_cfa_offset 40
	pushl	%edx
	.cfi_def_cfa_offset 44
	addl	$1, %eax
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	64(%esp)
	.cfi_def_cfa_offset 52
	pushl	$0
	.cfi_def_cfa_offset 56
	pushl	$32
	.cfi_def_cfa_offset 60
	pushl	%ebx
	.cfi_def_cfa_offset 64
	call	SATA_Commander
	movl	16(%ebx), %edx
	addl	$48, %esp
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	andl	$1073741824, %edx
	je	.L962
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9479
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
.L962:
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE182:
	.size	read, .-read
	.section	.rodata
.LC9480:
	.string	"Write disk error\n"
	.text
	.align 16
	.globl	write
	.type	write, @function
write:
.LFB183:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	movl	40(%esp), %eax
	movl	28(%esp), %ebx
	movl	%eax, %edx
	pushl	%eax
	.cfi_def_cfa_offset 32
	subl	$1, %eax
	shrl	$4, %eax
	sall	$9, %edx
	pushl	40(%esp)
	.cfi_def_cfa_offset 36
	movzwl	%ax, %eax
	pushl	40(%esp)
	.cfi_def_cfa_offset 40
	pushl	%edx
	.cfi_def_cfa_offset 44
	addl	$1, %eax
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	64(%esp)
	.cfi_def_cfa_offset 52
	pushl	$1
	.cfi_def_cfa_offset 56
	pushl	$48
	.cfi_def_cfa_offset 60
	pushl	%ebx
	.cfi_def_cfa_offset 64
	call	SATA_Commander
	movl	16(%ebx), %edx
	addl	$48, %esp
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	andl	$1073741824, %edx
	je	.L968
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9480
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
.L968:
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE183:
	.size	write, .-write
	.align 16
	.globl	sec_read_static
	.type	sec_read_static, @function
sec_read_static:
.LFB184:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	movl	40(%esp), %eax
	movl	28(%esp), %ebx
	movl	%eax, %edx
	pushl	%eax
	.cfi_def_cfa_offset 32
	subl	$1, %eax
	shrl	$4, %eax
	sall	$9, %edx
	pushl	40(%esp)
	.cfi_def_cfa_offset 36
	movzwl	%ax, %eax
	pushl	40(%esp)
	.cfi_def_cfa_offset 40
	pushl	%edx
	.cfi_def_cfa_offset 44
	addl	$1, %eax
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	64(%esp)
	.cfi_def_cfa_offset 52
	pushl	$0
	.cfi_def_cfa_offset 56
	pushl	$32
	.cfi_def_cfa_offset 60
	pushl	%ebx
	.cfi_def_cfa_offset 64
	call	SATA_Commander
	movl	16(%ebx), %edx
	addl	$48, %esp
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	andl	$1073741824, %edx
	je	.L974
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9479
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
.L974:
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE184:
	.size	sec_read_static, .-sec_read_static
	.align 16
	.globl	sec_write_static
	.type	sec_write_static, @function
sec_write_static:
.LFB185:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	movl	40(%esp), %eax
	movl	28(%esp), %ebx
	movl	%eax, %edx
	pushl	%eax
	.cfi_def_cfa_offset 32
	subl	$1, %eax
	shrl	$4, %eax
	sall	$9, %edx
	pushl	40(%esp)
	.cfi_def_cfa_offset 36
	movzwl	%ax, %eax
	pushl	40(%esp)
	.cfi_def_cfa_offset 40
	pushl	%edx
	.cfi_def_cfa_offset 44
	addl	$1, %eax
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	64(%esp)
	.cfi_def_cfa_offset 52
	pushl	$1
	.cfi_def_cfa_offset 56
	pushl	$48
	.cfi_def_cfa_offset 60
	pushl	%ebx
	.cfi_def_cfa_offset 64
	call	SATA_Commander
	movl	16(%ebx), %edx
	addl	$48, %esp
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	andl	$1073741824, %edx
	je	.L980
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9480
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
.L980:
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE185:
	.size	sec_write_static, .-sec_write_static
	.align 16
	.globl	SATA_Commander
	.type	SATA_Commander, @function
SATA_Commander:
.LFB186:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$40, %esp
	.cfi_def_cfa_offset 60
	movl	64(%esp), %eax
	movl	68(%esp), %ebx
	movl	%eax, 24(%esp)
	movl	60(%esp), %eax
	andl	$1, %ebx
	sall	$6, %ebx
	orl	$-123, %ebx
	movl	(%eax), %esi
	pushl	60(%esp)
	.cfi_def_cfa_offset 64
	call	find_cmdslot
	sall	$5, %eax
	addl	%eax, %esi
	movzwl	80(%esp), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	64(%esp), %ebp
	orb	$4, 1(%esi)
	movb	%bl, (%esi)
	movl	8(%esi), %edi
	subl	$1, %ebp
	movw	%ax, 2(%esi)
	je	.L987
	movl	60(%esp), %esi
	leal	128(%edi), %ebx
	xorl	%ecx, %ecx
	.align 16
.L988:
	leal	8(%ecx), %edx
	movl	%esi, (%ebx)
	movl	$0, 4(%ebx)
	addl	$1, %ecx
	addl	$4096, %esi
	addl	$16, %ebx
	sall	$4, %edx
	addl	%edi, %edx
	movl	12(%edx), %eax
	andl	$-4194304, %eax
	orb	$32, %ah
	movl	%eax, 12(%edx)
	shrl	$24, %eax
	andl	$127, %eax
	cmpl	%ebp, %ecx
	movb	%al, 15(%edx)
	jne	.L988
	movl	64(%esp), %eax
	movl	60(%esp), %esi
	addl	$1048574, %eax
	sall	$12, %eax
	leal	4096(%esi,%eax), %eax
	movl	%eax, 60(%esp)
.L987:
	movl	60(%esp), %esi
	movl	%ebp, %eax
	addl	$8, %ebp
	sall	$4, %eax
	sall	$4, %ebp
	movl	68(%esp), %ecx
	addl	%edi, %eax
	movl	%esi, 128(%eax)
	movl	$0, 132(%eax)
	leal	(%edi,%ebp), %eax
	andl	$4194303, %ecx
	movl	12(%eax), %edx
	andl	$-4194304, %edx
	orl	%ecx, %edx
	movl	%edx, 12(%eax)
	shrl	$24, %edx
	andl	$127, %edx
	movb	%dl, 15(%eax)
	leal	20(%edi), %edx
	movl	%edi, %eax
	.align 16
.L989:
	addl	$1, %eax
	movb	$0, -1(%eax)
	cmpl	%edx, %eax
	jne	.L989
	movzbl	12(%esp), %eax
	movb	$39, (%edi)
	orb	$-128, 1(%edi)
	movb	$64, 7(%edi)
	movb	%al, 2(%edi)
	movzbl	72(%esp), %eax
	movb	%al, 4(%edi)
	movl	72(%esp), %eax
	shrl	$8, %eax
	movb	%al, 5(%edi)
	movl	72(%esp), %eax
	shrl	$16, %eax
	movb	%al, 6(%edi)
	movl	72(%esp), %eax
	shrl	$24, %eax
	movb	%al, 8(%edi)
	movzbl	76(%esp), %eax
	movb	%al, 9(%edi)
	movl	76(%esp), %eax
	shrl	$8, %eax
	movb	%al, 10(%edi)
	movzbl	80(%esp), %eax
	movb	%al, 12(%edi)
	movl	80(%esp), %eax
	shrl	$8, %eax
	movb	%al, 13(%edi)
	movl	48(%esp), %eax
	movl	$1, 56(%eax)
	movl	%eax, %edx
	.align 16
.L990:
	movl	56(%edx), %eax
	testl	%eax, %eax
	jne	.L990
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE186:
	.size	SATA_Commander, .-SATA_Commander
	.section	.rodata
	.align 4
.LC9481:
	.string	"Cannot find free command list entry\n"
	.text
	.align 16
	.globl	find_cmdslot
	.type	find_cmdslot, @function
find_cmdslot:
.LFB187:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	52(%eax), %edx
	movl	56(%eax), %eax
	orl	%eax, %edx
	movl	abar, %eax
	movl	(%eax), %ecx
	shrl	$8, %ecx
	andl	$15, %ecx
	je	.L999
	xorl	%eax, %eax
	testb	$1, %dl
	jne	.L1002
	jmp	.L998
	.align 16
.L1003:
	testb	$1, %dl
	je	.L998
.L1002:
	addl	$1, %eax
	shrl	%edx
	cmpl	%eax, %ecx
	jne	.L1003
.L999:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9481
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$-1, %eax
.L998:
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE187:
	.size	find_cmdslot, .-find_cmdslot
	.align 16
	.globl	line
	.type	line, @function
line:
.LFB188:
	.cfi_startproc
	movl	8(%esp), %eax
	imull	4(%esp), %eax
	ret
	.cfi_endproc
.LFE188:
	.size	line, .-line
	.align 16
	.globl	Init
	.type	Init, @function
Init:
.LFB411:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE411:
	.size	Init, .-Init
	.align 16
	.globl	custom_memcpy
	.type	custom_memcpy, @function
custom_memcpy:
.LFB190:
	.cfi_startproc
	subl	$16, %esp
	.cfi_def_cfa_offset 20
	movl	24(%esp), %eax
	movl	%eax, 12(%esp)
	movl	20(%esp), %eax
	movl	%eax, 8(%esp)
	jmp	.L1015
.L1016:
	movl	8(%esp), %eax
	leal	4(%eax), %edx
	movl	%edx, 8(%esp)
	movl	12(%esp), %edx
	leal	4(%edx), %ecx
	movl	%ecx, 12(%esp)
	movl	(%edx), %edx
	movl	%edx, (%eax)
	subl	$1, 28(%esp)
.L1015:
	cmpl	$0, 28(%esp)
	jne	.L1016
	movl	20(%esp), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE190:
	.size	custom_memcpy, .-custom_memcpy
	.align 16
	.globl	RectD
	.type	RectD, @function
RectD:
.LFB195:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$24, %esp
	.cfi_def_cfa_offset 44
	movl	48(%esp), %eax
	addl	56(%esp), %eax
	cmpl	%eax, 48(%esp)
	movl	60(%esp), %esi
	movl	%eax, (%esp)
	jge	.L1032
	movl	depthVESA, %eax
	movl	44(%esp), %ecx
	addl	52(%esp), %ecx
	movl	48(%esp), %ebp
	leal	7(%eax), %ebx
	testl	%eax, %eax
	cmovns	%eax, %ebx
	movl	widthVESA, %eax
	sarl	$3, %ebx
	imull	%ebx, %eax
	movl	%eax, %edx
	movl	%eax, 4(%esp)
	movl	44(%esp), %eax
	imull	48(%esp), %edx
	imull	%ebx, %eax
	addl	%edx, %eax
	addl	buff, %eax
	movl	%eax, %edi
	.align 16
.L1020:
	cmpl	%ecx, 44(%esp)
	jge	.L1022
	movl	44(%esp), %eax
	movl	%edi, %edx
	.align 16
.L1021:
	addl	$1, %eax
	movl	%esi, (%edx)
	addl	%ebx, %edx
	cmpl	%ecx, %eax
	jne	.L1021
.L1022:
	addl	$1, %ebp
	addl	4(%esp), %edi
	cmpl	(%esp), %ebp
	jne	.L1020
.L1019:
	movl	cx0, %edx
	movl	%ecx, %eax
	movl	%edx, 8(%esp)
	movl	8(%esp), %edx
	cmpl	%edx, 44(%esp)
	jl	.L1023
	movl	8(%esp), %edi
	movl	%edi, 44(%esp)
.L1023:
	movl	44(%esp), %edi
	movl	%edi, cx0
	movl	cx1, %edx
	movl	%edx, 12(%esp)
	movl	12(%esp), %edx
	cmpl	%ecx, %edx
	jl	.L1024
	movl	12(%esp), %eax
.L1024:
	movl	%eax, cx1
	movl	cy0, %eax
	movl	%eax, 16(%esp)
	movl	16(%esp), %eax
	cmpl	%eax, 48(%esp)
	jl	.L1025
	movl	16(%esp), %eax
	movl	%eax, 48(%esp)
.L1025:
	movl	48(%esp), %eax
	movl	%eax, cy0
	movl	cy1, %eax
	movl	%eax, 20(%esp)
	movl	20(%esp), %eax
	cmpl	(%esp), %eax
	jl	.L1026
	movl	20(%esp), %eax
	movl	%eax, (%esp)
.L1026:
	movl	(%esp), %eax
	movl	%eax, cy1
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L1032:
	.cfi_restore_state
	movl	44(%esp), %eax
	movl	52(%esp), %edi
	leal	(%eax,%edi), %ecx
	jmp	.L1019
	.cfi_endproc
.LFE195:
	.size	RectD, .-RectD
	.globl	xa
	.section	.bss
	.align 4
	.type	xa, @object
	.size	xa, 4
xa:
	.zero	4
	.globl	xb
	.align 4
	.type	xb, @object
	.size	xb, 4
xb:
	.zero	4
	.globl	buffer
	.data
	.type	buffer, @object
	.size	buffer, 1
buffer:
	.byte	90
	.text
	.align 16
	.globl	memcpy_rep2
	.type	memcpy_rep2, @function
memcpy_rep2:
.LFB196:
	.cfi_startproc
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	movl	4(%esp), %edx
/APP
/  95 "Source/graphics/graphics.c" 1
	mov %eax, %eax;                mov %eax, %edi;                mov %edx, %eax;                mov %eax, %esi;                mov %ecx, %ecx;                cld;                rep movsd;
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE196:
	.size	memcpy_rep2, .-memcpy_rep2
	.align 16
	.globl	DBuff
	.type	DBuff, @function
DBuff:
.LFB197:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$40, %esp
	.cfi_def_cfa_offset 48
	movl	$393216, 16(%esp)
	movl	buff, %eax
	movl	%eax, 28(%esp)
	movl	vga_mem, %eax
	movl	%eax, 24(%esp)
	movl	mouse_buff, %eax
	movl	%eax, 12(%esp)
	movl	$0, 8(%esp)
	movl	depthVESA, %eax
	leal	7(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	Enable_SSE
.L1037:
/APP
/  116 "Source/graphics/graphics.c" 1
	cli
/  0 "" 2
/NO_APP
	movl	cx0, %eax
	imull	4(%esp), %eax
	movl	%eax, %edx
	movl	cy0, %eax
	imull	4(%esp), %eax
	movl	widthVESA, %ecx
	imull	%ecx, %eax
	addl	%edx, %eax
	shrl	$2, %eax
	movl	%eax, 8(%esp)
	movl	cx0, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, cx0
	movl	cx1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, cx1
	movl	buff, %eax
	movl	8(%esp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	%eax, 28(%esp)
	movl	vga_mem, %eax
	movl	8(%esp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	%eax, 24(%esp)
	movl	cy1, %edx
	movl	cy0, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 20(%esp)
	jmp	.L1035
.L1036:
	movl	cx1, %edx
	movl	cx0, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	24(%esp), %eax
	movl	28(%esp), %edx
	movl	%edx, %ebx
/APP
/  155 "Source/graphics/graphics.c" 1
	mov %eax, %edi;                    mov %ebx, %esi;                    rep movsd;
/  0 "" 2
/NO_APP
	addl	$2048, 24(%esp)
	addl	$2048, 28(%esp)
	subl	$1, 20(%esp)
.L1035:
	cmpl	$0, 20(%esp)
	jne	.L1036
	movl	$512, cx0
	movl	$512, cx1
	movl	$384, cy0
	movl	$384, cy1
/APP
/  167 "Source/graphics/graphics.c" 1
	int $50
/  0 "" 2
/NO_APP
	jmp	.L1037
	.cfi_endproc
.LFE197:
	.size	DBuff, .-DBuff
	.align 16
	.globl	RectL
	.type	RectL, @function
RectL:
.LFB198:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$48, %esp
	.cfi_def_cfa_offset 68
	movl	72(%esp), %eax
	movl	80(%esp), %ebx
	movl	76(%esp), %esi
	movl	84(%esp), %edi
	addl	%eax, %ebx
	cmpl	%ebx, %eax
	movl	%ebx, 16(%esp)
	jge	.L1038
	movl	depthVESA, %ecx
	movl	68(%esp), %ebx
	leal	7(%ecx), %edx
	addl	%esi, %ebx
	testl	%ecx, %ecx
	movl	%ebx, (%esp)
	movl	widthVESA, %ebx
	cmovns	%ecx, %edx
	movl	vesa_buff, %ecx
	sarl	$3, %edx
	movl	%edx, 4(%esp)
	movl	%ecx, 28(%esp)
	leal	-1(%esi), %ecx
	movl	4(%esp), %esi
	imull	%edx, %ebx
	movl	offset, %edx
	imull	%esi, %ecx
	movl	%ebx, %ebp
	movl	%ebx, 20(%esp)
	leal	1(%eax), %ebx
	movl	%ecx, 24(%esp)
	movl	68(%esp), %ecx
	imull	%ebp, %eax
	addl	24(%esp), %eax
	imull	%esi, %ecx
	addl	%ecx, %eax
	movl	%eax, 8(%esp)
	xorl	%eax, %eax
	.align 16
.L1040:
	movl	(%esp), %esi
	cmpl	68(%esp), %esi
	movl	%ebx, 12(%esp)
	jle	.L1048
	movl	8(%esp), %ecx
	subl	24(%esp), %ecx
	leal	-2(%ebx), %esi
	addl	28(%esp), %ecx
	movl	68(%esp), %eax
	.align 16
.L1045:
	movl	cx0, %ebp
	addl	$1, %eax
	movl	%edi, (%ecx)
	leal	-2(%eax), %edx
	movl	%ebp, 32(%esp)
	movl	32(%esp), %ebp
	cmpl	%edx, %ebp
	jg	.L1041
	movl	32(%esp), %edx
.L1041:
	movl	%edx, cx0
	movl	cx1, %edx
	movl	%edx, 36(%esp)
	movl	36(%esp), %ebp
	movl	%eax, %edx
	cmpl	%ebp, %eax
	jg	.L1042
	movl	36(%esp), %edx
.L1042:
	movl	%edx, cx1
	movl	cy0, %edx
	movl	%edx, 40(%esp)
	movl	40(%esp), %ebp
	movl	%esi, %edx
	cmpl	%esi, %ebp
	jg	.L1043
	movl	40(%esp), %edx
.L1043:
	movl	%edx, cy0
	movl	cy1, %edx
	movl	%edx, 44(%esp)
	movl	44(%esp), %ebp
	movl	%ebx, %edx
	cmpl	%ebp, %ebx
	jg	.L1044
	movl	44(%esp), %edx
.L1044:
	addl	4(%esp), %ecx
	cmpl	%eax, (%esp)
	movl	%edx, cy1
	jne	.L1045
	movl	8(%esp), %edx
	movl	$1, %eax
.L1048:
	movl	20(%esp), %ecx
	addl	$1, %ebx
	addl	%ecx, 8(%esp)
	movl	12(%esp), %ecx
	cmpl	%ecx, 16(%esp)
	jg	.L1040
	testb	%al, %al
	jne	.L1058
.L1038:
	addl	$48, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L1058:
	.cfi_restore_state
	movl	%edx, offset
	jmp	.L1038
	.cfi_endproc
.LFE198:
	.size	RectL, .-RectL
	.align 16
	.globl	Creater
	.type	Creater, @function
Creater:
.LFB199:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$16, %esp
	.cfi_def_cfa_offset 28
	movl	depthVESA, %ebx
	movl	cx0, %esi
	movl	28(%esp), %edx
	movl	32(%esp), %ecx
	leal	7(%ebx), %eax
	movl	%esi, (%esp)
	movl	(%esp), %esi
	addl	%edx, %ecx
	testl	%ebx, %ebx
	cmovns	%ebx, %eax
	movl	widthVESA, %ebx
	sarl	$3, %eax
	imull	%eax, %ebx
	imull	%edx, %eax
	imull	%ecx, %ebx
	addl	%ebx, %eax
	movl	vesa_buff, %ebx
	movl	%eax, offset
	movl	$1000, (%ebx,%eax)
	leal	1(%edx), %ebx
	subl	$1, %edx
	leal	1(%ecx), %eax
	subl	$1, %ecx
	cmpl	%esi, %edx
	jl	.L1060
	movl	(%esp), %edx
.L1060:
	movl	%edx, cx0
	movl	cx1, %edx
	movl	%edx, 4(%esp)
	movl	4(%esp), %edx
	cmpl	%edx, %ebx
	jg	.L1061
	movl	4(%esp), %ebx
.L1061:
	movl	%ebx, cx1
	movl	cy0, %edx
	movl	%edx, 8(%esp)
	movl	8(%esp), %edx
	cmpl	%edx, %ecx
	jl	.L1062
	movl	8(%esp), %ecx
.L1062:
	movl	%ecx, cy0
	movl	cy1, %edx
	movl	%edx, 12(%esp)
	movl	12(%esp), %edx
	cmpl	%edx, %eax
	jg	.L1063
	movl	12(%esp), %eax
.L1063:
	movl	%eax, cy1
	addl	$16, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE199:
	.size	Creater, .-Creater
	.align 16
	.globl	Func_Plot
	.type	Func_Plot, @function
Func_Plot:
.LFB200:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$68, %esp
	.cfi_def_cfa_offset 88
	movl	88(%esp), %esi
	movl	96(%esp), %ebx
	movl	92(%esp), %ecx
	movl	100(%esp), %edx
	cmpl	%ebx, %esi
	movl	%ebx, %eax
	cmovle	%esi, %eax
	cmovge	%esi, %ebx
	cmpl	%ebx, %eax
	movl	%ebx, 40(%esp)
	jg	.L1065
	cmpl	%edx, %ecx
	movl	%edx, %ebx
	cmovle	%ecx, %ebx
	cmovge	%ecx, %edx
	movl	depthVESA, %ecx
	movl	%edx, (%esp)
	movl	%ebx, %esi
	movl	%ebx, 28(%esp)
	movl	widthVESA, %ebx
	leal	7(%ecx), %edx
	testl	%ecx, %ecx
	cmovns	%ecx, %edx
	sarl	$3, %edx
	imull	%edx, %ebx
	movl	%edx, %ecx
	movl	%edx, 44(%esp)
	imull	%eax, %ecx
	movl	%ebx, %edx
	movl	%ebx, 8(%esp)
	movl	offset, %ebx
	imull	%esi, %edx
	movl	%ebx, 20(%esp)
	movl	vesa_buff, %ebx
	addl	%ecx, %edx
	movl	%edx, 36(%esp)
	movl	%ebx, 24(%esp)
	leal	1(%eax), %ebx
	notl	%eax
	movl	%eax, 48(%esp)
	movl	%ebx, 12(%esp)
	movl	%esi, %ebx
	xorl	%esi, %esi
	notl	%ebx
	.align 16
.L1076:
	movl	(%esp), %edx
	cmpl	%edx, 28(%esp)
	jg	.L1087
	movl	12(%esp), %ecx
	movl	48(%esp), %edx
	movl	28(%esp), %eax
	addl	%ecx, %edx
	movl	%ecx, 32(%esp)
	subl	$2, %ecx
	movl	%edx, 4(%esp)
	addl	$1, %eax
	movl	36(%esp), %edx
	movl	%ecx, 16(%esp)
	jmp	.L1075
	.align 16
.L1088:
	movl	%eax, %ecx
	addl	8(%esp), %edx
	addl	$1, %eax
	cmpl	(%esp), %ecx
	jg	.L1068
.L1075:
	leal	(%ebx,%eax), %ecx
	cmpl	4(%esp), %ecx
	jne	.L1088
	movl	cx0, %ebp
	movl	16(%esp), %edi
	movl	24(%esp), %esi
	movl	104(%esp), %ecx
	movl	%edx, 20(%esp)
	movl	%ebp, 52(%esp)
	movl	52(%esp), %ebp
	movl	%ecx, (%esi,%edx)
	movl	%eax, %ecx
	leal	-2(%eax), %esi
	cmpl	%edi, %ebp
	jg	.L1071
	movl	52(%esp), %edi
.L1071:
	movl	%edi, cx0
	movl	cx1, %edi
	movl	%edi, 56(%esp)
	movl	12(%esp), %edi
	movl	56(%esp), %ebp
	cmpl	%edi, %ebp
	jl	.L1072
	movl	56(%esp), %edi
.L1072:
	movl	%edi, cx1
	movl	cy0, %edi
	movl	%edi, 60(%esp)
	movl	60(%esp), %edi
	cmpl	%esi, %edi
	jg	.L1073
	movl	60(%esp), %esi
.L1073:
	movl	%esi, cy0
	movl	cy1, %esi
	movl	%esi, 64(%esp)
	movl	64(%esp), %edi
	movl	%eax, %esi
	cmpl	%edi, %eax
	jg	.L1074
	movl	64(%esp), %esi
.L1074:
	addl	$1, %eax
	addl	8(%esp), %edx
	cmpl	(%esp), %ecx
	movl	%esi, cy1
	movl	$1, %esi
	jle	.L1075
.L1068:
	movl	44(%esp), %edx
	addl	$1, 12(%esp)
	addl	%edx, 36(%esp)
	movl	40(%esp), %edx
	cmpl	%edx, 32(%esp)
	jle	.L1076
	movl	%esi, %eax
	testb	%al, %al
	jne	.L1089
.L1065:
	addl	$68, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L1087:
	.cfi_restore_state
	movl	12(%esp), %eax
	movl	%eax, 32(%esp)
	jmp	.L1068
.L1089:
	movl	20(%esp), %eax
	movl	%eax, offset
	jmp	.L1065
	.cfi_endproc
.LFE200:
	.size	Func_Plot, .-Func_Plot
	.align 16
	.globl	line_plot
	.type	line_plot, @function
line_plot:
.LFB201:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$200, %esp
	.cfi_def_cfa_offset 220
	movl	220(%esp), %ebx
	movl	228(%esp), %edx
	movl	224(%esp), %ecx
	movl	232(%esp), %eax
	subl	%ebx, %edx
	movl	%edx, %ebp
	sarl	$31, %edx
	subl	%ecx, %eax
	orl	$1, %edx
	movl	%edx, %esi
	movl	%edx, 48(%esp)
	cltd
	orl	$1, %edx
	movl	%edx, %edi
	movl	%edx, 52(%esp)
	movl	%ebp, %edx
	imull	%esi, %edx
	imull	%edi, %eax
	leal	1(%edx), %esi
	addl	$1, %eax
	cmpl	%eax, %esi
	movl	%esi, 20(%esp)
	movl	%eax, 24(%esp)
	jge	.L1093
	testl	%eax, %eax
	jle	.L1090
	movl	depthVESA, %edx
	movl	52(%esp), %esi
	movl	$0, 8(%esp)
	movl	$0, 28(%esp)
	leal	7(%edx), %eax
	testl	%edx, %edx
	cmovns	%edx, %eax
	movl	buff, %edx
	sarl	$3, %eax
	movl	%eax, %edi
	movl	%eax, 64(%esp)
	imull	widthVESA, %eax
	movl	%edx, 4(%esp)
	leal	-1(%ecx), %edx
	imull	%eax, %esi
	imull	%eax, %edx
	addl	%eax, %eax
	movl	%eax, 56(%esp)
	movl	%edi, %eax
	addl	%eax, %eax
	movl	%esi, 60(%esp)
	movl	%edx, (%esp)
	movl	%eax, 68(%esp)
	.align 16
.L1131:
	leal	-2(%ecx), %eax
	leal	-1(%ebx), %esi
	leal	-2(%ebx), %edx
	imull	64(%esp), %esi
	movl	%eax, 12(%esp)
	movl	cx0, %eax
	movl	%eax, 184(%esp)
	movl	184(%esp), %edi
	movl	%edx, %eax
	movl	%esi, 32(%esp)
	addl	(%esp), %esi
	cmpl	%edi, %edx
	jl	.L1114
	movl	184(%esp), %eax
.L1114:
	movl	%eax, cx0
	movl	cx1, %eax
	movl	%eax, 188(%esp)
	movl	188(%esp), %edi
	movl	%ebx, %eax
	cmpl	%ebx, %edi
	jl	.L1115
	movl	188(%esp), %eax
.L1115:
	movl	%eax, cx1
	movl	cy0, %eax
	leal	-2(%ecx), %ebp
	movl	%eax, 192(%esp)
	movl	192(%esp), %edi
	movl	%ebp, %eax
	cmpl	%edi, %ebp
	jl	.L1116
	movl	192(%esp), %eax
.L1116:
	movl	%eax, cy0
	movl	cy1, %eax
	movl	%eax, 196(%esp)
	movl	196(%esp), %edi
	movl	%ecx, %eax
	cmpl	%ecx, %edi
	jl	.L1117
	movl	196(%esp), %eax
.L1117:
	movl	%eax, cy1
	movl	236(%esp), %edi
	movl	4(%esp), %eax
	movl	%edi, (%eax,%esi)
	leal	2(%ebx), %edi
	movl	68(%esp), %eax
	movl	56(%esp), %esi
	addl	32(%esp), %eax
	movl	%edi, 16(%esp)
	movl	cx0, %edi
	addl	(%esp), %esi
	movl	%edi, 168(%esp)
	movl	168(%esp), %ebp
	movl	%ebx, %edi
	movl	%eax, 40(%esp)
	addl	%esi, %eax
	movl	%esi, 36(%esp)
	cmpl	%ebx, %ebp
	movl	%eax, 44(%esp)
	leal	2(%ecx), %eax
	jg	.L1118
	movl	168(%esp), %edi
.L1118:
	movl	%edi, cx0
	movl	cx1, %edi
	leal	2(%ebx), %esi
	movl	%edi, 172(%esp)
	movl	172(%esp), %ebp
	movl	%esi, %edi
	cmpl	%ebp, %esi
	jg	.L1119
	movl	172(%esp), %edi
.L1119:
	movl	%edi, cx1
	movl	cy0, %edi
	movl	%edi, 176(%esp)
	movl	176(%esp), %ebp
	movl	%ecx, %edi
	cmpl	%ecx, %ebp
	jg	.L1120
	movl	176(%esp), %edi
.L1120:
	movl	%edi, cy0
	movl	cy1, %edi
	movl	%edi, 180(%esp)
	movl	180(%esp), %ebp
	movl	%eax, %edi
	cmpl	%ebp, %eax
	jg	.L1121
	movl	180(%esp), %edi
.L1121:
	movl	%edi, cy1
	movl	236(%esp), %esi
	movl	4(%esp), %edi
	movl	44(%esp), %ebp
	movl	%esi, (%edi,%ebp)
	movl	cx0, %edi
	movl	36(%esp), %esi
	addl	32(%esp), %esi
	movl	%edi, 152(%esp)
	movl	152(%esp), %edi
	cmpl	%edx, %edi
	jg	.L1122
	movl	152(%esp), %edx
.L1122:
	movl	%edx, cx0
	movl	cx1, %edx
	movl	%edx, 156(%esp)
	movl	156(%esp), %edi
	movl	%ebx, %edx
	cmpl	%ebx, %edi
	jl	.L1123
	movl	156(%esp), %edx
.L1123:
	movl	%edx, cx1
	movl	cy0, %edx
	movl	%edx, 160(%esp)
	movl	160(%esp), %edi
	movl	%ecx, %edx
	cmpl	%ecx, %edi
	jg	.L1124
	movl	160(%esp), %edx
.L1124:
	movl	%edx, cy0
	movl	cy1, %edx
	movl	%edx, 164(%esp)
	movl	164(%esp), %edx
	cmpl	%edx, %eax
	jg	.L1125
	movl	164(%esp), %eax
.L1125:
	movl	%eax, cy1
	movl	236(%esp), %edx
	movl	4(%esp), %eax
	movl	%edx, (%eax,%esi)
	movl	cx0, %edx
	movl	40(%esp), %eax
	addl	(%esp), %eax
	movl	%edx, 136(%esp)
	movl	136(%esp), %esi
	movl	%ebx, %edx
	cmpl	%ebx, %esi
	jg	.L1126
	movl	136(%esp), %edx
.L1126:
	movl	%edx, cx0
	movl	cx1, %edx
	movl	%edx, 140(%esp)
	movl	140(%esp), %edx
	cmpl	16(%esp), %edx
	jl	.L1127
	movl	140(%esp), %esi
	movl	%esi, 16(%esp)
.L1127:
	movl	16(%esp), %edx
	movl	%edx, cx1
	movl	cy0, %edx
	movl	%edx, 144(%esp)
	movl	144(%esp), %edx
	cmpl	%edx, 12(%esp)
	jl	.L1128
	movl	144(%esp), %edi
	movl	%edi, 12(%esp)
.L1128:
	movl	12(%esp), %edx
	movl	%edx, cy0
	movl	cy1, %edx
	movl	%edx, 148(%esp)
	movl	148(%esp), %esi
	movl	%ecx, %edx
	cmpl	%ecx, %esi
	jl	.L1129
	movl	148(%esp), %edx
.L1129:
	movl	%edx, cy1
	movl	236(%esp), %edi
	movl	4(%esp), %edx
	movl	20(%esp), %esi
	addl	%esi, 8(%esp)
	movl	24(%esp), %esi
	movl	%edi, (%edx,%eax)
	movl	8(%esp), %eax
	cmpl	%eax, %esi
	jg	.L1130
	addl	48(%esp), %ebx
	subl	%esi, %eax
	movl	%eax, 8(%esp)
.L1130:
	addl	$1, 28(%esp)
	addl	52(%esp), %ecx
	movl	28(%esp), %eax
	movl	60(%esp), %edx
	addl	%edx, (%esp)
	cmpl	24(%esp), %eax
	jne	.L1131
.L1090:
	addl	$200, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L1093:
	.cfi_restore_state
	movl	20(%esp), %eax
	testl	%eax, %eax
	jle	.L1090
	movl	depthVESA, %edx
	movl	buff, %esi
	movl	widthVESA, %edi
	movl	$0, 28(%esp)
	movl	$0, 8(%esp)
	leal	7(%edx), %eax
	testl	%edx, %edx
	movl	%esi, 4(%esp)
	movl	48(%esp), %esi
	cmovns	%edx, %eax
	leal	-1(%ebx), %edx
	sarl	$3, %eax
	imull	%eax, %edi
	imull	%eax, %esi
	movl	%edi, 60(%esp)
	imull	%eax, %edx
	addl	%eax, %eax
	movl	%esi, 64(%esp)
	movl	%eax, 56(%esp)
	leal	(%edi,%edi), %eax
	movl	%edx, (%esp)
	movl	%eax, 68(%esp)
	.align 16
.L1113:
	leal	-1(%ecx), %eax
	movl	(%esp), %esi
	leal	-2(%ebx), %edx
	imull	60(%esp), %eax
	addl	%eax, %esi
	movl	%eax, 32(%esp)
	leal	-2(%ecx), %eax
	movl	%eax, 16(%esp)
	movl	cx0, %eax
	movl	%eax, 120(%esp)
	movl	120(%esp), %edi
	movl	%edx, %eax
	cmpl	%edx, %edi
	jg	.L1096
	movl	120(%esp), %eax
.L1096:
	movl	%eax, cx0
	movl	cx1, %eax
	movl	%eax, 124(%esp)
	movl	124(%esp), %edi
	movl	%ebx, %eax
	cmpl	%ebx, %edi
	jl	.L1097
	movl	124(%esp), %eax
.L1097:
	movl	%eax, cx1
	movl	cy0, %eax
	leal	-2(%ecx), %ebp
	movl	%eax, 128(%esp)
	movl	128(%esp), %edi
	movl	%ebp, %eax
	cmpl	%edi, %ebp
	jl	.L1098
	movl	128(%esp), %eax
.L1098:
	movl	%eax, cy0
	movl	cy1, %eax
	movl	%eax, 132(%esp)
	movl	132(%esp), %edi
	movl	%ecx, %eax
	cmpl	%ecx, %edi
	jl	.L1099
	movl	132(%esp), %eax
.L1099:
	movl	%eax, cy1
	movl	236(%esp), %edi
	movl	4(%esp), %eax
	movl	%edi, (%eax,%esi)
	leal	2(%ebx), %edi
	movl	(%esp), %eax
	movl	68(%esp), %esi
	addl	56(%esp), %eax
	movl	%edi, 12(%esp)
	movl	cx0, %edi
	addl	32(%esp), %esi
	movl	%edi, 104(%esp)
	movl	104(%esp), %ebp
	movl	%ebx, %edi
	movl	%eax, 44(%esp)
	addl	%esi, %eax
	movl	%esi, 36(%esp)
	cmpl	%ebx, %ebp
	movl	%eax, 40(%esp)
	leal	2(%ecx), %eax
	jg	.L1100
	movl	104(%esp), %edi
.L1100:
	movl	%edi, cx0
	movl	cx1, %edi
	leal	2(%ebx), %esi
	movl	%edi, 108(%esp)
	movl	108(%esp), %ebp
	movl	%esi, %edi
	cmpl	%esi, %ebp
	jl	.L1101
	movl	108(%esp), %edi
.L1101:
	movl	%edi, cx1
	movl	cy0, %edi
	movl	%edi, 112(%esp)
	movl	112(%esp), %ebp
	movl	%ecx, %edi
	cmpl	%ecx, %ebp
	jg	.L1102
	movl	112(%esp), %edi
.L1102:
	movl	%edi, cy0
	movl	cy1, %edi
	movl	%edi, 116(%esp)
	movl	116(%esp), %ebp
	movl	%eax, %edi
	cmpl	%ebp, %eax
	jg	.L1103
	movl	116(%esp), %edi
.L1103:
	movl	%edi, cy1
	movl	236(%esp), %esi
	movl	4(%esp), %edi
	movl	40(%esp), %ebp
	movl	%esi, (%edi,%ebp)
	movl	cx0, %edi
	movl	36(%esp), %esi
	addl	(%esp), %esi
	movl	%edi, 88(%esp)
	movl	88(%esp), %edi
	cmpl	%edx, %edi
	jg	.L1104
	movl	88(%esp), %edx
.L1104:
	movl	%edx, cx0
	movl	cx1, %edx
	movl	%edx, 92(%esp)
	movl	92(%esp), %edi
	movl	%ebx, %edx
	cmpl	%ebx, %edi
	jl	.L1105
	movl	92(%esp), %edx
.L1105:
	movl	%edx, cx1
	movl	cy0, %edx
	movl	%edx, 96(%esp)
	movl	96(%esp), %edi
	movl	%ecx, %edx
	cmpl	%ecx, %edi
	jg	.L1106
	movl	96(%esp), %edx
.L1106:
	movl	%edx, cy0
	movl	cy1, %edx
	movl	%edx, 100(%esp)
	movl	100(%esp), %edx
	cmpl	%eax, %edx
	jl	.L1107
	movl	100(%esp), %eax
.L1107:
	movl	%eax, cy1
	movl	236(%esp), %edx
	movl	4(%esp), %eax
	movl	%edx, (%eax,%esi)
	movl	cx0, %edx
	movl	32(%esp), %eax
	addl	44(%esp), %eax
	movl	%edx, 72(%esp)
	movl	72(%esp), %esi
	movl	%ebx, %edx
	cmpl	%ebx, %esi
	jg	.L1108
	movl	72(%esp), %edx
.L1108:
	movl	%edx, cx0
	movl	cx1, %edx
	movl	%edx, 76(%esp)
	movl	76(%esp), %edx
	cmpl	12(%esp), %edx
	jl	.L1109
	movl	76(%esp), %esi
	movl	%esi, 12(%esp)
.L1109:
	movl	12(%esp), %esi
	movl	%esi, cx1
	movl	cy0, %edx
	movl	%edx, 80(%esp)
	movl	80(%esp), %edx
	cmpl	16(%esp), %edx
	jg	.L1110
	movl	80(%esp), %edx
	movl	%edx, 16(%esp)
.L1110:
	movl	16(%esp), %esi
	movl	%esi, cy0
	movl	cy1, %edx
	movl	%edx, 84(%esp)
	movl	84(%esp), %esi
	movl	%ecx, %edx
	cmpl	%ecx, %esi
	jl	.L1111
	movl	84(%esp), %edx
.L1111:
	movl	%edx, cy1
	movl	4(%esp), %esi
	movl	236(%esp), %edx
	movl	%edx, (%esi,%eax)
	movl	24(%esp), %esi
	addl	%esi, 8(%esp)
	movl	20(%esp), %esi
	movl	8(%esp), %eax
	cmpl	%eax, %esi
	jg	.L1112
	addl	52(%esp), %ecx
	subl	%esi, %eax
	movl	%eax, 8(%esp)
.L1112:
	addl	$1, 28(%esp)
	addl	48(%esp), %ebx
	movl	28(%esp), %eax
	movl	64(%esp), %edi
	addl	%edi, (%esp)
	cmpl	20(%esp), %eax
	jne	.L1113
	addl	$200, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE201:
	.size	line_plot, .-line_plot
	.align 16
	.globl	Mouse_Plot
	.type	Mouse_Plot, @function
Mouse_Plot:
.LFB202:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	movl	depthVESA, %edx
	leal	7(%edx), %eax
	testl	%edx, %edx
	cmovns	%edx, %eax
	sarl	$3, %eax
	movl	%eax, 4(%esp)
.L1188:
	call	mouse_handler
/APP
/  296 "Source/graphics/graphics.c" 1
	int $50
/  0 "" 2
/  297 "Source/graphics/graphics.c" 1
	cli
/  0 "" 2
/NO_APP
	movl	buff, %eax
	movl	widthVESA, %ebx
	movl	$-2, %ebp
	movl	mouse_buff, %esi
	movl	$20, %ecx
	movl	%eax, (%esp)
	.align 16
.L1164:
	movl	mousey, %edx
	movl	mousex, %eax
	addl	%ecx, %edx
	imull	%ebx, %edx
	addl	%eax, %edx
	xorl	%eax, %eax
	imull	4(%esp), %edx
	leal	(%esi,%edx), %edi
	addl	(%esp), %edx
	cmpl	$12, %ecx
	jg	.L1212
	movl	%ebx, 8(%esp)
	.align 16
.L1195:
	movzwl	(%edi,%eax,2), %ebx
	movw	%bx, (%edx,%eax,2)
	addl	$1, %eax
	cmpl	%ecx, %eax
	jl	.L1195
	movl	8(%esp), %ebx
.L1167:
	addl	$1, %ebp
	subl	$1, %ecx
	jne	.L1164
	movl	mousey, %ebp
	movl	mousex, %eax
	movl	mousey, %edi
	movl	mousex, %edx
	movl	cx0, %ecx
	addl	$25, %ebp
	addl	$25, %eax
	subl	$5, %edx
	subl	$5, %edi
	movl	%ecx, 28(%esp)
	movl	28(%esp), %ecx
	cmpl	%ecx, %edx
	jl	.L1169
	movl	28(%esp), %edx
.L1169:
	movl	%edx, cx0
	movl	cx1, %edx
	movl	%edx, 32(%esp)
	movl	32(%esp), %edx
	cmpl	%edx, %eax
	jg	.L1170
	movl	32(%esp), %eax
.L1170:
	movl	%eax, cx1
	movl	cy0, %eax
	movl	%eax, 36(%esp)
	movl	36(%esp), %eax
	cmpl	%eax, %edi
	jl	.L1171
	movl	36(%esp), %edi
.L1171:
	movl	%edi, cy0
	movl	cy1, %eax
	movl	%eax, 40(%esp)
	movl	40(%esp), %eax
	cmpl	%eax, %ebp
	jg	.L1172
	movl	40(%esp), %ebp
.L1172:
	movl	%ebp, cy1
	movl	mousedeltax, %eax
	movl	mousex, %edx
	addl	%edx, %eax
	movl	%eax, mousex
	movl	mousedeltay, %edx
	movl	mousey, %eax
	subl	%edx, %eax
	movl	%eax, mousey
	movl	mousex, %eax
	movl	%eax, 16(%esp)
	movl	16(%esp), %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	js	.L1173
	movl	16(%esp), %eax
.L1173:
	movl	%eax, 12(%esp)
	movl	12(%esp), %edx
	movl	%ebx, %eax
	cmpl	%ebx, %edx
	jg	.L1174
	movl	12(%esp), %eax
.L1174:
	movl	%eax, mousex
	movl	mousey, %eax
	movl	%eax, 24(%esp)
	movl	24(%esp), %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	js	.L1175
	movl	24(%esp), %eax
.L1175:
	movl	%eax, 20(%esp)
	movl	heightVESA, %eax
	movl	20(%esp), %edx
	cmpl	%edx, %eax
	jl	.L1176
	movl	20(%esp), %eax
.L1176:
	movl	%eax, mousey
	movl	mousey, %ebp
	movl	mousex, %eax
	movl	mousey, %edi
	movl	mousex, %edx
	movl	cx0, %ecx
	addl	$25, %ebp
	addl	$25, %eax
	subl	$5, %edi
	movl	%ecx, 44(%esp)
	movl	44(%esp), %ecx
	subl	$5, %edx
	cmpl	%ecx, %edx
	jl	.L1177
	movl	44(%esp), %edx
.L1177:
	movl	%edx, cx0
	movl	cx1, %edx
	movl	%edx, 48(%esp)
	movl	48(%esp), %edx
	cmpl	%edx, %eax
	jg	.L1178
	movl	48(%esp), %eax
.L1178:
	movl	%eax, cx1
	movl	cy0, %eax
	movl	%eax, 52(%esp)
	movl	52(%esp), %eax
	cmpl	%eax, %edi
	jl	.L1179
	movl	52(%esp), %edi
.L1179:
	movl	%edi, cy0
	movl	cy1, %eax
	movl	%eax, 56(%esp)
	movl	56(%esp), %eax
	cmpl	%eax, %ebp
	jg	.L1180
	movl	56(%esp), %ebp
.L1180:
	movl	%ebp, cy1
	movl	$20, %ecx
	movl	$-2, %ebp
	.align 16
.L1183:
	movl	mousey, %edx
	movl	mousex, %eax
	addl	%ecx, %edx
	imull	%ebx, %edx
	addl	%eax, %edx
	xorl	%eax, %eax
	imull	4(%esp), %edx
	leal	(%esi,%edx), %edi
	addl	(%esp), %edx
	cmpl	$12, %ecx
	jg	.L1213
	movl	%ebx, 8(%esp)
	.align 16
.L1193:
	movzwl	(%edx,%eax,2), %ebx
	movw	%bx, (%edi,%eax,2)
	movl	$-1, %ebx
	movw	%bx, (%edx,%eax,2)
	addl	$1, %eax
	cmpl	%ecx, %eax
	jl	.L1193
	movl	8(%esp), %ebx
.L1186:
	addl	$1, %ebp
	subl	$1, %ecx
	jne	.L1183
	movl	$0, mousedeltax
	movl	$0, mousedeltay
/APP
/  361 "Source/graphics/graphics.c" 1
	int $50
/  0 "" 2
/NO_APP
	jmp	.L1188
	.align 16
.L1213:
	testl	%ebp, %ebp
	jle	.L1186
	movl	%ecx, 8(%esp)
	.align 16
.L1194:
	movzwl	(%edx,%eax,2), %ecx
	movw	%cx, (%edi,%eax,2)
	movl	$-1, %ecx
	movw	%cx, (%edx,%eax,2)
	addl	$1, %eax
	cmpl	%ebp, %eax
	jne	.L1194
	movl	8(%esp), %ecx
	jmp	.L1186
	.align 16
.L1212:
	testl	%ebp, %ebp
	jle	.L1167
	movl	%ecx, 8(%esp)
	.align 16
.L1196:
	movzwl	(%edi,%eax,2), %ecx
	movw	%cx, (%edx,%eax,2)
	addl	$1, %eax
	cmpl	%ebp, %eax
	jne	.L1196
	movl	8(%esp), %ecx
	jmp	.L1167
	.cfi_endproc
.LFE202:
	.size	Mouse_Plot, .-Mouse_Plot
	.globl	next
	.section	.bss
	.align 4
	.type	next, @object
	.size	next, 4
next:
	.zero	4
	.comm	time,4,4
	.globl	ticks
	.data
	.align 4
	.type	ticks, @object
	.size	ticks, 4
ticks:
	.long	5
	.text
	.align 16
	.globl	seeder
	.type	seeder, @function
seeder:
.LFB207:
	.cfi_startproc
	movl	next, %eax
	imull	$1103515245, %eax, %eax
	addl	$12345, %eax
	movl	%eax, next
	movl	next, %eax
	shrl	$16, %eax
	andl	$32767, %eax
	ret
	.cfi_endproc
.LFE207:
	.size	seeder, .-seeder
	.align 16
	.globl	init_timer_RTC
	.type	init_timer_RTC, @function
init_timer_RTC:
.LFB208:
	.cfi_startproc
/APP
/  9 "Source/Drivers/timer/timer.c" 1
	cli
/  0 "" 2
/NO_APP
	movl	$-118, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $112
/  0 "" 2
/  45 "Library/sys.h" 1
	inb $113, %al
/  0 "" 2
/NO_APP
	movl	%eax, %edx
	movl	$-118, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $112
/  0 "" 2
/NO_APP
	movl	%edx, %eax
	andl	$-16, %eax
	orl	$5, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $113
/  0 "" 2
/  23 "Source/Drivers/timer/timer.c" 1
	sti
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE208:
	.size	init_timer_RTC, .-init_timer_RTC
	.align 16
	.globl	apic_start_timer
	.type	apic_start_timer, @function
apic_start_timer:
.LFB209:
	.cfi_startproc
	movl	APIC_LOCAL_BASE, %eax
	movl	$3, 992(%eax)
	movl	APIC_LOCAL_BASE, %eax
	movl	$-1, 896(%eax)
	movl	APIC_LOCAL_BASE, %eax
	movl	$65536, 800(%eax)
	movl	APIC_LOCAL_BASE, %eax
	movl	$51, 800(%eax)
	movl	APIC_LOCAL_BASE, %eax
	movl	$3, 992(%eax)
	movl	APIC_LOCAL_BASE, %eax
	movl	$1, 896(%eax)
	ret
	.cfi_endproc
.LFE209:
	.size	apic_start_timer, .-apic_start_timer
	.align 16
	.globl	init_timer
	.type	init_timer, @function
init_timer:
.LFB210:
	.cfi_startproc
	xorl	%edx, %edx
	movl	$1193180, %eax
	divl	4(%esp)
	movl	%eax, %ecx
	movl	$54, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $67
/  0 "" 2
/NO_APP
	movl	%ecx, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $64
/  0 "" 2
/NO_APP
	movl	%ecx, %eax
	shrl	$8, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $64
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE210:
	.size	init_timer, .-init_timer
	.globl	delay_dump
	.section	.bss
	.align 4
	.type	delay_dump, @object
	.size	delay_dump, 4
delay_dump:
	.zero	4
	.text
	.align 16
	.globl	delay1
	.type	delay1, @function
delay1:
.LFB211:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	xorl	%eax, %eax
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$20, %esp
	.cfi_def_cfa_offset 36
/APP
/  37 "Library/sys.h" 1
	outb %al, $112
/  0 "" 2
/  45 "Library/sys.h" 1
	inb $113, %al
/  0 "" 2
/NO_APP
	movzbl	%al, %ecx
	movl	next, %eax
	movl	$175921861, %edx
	movl	%ecx, time
	movl	36(%esp), %ebx
	fldz
	movl	$175921861, %esi
	addl	%eax, %ecx
	movl	%ecx, %eax
	sall	$10, %ebx
	shrl	$5, %eax
	mull	%edx
	movl	%edx, %eax
	shrl	$7, %eax
	imull	$100000, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, next
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	fstps	16(%esp)
	je	.L1222
	.align 16
.L1223:
	movl	next, %eax
	flds	.LC9484
	leal	100(%ecx,%eax), %edi
	movl	%edi, %edx
	shrl	$5, %edx
	movl	%edx, %eax
	mull	%esi
	shrl	$7, %edx
	imull	$100000, %edx, %edx
	subl	%edx, %edi
	movl	$500, %edx
	movl	%edi, next
	.align 16
.L1220:
	movl	next, %eax
	imull	$1103515245, %eax, %eax
	addl	$12345, %eax
	movl	%eax, next
	movl	next, %eax
	shrl	$16, %eax
	andl	$32767, %eax
	subl	$1, %edx
	movl	%eax, (%esp)
	fildl	(%esp)
	fstps	16(%esp)
	flds	16(%esp)
	fdiv	%st(1), %st
	fstps	16(%esp)
	jne	.L1220
	fstp	%st(0)
	addl	$1, %ecx
	cmpl	%ebx, %ecx
	jne	.L1223
.L1222:
	flds	16(%esp)
	flds	delay_dump
	fxch	%st(1)
	fdivs	.LC9483
	faddp	%st, %st(1)
	fstps	delay_dump
	addl	$20, %esp
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE211:
	.size	delay1, .-delay1
	.align 16
	.globl	check_apic
	.type	check_apic, @function
check_apic:
.LFB212:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$1, %eax
/APP
/  9 "Source/arch/x86/APIC/apic.c" 1
	cpuid
/  0 "" 2
/NO_APP
	movl	%edx, %eax
	shrl	$9, %eax
	andl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE212:
	.size	check_apic, .-check_apic
	.section	.rodata
	.align 4
.LC9486:
	.string	"\nTesting APIC! Local APIC revision: %x Max LVT entry: %x\n"
	.text
	.align 16
	.globl	init_APIC
	.type	init_APIC, @function
init_APIC:
.LFB213:
	.cfi_startproc
	subl	$16, %esp
	.cfi_def_cfa_offset 20
	movl	$17, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $32
/  0 "" 2
/  37 "Library/sys.h" 1
	outb %al, $160
/  0 "" 2
/NO_APP
	movl	$32, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $33
/  0 "" 2
/NO_APP
	movl	$40, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $161
/  0 "" 2
/NO_APP
	movl	$4, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $33
/  0 "" 2
/NO_APP
	movl	$2, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $161
/  0 "" 2
/NO_APP
	movl	$1, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $33
/  0 "" 2
/  37 "Library/sys.h" 1
	outb %al, $161
/  0 "" 2
/NO_APP
	xorl	%eax, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $33
/  0 "" 2
/  37 "Library/sys.h" 1
	outb %al, $161
/  0 "" 2
/NO_APP
	movl	$-1, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, $33
/  0 "" 2
/  37 "Library/sys.h" 1
	outb %al, $161
/  0 "" 2
/NO_APP
	movl	APIC_LOCAL_BASE, %edx
	movl	48(%edx), %eax
	movl	48(%edx), %edx
	shrl	$16, %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	addl	$1, %eax
	pushl	%eax
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	testl	%edx, %edx
	setne	%al
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$.LC9486
	.cfi_def_cfa_offset 32
	call	printf
	movl	APIC_LOCAL_BASE, %eax
	movl	$31, 880(%eax)
	movl	APIC_LOCAL_BASE, %eax
	movl	$0, 128(%eax)
	movl	APIC_LOCAL_BASE, %eax
	movl	$-1, 224(%eax)
	movl	APIC_LOCAL_BASE, %eax
	movl	$16777216, 208(%eax)
	movl	APIC_LOCAL_BASE, %eax
	movl	$511, 240(%eax)
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE213:
	.size	init_APIC, .-init_APIC
	.section	.rodata
.LC9487:
	.string	"\nInitializing IO APIC!!!"
.LC9488:
	.string	"RSDT"
.LC9489:
	.string	"APIC"
.LC9490:
	.string	"\nGot the MADT Structure"
.LC9491:
	.string	"\n\tLocal APIC Found"
.LC9492:
	.string	"\n\tIO APIC Found"
	.align 4
.LC9493:
	.string	" id: %x, address: %x, GSIB: %x"
	.align 4
.LC9494:
	.string	"\n\tInterrupt Source Override Found"
	.text
	.align 16
	.globl	ioapic_init
	.type	ioapic_init, @function
ioapic_init:
.LFB214:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9487
	.cfi_def_cfa_offset 32
	call	printf
	call	acpiGetRSDPtr
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L1233
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	movl	%eax, %esi
	pushl	$.LC9488
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	acpiCheckHeader
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	jne	.L1233
	movl	4(%esi), %eax
	addl	$36, %esi
	subl	$36, %eax
	shrl	$2, %eax
	testl	%eax, %eax
	je	.L1233
	leal	(%esi,%eax,4), %edi
	jmp	.L1242
	.align 16
.L1236:
	addl	$4, %esi
	cmpl	%esi, %edi
	je	.L1233
.L1242:
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	$.LC9489
	.cfi_def_cfa_offset 28
	pushl	(%esi)
	.cfi_def_cfa_offset 32
	call	acpiCheckHeader
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	jne	.L1236
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9490
	.cfi_def_cfa_offset 32
	call	printf
	movl	(%esi), %ebx
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	%ebx, madt
	addl	$44, %ebx
	.align 16
.L1237:
	movzbl	(%ebx), %eax
	cmpb	$1, %al
	je	.L1240
.L1248:
	jb	.L1238
	cmpb	$2, %al
	jne	.L1236
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9494
	.cfi_def_cfa_offset 32
	call	printf
	leal	2(%ebx), %eax
	addl	$10, %ebx
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	%eax, ISD_entry
	movzbl	(%ebx), %eax
	cmpb	$1, %al
	jne	.L1248
.L1240:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9492
	.cfi_def_cfa_offset 32
	call	printf
	leal	2(%ebx), %eax
	movl	8(%ebx), %ecx
	movl	4(%ebx), %edx
	movl	%eax, IOAPIC_entry
	movzbl	2(%ebx), %eax
	pushl	%ecx
	.cfi_def_cfa_offset 36
	pushl	%edx
	.cfi_def_cfa_offset 40
	movzbl	%al, %eax
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	$.LC9493
	.cfi_def_cfa_offset 48
	call	printf
	movl	IOAPIC_entry, %ebx
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	movl	2(%ebx), %eax
	addl	$10, %ebx
	movl	%eax, APIC_IO_BASE
	jmp	.L1237
	.align 16
.L1238:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9491
	.cfi_def_cfa_offset 32
	call	printf
	leal	2(%ebx), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	addl	$8, %ebx
	movl	%eax, LAPIC_entry
	jmp	.L1237
	.align 16
.L1233:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE214:
	.size	ioapic_init, .-ioapic_init
	.align 16
	.globl	ioapic_read
	.type	ioapic_read, @function
ioapic_read:
.LFB215:
	.cfi_startproc
	movzbl	4(%esp), %edx
	movl	APIC_IO_BASE, %eax
	movl	%edx, (%eax)
	movl	16(%eax), %eax
	ret
	.cfi_endproc
.LFE215:
	.size	ioapic_read, .-ioapic_read
	.align 16
	.globl	ioapic_write
	.type	ioapic_write, @function
ioapic_write:
.LFB216:
	.cfi_startproc
	movzbl	4(%esp), %edx
	movl	APIC_IO_BASE, %eax
	movl	%edx, (%eax)
	movl	8(%esp), %edx
	movl	%edx, 16(%eax)
	ret
	.cfi_endproc
.LFE216:
	.size	ioapic_write, .-ioapic_write
	.align 16
	.globl	localapic_read
	.type	localapic_read, @function
localapic_read:
.LFB217:
	.cfi_startproc
	movl	APIC_LOCAL_BASE, %eax
	addl	4(%esp), %eax
	movl	(%eax), %eax
	ret
	.cfi_endproc
.LFE217:
	.size	localapic_read, .-localapic_read
	.align 16
	.globl	localapic_write
	.type	localapic_write, @function
localapic_write:
.LFB218:
	.cfi_startproc
	movl	APIC_LOCAL_BASE, %eax
	addl	4(%esp), %eax
	movl	8(%esp), %edx
	movl	%edx, (%eax)
	ret
	.cfi_endproc
.LFE218:
	.size	localapic_write, .-localapic_write
	.align 16
	.globl	localapic_write_with_mask
	.type	localapic_write_with_mask, @function
localapic_write_with_mask:
.LFB219:
	.cfi_startproc
	movl	APIC_LOCAL_BASE, %eax
	addl	4(%esp), %eax
	movl	8(%esp), %edx
	movl	(%eax), %ecx
	notl	%edx
	andl	%ecx, %edx
	movl	%edx, (%eax)
	movl	(%eax), %edx
	orl	12(%esp), %edx
	movl	%edx, (%eax)
	ret
	.cfi_endproc
.LFE219:
	.size	localapic_write_with_mask, .-localapic_write_with_mask
	.align 16
	.globl	ioapic_set_irq
	.type	ioapic_set_irq, @function
ioapic_set_irq:
.LFB220:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movzbl	12(%esp), %eax
	movl	24(%esp), %edx
	leal	16(%eax,%eax), %esi
	movl	APIC_IO_BASE, %eax
	leal	1(%esi), %ecx
	movzbl	%cl, %ecx
	movl	%ecx, (%eax)
	movl	16(%eax), %eax
	andl	$16777215, %eax
	movl	%eax, %ebx
	movl	16(%esp), %eax
	sall	$24, %eax
	orl	%ebx, %eax
	movl	APIC_IO_BASE, %ebx
	movl	%ecx, (%ebx)
	movl	%eax, 16(%ebx)
	movl	%esi, %ecx
	movl	APIC_IO_BASE, %eax
	movzbl	%cl, %ebx
	movl	%ebx, (%eax)
	movl	16(%eax), %eax
	andl	$-69632, %eax
	movl	%eax, %ecx
	movzbl	%dl, %eax
	movl	APIC_IO_BASE, %edx
	orl	%ecx, %eax
	movl	%ebx, (%edx)
	movl	%eax, 16(%edx)
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE220:
	.size	ioapic_set_irq, .-ioapic_set_irq
	.section	.rodata
.LC9495:
	.string	"Unknown x86 CPU Detected\n"
	.text
	.align 16
	.globl	detect_cpu
	.type	detect_cpu, @function
detect_cpu:
.LFB222:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	xorl	%eax, %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 16
/APP
/  21 "Source/arch/x86/cpuid/cpuid.c" 1
	cpuid
/  0 "" 2
/NO_APP
	cmpl	$1752462657, %ebx
	je	.L1258
	cmpl	$1970169159, %ebx
	je	.L1263
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9495
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L1263:
	.cfi_restore_state
	call	do_intel
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L1258:
	.cfi_restore_state
	call	do_amd
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE222:
	.size	detect_cpu, .-detect_cpu
	.globl	Intel
	.section	.rodata
.LC9496:
	.string	"Brand ID Not Supported."
.LC9497:
	.string	"Intel(R) Celeron(R) processor"
	.align 4
.LC9498:
	.string	"Intel(R) Pentium(R) III processor"
	.align 4
.LC9499:
	.string	"Intel(R) Pentium(R) III Xeon(R) processor"
	.align 4
.LC9500:
	.string	"Mobile Intel(R) Pentium(R) III processor-M"
	.align 4
.LC9501:
	.string	"Mobile Intel(R) Celeron(R) processor"
	.align 4
.LC9502:
	.string	"Intel(R) Pentium(R) 4 processor"
.LC9503:
	.string	"Intel(R) Xeon(R) Processor"
.LC9504:
	.string	"Intel(R) Xeon(R) processor MP"
	.align 4
.LC9505:
	.string	"Mobile Intel(R) Pentium(R) 4 processor-M"
	.align 4
.LC9506:
	.string	"Mobile Intel(R) Pentium(R) Celeron(R) processor"
	.align 4
.LC9507:
	.string	"Mobile Genuine Intel(R) processor"
	.align 4
.LC9508:
	.string	"Intel(R) Celeron(R) M processor"
	.align 4
.LC9509:
	.string	"Mobile Geniune Intel(R) processor"
	.align 4
.LC9510:
	.string	"Intel(R) Pentium(R) M processor"
	.data
	.align 32
	.type	Intel, @object
	.size	Intel, 96
Intel:
	.long	.LC9496
	.long	.LC9497
	.long	.LC9498
	.long	.LC9499
	.long	.LC9498
	.long	.LC2
	.long	.LC9500
	.long	.LC9501
	.long	.LC9502
	.long	.LC9502
	.long	.LC9497
	.long	.LC9503
	.long	.LC9504
	.long	.LC2
	.long	.LC9505
	.long	.LC9506
	.long	.LC2
	.long	.LC9507
	.long	.LC9508
	.long	.LC9501
	.long	.LC9497
	.long	.LC9509
	.long	.LC9510
	.long	.LC9501
	.globl	Intel_Other
	.section	.rodata
.LC9511:
	.string	"Intel(R) Xeon(R) processor"
	.data
	.align 32
	.type	Intel_Other, @object
	.size	Intel_Other, 96
Intel_Other:
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC9497
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC9504
	.long	.LC2
	.long	.LC2
	.long	.LC9511
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.long	.LC2
	.section	.rodata
.LC9512:
	.string	"\nIntel Specific Features:\n"
.LC9513:
	.string	"\nAPIC Supported\n"
.LC9514:
	.string	"Type %d - "
.LC9515:
	.string	"Original OEM"
.LC9516:
	.string	"Overdrive"
.LC9517:
	.string	"Dual-capable"
.LC9518:
	.string	"Family %d - "
.LC9519:
	.string	"Pentium Pro"
.LC9520:
	.string	"Pentium 4"
.LC9521:
	.string	"Extended family %d\n"
.LC9522:
	.string	"Model %d - "
.LC9523:
	.string	"DX"
.LC9524:
	.string	"SX"
.LC9525:
	.string	"487/DX2"
.LC9526:
	.string	"SL"
.LC9527:
	.string	"SX2"
.LC9528:
	.string	"Write-back enhanced DX2"
.LC9529:
	.string	"DX4"
.LC9530:
	.string	"60/66"
.LC9531:
	.string	"75-200"
.LC9532:
	.string	"for 486 system"
.LC9533:
	.string	"MMX"
.LC9534:
	.string	"Pentium II Model 3"
	.align 4
.LC9535:
	.string	"Pentium II Model 5/Xeon/Celeron"
.LC9536:
	.string	"Celeron"
	.align 4
.LC9537:
	.string	"Pentium III/Pentium III Xeon - external L2 cache"
	.align 4
.LC9538:
	.string	"Pentium III/Pentium III Xeon - internal L2 cache"
.LC9539:
	.string	"Brand: "
.LC9540:
	.string	"Brand %d - "
.LC9541:
	.string	"Reserved\n"
.LC9542:
	.string	"Stepping: %d Reserved: %d\n"
	.text
	.align 16
	.globl	do_intel
	.type	do_intel, @function
do_intel:
.LFB223:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$40, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9512
	.cfi_def_cfa_offset 64
	call	printf
	movl	$1, %eax
/APP
/  100 "Source/arch/x86/cpuid/cpuid.c" 1
	cpuid
/  0 "" 2
/NO_APP
	movl	%ebx, 28(%esp)
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	andb	$2, %dh
	movl	%eax, %esi
	jne	.L1319
.L1265:
	movl	%esi, %edx
	movl	%esi, %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	andl	$15, %eax
	shrl	$12, %edx
	movl	%esi, %ebp
	movl	%eax, 12(%esp)
	andl	$3, %edx
	movl	%esi, %ebx
	pushl	%edx
	.cfi_def_cfa_offset 60
	shrl	$4, %ebp
	shrl	$8, %ebx
	movl	%esi, %edi
	andl	$15, %ebp
	andl	$15, %ebx
	movl	%edx, 20(%esp)
	pushl	$.LC9514
	.cfi_def_cfa_offset 64
	shrl	$14, %edi
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	8(%esp), %edx
	cmpl	$2, %edx
	je	.L1267
	cmpl	$3, %edx
	je	.L1268
	cmpl	$1, %edx
	je	.L1269
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9515
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.L1270:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9437
	.cfi_def_cfa_offset 64
	call	printf
	popl	%eax
	.cfi_def_cfa_offset 60
	popl	%edx
	.cfi_def_cfa_offset 56
	pushl	%ebx
	.cfi_def_cfa_offset 60
	pushl	$.LC9518
	.cfi_def_cfa_offset 64
	call	printf
	leal	-3(%ebx), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	$12, %eax
	ja	.L1271
	jmp	*.L1273(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1273:
	.long	.L1272
	.long	.L1274
	.long	.L1275
	.long	.L1276
	.long	.L1271
	.long	.L1271
	.long	.L1271
	.long	.L1271
	.long	.L1271
	.long	.L1271
	.long	.L1271
	.long	.L1271
	.long	.L1277
	.text
	.align 16
.L1269:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9516
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1270
	.align 16
.L1319:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9513
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1265
	.align 16
.L1268:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC2
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1270
	.align 16
.L1267:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9517
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1270
	.align 16
.L1277:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9520
	.cfi_def_cfa_offset 64
	call	printf
	movl	$.LC9437, (%esp)
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.L1279:
	movl	%esi, %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	shrl	$20, %eax
	movzbl	%al, %eax
	pushl	%eax
	.cfi_def_cfa_offset 60
	pushl	$.LC9521
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	.align 16
.L1280:
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%ebp
	.cfi_def_cfa_offset 60
	pushl	$.LC9522
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	$5, %ebx
	je	.L1282
	cmpl	$6, %ebx
	je	.L1283
	cmpl	$4, %ebx
	je	.L1320
.L1281:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9437
	.cfi_def_cfa_offset 64
	call	printf
	movl	$-2147483648, %eax
/APP
/  222 "Source/arch/x86/cpuid/cpuid.c" 1
	cpuid
/  0 "" 2
/NO_APP
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	$-2147483645, %eax
	ja	.L1321
	movzbl	12(%esp), %ebx
	testl	%ebx, %ebx
	je	.L1306
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%ebx
	.cfi_def_cfa_offset 60
	pushl	$.LC9540
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	$23, %ebx
	jg	.L1307
	cmpl	$1713, %esi
	je	.L1310
	cmpl	$3859, %esi
	je	.L1310
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	Intel(,%ebx,4)
	.cfi_def_cfa_offset 60
	pushl	$.LC0
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.L1306:
	subl	$4, %esp
	.cfi_def_cfa_offset 52
	pushl	%edi
	.cfi_def_cfa_offset 56
	pushl	12(%esp)
	.cfi_def_cfa_offset 60
	pushl	$.LC9542
	.cfi_def_cfa_offset 64
	call	printf
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L1276:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9519
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.L1278:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9437
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1280
	.align 16
.L1275:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9372
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1278
	.align 16
.L1274:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9371
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1278
	.align 16
.L1272:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9370
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1278
	.align 16
.L1271:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9437
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	$15, %ebx
	jne	.L1280
	jmp	.L1279
	.align 16
.L1321:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9539
	.cfi_def_cfa_offset 64
	call	printf
	movl	$-2147483646, %eax
/APP
/  231 "Source/arch/x86/cpuid/cpuid.c" 1
	cpuid
/  0 "" 2
/NO_APP
	pushl	%edx
	.cfi_def_cfa_offset 68
	pushl	%ecx
	.cfi_def_cfa_offset 72
	pushl	%ebx
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	printregs
	movl	$-2147483645, %eax
/APP
/  235 "Source/arch/x86/cpuid/cpuid.c" 1
	cpuid
/  0 "" 2
/NO_APP
	addl	$32, %esp
	.cfi_def_cfa_offset 48
	pushl	%edx
	.cfi_def_cfa_offset 52
	pushl	%ecx
	.cfi_def_cfa_offset 56
	pushl	%ebx
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	printregs
	movl	$-2147483644, %eax
/APP
/  239 "Source/arch/x86/cpuid/cpuid.c" 1
	cpuid
/  0 "" 2
/NO_APP
	pushl	%edx
	.cfi_def_cfa_offset 68
	pushl	%ecx
	.cfi_def_cfa_offset 72
	pushl	%ebx
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	printregs
	addl	$20, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9437
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1306
	.align 16
.L1282:
	cmpl	$2, %ebp
	je	.L1293
	jle	.L1322
	cmpl	$3, %ebp
	je	.L1296
	cmpl	$4, %ebp
	jne	.L1281
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9533
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1320:
	cmpl	$8, %ebp
	ja	.L1281
	jmp	*.L1286(,%ebp,4)
	.section	.rodata
	.align 4
	.align 4
.L1286:
	.long	.L1285
	.long	.L1285
	.long	.L1287
	.long	.L1288
	.long	.L1289
	.long	.L1290
	.long	.L1281
	.long	.L1291
	.long	.L1292
	.text
	.align 16
.L1283:
	cmpl	$8, %ebp
	ja	.L1281
	jmp	*.L1299(,%ebp,4)
	.section	.rodata
	.align 4
	.align 4
.L1299:
	.long	.L1281
	.long	.L1298
	.long	.L1281
	.long	.L1300
	.long	.L1281
	.long	.L1301
	.long	.L1302
	.long	.L1303
	.long	.L1304
	.text
	.align 16
.L1310:
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	Intel_Other(,%ebx,4)
	.cfi_def_cfa_offset 60
	pushl	$.LC0
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1306
	.align 16
.L1307:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9541
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1306
	.align 16
.L1322:
	cmpl	$1, %ebp
	jne	.L1281
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9530
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1296:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9532
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1293:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9531
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1304:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9538
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1303:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9537
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1302:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9536
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1301:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9535
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1300:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9534
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1298:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9519
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1292:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9529
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1291:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9528
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1290:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9527
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1289:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9526
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1288:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9525
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1287:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9524
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.align 16
.L1285:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC9523
	.cfi_def_cfa_offset 64
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L1281
	.cfi_endproc
.LFE223:
	.size	do_intel, .-do_intel
	.section	.rodata
.LC9543:
	.string	"%s"
	.text
	.align 16
	.globl	printregs
	.type	printregs, @function
printregs:
.LFB224:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	xorl	%eax, %eax
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	64(%esp), %edi
	movl	68(%esp), %esi
	leal	15(%esp), %edx
	movb	$0, 31(%esp)
.L1324:
	leal	0(,%eax,8), %ecx
	movl	%edi, %ebp
	sarl	%cl, %ebp
	movl	%ebp, %ebx
	movl	%esi, %ebp
	sarl	%cl, %ebp
	movb	%bl, (%edx,%eax)
	movl	%ebp, %ebx
	movl	72(%esp), %ebp
	movb	%bl, 19(%esp,%eax)
	sarl	%cl, %ebp
	movl	%ebp, %ebx
	movb	%bl, 23(%esp,%eax)
	movl	76(%esp), %ebx
	sarl	%cl, %ebx
	movb	%bl, 27(%esp,%eax)
	addl	$1, %eax
	cmpl	$4, %eax
	jne	.L1324
	subl	$8, %esp
	.cfi_def_cfa_offset 72
	pushl	%edx
	.cfi_def_cfa_offset 76
	pushl	$.LC9543
	.cfi_def_cfa_offset 80
	call	printf
	addl	$60, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE224:
	.size	printregs, .-printregs
	.section	.rodata
.LC9544:
	.string	"AMD Specific Features:\n"
.LC9545:
	.string	"Family: %d Model: %d ["
.LC9546:
	.string	"486 Model %d"
.LC9547:
	.string	"K6 Model %d"
.LC9548:
	.string	"K6-2 Model 8"
.LC9549:
	.string	"K6-III Model 9"
.LC9550:
	.string	"K5/K6 Model %d"
.LC9551:
	.string	"Athlon Model %d"
.LC9552:
	.string	"Duron Model 3"
	.align 4
.LC9553:
	.string	"Athlon MP/Mobile Athlon Model 6"
.LC9554:
	.string	"Mobile Duron Model 7"
.LC9555:
	.string	"Duron/Athlon Model %d"
.LC9556:
	.string	"]\n"
.LC9557:
	.string	"Detected Processor Name: "
	.align 4
.LC9558:
	.string	"Temperature Sensing Diode Detected!\n"
	.text
	.align 16
	.globl	do_amd
	.type	do_amd, @function
do_amd:
.LFB225:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	$1, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$24, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9544
	.cfi_def_cfa_offset 48
	call	printf
	movl	%edi, %eax
/APP
/  279 "Source/arch/x86/cpuid/cpuid.c" 1
	cpuid
/  0 "" 2
/NO_APP
	movl	%eax, %ebp
	movl	%eax, %ebx
	addl	$12, %esp
	.cfi_def_cfa_offset 36
	shrl	$4, %ebp
	shrl	$8, %ebx
	movl	%eax, %esi
	andl	$15, %ebp
	andl	$15, %ebx
	pushl	%ebp
	.cfi_def_cfa_offset 40
	pushl	%ebx
	.cfi_def_cfa_offset 44
	pushl	$.LC9545
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	cmpl	$5, %ebx
	je	.L1329
	cmpl	$6, %ebx
	je	.L1330
	cmpl	$4, %ebx
	je	.L1356
.L1328:
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9556
	.cfi_def_cfa_offset 48
	call	printf
	movl	$-2147483648, %eax
/APP
/  333 "Source/arch/x86/cpuid/cpuid.c" 1
	cpuid
/  0 "" 2
/NO_APP
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	movl	%eax, %edi
	je	.L1342
	cmpl	$-2147483647, %eax
	ja	.L1357
.L1344:
	movl	%esi, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	andl	$15, %esi
	shrl	$12, %eax
	pushl	%eax
	.cfi_def_cfa_offset 40
	pushl	%esi
	.cfi_def_cfa_offset 44
	pushl	$.LC9542
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.L1342:
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L1356:
	.cfi_restore_state
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	%ebp
	.cfi_def_cfa_offset 44
	pushl	$.LC9546
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1328
	.align 16
.L1330:
	cmpl	$7, %ebp
	ja	.L1336
	jmp	*.L1338(,%ebp,4)
	.section	.rodata
	.align 4
	.align 4
.L1338:
	.long	.L1336
	.long	.L1337
	.long	.L1337
	.long	.L1339
	.long	.L1337
	.long	.L1336
	.long	.L1340
	.long	.L1341
	.text
	.align 16
.L1329:
	cmpl	$9, %ebp
	jg	.L1332
	movl	%ebp, %ecx
	sall	%cl, %edi
	testl	$207, %edi
	jne	.L1333
	testl	$512, %edi
	jne	.L1334
	andl	$256, %edi
	jne	.L1358
.L1332:
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	%ebp
	.cfi_def_cfa_offset 44
	pushl	$.LC9550
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1328
	.align 16
.L1357:
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	movl	$-2147483646, %ebp
	pushl	$.LC9557
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.L1345:
	movl	%ebp, %eax
/APP
/  341 "Source/arch/x86/cpuid/cpuid.c" 1
	cpuid
/  0 "" 2
/NO_APP
	pushl	%edx
	.cfi_def_cfa_offset 36
	pushl	%ecx
	.cfi_def_cfa_offset 40
	addl	$1, %ebp
	pushl	%ebx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	call	printregs
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	cmpl	$-2147483643, %ebp
	jne	.L1345
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9437
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	cmpl	$-2147483642, %edi
	jbe	.L1344
	movl	$-2147483641, %eax
/APP
/  347 "Source/arch/x86/cpuid/cpuid.c" 1
	cpuid
/  0 "" 2
/NO_APP
	andl	$1, %edx
	je	.L1344
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9558
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1344
	.align 16
.L1341:
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9554
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1328
	.align 16
.L1340:
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9553
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1328
	.align 16
.L1339:
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9552
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1328
	.align 16
.L1337:
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	%ebp
	.cfi_def_cfa_offset 44
	pushl	$.LC9551
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1328
	.align 16
.L1336:
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	%ebp
	.cfi_def_cfa_offset 44
	pushl	$.LC9555
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1328
	.align 16
.L1358:
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9548
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1328
	.align 16
.L1333:
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	%ebp
	.cfi_def_cfa_offset 44
	pushl	$.LC9547
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1328
	.align 16
.L1334:
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9549
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1328
	.cfi_endproc
.LFE225:
	.size	do_amd, .-do_amd
	.globl	processID
	.data
	.align 4
	.type	processID, @object
	.size	processID, 4
processID:
	.long	10
	.section	.rodata
.LC9559:
	.string	"\nB"
.LC9560:
	.string	"\n Something went wrong"
	.text
	.align 16
	.globl	kmalloc_int
	.type	kmalloc_int, @function
kmalloc_int:
.LFB229:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	movl	96(%esp), %eax
	testl	%eax, %eax
	jne	.L1360
	movl	$0, 60(%esp)
.L1361:
	movl	60(%esp), %edx
	testl	%edx, %edx
	jne	.L1362
	movl	100(%esp), %ecx
	movl	$1, 60(%esp)
	testl	%ecx, %ecx
	je	.L1364
	movl	$1, 24(%esp)
	movl	$0, 20(%esp)
.L1366:
	movl	system_dir, %ebx
	movl	Mblock, %ecx
	xorl	%ebp, %ebp
	movl	$20, 12(%esp)
	movl	%ebx, 16(%esp)
	movl	20(%esp), %ebx
.L1384:
	movl	16(%esp), %eax
	movl	12(%esp), %edi
	movl	(%eax,%edi,4), %edx
	testb	$8, %dh
	jne	.L1399
	andl	$-4096, %edx
	xorl	%edi, %edi
	jmp	.L1383
	.align 16
.L1443:
	leal	1(%ebp), %eax
	cmpl	%ebx, %eax
	je	.L1442
	addl	$1, %edi
	movl	%eax, %ebp
	cmpl	$1024, %edi
	je	.L1367
.L1383:
	movl	(%edx,%edi,4), %eax
	shrl	$12, %eax
	leal	(%ecx,%eax,8), %esi
	cmpw	$0, 10(%esi)
	je	.L1443
	addl	$1, %edi
	xorl	%ebp, %ebp
	cmpl	$1024, %edi
	jne	.L1383
.L1367:
	addl	$1, 12(%esp)
	movl	12(%esp), %eax
	cmpl	$1024, %eax
	jne	.L1384
.L1396:
	subl	$12, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC9560
	.cfi_def_cfa_offset 112
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	movl	$0, 32(%esp)
.L1359:
	movl	32(%esp), %eax
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L1362:
	.cfi_restore_state
	cmpl	$4095, %eax
	ja	.L1404
	movl	100(%esp), %edx
	testl	%edx, %edx
	jne	.L1404
.L1364:
	movl	system_dir, %eax
	movl	$20, 36(%esp)
	movl	%eax, 44(%esp)
	movl	Mblock, %eax
	addl	$163840, %eax
	movl	%eax, 40(%esp)
.L1395:
	movl	36(%esp), %ebx
	movl	44(%esp), %edi
	movl	40(%esp), %eax
	movl	(%edi,%ebx,4), %edi
	movl	%eax, 16(%esp)
	movl	%eax, 12(%esp)
	movl	%edi, %ebp
	movl	%ebx, %edi
	sall	$22, %ebx
	sall	$10, %edi
	andl	$-4096, %ebp
	movl	%edi, 20(%esp)
	leal	4096(%ebp), %edi
	movl	%edi, 24(%esp)
	jmp	.L1394
	.align 16
.L1446:
	movl	%edi, %eax
	orb	$4, %ah
	movl	%eax, 0(%ebp)
	movl	12(%esp), %eax
	cmpw	$0, 10(%eax)
	je	.L1444
.L1386:
	addl	$4, %ebp
	addl	$1, 20(%esp)
	addl	$8, 12(%esp)
	addl	$4096, %ebx
	addl	$8, 16(%esp)
	cmpl	24(%esp), %ebp
	je	.L1445
.L1394:
	movl	0(%ebp), %edi
	testl	$1024, %edi
	je	.L1446
	testl	$2048, %edi
	jne	.L1386
	movl	16(%esp), %ecx
	movl	60(%esp), %eax
	movzwl	10(%ecx), %edx
	negl	%eax
	leal	4092(,%eax,4), %eax
	cmpl	%eax, %edx
	ja	.L1386
	movl	60(%esp), %eax
	movl	%edi, 28(%esp)
	xorl	%ecx, %ecx
	movl	%ebp, 32(%esp)
	xorl	%esi, %esi
	xorl	%ebp, %ebp
	addl	$1, %eax
	movl	%eax, %edx
	xorl	%eax, %eax
	movl	%edx, %edi
	jmp	.L1391
	.align 16
.L1387:
	movzwl	4092(%ebx), %edx
	cmpl	%esi, %edx
	je	.L1447
.L1390:
	addl	$1, %eax
	addl	$1, %ecx
	cmpl	$1024, %eax
	je	.L1448
.L1391:
	movl	(%ebx,%eax,4), %edx
	cmpw	$-22689, %dx
	jne	.L1387
	shrl	$16, %edx
	addl	$1, %esi
	subl	%edx, %ecx
	cmpl	%ecx, %edi
	jbe	.L1449
	movl	%eax, %ebp
	addl	$1, %eax
	xorl	%ecx, %ecx
	cmpl	$1024, %eax
	jne	.L1391
.L1448:
	movl	28(%esp), %edi
	movl	32(%esp), %ebp
	xorl	%eax, %eax
.L1392:
	addl	%ebx, %eax
	movl	60(%esp), %edx
	movl	%eax, %ecx
	movl	%eax, 32(%esp)
	movl	60(%esp), %eax
	sall	$16, %eax
	orl	$42847, %eax
	movl	%eax, (%ecx,%edx,4)
	movl	16(%esp), %ecx
	movl	60(%esp), %eax
	addw	$1, 4092(%ebx)
	sall	$2, %eax
	addw	10(%ecx), %ax
	cmpw	$4088, %ax
	movw	%ax, 10(%ecx)
	jbe	.L1359
	movl	%edi, %eax
	orb	$8, %ah
	movl	%eax, 0(%ebp)
	jmp	.L1359
	.align 16
.L1447:
	movl	$1023, %edx
	subl	%eax, %edx
	cmpl	%edx, %edi
	jnb	.L1390
	movl	32(%esp), %ebp
	movl	28(%esp), %edi
	movl	%eax, 28(%esp)
.L1389:
	movl	28(%esp), %eax
	testl	%eax, %eax
	js	.L1386
	movl	28(%esp), %eax
	sall	$2, %eax
	jmp	.L1392
	.align 16
.L1449:
	xorl	%eax, %eax
	cmpl	$1, %esi
	movl	%ebp, %ecx
	setne	%al
	movl	28(%esp), %edi
	movl	32(%esp), %ebp
	addl	%eax, %ecx
	movl	%ecx, 28(%esp)
	jmp	.L1389
.L1360:
	andl	$-4, %eax
	addl	$4, %eax
	movl	%eax, %edx
	shrl	$2, %edx
	movl	%edx, 60(%esp)
	jmp	.L1361
.L1404:
	movl	%eax, %edi
	shrl	$12, %edi
	andl	$4095, %eax
	movl	%edi, 20(%esp)
	movl	%eax, 24(%esp)
	je	.L1366
	cmpl	$3, %eax
	ja	.L1450
	movl	$0, 24(%esp)
	jmp	.L1366
	.align 16
.L1399:
	addl	$1, 12(%esp)
	xorl	%ebp, %ebp
	movl	12(%esp), %eax
	cmpl	$1024, %eax
	jne	.L1384
	jmp	.L1396
	.align 16
.L1442:
	movl	%ebp, 40(%esp)
	movl	20(%esp), %ebp
	movl	%edi, %ebx
	movl	%esi, 28(%esp)
	movl	%edx, 16(%esp)
	subl	%ebp, %ebx
	movl	%ebx, %esi
	movl	12(%esp), %ebx
	sall	$10, %ebx
	leal	1(%esi,%ebx), %ebx
	sall	$12, %ebx
	movl	%ebx, 32(%esp)
	leal	1(%edi), %ebx
	movl	%ebx, %edx
	movl	%ebx, 44(%esp)
	cmpl	%edx, %ebp
	ja	.L1369
	movl	%esi, %ebx
	movl	16(%esp), %esi
	testl	%ebp, %ebp
	leal	4(%esi,%ebx,4), %edi
	movl	%edi, 12(%esp)
	je	.L1451
	movzwl	blockID, %edi
	movzbl	curr_pgdir+6, %edx
	movl	20(%esp), %ebp
	movl	32(%esp), %ebx
	movw	%di, 36(%esp)
	sall	$8, %edi
	sall	$12, %ebp
	orl	%edx, %edi
	movl	12(%esp), %edx
	addl	%ebx, %ebp
	.align 16
.L1372:
	movl	%ebx, %esi
	addl	$4096, %ebx
	orl	$3072, (%edx)
	shrl	$12, %esi
	leal	(%ecx,%esi,8), %esi
	movl	%edx, 12(%esi)
	addl	$4, %edx
	cmpl	%ebp, %ebx
	movw	%di, 8(%esi)
	movw	$4096, 10(%esi)
	jne	.L1372
	movl	12(%esp), %edi
	leal	(%edi,%eax,4), %eax
	movl	%eax, 12(%esp)
.L1371:
	movl	24(%esp), %edi
	testl	%edi, %edi
	je	.L1373
	leal	4096(%ebx), %edx
	movl	12(%esp), %esi
	movl	%edx, %eax
	shrl	$12, %eax
	orl	$1024, (%esi)
	leal	(%ecx,%eax,8), %eax
	movzwl	36(%esp), %ecx
	movl	%esi, 12(%eax)
	movzbl	curr_pgdir+6, %esi
	sall	$8, %ecx
	orl	%esi, %ecx
	movw	%cx, 8(%eax)
	leal	1(%edi), %ecx
	sall	$2, %ecx
	movw	%cx, 10(%eax)
	movl	%edi, %eax
	sall	$16, %eax
	orl	$42847, %eax
	movl	%eax, (%edx,%edi,4)
	movl	$-1486946303, 8188(%ebx)
.L1373:
	movzwl	36(%esp), %eax
	addl	$1, %eax
	movw	%ax, blockID
	movl	32(%esp), %eax
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L1444:
	.cfi_restore_state
	movl	20(%esp), %eax
	movl	12(%esp), %ecx
	sall	$12, %eax
	movl	%ebp, 12(%ecx)
	movl	%eax, %edi
	movl	%eax, 32(%esp)
	movzbl	curr_pgdir+6, %eax
	orb	$1, %ah
	movw	%ax, 8(%ecx)
	movl	60(%esp), %eax
	movl	60(%esp), %edx
	addl	$1, %eax
	sall	$2, %eax
	movw	%ax, 10(%ecx)
	movl	60(%esp), %eax
	sall	$16, %eax
	orl	$42847, %eax
	movl	%eax, (%edi,%edx,4)
	movl	$-1486946303, 4092(%edi)
	movl	32(%esp), %eax
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L1445:
	.cfi_restore_state
	addl	$1, 36(%esp)
	addl	$8192, 40(%esp)
	movl	36(%esp), %eax
	cmpl	$1024, %eax
	jne	.L1395
	jmp	.L1396
.L1369:
	movl	16(%esp), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC9559
	.cfi_def_cfa_offset 112
	leal	(%eax,%edi,4), %ebx
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	movl	24(%esp), %ebp
	testl	%ebp, %ebp
	jne	.L1374
	movl	12(%esp), %edi
	movzwl	blockID, %eax
	movl	20(%esp), %ecx
	addl	$1, %edi
	movl	%edi, 16(%esp)
	movl	44(%esp), %edi
	movl	%ecx, 40(%esp)
	movw	%ax, 36(%esp)
	movzwl	%ax, %ecx
.L1375:
	movl	system_dir, %esi
	movl	28(%esp), %eax
	sall	$8, %ecx
	movl	40(%esp), %ebp
	orl	$1, %ecx
	movl	%ebx, 20(%esp)
	movw	%cx, 12(%esp)
	movl	%esi, 24(%esp)
	movl	Mblock, %esi
	addl	$8, %eax
	movl	%esi, 28(%esp)
	.align 16
.L1376:
	testl	%ebp, %ebp
	setne	%cl
	testl	%edi, %edi
	je	.L1381
	testb	%cl, %cl
	movl	%ebp, %edx
	movl	20(%esp), %ebx
	jne	.L1424
	jmp	.L1381
	.align 16
.L1452:
	testb	%cl, %cl
	je	.L1405
.L1424:
	movzwl	12(%esp), %esi
	movl	$4096, %ecx
	orl	$3072, (%ebx)
	subl	$8, %eax
	movl	%ebx, 12(%eax)
	movw	%cx, 10(%eax)
	subl	$4, %ebx
	movw	%si, 8(%eax)
	subl	$1, %edx
	leal	(%edx,%edi), %esi
	setne	%cl
	cmpl	%ebp, %esi
	jne	.L1452
.L1405:
	movl	%edx, %ebp
.L1381:
	movl	16(%esp), %esi
	movl	24(%esp), %edi
	movl	-8(%edi,%esi,4), %eax
	movl	%eax, %edx
	orb	$8, %ah
	andl	$-4096, %edx
	leal	4092(%edx), %ebx
	movl	4092(%edx), %edx
	movl	%ebx, 20(%esp)
	movl	%edi, %ebx
	movl	$1024, %edi
	movl	%eax, -8(%ebx,%esi,4)
	movl	28(%esp), %eax
	shrl	$12, %edx
	subl	$1, %esi
	movl	%esi, 16(%esp)
	leal	8(%eax,%edx,8), %eax
	je	.L1373
	testb	%cl, %cl
	jne	.L1376
	jmp	.L1373
.L1374:
	movl	(%ebx), %eax
	movl	24(%esp), %esi
	movl	28(%esp), %ebp
	movl	%eax, %edx
	orb	$4, %ah
	movl	%eax, (%ebx)
	movzwl	blockID, %eax
	andl	$-4096, %edx
	movl	%ebx, 12(%ebp)
	subl	$4, %ebx
	movzwl	%ax, %ecx
	movw	%ax, 36(%esp)
	movl	%ecx, %eax
	sall	$8, %eax
	orl	$1, %eax
	movw	%ax, 8(%ebp)
	movl	%esi, %eax
	addl	$1, %eax
	sall	$2, %eax
	movw	%ax, 10(%ebp)
	movl	%esi, %eax
	sall	$16, %eax
	orl	$42847, %eax
	movl	%eax, (%edx,%esi,4)
	movl	12(%esp), %eax
	movl	40(%esp), %esi
	movl	$-1486946303, 4092(%edx)
	addl	$1, %eax
	testl	%esi, %esi
	movl	%eax, 16(%esp)
	jne	.L1375
	jmp	.L1373
	.align 16
.L1451:
	movzwl	blockID, %eax
	movl	32(%esp), %ebx
	movw	%ax, 36(%esp)
	jmp	.L1371
.L1450:
	shrl	$2, 24(%esp)
	jmp	.L1366
	.cfi_endproc
.LFE229:
	.size	kmalloc_int, .-kmalloc_int
	.align 16
	.globl	kfree
	.type	kfree, @function
kfree:
.LFB230:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	system_dir, %esi
	movl	Mblock, %ebp
	movl	48(%esp), %edx
	movl	%edx, %eax
	movl	%edx, %ebx
	andl	$-4096, %eax
	shrl	$12, %ebx
	movl	%eax, 24(%esp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	$22, %eax
	andl	$1023, %ecx
	movl	24(%esp), %edi
	movl	(%esi,%eax,4), %eax
	addl	$4092, %edi
	andl	$-4096, %eax
	leal	(%eax,%ecx,4), %ecx
	movl	24(%esp), %eax
	shrl	$12, %eax
	cmpw	$-22689, 2(%edi)
	leal	0(%ebp,%eax,8), %ebp
	je	.L1486
	movzwl	8(%ebp), %edi
	leal	8(%ebp), %eax
	.align 16
.L1463:
	movl	24(%esp), %edx
	leal	4096(%edx), %ebp
	.align 16
.L1465:
	addl	$4, %edx
	movl	$0, -4(%edx)
	cmpl	%ebp, %edx
	jne	.L1465
	movl	24(%esp), %edx
	andl	$-3073, (%ecx)
	xorl	%ebp, %ebp
	movl	BITMAP_LOCATION, %ecx
	addl	$8, %eax
	shrl	$12, %edx
	movl	$0, (%ecx,%edx,4)
	xorl	%ecx, %ecx
	movl	24(%esp), %edx
	movw	%bp, -8(%eax)
	movl	%ebx, %ebp
	movw	%cx, -6(%eax)
	movl	$0, -4(%eax)
	shrl	$10, %ebp
	movl	4(%eax), %ecx
	addl	$1, %ebx
	andl	$-2049, (%esi,%ebp,4)
	addl	$4096, %edx
	movl	%edx, 24(%esp)
	movl	24(%esp), %edx
	addl	$4092, %edx
	cmpw	(%eax), %di
	jne	.L1453
	cmpw	$-22689, 2(%edx)
	jne	.L1463
	movl	24(%esp), %edi
	cmpw	$-22689, (%edi)
	movl	%edi, (%esp)
	je	.L1474
	xorl	%edi, %edi
	movl	%eax, 4(%esp)
	jmp	.L1473
.L1487:
	movl	%ebp, %edi
.L1473:
	movl	(%esp), %eax
	leal	1(%edi), %ebp
	cmpw	$-22689, (%eax,%ebp,4)
	jne	.L1487
	leal	2(%edi), %ebp
	movl	4(%esp), %eax
	leal	0(,%ebp,4), %edi
	movw	%di, 4(%esp)
	xorl	%edi, %edi
	testl	%ebp, %ebp
	je	.L1488
	movl	%eax, 8(%esp)
.L1479:
	movl	(%esp), %eax
	movl	$0, (%eax,%edi,4)
	addl	$1, %edi
	cmpl	%ebp, %edi
	jne	.L1479
	movl	8(%esp), %eax
.L1468:
	movzwl	4(%esp), %edi
	subw	%di, 2(%eax)
	movl	(%ecx), %edi
	subw	$1, (%edx)
	movl	%edi, %ebp
	andl	$-2049, %ebp
	testl	%edx, %edx
	je	.L1470
	movl	%ebp, (%ecx)
.L1471:
	shrl	$10, %ebx
	andl	$-2049, (%esi,%ebx,4)
.L1453:
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L1486:
	.cfi_restore_state
	cmpw	$-22689, (%edx)
	je	.L1455
	xorl	%eax, %eax
	jmp	.L1462
.L1489:
	movl	%ebx, %eax
.L1462:
	leal	1(%eax), %ebx
	cmpw	$-22689, (%edx,%ebx,4)
	jne	.L1489
	addl	$2, %eax
	testl	%eax, %eax
	leal	0(,%eax,4), %ebx
	je	.L1490
.L1478:
	addl	$4, %edx
	subl	$1, %eax
	movl	$0, -4(%edx)
	jne	.L1478
.L1458:
	subw	%bx, 10(%ebp)
	subw	$1, (%edi)
	andl	$-2049, (%ecx)
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L1470:
	.cfi_restore_state
	andl	$-3073, %edi
	xorl	%ebp, %ebp
	xorl	%edx, %edx
	movl	%edi, (%ecx)
	xorl	%ecx, %ecx
	movw	%bp, 2
	movw	%dx, 2(%eax)
	movw	%cx, (%eax)
	movl	$0, 4(%eax)
	jmp	.L1471
.L1488:
	xorl	%edi, %edi
	movw	%di, 4(%esp)
	jmp	.L1468
.L1474:
	movl	(%esp), %edi
	movl	$0, (%edi)
	movl	$4, %edi
	movw	%di, 4(%esp)
	jmp	.L1468
.L1490:
	xorl	%ebx, %ebx
	jmp	.L1458
.L1455:
	movl	$0, (%edx)
	movl	$4, %ebx
	jmp	.L1458
	.cfi_endproc
.LFE230:
	.size	kfree, .-kfree
	.align 16
	.globl	kmalloc_aligned
	.type	kmalloc_aligned, @function
kmalloc_aligned:
.LFB232:
	.cfi_startproc
	subl	$20, %esp
	.cfi_def_cfa_offset 24
	pushl	$1
	.cfi_def_cfa_offset 28
	pushl	28(%esp)
	.cfi_def_cfa_offset 32
	call	kmalloc_int
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE232:
	.size	kmalloc_aligned, .-kmalloc_aligned
	.align 16
	.globl	kmalloc
	.type	kmalloc, @function
kmalloc:
.LFB415:
	.cfi_startproc
	jmp	fsalloc
	.cfi_endproc
.LFE415:
	.size	kmalloc, .-kmalloc
	.globl	mtalc_start
	.section	.rodata
	.align 4
	.type	mtalc_start, @object
	.size	mtalc_start, 4
mtalc_start:
	.long	230686720
	.globl	mtalc_end
	.align 4
	.type	mtalc_end, @object
	.size	mtalc_end, 4
mtalc_end:
	.long	524288000
	.align 4
.LC9561:
	.string	"\nCould not find memory, sorry. Try kmalloc()"
	.text
	.align 16
	.globl	mtalloc
	.type	mtalloc, @function
mtalloc:
.LFB234:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	xorl	%ecx, %ecx
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	system_dir, %eax
	movl	32(%esp), %esi
	leal	220(%eax), %edi
	leal	504(%eax), %ebp
.L1498:
	movl	(%edi), %edx
	andl	$-4096, %edx
	leal	4096(%edx), %ebx
	jmp	.L1497
	.align 16
.L1505:
	addl	$1, %ecx
	cmpl	%esi, %ecx
	je	.L1503
	addl	$4, %edx
	cmpl	%edx, %ebx
	je	.L1504
.L1497:
	movl	(%edx), %eax
	testb	$4, %ah
	je	.L1505
	addl	$4, %edx
	xorl	%ecx, %ecx
	cmpl	%edx, %ebx
	jne	.L1497
.L1504:
	addl	$4, %edi
	cmpl	%edi, %ebp
	jne	.L1498
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9561
	.cfi_def_cfa_offset 48
	call	_printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	jmp	.L1494
	.align 16
.L1503:
	movl	%eax, %ecx
	andl	$-4096, %eax
	orb	$4, %ch
	movl	%ecx, (%edx)
.L1494:
	addl	$12, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE234:
	.size	mtalloc, .-mtalloc
	.align 16
	.globl	mtfree
	.type	mtfree, @function
mtfree:
.LFB235:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %ecx
	movl	system_dir, %edx
	movl	12(%esp), %ebx
	shrl	$10, %ecx
	movl	%ecx, %eax
	movl	_cur_directory, %ecx
	movl	901120(%edx), %edx
	andl	$4092, %eax
	movl	901120(%ecx), %ecx
	andl	$-4096, %edx
	addl	%eax, %edx
	andl	$-4096, %ecx
	addl	%eax, %ecx
	testl	%ebx, %ebx
	je	.L1506
	xorl	%eax, %eax
	.align 16
.L1510:
	andl	$-1025, (%edx,%eax,4)
	movl	$0, (%ecx,%eax,4)
	addl	$1, %eax
	cmpl	%ebx, %eax
	jne	.L1510
.L1506:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE235:
	.size	mtfree, .-mtfree
	.align 16
	.globl	fsalloc
	.type	fsalloc, @function
fsalloc:
.LFB236:
	.cfi_startproc
	subl	$20, %esp
	.cfi_def_cfa_offset 24
	pushl	$0
	.cfi_def_cfa_offset 28
	pushl	28(%esp)
	.cfi_def_cfa_offset 32
	call	kmalloc_int
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE236:
	.size	fsalloc, .-fsalloc
	.section	.rodata
	.align 4
.LC9562:
	.string	"\nNo Physical Memory space left!!!!!"
	.text
	.align 16
	.globl	alloc_page
	.type	alloc_page, @function
alloc_page:
.LFB245:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$25600, %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movl	BITMAP_LOCATION, %ecx
	movl	16(%esp), %ebx
	leal	102400(%ecx), %edx
	addl	$4194304, %ecx
	jmp	.L1519
	.align 16
.L1516:
	addl	$4, %edx
	addl	$1, %eax
	cmpl	%edx, %ecx
	je	.L1526
.L1519:
	cmpl	$0, (%edx)
	jne	.L1516
	sall	$12, %eax
	movl	%eax, %ecx
	shrl	$9, %ecx
	addl	Mblock, %ecx
	testl	%eax, %eax
	movw	$4097, 8(%ecx)
	movw	$4096, 10(%ecx)
	movl	$4096, (%edx)
	je	.L1515
	movl	(%ebx), %edx
	andl	$-2147479553, %edx
	orl	$1, %edx
	orl	%edx, %eax
	movl	%eax, (%ebx)
	movl	$1, %eax
.L1515:
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L1526:
	.cfi_restore_state
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9562
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE245:
	.size	alloc_page, .-alloc_page
	.align 16
	.globl	free_page
	.type	free_page, @function
free_page:
.LFB246:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %ebx
	movl	(%ebx), %eax
	movl	%eax, %edx
	andl	$2147479552, %edx
	je	.L1528
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%edx
	.cfi_def_cfa_offset 32
	call	free
	movl	(%ebx), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L1528:
	andl	$-2, %eax
	movl	%eax, (%ebx)
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE246:
	.size	free_page, .-free_page
	.align 16
	.globl	switch_pdirectory
	.type	switch_pdirectory, @function
switch_pdirectory:
.LFB249:
	.cfi_startproc
	movl	4(%esp), %eax
	testl	%eax, %eax
	je	.L1535
	movl	%eax, curr_pgdir
	movl	%eax, _cur_directory
/APP
/  9 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
	movl	$1, %eax
	ret
	.align 16
.L1535:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE249:
	.size	switch_pdirectory, .-switch_pdirectory
	.align 16
	.globl	Switch_Page_Directory
	.type	Switch_Page_Directory, @function
Switch_Page_Directory:
.LFB250:
	.cfi_startproc
	movl	4(%esp), %eax
	testl	%eax, %eax
	je	.L1540
	movl	in_system_dir, %edx
	testl	%edx, %edx
	jne	.L1538
	movl	system_dir, %edx
/APP
/  89 "Source/MemManagement/paging.c" 1
	mov %edx, %cr3
/  0 "" 2
/NO_APP
	movl	_cur_directory, %edx
	movl	multitasking_ON, %ecx
	movl	%edx, _prev_directory
	movl	system_dir, %edx
	testl	%ecx, %ecx
	movl	%edx, _cur_directory
	je	.L1539
	movl	current_task, %ecx
	movl	%edx, 12(%ecx)
.L1538:
/APP
/  9 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
	movl	%eax, curr_pgdir
	movl	%eax, _cur_directory
	movl	$1, %eax
	ret
	.align 16
.L1539:
	movl	$1, in_system_dir
	jmp	.L1538
	.align 16
.L1540:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE250:
	.size	Switch_Page_Directory, .-Switch_Page_Directory
	.align 16
	.globl	get_directory
	.type	get_directory, @function
get_directory:
.LFB251:
	.cfi_startproc
	movl	curr_pgdir, %eax
	ret
	.cfi_endproc
.LFE251:
	.size	get_directory, .-get_directory
	.align 16
	.globl	flush_tlb_entry
	.type	flush_tlb_entry, @function
flush_tlb_entry:
.LFB252:
	.cfi_startproc
/APP
/  210 "Source/MemManagement/paging.c" 1
	cli
/  0 "" 2
/NO_APP
	movl	4(%esp), %eax
/APP
/  211 "Source/MemManagement/paging.c" 1
	invlpg (%eax)
/  0 "" 2
/  212 "Source/MemManagement/paging.c" 1
	sti
/  0 "" 2
/NO_APP
	ret
	.cfi_endproc
.LFE252:
	.size	flush_tlb_entry, .-flush_tlb_entry
	.align 16
	.globl	map
	.type	map, @function
map:
.LFB254:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	pag, %ecx
	movl	32(%esp), %ebx
	movl	40(%esp), %edi
	testl	%ecx, %ecx
	je	.L1544
	movl	in_system_dir, %edx
	testl	%edx, %edx
	jne	.L1545
	movl	system_dir, %eax
/APP
/  89 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
	movl	_cur_directory, %eax
	movl	multitasking_ON, %edx
	movl	%eax, _prev_directory
	movl	system_dir, %eax
	testl	%edx, %edx
	movl	%eax, _cur_directory
	jne	.L1569
	movl	$1, in_system_dir
.L1550:
	movl	36(%esp), %esi
	addl	%ebx, %esi
	cmpl	%esi, %ebx
	jb	.L1556
.L1557:
	movl	pag, %eax
	testl	%eax, %eax
	je	.L1543
	movl	in_system_dir, %eax
	testl	%eax, %eax
	je	.L1543
	movl	multitasking_ON, %eax
	testl	%eax, %eax
	jne	.L1570
.L1559:
	movl	_prev_directory, %eax
	movl	$0, in_system_dir
	movl	%eax, _cur_directory
.L1560:
	movl	system_dir, %edx
	movl	%edx, _prev_directory
/APP
/  118 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
.L1543:
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L1544:
	.cfi_restore_state
	movl	36(%esp), %esi
	addl	%ebx, %esi
	cmpl	%esi, %ebx
	jnb	.L1543
	.align 16
.L1556:
	movl	%ebx, %eax
	shrl	$22, %eax
	leal	(%edi,%eax,4), %ecx
	movl	(%ecx), %edx
	testl	%edx, %edx
	jne	.L1551
	movl	BITMAP_LOCATION, %ebp
	movl	$25600, %edx
	leal	102400(%ebp), %eax
	addl	$4194304, %ebp
	jmp	.L1555
	.align 16
.L1552:
	addl	$4, %eax
	addl	$1, %edx
	cmpl	%ebp, %eax
	je	.L1571
.L1555:
	cmpl	$0, (%eax)
	jne	.L1552
	sall	$12, %edx
	movl	%edx, %ebp
	shrl	$9, %ebp
	addl	Mblock, %ebp
	testl	%edx, %edx
	movw	$4097, 8(%ebp)
	movw	$4096, 10(%ebp)
	movl	$4096, (%eax)
	je	.L1553
	orl	$3, %edx
	movl	%edx, (%ecx)
.L1551:
	movl	%ebx, %eax
	andl	$-4096, %edx
	movl	%ebx, %ecx
	shrl	$10, %eax
	orl	$3073, %ecx
	andl	$4092, %eax
	addl	%eax, %edx
	movl	(%edx), %eax
	andl	$-2147479553, %eax
	orl	%ecx, %eax
	movl	%eax, (%edx)
.L1553:
	addl	$4096, %ebx
	cmpl	%esi, %ebx
	jb	.L1556
	jmp	.L1557
	.align 16
.L1571:
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC9562
	.cfi_def_cfa_offset 48
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L1553
.L1545:
	movl	36(%esp), %esi
	addl	%ebx, %esi
	cmpl	%esi, %ebx
	jb	.L1556
	movl	multitasking_ON, %eax
	testl	%eax, %eax
	je	.L1559
.L1570:
	movl	current_task, %edx
	movl	32(%edx), %eax
	movl	%eax, _cur_directory
	movl	%eax, 12(%edx)
	jmp	.L1560
.L1569:
	movl	current_task, %edx
	movl	%eax, 12(%edx)
	jmp	.L1550
	.cfi_endproc
.LFE254:
	.size	map, .-map
	.section	.rodata
	.align 4
.LC9563:
	.string	"Making Default Page directories, This may take a while\n"
.LC9564:
	.string	" Cant get the Page! "
	.text
	.align 16
	.globl	initialise_paging
	.type	initialise_paging, @function
initialise_paging:
.LFB258:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9563
	.cfi_def_cfa_offset 32
	call	printf
	movzbl	PgDs, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movzbl	%al, %edx
	movzbl	%al, %ecx
	addl	$1, %eax
	addl	$1, %edx
	movl	$4194304, PgDirs(,%ecx,8)
	movb	%al, PgDs
	movw	%dx, PgDirs+6(,%ecx,8)
	movl	$4198400, %eax
	movl	$4194304, %ecx
	.align 16
.L1573:
	movl	%eax, %edx
	addl	$4096, %eax
	addl	$4, %ecx
	andb	$243, %dh
	orl	$3, %edx
	movl	%edx, -4(%ecx)
	cmpl	$8392704, %eax
	jne	.L1573
	movl	$4194304, system_dir
	xorl	%edx, %edx
	jmp	.L1575
.L1623:
	andl	$-4096, %eax
	andl	$1023, %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	(%ecx), %eax
	andl	$-2147479553, %eax
	orl	%edx, %eax
	addl	$4096, %edx
	andb	$243, %ah
	orl	$7, %eax
	cmpl	$-4096, %edx
	movl	%eax, (%ecx)
	je	.L1622
.L1575:
	movl	%edx, %eax
	movl	%edx, %ecx
	shrl	$22, %eax
	shrl	$12, %ecx
	movl	4194304(,%eax,4), %eax
	testl	%eax, %eax
	jne	.L1623
	subl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 28
	pushl	$.LC9564
	.cfi_def_cfa_offset 32
	call	printf
	movl	0, %eax
	ud2
.L1622:
	.cfi_restore_state
	movl	$4194304, curr_pgdir
	movl	$4194304, _cur_directory
	movl	$4194304, %eax
/APP
/  9 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/  348 "Source/MemManagement/paging.c" 1
	mov %cr0, %eax
/  0 "" 2
/NO_APP
	orl	$-2147483648, %eax
/APP
/  350 "Source/MemManagement/paging.c" 1
	mov %eax, %cr0
/  0 "" 2
/NO_APP
	movl	in_system_dir, %eax
	testl	%eax, %eax
	jne	.L1577
	movl	system_dir, %eax
/APP
/  89 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
	movl	_cur_directory, %eax
	movl	multitasking_ON, %edx
	movl	%eax, _prev_directory
	movl	system_dir, %eax
	testl	%edx, %edx
	movl	%eax, _cur_directory
	je	.L1578
	movl	current_task, %edx
	movl	%eax, 12(%edx)
.L1577:
	movl	BITMAP_LOCATION, %eax
	leal	102400(%eax), %edx
	leal	4194304(%eax), %ecx
	movl	$25600, %eax
	jmp	.L1581
.L1579:
	addl	$4, %edx
	addl	$1, %eax
	cmpl	%ecx, %edx
	je	.L1624
.L1581:
	movl	(%edx), %edi
	testl	%edi, %edi
	jne	.L1579
	sall	$12, %eax
	movl	$3, %ebx
	movl	$4096, %esi
	movl	%eax, %ecx
	movl	%eax, %edi
	shrl	$9, %ecx
	addl	Mblock, %ecx
	movw	%bx, 8(%ecx)
	movw	%si, 10(%ecx)
	movl	$2, (%edx)
.L1580:
	leal	4096(%edi), %eax
	movl	%edi, %esi
	.align 16
.L1582:
	addl	$4, %esi
	movl	$0, -4(%esi)
	cmpl	%eax, %esi
	jne	.L1582
	movzbl	PgDs, %eax
	movl	%edi, %ebx
	movzbl	%al, %edx
	movzbl	%al, %ecx
	addl	$1, %eax
	addl	$1, %edx
	movl	%edi, PgDirs(,%ecx,8)
	movb	%al, PgDs
	movw	%dx, PgDirs+6(,%ecx,8)
	.align 16
.L1587:
	movl	BITMAP_LOCATION, %ecx
	movl	$25600, %edx
	leal	102400(%ecx), %eax
	addl	$4194304, %ecx
	jmp	.L1585
	.align 16
.L1583:
	addl	$4, %eax
	addl	$1, %edx
	cmpl	%ecx, %eax
	je	.L1625
.L1585:
	cmpl	$0, (%eax)
	jne	.L1583
	sall	$12, %edx
	movl	%edx, %ecx
	shrl	$9, %ecx
	addl	Mblock, %ecx
	movw	$3, 8(%ecx)
	movw	$4096, 10(%ecx)
	movl	$2, (%eax)
	movl	%edx, %eax
.L1584:
	movl	%edx, (%ebx)
	leal	4096(%eax), %edx
	.align 16
.L1586:
	addl	$4, %eax
	movl	$0, -4(%eax)
	cmpl	%edx, %eax
	jne	.L1586
	movl	(%ebx), %eax
	addl	$4, %ebx
	andb	$243, %ah
	orl	$3, %eax
	movl	%eax, -4(%ebx)
	cmpl	%ebx, %esi
	jne	.L1587
	movl	in_system_dir, %eax
	testl	%eax, %eax
	je	.L1588
	movl	multitasking_ON, %eax
	testl	%eax, %eax
	je	.L1589
	movl	current_task, %edx
	movl	32(%edx), %eax
	movl	%eax, _cur_directory
	movl	%eax, 12(%edx)
.L1590:
	movl	system_dir, %edx
	movl	%edx, _prev_directory
/APP
/  118 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
	movl	in_system_dir, %eax
	movl	%edi, main_dir
	testl	%eax, %eax
	je	.L1605
.L1591:
	movl	BITMAP_LOCATION, %eax
	leal	102400(%eax), %edx
	leal	4194304(%eax), %ecx
	movl	$25600, %eax
	jmp	.L1595
.L1593:
	addl	$4, %edx
	addl	$1, %eax
	cmpl	%ecx, %edx
	je	.L1626
.L1595:
	movl	(%edx), %edi
	testl	%edi, %edi
	jne	.L1593
	sall	$12, %eax
	movl	$3, %ebx
	movl	$4096, %esi
	movl	%eax, %ecx
	movl	%eax, %edi
	shrl	$9, %ecx
	addl	Mblock, %ecx
	movw	%bx, 8(%ecx)
	movw	%si, 10(%ecx)
	movl	$2, (%edx)
.L1594:
	leal	4096(%edi), %eax
	movl	%edi, %esi
	.align 16
.L1596:
	addl	$4, %esi
	movl	$0, -4(%esi)
	cmpl	%eax, %esi
	jne	.L1596
	movzbl	PgDs, %eax
	movl	%edi, %ebx
	movzbl	%al, %edx
	movzbl	%al, %ecx
	addl	$1, %eax
	addl	$1, %edx
	movl	%edi, PgDirs(,%ecx,8)
	movb	%al, PgDs
	movw	%dx, PgDirs+6(,%ecx,8)
	.align 16
.L1601:
	movl	BITMAP_LOCATION, %ecx
	movl	$25600, %edx
	leal	102400(%ecx), %eax
	addl	$4194304, %ecx
	jmp	.L1599
	.align 16
.L1597:
	addl	$4, %eax
	addl	$1, %edx
	cmpl	%ecx, %eax
	je	.L1627
.L1599:
	cmpl	$0, (%eax)
	jne	.L1597
	sall	$12, %edx
	movl	%edx, %ecx
	shrl	$9, %ecx
	addl	Mblock, %ecx
	movw	$3, 8(%ecx)
	movw	$4096, 10(%ecx)
	movl	$2, (%eax)
	movl	%edx, %eax
.L1598:
	movl	%edx, (%ebx)
	leal	4096(%eax), %edx
	.align 16
.L1600:
	addl	$4, %eax
	movl	$0, -4(%eax)
	cmpl	%edx, %eax
	jne	.L1600
	movl	(%ebx), %eax
	addl	$4, %ebx
	andb	$243, %ah
	orl	$3, %eax
	movl	%eax, -4(%ebx)
	cmpl	%ebx, %esi
	jne	.L1601
	movl	in_system_dir, %eax
	testl	%eax, %eax
	je	.L1602
	movl	multitasking_ON, %eax
	testl	%eax, %eax
	je	.L1603
	movl	current_task, %edx
	movl	32(%edx), %eax
	movl	%eax, _cur_directory
	movl	%eax, 12(%edx)
.L1604:
	movl	system_dir, %edx
	movl	%edx, _prev_directory
/APP
/  118 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
.L1602:
	movl	PgDirs, %eax
	movl	PgDirs+4, %edx
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	movl	%edi, user_dir
	movl	%eax, curr_pgdir
	movl	main_dir, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	movl	%edx, curr_pgdir+4
	movl	%eax, _cur_directory
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.L1625:
	.cfi_restore_state
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9562
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L1584
.L1627:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9562
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L1598
.L1588:
	movl	%edi, main_dir
.L1605:
	movl	system_dir, %eax
/APP
/  89 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
	movl	_cur_directory, %eax
	movl	multitasking_ON, %edx
	movl	%eax, _prev_directory
	movl	system_dir, %eax
	testl	%edx, %edx
	movl	%eax, _cur_directory
	je	.L1592
	movl	current_task, %edx
	movl	%eax, 12(%edx)
	jmp	.L1591
.L1589:
	movl	_prev_directory, %eax
	movl	$0, in_system_dir
	movl	%eax, _cur_directory
	jmp	.L1590
.L1592:
	movl	$1, in_system_dir
	jmp	.L1591
.L1603:
	movl	_prev_directory, %eax
	movl	$0, in_system_dir
	movl	%eax, _cur_directory
	jmp	.L1604
.L1626:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	xorl	%edi, %edi
	pushl	$.LC9562
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L1594
.L1578:
	movl	$1, in_system_dir
	jmp	.L1577
.L1624:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	xorl	%edi, %edi
	pushl	$.LC9562
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L1580
	.cfi_endproc
.LFE258:
	.size	initialise_paging, .-initialise_paging
	.section	.rodata
.LC9565:
	.string	"\nSwitching Directory"
.LC9566:
	.string	"\nDirectory Switched"
.LC9567:
	.string	"\nEnabled paging\n"
	.text
	.align 16
	.globl	enable_paging
	.type	enable_paging, @function
enable_paging:
.LFB259:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$12, %esp
	.cfi_def_cfa_offset 20
	movl	main_dir, %ebx
	pushl	%ebx
	.cfi_def_cfa_offset 24
	pushl	$8388608
	.cfi_def_cfa_offset 28
	pushl	$0
	.cfi_def_cfa_offset 32
	call	map
	addl	$12, %esp
	.cfi_def_cfa_offset 20
	pushl	%ebx
	.cfi_def_cfa_offset 24
	pushl	$62914560
	.cfi_def_cfa_offset 28
	pushl	$33554432
	.cfi_def_cfa_offset 32
	call	map
	addl	$12, %esp
	.cfi_def_cfa_offset 20
	pushl	%ebx
	.cfi_def_cfa_offset 24
	pushl	$268431360
	.cfi_def_cfa_offset 28
	pushl	$-268435456
	.cfi_def_cfa_offset 32
	call	map
	movl	user_dir, %ebx
	addl	$12, %esp
	.cfi_def_cfa_offset 20
	pushl	%ebx
	.cfi_def_cfa_offset 24
	pushl	$8388608
	.cfi_def_cfa_offset 28
	pushl	$0
	.cfi_def_cfa_offset 32
	call	map
	addl	$12, %esp
	.cfi_def_cfa_offset 20
	pushl	%ebx
	.cfi_def_cfa_offset 24
	pushl	$62914560
	.cfi_def_cfa_offset 28
	pushl	$33554432
	.cfi_def_cfa_offset 32
	call	map
	addl	$12, %esp
	.cfi_def_cfa_offset 20
	pushl	%ebx
	.cfi_def_cfa_offset 24
	pushl	$268431360
	.cfi_def_cfa_offset 28
	pushl	$-268435456
	.cfi_def_cfa_offset 32
	call	map
	movl	$.LC9565, (%esp)
	call	printf
	movl	system_dir, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L1629
	movl	%eax, curr_pgdir
	movl	%eax, _cur_directory
/APP
/  9 "Source/MemManagement/paging.c" 1
	mov %eax, %cr3
/  0 "" 2
/NO_APP
.L1629:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9566
	.cfi_def_cfa_offset 32
	call	printf
	movl	$.LC9567, (%esp)
	movl	$1, pag
	movl	$-1, max_mem
	movl	$3062, mb_temp
	call	printf
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE259:
	.size	enable_paging, .-enable_paging
	.section	.rodata
	.align 4
.LC9568:
	.string	"\nSecondary Hard Disk sent you an Interrupt\n"
	.text
	.align 16
	.globl	HDD_A_Handler
	.type	HDD_A_Handler, @function
HDD_A_Handler:
.LFB263:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9568
	.cfi_def_cfa_offset 32
	call	printf
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE263:
	.size	HDD_A_Handler, .-HDD_A_Handler
	.section	.rodata
	.align 4
.LC9569:
	.string	"\nPrimary Hard Disk sent you an Interrupt\n"
	.text
	.align 16
	.globl	HDD_B_Handler
	.type	HDD_B_Handler, @function
HDD_B_Handler:
.LFB264:
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9569
	.cfi_def_cfa_offset 32
	call	printf
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE264:
	.size	HDD_B_Handler, .-HDD_B_Handler
	.section	.rodata
.LC9570:
	.string	" Drive 0xA0 exists "
	.align 4
.LC9571:
	.string	" Drive 0xA0 not compatible with ATA SPECS "
.LC9572:
	.string	"\nHard Disk Initialized\n"
.LC9573:
	.string	" PATA Info: Heads: "
.LC9574:
	.string	" Sectors: "
.LC9575:
	.string	" Cylinders: "
.LC9576:
	.string	" Bytes per Sector "
.LC9577:
	.string	" Bytes per Track "
.LC9578:
	.string	" Serial No: "
.LC9579:
	.string	" Drive 0xB0 exists "
	.align 4
.LC9580:
	.string	" Drive 0xB0 not compatible with ATA SPECS "
.LC9581:
	.string	"\nNO HARDDISK FOUND!!!\n"
	.text
	.align 16
	.globl	init_ata
	.type	init_ata, @function
init_ata:
.LFB265:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$503, %ebx
	movl	$-96, %eax
	movl	%ebx, %edx
	subl	$8, %esp
	.cfi_def_cfa_offset 16
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	xorl	%eax, %eax
	movl	$498, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$499, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$500, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$501, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$-20, %eax
	movl	%ebx, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	%al, %al
	je	.L1639
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	$1, %al
	je	.L1679
.L1639:
	movl	$503, %ebx
	movl	$-80, %eax
	movl	%ebx, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	xorl	%eax, %eax
	movl	$498, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$499, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$500, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$501, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$-20, %eax
	movl	%ebx, %edx
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	%al, %al
	je	.L1649
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	$1, %al
	je	.L1680
.L1649:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9581
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L1638:
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L1680:
	.cfi_restore_state
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9579
	.cfi_def_cfa_offset 32
	call	printf
	movl	%ebx, %edx
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testb	%al, %al
	jns	.L1650
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	$1, %al
	movl	$1000, %ecx
	jne	.L1676
	jmp	.L1650
	.align 16
.L1681:
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	$1, %al
	je	.L1650
	subl	$1, %ecx
	je	.L1638
.L1676:
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	%al, %al
	js	.L1681
.L1650:
	movl	$501, %edx
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	%al, %al
	jne	.L1654
	movl	$499, %edx
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	%al, %al
	jne	.L1654
	movl	$503, %edx
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	$8, %al
	je	.L1638
	movl	$ident, %ecx
	movl	$496, %edx
	.align 16
.L1656:
/APP
/  61 "Library/sys.h" 1
	inw %dx, %ax
/  0 "" 2
/NO_APP
	movw	%ax, (%ecx)
	addl	$2, %ecx
	cmpl	$ident+510, %ecx
	jne	.L1656
	movb	$83, HDD
.L1678:
	movl	$508, %edx
	movl	$2, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9572
	.cfi_def_cfa_offset 32
	call	printf
	movl	$.LC9573, (%esp)
	call	printf
	movzwl	ident+6, %eax
	movl	%eax, (%esp)
	call	console_write_dec
	movl	$.LC9574, (%esp)
	call	printf
	movzwl	ident+12, %eax
	movl	%eax, (%esp)
	call	console_write_dec
	movl	$.LC9575, (%esp)
	call	printf
	movzwl	ident+2, %eax
	movl	%eax, (%esp)
	call	console_write_dec
	movl	$.LC9576, (%esp)
	call	printf
	movzwl	ident+10, %eax
	movl	%eax, (%esp)
	call	console_write_dec
	movl	$.LC9577, (%esp)
	call	printf
	movzwl	ident+8, %eax
	movl	%eax, (%esp)
	call	console_write_dec
	movl	$.LC9578, (%esp)
	call	printf
	movl	$ident+20, (%esp)
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L1638
	.align 16
.L1679:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9570
	.cfi_def_cfa_offset 32
	call	printf
	movl	%ebx, %edx
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testb	%al, %al
	movl	$1000, %ecx
	js	.L1667
	jmp	.L1641
	.align 16
.L1644:
	subl	$1, %ecx
	je	.L1638
.L1667:
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	%al, %al
	js	.L1644
.L1641:
	movl	$501, %edx
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	%al, %al
	jne	.L1645
	movl	$499, %edx
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	%al, %al
	jne	.L1645
	movl	$503, %edx
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	testb	$8, %al
	je	.L1638
	movl	$ident, %ecx
	movl	$ident+510, %ebx
	movl	$496, %edx
	.align 16
.L1648:
/APP
/  61 "Library/sys.h" 1
	inw %dx, %ax
/  0 "" 2
/NO_APP
	movw	%ax, (%ecx)
	addl	$2, %ecx
	cmpl	%ecx, %ebx
	jne	.L1648
	movb	$80, HDD
	jmp	.L1678
	.align 16
.L1654:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9580
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L1638
	.align 16
.L1645:
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC9571
	.cfi_def_cfa_offset 32
	call	printf
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L1638
	.cfi_endproc
.LFE265:
	.size	init_ata, .-init_ata
	.align 16
	.globl	read_ata
	.type	read_ata, @function
read_ata:
.LFB266:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$497, %edx
	movl	8(%esp), %ecx
	xorl	%eax, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$498, %edx
	movl	$1, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$499, %edx
	movl	%ecx, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	%ecx, %eax
	movl	$500, %edx
	shrl	$8, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	%ecx, %eax
	movl	$501, %edx
	shrl	$16, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movzbl	drive, %eax
	shrl	$24, %ecx
	movl	$502, %edx
	andl	$15, %ecx
	sall	$4, %eax
	orl	$-32, %eax
	orl	%ecx, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	movl	$503, %edx
	movl	$32, %eax
/APP
/  37 "Library/sys.h" 1
	outb %al, %dx
/  0 "" 2
	.align 16
/NO_APP
.L1683:
/APP
/  45 "Library/sys.h" 1
	inb %dx, %al