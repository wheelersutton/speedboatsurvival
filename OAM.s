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
	.file	"OAM.c"
	.text
	.align	2
	.global	DMAShadowOAM
	.type	DMAShadowOAM, %function
DMAShadowOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r3, #512
	ldr	r4, .L3
	mov	r2, #117440512
	ldr	r1, .L3+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	DMANow
	.word	shadowOAM
	.size	DMAShadowOAM, .-DMAShadowOAM
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L9
.L6:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L6
	bx	lr
.L10:
	.align	2
.L9:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	OAMBoat
	.type	OAMBoat, %function
OAMBoat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L16
	mov	r2, #512
	ldr	r3, .L17
	strh	r2, [r3]	@ movhi
	bx	lr
.L16:
	str	lr, [sp, #-4]!
	ldr	ip, [r0]
	ldmib	r0, {r1, lr}
	ldr	r2, [r0, #12]
	ldr	r3, .L17
	add	r2, r2, lr, lsl #5
	orr	r0, ip, #16384
	mov	r1, r1, asr #8
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L18:
	.align	2
.L17:
	.word	shadowOAM
	.size	OAMBoat, .-OAMBoat
	.align	2
	.global	OAMObstacle
	.type	OAMObstacle, %function
OAMObstacle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #1
	beq	.L24
	mov	r2, #512
	ldr	r3, .L25
	mov	r1, r1, asl #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L24:
	stmfd	sp!, {r4, lr}
	ldr	ip, [r0]
	ldmib	r0, {r2, r4}
	ldr	r3, [r0, #12]
	ldr	lr, .L25
	mov	r1, r1, asl #3
	mov	r0, ip, asr #8
	add	r3, r3, r4, lsl #5
	add	ip, lr, r1
	mov	r2, r2, asr #8
	strh	r0, [lr, r1]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	shadowOAM
	.size	OAMObstacle, .-OAMObstacle
	.align	2
	.global	OAMBullet
	.type	OAMBullet, %function
OAMBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #36]
	cmp	r3, #1
	beq	.L32
	mov	r2, #512
	ldr	r3, .L33
	mov	r1, r1, asl #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L32:
	stmfd	sp!, {r4, lr}
	ldr	r3, [r0, #12]
	ldr	r4, [r0, #8]
	ldr	ip, .L33
	ldr	lr, [r0]
	mov	r1, r1, asl #3
	ldr	r0, [r0, #4]
	add	r2, ip, r1
	add	r3, r3, r4, lsl #5
	strh	lr, [ip, r1]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	shadowOAM
	.size	OAMBullet, .-OAMBullet
	.align	2
	.global	OAMString
	.type	OAMString, %function
OAMString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	ip, [r2]	@ zero_extendqisi2
	cmp	ip, #0
	bxeq	lr
	ldr	ip, .L42
	mov	r0, r0, asl #16
	str	lr, [sp, #-4]!
	add	r3, ip, r3, lsl #3
	mov	lr, r0, lsr #16
.L37:
	strh	r1, [r3, #2]	@ movhi
	strh	lr, [r3]	@ movhi
	ldrb	r0, [r2]	@ zero_extendqisi2
	add	r0, r0, #208
	strh	r0, [r3, #4]	@ movhi
	ldrb	r0, [r2, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	add	r1, r1, #5
	add	r3, r3, #8
	bne	.L37
	ldr	lr, [sp], #4
	bx	lr
.L43:
	.align	2
.L42:
	.word	shadowOAM
	.size	OAMString, .-OAMString
	.align	2
	.global	OAMScoreBug
	.type	OAMScoreBug, %function
OAMScoreBug:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, r1, asl #18
	str	lr, [sp, #-4]!
	mvn	r1, r1, lsr #18
	mov	lr, #288
	ldr	ip, .L46
	mov	r2, r2, asl #3
	add	r3, ip, r2
	orr	r0, r0, #16384
	strh	lr, [r3, #4]	@ movhi
	strh	r0, [ip, r2]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L47:
	.align	2
.L46:
	.word	shadowOAM
	.size	OAMScoreBug, .-OAMScoreBug
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
