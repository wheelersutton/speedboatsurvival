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
	.file	"main.c"
	.text
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #56832
	mov	r3, #67108864
	mov	r2, #31
	mov	r0, #5632
	ldr	r1, .L3
	stmfd	sp!, {r4, lr}
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	ldr	r0, .L3+4
	strh	r2, [r3, #18]	@ movhi
	ldr	r3, .L3+8
	ldr	r4, .L3+12
	mov	lr, pc
	bx	r3
	mov	r3, #816
	mov	r2, #100663296
	ldr	r1, .L3+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L3+20
	ldr	r1, .L3+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2432
	ldr	r2, .L3+28
	ldr	r1, .L3+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L3+36
	ldr	r1, .L3+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L3+44
	ldr	r1, .L3+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L3+52
	ldr	r1, .L3+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	-9212
	.word	cityscapePal
	.word	loadPalette
	.word	DMANow
	.word	cityscapeTiles
	.word	100724736
	.word	cityscapeMap
	.word	100679680
	.word	skyTiles
	.word	100720640
	.word	skyMap
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.size	initializeGame, .-initializeGame
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L7
	stmfd	sp!, {r4, lr}
	mov	r0, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L7+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L7+8
	ldr	r3, .L7+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L7+16
	mov	r3, #1
	ldr	r2, .L7+20
	ldr	r1, .L7+24
	ldr	r0, .L7+28
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L7+32
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L8:
	.align	2
.L7:
	.word	1027
	.word	fillScreen
	.word	startscreenBitmap
	.word	drawBackgroundImage3
	.word	playSoundA
	.word	11025
	.word	625536
	.word	maintheme
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r1, .L11
	ldr	r2, .L11+4
	str	r0, [r1]
	strh	r2, [r3]	@ movhi
	ldr	r0, .L11+8
	ldr	r3, .L11+12
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	state
	.word	1027
	.word	instructionsScreenBitmap
	.word	drawBackgroundImage3
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToInstructions2
	.type	goToInstructions2, %function
goToInstructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L15
	ldr	r3, .L15+4
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	instructionsScreen2Bitmap
	.word	drawBackgroundImage3
	.size	goToInstructions2, .-goToInstructions2
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bl	initializeGame
	ldr	r3, .L29
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r2, #100
	mov	r0, r1
	ldr	r3, .L29+4
	mov	lr, pc
	bx	r3
	mov	r4, #16
	mov	r1, #1
	mov	r0, #0
	mov	r5, #120
	mov	lr, #8
	mov	ip, #5
	mov	r7, #25600
	mov	r6, #100
	mov	r3, #2
	ldr	r2, .L29+8
	mov	r9, r1
	str	r1, [r2, #12]
	str	r1, [r2, #28]
	str	r1, [r2, #32]
	str	r1, [r2, #36]
	str	r4, [r2, #16]
	str	r4, [r2, #24]
	ldr	r1, .L29+12
	ldr	r4, .L29+16
	str	r7, [r2, #4]
	str	r6, [r2, #44]
	str	r5, [r2]
	str	r5, [r2, #48]
	mov	fp, r0
	mov	r8, lr
	mov	r10, ip
	str	r0, [r2, #8]
	str	r0, [r2, #52]
	str	r0, [r2, #56]
	str	lr, [r2, #20]
	str	ip, [r2, #40]
	str	r3, [r1]
	ldr	r7, .L29+20
	ldr	r6, .L29+24
	add	r5, r4, #1600
	b	.L21
.L28:
	mov	r2, #3
	str	r3, [r4, #24]
	str	r9, [r4, #8]
	str	r2, [r4, #12]
.L19:
	add	r4, r4, #40
	cmp	r4, r5
	beq	.L27
.L21:
	mov	lr, pc
	bx	r7
	smull	r2, r3, r6, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	str	fp, [r4]
	str	fp, [r4, #4]
	str	r8, [r4, #16]
	str	fp, [r4, #20]
	str	fp, [r4, #28]
	str	fp, [r4, #36]
	beq	.L28
	cmp	r3, #1
	streq	r3, [r4, #24]
	streq	r3, [r4, #8]
	streq	r10, [r4, #12]
	beq	.L19
	cmp	r3, #2
	streq	r3, [r4, #24]
	moveq	r3, #6
	streq	r9, [r4, #8]
	streq	r3, [r4, #12]
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L21
.L27:
	mov	r2, #0
	mov	lr, #3
	mov	r1, #8
	ldr	r3, .L29+28
	add	r0, r3, #880
.L22:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	lr, [r3, #12]
	str	r2, [r3, #36]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r0
	mov	ip, #0
	bne	.L22
	mvn	r1, #0
	mov	r4, #500
	ldr	r2, .L29+32
	ldr	r0, .L29+36
	ldr	lr, .L29+40
	ldr	r5, .L29+44
	str	r1, [r2]
	str	r4, [r0]
	mov	r3, #1
	ldr	r4, .L29+48
	ldr	r2, .L29+52
	ldr	r1, .L29+56
	ldr	r0, .L29+60
	str	ip, [r5]
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	hideSprites
	.word	OAMScoreBug
	.word	boat
	.word	state
	.word	obstacles
	.word	rand
	.word	1431655766
	.word	bullets
	.word	prevBullet
	.word	difficulty
	.word	prevBoatKills
	.word	bulletCount
	.word	playSoundA
	.word	11025
	.word	405476
	.word	bgMusic
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L43
	ldr	r2, [r4]
	tst	r2, #8
	beq	.L32
	ldr	r3, .L43+4
	ldr	r3, [r3]
	ands	r5, r3, #8
	beq	.L42
.L32:
	tst	r2, #1
	beq	.L31
	ldr	r3, .L43+4
	ldr	r3, [r3]
	ands	r4, r3, #1
	bne	.L31
	mov	r0, #1
	mov	r3, #67108864
	ldr	r1, .L43+8
	ldr	r2, .L43+12
	str	r0, [r1]
	strh	r2, [r3]	@ movhi
	ldr	r0, .L43+16
	ldr	r3, .L43+20
	mov	lr, pc
	bx	r3
	mov	r3, r4
	ldr	r2, .L43+24
	ldr	r1, .L43+28
	ldr	r0, .L43+32
	ldr	r4, .L43+36
	mov	lr, pc
	bx	r4
.L31:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L42:
	bl	goToGame
	mov	r3, r5
	ldr	r2, .L43+24
	ldr	r1, .L43+28
	ldr	r0, .L43+32
	ldr	r5, .L43+36
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	b	.L32
.L44:
	.align	2
.L43:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	1027
	.word	instructionsScreenBitmap
	.word	drawBackgroundImage3
	.word	11025
	.word	8821
	.word	menubutton
	.word	playSoundB
	.size	start, .-start
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L62
	ldr	r2, [r4]
	tst	r2, #1
	beq	.L46
	ldr	r3, .L62+4
	ldr	r3, [r3]
	ands	r5, r3, #1
	beq	.L47
.L46:
	tst	r2, #2
	beq	.L48
	ldr	r3, .L62+4
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L60
.L48:
	tst	r2, #8
	beq	.L45
	ldr	r3, .L62+4
	ldr	r3, [r3]
	ands	r3, r3, #8
	beq	.L61
.L45:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L47:
	ldr	r0, .L62+8
	ldr	r3, .L62+12
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L62+16
	ldr	r1, .L62+20
	ldr	r0, .L62+24
	ldr	r5, .L62+28
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	b	.L46
.L61:
	ldr	r4, .L62+28
	ldr	r2, .L62+16
	ldr	r1, .L62+20
	ldr	r0, .L62+24
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToGame
.L60:
	mov	r0, #1
	mov	r3, #67108864
	ldr	r2, .L62+32
	ldr	r1, .L62+36
	str	r0, [r1]
	strh	r2, [r3]	@ movhi
	ldr	r0, .L62+40
	ldr	r3, .L62+12
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	b	.L48
.L63:
	.align	2
.L62:
	.word	oldButtons
	.word	buttons
	.word	instructionsScreen2Bitmap
	.word	drawBackgroundImage3
	.word	11025
	.word	8821
	.word	menubutton
	.word	playSoundB
	.word	1027
	.word	state
	.word	instructionsScreenBitmap
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #3
	mov	r3, #67108864
	ldr	r1, .L66
	ldr	r2, .L66+4
	stmfd	sp!, {r4, lr}
	str	r0, [r1]
	strh	r2, [r3]	@ movhi
	mov	r0, #0
	ldr	r3, .L66+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L66+12
	ldr	r3, .L66+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L66+20
	mov	r3, #0
	ldr	r2, .L66+24
	ldr	r1, .L66+28
	ldr	r0, .L66+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+36
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	state
	.word	1027
	.word	fillScreen
	.word	pausescreenBitmap
	.word	drawBackgroundImage3
	.word	playSoundB
	.word	11025
	.word	6544
	.word	pausesound
	.word	pauseSoundA
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L80
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L69
	ldr	r2, .L80+4
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L78
.L69:
	tst	r3, #2
	beq	.L68
	ldr	r3, .L80+4
	ldr	r3, [r3]
	ands	r3, r3, #2
	beq	.L79
.L68:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L79:
	ldr	r2, .L80+8
	ldmfd	sp!, {r4, lr}
	str	r3, [r2]
	b	goToStart
.L78:
	mov	r2, #2
	ldr	r3, .L80+8
	str	r2, [r3]
	bl	initializeGame
	ldr	r3, .L80+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	b	.L69
.L81:
	.align	2
.L80:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	unpauseSoundA
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, .L86
	mov	lr, pc
	bx	r3
	ldr	r4, .L86+4
	mov	r3, #0
	ldr	r2, .L86+8
	ldr	r1, .L86+12
	ldr	r0, .L86+16
	mov	lr, pc
	bx	r4
	mov	r0, #4
	mov	r3, #67108864
	ldr	r1, .L86+20
	ldr	r2, .L86+24
	str	r0, [r1]
	strh	r2, [r3]	@ movhi
	ldr	r0, .L86+28
	ldr	r3, .L86+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+36
	mov	r2, #10
	ldr	r0, [r3, #56]
	ldr	r1, .L86+40
	ldr	r3, .L86+44
	mov	lr, pc
	bx	r3
	ldr	r4, .L86+48
	ldr	r3, .L86+52
	ldr	r2, .L86+40
	mov	r1, #150
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r4, #95
	mov	r8, #65
	ldr	r3, .L86+56
	ldr	r5, .L86+60
	str	r2, [r3]
	ldr	r7, .L86+64
.L83:
	mov	r1, r4
	mov	r3, #31
	mov	r2, #65
	mov	r0, #80
	add	r4, r4, #12
	str	r8, [r5], #4
	mov	lr, pc
	bx	r7
	cmp	r4, #131
	ldr	r6, .L86+64
	bne	.L83
	mov	r2, #95
	mov	r3, #31
	mov	r1, r2
	mov	r0, #84
	mov	lr, pc
	bx	r6
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	23826
	.word	explosion
	.word	state
	.word	1027
	.word	losescreenBitmap
	.word	drawBackgroundImage3
	.word	boat
	.word	buffer
	.word	itoa
	.word	drawString
	.word	32767
	.word	.LANCHOR0
	.word	letters
	.word	drawChar
	.size	goToLose, .-goToLose
	.align	2
	.global	OAMScore
	.type	OAMScore, %function
OAMScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L90
	ldr	r4, .L90+4
	ldr	r0, [r3, #56]
	mov	r1, r4
	mov	r2, #10
	ldr	r3, .L90+8
	mov	lr, pc
	bx	r3
	mov	r2, r4
	mov	r3, #42
	ldr	r4, .L90+12
	mov	r1, #4
	mov	r0, #15
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	boat
	.word	buffer
	.word	itoa
	.word	OAMString
	.size	OAMScore, .-OAMScore
	.align	2
	.global	OAMSprites
	.type	OAMSprites, %function
OAMSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r0, .L98
	ldr	r3, .L98+4
	mov	lr, pc
	bx	r3
	mov	r4, #0
	ldr	r5, .L98+8
	ldr	r6, .L98+12
.L93:
	add	r4, r4, #1
	mov	r0, r5
	mov	r1, r4
	mov	lr, pc
	bx	r6
	cmp	r4, #40
	add	r5, r5, #40
	bne	.L93
	mov	r5, #41
	ldr	r4, .L98+16
	ldr	r7, .L98+20
	add	r6, r4, #880
.L94:
	mov	r1, r5
	mov	r0, r4
	add	r4, r4, #44
	mov	lr, pc
	bx	r7
	cmp	r4, r6
	add	r5, r5, #1
	bne	.L94
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	OAMScore
.L99:
	.align	2
.L98:
	.word	boat
	.word	OAMBoat
	.word	obstacles
	.word	OAMObstacle
	.word	bullets
	.word	OAMBullet
	.size	OAMSprites, .-OAMSprites
	.align	2
	.global	updateHighScores
	.type	updateHighScores, %function
updateHighScores:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L113
	mov	r3, #0
	mov	r2, ip
	ldr	r1, .L113+4
	ldr	r0, [r1, #56]
.L106:
	ldr	r1, [r2], #4
	cmp	r1, r0
	blt	.L111
	add	r3, r3, #1
	cmp	r3, #5
	bne	.L106
	bx	lr
.L111:
	cmp	r3, #4
	stmfd	sp!, {r4, r5, r6, lr}
	beq	.L112
	mov	r2, #4
	ldr	r1, .L113+8
	ldr	lr, .L113+12
	sub	r6, r1, #20
.L104:
	sub	r2, r2, #1
	ldr	r5, [ip, r2, asl #2]
	ldr	r4, [r6, r2, asl #2]
	cmp	r2, r3
	str	r5, [lr, #-4]!
	str	r4, [r1, #-4]!
	bne	.L104
.L105:
	ldr	r1, .L113+16
	ldr	r2, .L113+20
	ldr	r5, [r1]
	ldmib	r1, {r4, lr}
	strb	r5, [r2]
	ldr	r1, .L113+24
	strb	r4, [r2, #1]
	strb	lr, [r2, #2]
	str	r2, [r6, r3, asl #2]
	str	r0, [ip, r3, asl #2]
	str	r3, [r1]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L112:
	ldr	r6, .L113+28
	b	.L105
.L114:
	.align	2
.L113:
	.word	highScores
	.word	boat
	.word	initials+20
	.word	highScores+20
	.word	letters
	.word	finalInitials
	.word	.LANCHOR1
	.word	initials
	.size	updateHighScores, .-updateHighScores
	.align	2
	.global	goToScores
	.type	goToScores, %function
goToScores:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r0, .L121
	ldr	r3, .L121+4
	mov	lr, pc
	bx	r3
	mvn	r3, #0
	mov	r1, #5
	ldr	r2, .L121+8
	ldr	r9, .L121+12
	ldr	r10, .L121+16
	str	r1, [r2]
	str	r3, [r9]
	bl	updateHighScores
	mov	r2, #4
	ldr	r1, .L121+20
	ldr	r0, .L121+24
	mov	lr, pc
	bx	r10
	ldr	r6, .L121+28
	ldr	r3, .L121+32
	ldr	r2, .L121+24
	mov	r1, #70
	mov	r0, #50
	mov	lr, pc
	bx	r6
	mov	r2, #4
	ldr	r1, .L121+36
	ldr	r0, .L121+24
	mov	lr, pc
	bx	r10
	ldr	r3, .L121+32
	ldr	r2, .L121+24
	mov	r1, #70
	mov	r0, #65
	mov	lr, pc
	bx	r6
	mov	r2, #4
	ldr	r1, .L121+40
	ldr	r0, .L121+24
	mov	lr, pc
	bx	r10
	ldr	r3, .L121+32
	ldr	r2, .L121+24
	mov	r1, #70
	mov	r0, #80
	mov	lr, pc
	bx	r6
	mov	r2, #4
	ldr	r1, .L121+44
	ldr	r0, .L121+24
	mov	lr, pc
	bx	r10
	ldr	r3, .L121+32
	ldr	r2, .L121+24
	mov	r1, #70
	mov	r0, #95
	mov	lr, pc
	bx	r6
	mov	r2, #4
	ldr	r1, .L121+48
	ldr	r0, .L121+24
	mov	lr, pc
	bx	r10
	ldr	r3, .L121+32
	ldr	r2, .L121+24
	mov	r1, #70
	mov	r0, #110
	mov	lr, pc
	bx	r6
	mov	r4, #50
	mov	r5, #0
	ldr	r8, .L121+52
	ldr	r7, .L121+56
	ldr	fp, .L121+60
.L117:
	mov	r2, #10
	ldr	r1, .L121+24
	ldr	r0, [r8], #4
	mov	lr, pc
	bx	fp
	ldr	r2, .L121+24
	ldr	r3, .L121+32
	mov	r1, #100
	mov	r0, r4
	mov	lr, pc
	bx	r6
	ldr	r1, [r7], #4
	ldr	r3, .L121+64
	ldr	r0, .L121+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L121+32
	ldr	r2, .L121+24
	mov	r1, #140
	mov	r0, r4
	mov	lr, pc
	bx	r6
	ldr	r3, [r9]
	cmp	r3, r5
	add	r5, r5, #1
	beq	.L120
.L116:
	cmp	r5, #5
	add	r4, r4, #15
	bne	.L117
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L120:
	mov	r2, #2
	ldr	r1, .L121+68
	ldr	r0, .L121+24
	mov	lr, pc
	bx	r10
	mov	r0, r4
	mov	r3, #992
	ldr	r2, .L121+24
	mov	r1, #63
	ldr	ip, .L121+28
	mov	lr, pc
	bx	ip
	mov	r3, #992
	ldr	r2, .L121+24
	mov	r1, #160
	mov	r0, r4
	ldr	ip, .L121+28
	mov	lr, pc
	bx	ip
	b	.L116
.L122:
	.align	2
.L121:
	.word	highscoresscreenBitmap
	.word	drawBackgroundImage3
	.word	state
	.word	.LANCHOR1
	.word	memcpy
	.word	.LC0
	.word	buffer
	.word	drawString
	.word	32767
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	highScores
	.word	initials
	.word	itoa
	.word	sprintf
	.word	.LC5
	.size	goToScores, .-goToScores
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L158
	ldr	r2, [r4]
	tst	r2, #8
	beq	.L124
	ldr	r3, .L158+4
	ldr	r3, [r3]
	ands	r5, r3, #8
	beq	.L153
.L124:
	tst	r2, #16
	beq	.L125
	ldr	r3, .L158+4
	ldr	r3, [r3]
	ands	r6, r3, #16
	beq	.L154
.L125:
	tst	r2, #32
	beq	.L128
	ldr	r3, .L158+4
	ldr	r3, [r3]
	tst	r3, #32
	beq	.L155
.L128:
	tst	r2, #64
	beq	.L131
	ldr	r3, .L158+4
	ldr	r3, [r3]
	ands	r3, r3, #64
	beq	.L156
.L131:
	tst	r2, #128
	beq	.L123
	ldr	r3, .L158+4
	ldr	r3, [r3]
	ands	r3, r3, #128
	beq	.L157
.L123:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L157:
	ldr	r6, .L158+8
	ldr	r2, .L158+12
	ldr	r1, .L158+16
	ldr	r0, .L158+20
	ldr	r4, .L158+24
	mov	lr, pc
	bx	r4
	ldr	r3, [r6]
	ldr	r4, .L158+28
	add	r1, r3, r3, lsl #1
	mov	r1, r1, asl #2
	ldrb	r2, [r4, r3, asl #2]	@ zero_extendqisi2
	ldr	r5, .L158+32
	mov	r3, #992
	add	r1, r1, #95
	mov	r0, #80
	mov	lr, pc
	bx	r5
	ldr	r1, [r6]
	ldr	r2, [r4, r1, asl #2]
	sub	r2, r2, #1
	cmp	r2, #64
	movle	r3, #90
	strgt	r2, [r4, r1, asl #2]
	strle	r3, [r4, r1, asl #2]
	add	r1, r1, r1, lsl #1
	mov	r1, r1, asl #2
	movle	r2, r3
	andgt	r2, r2, #255
	add	r1, r1, #95
	mov	r3, #31
	mov	r0, #80
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L156:
	ldr	r7, .L158+8
	ldr	r2, .L158+12
	ldr	r1, .L158+16
	ldr	r0, .L158+20
	ldr	r5, .L158+24
	mov	lr, pc
	bx	r5
	ldr	r3, [r7]
	ldr	r6, .L158+28
	add	r1, r3, r3, lsl #1
	mov	r1, r1, asl #2
	ldrb	r2, [r6, r3, asl #2]	@ zero_extendqisi2
	add	r1, r1, #95
	mov	r3, #992
	mov	r0, #80
	ldr	r5, .L158+32
	mov	lr, pc
	bx	r5
	ldr	r1, [r7]
	ldr	r2, [r6, r1, asl #2]
	add	r2, r2, #1
	cmp	r2, #90
	movgt	r3, #65
	strle	r2, [r6, r1, asl #2]
	strgt	r3, [r6, r1, asl #2]
	add	r1, r1, r1, lsl #1
	mov	r1, r1, asl #2
	movgt	r2, r3
	andle	r2, r2, #255
	add	r1, r1, #95
	mov	r3, #31
	mov	r0, #80
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	b	.L131
.L153:
	bl	goToScores
	mov	r3, r5
	ldr	r2, .L158+12
	ldr	r1, .L158+36
	ldr	r0, .L158+40
	ldr	r5, .L158+24
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	b	.L124
.L154:
	ldr	r7, .L158+8
	ldr	r1, [r7]
	add	r1, r1, r1, lsl #1
	mov	r1, r1, asl #2
	add	r1, r1, #95
	mov	r3, #992
	mov	r2, #95
	mov	r0, #84
	ldr	r5, .L158+32
	mov	lr, pc
	bx	r5
	ldr	r3, [r7]
	add	r3, r3, #1
	cmp	r3, #2
	addle	r1, r3, r3, lsl #1
	movle	r1, r1, asl #2
	strle	r3, [r7]
	mov	r2, #95
	addle	r1, r1, #95
	movgt	r1, #95
	mov	r3, #31
	mov	r0, #84
	strgt	r6, [r7]
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	b	.L125
.L155:
	ldr	r6, .L158+8
	ldr	r1, [r6]
	add	r1, r1, r1, lsl #1
	mov	r1, r1, asl #2
	add	r1, r1, #95
	mov	r3, #992
	mov	r2, #95
	mov	r0, #84
	ldr	r5, .L158+32
	mov	lr, pc
	bx	r5
	ldr	r3, [r6]
	subs	r3, r3, #1
	movmi	r3, #2
	addpl	r1, r3, r3, lsl #1
	movpl	r1, r1, asl #2
	strpl	r3, [r6]
	strmi	r3, [r6]
	mov	r2, #95
	addpl	r1, r1, #95
	movmi	r1, #119
	mov	r3, #31
	mov	r0, #84
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	b	.L128
.L159:
	.align	2
.L158:
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	11025
	.word	353
	.word	nameselectsound
	.word	playSoundB
	.word	letters
	.word	drawChar
	.word	8821
	.word	menubutton
	.size	lose, .-lose
	.align	2
	.global	scores
	.type	scores, %function
scores:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L166
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L166+4
	ldr	r3, [r3]
	ands	r3, r3, #8
	bxne	lr
	stmfd	sp!, {r4, lr}
	ldr	r2, .L166+8
	ldr	r4, .L166+12
	ldr	r1, .L166+16
	ldr	r0, .L166+20
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L167:
	.align	2
.L166:
	.word	oldButtons
	.word	buttons
	.word	11025
	.word	playSoundB
	.word	8821
	.word	menubutton
	.size	scores, .-scores
	.global	__aeabi_idivmod
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r10, .L219
	ldr	r3, .L219+4
	mov	r0, r10
	mov	lr, pc
	bx	r3
	ldr	r2, [r10, #56]
	ldr	r3, .L219+8
	smull	r0, r1, r3, r2
	mov	r3, r2, asr #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, asl #1
	ldr	r1, .L219+12
	cmp	r3, #0
	str	r3, [r1]
	beq	.L210
	ldr	r4, .L219+16
.L169:
	ldr	r8, .L219+20
	ldr	r6, .L219+24
	mov	lr, pc
	bx	r6
	ldr	r5, [r8]
	ldr	r7, .L219+28
	ldr	r1, [r4]
	mov	lr, pc
	bx	r7
	mov	r0, r5
	mov	lr, pc
	bx	r7
	cmp	r1, #0
	beq	.L215
.L172:
	ldr	r6, .L219+32
	ldr	r9, .L219+36
	ldr	r7, .L219+40
	sub	r4, r6, #1600
	b	.L174
.L216:
	ldr	r5, [r8]
.L174:
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	r9
	mov	r1, r4
	ldr	r0, .L219
	add	r4, r4, #40
	mov	lr, pc
	bx	r7
	cmp	r4, r6
	bne	.L216
	ldr	r5, .L219+44
	mov	r4, r5
	ldr	r7, .L219+48
	add	r9, r5, #880
.L175:
	mov	r0, r4
	add	r4, r4, #44
	mov	lr, pc
	bx	r7
	cmp	r9, r4
	bne	.L175
	ldr	r7, .L219+52
.L176:
	ldr	r4, .L219+56
.L177:
	ldr	fp, .L219
	mov	r1, r4
	mov	r2, fp
	add	r4, r4, #40
	mov	r0, r5
	mov	lr, pc
	bx	r7
	cmp	r6, r4
	bne	.L177
	add	r5, r5, #44
	cmp	r9, r5
	bne	.L176
	ldr	r3, [fp, #28]
	cmp	r3, #0
	beq	.L217
.L179:
	ldr	r2, [r8]
	tst	r2, #1
	ldreq	r1, .L219+60
	ldreq	r3, [r1]
	addeq	r3, r3, #1
	streq	r3, [r1]
	tst	r2, #3
	ldreq	r2, .L219+64
	ldr	r4, .L219+68
	ldreq	r3, [r2]
	ldr	r1, [r4]
	addeq	r3, r3, #1
	streq	r3, [r2]
	tst	r1, #1
	beq	.L182
	ldr	r3, .L219+72
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L182
	ldr	r5, .L219+76
	ldr	r3, [r5]
	ldr	r2, [r10, #4]
	cmn	r3, #1
	mov	r2, r2, asr #8
	beq	.L184
	add	r0, r3, r3, lsl #2
	add	r3, r3, r0, lsl #1
	ldr	r0, .L219+44
	add	r3, r0, r3, lsl #2
	ldr	r0, [r3, #4]
	add	r2, r2, #19
	cmp	r2, r0
	blt	.L184
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L184
.L182:
	tst	r1, #2
	beq	.L186
	ldr	r3, .L219+72
	ldr	r3, [r3]
	ands	r2, r3, #2
	beq	.L218
.L186:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L188
	ldr	r2, [r8]
	ldr	r3, .L219+8
	smull	r0, r1, r3, r2
	mov	r3, r2, asr #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, asl #1
	bne	.L168
	ldr	r3, [r10, #8]
	add	r3, r3, #1
	cmp	r3, #7
	str	r3, [r10, #8]
	beq	.L188
.L168:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L188:
	mov	r3, #0
	str	r3, [r10, #8]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L210:
	ldr	r1, .L219+80
	ldr	r3, [r1]
	cmp	r2, r3
	ldr	r4, .L219+16
	beq	.L169
	ldr	r3, [r4]
	sub	r3, r3, #50
	cmp	r3, #50
	movle	r3, #50
	str	r2, [r1]
	str	r3, [r4]
	b	.L169
.L218:
	ldr	r3, [r10, #52]
	cmp	r3, #0
	mov	r1, #1
	moveq	r2, #9
	ldr	r3, .L219
	streq	r1, [r3, #52]
	streq	r2, [r3, #12]
	strne	r2, [r3, #52]
	strne	r1, [r3, #12]
	b	.L186
.L184:
	ldr	r6, .L219+84
	mov	r3, #0
	ldr	r2, .L219+88
	ldr	r1, .L219+92
	ldr	r0, .L219+96
	ldr	r7, .L219+100
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	add	r2, r3, r3, lsl #2
	add	r0, r3, r2, lsl #1
	ldr	r3, .L219+44
	ldr	r1, .L219
	add	r0, r3, r0, lsl #2
	ldr	r3, .L219+104
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	add	r3, r2, #1
	cmp	r3, #18
	str	r3, [r6]
	movgt	r3, #0
	str	r2, [r5]
	ldrle	r1, [r4]
	ldrgt	r1, [r4]
	strgt	r3, [r6]
	b	.L182
.L217:
	bl	goToLose
	b	.L179
.L215:
	mov	lr, pc
	bx	r6
	ldr	r2, .L219+108
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #5
	add	r2, r3, r3, lsl #2
	rsb	r3, r3, r2, lsl #3
	rsb	r0, r3, r0
	ldr	r3, .L219+56
	add	r0, r0, r0, lsl #2
	add	r0, r3, r0, lsl #3
	ldr	r1, .L219
	ldr	r3, .L219+112
	mov	lr, pc
	bx	r3
	ldr	r5, [r8]
	b	.L172
.L220:
	.align	2
.L219:
	.word	boat
	.word	updateBoat
	.word	1717986919
	.word	difficultyReducer
	.word	difficulty
	.word	frame
	.word	rand
	.word	__aeabi_idivmod
	.word	obstacles+1600
	.word	updateObstacle
	.word	playerObstacleCollision
	.word	bullets
	.word	updateBullet
	.word	obstacleBulletCollision
	.word	obstacles
	.word	BG0hOff
	.word	BG1hOff
	.word	oldButtons
	.word	buttons
	.word	prevBullet
	.word	prevBoatKills
	.word	bulletCount
	.word	11025
	.word	4525
	.word	bullet
	.word	playSoundB
	.word	fireBullet
	.word	-770891565
	.word	fireObstacle
	.size	update, .-update
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	OAMSprites
	bl	update
	ldr	r3, .L228
	mov	lr, pc
	bx	r3
	ldr	r3, .L228+4
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L221
	ldr	r3, .L228+8
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L227
.L221:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L227:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L229:
	.align	2
.L228:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r7, fp, lr}
	mov	r10, #28
	mov	fp, #31
	mov	r9, #16
	mov	r8, #5
	mov	r7, #1
	ldr	r3, .L241
	mov	lr, pc
	bx	r3
	mov	r0, #65
	ldr	r2, .L241+4
	ldr	r3, .L241+8
	ldr	r1, .L241+12
	ldr	lr, .L241+16
	ldr	ip, .L241+20
	str	fp, [r2]
	str	r10, [r2, #4]
	str	r9, [r2, #8]
	str	r8, [r2, #12]
	str	r7, [r2, #16]
	ldr	r6, .L241+24
	ldr	r2, .L241+28
	ldr	r5, .L241+32
	ldr	r4, .L241+36
	stmib	r3, {r5, lr}
	str	r6, [r3]
	str	ip, [r3, #12]
	str	r2, [r3, #16]
	str	r0, [r1]
	str	r0, [r1, #4]
	str	r0, [r1, #8]
	mov	lr, pc
	bx	r4
	ldr	r3, .L241+40
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	ldr	r5, .L241+44
	ldr	fp, .L241+48
	ldr	r10, .L241+52
	ldr	r9, .L241+56
	ldr	r8, .L241+60
	ldr	r7, .L241+64
	ldr	r4, .L241+68
.L239:
	ldr	r3, [r5]
	ldr	r2, .L241+72
	str	r3, [r2]
	ldr	r3, [fp]
	ldr	r2, [r6, #304]
	str	r2, [r5]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L231
.L233:
	.word	.L232
	.word	.L234
	.word	.L235
	.word	.L236
	.word	.L237
	.word	.L238
.L238:
	ldr	r3, .L241+76
	mov	lr, pc
	bx	r3
.L231:
	ldrh	r3, [r10]
	strh	r3, [r6, #22]	@ movhi
	ldrh	r3, [r9]
	strh	r3, [r6, #20]	@ movhi
	ldrh	r3, [r8]
	strh	r3, [r6, #26]	@ movhi
	ldrh	r3, [r7]
	strh	r3, [r6, #24]	@ movhi
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	ldr	r3, .L241+80
	mov	lr, pc
	bx	r3
	b	.L239
.L237:
	ldr	r3, .L241+84
	mov	lr, pc
	bx	r3
	b	.L231
.L236:
	ldr	r3, .L241+88
	mov	lr, pc
	bx	r3
	b	.L231
.L235:
	ldr	r3, .L241+92
	mov	lr, pc
	bx	r3
	b	.L231
.L232:
	ldr	r3, .L241+96
	mov	lr, pc
	bx	r3
	b	.L231
.L234:
	ldr	r3, .L241+100
	mov	lr, pc
	bx	r3
	b	.L231
.L242:
	.align	2
.L241:
	.word	goToStart
	.word	highScores
	.word	initials
	.word	letters
	.word	.LC8
	.word	.LC9
	.word	.LC6
	.word	.LC10
	.word	.LC7
	.word	setupInterrupts
	.word	setupSounds
	.word	buttons
	.word	state
	.word	BG0vOff
	.word	BG0hOff
	.word	BG1vOff
	.word	BG1hOff
	.word	frame
	.word	oldButtons
	.word	scores
	.word	DMAShadowOAM
	.word	lose
	.word	pause
	.word	game
	.word	start
	.word	instructions
	.size	main, .-main
	.comm	prevBullet,4,4
	.comm	bulletCount,4,4
	.comm	bullets,880,4
	.comm	obstacles,1600,4
	.comm	boat,60,4
	.comm	state,4,4
	.global	lidx
	.comm	letters,12,4
	.global	myScore
	.comm	finalInitials,3,4
	.comm	initials,20,4
	.comm	highScores,20,4
	.comm	currObstacle,4,4
	.comm	prevBoatKills,4,4
	.comm	difficultyReducer,4,4
	.comm	difficulty,4,4
	.comm	frame,4,4
	.comm	BG1hOff,4,4
	.comm	BG1vOff,4,4
	.comm	BG0hOff,4,4
	.comm	BG0vOff,4,4
	.comm	buffer,100,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	myScore, %object
	.size	myScore, 4
myScore:
	.word	-1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"1st\000"
.LC1:
	.ascii	"2nd\000"
.LC2:
	.ascii	"3rd\000"
.LC3:
	.ascii	"4th\000"
.LC4:
	.ascii	"5th\000"
.LC5:
	.ascii	"*\000"
	.space	2
.LC6:
	.ascii	"RON\000"
.LC7:
	.ascii	"BOB\000"
.LC8:
	.ascii	"COW\000"
.LC9:
	.ascii	"DAB\000"
.LC10:
	.ascii	"DWS\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lidx, %object
	.size	lidx, 4
lidx:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
