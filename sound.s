	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L2
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	mov	r6, #0
	mov	r0, #67108864
	mov	r5, r2
	ldr	r9, .L6+8
	mov	r7, r1
	ldr	r2, .L6+12
	mov	r10, r3
	mov	r1, r8
	str	r6, [r0, #196]
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L6+16
	mov	lr, pc
	bx	r4
	strh	r6, [r9, #2]	@ movhi
	mov	r1, r5
	ldr	r3, .L6+20
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r3, #128
	rsb	r0, r0, #0
	ldr	r4, .L6+24
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r9]	@ movhi
	ldr	fp, .L6+28
	strh	r3, [r9, #2]	@ movhi
	mov	r0, r7
	str	r8, [r4]
	str	r6, [r4, #28]
	mov	lr, pc
	bx	fp
	ldr	r6, .L6+32
	adr	r3, .L6
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	fp
	ldr	r6, .L6+36
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L6+40
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	r10, [r4, #16]
	str	r7, [r4, #4]
	str	r5, [r4, #8]
	str	r3, [r4, #12]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	.align	3
.L6:
	.word	1443109011
	.word	1078844686
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	mov	r6, #0
	mov	r0, #67108864
	mov	r5, r2
	ldr	r9, .L10+8
	mov	r7, r1
	ldr	r2, .L10+12
	mov	r10, r3
	mov	r1, r8
	str	r6, [r0, #208]
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L10+16
	mov	lr, pc
	bx	r4
	strh	r6, [r9, #6]	@ movhi
	mov	r1, r5
	ldr	r3, .L10+20
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r3, #128
	rsb	r0, r0, #0
	ldr	r4, .L10+24
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r9, #4]	@ movhi
	ldr	fp, .L10+28
	strh	r3, [r9, #6]	@ movhi
	mov	r0, r7
	str	r8, [r4]
	str	r6, [r4, #28]
	mov	lr, pc
	bx	fp
	ldr	r6, .L10+32
	adr	r3, .L10
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	fp
	ldr	r6, .L10+36
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L10+40
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	r10, [r4, #16]
	str	r7, [r4, #4]
	str	r5, [r4, #8]
	str	r3, [r4, #12]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L11:
	.align	3
.L10:
	.word	1443109011
	.word	1078844686
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L30
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L26
	ldr	r0, .L30+4
	ldr	r3, [r0, #12]
	cmp	r3, r2
	stmfd	sp!, {r4, lr}
	beq	.L15
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	blt	.L15
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L28
	mov	r1, #67108864
	ldr	r2, .L30+8
	str	r3, [r0, #12]
	str	r3, [r1, #196]
	strh	r3, [r2, #2]	@ movhi
.L15:
	mov	r2, #1
	ldr	r0, .L30+12
	ldr	r1, [r0, #12]
	ldr	r3, .L30
	cmp	r1, #0
	strh	r2, [r3, #2]	@ movhi
	beq	.L19
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	blt	.L19
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L29
	mov	r1, #67108864
	ldr	r2, .L30+8
	str	r3, [r0, #12]
	str	r3, [r1, #208]
	strh	r3, [r2, #6]	@ movhi
.L19:
	mov	r2, #1
	ldr	r3, .L30
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L30
	ldmfd	sp!, {r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L26:
	mov	r2, #1
	ldr	r3, .L30
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L28:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundA
	b	.L15
.L29:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundB
	b	.L19
.L31:
	.align	2
.L30:
	.word	67109376
	.word	soundA
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L33
	ldr	r0, .L33+4
	ldr	r1, .L33+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L34:
	.align	2
.L33:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	pauseSoundA
	.type	pauseSoundA, %function
pauseSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L36
	ldr	r2, .L36+4
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	bx	lr
.L37:
	.align	2
.L36:
	.word	soundA
	.word	67109120
	.size	pauseSoundA, .-pauseSoundA
	.align	2
	.global	unpauseSoundA
	.type	unpauseSoundA, %function
unpauseSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	mov	r2, #128
	ldr	r1, .L39
	ldr	r3, .L39+4
	str	r0, [r1, #12]
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L40:
	.align	2
.L39:
	.word	soundA
	.word	67109120
	.size	unpauseSoundA, .-unpauseSoundA
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L42
	ldr	ip, .L42+4
	ldr	r0, .L42+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L43:
	.align	2
.L42:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #67108864
	ldr	r2, .L45
	ldr	ip, .L45+4
	ldr	r0, .L45+8
	str	r3, [r1, #196]
	str	r3, [ip, #12]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r0, #12]
	str	r3, [r1, #208]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L46:
	.align	2
.L45:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L49
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L49+4
	ldr	ip, .L49+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
