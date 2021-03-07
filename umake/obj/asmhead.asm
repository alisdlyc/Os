
bin/asmhead.out:	file format ELF32-i386


Disassembly of section .startup:

0000c200 .startup:
    c200: b8 00 90 8e c0               	movl	$3230568448, %eax
    c205: bf 00 00 b8 00               	movl	$12058624, %edi
    c20a: 4f                           	decl	%edi
    c20b: cd 10                        	int	$16
    c20d: 83 f8 4f                     	cmpl	$79, %eax
    c210: 75 52                        	jne	82 <scrn320>
    c212: 26 8b 45 04                  	movl	%es:4(%ebp), %eax
    c216: 3d 00 02 72 49               	cmpl	$1232208384, %eax
    c21b: b9 05 01 b8 01               	movl	$28836101, %ecx
    c220: 4f                           	decl	%edi
    c221: cd 10                        	int	$16
    c223: 83 f8 4f                     	cmpl	$79, %eax
    c226: 75 3c                        	jne	60 <scrn320>
    c228: 26 80 7d 19 08               	cmpb	$8, %es:25(%ebp)
    c22d: 75 35                        	jne	53 <scrn320>
    c22f: 26 80 7d 1b 04               	cmpb	$4, %es:27(%ebp)
    c234: 75 2e                        	jne	46 <scrn320>
    c236: 26 8b 05 25 80 00 74         	movl	%es:1946189861, %eax
    c23d: 26 bb 05 41 b8 02            	movl	$45629701, %ebx
    c243: 4f                           	decl	%edi
    c244: cd 10                        	int	$16
    c246: c6 06 f2                     	movb	$-14, (%esi)
    c249: 0f 08                        	invd
    c24b: 26 8b 45 12                  	movl	%es:18(%ebp), %eax
    c24f: a3 f4 0f 26 8b               	movl	%eax, 2334527476
    c254: 45                           	incl	%ebp
    c255: 14 a3                        	adcb	$-93, %al
    c257: f6 0f                        	<unknown>
    c259: 26 66 8b 45 28               	movw	%es:40(%ebp), %ax
    c25e: 66 a3 f8 0f eb 20            	movw	%ax, 552275960

0000c264 scrn320:
    c264: b0 13                        	movb	$19, %al
    c266: b4 00                        	movb	$0, %ah
    c268: cd 10                        	int	$16
    c26a: c6 06 f2                     	movb	$-14, (%esi)
    c26d: 0f 08                        	invd
    c26f: c7 06 f4 0f 40 01            	movl	$20975604, (%esi)
    c275: c7 06 f6 0f c8 00            	movl	$13111286, (%esi)
    c27b: 66 c7 06 f8 0f               	movw	$4088, (%esi)
    c280: 00 00                        	addb	%al, (%eax)
    c282: 0a 00                        	orb	(%eax), %al

0000c284 keystatus:
    c284: b4 02                        	movb	$2, %ah
    c286: cd 16                        	int	$22
    c288: a2 f1 0f b0 ff               	movb	%al, 4289728497
    c28d: e6 21                        	outb	%al, $33
    c28f: 90                           	nop
    c290: e6 a1                        	outb	%al, $161
    c292: fa                           	cli
    c293: e8 56 01 b0 d1               	calll	-776994474 <bootpack+0xffffffffd1afffae>
    c298: e6 64                        	outb	%al, $100
    c29a: e8 4f 01 b0 df               	calll	-542113457 <bootpack+0xffffffffdfafffae>
    c29f: e6 60                        	outb	%al, $96
    c2a1: e8 48 01 0f 01               	calll	17760584 <bootpack+0x10effae>
    c2a6: 16                           	pushl	%ss
    c2a7: 32 c4                        	xorb	%ah, %al
    c2a9: 0f 20 c0                     	movl	%cr0, %eax
    c2ac: 66 25 ff ff                  	andw	$65535, %ax
    c2b0: ff 7f 66                     	<unknown>
    c2b3: 83 c8 01                     	orl	$1, %eax
    c2b6: 0f 22 c0                     	movl	%eax, %cr0
    c2b9: 66 ea c1 c2 00 00            	ljmpw	$0, $49857
    c2bf: 10 00                        	adcb	%al, (%eax)

0000c2c1 pipelineflush:
    c2c1: 66 b8 08 00                  	movw	$8, %ax
    c2c5: 8e d8                        	movl	%eax, %ds
    c2c7: 8e c0                        	movl	%eax, %es
    c2c9: 8e e0                        	movl	%eax, %fs
    c2cb: 8e e8                        	movl	%eax, %gs
    c2cd: 8e d0                        	movl	%eax, %ss
    c2cf: be 40 c4 00 00               	movl	$50240, %esi
    c2d4: bf 00 00 28 00               	movl	$2621440, %edi
    c2d9: b9 00 00 02 00               	movl	$131072, %ecx
    c2de: e8 12 01 00 00               	calll	274 <memcpy>
    c2e3: be 00 7c 00 00               	movl	$31744, %esi
    c2e8: bf 00 00 10 00               	movl	$1048576, %edi
    c2ed: b9 80 00 00 00               	movl	$128, %ecx
    c2f2: e8 fe 00 00 00               	calll	254 <memcpy>
    c2f7: be 00 82 00 00               	movl	$33280, %esi
    c2fc: bf 00 02 10 00               	movl	$1049088, %edi
    c301: b9 00 00 00 00               	movl	$0, %ecx
    c306: 8a 0d f0 0f 00 00            	movb	4080, %cl
    c30c: 69 c9 00 12 00 00            	imull	$4608, %ecx, %ecx
    c312: 81 e9 80 00 00 00            	subl	$128, %ecx
    c318: e8 d8 00 00 00               	calll	216 <memcpy>
    c31d: e8 4c 00 00 00               	calll	76 <bootmain>

0000c322 skip:
    c322: bc 00 00 31 00               	movl	$3211264, %esp
    c327: bd 00 00 00 00               	movl	$0, %ebp
    c32c: e9 cf 3c 27 00               	jmp	2571471 <bootpack+0x273bc0>

0000c331 memcpy2:
    c331: 55                           	pushl	%ebp
    c332: 89 e5                        	movl	%esp, %ebp
    c334: 83 ec 10                     	subl	$16, %esp
    c337: 8b 45 0c                     	movl	12(%ebp), %eax
    c33a: 89 45 fc                     	movl	%eax, -4(%ebp)
    c33d: 8b 45 08                     	movl	8(%ebp), %eax
    c340: 89 45 f8                     	movl	%eax, -8(%ebp)
    c343: eb 17                        	jmp	23 <lable2b>

0000c345 lable14:
    c345: 8b 45 f8                     	movl	-8(%ebp), %eax
    c348: 8d 50 01                     	leal	1(%eax), %edx
    c34b: 89 55 f8                     	movl	%edx, -8(%ebp)
    c34e: 8b 55 fc                     	movl	-4(%ebp), %edx
    c351: 8d 4a 01                     	leal	1(%edx), %ecx
    c354: 89 4d fc                     	movl	%ecx, -4(%ebp)
    c357: 0f b6 12                     	movzbl	(%edx), %edx
    c35a: 88 10                        	movb	%dl, (%eax)

0000c35c lable2b:
    c35c: 8b 45 10                     	movl	16(%ebp), %eax
    c35f: 8d 50 ff                     	leal	-1(%eax), %edx
    c362: 89 55 10                     	movl	%edx, 16(%ebp)
    c365: 85 c0                        	testl	%eax, %eax
    c367: 75 dc                        	jne	-36 <lable14>
    c369: 8b 45 08                     	movl	8(%ebp), %eax
    c36c: c9                           	leave
    c36d: c3                           	retl

0000c36e bootmain:
    c36e: 55                           	pushl	%ebp
    c36f: 89 e5                        	movl	%esp, %ebp
    c371: 83 ec 1c                     	subl	$28, %esp
    c374: b8 40 c4 00 00               	movl	$50240, %eax
    c379: 8b 00                        	movl	(%eax), %eax
    c37b: 3d 7f 45 4c 46               	cmpl	$1179403647, %eax
    c380: 74 02                        	je	2 <lable53>
    c382: eb 66                        	jmp	102 <lablec3>

0000c384 lable53:
    c384: b8 40 c4 00 00               	movl	$50240, %eax
    c389: 8b 40 1c                     	movl	28(%eax), %eax
    c38c: 05 40 c4 00 00               	addl	$50240, %eax
    c391: 89 45 fc                     	movl	%eax, -4(%ebp)
    c394: 8b 45 fc                     	movl	-4(%ebp), %eax
    c397: 8b 48 14                     	movl	20(%eax), %ecx
    c39a: 8b 45 fc                     	movl	-4(%ebp), %eax
    c39d: 8b 40 04                     	movl	4(%eax), %eax
    c3a0: 05 40 c4 00 00               	addl	$50240, %eax
    c3a5: 89 c2                        	movl	%eax, %edx
    c3a7: 8b 45 fc                     	movl	-4(%ebp), %eax
    c3aa: 8b 40 08                     	movl	8(%eax), %eax
    c3ad: 89 4c 24 08                  	movl	%ecx, 8(%esp)
    c3b1: 89 54 24 04                  	movl	%edx, 4(%esp)
    c3b5: 89 04 24                     	movl	%eax, (%esp)
    c3b8: e8 74 ff ff ff               	calll	-140 <memcpy2>
    c3bd: 83 45 fc 20                  	addl	$32, -4(%ebp)
    c3c1: 8b 45 fc                     	movl	-4(%ebp), %eax
    c3c4: 8b 48 14                     	movl	20(%eax), %ecx
    c3c7: 8b 45 fc                     	movl	-4(%ebp), %eax
    c3ca: 8b 40 04                     	movl	4(%eax), %eax
    c3cd: 05 40 c4 00 00               	addl	$50240, %eax
    c3d2: 89 c2                        	movl	%eax, %edx
    c3d4: 8b 45 fc                     	movl	-4(%ebp), %eax
    c3d7: 8b 40 08                     	movl	8(%eax), %eax
    c3da: 89 4c 24 08                  	movl	%ecx, 8(%esp)
    c3de: 89 54 24 04                  	movl	%edx, 4(%esp)
    c3e2: 89 04 24                     	movl	%eax, (%esp)
    c3e5: e8 47 ff ff ff               	calll	-185 <memcpy2>

0000c3ea lablec3:
    c3ea: c9                           	leave
    c3eb: c3                           	retl

0000c3ec waitkbdout:
    c3ec: e4 64                        	inb	$100, %al
    c3ee: 24 02                        	andb	$2, %al
    c3f0: e4 60                        	inb	$96, %al
    c3f2: 75 f8                        	jne	-8 <waitkbdout>
    c3f4: c3                           	retl

0000c3f5 memcpy:
    c3f5: 8b 06 83 c6 04 89 07 83         ........
    c3fd: c7 04 83 e9 01 75 f1 c3         .....u..
    c405: 00 00 00 00 00 00 00 00         ........
    c40d: 00 00 00                        ...

0000c410 GDT0:
    c410: 00 00 00 00 00 00 00 00         ........
    c418: ff ff 00 00 00 92 cf 00         ........
    c420: ff ff 00 00 00 9a cf 00         ........
    c428: ff ff 00 00 00 9a 4f 00         ......O.
    c430: 00 00                           ..

0000c432 GDTR0:
    c432: 1f 00 10 c4 00 00 00 00         ........
    c43a: 00 00 00 00 00 00               ......
