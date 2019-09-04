	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	arm7tdmi
	.eabi_attribute	6, 2	@ Tag_CPU_arch
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 1	@ Tag_THUMB_ISA_use
	.eabi_attribute	34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute	15, 1	@ Tag_ABI_PCS_RW_data
	.eabi_attribute	16, 1	@ Tag_ABI_PCS_RO_data
	.eabi_attribute	17, 2	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"MatrixMultiplication.c"
	.globl	main                    @ -- Begin function main
	.p2align	2
	.type	main,%function
	.code	32                      @ @main
main:
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.pad	#136
	sub	sp, sp, #136
	mov	r0, #0
	str	r0, [r11, #-20]
	b	.LBB0_1
.LBB0_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, .LCPI0_0
.LPC0_0:
	add	r0, pc, r0
	bl	printf
	ldr	lr, .LCPI0_1
.LPC0_1:
	add	lr, pc, lr
	sub	r1, r11, #24
	str	r0, [r11, #-76]         @ 4-byte Spill
	mov	r0, lr
	str	lr, [r11, #-80]         @ 4-byte Spill
	bl	scanf
	ldr	r1, .LCPI0_2
.LPC0_2:
	add	r1, pc, r1
	str	r0, [r11, #-84]         @ 4-byte Spill
	mov	r0, r1
	bl	printf
	sub	r1, r11, #28
	ldr	lr, [r11, #-80]         @ 4-byte Reload
	str	r0, [r11, #-88]         @ 4-byte Spill
	mov	r0, lr
	bl	scanf
	ldr	r1, .LCPI0_3
.LPC0_3:
	add	r1, pc, r1
	str	r0, [r11, #-92]         @ 4-byte Spill
	mov	r0, r1
	bl	printf
	sub	r1, r11, #32
	ldr	lr, [r11, #-80]         @ 4-byte Reload
	str	r0, [r11, #-96]         @ 4-byte Spill
	mov	r0, lr
	bl	scanf
	ldr	r1, .LCPI0_4
.LPC0_4:
	add	r1, pc, r1
	str	r0, [r11, #-100]        @ 4-byte Spill
	mov	r0, r1
	bl	printf
	sub	r1, r11, #36
	ldr	lr, [r11, #-80]         @ 4-byte Reload
	str	r0, [r11, #-104]        @ 4-byte Spill
	mov	r0, lr
	bl	scanf
	ldr	r1, [r11, #-24]
	ldr	lr, [r11, #-36]
	cmp	r1, lr
	str	r0, [r11, #-108]        @ 4-byte Spill
	beq	.LBB0_3
	b	.LBB0_2
.LBB0_2:                                @   in Loop: Header=BB0_1 Depth=1
	ldr	r0, .LCPI0_5
.LPC0_5:
	add	r0, pc, r0
	bl	printf
	str	r0, [r11, #-112]        @ 4-byte Spill
	b	.LBB0_1
.LBB0_3:
	ldr	r0, [r11, #-28]
	ldr	r1, [r11, #-24]
	mov	r2, sp
	str	r2, [r11, #-48]
	mul	r2, r0, r1
	mov	r3, #7
	add	r2, r3, r2, lsl #2
	bic	r2, r2, #7
	mov	r12, sp
	sub	r2, r12, r2
	mov	sp, r2
	str	r0, [r11, #-52]
	str	r1, [r11, #-56]
	ldr	r0, [r11, #-36]
	ldr	r12, [r11, #-32]
	mul	lr, r0, r12
	add	lr, r3, lr, lsl #2
	bic	lr, lr, #7
	mov	r4, sp
	sub	lr, r4, lr
	mov	sp, lr
	str	r0, [r11, #-60]
	str	r12, [r11, #-64]
	ldr	r0, [r11, #-28]
	ldr	r4, [r11, #-32]
	mul	r5, r0, r4
	add	r3, r3, r5, lsl #2
	bic	r3, r3, #7
	mov	r5, sp
	sub	r3, r5, r3
	mov	sp, r3
	str	r0, [r11, #-68]
	str	r4, [r11, #-72]
	ldr	r0, .LCPI0_6
.LPC0_6:
	add	r0, pc, r0
	str	r1, [r11, #-116]        @ 4-byte Spill
	str	r2, [r11, #-120]        @ 4-byte Spill
	str	r12, [r11, #-124]       @ 4-byte Spill
	str	lr, [r11, #-128]        @ 4-byte Spill
	str	r3, [r11, #-132]        @ 4-byte Spill
	bl	printf
	mov	r1, #0
	str	r1, [r11, #-40]
	str	r0, [r11, #-136]        @ 4-byte Spill
	b	.LBB0_4
.LBB0_4:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB0_6 Depth 2
	ldr	r0, [r11, #-40]
	ldr	r1, [r11, #-28]
	cmp	r0, r1
	bge	.LBB0_11
	b	.LBB0_5
.LBB0_5:                                @   in Loop: Header=BB0_4 Depth=1
	mov	r0, #0
	str	r0, [r11, #-44]
	b	.LBB0_6
.LBB0_6:                                @   Parent Loop BB0_4 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [r11, #-44]
	ldr	r1, [r11, #-24]
	cmp	r0, r1
	bge	.LBB0_9
	b	.LBB0_7
.LBB0_7:                                @   in Loop: Header=BB0_6 Depth=2
	ldr	r0, [r11, #-40]
	ldr	r2, [r11, #-116]        @ 4-byte Reload
	mul	r1, r0, r2
	ldr	r0, [r11, #-120]        @ 4-byte Reload
	add	r1, r0, r1, lsl #2
	ldr	r3, [r11, #-44]
	add	r1, r1, r3, lsl #2
	ldr	r0, .LCPI0_7
.LPC0_7:
	add	r0, pc, r0
	bl	scanf
	str	r0, [r11, #-140]        @ 4-byte Spill
	b	.LBB0_8
.LBB0_8:                                @   in Loop: Header=BB0_6 Depth=2
	ldr	r0, [r11, #-44]
	add	r0, r0, #1
	str	r0, [r11, #-44]
	b	.LBB0_6
.LBB0_9:                                @   in Loop: Header=BB0_4 Depth=1
	b	.LBB0_10
.LBB0_10:                               @   in Loop: Header=BB0_4 Depth=1
	ldr	r0, [r11, #-40]
	add	r0, r0, #1
	str	r0, [r11, #-40]
	b	.LBB0_4
.LBB0_11:
	ldr	r0, .LCPI0_8
.LPC0_8:
	add	r0, pc, r0
	bl	printf
	mov	lr, #0
	str	lr, [r11, #-40]
	str	r0, [r11, #-144]        @ 4-byte Spill
	b	.LBB0_12
.LBB0_12:                               @ =>This Loop Header: Depth=1
                                        @     Child Loop BB0_14 Depth 2
	ldr	r0, [r11, #-40]
	ldr	r1, [r11, #-36]
	cmp	r0, r1
	bge	.LBB0_19
	b	.LBB0_13
.LBB0_13:                               @   in Loop: Header=BB0_12 Depth=1
	mov	r0, #0
	str	r0, [r11, #-44]
	b	.LBB0_14
.LBB0_14:                               @   Parent Loop BB0_12 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [r11, #-44]
	ldr	r1, [r11, #-32]
	cmp	r0, r1
	bge	.LBB0_17
	b	.LBB0_15
.LBB0_15:                               @   in Loop: Header=BB0_14 Depth=2
	ldr	r0, [r11, #-40]
	ldr	r2, [r11, #-124]        @ 4-byte Reload
	mul	r1, r0, r2
	ldr	r0, [r11, #-128]        @ 4-byte Reload
	add	r1, r0, r1, lsl #2
	ldr	r3, [r11, #-44]
	add	r1, r1, r3, lsl #2
	ldr	r0, .LCPI0_9
.LPC0_9:
	add	r0, pc, r0
	bl	scanf
	str	r0, [r11, #-148]        @ 4-byte Spill
	b	.LBB0_16
.LBB0_16:                               @   in Loop: Header=BB0_14 Depth=2
	ldr	r0, [r11, #-44]
	add	r0, r0, #1
	str	r0, [r11, #-44]
	b	.LBB0_14
.LBB0_17:                               @   in Loop: Header=BB0_12 Depth=1
	b	.LBB0_18
.LBB0_18:                               @   in Loop: Header=BB0_12 Depth=1
	ldr	r0, [r11, #-40]
	add	r0, r0, #1
	str	r0, [r11, #-40]
	b	.LBB0_12
.LBB0_19:
	ldr	r0, [r11, #-24]
	ldr	r1, [r11, #-32]
	ldr	r2, [r11, #-28]
	ldr	r3, [r11, #-36]
	sub	sp, sp, #16
	mov	r12, sp
	ldr	lr, [r11, #-132]        @ 4-byte Reload
	str	lr, [r12, #8]
	ldr	r4, [r11, #-128]        @ 4-byte Reload
	str	r4, [r12, #4]
	ldr	r5, [r11, #-120]        @ 4-byte Reload
	str	r5, [r12]
	bl	mulMatrix
	add	sp, sp, #16
	ldr	r0, [r11, #-28]
	ldr	r1, [r11, #-32]
	ldr	r2, [r11, #-132]        @ 4-byte Reload
	bl	printMatrix
	mov	r0, #0
	str	r0, [r11, #-20]
	ldr	r0, [r11, #-48]
	mov	sp, r0
	ldr	r0, [r11, #-20]
	sub	sp, r11, #16
	pop	{r4, r5, r6, r7, r11, lr}
	bx	lr
	.p2align	2
@ %bb.20:
.LCPI0_0:
	.long	.L.str-(.LPC0_0+8)
.LCPI0_1:
	.long	.L.str.1-(.LPC0_1+8)
.LCPI0_2:
	.long	.L.str.2-(.LPC0_2+8)
.LCPI0_3:
	.long	.L.str.3-(.LPC0_3+8)
.LCPI0_4:
	.long	.L.str.4-(.LPC0_4+8)
.LCPI0_5:
	.long	.L.str.5-(.LPC0_5+8)
.LCPI0_6:
	.long	.L.str.6-(.LPC0_6+8)
.LCPI0_7:
	.long	.L.str.1-(.LPC0_7+8)
.LCPI0_8:
	.long	.L.str.7-(.LPC0_8+8)
.LCPI0_9:
	.long	.L.str.1-(.LPC0_9+8)
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	mulMatrix               @ -- Begin function mulMatrix
	.p2align	2
	.type	mulMatrix,%function
	.code	32                      @ @mulMatrix
mulMatrix:
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r10, r11, lr}
	.setfp	r11, sp, #24
	add	r11, sp, #24
	.pad	#72
	sub	sp, sp, #72
	ldr	r12, [r11, #16]
	ldr	lr, [r11, #12]
	ldr	r4, [r11, #8]
	mov	r5, r3
	mov	r6, r2
	mov	r7, r1
	mov	r8, r0
	str	r0, [r11, #-28]
	str	r1, [r11, #-32]
	str	r2, [r11, #-36]
	str	r3, [r11, #-40]
	ldr	r0, [r11, #-28]
	ldr	r1, [r11, #-32]
	mov	r2, r1
	mov	r3, #0
	str	r3, [r11, #-44]
	str	r12, [sp, #36]          @ 4-byte Spill
	str	lr, [sp, #32]           @ 4-byte Spill
	str	r4, [sp, #28]           @ 4-byte Spill
	str	r5, [sp, #24]           @ 4-byte Spill
	str	r6, [sp, #20]           @ 4-byte Spill
	str	r7, [sp, #16]           @ 4-byte Spill
	str	r8, [sp, #12]           @ 4-byte Spill
	str	r0, [sp, #8]            @ 4-byte Spill
	str	r1, [sp, #4]            @ 4-byte Spill
	str	r2, [sp]                @ 4-byte Spill
	b	.LBB1_1
.LBB1_1:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB1_3 Depth 2
                                        @       Child Loop BB1_5 Depth 3
	ldr	r0, [r11, #-44]
	ldr	r1, [r11, #-36]
	cmp	r0, r1
	bge	.LBB1_12
	b	.LBB1_2
.LBB1_2:                                @   in Loop: Header=BB1_1 Depth=1
	mov	r0, #0
	str	r0, [sp, #48]
	b	.LBB1_3
.LBB1_3:                                @   Parent Loop BB1_1 Depth=1
                                        @ =>  This Loop Header: Depth=2
                                        @       Child Loop BB1_5 Depth 3
	ldr	r0, [sp, #48]
	ldr	r1, [r11, #-32]
	cmp	r0, r1
	bge	.LBB1_10
	b	.LBB1_4
.LBB1_4:                                @   in Loop: Header=BB1_3 Depth=2
	mov	r0, #0
	str	r0, [sp, #40]
	str	r0, [sp, #44]
	b	.LBB1_5
.LBB1_5:                                @   Parent Loop BB1_1 Depth=1
                                        @     Parent Loop BB1_3 Depth=2
                                        @ =>    This Inner Loop Header: Depth=3
	ldr	r0, [sp, #44]
	ldr	r1, [r11, #-28]
	cmp	r0, r1
	bge	.LBB1_8
	b	.LBB1_6
.LBB1_6:                                @   in Loop: Header=BB1_5 Depth=3
	ldr	r0, [r11, #8]
	ldr	r1, [r11, #-44]
	ldr	r3, [sp, #8]            @ 4-byte Reload
	mul	r2, r1, r3
	add	r0, r0, r2, lsl #2
	ldr	r1, [sp, #44]
	ldr	r0, [r0, r1, lsl #2]
	ldr	r2, [r11, #12]
	ldr	lr, [sp]                @ 4-byte Reload
	mul	r12, r1, lr
	add	r1, r2, r12, lsl #2
	ldr	r2, [sp, #48]
	ldr	r1, [r1, r2, lsl #2]
	ldr	r2, [sp, #40]
	mla	r12, r0, r1, r2
	str	r12, [sp, #40]
	b	.LBB1_7
.LBB1_7:                                @   in Loop: Header=BB1_5 Depth=3
	ldr	r0, [sp, #44]
	add	r0, r0, #1
	str	r0, [sp, #44]
	b	.LBB1_5
.LBB1_8:                                @   in Loop: Header=BB1_3 Depth=2
	ldr	r0, [sp, #40]
	ldr	r1, [r11, #16]
	ldr	r2, [r11, #-44]
	ldr	r12, [sp, #4]           @ 4-byte Reload
	mul	r3, r2, r12
	add	r1, r1, r3, lsl #2
	ldr	r2, [sp, #48]
	str	r0, [r1, r2, lsl #2]
	b	.LBB1_9
.LBB1_9:                                @   in Loop: Header=BB1_3 Depth=2
	ldr	r0, [sp, #48]
	add	r0, r0, #1
	str	r0, [sp, #48]
	b	.LBB1_3
.LBB1_10:                               @   in Loop: Header=BB1_1 Depth=1
	b	.LBB1_11
.LBB1_11:                               @   in Loop: Header=BB1_1 Depth=1
	ldr	r0, [r11, #-44]
	add	r0, r0, #1
	str	r0, [r11, #-44]
	b	.LBB1_1
.LBB1_12:
	sub	sp, r11, #24
	pop	{r4, r5, r6, r7, r8, r10, r11, lr}
	bx	lr
.Lfunc_end1:
	.size	mulMatrix, .Lfunc_end1-mulMatrix
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	printMatrix             @ -- Begin function printMatrix
	.p2align	2
	.type	printMatrix,%function
	.code	32                      @ @printMatrix
printMatrix:
	.fnstart
@ %bb.0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	.pad	#48
	sub	sp, sp, #48
	mov	r3, r2
	mov	r12, r1
	mov	lr, r0
	str	r0, [r11, #-4]
	str	r1, [r11, #-8]
	str	r2, [r11, #-12]
	ldr	r0, [r11, #-4]
	mov	r1, #0
	str	r1, [r11, #-16]
	str	r3, [sp, #24]           @ 4-byte Spill
	str	r12, [sp, #20]          @ 4-byte Spill
	str	lr, [sp, #16]           @ 4-byte Spill
	str	r0, [sp, #12]           @ 4-byte Spill
	b	.LBB2_1
.LBB2_1:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB2_3 Depth 2
	ldr	r0, [r11, #-16]
	ldr	r1, [r11, #-4]
	cmp	r0, r1
	bge	.LBB2_10
	b	.LBB2_2
.LBB2_2:                                @   in Loop: Header=BB2_1 Depth=1
	mov	r0, #0
	str	r0, [r11, #-20]
	b	.LBB2_3
.LBB2_3:                                @   Parent Loop BB2_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [r11, #-20]
	ldr	r1, [r11, #-8]
	cmp	r0, r1
	bge	.LBB2_8
	b	.LBB2_4
.LBB2_4:                                @   in Loop: Header=BB2_3 Depth=2
	ldr	r0, [r11, #-12]
	ldr	r1, [r11, #-16]
	ldr	r3, [sp, #12]           @ 4-byte Reload
	mul	r2, r1, r3
	add	r0, r0, r2, lsl #2
	ldr	r1, [r11, #-20]
	ldr	r1, [r0, r1, lsl #2]
	ldr	r0, .LCPI2_0
.LPC2_0:
	add	r0, pc, r0
	bl	printf
	ldr	r1, [r11, #-20]
	ldr	r2, [r11, #-8]
	sub	r2, r2, #1
	cmp	r1, r2
	str	r0, [sp, #8]            @ 4-byte Spill
	bne	.LBB2_6
	b	.LBB2_5
.LBB2_5:                                @   in Loop: Header=BB2_3 Depth=2
	ldr	r0, .LCPI2_1
.LPC2_1:
	add	r0, pc, r0
	bl	printf
	str	r0, [sp, #4]            @ 4-byte Spill
	b	.LBB2_6
.LBB2_6:                                @   in Loop: Header=BB2_3 Depth=2
	b	.LBB2_7
.LBB2_7:                                @   in Loop: Header=BB2_3 Depth=2
	ldr	r0, [r11, #-20]
	add	r0, r0, #1
	str	r0, [r11, #-20]
	b	.LBB2_3
.LBB2_8:                                @   in Loop: Header=BB2_1 Depth=1
	b	.LBB2_9
.LBB2_9:                                @   in Loop: Header=BB2_1 Depth=1
	ldr	r0, [r11, #-16]
	add	r0, r0, #1
	str	r0, [r11, #-16]
	b	.LBB2_1
.LBB2_10:
	mov	sp, r11
	pop	{r11, lr}
	bx	lr
	.p2align	2
@ %bb.11:
.LCPI2_0:
	.long	.L.str.8-(.LPC2_0+8)
.LCPI2_1:
	.long	.L.str.9-(.LPC2_1+8)
.Lfunc_end2:
	.size	printMatrix, .Lfunc_end2-printMatrix
	.cantunwind
	.fnend
                                        @ -- End function
	.type	.L.str,%object          @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"A_row_length = "
	.size	.L.str, 16

	.type	.L.str.1,%object        @ @.str.1
.L.str.1:
	.asciz	"%d"
	.size	.L.str.1, 3

	.type	.L.str.2,%object        @ @.str.2
.L.str.2:
	.asciz	"A_column_length = "
	.size	.L.str.2, 19

	.type	.L.str.3,%object        @ @.str.3
.L.str.3:
	.asciz	"B_row_length = "
	.size	.L.str.3, 16

	.type	.L.str.4,%object        @ @.str.4
.L.str.4:
	.asciz	"B_column_length = "
	.size	.L.str.4, 19

	.type	.L.str.5,%object        @ @.str.5
.L.str.5:
	.asciz	"Invalid size of operand matrices.\n"
	.size	.L.str.5, 35

	.type	.L.str.6,%object        @ @.str.6
.L.str.6:
	.asciz	"Input A row vectors:\n"
	.size	.L.str.6, 22

	.type	.L.str.7,%object        @ @.str.7
.L.str.7:
	.asciz	"Input B row vectors:\n"
	.size	.L.str.7, 22

	.type	.L.str.8,%object        @ @.str.8
.L.str.8:
	.asciz	"%-4d"
	.size	.L.str.8, 5

	.type	.L.str.9,%object        @ @.str.9
.L.str.9:
	.asciz	"\n"
	.size	.L.str.9, 2


	.ident	"clang version 8.0.0 (tags/RELEASE_800/final)"
	.section	".note.GNU-stack","",%progbits
