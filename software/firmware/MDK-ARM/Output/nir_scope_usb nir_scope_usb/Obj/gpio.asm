	.cpu cortex-m4
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"gpio.c"
	.text
.Ltext0:
	.section	.text.MX_GPIO_Init,"ax",%progbits
	.align	1
	.global	MX_GPIO_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	MX_GPIO_Init, %function
MX_GPIO_Init:
.LFB123:
	.file 1 "/Users/armin/CloudStation/02_projects/15_precious_plastic/nir_scope_usb/Src/gpio.c"
	.loc 1 42 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #36
.LCFI1:
	.loc 1 44 20
	add	r3, sp, #12
	movs	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
.LBB2:
	.loc 1 47 3
	ldr	r3, .L2
	ldr	r3, [r3, #20]
	ldr	r2, .L2
	orr	r3, r3, #4194304
	str	r3, [r2, #20]
	ldr	r3, .L2
	ldr	r3, [r3, #20]
	and	r3, r3, #4194304
	str	r3, [sp, #8]
	ldr	r3, [sp, #8]
.LBE2:
.LBB3:
	.loc 1 48 3
	ldr	r3, .L2
	ldr	r3, [r3, #20]
	ldr	r2, .L2
	orr	r3, r3, #131072
	str	r3, [r2, #20]
	ldr	r3, .L2
	ldr	r3, [r3, #20]
	and	r3, r3, #131072
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
.LBE3:
.LBB4:
	.loc 1 49 3
	ldr	r3, .L2
	ldr	r3, [r3, #20]
	ldr	r2, .L2
	orr	r3, r3, #262144
	str	r3, [r2, #20]
	ldr	r3, .L2
	ldr	r3, [r3, #20]
	and	r3, r3, #262144
	str	r3, [sp]
	ldr	r3, [sp]
.LBE4:
	.loc 1 52 3
	movs	r2, #1
	movw	r1, #33920
	mov	r0, #1207959552
	bl	HAL_GPIO_WritePin
	.loc 1 55 3
	movs	r2, #1
	movs	r1, #1
	ldr	r0, .L2+4
	bl	HAL_GPIO_WritePin
	.loc 1 58 23
	movw	r3, #33920
	str	r3, [sp, #12]
	.loc 1 59 24
	movs	r3, #1
	str	r3, [sp, #16]
	.loc 1 60 24
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 61 25
	movs	r3, #0
	str	r3, [sp, #24]
	.loc 1 62 3
	add	r3, sp, #12
	mov	r1, r3
	mov	r0, #1207959552
	bl	HAL_GPIO_Init
	.loc 1 65 23
	movs	r3, #1
	str	r3, [sp, #12]
	.loc 1 66 24
	movs	r3, #1
	str	r3, [sp, #16]
	.loc 1 67 24
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 68 25
	movs	r3, #0
	str	r3, [sp, #24]
	.loc 1 69 3
	add	r3, sp, #12
	mov	r1, r3
	ldr	r0, .L2+4
	bl	HAL_GPIO_Init
	.loc 1 72 23
	mov	r3, #256
	str	r3, [sp, #12]
	.loc 1 73 24
	movs	r3, #2
	str	r3, [sp, #16]
	.loc 1 74 24
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 75 25
	movs	r3, #3
	str	r3, [sp, #24]
	.loc 1 76 29
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 77 3
	add	r3, sp, #12
	mov	r1, r3
	mov	r0, #1207959552
	bl	HAL_GPIO_Init
	.loc 1 80 23
	mov	r3, #512
	str	r3, [sp, #12]
	.loc 1 81 24
	movs	r3, #0
	str	r3, [sp, #16]
	.loc 1 82 24
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 83 3
	add	r3, sp, #12
	mov	r1, r3
	mov	r0, #1207959552
	bl	HAL_GPIO_Init
	.loc 1 85 1
	nop
	add	sp, sp, #36
.LCFI2:
	@ sp needed
	ldr	pc, [sp], #4
.L3:
	.align	2
.L2:
	.word	1073876992
	.word	1207960576
.LFE123:
	.size	MX_GPIO_Init, .-MX_GPIO_Init
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB123
	.4byte	.LFE123-.LFB123
	.byte	0x4
	.4byte	.LCFI0-.LFB123
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE0:
	.text
.Letext0:
	.file 2 "/Applications/SEGGER Embedded Studio for ARM 4.20a/include/stdint.h"
	.file 3 "../Drivers/CMSIS/Include/core_cm4.h"
	.file 4 "../Drivers/CMSIS/Device/ST/STM32F3xx/Include/system_stm32f3xx.h"
	.file 5 "../Drivers/CMSIS/Device/ST/STM32F3xx/Include/stm32f302x8.h"
	.file 6 "/Applications/SEGGER Embedded Studio for ARM 4.20a/include/__crossworks.h"
	.file 7 "/Applications/SEGGER Embedded Studio for ARM 4.20a/include/stdio.h"
	.file 8 "../Drivers/STM32F3xx_HAL_Driver/Inc/stm32f3xx_hal_gpio.h"
	.file 9 "../Drivers/STM32F3xx_HAL_Driver/Inc/stm32f3xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x965
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF132
	.byte	0xc
	.4byte	.LASF133
	.4byte	.LASF134
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x30
	.byte	0x1c
	.4byte	0x3d
	.uleb128 0x4
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x4
	.4byte	0x3d
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x36
	.byte	0x1c
	.4byte	0x5c
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x37
	.byte	0x1c
	.4byte	0x74
	.uleb128 0x5
	.4byte	0x63
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x38
	.byte	0x1c
	.4byte	0x8c
	.uleb128 0x5
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x3
	.2byte	0x744
	.byte	0x19
	.4byte	0x6f
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x4
	.byte	0x4a
	.byte	0x11
	.4byte	0x7b
	.uleb128 0x9
	.4byte	0x38
	.4byte	0xca
	.uleb128 0xa
	.4byte	0x8c
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.4byte	0xba
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x4
	.byte	0x4b
	.byte	0x16
	.4byte	0xca
	.uleb128 0x9
	.4byte	0x38
	.4byte	0xeb
	.uleb128 0xa
	.4byte	0x8c
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.4byte	0xdb
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x4
	.byte	0x4c
	.byte	0x16
	.4byte	0xeb
	.uleb128 0xb
	.byte	0x2c
	.byte	0x5
	.2byte	0x19e
	.byte	0x9
	.4byte	0x193
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x5
	.2byte	0x1a0
	.byte	0x11
	.4byte	0x87
	.byte	0
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x5
	.2byte	0x1a1
	.byte	0x11
	.4byte	0x87
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x5
	.2byte	0x1a2
	.byte	0x11
	.4byte	0x87
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x5
	.2byte	0x1a3
	.byte	0x11
	.4byte	0x87
	.byte	0xc
	.uleb128 0xd
	.ascii	"IDR\000"
	.byte	0x5
	.2byte	0x1a4
	.byte	0x11
	.4byte	0x87
	.byte	0x10
	.uleb128 0xd
	.ascii	"ODR\000"
	.byte	0x5
	.2byte	0x1a5
	.byte	0x11
	.4byte	0x87
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x5
	.2byte	0x1a6
	.byte	0x11
	.4byte	0x87
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x5
	.2byte	0x1a7
	.byte	0x11
	.4byte	0x87
	.byte	0x1c
	.uleb128 0xd
	.ascii	"AFR\000"
	.byte	0x5
	.2byte	0x1a8
	.byte	0x11
	.4byte	0x1a3
	.byte	0x20
	.uleb128 0xd
	.ascii	"BRR\000"
	.byte	0x5
	.2byte	0x1a9
	.byte	0x11
	.4byte	0x87
	.byte	0x28
	.byte	0
	.uleb128 0x9
	.4byte	0x87
	.4byte	0x1a3
	.uleb128 0xa
	.4byte	0x8c
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x193
	.uleb128 0xe
	.4byte	.LASF21
	.byte	0x5
	.2byte	0x1aa
	.byte	0x2
	.4byte	0xfc
	.uleb128 0xb
	.byte	0x34
	.byte	0x5
	.2byte	0x1ee
	.byte	0x9
	.4byte	0x275
	.uleb128 0xd
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x1f0
	.byte	0x11
	.4byte	0x87
	.byte	0
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x1f1
	.byte	0x11
	.4byte	0x87
	.byte	0x4
	.uleb128 0xd
	.ascii	"CIR\000"
	.byte	0x5
	.2byte	0x1f2
	.byte	0x11
	.4byte	0x87
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x1f3
	.byte	0x11
	.4byte	0x87
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x5
	.2byte	0x1f4
	.byte	0x11
	.4byte	0x87
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x1f5
	.byte	0x11
	.4byte	0x87
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x1f6
	.byte	0x11
	.4byte	0x87
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x1f7
	.byte	0x11
	.4byte	0x87
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x1f8
	.byte	0x11
	.4byte	0x87
	.byte	0x20
	.uleb128 0xd
	.ascii	"CSR\000"
	.byte	0x5
	.2byte	0x1f9
	.byte	0x11
	.4byte	0x87
	.byte	0x24
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x5
	.2byte	0x1fa
	.byte	0x11
	.4byte	0x87
	.byte	0x28
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x5
	.2byte	0x1fb
	.byte	0x11
	.4byte	0x87
	.byte	0x2c
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x5
	.2byte	0x1fc
	.byte	0x11
	.4byte	0x87
	.byte	0x30
	.byte	0
	.uleb128 0xe
	.4byte	.LASF32
	.byte	0x5
	.2byte	0x1fd
	.byte	0x3
	.4byte	0x1b5
	.uleb128 0xf
	.4byte	.LASF83
	.byte	0x8
	.byte	0x6
	.byte	0x7e
	.byte	0x8
	.4byte	0x2aa
	.uleb128 0x10
	.4byte	.LASF33
	.byte	0x6
	.byte	0x7f
	.byte	0x7
	.4byte	0x74
	.byte	0
	.uleb128 0x10
	.4byte	.LASF34
	.byte	0x6
	.byte	0x80
	.byte	0x8
	.4byte	0x2aa
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF35
	.uleb128 0x11
	.4byte	0x74
	.4byte	0x2ca
	.uleb128 0x12
	.4byte	0x2ca
	.uleb128 0x12
	.4byte	0x8c
	.uleb128 0x12
	.4byte	0x2dc
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x2d0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF36
	.uleb128 0x4
	.4byte	0x2d0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x282
	.uleb128 0x11
	.4byte	0x74
	.4byte	0x300
	.uleb128 0x12
	.4byte	0x300
	.uleb128 0x12
	.4byte	0x306
	.uleb128 0x12
	.4byte	0x8c
	.uleb128 0x12
	.4byte	0x2dc
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x8c
	.uleb128 0x13
	.byte	0x4
	.4byte	0x2d7
	.uleb128 0x14
	.byte	0x58
	.byte	0x6
	.byte	0x86
	.byte	0x9
	.4byte	0x4b6
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0x6
	.byte	0x88
	.byte	0xf
	.4byte	0x306
	.byte	0
	.uleb128 0x10
	.4byte	.LASF38
	.byte	0x6
	.byte	0x89
	.byte	0xf
	.4byte	0x306
	.byte	0x4
	.uleb128 0x10
	.4byte	.LASF39
	.byte	0x6
	.byte	0x8a
	.byte	0xf
	.4byte	0x306
	.byte	0x8
	.uleb128 0x10
	.4byte	.LASF40
	.byte	0x6
	.byte	0x8c
	.byte	0xf
	.4byte	0x306
	.byte	0xc
	.uleb128 0x10
	.4byte	.LASF41
	.byte	0x6
	.byte	0x8d
	.byte	0xf
	.4byte	0x306
	.byte	0x10
	.uleb128 0x10
	.4byte	.LASF42
	.byte	0x6
	.byte	0x8e
	.byte	0xf
	.4byte	0x306
	.byte	0x14
	.uleb128 0x10
	.4byte	.LASF43
	.byte	0x6
	.byte	0x8f
	.byte	0xf
	.4byte	0x306
	.byte	0x18
	.uleb128 0x10
	.4byte	.LASF44
	.byte	0x6
	.byte	0x90
	.byte	0xf
	.4byte	0x306
	.byte	0x1c
	.uleb128 0x10
	.4byte	.LASF45
	.byte	0x6
	.byte	0x91
	.byte	0xf
	.4byte	0x306
	.byte	0x20
	.uleb128 0x10
	.4byte	.LASF46
	.byte	0x6
	.byte	0x92
	.byte	0xf
	.4byte	0x306
	.byte	0x24
	.uleb128 0x10
	.4byte	.LASF47
	.byte	0x6
	.byte	0x94
	.byte	0x8
	.4byte	0x2d0
	.byte	0x28
	.uleb128 0x10
	.4byte	.LASF48
	.byte	0x6
	.byte	0x95
	.byte	0x8
	.4byte	0x2d0
	.byte	0x29
	.uleb128 0x10
	.4byte	.LASF49
	.byte	0x6
	.byte	0x96
	.byte	0x8
	.4byte	0x2d0
	.byte	0x2a
	.uleb128 0x10
	.4byte	.LASF50
	.byte	0x6
	.byte	0x97
	.byte	0x8
	.4byte	0x2d0
	.byte	0x2b
	.uleb128 0x10
	.4byte	.LASF51
	.byte	0x6
	.byte	0x98
	.byte	0x8
	.4byte	0x2d0
	.byte	0x2c
	.uleb128 0x10
	.4byte	.LASF52
	.byte	0x6
	.byte	0x99
	.byte	0x8
	.4byte	0x2d0
	.byte	0x2d
	.uleb128 0x10
	.4byte	.LASF53
	.byte	0x6
	.byte	0x9a
	.byte	0x8
	.4byte	0x2d0
	.byte	0x2e
	.uleb128 0x10
	.4byte	.LASF54
	.byte	0x6
	.byte	0x9b
	.byte	0x8
	.4byte	0x2d0
	.byte	0x2f
	.uleb128 0x10
	.4byte	.LASF55
	.byte	0x6
	.byte	0x9c
	.byte	0x8
	.4byte	0x2d0
	.byte	0x30
	.uleb128 0x10
	.4byte	.LASF56
	.byte	0x6
	.byte	0x9d
	.byte	0x8
	.4byte	0x2d0
	.byte	0x31
	.uleb128 0x10
	.4byte	.LASF57
	.byte	0x6
	.byte	0x9e
	.byte	0x8
	.4byte	0x2d0
	.byte	0x32
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x6
	.byte	0x9f
	.byte	0x8
	.4byte	0x2d0
	.byte	0x33
	.uleb128 0x10
	.4byte	.LASF59
	.byte	0x6
	.byte	0xa0
	.byte	0x8
	.4byte	0x2d0
	.byte	0x34
	.uleb128 0x10
	.4byte	.LASF60
	.byte	0x6
	.byte	0xa1
	.byte	0x8
	.4byte	0x2d0
	.byte	0x35
	.uleb128 0x10
	.4byte	.LASF61
	.byte	0x6
	.byte	0xa6
	.byte	0xf
	.4byte	0x306
	.byte	0x38
	.uleb128 0x10
	.4byte	.LASF62
	.byte	0x6
	.byte	0xa7
	.byte	0xf
	.4byte	0x306
	.byte	0x3c
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x6
	.byte	0xa8
	.byte	0xf
	.4byte	0x306
	.byte	0x40
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x6
	.byte	0xa9
	.byte	0xf
	.4byte	0x306
	.byte	0x44
	.uleb128 0x10
	.4byte	.LASF65
	.byte	0x6
	.byte	0xaa
	.byte	0xf
	.4byte	0x306
	.byte	0x48
	.uleb128 0x10
	.4byte	.LASF66
	.byte	0x6
	.byte	0xab
	.byte	0xf
	.4byte	0x306
	.byte	0x4c
	.uleb128 0x10
	.4byte	.LASF67
	.byte	0x6
	.byte	0xac
	.byte	0xf
	.4byte	0x306
	.byte	0x50
	.uleb128 0x10
	.4byte	.LASF68
	.byte	0x6
	.byte	0xad
	.byte	0xf
	.4byte	0x306
	.byte	0x54
	.byte	0
	.uleb128 0x3
	.4byte	.LASF69
	.byte	0x6
	.byte	0xae
	.byte	0x3
	.4byte	0x30c
	.uleb128 0x4
	.4byte	0x4b6
	.uleb128 0x14
	.byte	0x20
	.byte	0x6
	.byte	0xc4
	.byte	0x9
	.4byte	0x539
	.uleb128 0x10
	.4byte	.LASF70
	.byte	0x6
	.byte	0xc6
	.byte	0x9
	.4byte	0x54d
	.byte	0
	.uleb128 0x10
	.4byte	.LASF71
	.byte	0x6
	.byte	0xc7
	.byte	0x9
	.4byte	0x562
	.byte	0x4
	.uleb128 0x10
	.4byte	.LASF72
	.byte	0x6
	.byte	0xc8
	.byte	0x9
	.4byte	0x562
	.byte	0x8
	.uleb128 0x10
	.4byte	.LASF73
	.byte	0x6
	.byte	0xcb
	.byte	0x9
	.4byte	0x57c
	.byte	0xc
	.uleb128 0x10
	.4byte	.LASF74
	.byte	0x6
	.byte	0xcc
	.byte	0xa
	.4byte	0x591
	.byte	0x10
	.uleb128 0x10
	.4byte	.LASF75
	.byte	0x6
	.byte	0xcd
	.byte	0xa
	.4byte	0x591
	.byte	0x14
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x6
	.byte	0xd0
	.byte	0x9
	.4byte	0x597
	.byte	0x18
	.uleb128 0x10
	.4byte	.LASF77
	.byte	0x6
	.byte	0xd1
	.byte	0x9
	.4byte	0x59d
	.byte	0x1c
	.byte	0
	.uleb128 0x11
	.4byte	0x74
	.4byte	0x54d
	.uleb128 0x12
	.4byte	0x74
	.uleb128 0x12
	.4byte	0x74
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x539
	.uleb128 0x11
	.4byte	0x74
	.4byte	0x562
	.uleb128 0x12
	.4byte	0x74
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x553
	.uleb128 0x11
	.4byte	0x74
	.4byte	0x57c
	.uleb128 0x12
	.4byte	0x2aa
	.uleb128 0x12
	.4byte	0x74
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x568
	.uleb128 0x11
	.4byte	0x2aa
	.4byte	0x591
	.uleb128 0x12
	.4byte	0x2aa
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x582
	.uleb128 0x13
	.byte	0x4
	.4byte	0x2b1
	.uleb128 0x13
	.byte	0x4
	.4byte	0x2e2
	.uleb128 0x3
	.4byte	.LASF78
	.byte	0x6
	.byte	0xd2
	.byte	0x3
	.4byte	0x4c7
	.uleb128 0x4
	.4byte	0x5a3
	.uleb128 0x14
	.byte	0xc
	.byte	0x6
	.byte	0xd4
	.byte	0x9
	.4byte	0x5e5
	.uleb128 0x10
	.4byte	.LASF79
	.byte	0x6
	.byte	0xd5
	.byte	0xf
	.4byte	0x306
	.byte	0
	.uleb128 0x10
	.4byte	.LASF80
	.byte	0x6
	.byte	0xd6
	.byte	0x25
	.4byte	0x5e5
	.byte	0x4
	.uleb128 0x10
	.4byte	.LASF81
	.byte	0x6
	.byte	0xd7
	.byte	0x28
	.4byte	0x5eb
	.byte	0x8
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x4c2
	.uleb128 0x13
	.byte	0x4
	.4byte	0x5af
	.uleb128 0x3
	.4byte	.LASF82
	.byte	0x6
	.byte	0xd8
	.byte	0x3
	.4byte	0x5b4
	.uleb128 0x4
	.4byte	0x5f1
	.uleb128 0xf
	.4byte	.LASF84
	.byte	0x14
	.byte	0x6
	.byte	0xdc
	.byte	0x10
	.4byte	0x61d
	.uleb128 0x10
	.4byte	.LASF85
	.byte	0x6
	.byte	0xdd
	.byte	0x20
	.4byte	0x61d
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	0x62d
	.4byte	0x62d
	.uleb128 0xa
	.4byte	0x8c
	.byte	0x4
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x5fd
	.uleb128 0x7
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x106
	.byte	0x1a
	.4byte	0x602
	.uleb128 0x7
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x10d
	.byte	0x24
	.4byte	0x5fd
	.uleb128 0x7
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x110
	.byte	0x2c
	.4byte	0x5af
	.uleb128 0x7
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x111
	.byte	0x2c
	.4byte	0x5af
	.uleb128 0x9
	.4byte	0x44
	.4byte	0x677
	.uleb128 0xa
	.4byte	0x8c
	.byte	0x7f
	.byte	0
	.uleb128 0x4
	.4byte	0x667
	.uleb128 0x7
	.4byte	.LASF90
	.byte	0x6
	.2byte	0x113
	.byte	0x23
	.4byte	0x677
	.uleb128 0x9
	.4byte	0x2d7
	.4byte	0x694
	.uleb128 0x15
	.byte	0
	.uleb128 0x4
	.4byte	0x689
	.uleb128 0x7
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x115
	.byte	0x13
	.4byte	0x694
	.uleb128 0x7
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x116
	.byte	0x13
	.4byte	0x694
	.uleb128 0x7
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x117
	.byte	0x13
	.4byte	0x694
	.uleb128 0x7
	.4byte	.LASF94
	.byte	0x6
	.2byte	0x118
	.byte	0x13
	.4byte	0x694
	.uleb128 0x7
	.4byte	.LASF95
	.byte	0x6
	.2byte	0x11a
	.byte	0x13
	.4byte	0x694
	.uleb128 0x7
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x11b
	.byte	0x13
	.4byte	0x694
	.uleb128 0x7
	.4byte	.LASF97
	.byte	0x6
	.2byte	0x11c
	.byte	0x13
	.4byte	0x694
	.uleb128 0x7
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x11d
	.byte	0x13
	.4byte	0x694
	.uleb128 0x7
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x11e
	.byte	0x13
	.4byte	0x694
	.uleb128 0x7
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x11f
	.byte	0x13
	.4byte	0x694
	.uleb128 0x11
	.4byte	0x74
	.4byte	0x72a
	.uleb128 0x12
	.4byte	0x72a
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x735
	.uleb128 0x16
	.4byte	.LASF110
	.uleb128 0x4
	.4byte	0x730
	.uleb128 0x7
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x135
	.byte	0xe
	.4byte	0x747
	.uleb128 0x13
	.byte	0x4
	.4byte	0x71b
	.uleb128 0x11
	.4byte	0x74
	.4byte	0x75c
	.uleb128 0x12
	.4byte	0x75c
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x730
	.uleb128 0x7
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x136
	.byte	0xe
	.4byte	0x76f
	.uleb128 0x13
	.byte	0x4
	.4byte	0x74d
	.uleb128 0xe
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x14d
	.byte	0x18
	.4byte	0x782
	.uleb128 0x13
	.byte	0x4
	.4byte	0x788
	.uleb128 0x11
	.4byte	0x306
	.4byte	0x797
	.uleb128 0x12
	.4byte	0x74
	.byte	0
	.uleb128 0x17
	.4byte	.LASF104
	.byte	0x8
	.byte	0x6
	.2byte	0x14f
	.byte	0x10
	.4byte	0x7c2
	.uleb128 0xc
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x151
	.byte	0x1c
	.4byte	0x775
	.byte	0
	.uleb128 0xc
	.4byte	.LASF106
	.byte	0x6
	.2byte	0x152
	.byte	0x21
	.4byte	0x7c2
	.byte	0x4
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x797
	.uleb128 0xe
	.4byte	.LASF107
	.byte	0x6
	.2byte	0x153
	.byte	0x3
	.4byte	0x797
	.uleb128 0x7
	.4byte	.LASF108
	.byte	0x6
	.2byte	0x157
	.byte	0x1f
	.4byte	0x7e2
	.uleb128 0x13
	.byte	0x4
	.4byte	0x7c8
	.uleb128 0xe
	.4byte	.LASF109
	.byte	0x7
	.2byte	0x317
	.byte	0x1b
	.4byte	0x7f5
	.uleb128 0x16
	.4byte	.LASF111
	.uleb128 0x7
	.4byte	.LASF112
	.byte	0x7
	.2byte	0x31b
	.byte	0xe
	.4byte	0x807
	.uleb128 0x13
	.byte	0x4
	.4byte	0x7e8
	.uleb128 0x7
	.4byte	.LASF113
	.byte	0x7
	.2byte	0x31c
	.byte	0xe
	.4byte	0x807
	.uleb128 0x7
	.4byte	.LASF114
	.byte	0x7
	.2byte	0x31d
	.byte	0xe
	.4byte	0x807
	.uleb128 0x14
	.byte	0x14
	.byte	0x8
	.byte	0x3f
	.byte	0x9
	.4byte	0x872
	.uleb128 0x18
	.ascii	"Pin\000"
	.byte	0x8
	.byte	0x41
	.byte	0xc
	.4byte	0x7b
	.byte	0
	.uleb128 0x10
	.4byte	.LASF115
	.byte	0x8
	.byte	0x44
	.byte	0xc
	.4byte	0x7b
	.byte	0x4
	.uleb128 0x10
	.4byte	.LASF116
	.byte	0x8
	.byte	0x47
	.byte	0xc
	.4byte	0x7b
	.byte	0x8
	.uleb128 0x10
	.4byte	.LASF117
	.byte	0x8
	.byte	0x4a
	.byte	0xc
	.4byte	0x7b
	.byte	0xc
	.uleb128 0x10
	.4byte	.LASF118
	.byte	0x8
	.byte	0x4d
	.byte	0xc
	.4byte	0x7b
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.4byte	.LASF119
	.byte	0x8
	.byte	0x4f
	.byte	0x2
	.4byte	0x827
	.uleb128 0x19
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0x8
	.byte	0x55
	.byte	0x1
	.4byte	0x899
	.uleb128 0x1a
	.4byte	.LASF120
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF121
	.byte	0x1
	.byte	0
	.uleb128 0x19
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0x9
	.byte	0x4e
	.byte	0x1
	.4byte	0x8c0
	.uleb128 0x1a
	.4byte	.LASF122
	.byte	0x64
	.uleb128 0x1a
	.4byte	.LASF123
	.byte	0xa
	.uleb128 0x1a
	.4byte	.LASF124
	.byte	0x1
	.uleb128 0x1a
	.4byte	.LASF125
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF126
	.byte	0x9
	.byte	0x53
	.byte	0x3
	.4byte	0x899
	.uleb128 0x7
	.4byte	.LASF127
	.byte	0x9
	.2byte	0x38b
	.byte	0x16
	.4byte	0x87
	.uleb128 0x7
	.4byte	.LASF128
	.byte	0x9
	.2byte	0x38c
	.byte	0x11
	.4byte	0x7b
	.uleb128 0x7
	.4byte	.LASF129
	.byte	0x9
	.2byte	0x38d
	.byte	0x1c
	.4byte	0x8c0
	.uleb128 0x1b
	.4byte	.LASF135
	.byte	0x1
	.byte	0x29
	.byte	0x6
	.4byte	.LFB123
	.4byte	.LFE123-.LFB123
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.4byte	.LASF130
	.byte	0x1
	.byte	0x2c
	.byte	0x14
	.4byte	0x872
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1d
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x931
	.uleb128 0x1c
	.4byte	.LASF131
	.byte	0x1
	.byte	0x2f
	.byte	0x3
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1d
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x94e
	.uleb128 0x1c
	.4byte	.LASF131
	.byte	0x1
	.byte	0x30
	.byte	0x3
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x1e
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x1c
	.4byte	.LASF131
	.byte	0x1
	.byte	0x31
	.byte	0x3
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x2134
	.uleb128 0x19
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x43
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x969
	.4byte	0x88c
	.ascii	"GPIO_PIN_RESET\000"
	.4byte	0x892
	.ascii	"GPIO_PIN_SET\000"
	.4byte	0x8f3
	.ascii	"MX_GPIO_Init\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x1f0
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x969
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x3d
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x49
	.ascii	"short int\000"
	.4byte	0x5c
	.ascii	"short unsigned int\000"
	.4byte	0x50
	.ascii	"uint16_t\000"
	.4byte	0x74
	.ascii	"int\000"
	.4byte	0x63
	.ascii	"int32_t\000"
	.4byte	0x8c
	.ascii	"unsigned int\000"
	.4byte	0x7b
	.ascii	"uint32_t\000"
	.4byte	0x93
	.ascii	"long long int\000"
	.4byte	0x9a
	.ascii	"long long unsigned int\000"
	.4byte	0x1a8
	.ascii	"GPIO_TypeDef\000"
	.4byte	0x275
	.ascii	"RCC_TypeDef\000"
	.4byte	0x2aa
	.ascii	"long int\000"
	.4byte	0x282
	.ascii	"__mbstate_s\000"
	.4byte	0x2d0
	.ascii	"char\000"
	.4byte	0x4b6
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x5a3
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x5f1
	.ascii	"__RAL_locale_t\000"
	.4byte	0x602
	.ascii	"__locale_s\000"
	.4byte	0x775
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x797
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x7c8
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0x7e8
	.ascii	"FILE\000"
	.4byte	0x872
	.ascii	"GPIO_InitTypeDef\000"
	.4byte	0x8c0
	.ascii	"HAL_TickFreqTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB123
	.4byte	.LFE123-.LFB123
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB123
	.4byte	.LFE123
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF41:
	.ascii	"currency_symbol\000"
.LASF18:
	.ascii	"PUPDR\000"
.LASF20:
	.ascii	"LCKR\000"
.LASF97:
	.ascii	"__RAL_data_utf8_space\000"
.LASF68:
	.ascii	"date_time_format\000"
.LASF92:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF88:
	.ascii	"__RAL_codeset_ascii\000"
.LASF103:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF58:
	.ascii	"int_n_sep_by_space\000"
.LASF16:
	.ascii	"OTYPER\000"
.LASF14:
	.ascii	"APBPrescTable\000"
.LASF99:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF122:
	.ascii	"HAL_TICK_FREQ_10HZ\000"
.LASF15:
	.ascii	"MODER\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF120:
	.ascii	"GPIO_PIN_RESET\000"
.LASF84:
	.ascii	"__locale_s\000"
.LASF102:
	.ascii	"__user_get_time_of_day\000"
.LASF11:
	.ascii	"ITM_RxBuffer\000"
.LASF66:
	.ascii	"date_format\000"
.LASF106:
	.ascii	"next\000"
.LASF64:
	.ascii	"abbrev_month_names\000"
.LASF9:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF19:
	.ascii	"BSRR\000"
.LASF86:
	.ascii	"__RAL_global_locale\000"
.LASF81:
	.ascii	"codeset\000"
.LASF133:
	.ascii	"/Users/armin/CloudStation/02_projects/15_precious_p"
	.ascii	"lastic/nir_scope_usb/Src/gpio.c\000"
.LASF74:
	.ascii	"__towupper\000"
.LASF131:
	.ascii	"tmpreg\000"
.LASF35:
	.ascii	"long int\000"
.LASF23:
	.ascii	"APB2RSTR\000"
.LASF96:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF40:
	.ascii	"int_curr_symbol\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF45:
	.ascii	"positive_sign\000"
.LASF55:
	.ascii	"int_p_cs_precedes\000"
.LASF34:
	.ascii	"__wchar\000"
.LASF17:
	.ascii	"OSPEEDR\000"
.LASF38:
	.ascii	"thousands_sep\000"
.LASF65:
	.ascii	"am_pm_indicator\000"
.LASF115:
	.ascii	"Mode\000"
.LASF44:
	.ascii	"mon_grouping\000"
.LASF73:
	.ascii	"__iswctype\000"
.LASF54:
	.ascii	"n_sign_posn\000"
.LASF126:
	.ascii	"HAL_TickFreqTypeDef\000"
.LASF112:
	.ascii	"stdin\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF57:
	.ascii	"int_p_sep_by_space\000"
.LASF130:
	.ascii	"GPIO_InitStruct\000"
.LASF129:
	.ascii	"uwTickFreq\000"
.LASF95:
	.ascii	"__RAL_data_utf8_period\000"
.LASF127:
	.ascii	"uwTick\000"
.LASF39:
	.ascii	"grouping\000"
.LASF21:
	.ascii	"GPIO_TypeDef\000"
.LASF75:
	.ascii	"__towlower\000"
.LASF32:
	.ascii	"RCC_TypeDef\000"
.LASF124:
	.ascii	"HAL_TICK_FREQ_1KHZ\000"
.LASF110:
	.ascii	"timeval\000"
.LASF85:
	.ascii	"__category\000"
.LASF71:
	.ascii	"__toupper\000"
.LASF52:
	.ascii	"n_sep_by_space\000"
.LASF80:
	.ascii	"data\000"
.LASF46:
	.ascii	"negative_sign\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF79:
	.ascii	"name\000"
.LASF128:
	.ascii	"uwTickPrio\000"
.LASF61:
	.ascii	"day_names\000"
.LASF13:
	.ascii	"AHBPrescTable\000"
.LASF56:
	.ascii	"int_n_cs_precedes\000"
.LASF113:
	.ascii	"stdout\000"
.LASF82:
	.ascii	"__RAL_locale_t\000"
.LASF67:
	.ascii	"time_format\000"
.LASF53:
	.ascii	"p_sign_posn\000"
.LASF49:
	.ascii	"p_cs_precedes\000"
.LASF100:
	.ascii	"__RAL_data_empty_string\000"
.LASF90:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF117:
	.ascii	"Speed\000"
.LASF105:
	.ascii	"decode\000"
.LASF77:
	.ascii	"__mbtowc\000"
.LASF62:
	.ascii	"abbrev_day_names\000"
.LASF119:
	.ascii	"GPIO_InitTypeDef\000"
.LASF51:
	.ascii	"n_cs_precedes\000"
.LASF72:
	.ascii	"__tolower\000"
.LASF125:
	.ascii	"HAL_TICK_FREQ_DEFAULT\000"
.LASF132:
	.ascii	"GNU C99 8.3.1 20190703 (release) [gcc-8-branch revi"
	.ascii	"sion 273027] -fmessage-length=0 -mcpu=cortex-m4 -ml"
	.ascii	"ittle-endian -mfloat-abi=soft -mthumb -mtp=soft -mu"
	.ascii	"naligned-access -std=gnu99 -g2 -gpubnames -fomit-fr"
	.ascii	"ame-pointer -fno-dwarf2-cfi-asm -fno-builtin -ffunc"
	.ascii	"tion-sections -fdata-sections -fshort-enums -fno-co"
	.ascii	"mmon\000"
.LASF24:
	.ascii	"APB1RSTR\000"
.LASF101:
	.ascii	"__user_set_time_of_day\000"
.LASF12:
	.ascii	"SystemCoreClock\000"
.LASF134:
	.ascii	"/Users/armin/CloudStation/02_projects/15_precious_p"
	.ascii	"lastic/nir_scope_usb/MDK-ARM\000"
.LASF33:
	.ascii	"__state\000"
.LASF6:
	.ascii	"int32_t\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF91:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF48:
	.ascii	"frac_digits\000"
.LASF2:
	.ascii	"short int\000"
.LASF108:
	.ascii	"__RAL_error_decoder_head\000"
.LASF109:
	.ascii	"FILE\000"
.LASF26:
	.ascii	"APB2ENR\000"
.LASF43:
	.ascii	"mon_thousands_sep\000"
.LASF69:
	.ascii	"__RAL_locale_data_t\000"
.LASF7:
	.ascii	"uint32_t\000"
.LASF59:
	.ascii	"int_p_sign_posn\000"
.LASF36:
	.ascii	"char\000"
.LASF50:
	.ascii	"p_sep_by_space\000"
.LASF123:
	.ascii	"HAL_TICK_FREQ_100HZ\000"
.LASF87:
	.ascii	"__RAL_c_locale\000"
.LASF27:
	.ascii	"APB1ENR\000"
.LASF78:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF118:
	.ascii	"Alternate\000"
.LASF31:
	.ascii	"CFGR3\000"
.LASF60:
	.ascii	"int_n_sign_posn\000"
.LASF114:
	.ascii	"stderr\000"
.LASF93:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF70:
	.ascii	"__isctype\000"
.LASF28:
	.ascii	"BDCR\000"
.LASF104:
	.ascii	"__RAL_error_decoder_s\000"
.LASF107:
	.ascii	"__RAL_error_decoder_t\000"
.LASF30:
	.ascii	"CFGR2\000"
.LASF83:
	.ascii	"__mbstate_s\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF89:
	.ascii	"__RAL_codeset_utf8\000"
.LASF47:
	.ascii	"int_frac_digits\000"
.LASF63:
	.ascii	"month_names\000"
.LASF121:
	.ascii	"GPIO_PIN_SET\000"
.LASF116:
	.ascii	"Pull\000"
.LASF22:
	.ascii	"CFGR\000"
.LASF111:
	.ascii	"__RAL_FILE\000"
.LASF98:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF94:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF42:
	.ascii	"mon_decimal_point\000"
.LASF76:
	.ascii	"__wctomb\000"
.LASF29:
	.ascii	"AHBRSTR\000"
.LASF37:
	.ascii	"decimal_point\000"
.LASF25:
	.ascii	"AHBENR\000"
.LASF135:
	.ascii	"MX_GPIO_Init\000"
	.ident	"GCC: (GNU) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"
