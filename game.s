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
	.file	"game.c"
	.text
	.align	2
	.global	updateBoat
	.type	updateBoat, %function
updateBoat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldr	r3, [r3]
	tst	r3, #64
	beq	.L2
	ldr	r2, .L17+4
	ldr	r2, [r2]
	tst	r2, #64
	beq	.L15
.L2:
	tst	r3, #128
	beq	.L3
	ldr	r3, .L17+4
	ldr	r3, [r3]
	tst	r3, #128
	beq	.L16
.L3:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	ldr	r3, [r0, #4]
	tst	r2, #16
	mov	r2, r3, asr #8
	bne	.L4
	cmp	r2, #199
	movgt	r3, #51200
	ldrle	r2, [r0, #44]
	addle	r3, r2, r3
	str	r3, [r0, #4]
	bx	lr
.L4:
	ldr	r1, [r0, #44]
	cmp	r2, #0
	rsb	r3, r1, r3
	str	r3, [r0, #4]
	streq	r2, [r0, #28]
	bx	lr
.L16:
	ldr	r2, .L17+8
	ldr	r3, [r0]
	ldr	r2, [r2, #4]
	cmp	r3, r2
	addlt	r3, r3, #16
	strlt	r3, [r0]
	b	.L3
.L15:
	ldr	r1, .L17+8
	ldr	r2, [r0]
	ldr	r1, [r1]
	cmp	r2, r1
	subgt	r2, r2, #16
	strgt	r2, [r0]
	b	.L2
.L18:
	.align	2
.L17:
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.size	updateBoat, .-updateBoat
	.align	2
	.global	updateObstacle
	.type	updateObstacle, %function
updateObstacle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	stmfd	sp!, {r4, lr}
	beq	.L19
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bne	.L22
	ldr	ip, [r0, #4]
	ldr	r2, [r0, #28]
	ldr	r3, [r0, #36]
	rsb	r2, r2, ip
	cmp	r3, #0
	str	r2, [r0, #4]
	ble	.L23
	ldr	r3, [r0, #12]
	cmp	r3, #4
	moveq	r3, #3
	movne	r3, #4
	str	r3, [r0, #12]
.L23:
	ldr	r3, .L45
	smull	lr, ip, r3, r1
	mov	r3, r1, asr #31
	rsb	r3, r3, ip, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r1, r3, asl #1
	bne	.L26
	ldr	r3, [r0, #8]
	add	r3, r3, #1
	cmp	r3, #4
	movgt	r3, #1
	str	r3, [r0, #8]
.L26:
	cmp	r2, #0
	ble	.L35
.L19:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L22:
	cmp	r3, #1
	beq	.L43
	cmp	r3, #2
	bne	.L19
	ldr	r3, .L45
	smull	ip, r2, r3, r1
	mov	r3, r1, asr #31
	rsb	r3, r3, r2, asr #2
	ldr	ip, [r0]
	ldr	r2, [r0, #4]
	ldr	r4, [r0, #28]
	ldr	lr, [r0, #32]
	add	r3, r3, r3, lsl #2
	cmp	r1, r3, asl #1
	rsb	r3, r4, r2
	add	r2, ip, lr
	stmia	r0, {r2, r3}
	beq	.L44
.L37:
	cmp	r3, #255
	ble	.L35
	cmp	r2, #40960
	blt	.L19
.L35:
	mov	r3, #0
	ldmfd	sp!, {r4, lr}
	str	r3, [r0, #20]
	bx	lr
.L43:
	ldr	r3, .L45
	smull	ip, r2, r3, r1
	mov	r3, r1, asr #31
	rsb	r3, r3, r2, asr #2
	ldr	ip, [r0, #28]
	ldr	r2, [r0, #4]
	add	r3, r3, r3, lsl #2
	cmp	r1, r3, asl #1
	rsb	r3, ip, r2
	str	r3, [r0, #4]
	bne	.L32
	ldr	r2, [r0, #8]
	add	r2, r2, #1
	cmp	r2, #2
	movgt	r2, #1
	str	r2, [r0, #8]
.L32:
	cmp	r3, #0
	bgt	.L19
	b	.L35
.L44:
	ldr	r1, [r0, #8]
	add	r1, r1, #1
	cmp	r1, #3
	movgt	r1, #1
	str	r1, [r0, #8]
	b	.L37
.L46:
	.align	2
.L45:
	.word	1717986919
	.size	updateObstacle, .-updateObstacle
	.align	2
	.global	fireObstacle
	.type	fireObstacle, %function
fireObstacle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r5, [r0, #20]
	cmp	r5, #0
	bne	.L47
	mov	r7, #1
	ldr	r3, [r0, #24]
	cmp	r3, #0
	mov	r6, r1
	mov	r4, r0
	str	r7, [r0, #20]
	bne	.L50
	mov	r0, #61440
	mov	r1, #200
	mov	r2, #3
	str	r3, [r4, #36]
	str	r0, [r4, #4]
	str	r1, [r4, #28]
	str	r2, [r4, #12]
.L51:
	ldr	r5, .L69
	mov	lr, pc
	bx	r5
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	cmp	r3, r0, lsr #31
	bne	.L66
	ldr	r3, [r6]
	mov	r3, r3, asl #8
	str	r3, [r4]
.L47:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L50:
	cmp	r3, #1
	beq	.L67
	cmp	r3, #2
	beq	.L68
.L53:
	cmp	r3, #1
	bls	.L51
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L66:
	mov	lr, pc
	bx	r5
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r0, r0, r3
	and	r0, r0, #3
	rsb	r3, r3, r0
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L47
.L56:
	.word	.L55
	.word	.L57
	.word	.L58
	.word	.L59
.L67:
	mov	r1, #58880
	mov	r2, #150
	mov	r3, #5
	str	r5, [r0, #36]
	str	r1, [r0, #4]
	str	r2, [r0, #28]
	str	r3, [r0, #12]
	b	.L51
.L68:
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	mov	r2, #200
	mov	r1, #6
	ldr	r3, .L69+4
	smull	ip, r3, r0, r3
	add	ip, r3, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, ip, asr #7
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, asl #2
	add	r3, r3, #100
	mov	r3, r3, asl #8
	stmib	r4, {r3, r7}
	str	r5, [r4]
	str	r2, [r4, #28]
	str	r2, [r4, #32]
	str	r1, [r4, #12]
	ldr	r3, [r4, #24]
	b	.L53
.L59:
	ldr	r3, .L69+8
	ldr	r3, [r3, #4]
	mov	r3, r3, asl #8
	str	r3, [r4]
	b	.L47
.L58:
	ldr	r3, .L69+8
	ldr	r3, [r3, #12]
	mov	r3, r3, asl #8
	str	r3, [r4]
	b	.L47
.L57:
	ldr	r3, .L69+8
	ldr	r3, [r3, #8]
	mov	r3, r3, asl #8
	str	r3, [r4]
	b	.L47
.L55:
	ldr	r3, .L69+8
	ldr	r3, [r3]
	mov	r3, r3, asl #8
	str	r3, [r4]
	b	.L47
.L70:
	.align	2
.L69:
	.word	rand
	.word	-368140053
	.word	.LANCHOR0
	.size	fireObstacle, .-fireObstacle
	.align	2
	.global	playerObstacleCollision
	.type	playerObstacleCollision, %function
playerObstacleCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #1
	bxne	lr
	ldr	r3, [r1, #20]
	cmp	r3, #1
	bxne	lr
	ldr	r2, [r0, #4]
	ldr	ip, [r0, #24]
	ldr	r3, [r1, #4]
	mov	r2, r2, asr #8
	add	ip, r2, ip
	mov	r3, r3, asr #8
	cmp	r3, ip
	bxgt	lr
	ldr	ip, [r1, #16]
	add	r3, r3, ip
	cmp	r2, r3
	bxgt	lr
	ldr	r3, [r1]
	ldr	r2, [r0]
	mov	r3, r3, asr #8
	add	ip, r3, ip
	cmp	ip, r2
	bxlt	lr
	ldr	ip, [r0, #20]
	add	r2, r2, ip
	cmp	r3, r2
	bxgt	lr
	ldr	r3, [r0, #52]
	cmp	r3, #0
	beq	.L73
	ldr	r3, [r1, #24]
	cmp	r3, #2
	beq	.L77
.L73:
	mov	r3, #0
	str	r3, [r0, #28]
	bx	lr
.L77:
	mvn	r2, #199
	mov	r3, #7
	str	r2, [r1, #32]
	str	r3, [r1, #12]
	bx	lr
	.size	playerObstacleCollision, .-playerObstacleCollision
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, #1
	mov	lr, #4
	ldr	r2, [r1, #20]
	ldr	r5, [r1, #4]
	ldr	ip, [r1]
	ldr	r3, [r1, #24]
	add	r2, r2, r2, lsr #31
	add	r2, ip, r2, asr r4
	add	r3, r3, r5, asr #8
	sub	r2, r2, #3
	sub	r3, r3, #5
	str	r4, [r0, #36]
	str	lr, [r0, #12]
	stmia	r0, {r2, r3}
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #1
	bxne	lr
	ldr	r3, [r0, #4]
	add	r3, r3, #3
	cmp	r3, #239
	str	r3, [r0, #4]
	movgt	r3, #0
	strgt	r3, [r0, #36]
	strgt	r3, [r0, #4]
	strgt	r3, [r0]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	obstacleBulletCollision
	.type	obstacleBulletCollision, %function
obstacleBulletCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1, #20]
	cmp	r3, #1
	bxne	lr
	ldr	r3, [r0, #36]
	cmp	r3, #1
	bxne	lr
	str	lr, [sp, #-4]!
	ldr	r3, [r1, #4]
	ldr	lr, [r0, #4]
	ldr	ip, [r0, #20]
	mov	r3, r3, asr #8
	add	ip, lr, ip
	cmp	r3, ip
	bgt	.L84
	ldr	ip, [r1, #16]
	add	r3, r3, ip
	cmp	lr, r3
	bgt	.L84
	ldr	r3, [r1]
	ldr	lr, [r0]
	mov	r3, r3, asr #8
	add	ip, r3, ip
	cmp	ip, lr
	blt	.L84
	ldr	ip, [r0, #16]
	add	lr, lr, ip
	cmp	r3, lr
	bgt	.L84
	ldr	r3, [r1, #24]
	cmp	r3, #0
	bne	.L86
	ldr	ip, [r1, #36]
	cmp	ip, #2
	beq	.L88
	mov	lr, #4
	ldr	r2, [r1, #28]
	add	ip, ip, #1
	add	r2, r2, #100
	str	ip, [r1, #36]
	str	r2, [r1, #28]
	str	lr, [r1, #12]
	str	r3, [r0, #36]
.L84:
	ldr	lr, [sp], #4
	bx	lr
.L86:
	cmp	r3, #1
	bne	.L84
	ldr	r3, [r1, #36]
	cmp	r3, #8
	beq	.L88
	mov	ip, #0
	mov	r2, #3
	add	r3, r3, #1
	str	r3, [r1, #36]
	str	ip, [r0, #36]
	str	r2, [r1, #8]
	b	.L84
.L88:
	mov	ip, #0
	ldr	r3, [r2, #56]
	add	r3, r3, #1
	str	ip, [r1, #20]
	str	ip, [r0, #36]
	str	r3, [r2, #56]
	b	.L84
	.size	obstacleBulletCollision, .-obstacleBulletCollision
	.global	boatRow4
	.global	boatRow3
	.global	boatRow2
	.global	boatRow1
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	boatRow1, %object
	.size	boatRow1, 4
boatRow1:
	.word	104
	.type	boatRow4, %object
	.size	boatRow4, 4
boatRow4:
	.word	152
	.type	boatRow2, %object
	.size	boatRow2, 4
boatRow2:
	.word	120
	.type	boatRow3, %object
	.size	boatRow3, 4
boatRow3:
	.word	136
	.ident	"GCC: (devkitARM release 45) 5.3.0"
