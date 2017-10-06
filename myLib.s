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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	mov	r1, r1, asl #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, r0, lsl #1
	mov	r0, r0, asl #2
	add	r0, r0, #67108864
	orr	r3, r3, #-2147483648
	str	r1, [r0, #176]
	str	r2, [r0, #180]
	str	r3, [r0, #184]
	bx	lr
	.size	DMANow, .-DMANow
	.align	2
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldrh	ip, [sp, #16]
	cmp	r2, #0
	strh	ip, [sp, #6]	@ movhi
	ble	.L5
	mov	lr, #67108864
	ldr	ip, .L12
	add	r2, r0, r2
	ldr	ip, [ip]
	rsb	r0, r0, r0, lsl #4
	rsb	r2, r2, r2, lsl #4
	add	r2, r1, r2, lsl #4
	add	r1, r1, r0, lsl #4
	orr	r3, r3, #-2130706432
	add	r2, ip, r2, lsl #1
	add	r1, ip, r1, lsl #1
	add	r0, sp, #6
.L7:
	str	r0, [lr, #212]
	str	r1, [lr, #216]
	add	r1, r1, #480
	cmp	r1, r2
	str	r3, [lr, #220]
	bne	.L7
.L5:
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	drawRectInBounds
	.type	drawRectInBounds, %function
drawRectInBounds:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	addlt	r3, r3, r1
	movlt	r1, #0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldrh	ip, [sp, #16]
	strh	ip, [sp, #6]	@ movhi
	add	ip, r1, r3
	cmp	ip, #240
	subgt	ip, ip, #240
	movgt	r1, #240
	rsbgt	r3, ip, r3
	cmp	r2, #0
	ble	.L14
	mov	lr, #67108864
	ldr	ip, .L22
	add	r2, r0, r2
	ldr	ip, [ip]
	rsb	r0, r0, r0, lsl #4
	rsb	r2, r2, r2, lsl #4
	add	r2, r1, r2, lsl #4
	add	r1, r1, r0, lsl #4
	orr	r3, r3, #-2130706432
	add	r2, ip, r2, lsl #1
	add	r1, ip, r1, lsl #1
	add	r0, sp, #6
.L18:
	str	r0, [lr, #212]
	str	r1, [lr, #216]
	add	r1, r1, #480
	cmp	r1, r2
	str	r3, [lr, #220]
	bne	.L18
.L14:
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.size	drawRectInBounds, .-drawRectInBounds
	.align	2
	.global	drawBackgroundImage3
	.type	drawBackgroundImage3, %function
drawBackgroundImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r1, .L25
	ldr	r2, .L25+4
	ldr	r1, [r1]
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawBackgroundImage3, .-drawBackgroundImage3
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	cmp	r3, #0
	ldr	r4, [sp, #8]
	ble	.L27
	mov	lr, #67108864
	ldr	ip, .L33
	add	r3, r1, r3
	ldr	ip, [ip]
	rsb	r1, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	add	r3, r2, r3, lsl #4
	add	r2, r2, r1, lsl #4
	add	r3, ip, r3, lsl #1
	add	r2, ip, r2, lsl #1
	mov	r1, r4, asl #1
	orr	ip, r4, #-2147483648
.L29:
	str	r0, [lr, #212]
	str	r2, [lr, #216]
	add	r2, r2, #480
	cmp	r2, r3
	str	ip, [lr, #220]
	add	r0, r0, r1
	bne	.L29
.L27:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	sub	sp, sp, #8
	ldr	r1, .L37
	add	r2, sp, #8
	strh	r0, [r2, #-2]!	@ movhi
	ldr	r0, [r1]
	ldr	r1, .L37+4
	str	r2, [r3, #212]
	str	r0, [r3, #216]
	str	r1, [r3, #220]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L40:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L40
	mov	r2, #67108864
.L42:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L42
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r1, #83886080
	ldr	r2, .L46
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	bx	lr
.L47:
	.align	2
.L46:
	.word	-2147483392
	.size	loadPalette, .-loadPalette
	.align	2
	.global	loadMap
	.type	loadMap, %function
loadMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	mov	r4, r1, asl #1
	add	ip, r4, #8
	cmp	r1, #0
	bic	ip, ip, #7
	add	fp, sp, #12
	movne	r2, r2, asl #28
	sub	sp, sp, ip
	mov	r5, sp
	addne	r4, r0, r4
	movne	r2, r2, lsr #16
	subne	lr, sp, #2
	beq	.L51
.L50:
	ldrh	ip, [r0], #2
	mov	ip, ip, asl #20
	orr	ip, r2, ip, lsr #20
	cmp	r0, r4
	strh	ip, [lr, #2]!	@ movhi
	bne	.L50
.L51:
	mov	r2, #67108864
	mov	r3, r3, asl #11
	add	r3, r3, #100663296
	orr	r1, r1, #-2147483648
	str	r5, [r2, #212]
	str	r3, [r2, #216]
	str	r1, [r2, #220]
	sub	sp, fp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
	.size	loadMap, .-loadMap
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 45) 5.3.0"
