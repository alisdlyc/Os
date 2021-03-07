
bin/bootpack.out:	file format ELF32-i386


Disassembly of section .text:

00280000 HariMain:
  280000: 55                           	pushl	%ebp
  280001: 89 e5                        	movl	%esp, %ebp
  280003: 81 ec 78 04 00 00            	subl	$1144, %esp
  280009: c7 45 b4 f0 0f 00 00         	movl	$4080, -76(%ebp)
  280010: c7 45 ec ff ff ff ff         	movl	$4294967295, -20(%ebp)
  280017: c7 45 e8 00 00 00 00         	movl	$0, -24(%ebp)
  28001e: c7 45 e4 ff ff ff 7f         	movl	$2147483647, -28(%ebp)
  280025: c7 45 e0 00 00 00 00         	movl	$0, -32(%ebp)
  28002c: c7 45 b0 00 00 3c 00         	movl	$3932160, -80(%ebp)
  280033: c7 45 dc 00 00 00 00         	movl	$0, -36(%ebp)
  28003a: 8b 45 b4                     	movl	-76(%ebp), %eax
  28003d: 0f b6 40 01                  	movzbl	1(%eax), %eax
  280041: c0 f8 04                     	sarb	$4, %al
  280044: 0f be c0                     	movsbl	%al, %eax
  280047: 83 e0 07                     	andl	$7, %eax
  28004a: 89 45 d8                     	movl	%eax, -40(%ebp)
  28004d: c7 45 d4 ff ff ff ff         	movl	$4294967295, -44(%ebp)
  280054: c7 45 cc ff ff ff ff         	movl	$4294967295, -52(%ebp)
  28005b: c7 45 c8 ff ff ff ff         	movl	$4294967295, -56(%ebp)
  280062: c7 45 c4 00 00 00 00         	movl	$0, -60(%ebp)
  280069: c7 45 c0 00 00 00 00         	movl	$0, -64(%ebp)
  280070: e8 67 1c 00 00               	calll	7271 <init_gdtidt>
  280075: e8 ab 1e 00 00               	calll	7851 <init_pic>
  28007a: e8 a5 10 00 00               	calll	4261 <io_sti>
  28007f: 6a 00                        	pushl	$0
  280081: 8d 85 20 fd ff ff            	leal	-736(%ebp), %eax
  280087: 50                           	pushl	%eax
  280088: 68 80 00 00 00               	pushl	$128
  28008d: 8d 85 3c ff ff ff            	leal	-196(%ebp), %eax
  280093: 50                           	pushl	%eax
  280094: e8 67 1f 00 00               	calll	8039 <fifo32_init>
  280099: 83 c4 10                     	addl	$16, %esp
  28009c: ba ec 0f 00 00               	movl	$4076, %edx
  2800a1: 8d 85 3c ff ff ff            	leal	-196(%ebp), %eax
  2800a7: 89 02                        	movl	%eax, (%edx)
  2800a9: e8 48 37 00 00               	calll	14152 <init_pit>
  2800ae: 83 ec 08                     	subl	$8, %esp
  2800b1: 68 00 01 00 00               	pushl	$256
  2800b6: 8d 85 3c ff ff ff            	leal	-196(%ebp), %eax
  2800bc: 50                           	pushl	%eax
  2800bd: e8 1b 21 00 00               	calll	8475 <init_keyboard>
  2800c2: 83 c4 10                     	addl	$16, %esp
  2800c5: 83 ec 04                     	subl	$4, %esp
  2800c8: 8d 85 8c fc ff ff            	leal	-884(%ebp), %eax
  2800ce: 50                           	pushl	%eax
  2800cf: 68 00 02 00 00               	pushl	$512
  2800d4: 8d 85 3c ff ff ff            	leal	-196(%ebp), %eax
  2800da: 50                           	pushl	%eax
  2800db: e8 95 21 00 00               	calll	8597 <enable_mouse>
  2800e0: 83 c4 10                     	addl	$16, %esp
  2800e3: 83 ec 08                     	subl	$8, %esp
  2800e6: 68 f8 00 00 00               	pushl	$248
  2800eb: 6a 21                        	pushl	$33
  2800ed: e8 54 10 00 00               	calll	4180 <io_out8>
  2800f2: 83 c4 10                     	addl	$16, %esp
  2800f5: 83 ec 08                     	subl	$8, %esp
  2800f8: 68 ef 00 00 00               	pushl	$239
  2800fd: 68 a1 00 00 00               	pushl	$161
  280102: e8 3f 10 00 00               	calll	4159 <io_out8>
  280107: 83 c4 10                     	addl	$16, %esp
  28010a: 6a 00                        	pushl	$0
  28010c: 8d 85 a0 fc ff ff            	leal	-864(%ebp), %eax
  280112: 50                           	pushl	%eax
  280113: 6a 20                        	pushl	$32
  280115: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  28011b: 50                           	pushl	%eax
  28011c: e8 df 1e 00 00               	calll	7903 <fifo32_init>
  280121: 83 c4 10                     	addl	$16, %esp
  280124: 83 ec 08                     	subl	$8, %esp
  280127: 68 ff ff ff bf               	pushl	$3221225471
  28012c: 68 00 00 40 00               	pushl	$4194304
  280131: e8 cc 22 00 00               	calll	8908 <memtest>
  280136: 83 c4 10                     	addl	$16, %esp
  280139: 89 45 ac                     	movl	%eax, -84(%ebp)
  28013c: 83 ec 0c                     	subl	$12, %esp
  28013f: ff 75 b0                     	pushl	-80(%ebp)
  280142: e8 72 23 00 00               	calll	9074 <memman_init>
  280147: 83 c4 10                     	addl	$16, %esp
  28014a: 83 ec 04                     	subl	$4, %esp
  28014d: 68 00 e0 09 00               	pushl	$647168
  280152: 68 00 10 00 00               	pushl	$4096
  280157: ff 75 b0                     	pushl	-80(%ebp)
  28015a: e8 a9 24 00 00               	calll	9385 <memman_free>
  28015f: 83 c4 10                     	addl	$16, %esp
  280162: 8b 45 ac                     	movl	-84(%ebp), %eax
  280165: 2d 00 00 40 00               	subl	$4194304, %eax
  28016a: 83 ec 04                     	subl	$4, %esp
  28016d: 50                           	pushl	%eax
  28016e: 68 00 00 40 00               	pushl	$4194304
  280173: ff 75 b0                     	pushl	-80(%ebp)
  280176: e8 8d 24 00 00               	calll	9357 <memman_free>
  28017b: 83 c4 10                     	addl	$16, %esp
  28017e: e8 49 11 00 00               	calll	4425 <init_palette>
  280183: 8b 45 b4                     	movl	-76(%ebp), %eax
  280186: 0f b7 40 06                  	movzwl	6(%eax), %eax
  28018a: 0f bf c8                     	movswl	%ax, %ecx
  28018d: 8b 45 b4                     	movl	-76(%ebp), %eax
  280190: 0f b7 40 04                  	movzwl	4(%eax), %eax
  280194: 0f bf d0                     	movswl	%ax, %edx
  280197: 8b 45 b4                     	movl	-76(%ebp), %eax
  28019a: 8b 40 08                     	movl	8(%eax), %eax
  28019d: 51                           	pushl	%ecx
  28019e: 52                           	pushl	%edx
  28019f: 50                           	pushl	%eax
  2801a0: ff 75 b0                     	pushl	-80(%ebp)
  2801a3: e8 0b 27 00 00               	calll	9995 <shtctl_init>
  2801a8: 83 c4 10                     	addl	$16, %esp
  2801ab: 89 45 a8                     	movl	%eax, -88(%ebp)
  2801ae: 83 ec 0c                     	subl	$12, %esp
  2801b1: ff 75 b0                     	pushl	-80(%ebp)
  2801b4: e8 96 3b 00 00               	calll	15254 <task_init>
  2801b9: 83 c4 10                     	addl	$16, %esp
  2801bc: 89 45 a4                     	movl	%eax, -92(%ebp)
  2801bf: 8b 45 a4                     	movl	-92(%ebp), %eax
  2801c2: 89 85 54 ff ff ff            	movl	%eax, -172(%ebp)
  2801c8: 83 ec 04                     	subl	$4, %esp
  2801cb: 6a 02                        	pushl	$2
  2801cd: 6a 01                        	pushl	$1
  2801cf: ff 75 a4                     	pushl	-92(%ebp)
  2801d2: e8 0a 3f 00 00               	calll	16138 <task_run>
  2801d7: 83 c4 10                     	addl	$16, %esp
  2801da: ba e4 0f 00 00               	movl	$4068, %edx
  2801df: 8b 45 a8                     	movl	-88(%ebp), %eax
  2801e2: 89 02                        	movl	%eax, (%edx)
  2801e4: 8b 45 a4                     	movl	-92(%ebp), %eax
  2801e7: c6 80 bc 00 00 00 00         	movb	$0, 188(%eax)
  2801ee: 83 ec 0c                     	subl	$12, %esp
  2801f1: ff 75 a8                     	pushl	-88(%ebp)
  2801f4: e8 9d 27 00 00               	calll	10141 <sheet_alloc>
  2801f9: 83 c4 10                     	addl	$16, %esp
  2801fc: 89 45 a0                     	movl	%eax, -96(%ebp)
  2801ff: 8b 45 b4                     	movl	-76(%ebp), %eax
  280202: 0f b7 40 04                  	movzwl	4(%eax), %eax
  280206: 0f bf d0                     	movswl	%ax, %edx
  280209: 8b 45 b4                     	movl	-76(%ebp), %eax
  28020c: 0f b7 40 06                  	movzwl	6(%eax), %eax
  280210: 98                           	cwtl
  280211: 0f af c2                     	imull	%edx, %eax
  280214: 83 ec 08                     	subl	$8, %esp
  280217: 50                           	pushl	%eax
  280218: ff 75 b0                     	pushl	-80(%ebp)
  28021b: e8 38 26 00 00               	calll	9784 <memman_alloc_4k>
  280220: 83 c4 10                     	addl	$16, %esp
  280223: 89 45 9c                     	movl	%eax, -100(%ebp)
  280226: 8b 45 b4                     	movl	-76(%ebp), %eax
  280229: 0f b7 40 06                  	movzwl	6(%eax), %eax
  28022d: 0f bf d0                     	movswl	%ax, %edx
  280230: 8b 45 b4                     	movl	-76(%ebp), %eax
  280233: 0f b7 40 04                  	movzwl	4(%eax), %eax
  280237: 98                           	cwtl
  280238: 83 ec 0c                     	subl	$12, %esp
  28023b: 6a ff                        	pushl	$-1
  28023d: 52                           	pushl	%edx
  28023e: 50                           	pushl	%eax
  28023f: ff 75 9c                     	pushl	-100(%ebp)
  280242: ff 75 a0                     	pushl	-96(%ebp)
  280245: e8 cd 27 00 00               	calll	10189 <sheet_setbuf>
  28024a: 83 c4 20                     	addl	$32, %esp
  28024d: 8b 45 b4                     	movl	-76(%ebp), %eax
  280250: 0f b7 40 06                  	movzwl	6(%eax), %eax
  280254: 0f bf d0                     	movswl	%ax, %edx
  280257: 8b 45 b4                     	movl	-76(%ebp), %eax
  28025a: 0f b7 40 04                  	movzwl	4(%eax), %eax
  28025e: 98                           	cwtl
  28025f: 83 ec 04                     	subl	$4, %esp
  280262: 52                           	pushl	%edx
  280263: 50                           	pushl	%eax
  280264: ff 75 9c                     	pushl	-100(%ebp)
  280267: e8 ac 12 00 00               	calll	4780 <init_screen8>
  28026c: 83 c4 10                     	addl	$16, %esp
  28026f: 83 ec 08                     	subl	$8, %esp
  280272: ff 75 ac                     	pushl	-84(%ebp)
  280275: ff 75 a8                     	pushl	-88(%ebp)
  280278: e8 2c 0d 00 00               	calll	3372 <open_console>
  28027d: 83 c4 10                     	addl	$16, %esp
  280280: 89 45 bc                     	movl	%eax, -68(%ebp)
  280283: 83 ec 0c                     	subl	$12, %esp
  280286: ff 75 a8                     	pushl	-88(%ebp)
  280289: e8 08 27 00 00               	calll	9992 <sheet_alloc>
  28028e: 83 c4 10                     	addl	$16, %esp
  280291: 89 45 98                     	movl	%eax, -104(%ebp)
  280294: 83 ec 0c                     	subl	$12, %esp
  280297: 6a 63                        	pushl	$99
  280299: 6a 10                        	pushl	$16
  28029b: 6a 10                        	pushl	$16
  28029d: 8d 85 8c fb ff ff            	leal	-1140(%ebp), %eax
  2802a3: 50                           	pushl	%eax
  2802a4: ff 75 98                     	pushl	-104(%ebp)
  2802a7: e8 6b 27 00 00               	calll	10091 <sheet_setbuf>
  2802ac: 83 c4 20                     	addl	$32, %esp
  2802af: 83 ec 08                     	subl	$8, %esp
  2802b2: 6a 63                        	pushl	$99
  2802b4: 8d 85 8c fb ff ff            	leal	-1140(%ebp), %eax
  2802ba: 50                           	pushl	%eax
  2802bb: e8 d7 18 00 00               	calll	6359 <init_mouse_cursor8>
  2802c0: 83 c4 10                     	addl	$16, %esp
  2802c3: 8b 45 b4                     	movl	-76(%ebp), %eax
  2802c6: 0f b7 40 04                  	movzwl	4(%eax), %eax
  2802ca: 98                           	cwtl
  2802cb: 83 e8 10                     	subl	$16, %eax
  2802ce: 89 c2                        	movl	%eax, %edx
  2802d0: c1 ea 1f                     	shrl	$31, %edx
  2802d3: 01 d0                        	addl	%edx, %eax
  2802d5: d1 f8                        	sarl	%eax
  2802d7: 89 45 f4                     	movl	%eax, -12(%ebp)
  2802da: 8b 45 b4                     	movl	-76(%ebp), %eax
  2802dd: 0f b7 40 06                  	movzwl	6(%eax), %eax
  2802e1: 98                           	cwtl
  2802e2: 83 e8 2c                     	subl	$44, %eax
  2802e5: 89 c2                        	movl	%eax, %edx
  2802e7: c1 ea 1f                     	shrl	$31, %edx
  2802ea: 01 d0                        	addl	%edx, %eax
  2802ec: d1 f8                        	sarl	%eax
  2802ee: 89 45 f0                     	movl	%eax, -16(%ebp)
  2802f1: 83 ec 04                     	subl	$4, %esp
  2802f4: 6a 00                        	pushl	$0
  2802f6: 6a 00                        	pushl	$0
  2802f8: ff 75 a0                     	pushl	-96(%ebp)
  2802fb: e8 bc 33 00 00               	calll	13244 <sheet_slide>
  280300: 83 c4 10                     	addl	$16, %esp
  280303: 83 ec 04                     	subl	$4, %esp
  280306: 6a 04                        	pushl	$4
  280308: 6a 20                        	pushl	$32
  28030a: ff 75 bc                     	pushl	-68(%ebp)
  28030d: e8 aa 33 00 00               	calll	13226 <sheet_slide>
  280312: 83 c4 10                     	addl	$16, %esp
  280315: 83 ec 04                     	subl	$4, %esp
  280318: ff 75 f0                     	pushl	-16(%ebp)
  28031b: ff 75 f4                     	pushl	-12(%ebp)
  28031e: ff 75 98                     	pushl	-104(%ebp)
  280321: e8 96 33 00 00               	calll	13206 <sheet_slide>
  280326: 83 c4 10                     	addl	$16, %esp
  280329: 83 ec 08                     	subl	$8, %esp
  28032c: 6a 00                        	pushl	$0
  28032e: ff 75 a0                     	pushl	-96(%ebp)
  280331: e8 9e 2f 00 00               	calll	12190 <sheet_updown>
  280336: 83 c4 10                     	addl	$16, %esp
  280339: 83 ec 08                     	subl	$8, %esp
  28033c: 6a 01                        	pushl	$1
  28033e: ff 75 bc                     	pushl	-68(%ebp)
  280341: e8 8e 2f 00 00               	calll	12174 <sheet_updown>
  280346: 83 c4 10                     	addl	$16, %esp
  280349: 83 ec 08                     	subl	$8, %esp
  28034c: 6a 02                        	pushl	$2
  28034e: ff 75 98                     	pushl	-104(%ebp)
  280351: e8 7e 2f 00 00               	calll	12158 <sheet_updown>
  280356: 83 c4 10                     	addl	$16, %esp
  280359: 83 ec 0c                     	subl	$12, %esp
  28035c: ff 75 bc                     	pushl	-68(%ebp)
  28035f: e8 08 0b 00 00               	calll	2824 <keywin_on>
  280364: 83 c4 10                     	addl	$16, %esp
  280367: 83 ec 08                     	subl	$8, %esp
  28036a: 68 ed 00 00 00               	pushl	$237
  28036f: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  280375: 50                           	pushl	%eax
  280376: e8 cc 1c 00 00               	calll	7372 <fifo32_put>
  28037b: 83 c4 10                     	addl	$16, %esp
  28037e: 83 ec 08                     	subl	$8, %esp
  280381: ff 75 d8                     	pushl	-40(%ebp)
  280384: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  28038a: 50                           	pushl	%eax
  28038b: e8 b7 1c 00 00               	calll	7351 <fifo32_put>
  280390: 83 c4 10                     	addl	$16, %esp
  280393: 83 ec 08                     	subl	$8, %esp
  280396: 68 00 2d 00 00               	pushl	$11520
  28039b: ff 75 b0                     	pushl	-80(%ebp)
  28039e: e8 b5 24 00 00               	calll	9397 <memman_alloc_4k>
  2803a3: 83 c4 10                     	addl	$16, %esp
  2803a6: 89 45 94                     	movl	%eax, -108(%ebp)
  2803a9: 83 ec 08                     	subl	$8, %esp
  2803ac: 68 00 02 10 00               	pushl	$1049088
  2803b1: ff 75 94                     	pushl	-108(%ebp)
  2803b4: e8 cd 61 00 00               	calll	25037 <file_readfat>
  2803b9: 83 c4 10                     	addl	$16, %esp
  2803bc: 83 ec 04                     	subl	$4, %esp
  2803bf: 68 e0 00 00 00               	pushl	$224
  2803c4: 68 00 26 10 00               	pushl	$1058304
  2803c9: 68 00 11 31 00               	pushl	$3215616
  2803ce: e8 0b 63 00 00               	calll	25355 <file_search>
  2803d3: 83 c4 10                     	addl	$16, %esp
  2803d6: 89 45 90                     	movl	%eax, -112(%ebp)
  2803d9: 83 7d 90 00                  	cmpl	$0, -112(%ebp)
  2803dd: 74 34                        	je	52 <HariMain+0x413>
  2803df: 8b 45 90                     	movl	-112(%ebp), %eax
  2803e2: 8b 40 1c                     	movl	28(%eax), %eax
  2803e5: 89 85 9c fc ff ff            	movl	%eax, -868(%ebp)
  2803eb: 8b 45 90                     	movl	-112(%ebp), %eax
  2803ee: 0f b7 40 1a                  	movzwl	26(%eax), %eax
  2803f2: 0f b7 c0                     	movzwl	%ax, %eax
  2803f5: 83 ec 04                     	subl	$4, %esp
  2803f8: ff 75 94                     	pushl	-108(%ebp)
  2803fb: 8d 95 9c fc ff ff            	leal	-868(%ebp), %edx
  280401: 52                           	pushl	%edx
  280402: 50                           	pushl	%eax
  280403: e8 3b 64 00 00               	calll	25659 <file_loadfile2>
  280408: 83 c4 10                     	addl	$16, %esp
  28040b: 89 45 b8                     	movl	%eax, -72(%ebp)
  28040e: e9 92 00 00 00               	jmp	146 <HariMain+0x4a5>
  280413: 83 ec 08                     	subl	$8, %esp
  280416: 68 40 38 02 00               	pushl	$145472
  28041b: ff 75 b0                     	pushl	-80(%ebp)
  28041e: e8 35 24 00 00               	calll	9269 <memman_alloc_4k>
  280423: 83 c4 10                     	addl	$16, %esp
  280426: 89 45 b8                     	movl	%eax, -72(%ebp)
  280429: c7 85 9c fc ff ff 00 00 00 00	movl	$0, -868(%ebp)
  280433: eb 2b                        	jmp	43 <HariMain+0x460>
  280435: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  28043b: 0f b6 90 00 00 31 00         	movzbl	3211264(%eax), %edx
  280442: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280448: 89 c1                        	movl	%eax, %ecx
  28044a: 8b 45 b8                     	movl	-72(%ebp), %eax
  28044d: 01 c8                        	addl	%ecx, %eax
  28044f: 88 10                        	movb	%dl, (%eax)
  280451: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280457: 83 c0 01                     	addl	$1, %eax
  28045a: 89 85 9c fc ff ff            	movl	%eax, -868(%ebp)
  280460: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280466: 3d ff 0f 00 00               	cmpl	$4095, %eax
  28046b: 7e c8                        	jle	-56 <HariMain+0x435>
  28046d: c7 85 9c fc ff ff 00 10 00 00	movl	$4096, -868(%ebp)
  280477: eb 1f                        	jmp	31 <HariMain+0x498>
  280479: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  28047f: 89 c2                        	movl	%eax, %edx
  280481: 8b 45 b8                     	movl	-72(%ebp), %eax
  280484: 01 d0                        	addl	%edx, %eax
  280486: c6 00 ff                     	movb	$-1, (%eax)
  280489: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  28048f: 83 c0 01                     	addl	$1, %eax
  280492: 89 85 9c fc ff ff            	movl	%eax, -868(%ebp)
  280498: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  28049e: 3d 3f 38 02 00               	cmpl	$145471, %eax
  2804a3: 7e d4                        	jle	-44 <HariMain+0x479>
  2804a5: ba e8 0f 00 00               	movl	$4072, %edx
  2804aa: 8b 45 b8                     	movl	-72(%ebp), %eax
  2804ad: 89 02                        	movl	%eax, (%edx)
  2804af: 8b 45 94                     	movl	-108(%ebp), %eax
  2804b2: 83 ec 04                     	subl	$4, %esp
  2804b5: 68 00 2d 00 00               	pushl	$11520
  2804ba: 50                           	pushl	%eax
  2804bb: ff 75 b0                     	pushl	-80(%ebp)
  2804be: e8 c1 23 00 00               	calll	9153 <memman_free_4k>
  2804c3: 83 c4 10                     	addl	$16, %esp
  2804c6: 83 ec 0c                     	subl	$12, %esp
  2804c9: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  2804cf: 50                           	pushl	%eax
  2804d0: e8 8e 1c 00 00               	calll	7310 <fifo32_status>
  2804d5: 83 c4 10                     	addl	$16, %esp
  2804d8: 85 c0                        	testl	%eax, %eax
  2804da: 7e 30                        	jle	48 <HariMain+0x50c>
  2804dc: 83 7d d4 00                  	cmpl	$0, -44(%ebp)
  2804e0: 79 2a                        	jns	42 <HariMain+0x50c>
  2804e2: 83 ec 0c                     	subl	$12, %esp
  2804e5: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  2804eb: 50                           	pushl	%eax
  2804ec: e8 03 1c 00 00               	calll	7171 <fifo32_get>
  2804f1: 83 c4 10                     	addl	$16, %esp
  2804f4: 89 45 d4                     	movl	%eax, -44(%ebp)
  2804f7: e8 c1 1c 00 00               	calll	7361 <wait_KBC_sendready>
  2804fc: 83 ec 08                     	subl	$8, %esp
  2804ff: ff 75 d4                     	pushl	-44(%ebp)
  280502: 6a 60                        	pushl	$96
  280504: e8 3d 0c 00 00               	calll	3133 <io_out8>
  280509: 83 c4 10                     	addl	$16, %esp
  28050c: e8 11 0c 00 00               	calll	3089 <io_cli>
  280511: 83 ec 0c                     	subl	$12, %esp
  280514: 8d 85 3c ff ff ff            	leal	-196(%ebp), %eax
  28051a: 50                           	pushl	%eax
  28051b: e8 43 1c 00 00               	calll	7235 <fifo32_status>
  280520: 83 c4 10                     	addl	$16, %esp
  280523: 85 c0                        	testl	%eax, %eax
  280525: 75 71                        	jne	113 <HariMain+0x598>
  280527: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
  28052b: 78 25                        	js	37 <HariMain+0x552>
  28052d: e8 f2 0b 00 00               	calll	3058 <io_sti>
  280532: 83 ec 04                     	subl	$4, %esp
  280535: ff 75 e8                     	pushl	-24(%ebp)
  280538: ff 75 ec                     	pushl	-20(%ebp)
  28053b: ff 75 98                     	pushl	-104(%ebp)
  28053e: e8 79 31 00 00               	calll	12665 <sheet_slide>
  280543: 83 c4 10                     	addl	$16, %esp
  280546: c7 45 ec ff ff ff ff         	movl	$4294967295, -20(%ebp)
  28054d: e9 74 ff ff ff               	jmp	-140 <HariMain+0x4c6>
  280552: 81 7d e4 ff ff ff 7f         	cmpl	$2147483647, -28(%ebp)
  280559: 74 25                        	je	37 <HariMain+0x580>
  28055b: e8 c4 0b 00 00               	calll	3012 <io_sti>
  280560: 83 ec 04                     	subl	$4, %esp
  280563: ff 75 e0                     	pushl	-32(%ebp)
  280566: ff 75 e4                     	pushl	-28(%ebp)
  280569: ff 75 c0                     	pushl	-64(%ebp)
  28056c: e8 4b 31 00 00               	calll	12619 <sheet_slide>
  280571: 83 c4 10                     	addl	$16, %esp
  280574: c7 45 e4 ff ff ff 7f         	movl	$2147483647, -28(%ebp)
  28057b: e9 46 ff ff ff               	jmp	-186 <HariMain+0x4c6>
  280580: 83 ec 0c                     	subl	$12, %esp
  280583: ff 75 a4                     	pushl	-92(%ebp)
  280586: e8 c3 3b 00 00               	calll	15299 <task_sleep>
  28058b: 83 c4 10                     	addl	$16, %esp
  28058e: e8 91 0b 00 00               	calll	2961 <io_sti>
  280593: e9 2e ff ff ff               	jmp	-210 <HariMain+0x4c6>
  280598: 83 ec 0c                     	subl	$12, %esp
  28059b: 8d 85 3c ff ff ff            	leal	-196(%ebp), %eax
  2805a1: 50                           	pushl	%eax
  2805a2: e8 4d 1b 00 00               	calll	6989 <fifo32_get>
  2805a7: 83 c4 10                     	addl	$16, %esp
  2805aa: 89 85 9c fc ff ff            	movl	%eax, -868(%ebp)
  2805b0: e8 6f 0b 00 00               	calll	2927 <io_sti>
  2805b5: 83 7d bc 00                  	cmpl	$0, -68(%ebp)
  2805b9: 74 42                        	je	66 <HariMain+0x5fd>
  2805bb: 8b 45 bc                     	movl	-68(%ebp), %eax
  2805be: 8b 40 1c                     	movl	28(%eax), %eax
  2805c1: 85 c0                        	testl	%eax, %eax
  2805c3: 75 38                        	jne	56 <HariMain+0x5fd>
  2805c5: 8b 45 a8                     	movl	-88(%ebp), %eax
  2805c8: 8b 40 10                     	movl	16(%eax), %eax
  2805cb: 83 f8 01                     	cmpl	$1, %eax
  2805ce: 75 09                        	jne	9 <HariMain+0x5d9>
  2805d0: c7 45 bc 00 00 00 00         	movl	$0, -68(%ebp)
  2805d7: eb 24                        	jmp	36 <HariMain+0x5fd>
  2805d9: 8b 45 a8                     	movl	-88(%ebp), %eax
  2805dc: 8b 40 10                     	movl	16(%eax), %eax
  2805df: 8d 50 ff                     	leal	-1(%eax), %edx
  2805e2: 8b 45 a8                     	movl	-88(%ebp), %eax
  2805e5: 83 c2 04                     	addl	$4, %edx
  2805e8: 8b 44 90 04                  	movl	4(%eax,%edx,4), %eax
  2805ec: 89 45 bc                     	movl	%eax, -68(%ebp)
  2805ef: 83 ec 0c                     	subl	$12, %esp
  2805f2: ff 75 bc                     	pushl	-68(%ebp)
  2805f5: e8 72 08 00 00               	calll	2162 <keywin_on>
  2805fa: 83 c4 10                     	addl	$16, %esp
  2805fd: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280603: 3d ff 00 00 00               	cmpl	$255, %eax
  280608: 0f 8e 8d 03 00 00            	jle	909 <HariMain+0x99b>
  28060e: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280614: 3d ff 01 00 00               	cmpl	$511, %eax
  280619: 0f 8f 7c 03 00 00            	jg	892 <HariMain+0x99b>
  28061f: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280625: 3d 7f 01 00 00               	cmpl	$383, %eax
  28062a: 7f 3a                        	jg	58 <HariMain+0x666>
  28062c: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
  280630: 75 1a                        	jne	26 <HariMain+0x64c>
  280632: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280638: 2d 00 01 00 00               	subl	$256, %eax
  28063d: 0f b6 80 00 10 31 00         	movzbl	3215360(%eax), %eax
  280644: 88 85 58 ff ff ff            	movb	%al, -168(%ebp)
  28064a: eb 21                        	jmp	33 <HariMain+0x66d>
  28064c: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280652: 2d 00 01 00 00               	subl	$256, %eax
  280657: 0f b6 80 80 10 31 00         	movzbl	3215488(%eax), %eax
  28065e: 88 85 58 ff ff ff            	movb	%al, -168(%ebp)
  280664: eb 07                        	jmp	7 <HariMain+0x66d>
  280666: c6 85 58 ff ff ff 00         	movb	$0, -168(%ebp)
  28066d: 0f b6 85 58 ff ff ff         	movzbl	-168(%ebp), %eax
  280674: 3c 40                        	cmpb	$64, %al
  280676: 7e 3b                        	jle	59 <HariMain+0x6b3>
  280678: 0f b6 85 58 ff ff ff         	movzbl	-168(%ebp), %eax
  28067f: 3c 5a                        	cmpb	$90, %al
  280681: 7f 30                        	jg	48 <HariMain+0x6b3>
  280683: 8b 45 d8                     	movl	-40(%ebp), %eax
  280686: 83 e0 04                     	andl	$4, %eax
  280689: 85 c0                        	testl	%eax, %eax
  28068b: 75 06                        	jne	6 <HariMain+0x693>
  28068d: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
  280691: 74 10                        	je	16 <HariMain+0x6a3>
  280693: 8b 45 d8                     	movl	-40(%ebp), %eax
  280696: 83 e0 04                     	andl	$4, %eax
  280699: 85 c0                        	testl	%eax, %eax
  28069b: 74 16                        	je	22 <HariMain+0x6b3>
  28069d: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
  2806a1: 74 10                        	je	16 <HariMain+0x6b3>
  2806a3: 0f b6 85 58 ff ff ff         	movzbl	-168(%ebp), %eax
  2806aa: 83 c0 20                     	addl	$32, %eax
  2806ad: 88 85 58 ff ff ff            	movb	%al, -168(%ebp)
  2806b3: 0f b6 85 58 ff ff ff         	movzbl	-168(%ebp), %eax
  2806ba: 84 c0                        	testb	%al, %al
  2806bc: 74 2c                        	je	44 <HariMain+0x6ea>
  2806be: 83 7d bc 00                  	cmpl	$0, -68(%ebp)
  2806c2: 74 26                        	je	38 <HariMain+0x6ea>
  2806c4: 0f b6 85 58 ff ff ff         	movzbl	-168(%ebp), %eax
  2806cb: 0f be c0                     	movsbl	%al, %eax
  2806ce: 8d 90 00 01 00 00            	leal	256(%eax), %edx
  2806d4: 8b 45 bc                     	movl	-68(%ebp), %eax
  2806d7: 8b 40 24                     	movl	36(%eax), %eax
  2806da: 83 c0 10                     	addl	$16, %eax
  2806dd: 83 ec 08                     	subl	$8, %esp
  2806e0: 52                           	pushl	%edx
  2806e1: 50                           	pushl	%eax
  2806e2: e8 60 19 00 00               	calll	6496 <fifo32_put>
  2806e7: 83 c4 10                     	addl	$16, %esp
  2806ea: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  2806f0: 3d 0f 01 00 00               	cmpl	$271, %eax
  2806f5: 75 50                        	jne	80 <HariMain+0x747>
  2806f7: 83 7d bc 00                  	cmpl	$0, -68(%ebp)
  2806fb: 74 4a                        	je	74 <HariMain+0x747>
  2806fd: 83 ec 0c                     	subl	$12, %esp
  280700: ff 75 bc                     	pushl	-68(%ebp)
  280703: e8 26 07 00 00               	calll	1830 <keywin_off>
  280708: 83 c4 10                     	addl	$16, %esp
  28070b: 8b 45 bc                     	movl	-68(%ebp), %eax
  28070e: 8b 40 18                     	movl	24(%eax), %eax
  280711: 83 e8 01                     	subl	$1, %eax
  280714: 89 45 d0                     	movl	%eax, -48(%ebp)
  280717: 83 7d d0 00                  	cmpl	$0, -48(%ebp)
  28071b: 75 0c                        	jne	12 <HariMain+0x729>
  28071d: 8b 45 a8                     	movl	-88(%ebp), %eax
  280720: 8b 40 10                     	movl	16(%eax), %eax
  280723: 83 e8 01                     	subl	$1, %eax
  280726: 89 45 d0                     	movl	%eax, -48(%ebp)
  280729: 8b 45 a8                     	movl	-88(%ebp), %eax
  28072c: 8b 55 d0                     	movl	-48(%ebp), %edx
  28072f: 83 c2 04                     	addl	$4, %edx
  280732: 8b 44 90 04                  	movl	4(%eax,%edx,4), %eax
  280736: 89 45 bc                     	movl	%eax, -68(%ebp)
  280739: 83 ec 0c                     	subl	$12, %esp
  28073c: ff 75 bc                     	pushl	-68(%ebp)
  28073f: e8 28 07 00 00               	calll	1832 <keywin_on>
  280744: 83 c4 10                     	addl	$16, %esp
  280747: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  28074d: 3d 2a 01 00 00               	cmpl	$298, %eax
  280752: 75 04                        	jne	4 <HariMain+0x758>
  280754: 83 4d dc 01                  	orl	$1, -36(%ebp)
  280758: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  28075e: 3d 36 01 00 00               	cmpl	$310, %eax
  280763: 75 04                        	jne	4 <HariMain+0x769>
  280765: 83 4d dc 02                  	orl	$2, -36(%ebp)
  280769: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  28076f: 3d aa 01 00 00               	cmpl	$426, %eax
  280774: 75 04                        	jne	4 <HariMain+0x77a>
  280776: 83 65 dc fe                  	andl	$-2, -36(%ebp)
  28077a: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280780: 3d b6 01 00 00               	cmpl	$438, %eax
  280785: 75 04                        	jne	4 <HariMain+0x78b>
  280787: 83 65 dc fd                  	andl	$-3, -36(%ebp)
  28078b: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280791: 3d 3a 01 00 00               	cmpl	$314, %eax
  280796: 75 30                        	jne	48 <HariMain+0x7c8>
  280798: 83 75 d8 04                  	xorl	$4, -40(%ebp)
  28079c: 83 ec 08                     	subl	$8, %esp
  28079f: 68 ed 00 00 00               	pushl	$237
  2807a4: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  2807aa: 50                           	pushl	%eax
  2807ab: e8 97 18 00 00               	calll	6295 <fifo32_put>
  2807b0: 83 c4 10                     	addl	$16, %esp
  2807b3: 83 ec 08                     	subl	$8, %esp
  2807b6: ff 75 d8                     	pushl	-40(%ebp)
  2807b9: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  2807bf: 50                           	pushl	%eax
  2807c0: e8 82 18 00 00               	calll	6274 <fifo32_put>
  2807c5: 83 c4 10                     	addl	$16, %esp
  2807c8: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  2807ce: 3d 45 01 00 00               	cmpl	$325, %eax
  2807d3: 75 30                        	jne	48 <HariMain+0x805>
  2807d5: 83 75 d8 02                  	xorl	$2, -40(%ebp)
  2807d9: 83 ec 08                     	subl	$8, %esp
  2807dc: 68 ed 00 00 00               	pushl	$237
  2807e1: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  2807e7: 50                           	pushl	%eax
  2807e8: e8 5a 18 00 00               	calll	6234 <fifo32_put>
  2807ed: 83 c4 10                     	addl	$16, %esp
  2807f0: 83 ec 08                     	subl	$8, %esp
  2807f3: ff 75 d8                     	pushl	-40(%ebp)
  2807f6: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  2807fc: 50                           	pushl	%eax
  2807fd: e8 45 18 00 00               	calll	6213 <fifo32_put>
  280802: 83 c4 10                     	addl	$16, %esp
  280805: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  28080b: 3d 46 01 00 00               	cmpl	$326, %eax
  280810: 75 30                        	jne	48 <HariMain+0x842>
  280812: 83 75 d8 01                  	xorl	$1, -40(%ebp)
  280816: 83 ec 08                     	subl	$8, %esp
  280819: 68 ed 00 00 00               	pushl	$237
  28081e: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  280824: 50                           	pushl	%eax
  280825: e8 1d 18 00 00               	calll	6173 <fifo32_put>
  28082a: 83 c4 10                     	addl	$16, %esp
  28082d: 83 ec 08                     	subl	$8, %esp
  280830: ff 75 d8                     	pushl	-40(%ebp)
  280833: 8d 85 20 ff ff ff            	leal	-224(%ebp), %eax
  280839: 50                           	pushl	%eax
  28083a: e8 08 18 00 00               	calll	6152 <fifo32_put>
  28083f: 83 c4 10                     	addl	$16, %esp
  280842: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280848: 3d 3b 01 00 00               	cmpl	$315, %eax
  28084d: 75 74                        	jne	116 <HariMain+0x8c3>
  28084f: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
  280853: 74 6e                        	je	110 <HariMain+0x8c3>
  280855: 83 7d bc 00                  	cmpl	$0, -68(%ebp)
  280859: 74 68                        	je	104 <HariMain+0x8c3>
  28085b: 8b 45 bc                     	movl	-68(%ebp), %eax
  28085e: 8b 40 24                     	movl	36(%eax), %eax
  280861: 89 45 8c                     	movl	%eax, -116(%ebp)
  280864: 83 7d 8c 00                  	cmpl	$0, -116(%ebp)
  280868: 74 59                        	je	89 <HariMain+0x8c3>
  28086a: 8b 45 8c                     	movl	-116(%ebp), %eax
  28086d: 8b 40 34                     	movl	52(%eax), %eax
  280870: 85 c0                        	testl	%eax, %eax
  280872: 74 4f                        	je	79 <HariMain+0x8c3>
  280874: 8b 45 8c                     	movl	-116(%ebp), %eax
  280877: 8b 80 a4 00 00 00            	movl	164(%eax), %eax
  28087d: 83 ec 08                     	subl	$8, %esp
  280880: 68 0c 11 31 00               	pushl	$3215628
  280885: 50                           	pushl	%eax
  280886: e8 c1 46 00 00               	calll	18113 <cons_putstr0>
  28088b: 83 c4 10                     	addl	$16, %esp
  28088e: e8 8f 08 00 00               	calll	2191 <io_cli>
  280893: 8b 45 8c                     	movl	-116(%ebp), %eax
  280896: 83 c0 30                     	addl	$48, %eax
  280899: 89 c2                        	movl	%eax, %edx
  28089b: 8b 45 8c                     	movl	-116(%ebp), %eax
  28089e: 89 50 54                     	movl	%edx, 84(%eax)
  2808a1: ba 93 12 28 00               	movl	$2626195, %edx
  2808a6: 8b 45 8c                     	movl	-116(%ebp), %eax
  2808a9: 89 50 4c                     	movl	%edx, 76(%eax)
  2808ac: e8 73 08 00 00               	calll	2163 <io_sti>
  2808b1: 83 ec 04                     	subl	$4, %esp
  2808b4: 6a 00                        	pushl	$0
  2808b6: 6a ff                        	pushl	$-1
  2808b8: ff 75 8c                     	pushl	-116(%ebp)
  2808bb: e8 21 38 00 00               	calll	14369 <task_run>
  2808c0: 83 c4 10                     	addl	$16, %esp
  2808c3: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  2808c9: 3d 3c 01 00 00               	cmpl	$316, %eax
  2808ce: 75 63                        	jne	99 <HariMain+0x933>
  2808d0: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
  2808d4: 74 5d                        	je	93 <HariMain+0x933>
  2808d6: 83 7d bc 00                  	cmpl	$0, -68(%ebp)
  2808da: 74 0e                        	je	14 <HariMain+0x8ea>
  2808dc: 83 ec 0c                     	subl	$12, %esp
  2808df: ff 75 bc                     	pushl	-68(%ebp)
  2808e2: e8 47 05 00 00               	calll	1351 <keywin_off>
  2808e7: 83 c4 10                     	addl	$16, %esp
  2808ea: 83 ec 08                     	subl	$8, %esp
  2808ed: ff 75 ac                     	pushl	-84(%ebp)
  2808f0: ff 75 a8                     	pushl	-88(%ebp)
  2808f3: e8 b1 06 00 00               	calll	1713 <open_console>
  2808f8: 83 c4 10                     	addl	$16, %esp
  2808fb: 89 45 bc                     	movl	%eax, -68(%ebp)
  2808fe: 83 ec 04                     	subl	$4, %esp
  280901: 6a 04                        	pushl	$4
  280903: 6a 20                        	pushl	$32
  280905: ff 75 bc                     	pushl	-68(%ebp)
  280908: e8 af 2d 00 00               	calll	11695 <sheet_slide>
  28090d: 83 c4 10                     	addl	$16, %esp
  280910: 8b 45 a8                     	movl	-88(%ebp), %eax
  280913: 8b 40 10                     	movl	16(%eax), %eax
  280916: 83 ec 08                     	subl	$8, %esp
  280919: 50                           	pushl	%eax
  28091a: ff 75 bc                     	pushl	-68(%ebp)
  28091d: e8 b2 29 00 00               	calll	10674 <sheet_updown>
  280922: 83 c4 10                     	addl	$16, %esp
  280925: 83 ec 0c                     	subl	$12, %esp
  280928: ff 75 bc                     	pushl	-68(%ebp)
  28092b: e8 3c 05 00 00               	calll	1340 <keywin_on>
  280930: 83 c4 10                     	addl	$16, %esp
  280933: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280939: 3d 57 01 00 00               	cmpl	$343, %eax
  28093e: 75 1c                        	jne	28 <HariMain+0x95c>
  280940: 8b 45 a8                     	movl	-88(%ebp), %eax
  280943: 8b 40 10                     	movl	16(%eax), %eax
  280946: 8d 50 ff                     	leal	-1(%eax), %edx
  280949: 8b 45 a8                     	movl	-88(%ebp), %eax
  28094c: 8b 40 18                     	movl	24(%eax), %eax
  28094f: 83 ec 08                     	subl	$8, %esp
  280952: 52                           	pushl	%edx
  280953: 50                           	pushl	%eax
  280954: e8 7b 29 00 00               	calll	10619 <sheet_updown>
  280959: 83 c4 10                     	addl	$16, %esp
  28095c: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280962: 3d fa 01 00 00               	cmpl	$506, %eax
  280967: 75 07                        	jne	7 <HariMain+0x970>
  280969: c7 45 d4 ff ff ff ff         	movl	$4294967295, -44(%ebp)
  280970: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280976: 3d fe 01 00 00               	cmpl	$510, %eax
  28097b: 0f 85 a8 04 00 00            	jne	1192 <HariMain+0xe29>
  280981: e8 37 18 00 00               	calll	6199 <wait_KBC_sendready>
  280986: 83 ec 08                     	subl	$8, %esp
  280989: ff 75 d4                     	pushl	-44(%ebp)
  28098c: 6a 60                        	pushl	$96
  28098e: e8 b3 07 00 00               	calll	1971 <io_out8>
  280993: 83 c4 10                     	addl	$16, %esp
  280996: e9 8e 04 00 00               	jmp	1166 <HariMain+0xe29>
  28099b: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  2809a1: 3d ff 01 00 00               	cmpl	$511, %eax
  2809a6: 0f 8e 71 03 00 00            	jle	881 <HariMain+0xd1d>
  2809ac: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  2809b2: 3d ff 02 00 00               	cmpl	$767, %eax
  2809b7: 0f 8f 60 03 00 00            	jg	864 <HariMain+0xd1d>
  2809bd: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  2809c3: 0f b6 c0                     	movzbl	%al, %eax
  2809c6: 83 ec 08                     	subl	$8, %esp
  2809c9: 50                           	pushl	%eax
  2809ca: 8d 85 8c fc ff ff            	leal	-884(%ebp), %eax
  2809d0: 50                           	pushl	%eax
  2809d1: e8 ed 18 00 00               	calll	6381 <mouse_decode>
  2809d6: 83 c4 10                     	addl	$16, %esp
  2809d9: 85 c0                        	testl	%eax, %eax
  2809db: 0f 84 47 04 00 00            	je	1095 <HariMain+0xe28>
  2809e1: 8b 85 90 fc ff ff            	movl	-880(%ebp), %eax
  2809e7: 01 45 f4                     	addl	%eax, -12(%ebp)
  2809ea: 8b 85 94 fc ff ff            	movl	-876(%ebp), %eax
  2809f0: 01 45 f0                     	addl	%eax, -16(%ebp)
  2809f3: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
  2809f7: 79 07                        	jns	7 <HariMain+0xa00>
  2809f9: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  280a00: 83 7d f0 00                  	cmpl	$0, -16(%ebp)
  280a04: 79 07                        	jns	7 <HariMain+0xa0d>
  280a06: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
  280a0d: 8b 45 b4                     	movl	-76(%ebp), %eax
  280a10: 0f b7 40 04                  	movzwl	4(%eax), %eax
  280a14: 98                           	cwtl
  280a15: 83 e8 01                     	subl	$1, %eax
  280a18: 39 45 f4                     	cmpl	%eax, -12(%ebp)
  280a1b: 7e 0e                        	jle	14 <HariMain+0xa2b>
  280a1d: 8b 45 b4                     	movl	-76(%ebp), %eax
  280a20: 0f b7 40 04                  	movzwl	4(%eax), %eax
  280a24: 98                           	cwtl
  280a25: 83 e8 01                     	subl	$1, %eax
  280a28: 89 45 f4                     	movl	%eax, -12(%ebp)
  280a2b: 8b 45 b4                     	movl	-76(%ebp), %eax
  280a2e: 0f b7 40 06                  	movzwl	6(%eax), %eax
  280a32: 98                           	cwtl
  280a33: 83 e8 01                     	subl	$1, %eax
  280a36: 39 45 f0                     	cmpl	%eax, -16(%ebp)
  280a39: 7e 0e                        	jle	14 <HariMain+0xa49>
  280a3b: 8b 45 b4                     	movl	-76(%ebp), %eax
  280a3e: 0f b7 40 06                  	movzwl	6(%eax), %eax
  280a42: 98                           	cwtl
  280a43: 83 e8 01                     	subl	$1, %eax
  280a46: 89 45 f0                     	movl	%eax, -16(%ebp)
  280a49: 8b 45 f4                     	movl	-12(%ebp), %eax
  280a4c: 89 45 ec                     	movl	%eax, -20(%ebp)
  280a4f: 8b 45 f0                     	movl	-16(%ebp), %eax
  280a52: 89 45 e8                     	movl	%eax, -24(%ebp)
  280a55: 8b 85 98 fc ff ff            	movl	-872(%ebp), %eax
  280a5b: 83 e0 01                     	andl	$1, %eax
  280a5e: 85 c0                        	testl	%eax, %eax
  280a60: 0f 84 7d 02 00 00            	je	637 <HariMain+0xce3>
  280a66: 83 7d cc 00                  	cmpl	$0, -52(%ebp)
  280a6a: 0f 89 3f 02 00 00            	jns	575 <HariMain+0xcaf>
  280a70: 8b 45 a8                     	movl	-88(%ebp), %eax
  280a73: 8b 40 10                     	movl	16(%eax), %eax
  280a76: 83 e8 01                     	subl	$1, %eax
  280a79: 89 45 d0                     	movl	%eax, -48(%ebp)
  280a7c: e9 1f 02 00 00               	jmp	543 <HariMain+0xca0>
  280a81: 8b 45 a8                     	movl	-88(%ebp), %eax
  280a84: 8b 55 d0                     	movl	-48(%ebp), %edx
  280a87: 83 c2 04                     	addl	$4, %edx
  280a8a: 8b 44 90 04                  	movl	4(%eax,%edx,4), %eax
  280a8e: 89 45 c0                     	movl	%eax, -64(%ebp)
  280a91: 8b 45 c0                     	movl	-64(%ebp), %eax
  280a94: 8b 40 0c                     	movl	12(%eax), %eax
  280a97: 8b 55 f4                     	movl	-12(%ebp), %edx
  280a9a: 29 c2                        	subl	%eax, %edx
  280a9c: 89 d0                        	movl	%edx, %eax
  280a9e: 89 45 88                     	movl	%eax, -120(%ebp)
  280aa1: 8b 45 c0                     	movl	-64(%ebp), %eax
  280aa4: 8b 40 10                     	movl	16(%eax), %eax
  280aa7: 8b 55 f0                     	movl	-16(%ebp), %edx
  280aaa: 29 c2                        	subl	%eax, %edx
  280aac: 89 d0                        	movl	%edx, %eax
  280aae: 89 45 84                     	movl	%eax, -124(%ebp)
  280ab1: 83 7d 88 00                  	cmpl	$0, -120(%ebp)
  280ab5: 0f 88 e1 01 00 00            	js	481 <HariMain+0xc9c>
  280abb: 8b 45 c0                     	movl	-64(%ebp), %eax
  280abe: 8b 40 04                     	movl	4(%eax), %eax
  280ac1: 39 45 88                     	cmpl	%eax, -120(%ebp)
  280ac4: 0f 8d d2 01 00 00            	jge	466 <HariMain+0xc9c>
  280aca: 83 7d 84 00                  	cmpl	$0, -124(%ebp)
  280ace: 0f 88 c8 01 00 00            	js	456 <HariMain+0xc9c>
  280ad4: 8b 45 c0                     	movl	-64(%ebp), %eax
  280ad7: 8b 40 08                     	movl	8(%eax), %eax
  280ada: 39 45 84                     	cmpl	%eax, -124(%ebp)
  280add: 0f 8d b9 01 00 00            	jge	441 <HariMain+0xc9c>
  280ae3: 8b 45 c0                     	movl	-64(%ebp), %eax
  280ae6: 8b 10                        	movl	(%eax), %edx
  280ae8: 8b 45 c0                     	movl	-64(%ebp), %eax
  280aeb: 8b 40 04                     	movl	4(%eax), %eax
  280aee: 0f af 45 84                  	imull	-124(%ebp), %eax
  280af2: 89 c1                        	movl	%eax, %ecx
  280af4: 8b 45 88                     	movl	-120(%ebp), %eax
  280af7: 01 c8                        	addl	%ecx, %eax
  280af9: 01 d0                        	addl	%edx, %eax
  280afb: 0f b6 00                     	movzbl	(%eax), %eax
  280afe: 0f b6 d0                     	movzbl	%al, %edx
  280b01: 8b 45 c0                     	movl	-64(%ebp), %eax
  280b04: 8b 40 14                     	movl	20(%eax), %eax
  280b07: 39 c2                        	cmpl	%eax, %edx
  280b09: 0f 84 8d 01 00 00            	je	397 <HariMain+0xc9c>
  280b0f: 8b 45 a8                     	movl	-88(%ebp), %eax
  280b12: 8b 40 10                     	movl	16(%eax), %eax
  280b15: 83 e8 01                     	subl	$1, %eax
  280b18: 83 ec 08                     	subl	$8, %esp
  280b1b: 50                           	pushl	%eax
  280b1c: ff 75 c0                     	pushl	-64(%ebp)
  280b1f: e8 b0 27 00 00               	calll	10160 <sheet_updown>
  280b24: 83 c4 10                     	addl	$16, %esp
  280b27: 8b 45 c0                     	movl	-64(%ebp), %eax
  280b2a: 3b 45 bc                     	cmpl	-68(%ebp), %eax
  280b2d: 74 22                        	je	34 <HariMain+0xb51>
  280b2f: 83 ec 0c                     	subl	$12, %esp
  280b32: ff 75 bc                     	pushl	-68(%ebp)
  280b35: e8 f4 02 00 00               	calll	756 <keywin_off>
  280b3a: 83 c4 10                     	addl	$16, %esp
  280b3d: 8b 45 c0                     	movl	-64(%ebp), %eax
  280b40: 89 45 bc                     	movl	%eax, -68(%ebp)
  280b43: 83 ec 0c                     	subl	$12, %esp
  280b46: ff 75 bc                     	pushl	-68(%ebp)
  280b49: e8 1e 03 00 00               	calll	798 <keywin_on>
  280b4e: 83 c4 10                     	addl	$16, %esp
  280b51: 83 7d 88 02                  	cmpl	$2, -120(%ebp)
  280b55: 7e 38                        	jle	56 <HariMain+0xb8f>
  280b57: 8b 45 c0                     	movl	-64(%ebp), %eax
  280b5a: 8b 40 04                     	movl	4(%eax), %eax
  280b5d: 83 e8 03                     	subl	$3, %eax
  280b60: 39 45 88                     	cmpl	%eax, -120(%ebp)
  280b63: 7d 2a                        	jge	42 <HariMain+0xb8f>
  280b65: 83 7d 84 02                  	cmpl	$2, -124(%ebp)
  280b69: 7e 24                        	jle	36 <HariMain+0xb8f>
  280b6b: 83 7d 84 14                  	cmpl	$20, -124(%ebp)
  280b6f: 7f 1e                        	jg	30 <HariMain+0xb8f>
  280b71: 8b 45 f4                     	movl	-12(%ebp), %eax
  280b74: 89 45 cc                     	movl	%eax, -52(%ebp)
  280b77: 8b 45 f0                     	movl	-16(%ebp), %eax
  280b7a: 89 45 c8                     	movl	%eax, -56(%ebp)
  280b7d: 8b 45 c0                     	movl	-64(%ebp), %eax
  280b80: 8b 40 0c                     	movl	12(%eax), %eax
  280b83: 89 45 c4                     	movl	%eax, -60(%ebp)
  280b86: 8b 45 c0                     	movl	-64(%ebp), %eax
  280b89: 8b 40 10                     	movl	16(%eax), %eax
  280b8c: 89 45 e0                     	movl	%eax, -32(%ebp)
  280b8f: 8b 45 c0                     	movl	-64(%ebp), %eax
  280b92: 8b 40 04                     	movl	4(%eax), %eax
  280b95: 83 e8 15                     	subl	$21, %eax
  280b98: 39 45 88                     	cmpl	%eax, -120(%ebp)
  280b9b: 0f 8c 76 01 00 00            	jl	374 <HariMain+0xd17>
  280ba1: 8b 45 c0                     	movl	-64(%ebp), %eax
  280ba4: 8b 40 04                     	movl	4(%eax), %eax
  280ba7: 83 e8 05                     	subl	$5, %eax
  280baa: 39 45 88                     	cmpl	%eax, -120(%ebp)
  280bad: 0f 8d 64 01 00 00            	jge	356 <HariMain+0xd17>
  280bb3: 83 7d 84 04                  	cmpl	$4, -124(%ebp)
  280bb7: 0f 8e 5a 01 00 00            	jle	346 <HariMain+0xd17>
  280bbd: 83 7d 84 12                  	cmpl	$18, -124(%ebp)
  280bc1: 0f 8f 50 01 00 00            	jg	336 <HariMain+0xd17>
  280bc7: 8b 45 c0                     	movl	-64(%ebp), %eax
  280bca: 8b 40 1c                     	movl	28(%eax), %eax
  280bcd: 83 e0 10                     	andl	$16, %eax
  280bd0: 85 c0                        	testl	%eax, %eax
  280bd2: 74 5d                        	je	93 <HariMain+0xc31>
  280bd4: 8b 45 c0                     	movl	-64(%ebp), %eax
  280bd7: 8b 40 24                     	movl	36(%eax), %eax
  280bda: 89 45 8c                     	movl	%eax, -116(%ebp)
  280bdd: 8b 45 8c                     	movl	-116(%ebp), %eax
  280be0: 8b 80 a4 00 00 00            	movl	164(%eax), %eax
  280be6: 83 ec 08                     	subl	$8, %esp
  280be9: 68 1b 11 31 00               	pushl	$3215643
  280bee: 50                           	pushl	%eax
  280bef: e8 58 43 00 00               	calll	17240 <cons_putstr0>
  280bf4: 83 c4 10                     	addl	$16, %esp
  280bf7: e8 26 05 00 00               	calll	1318 <io_cli>
  280bfc: 8b 45 8c                     	movl	-116(%ebp), %eax
  280bff: 83 c0 30                     	addl	$48, %eax
  280c02: 89 c2                        	movl	%eax, %edx
  280c04: 8b 45 8c                     	movl	-116(%ebp), %eax
  280c07: 89 50 54                     	movl	%edx, 84(%eax)
  280c0a: ba 93 12 28 00               	movl	$2626195, %edx
  280c0f: 8b 45 8c                     	movl	-116(%ebp), %eax
  280c12: 89 50 4c                     	movl	%edx, 76(%eax)
  280c15: e8 0a 05 00 00               	calll	1290 <io_sti>
  280c1a: 83 ec 04                     	subl	$4, %esp
  280c1d: 6a 00                        	pushl	$0
  280c1f: 6a ff                        	pushl	$-1
  280c21: ff 75 8c                     	pushl	-116(%ebp)
  280c24: e8 b8 34 00 00               	calll	13496 <task_run>
  280c29: 83 c4 10                     	addl	$16, %esp
  280c2c: e9 e6 00 00 00               	jmp	230 <HariMain+0xd17>
  280c31: 8b 45 c0                     	movl	-64(%ebp), %eax
  280c34: 8b 40 24                     	movl	36(%eax), %eax
  280c37: 89 45 8c                     	movl	%eax, -116(%ebp)
  280c3a: 83 ec 08                     	subl	$8, %esp
  280c3d: 6a ff                        	pushl	$-1
  280c3f: ff 75 c0                     	pushl	-64(%ebp)
  280c42: e8 8d 26 00 00               	calll	9869 <sheet_updown>
  280c47: 83 c4 10                     	addl	$16, %esp
  280c4a: 83 ec 0c                     	subl	$12, %esp
  280c4d: ff 75 bc                     	pushl	-68(%ebp)
  280c50: e8 d9 01 00 00               	calll	473 <keywin_off>
  280c55: 83 c4 10                     	addl	$16, %esp
  280c58: 8b 45 a8                     	movl	-88(%ebp), %eax
  280c5b: 8b 40 10                     	movl	16(%eax), %eax
  280c5e: 8d 50 ff                     	leal	-1(%eax), %edx
  280c61: 8b 45 a8                     	movl	-88(%ebp), %eax
  280c64: 83 c2 04                     	addl	$4, %edx
  280c67: 8b 44 90 04                  	movl	4(%eax,%edx,4), %eax
  280c6b: 89 45 bc                     	movl	%eax, -68(%ebp)
  280c6e: 83 ec 0c                     	subl	$12, %esp
  280c71: ff 75 bc                     	pushl	-68(%ebp)
  280c74: e8 f3 01 00 00               	calll	499 <keywin_on>
  280c79: 83 c4 10                     	addl	$16, %esp
  280c7c: e8 a1 04 00 00               	calll	1185 <io_cli>
  280c81: 8b 45 8c                     	movl	-116(%ebp), %eax
  280c84: 83 c0 10                     	addl	$16, %eax
  280c87: 83 ec 08                     	subl	$8, %esp
  280c8a: 6a 04                        	pushl	$4
  280c8c: 50                           	pushl	%eax
  280c8d: e8 b5 13 00 00               	calll	5045 <fifo32_put>
  280c92: 83 c4 10                     	addl	$16, %esp
  280c95: e8 8a 04 00 00               	calll	1162 <io_sti>
  280c9a: eb 7b                        	jmp	123 <HariMain+0xd17>
  280c9c: 83 6d d0 01                  	subl	$1, -48(%ebp)
  280ca0: 83 7d d0 00                  	cmpl	$0, -48(%ebp)
  280ca4: 0f 8f d7 fd ff ff            	jg	-553 <HariMain+0xa81>
  280caa: e9 79 01 00 00               	jmp	377 <HariMain+0xe28>
  280caf: 8b 45 f4                     	movl	-12(%ebp), %eax
  280cb2: 2b 45 cc                     	subl	-52(%ebp), %eax
  280cb5: 89 45 88                     	movl	%eax, -120(%ebp)
  280cb8: 8b 45 f0                     	movl	-16(%ebp), %eax
  280cbb: 2b 45 c8                     	subl	-56(%ebp), %eax
  280cbe: 89 45 84                     	movl	%eax, -124(%ebp)
  280cc1: 8b 55 c4                     	movl	-60(%ebp), %edx
  280cc4: 8b 45 88                     	movl	-120(%ebp), %eax
  280cc7: 01 d0                        	addl	%edx, %eax
  280cc9: 83 c0 02                     	addl	$2, %eax
  280ccc: 83 e0 fc                     	andl	$-4, %eax
  280ccf: 89 45 e4                     	movl	%eax, -28(%ebp)
  280cd2: 8b 45 84                     	movl	-124(%ebp), %eax
  280cd5: 01 45 e0                     	addl	%eax, -32(%ebp)
  280cd8: 8b 45 f0                     	movl	-16(%ebp), %eax
  280cdb: 89 45 c8                     	movl	%eax, -56(%ebp)
  280cde: e9 45 01 00 00               	jmp	325 <HariMain+0xe28>
  280ce3: c7 45 cc ff ff ff ff         	movl	$4294967295, -52(%ebp)
  280cea: 81 7d e4 ff ff ff 7f         	cmpl	$2147483647, -28(%ebp)
  280cf1: 0f 84 31 01 00 00            	je	305 <HariMain+0xe28>
  280cf7: 83 ec 04                     	subl	$4, %esp
  280cfa: ff 75 e0                     	pushl	-32(%ebp)
  280cfd: ff 75 e4                     	pushl	-28(%ebp)
  280d00: ff 75 c0                     	pushl	-64(%ebp)
  280d03: e8 b4 29 00 00               	calll	10676 <sheet_slide>
  280d08: 83 c4 10                     	addl	$16, %esp
  280d0b: c7 45 e4 ff ff ff 7f         	movl	$2147483647, -28(%ebp)
  280d12: e9 11 01 00 00               	jmp	273 <HariMain+0xe28>
  280d17: 90                           	nop
  280d18: e9 0b 01 00 00               	jmp	267 <HariMain+0xe28>
  280d1d: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280d23: 3d ff 02 00 00               	cmpl	$767, %eax
  280d28: 7e 40                        	jle	64 <HariMain+0xd6a>
  280d2a: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280d30: 3d ff 03 00 00               	cmpl	$1023, %eax
  280d35: 7f 33                        	jg	51 <HariMain+0xd6a>
  280d37: 8b 45 a8                     	movl	-88(%ebp), %eax
  280d3a: 8d 88 14 04 00 00            	leal	1044(%eax), %ecx
  280d40: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280d46: 89 c2                        	movl	%eax, %edx
  280d48: 89 d0                        	movl	%edx, %eax
  280d4a: c1 e0 02                     	shll	$2, %eax
  280d4d: 01 d0                        	addl	%edx, %eax
  280d4f: c1 e0 03                     	shll	$3, %eax
  280d52: 2d 00 78 00 00               	subl	$30720, %eax
  280d57: 01 c8                        	addl	%ecx, %eax
  280d59: 83 ec 0c                     	subl	$12, %esp
  280d5c: 50                           	pushl	%eax
  280d5d: e8 63 03 00 00               	calll	867 <close_console>
  280d62: 83 c4 10                     	addl	$16, %esp
  280d65: e9 bf 00 00 00               	jmp	191 <HariMain+0xe29>
  280d6a: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280d70: 3d ff 03 00 00               	cmpl	$1023, %eax
  280d75: 7e 3e                        	jle	62 <HariMain+0xdb5>
  280d77: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280d7d: 3d e7 07 00 00               	cmpl	$2023, %eax
  280d82: 7f 31                        	jg	49 <HariMain+0xdb5>
  280d84: a1 7c 48 32 00               	movl	3295356, %eax
  280d89: 8d 88 f8 0f 00 00            	leal	4088(%eax), %ecx
  280d8f: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280d95: 89 c2                        	movl	%eax, %edx
  280d97: 89 d0                        	movl	%edx, %eax
  280d99: 01 c0                        	addl	%eax, %eax
  280d9b: 01 d0                        	addl	%edx, %eax
  280d9d: c1 e0 06                     	shll	$6, %eax
  280da0: 2d 00 00 03 00               	subl	$196608, %eax
  280da5: 01 c8                        	addl	%ecx, %eax
  280da7: 83 ec 0c                     	subl	$12, %esp
  280daa: 50                           	pushl	%eax
  280dab: e8 b6 02 00 00               	calll	694 <close_constask>
  280db0: 83 c4 10                     	addl	$16, %esp
  280db3: eb 74                        	jmp	116 <HariMain+0xe29>
  280db5: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280dbb: 3d e7 07 00 00               	cmpl	$2023, %eax
  280dc0: 0f 8e 00 f7 ff ff            	jle	-2304 <HariMain+0x4c6>
  280dc6: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280dcc: 3d e7 08 00 00               	cmpl	$2279, %eax
  280dd1: 0f 8f ef f6 ff ff            	jg	-2321 <HariMain+0x4c6>
  280dd7: 8b 45 a8                     	movl	-88(%ebp), %eax
  280dda: 8d 88 14 04 00 00            	leal	1044(%eax), %ecx
  280de0: 8b 85 9c fc ff ff            	movl	-868(%ebp), %eax
  280de6: 89 c2                        	movl	%eax, %edx
  280de8: 89 d0                        	movl	%edx, %eax
  280dea: c1 e0 02                     	shll	$2, %eax
  280ded: 01 d0                        	addl	%edx, %eax
  280def: c1 e0 03                     	shll	$3, %eax
  280df2: 2d 40 3c 01 00               	subl	$80960, %eax
  280df7: 01 c8                        	addl	%ecx, %eax
  280df9: 89 45 80                     	movl	%eax, -128(%ebp)
  280dfc: 8b 45 80                     	movl	-128(%ebp), %eax
  280dff: 8b 00                        	movl	(%eax), %eax
  280e01: 83 ec 04                     	subl	$4, %esp
  280e04: 68 00 a5 00 00               	pushl	$42240
  280e09: 50                           	pushl	%eax
  280e0a: ff 75 b0                     	pushl	-80(%ebp)
  280e0d: e8 72 1a 00 00               	calll	6770 <memman_free_4k>
  280e12: 83 c4 10                     	addl	$16, %esp
  280e15: 83 ec 0c                     	subl	$12, %esp
  280e18: ff 75 80                     	pushl	-128(%ebp)
  280e1b: e8 af 29 00 00               	calll	10671 <sheet_free>
  280e20: 83 c4 10                     	addl	$16, %esp
  280e23: e9 9e f6 ff ff               	jmp	-2402 <HariMain+0x4c6>
  280e28: 90                           	nop
  280e29: e9 98 f6 ff ff               	jmp	-2408 <HariMain+0x4c6>

00280e2e keywin_off:
  280e2e: 55                           	pushl	%ebp
  280e2f: 89 e5                        	movl	%esp, %ebp
  280e31: 83 ec 08                     	subl	$8, %esp
  280e34: 83 ec 08                     	subl	$8, %esp
  280e37: 6a 00                        	pushl	$0
  280e39: ff 75 08                     	pushl	8(%ebp)
  280e3c: e8 b4 39 00 00               	calll	14772 <change_wtitle8>
  280e41: 83 c4 10                     	addl	$16, %esp
  280e44: 8b 45 08                     	movl	8(%ebp), %eax
  280e47: 8b 40 1c                     	movl	28(%eax), %eax
  280e4a: 83 e0 20                     	andl	$32, %eax
  280e4d: 85 c0                        	testl	%eax, %eax
  280e4f: 74 18                        	je	24 <keywin_off+0x3b>
  280e51: 8b 45 08                     	movl	8(%ebp), %eax
  280e54: 8b 40 24                     	movl	36(%eax), %eax
  280e57: 83 c0 10                     	addl	$16, %eax
  280e5a: 83 ec 08                     	subl	$8, %esp
  280e5d: 6a 03                        	pushl	$3
  280e5f: 50                           	pushl	%eax
  280e60: e8 e2 11 00 00               	calll	4578 <fifo32_put>
  280e65: 83 c4 10                     	addl	$16, %esp
  280e68: 90                           	nop
  280e69: 90                           	nop
  280e6a: c9                           	leave
  280e6b: c3                           	retl

00280e6c keywin_on:
  280e6c: 55                           	pushl	%ebp
  280e6d: 89 e5                        	movl	%esp, %ebp
  280e6f: 83 ec 08                     	subl	$8, %esp
  280e72: 83 ec 08                     	subl	$8, %esp
  280e75: 6a 01                        	pushl	$1
  280e77: ff 75 08                     	pushl	8(%ebp)
  280e7a: e8 76 39 00 00               	calll	14710 <change_wtitle8>
  280e7f: 83 c4 10                     	addl	$16, %esp
  280e82: 8b 45 08                     	movl	8(%ebp), %eax
  280e85: 8b 40 1c                     	movl	28(%eax), %eax
  280e88: 83 e0 20                     	andl	$32, %eax
  280e8b: 85 c0                        	testl	%eax, %eax
  280e8d: 74 18                        	je	24 <keywin_on+0x3b>
  280e8f: 8b 45 08                     	movl	8(%ebp), %eax
  280e92: 8b 40 24                     	movl	36(%eax), %eax
  280e95: 83 c0 10                     	addl	$16, %eax
  280e98: 83 ec 08                     	subl	$8, %esp
  280e9b: 6a 02                        	pushl	$2
  280e9d: 50                           	pushl	%eax
  280e9e: e8 a4 11 00 00               	calll	4516 <fifo32_put>
  280ea3: 83 c4 10                     	addl	$16, %esp
  280ea6: 90                           	nop
  280ea7: 90                           	nop
  280ea8: c9                           	leave
  280ea9: c3                           	retl

00280eaa open_constask:
  280eaa: 55                           	pushl	%ebp
  280eab: 89 e5                        	movl	%esp, %ebp
  280ead: 83 ec 18                     	subl	$24, %esp
  280eb0: c7 45 f4 00 00 3c 00         	movl	$3932160, -12(%ebp)
  280eb7: e8 12 31 00 00               	calll	12562 <task_alloc>
  280ebc: 89 45 f0                     	movl	%eax, -16(%ebp)
  280ebf: 83 ec 08                     	subl	$8, %esp
  280ec2: 68 00 02 00 00               	pushl	$512
  280ec7: ff 75 f4                     	pushl	-12(%ebp)
  280eca: e8 89 19 00 00               	calll	6537 <memman_alloc_4k>
  280ecf: 83 c4 10                     	addl	$16, %esp
  280ed2: 89 45 ec                     	movl	%eax, -20(%ebp)
  280ed5: 83 ec 08                     	subl	$8, %esp
  280ed8: 68 00 00 01 00               	pushl	$65536
  280edd: ff 75 f4                     	pushl	-12(%ebp)
  280ee0: e8 73 19 00 00               	calll	6515 <memman_alloc_4k>
  280ee5: 83 c4 10                     	addl	$16, %esp
  280ee8: 89 c2                        	movl	%eax, %edx
  280eea: 8b 45 f0                     	movl	-16(%ebp), %eax
  280eed: 89 90 ac 00 00 00            	movl	%edx, 172(%eax)
  280ef3: 8b 45 f0                     	movl	-16(%ebp), %eax
  280ef6: 8b 80 ac 00 00 00            	movl	172(%eax), %eax
  280efc: 8d 90 f4 ff 00 00            	leal	65524(%eax), %edx
  280f02: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f05: 89 50 64                     	movl	%edx, 100(%eax)
  280f08: ba e6 48 28 00               	movl	$2640102, %edx
  280f0d: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f10: 89 50 4c                     	movl	%edx, 76(%eax)
  280f13: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f16: c7 40 74 08 00 00 00         	movl	$8, 116(%eax)
  280f1d: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f20: c7 40 78 10 00 00 00         	movl	$16, 120(%eax)
  280f27: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f2a: c7 40 7c 08 00 00 00         	movl	$8, 124(%eax)
  280f31: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f34: c7 80 80 00 00 00 08 00 00 00	movl	$8, 128(%eax)
  280f3e: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f41: c7 80 84 00 00 00 08 00 00 00	movl	$8, 132(%eax)
  280f4b: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f4e: c7 80 88 00 00 00 08 00 00 00	movl	$8, 136(%eax)
  280f58: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f5b: 8b 40 64                     	movl	100(%eax), %eax
  280f5e: 83 c0 04                     	addl	$4, %eax
  280f61: 89 c2                        	movl	%eax, %edx
  280f63: 8b 45 08                     	movl	8(%ebp), %eax
  280f66: 89 02                        	movl	%eax, (%edx)
  280f68: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f6b: 8b 40 64                     	movl	100(%eax), %eax
  280f6e: 83 c0 08                     	addl	$8, %eax
  280f71: 89 c2                        	movl	%eax, %edx
  280f73: 8b 45 0c                     	movl	12(%ebp), %eax
  280f76: 89 02                        	movl	%eax, (%edx)
  280f78: 83 ec 04                     	subl	$4, %esp
  280f7b: 6a 02                        	pushl	$2
  280f7d: 6a 02                        	pushl	$2
  280f7f: ff 75 f0                     	pushl	-16(%ebp)
  280f82: e8 5a 31 00 00               	calll	12634 <task_run>
  280f87: 83 c4 10                     	addl	$16, %esp
  280f8a: 8b 45 f0                     	movl	-16(%ebp), %eax
  280f8d: 83 c0 10                     	addl	$16, %eax
  280f90: ff 75 f0                     	pushl	-16(%ebp)
  280f93: ff 75 ec                     	pushl	-20(%ebp)
  280f96: 68 80 00 00 00               	pushl	$128
  280f9b: 50                           	pushl	%eax
  280f9c: e8 5f 10 00 00               	calll	4191 <fifo32_init>
  280fa1: 83 c4 10                     	addl	$16, %esp
  280fa4: 8b 45 f0                     	movl	-16(%ebp), %eax
  280fa7: c9                           	leave
  280fa8: c3                           	retl

00280fa9 open_console:
  280fa9: 55                           	pushl	%ebp
  280faa: 89 e5                        	movl	%esp, %ebp
  280fac: 83 ec 18                     	subl	$24, %esp
  280faf: c7 45 f4 00 00 3c 00         	movl	$3932160, -12(%ebp)
  280fb6: 83 ec 0c                     	subl	$12, %esp
  280fb9: ff 75 08                     	pushl	8(%ebp)
  280fbc: e8 d5 19 00 00               	calll	6613 <sheet_alloc>
  280fc1: 83 c4 10                     	addl	$16, %esp
  280fc4: 89 45 f0                     	movl	%eax, -16(%ebp)
  280fc7: 83 ec 08                     	subl	$8, %esp
  280fca: 68 00 a5 00 00               	pushl	$42240
  280fcf: ff 75 f4                     	pushl	-12(%ebp)
  280fd2: e8 81 18 00 00               	calll	6273 <memman_alloc_4k>
  280fd7: 83 c4 10                     	addl	$16, %esp
  280fda: 89 45 ec                     	movl	%eax, -20(%ebp)
  280fdd: 83 ec 0c                     	subl	$12, %esp
  280fe0: 6a ff                        	pushl	$-1
  280fe2: 68 a5 00 00 00               	pushl	$165
  280fe7: 68 00 01 00 00               	pushl	$256
  280fec: ff 75 ec                     	pushl	-20(%ebp)
  280fef: ff 75 f0                     	pushl	-16(%ebp)
  280ff2: e8 20 1a 00 00               	calll	6688 <sheet_setbuf>
  280ff7: 83 c4 20                     	addl	$32, %esp
  280ffa: 83 ec 0c                     	subl	$12, %esp
  280ffd: 6a 00                        	pushl	$0
  280fff: 68 2c 11 31 00               	pushl	$3215660
  281004: 68 a5 00 00 00               	pushl	$165
  281009: 68 00 01 00 00               	pushl	$256
  28100e: ff 75 ec                     	pushl	-20(%ebp)
  281011: e8 57 32 00 00               	calll	12887 <make_window8>
  281016: 83 c4 20                     	addl	$32, %esp
  281019: 83 ec 08                     	subl	$8, %esp
  28101c: 6a 00                        	pushl	$0
  28101e: 68 80 00 00 00               	pushl	$128
  281023: 68 f0 00 00 00               	pushl	$240
  281028: 6a 1c                        	pushl	$28
  28102a: 6a 08                        	pushl	$8
  28102c: ff 75 f0                     	pushl	-16(%ebp)
  28102f: e8 c2 35 00 00               	calll	13762 <make_textbox8>
  281034: 83 c4 20                     	addl	$32, %esp
  281037: 83 ec 08                     	subl	$8, %esp
  28103a: ff 75 0c                     	pushl	12(%ebp)
  28103d: ff 75 f0                     	pushl	-16(%ebp)
  281040: e8 65 fe ff ff               	calll	-411 <open_constask>
  281045: 83 c4 10                     	addl	$16, %esp
  281048: 89 c2                        	movl	%eax, %edx
  28104a: 8b 45 f0                     	movl	-16(%ebp), %eax
  28104d: 89 50 24                     	movl	%edx, 36(%eax)
  281050: 8b 45 f0                     	movl	-16(%ebp), %eax
  281053: 8b 40 1c                     	movl	28(%eax), %eax
  281056: 83 c8 20                     	orl	$32, %eax
  281059: 89 c2                        	movl	%eax, %edx
  28105b: 8b 45 f0                     	movl	-16(%ebp), %eax
  28105e: 89 50 1c                     	movl	%edx, 28(%eax)
  281061: 8b 45 f0                     	movl	-16(%ebp), %eax
  281064: c9                           	leave
  281065: c3                           	retl

00281066 close_constask:
  281066: 55                           	pushl	%ebp
  281067: 89 e5                        	movl	%esp, %ebp
  281069: 83 ec 18                     	subl	$24, %esp
  28106c: c7 45 f4 00 00 3c 00         	movl	$3932160, -12(%ebp)
  281073: 83 ec 0c                     	subl	$12, %esp
  281076: ff 75 08                     	pushl	8(%ebp)
  281079: e8 d0 30 00 00               	calll	12496 <task_sleep>
  28107e: 83 c4 10                     	addl	$16, %esp
  281081: 8b 45 08                     	movl	8(%ebp), %eax
  281084: 8b 80 ac 00 00 00            	movl	172(%eax), %eax
  28108a: 83 ec 04                     	subl	$4, %esp
  28108d: 68 00 00 01 00               	pushl	$65536
  281092: 50                           	pushl	%eax
  281093: ff 75 f4                     	pushl	-12(%ebp)
  281096: e8 e9 17 00 00               	calll	6121 <memman_free_4k>
  28109b: 83 c4 10                     	addl	$16, %esp
  28109e: 8b 45 08                     	movl	8(%ebp), %eax
  2810a1: 8b 40 10                     	movl	16(%eax), %eax
  2810a4: 83 ec 04                     	subl	$4, %esp
  2810a7: 68 00 02 00 00               	pushl	$512
  2810ac: 50                           	pushl	%eax
  2810ad: ff 75 f4                     	pushl	-12(%ebp)
  2810b0: e8 cf 17 00 00               	calll	6095 <memman_free_4k>
  2810b5: 83 c4 10                     	addl	$16, %esp
  2810b8: 8b 45 08                     	movl	8(%ebp), %eax
  2810bb: c7 40 04 00 00 00 00         	movl	$0, 4(%eax)
  2810c2: 90                           	nop
  2810c3: c9                           	leave
  2810c4: c3                           	retl

002810c5 close_console:
  2810c5: 55                           	pushl	%ebp
  2810c6: 89 e5                        	movl	%esp, %ebp
  2810c8: 83 ec 18                     	subl	$24, %esp
  2810cb: c7 45 f4 00 00 3c 00         	movl	$3932160, -12(%ebp)
  2810d2: 8b 45 08                     	movl	8(%ebp), %eax
  2810d5: 8b 40 24                     	movl	36(%eax), %eax
  2810d8: 89 45 f0                     	movl	%eax, -16(%ebp)
  2810db: 8b 45 08                     	movl	8(%ebp), %eax
  2810de: 8b 00                        	movl	(%eax), %eax
  2810e0: 83 ec 04                     	subl	$4, %esp
  2810e3: 68 00 a5 00 00               	pushl	$42240
  2810e8: 50                           	pushl	%eax
  2810e9: ff 75 f4                     	pushl	-12(%ebp)
  2810ec: e8 93 17 00 00               	calll	6035 <memman_free_4k>
  2810f1: 83 c4 10                     	addl	$16, %esp
  2810f4: 83 ec 0c                     	subl	$12, %esp
  2810f7: ff 75 08                     	pushl	8(%ebp)
  2810fa: e8 d0 26 00 00               	calll	9936 <sheet_free>
  2810ff: 83 c4 10                     	addl	$16, %esp
  281102: 83 ec 0c                     	subl	$12, %esp
  281105: ff 75 f0                     	pushl	-16(%ebp)
  281108: e8 59 ff ff ff               	calll	-167 <close_constask>
  28110d: 83 c4 10                     	addl	$16, %esp
  281110: 90                           	nop
  281111: c9                           	leave
  281112: c3                           	retl
  281113: 66 90                        	nop
  281115: 66 90                        	nop
  281117: 66 90                        	nop
  281119: 66 90                        	nop
  28111b: 66 90                        	nop
  28111d: 66 90                        	nop
  28111f: 90                           	nop

00281120 io_hlt:
  281120: f4                           	hlt
  281121: c3                           	retl

00281122 io_cli:
  281122: fa                           	cli
  281123: c3                           	retl

00281124 io_sti:
  281124: fb                           	sti
  281125: c3                           	retl

00281126 io_stihlt:
  281126: fb                           	sti
  281127: f4                           	hlt
  281128: c3                           	retl

00281129 io_in8:
  281129: 8b 54 24 04                  	movl	4(%esp), %edx
  28112d: b8 00 00 00 00               	movl	$0, %eax
  281132: ec                           	inb	%dx, %al
  281133: c3                           	retl

00281134 io_in16:
  281134: 8b 54 24 04                  	movl	4(%esp), %edx
  281138: b8 00 00 00 00               	movl	$0, %eax
  28113d: 66 ed                        	inw	%dx, %ax
  28113f: c3                           	retl

00281140 io_in32:
  281140: 8b 54 24 04                  	movl	4(%esp), %edx
  281144: ed                           	inl	%dx, %eax
  281145: c3                           	retl

00281146 io_out8:
  281146: 8b 54 24 04                  	movl	4(%esp), %edx
  28114a: 8a 44 24 08                  	movb	8(%esp), %al
  28114e: ee                           	outb	%al, %dx
  28114f: c3                           	retl

00281150 io_out16:
  281150: 8b 54 24 04                  	movl	4(%esp), %edx
  281154: 8b 44 24 08                  	movl	8(%esp), %eax
  281158: 66 ef                        	outw	%ax, %dx
  28115a: c3                           	retl

0028115b io_out32:
  28115b: 8b 54 24 04                  	movl	4(%esp), %edx
  28115f: 8b 44 24 08                  	movl	8(%esp), %eax
  281163: ef                           	outl	%eax, %dx
  281164: c3                           	retl

00281165 io_load_eflags:
  281165: 9c                           	pushfl
  281166: 58                           	popl	%eax
  281167: c3                           	retl

00281168 io_store_eflags:
  281168: 8b 44 24 04                  	movl	4(%esp), %eax
  28116c: 50                           	pushl	%eax
  28116d: 9d                           	popfl
  28116e: c3                           	retl

0028116f load_gdtr:
  28116f: 66 8b 44 24 04               	movw	4(%esp), %ax
  281174: 66 89 44 24 06               	movw	%ax, 6(%esp)
  281179: 0f 01 54 24 06               	lgdtl	6(%esp)
  28117e: c3                           	retl

0028117f load_idtr:
  28117f: 66 8b 44 24 04               	movw	4(%esp), %ax
  281184: 66 89 44 24 06               	movw	%ax, 6(%esp)
  281189: 0f 01 5c 24 06               	lidtl	6(%esp)
  28118e: c3                           	retl

0028118f load_cr0:
  28118f: 0f 20 c0                     	movl	%cr0, %eax
  281192: c3                           	retl

00281193 store_cr0:
  281193: 8b 44 24 04                  	movl	4(%esp), %eax
  281197: 0f 22 c0                     	movl	%eax, %cr0
  28119a: c3                           	retl

0028119b load_tr:
  28119b: 0f 00 5c 24 04               	ltrw	4(%esp)
  2811a0: c3                           	retl

002811a1 asm_inthandler20:
  2811a1: 06                           	pushl	%es
  2811a2: 1e                           	pushl	%ds
  2811a3: 60                           	pushal
  2811a4: 89 e0                        	movl	%esp, %eax
  2811a6: 50                           	pushl	%eax
  2811a7: 66 8c d0                     	movw	%ss, %ax
  2811aa: 8e d8                        	movl	%eax, %ds
  2811ac: 8e c0                        	movl	%eax, %es
  2811ae: e8 33 28 00 00               	calll	10291 <inthandler20>
  2811b3: 58                           	popl	%eax
  2811b4: 61                           	popal
  2811b5: 1f                           	popl	%ds
  2811b6: 07                           	popl	%es
  2811b7: cf                           	iretl

002811b8 asm_inthandler21:
  2811b8: 06                           	pushl	%es
  2811b9: 1e                           	pushl	%ds
  2811ba: 60                           	pushal
  2811bb: 89 e0                        	movl	%esp, %eax
  2811bd: 50                           	pushl	%eax
  2811be: 66 8c d0                     	movw	%ss, %ax
  2811c1: 8e d8                        	movl	%eax, %ds
  2811c3: 8e c0                        	movl	%eax, %es
  2811c5: e8 ae 0f 00 00               	calll	4014 <inthandler21>
  2811ca: 58                           	popl	%eax
  2811cb: 61                           	popal
  2811cc: 1f                           	popl	%ds
  2811cd: 07                           	popl	%es
  2811ce: cf                           	iretl

002811cf asm_inthandler2c:
  2811cf: 06                           	pushl	%es
  2811d0: 1e                           	pushl	%ds
  2811d1: 60                           	pushal
  2811d2: 89 e0                        	movl	%esp, %eax
  2811d4: 50                           	pushl	%eax
  2811d5: 66 8c d0                     	movw	%ss, %ax
  2811d8: 8e d8                        	movl	%eax, %ds
  2811da: 8e c0                        	movl	%eax, %es
  2811dc: e8 3d 10 00 00               	calll	4157 <inthandler2c>
  2811e1: 58                           	popl	%eax
  2811e2: 61                           	popal
  2811e3: 1f                           	popl	%ds
  2811e4: 07                           	popl	%es
  2811e5: cf                           	iretl

002811e6 asm_inthandler0c:
  2811e6: fb                           	sti
  2811e7: 06                           	pushl	%es
  2811e8: 1e                           	pushl	%ds
  2811e9: 60                           	pushal
  2811ea: 89 e0                        	movl	%esp, %eax
  2811ec: 50                           	pushl	%eax
  2811ed: 66 8c d0                     	movw	%ss, %ax
  2811f0: 8e d8                        	movl	%eax, %ds
  2811f2: 8e c0                        	movl	%eax, %es
  2811f4: e8 94 51 00 00               	calll	20884 <inthandler0c>
  2811f9: 83 f8 00                     	cmpl	$0, %eax
  2811fc: 0f 85 91 00 00 00            	jne	145 <asm_end_app>
  281202: 58                           	popl	%eax
  281203: 61                           	popal
  281204: 1f                           	popl	%ds
  281205: 07                           	popl	%es
  281206: 83 c4 04                     	addl	$4, %esp
  281209: cf                           	iretl

0028120a asm_inthandler0d:
  28120a: fb                           	sti
  28120b: 06                           	pushl	%es
  28120c: 1e                           	pushl	%ds
  28120d: 60                           	pushal
  28120e: 89 e0                        	movl	%esp, %eax
  281210: 50                           	pushl	%eax
  281211: 66 8c d0                     	movw	%ss, %ax
  281214: 8e d8                        	movl	%eax, %ds
  281216: 8e c0                        	movl	%eax, %es
  281218: e8 d4 51 00 00               	calll	20948 <inthandler0d>
  28121d: 83 f8 00                     	cmpl	$0, %eax
  281220: 75 71                        	jne	113 <asm_end_app>
  281222: 58                           	popl	%eax
  281223: 61                           	popal
  281224: 1f                           	popl	%ds
  281225: 07                           	popl	%es
  281226: 83 c4 04                     	addl	$4, %esp
  281229: cf                           	iretl

0028122a memtest_sub:
  28122a: 57                           	pushl	%edi
  28122b: 56                           	pushl	%esi
  28122c: 53                           	pushl	%ebx
  28122d: be 55 aa 55 aa               	movl	$2857740885, %esi
  281232: bf aa 55 aa 55               	movl	$1437226410, %edi
  281237: 8b 44 24 10                  	movl	16(%esp), %eax

0028123b mts_loop:
  28123b: 89 c3                        	movl	%eax, %ebx
  28123d: 81 c3 fc 0f 00 00            	addl	$4092, %ebx
  281243: 8b 13                        	movl	(%ebx), %edx
  281245: 89 33                        	movl	%esi, (%ebx)
  281247: 83 33 ff                     	xorl	$-1, (%ebx)
  28124a: 3b 3b                        	cmpl	(%ebx), %edi
  28124c: 75 18                        	jne	24 <mts_fin>
  28124e: 83 33 ff                     	xorl	$-1, (%ebx)
  281251: 3b 33                        	cmpl	(%ebx), %esi
  281253: 75 11                        	jne	17 <mts_fin>
  281255: 89 13                        	movl	%edx, (%ebx)
  281257: 05 00 10 00 00               	addl	$4096, %eax
  28125c: 3b 44 24 14                  	cmpl	20(%esp), %eax
  281260: 76 d9                        	jbe	-39 <mts_loop>
  281262: 5b                           	popl	%ebx
  281263: 5e                           	popl	%esi
  281264: 5f                           	popl	%edi
  281265: c3                           	retl

00281266 mts_fin:
  281266: 89 13                        	movl	%edx, (%ebx)
  281268: 5b                           	popl	%ebx
  281269: 5e                           	popl	%esi
  28126a: 5f                           	popl	%edi
  28126b: c3                           	retl

0028126c farjmp:
  28126c: ff 6c 24 04                  	ljmpl	*4(%esp)
  281270: c3                           	retl

00281271 farcall:
  281271: ff 5c 24 04                  	lcalll	*4(%esp)
  281275: c3                           	retl

00281276 asm_hrb_api:
  281276: fb                           	sti
  281277: 1e                           	pushl	%ds
  281278: 06                           	pushl	%es
  281279: 60                           	pushal
  28127a: 60                           	pushal
  28127b: 66 8c d0                     	movw	%ss, %ax
  28127e: 8e d8                        	movl	%eax, %ds
  281280: 8e c0                        	movl	%eax, %es
  281282: e8 f3 46 00 00               	calll	18163 <hrb_api>
  281287: 83 f8 00                     	cmpl	$0, %eax
  28128a: 75 07                        	jne	7 <asm_end_app>
  28128c: 83 c4 20                     	addl	$32, %esp
  28128f: 61                           	popal
  281290: 07                           	popl	%es
  281291: 1f                           	popl	%ds
  281292: cf                           	iretl

00281293 asm_end_app:
  281293: 8b 20                        	movl	(%eax), %esp
  281295: c7 40 04 00 00 00 00         	movl	$0, 4(%eax)
  28129c: 61                           	popal
  28129d: c3                           	retl

0028129e start_app:
  28129e: 60                           	pushal
  28129f: 8b 44 24 24                  	movl	36(%esp), %eax
  2812a3: 8b 4c 24 28                  	movl	40(%esp), %ecx
  2812a7: 8b 54 24 2c                  	movl	44(%esp), %edx
  2812ab: 8b 5c 24 30                  	movl	48(%esp), %ebx
  2812af: 8b 6c 24 34                  	movl	52(%esp), %ebp
  2812b3: 89 65 00                     	movl	%esp, (%ebp)
  2812b6: 8c 55 04                     	movw	%ss, 4(%ebp)
  2812b9: 8e c3                        	movl	%ebx, %es
  2812bb: 8e db                        	movl	%ebx, %ds
  2812bd: 8e e3                        	movl	%ebx, %fs
  2812bf: 8e eb                        	movl	%ebx, %gs
  2812c1: 83 c9 03                     	orl	$3, %ecx
  2812c4: 83 cb 03                     	orl	$3, %ebx
  2812c7: 53                           	pushl	%ebx
  2812c8: 52                           	pushl	%edx
  2812c9: 51                           	pushl	%ecx
  2812ca: 50                           	pushl	%eax
  2812cb: cb                           	lretl

002812cc init_palette:
  2812cc: 55                           	pushl	%ebp
  2812cd: 89 e5                        	movl	%esp, %ebp
  2812cf: 53                           	pushl	%ebx
  2812d0: 81 ec a4 02 00 00            	subl	$676, %esp
  2812d6: 83 ec 04                     	subl	$4, %esp
  2812d9: 68 40 11 31 00               	pushl	$3215680
  2812de: 6a 0f                        	pushl	$15
  2812e0: 6a 00                        	pushl	$0
  2812e2: e8 33 01 00 00               	calll	307 <set_palette>
  2812e7: 83 c4 10                     	addl	$16, %esp
  2812ea: c7 45 ec 00 00 00 00         	movl	$0, -20(%ebp)
  2812f1: e9 fb 00 00 00               	jmp	251 <init_palette+0x125>
  2812f6: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
  2812fd: e9 e1 00 00 00               	jmp	225 <init_palette+0x117>
  281302: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  281309: e9 c7 00 00 00               	jmp	199 <init_palette+0x109>
  28130e: 8b 45 f4                     	movl	-12(%ebp), %eax
  281311: 89 c3                        	movl	%eax, %ebx
  281313: 8b 55 f0                     	movl	-16(%ebp), %edx
  281316: 89 d0                        	movl	%edx, %eax
  281318: 01 c0                        	addl	%eax, %eax
  28131a: 01 d0                        	addl	%edx, %eax
  28131c: 01 c0                        	addl	%eax, %eax
  28131e: 89 c2                        	movl	%eax, %edx
  281320: 8b 45 f4                     	movl	-12(%ebp), %eax
  281323: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  281326: 8b 55 ec                     	movl	-20(%ebp), %edx
  281329: 89 d0                        	movl	%edx, %eax
  28132b: c1 e0 03                     	shll	$3, %eax
  28132e: 01 d0                        	addl	%edx, %eax
  281330: c1 e0 02                     	shll	$2, %eax
  281333: 8d 14 01                     	leal	(%ecx,%eax), %edx
  281336: 89 d0                        	movl	%edx, %eax
  281338: 01 c0                        	addl	%eax, %eax
  28133a: 01 c2                        	addl	%eax, %edx
  28133c: b9 33 00 00 00               	movl	$51, %ecx
  281341: 89 d8                        	movl	%ebx, %eax
  281343: 0f af c1                     	imull	%ecx, %eax
  281346: 88 84 15 64 fd ff ff         	movb	%al, -668(%ebp,%edx)
  28134d: 8b 45 f0                     	movl	-16(%ebp), %eax
  281350: 89 c3                        	movl	%eax, %ebx
  281352: 8b 55 f0                     	movl	-16(%ebp), %edx
  281355: 89 d0                        	movl	%edx, %eax
  281357: 01 c0                        	addl	%eax, %eax
  281359: 01 d0                        	addl	%edx, %eax
  28135b: 01 c0                        	addl	%eax, %eax
  28135d: 89 c2                        	movl	%eax, %edx
  28135f: 8b 45 f4                     	movl	-12(%ebp), %eax
  281362: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  281365: 8b 55 ec                     	movl	-20(%ebp), %edx
  281368: 89 d0                        	movl	%edx, %eax
  28136a: c1 e0 03                     	shll	$3, %eax
  28136d: 01 d0                        	addl	%edx, %eax
  28136f: c1 e0 02                     	shll	$2, %eax
  281372: 8d 14 01                     	leal	(%ecx,%eax), %edx
  281375: 89 d0                        	movl	%edx, %eax
  281377: 01 c0                        	addl	%eax, %eax
  281379: 01 d0                        	addl	%edx, %eax
  28137b: 8d 50 01                     	leal	1(%eax), %edx
  28137e: b9 33 00 00 00               	movl	$51, %ecx
  281383: 89 d8                        	movl	%ebx, %eax
  281385: 0f af c1                     	imull	%ecx, %eax
  281388: 88 84 15 64 fd ff ff         	movb	%al, -668(%ebp,%edx)
  28138f: 8b 45 ec                     	movl	-20(%ebp), %eax
  281392: 89 c3                        	movl	%eax, %ebx
  281394: 8b 55 f0                     	movl	-16(%ebp), %edx
  281397: 89 d0                        	movl	%edx, %eax
  281399: 01 c0                        	addl	%eax, %eax
  28139b: 01 d0                        	addl	%edx, %eax
  28139d: 01 c0                        	addl	%eax, %eax
  28139f: 89 c2                        	movl	%eax, %edx
  2813a1: 8b 45 f4                     	movl	-12(%ebp), %eax
  2813a4: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  2813a7: 8b 55 ec                     	movl	-20(%ebp), %edx
  2813aa: 89 d0                        	movl	%edx, %eax
  2813ac: c1 e0 03                     	shll	$3, %eax
  2813af: 01 d0                        	addl	%edx, %eax
  2813b1: c1 e0 02                     	shll	$2, %eax
  2813b4: 8d 14 01                     	leal	(%ecx,%eax), %edx
  2813b7: 89 d0                        	movl	%edx, %eax
  2813b9: 01 c0                        	addl	%eax, %eax
  2813bb: 01 d0                        	addl	%edx, %eax
  2813bd: 8d 50 02                     	leal	2(%eax), %edx
  2813c0: b9 33 00 00 00               	movl	$51, %ecx
  2813c5: 89 d8                        	movl	%ebx, %eax
  2813c7: 0f af c1                     	imull	%ecx, %eax
  2813ca: 88 84 15 64 fd ff ff         	movb	%al, -668(%ebp,%edx)
  2813d1: 83 45 f4 01                  	addl	$1, -12(%ebp)
  2813d5: 83 7d f4 05                  	cmpl	$5, -12(%ebp)
  2813d9: 0f 8e 2f ff ff ff            	jle	-209 <init_palette+0x42>
  2813df: 83 45 f0 01                  	addl	$1, -16(%ebp)
  2813e3: 83 7d f0 05                  	cmpl	$5, -16(%ebp)
  2813e7: 0f 8e 15 ff ff ff            	jle	-235 <init_palette+0x36>
  2813ed: 83 45 ec 01                  	addl	$1, -20(%ebp)
  2813f1: 83 7d ec 05                  	cmpl	$5, -20(%ebp)
  2813f5: 0f 8e fb fe ff ff            	jle	-261 <init_palette+0x2a>
  2813fb: 83 ec 04                     	subl	$4, %esp
  2813fe: 8d 85 64 fd ff ff            	leal	-668(%ebp), %eax
  281404: 50                           	pushl	%eax
  281405: 68 e7 00 00 00               	pushl	$231
  28140a: 6a 10                        	pushl	$16
  28140c: e8 09 00 00 00               	calll	9 <set_palette>
  281411: 83 c4 10                     	addl	$16, %esp
  281414: 90                           	nop
  281415: 8b 5d fc                     	movl	-4(%ebp), %ebx
  281418: c9                           	leave
  281419: c3                           	retl

0028141a set_palette:
  28141a: 55                           	pushl	%ebp
  28141b: 89 e5                        	movl	%esp, %ebp
  28141d: 83 ec 18                     	subl	$24, %esp
  281420: e8 40 fd ff ff               	calll	-704 <io_load_eflags>
  281425: 89 45 f0                     	movl	%eax, -16(%ebp)
  281428: e8 f5 fc ff ff               	calll	-779 <io_cli>
  28142d: 83 ec 08                     	subl	$8, %esp
  281430: ff 75 08                     	pushl	8(%ebp)
  281433: 68 c8 03 00 00               	pushl	$968
  281438: e8 09 fd ff ff               	calll	-759 <io_out8>
  28143d: 83 c4 10                     	addl	$16, %esp
  281440: 8b 45 08                     	movl	8(%ebp), %eax
  281443: 89 45 f4                     	movl	%eax, -12(%ebp)
  281446: eb 65                        	jmp	101 <set_palette+0x93>
  281448: 8b 45 10                     	movl	16(%ebp), %eax
  28144b: 0f b6 00                     	movzbl	(%eax), %eax
  28144e: c0 e8 02                     	shrb	$2, %al
  281451: 0f b6 c0                     	movzbl	%al, %eax
  281454: 83 ec 08                     	subl	$8, %esp
  281457: 50                           	pushl	%eax
  281458: 68 c9 03 00 00               	pushl	$969
  28145d: e8 e4 fc ff ff               	calll	-796 <io_out8>
  281462: 83 c4 10                     	addl	$16, %esp
  281465: 8b 45 10                     	movl	16(%ebp), %eax
  281468: 83 c0 01                     	addl	$1, %eax
  28146b: 0f b6 00                     	movzbl	(%eax), %eax
  28146e: c0 e8 02                     	shrb	$2, %al
  281471: 0f b6 c0                     	movzbl	%al, %eax
  281474: 83 ec 08                     	subl	$8, %esp
  281477: 50                           	pushl	%eax
  281478: 68 c9 03 00 00               	pushl	$969
  28147d: e8 c4 fc ff ff               	calll	-828 <io_out8>
  281482: 83 c4 10                     	addl	$16, %esp
  281485: 8b 45 10                     	movl	16(%ebp), %eax
  281488: 83 c0 02                     	addl	$2, %eax
  28148b: 0f b6 00                     	movzbl	(%eax), %eax
  28148e: c0 e8 02                     	shrb	$2, %al
  281491: 0f b6 c0                     	movzbl	%al, %eax
  281494: 83 ec 08                     	subl	$8, %esp
  281497: 50                           	pushl	%eax
  281498: 68 c9 03 00 00               	pushl	$969
  28149d: e8 a4 fc ff ff               	calll	-860 <io_out8>
  2814a2: 83 c4 10                     	addl	$16, %esp
  2814a5: 83 45 10 03                  	addl	$3, 16(%ebp)
  2814a9: 83 45 f4 01                  	addl	$1, -12(%ebp)
  2814ad: 8b 45 f4                     	movl	-12(%ebp), %eax
  2814b0: 3b 45 0c                     	cmpl	12(%ebp), %eax
  2814b3: 7e 93                        	jle	-109 <set_palette+0x2e>
  2814b5: 83 ec 0c                     	subl	$12, %esp
  2814b8: ff 75 f0                     	pushl	-16(%ebp)
  2814bb: e8 a8 fc ff ff               	calll	-856 <io_store_eflags>
  2814c0: 83 c4 10                     	addl	$16, %esp
  2814c3: 90                           	nop
  2814c4: c9                           	leave
  2814c5: c3                           	retl

002814c6 boxfill8:
  2814c6: 55                           	pushl	%ebp
  2814c7: 89 e5                        	movl	%esp, %ebp
  2814c9: 83 ec 14                     	subl	$20, %esp
  2814cc: 8b 45 10                     	movl	16(%ebp), %eax
  2814cf: 88 45 ec                     	movb	%al, -20(%ebp)
  2814d2: 8b 45 18                     	movl	24(%ebp), %eax
  2814d5: 89 45 f8                     	movl	%eax, -8(%ebp)
  2814d8: eb 33                        	jmp	51 <boxfill8+0x47>
  2814da: 8b 45 14                     	movl	20(%ebp), %eax
  2814dd: 89 45 fc                     	movl	%eax, -4(%ebp)
  2814e0: eb 1f                        	jmp	31 <boxfill8+0x3b>
  2814e2: 8b 45 f8                     	movl	-8(%ebp), %eax
  2814e5: 0f af 45 0c                  	imull	12(%ebp), %eax
  2814e9: 89 c2                        	movl	%eax, %edx
  2814eb: 8b 45 fc                     	movl	-4(%ebp), %eax
  2814ee: 01 d0                        	addl	%edx, %eax
  2814f0: 89 c2                        	movl	%eax, %edx
  2814f2: 8b 45 08                     	movl	8(%ebp), %eax
  2814f5: 01 c2                        	addl	%eax, %edx
  2814f7: 0f b6 45 ec                  	movzbl	-20(%ebp), %eax
  2814fb: 88 02                        	movb	%al, (%edx)
  2814fd: 83 45 fc 01                  	addl	$1, -4(%ebp)
  281501: 8b 45 fc                     	movl	-4(%ebp), %eax
  281504: 3b 45 1c                     	cmpl	28(%ebp), %eax
  281507: 7e d9                        	jle	-39 <boxfill8+0x1c>
  281509: 83 45 f8 01                  	addl	$1, -8(%ebp)
  28150d: 8b 45 f8                     	movl	-8(%ebp), %eax
  281510: 3b 45 20                     	cmpl	32(%ebp), %eax
  281513: 7e c5                        	jle	-59 <boxfill8+0x14>
  281515: 90                           	nop
  281516: c9                           	leave
  281517: c3                           	retl

00281518 init_screen8:
  281518: 55                           	pushl	%ebp
  281519: 89 e5                        	movl	%esp, %ebp
  28151b: 53                           	pushl	%ebx
  28151c: 8b 45 10                     	movl	16(%ebp), %eax
  28151f: 8d 50 e3                     	leal	-29(%eax), %edx
  281522: 8b 45 0c                     	movl	12(%ebp), %eax
  281525: 83 e8 01                     	subl	$1, %eax
  281528: 52                           	pushl	%edx
  281529: 50                           	pushl	%eax
  28152a: 6a 00                        	pushl	$0
  28152c: 6a 00                        	pushl	$0
  28152e: 6a 0e                        	pushl	$14
  281530: ff 75 0c                     	pushl	12(%ebp)
  281533: ff 75 08                     	pushl	8(%ebp)
  281536: e8 8b ff ff ff               	calll	-117 <boxfill8>
  28153b: 83 c4 1c                     	addl	$28, %esp
  28153e: 8b 45 10                     	movl	16(%ebp), %eax
  281541: 8d 48 e4                     	leal	-28(%eax), %ecx
  281544: 8b 45 0c                     	movl	12(%ebp), %eax
  281547: 8d 50 ff                     	leal	-1(%eax), %edx
  28154a: 8b 45 10                     	movl	16(%ebp), %eax
  28154d: 83 e8 1c                     	subl	$28, %eax
  281550: 51                           	pushl	%ecx
  281551: 52                           	pushl	%edx
  281552: 50                           	pushl	%eax
  281553: 6a 00                        	pushl	$0
  281555: 6a 08                        	pushl	$8
  281557: ff 75 0c                     	pushl	12(%ebp)
  28155a: ff 75 08                     	pushl	8(%ebp)
  28155d: e8 64 ff ff ff               	calll	-156 <boxfill8>
  281562: 83 c4 1c                     	addl	$28, %esp
  281565: 8b 45 10                     	movl	16(%ebp), %eax
  281568: 8d 48 e5                     	leal	-27(%eax), %ecx
  28156b: 8b 45 0c                     	movl	12(%ebp), %eax
  28156e: 8d 50 ff                     	leal	-1(%eax), %edx
  281571: 8b 45 10                     	movl	16(%ebp), %eax
  281574: 83 e8 1b                     	subl	$27, %eax
  281577: 51                           	pushl	%ecx
  281578: 52                           	pushl	%edx
  281579: 50                           	pushl	%eax
  28157a: 6a 00                        	pushl	$0
  28157c: 6a 07                        	pushl	$7
  28157e: ff 75 0c                     	pushl	12(%ebp)
  281581: ff 75 08                     	pushl	8(%ebp)
  281584: e8 3d ff ff ff               	calll	-195 <boxfill8>
  281589: 83 c4 1c                     	addl	$28, %esp
  28158c: 8b 45 10                     	movl	16(%ebp), %eax
  28158f: 8d 48 ff                     	leal	-1(%eax), %ecx
  281592: 8b 45 0c                     	movl	12(%ebp), %eax
  281595: 8d 50 ff                     	leal	-1(%eax), %edx
  281598: 8b 45 10                     	movl	16(%ebp), %eax
  28159b: 83 e8 1a                     	subl	$26, %eax
  28159e: 51                           	pushl	%ecx
  28159f: 52                           	pushl	%edx
  2815a0: 50                           	pushl	%eax
  2815a1: 6a 00                        	pushl	$0
  2815a3: 6a 08                        	pushl	$8
  2815a5: ff 75 0c                     	pushl	12(%ebp)
  2815a8: ff 75 08                     	pushl	8(%ebp)
  2815ab: e8 16 ff ff ff               	calll	-234 <boxfill8>
  2815b0: 83 c4 1c                     	addl	$28, %esp
  2815b3: 8b 45 10                     	movl	16(%ebp), %eax
  2815b6: 8d 50 e8                     	leal	-24(%eax), %edx
  2815b9: 8b 45 10                     	movl	16(%ebp), %eax
  2815bc: 83 e8 18                     	subl	$24, %eax
  2815bf: 52                           	pushl	%edx
  2815c0: 6a 3b                        	pushl	$59
  2815c2: 50                           	pushl	%eax
  2815c3: 6a 03                        	pushl	$3
  2815c5: 6a 07                        	pushl	$7
  2815c7: ff 75 0c                     	pushl	12(%ebp)
  2815ca: ff 75 08                     	pushl	8(%ebp)
  2815cd: e8 f4 fe ff ff               	calll	-268 <boxfill8>
  2815d2: 83 c4 1c                     	addl	$28, %esp
  2815d5: 8b 45 10                     	movl	16(%ebp), %eax
  2815d8: 8d 50 fc                     	leal	-4(%eax), %edx
  2815db: 8b 45 10                     	movl	16(%ebp), %eax
  2815de: 83 e8 18                     	subl	$24, %eax
  2815e1: 52                           	pushl	%edx
  2815e2: 6a 02                        	pushl	$2
  2815e4: 50                           	pushl	%eax
  2815e5: 6a 02                        	pushl	$2
  2815e7: 6a 07                        	pushl	$7
  2815e9: ff 75 0c                     	pushl	12(%ebp)
  2815ec: ff 75 08                     	pushl	8(%ebp)
  2815ef: e8 d2 fe ff ff               	calll	-302 <boxfill8>
  2815f4: 83 c4 1c                     	addl	$28, %esp
  2815f7: 8b 45 10                     	movl	16(%ebp), %eax
  2815fa: 8d 50 fc                     	leal	-4(%eax), %edx
  2815fd: 8b 45 10                     	movl	16(%ebp), %eax
  281600: 83 e8 04                     	subl	$4, %eax
  281603: 52                           	pushl	%edx
  281604: 6a 3b                        	pushl	$59
  281606: 50                           	pushl	%eax
  281607: 6a 03                        	pushl	$3
  281609: 6a 0f                        	pushl	$15
  28160b: ff 75 0c                     	pushl	12(%ebp)
  28160e: ff 75 08                     	pushl	8(%ebp)
  281611: e8 b0 fe ff ff               	calll	-336 <boxfill8>
  281616: 83 c4 1c                     	addl	$28, %esp
  281619: 8b 45 10                     	movl	16(%ebp), %eax
  28161c: 8d 50 fb                     	leal	-5(%eax), %edx
  28161f: 8b 45 10                     	movl	16(%ebp), %eax
  281622: 83 e8 17                     	subl	$23, %eax
  281625: 52                           	pushl	%edx
  281626: 6a 3b                        	pushl	$59
  281628: 50                           	pushl	%eax
  281629: 6a 3b                        	pushl	$59
  28162b: 6a 0f                        	pushl	$15
  28162d: ff 75 0c                     	pushl	12(%ebp)
  281630: ff 75 08                     	pushl	8(%ebp)
  281633: e8 8e fe ff ff               	calll	-370 <boxfill8>
  281638: 83 c4 1c                     	addl	$28, %esp
  28163b: 8b 45 10                     	movl	16(%ebp), %eax
  28163e: 8d 50 fd                     	leal	-3(%eax), %edx
  281641: 8b 45 10                     	movl	16(%ebp), %eax
  281644: 83 e8 03                     	subl	$3, %eax
  281647: 52                           	pushl	%edx
  281648: 6a 3b                        	pushl	$59
  28164a: 50                           	pushl	%eax
  28164b: 6a 02                        	pushl	$2
  28164d: 6a 00                        	pushl	$0
  28164f: ff 75 0c                     	pushl	12(%ebp)
  281652: ff 75 08                     	pushl	8(%ebp)
  281655: e8 6c fe ff ff               	calll	-404 <boxfill8>
  28165a: 83 c4 1c                     	addl	$28, %esp
  28165d: 8b 45 10                     	movl	16(%ebp), %eax
  281660: 8d 50 fd                     	leal	-3(%eax), %edx
  281663: 8b 45 10                     	movl	16(%ebp), %eax
  281666: 83 e8 18                     	subl	$24, %eax
  281669: 52                           	pushl	%edx
  28166a: 6a 3c                        	pushl	$60
  28166c: 50                           	pushl	%eax
  28166d: 6a 3c                        	pushl	$60
  28166f: 6a 00                        	pushl	$0
  281671: ff 75 0c                     	pushl	12(%ebp)
  281674: ff 75 08                     	pushl	8(%ebp)
  281677: e8 4a fe ff ff               	calll	-438 <boxfill8>
  28167c: 83 c4 1c                     	addl	$28, %esp
  28167f: 8b 45 10                     	movl	16(%ebp), %eax
  281682: 8d 58 e8                     	leal	-24(%eax), %ebx
  281685: 8b 45 0c                     	movl	12(%ebp), %eax
  281688: 8d 48 fc                     	leal	-4(%eax), %ecx
  28168b: 8b 45 10                     	movl	16(%ebp), %eax
  28168e: 8d 50 e8                     	leal	-24(%eax), %edx
  281691: 8b 45 0c                     	movl	12(%ebp), %eax
  281694: 83 e8 2f                     	subl	$47, %eax
  281697: 53                           	pushl	%ebx
  281698: 51                           	pushl	%ecx
  281699: 52                           	pushl	%edx
  28169a: 50                           	pushl	%eax
  28169b: 6a 0f                        	pushl	$15
  28169d: ff 75 0c                     	pushl	12(%ebp)
  2816a0: ff 75 08                     	pushl	8(%ebp)
  2816a3: e8 1e fe ff ff               	calll	-482 <boxfill8>
  2816a8: 83 c4 1c                     	addl	$28, %esp
  2816ab: 8b 45 10                     	movl	16(%ebp), %eax
  2816ae: 8d 58 fc                     	leal	-4(%eax), %ebx
  2816b1: 8b 45 0c                     	movl	12(%ebp), %eax
  2816b4: 8d 48 d1                     	leal	-47(%eax), %ecx
  2816b7: 8b 45 10                     	movl	16(%ebp), %eax
  2816ba: 8d 50 e9                     	leal	-23(%eax), %edx
  2816bd: 8b 45 0c                     	movl	12(%ebp), %eax
  2816c0: 83 e8 2f                     	subl	$47, %eax
  2816c3: 53                           	pushl	%ebx
  2816c4: 51                           	pushl	%ecx
  2816c5: 52                           	pushl	%edx
  2816c6: 50                           	pushl	%eax
  2816c7: 6a 0f                        	pushl	$15
  2816c9: ff 75 0c                     	pushl	12(%ebp)
  2816cc: ff 75 08                     	pushl	8(%ebp)
  2816cf: e8 f2 fd ff ff               	calll	-526 <boxfill8>
  2816d4: 83 c4 1c                     	addl	$28, %esp
  2816d7: 8b 45 10                     	movl	16(%ebp), %eax
  2816da: 8d 58 fd                     	leal	-3(%eax), %ebx
  2816dd: 8b 45 0c                     	movl	12(%ebp), %eax
  2816e0: 8d 48 fc                     	leal	-4(%eax), %ecx
  2816e3: 8b 45 10                     	movl	16(%ebp), %eax
  2816e6: 8d 50 fd                     	leal	-3(%eax), %edx
  2816e9: 8b 45 0c                     	movl	12(%ebp), %eax
  2816ec: 83 e8 2f                     	subl	$47, %eax
  2816ef: 53                           	pushl	%ebx
  2816f0: 51                           	pushl	%ecx
  2816f1: 52                           	pushl	%edx
  2816f2: 50                           	pushl	%eax
  2816f3: 6a 07                        	pushl	$7
  2816f5: ff 75 0c                     	pushl	12(%ebp)
  2816f8: ff 75 08                     	pushl	8(%ebp)
  2816fb: e8 c6 fd ff ff               	calll	-570 <boxfill8>
  281700: 83 c4 1c                     	addl	$28, %esp
  281703: 8b 45 10                     	movl	16(%ebp), %eax
  281706: 8d 58 fd                     	leal	-3(%eax), %ebx
  281709: 8b 45 0c                     	movl	12(%ebp), %eax
  28170c: 8d 48 fd                     	leal	-3(%eax), %ecx
  28170f: 8b 45 10                     	movl	16(%ebp), %eax
  281712: 8d 50 e8                     	leal	-24(%eax), %edx
  281715: 8b 45 0c                     	movl	12(%ebp), %eax
  281718: 83 e8 03                     	subl	$3, %eax
  28171b: 53                           	pushl	%ebx
  28171c: 51                           	pushl	%ecx
  28171d: 52                           	pushl	%edx
  28171e: 50                           	pushl	%eax
  28171f: 6a 07                        	pushl	$7
  281721: ff 75 0c                     	pushl	12(%ebp)
  281724: ff 75 08                     	pushl	8(%ebp)
  281727: e8 9a fd ff ff               	calll	-614 <boxfill8>
  28172c: 83 c4 1c                     	addl	$28, %esp
  28172f: 90                           	nop
  281730: 8b 5d fc                     	movl	-4(%ebp), %ebx
  281733: c9                           	leave
  281734: c3                           	retl

00281735 putfont8:
  281735: 55                           	pushl	%ebp
  281736: 89 e5                        	movl	%esp, %ebp
  281738: 83 ec 14                     	subl	$20, %esp
  28173b: 8b 45 18                     	movl	24(%ebp), %eax
  28173e: 88 45 ec                     	movb	%al, -20(%ebp)
  281741: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  281748: e9 dd 00 00 00               	jmp	221 <putfont8+0xf5>
  28174d: 8b 55 14                     	movl	20(%ebp), %edx
  281750: 8b 45 fc                     	movl	-4(%ebp), %eax
  281753: 01 d0                        	addl	%edx, %eax
  281755: 0f af 45 0c                  	imull	12(%ebp), %eax
  281759: 89 c2                        	movl	%eax, %edx
  28175b: 8b 45 10                     	movl	16(%ebp), %eax
  28175e: 01 c2                        	addl	%eax, %edx
  281760: 8b 45 08                     	movl	8(%ebp), %eax
  281763: 01 d0                        	addl	%edx, %eax
  281765: 89 45 f8                     	movl	%eax, -8(%ebp)
  281768: 8b 55 fc                     	movl	-4(%ebp), %edx
  28176b: 8b 45 1c                     	movl	28(%ebp), %eax
  28176e: 01 d0                        	addl	%edx, %eax
  281770: 0f b6 00                     	movzbl	(%eax), %eax
  281773: 88 45 f7                     	movb	%al, -9(%ebp)
  281776: 80 7d f7 00                  	cmpb	$0, -9(%ebp)
  28177a: 79 09                        	jns	9 <putfont8+0x50>
  28177c: 8b 45 f8                     	movl	-8(%ebp), %eax
  28177f: 0f b6 55 ec                  	movzbl	-20(%ebp), %edx
  281783: 88 10                        	movb	%dl, (%eax)
  281785: 0f be 45 f7                  	movsbl	-9(%ebp), %eax
  281789: 83 e0 40                     	andl	$64, %eax
  28178c: 85 c0                        	testl	%eax, %eax
  28178e: 74 0c                        	je	12 <putfont8+0x67>
  281790: 8b 45 f8                     	movl	-8(%ebp), %eax
  281793: 8d 50 01                     	leal	1(%eax), %edx
  281796: 0f b6 45 ec                  	movzbl	-20(%ebp), %eax
  28179a: 88 02                        	movb	%al, (%edx)
  28179c: 0f be 45 f7                  	movsbl	-9(%ebp), %eax
  2817a0: 83 e0 20                     	andl	$32, %eax
  2817a3: 85 c0                        	testl	%eax, %eax
  2817a5: 74 0c                        	je	12 <putfont8+0x7e>
  2817a7: 8b 45 f8                     	movl	-8(%ebp), %eax
  2817aa: 8d 50 02                     	leal	2(%eax), %edx
  2817ad: 0f b6 45 ec                  	movzbl	-20(%ebp), %eax
  2817b1: 88 02                        	movb	%al, (%edx)
  2817b3: 0f be 45 f7                  	movsbl	-9(%ebp), %eax
  2817b7: 83 e0 10                     	andl	$16, %eax
  2817ba: 85 c0                        	testl	%eax, %eax
  2817bc: 74 0c                        	je	12 <putfont8+0x95>
  2817be: 8b 45 f8                     	movl	-8(%ebp), %eax
  2817c1: 8d 50 03                     	leal	3(%eax), %edx
  2817c4: 0f b6 45 ec                  	movzbl	-20(%ebp), %eax
  2817c8: 88 02                        	movb	%al, (%edx)
  2817ca: 0f be 45 f7                  	movsbl	-9(%ebp), %eax
  2817ce: 83 e0 08                     	andl	$8, %eax
  2817d1: 85 c0                        	testl	%eax, %eax
  2817d3: 74 0c                        	je	12 <putfont8+0xac>
  2817d5: 8b 45 f8                     	movl	-8(%ebp), %eax
  2817d8: 8d 50 04                     	leal	4(%eax), %edx
  2817db: 0f b6 45 ec                  	movzbl	-20(%ebp), %eax
  2817df: 88 02                        	movb	%al, (%edx)
  2817e1: 0f be 45 f7                  	movsbl	-9(%ebp), %eax
  2817e5: 83 e0 04                     	andl	$4, %eax
  2817e8: 85 c0                        	testl	%eax, %eax
  2817ea: 74 0c                        	je	12 <putfont8+0xc3>
  2817ec: 8b 45 f8                     	movl	-8(%ebp), %eax
  2817ef: 8d 50 05                     	leal	5(%eax), %edx
  2817f2: 0f b6 45 ec                  	movzbl	-20(%ebp), %eax
  2817f6: 88 02                        	movb	%al, (%edx)
  2817f8: 0f be 45 f7                  	movsbl	-9(%ebp), %eax
  2817fc: 83 e0 02                     	andl	$2, %eax
  2817ff: 85 c0                        	testl	%eax, %eax
  281801: 74 0c                        	je	12 <putfont8+0xda>
  281803: 8b 45 f8                     	movl	-8(%ebp), %eax
  281806: 8d 50 06                     	leal	6(%eax), %edx
  281809: 0f b6 45 ec                  	movzbl	-20(%ebp), %eax
  28180d: 88 02                        	movb	%al, (%edx)
  28180f: 0f be 45 f7                  	movsbl	-9(%ebp), %eax
  281813: 83 e0 01                     	andl	$1, %eax
  281816: 85 c0                        	testl	%eax, %eax
  281818: 74 0c                        	je	12 <putfont8+0xf1>
  28181a: 8b 45 f8                     	movl	-8(%ebp), %eax
  28181d: 8d 50 07                     	leal	7(%eax), %edx
  281820: 0f b6 45 ec                  	movzbl	-20(%ebp), %eax
  281824: 88 02                        	movb	%al, (%edx)
  281826: 83 45 fc 01                  	addl	$1, -4(%ebp)
  28182a: 83 7d fc 0f                  	cmpl	$15, -4(%ebp)
  28182e: 0f 8e 19 ff ff ff            	jle	-231 <putfont8+0x18>
  281834: 90                           	nop
  281835: c9                           	leave
  281836: c3                           	retl

00281837 putfonts8_asc:
  281837: 55                           	pushl	%ebp
  281838: 89 e5                        	movl	%esp, %ebp
  28183a: 83 ec 38                     	subl	$56, %esp
  28183d: 8b 45 18                     	movl	24(%ebp), %eax
  281840: 88 45 d4                     	movb	%al, -44(%ebp)
  281843: e8 78 23 00 00               	calll	9080 <task_now>
  281848: 89 45 ec                     	movl	%eax, -20(%ebp)
  28184b: b8 e8 0f 00 00               	movl	$4072, %eax
  281850: 8b 00                        	movl	(%eax), %eax
  281852: 89 45 e8                     	movl	%eax, -24(%ebp)
  281855: 8b 45 ec                     	movl	-20(%ebp), %eax
  281858: 0f b6 80 bc 00 00 00         	movzbl	188(%eax), %eax
  28185f: 84 c0                        	testb	%al, %al
  281861: 75 43                        	jne	67 <putfonts8_asc+0x6f>
  281863: eb 37                        	jmp	55 <putfonts8_asc+0x65>
  281865: 8b 45 1c                     	movl	28(%ebp), %eax
  281868: 0f b6 00                     	movzbl	(%eax), %eax
  28186b: 0f b6 c0                     	movzbl	%al, %eax
  28186e: c1 e0 04                     	shll	$4, %eax
  281871: 8d 90 00 00 31 00            	leal	3211264(%eax), %edx
  281877: 0f be 45 d4                  	movsbl	-44(%ebp), %eax
  28187b: 83 ec 08                     	subl	$8, %esp
  28187e: 52                           	pushl	%edx
  28187f: 50                           	pushl	%eax
  281880: ff 75 14                     	pushl	20(%ebp)
  281883: ff 75 10                     	pushl	16(%ebp)
  281886: ff 75 0c                     	pushl	12(%ebp)
  281889: ff 75 08                     	pushl	8(%ebp)
  28188c: e8 a4 fe ff ff               	calll	-348 <putfont8>
  281891: 83 c4 20                     	addl	$32, %esp
  281894: 83 45 10 08                  	addl	$8, 16(%ebp)
  281898: 83 45 1c 01                  	addl	$1, 28(%ebp)
  28189c: 8b 45 1c                     	movl	28(%ebp), %eax
  28189f: 0f b6 00                     	movzbl	(%eax), %eax
  2818a2: 84 c0                        	testb	%al, %al
  2818a4: 75 bf                        	jne	-65 <putfonts8_asc+0x2e>
  2818a6: 8b 45 ec                     	movl	-20(%ebp), %eax
  2818a9: 0f b6 80 bc 00 00 00         	movzbl	188(%eax), %eax
  2818b0: 3c 01                        	cmpb	$1, %al
  2818b2: 0f 85 b1 01 00 00            	jne	433 <putfonts8_asc+0x232>
  2818b8: e9 9e 01 00 00               	jmp	414 <putfonts8_asc+0x224>
  2818bd: 8b 45 ec                     	movl	-20(%ebp), %eax
  2818c0: 0f b6 80 bd 00 00 00         	movzbl	189(%eax), %eax
  2818c7: 84 c0                        	testb	%al, %al
  2818c9: 75 71                        	jne	113 <putfonts8_asc+0x105>
  2818cb: 8b 45 1c                     	movl	28(%ebp), %eax
  2818ce: 0f b6 00                     	movzbl	(%eax), %eax
  2818d1: 3c 80                        	cmpb	$-128, %al
  2818d3: 76 0a                        	jbe	10 <putfonts8_asc+0xa8>
  2818d5: 8b 45 1c                     	movl	28(%ebp), %eax
  2818d8: 0f b6 00                     	movzbl	(%eax), %eax
  2818db: 3c 9f                        	cmpb	$-97, %al
  2818dd: 76 14                        	jbe	20 <putfonts8_asc+0xbc>
  2818df: 8b 45 1c                     	movl	28(%ebp), %eax
  2818e2: 0f b6 00                     	movzbl	(%eax), %eax
  2818e5: 3c df                        	cmpb	$-33, %al
  2818e7: 76 1e                        	jbe	30 <putfonts8_asc+0xd0>
  2818e9: 8b 45 1c                     	movl	28(%ebp), %eax
  2818ec: 0f b6 00                     	movzbl	(%eax), %eax
  2818ef: 3c fc                        	cmpb	$-4, %al
  2818f1: 77 14                        	ja	20 <putfonts8_asc+0xd0>
  2818f3: 8b 45 1c                     	movl	28(%ebp), %eax
  2818f6: 0f b6 10                     	movzbl	(%eax), %edx
  2818f9: 8b 45 ec                     	movl	-20(%ebp), %eax
  2818fc: 88 90 bd 00 00 00            	movb	%dl, 189(%eax)
  281902: e9 4c 01 00 00               	jmp	332 <putfonts8_asc+0x21c>
  281907: 8b 45 1c                     	movl	28(%ebp), %eax
  28190a: 0f b6 00                     	movzbl	(%eax), %eax
  28190d: 0f b6 c0                     	movzbl	%al, %eax
  281910: c1 e0 04                     	shll	$4, %eax
  281913: 89 c2                        	movl	%eax, %edx
  281915: 8b 45 e8                     	movl	-24(%ebp), %eax
  281918: 01 c2                        	addl	%eax, %edx
  28191a: 0f be 45 d4                  	movsbl	-44(%ebp), %eax
  28191e: 83 ec 08                     	subl	$8, %esp
  281921: 52                           	pushl	%edx
  281922: 50                           	pushl	%eax
  281923: ff 75 14                     	pushl	20(%ebp)
  281926: ff 75 10                     	pushl	16(%ebp)
  281929: ff 75 0c                     	pushl	12(%ebp)
  28192c: ff 75 08                     	pushl	8(%ebp)
  28192f: e8 01 fe ff ff               	calll	-511 <putfont8>
  281934: 83 c4 20                     	addl	$32, %esp
  281937: e9 17 01 00 00               	jmp	279 <putfonts8_asc+0x21c>
  28193c: 8b 45 ec                     	movl	-20(%ebp), %eax
  28193f: 0f b6 80 bd 00 00 00         	movzbl	189(%eax), %eax
  281946: 3c 80                        	cmpb	$-128, %al
  281948: 76 27                        	jbe	39 <putfonts8_asc+0x13a>
  28194a: 8b 45 ec                     	movl	-20(%ebp), %eax
  28194d: 0f b6 80 bd 00 00 00         	movzbl	189(%eax), %eax
  281954: 3c 9f                        	cmpb	$-97, %al
  281956: 77 19                        	ja	25 <putfonts8_asc+0x13a>
  281958: 8b 45 ec                     	movl	-20(%ebp), %eax
  28195b: 0f b6 80 bd 00 00 00         	movzbl	189(%eax), %eax
  281962: 0f b6 c0                     	movzbl	%al, %eax
  281965: 2d 81 00 00 00               	subl	$129, %eax
  28196a: 01 c0                        	addl	%eax, %eax
  28196c: 89 45 f4                     	movl	%eax, -12(%ebp)
  28196f: eb 17                        	jmp	23 <putfonts8_asc+0x151>
  281971: 8b 45 ec                     	movl	-20(%ebp), %eax
  281974: 0f b6 80 bd 00 00 00         	movzbl	189(%eax), %eax
  28197b: 0f b6 c0                     	movzbl	%al, %eax
  28197e: 2d c1 00 00 00               	subl	$193, %eax
  281983: 01 c0                        	addl	%eax, %eax
  281985: 89 45 f4                     	movl	%eax, -12(%ebp)
  281988: 8b 45 1c                     	movl	28(%ebp), %eax
  28198b: 0f b6 00                     	movzbl	(%eax), %eax
  28198e: 3c 3f                        	cmpb	$63, %al
  281990: 76 1b                        	jbe	27 <putfonts8_asc+0x176>
  281992: 8b 45 1c                     	movl	28(%ebp), %eax
  281995: 0f b6 00                     	movzbl	(%eax), %eax
  281998: 3c 7e                        	cmpb	$126, %al
  28199a: 77 11                        	ja	17 <putfonts8_asc+0x176>
  28199c: 8b 45 1c                     	movl	28(%ebp), %eax
  28199f: 0f b6 00                     	movzbl	(%eax), %eax
  2819a2: 0f b6 c0                     	movzbl	%al, %eax
  2819a5: 83 e8 40                     	subl	$64, %eax
  2819a8: 89 45 f0                     	movl	%eax, -16(%ebp)
  2819ab: eb 3a                        	jmp	58 <putfonts8_asc+0x1b0>
  2819ad: 8b 45 1c                     	movl	28(%ebp), %eax
  2819b0: 0f b6 00                     	movzbl	(%eax), %eax
  2819b3: 84 c0                        	testb	%al, %al
  2819b5: 79 1b                        	jns	27 <putfonts8_asc+0x19b>
  2819b7: 8b 45 1c                     	movl	28(%ebp), %eax
  2819ba: 0f b6 00                     	movzbl	(%eax), %eax
  2819bd: 3c 9e                        	cmpb	$-98, %al
  2819bf: 77 11                        	ja	17 <putfonts8_asc+0x19b>
  2819c1: 8b 45 1c                     	movl	28(%ebp), %eax
  2819c4: 0f b6 00                     	movzbl	(%eax), %eax
  2819c7: 0f b6 c0                     	movzbl	%al, %eax
  2819ca: 83 e8 41                     	subl	$65, %eax
  2819cd: 89 45 f0                     	movl	%eax, -16(%ebp)
  2819d0: eb 15                        	jmp	21 <putfonts8_asc+0x1b0>
  2819d2: 8b 45 1c                     	movl	28(%ebp), %eax
  2819d5: 0f b6 00                     	movzbl	(%eax), %eax
  2819d8: 0f b6 c0                     	movzbl	%al, %eax
  2819db: 2d 9f 00 00 00               	subl	$159, %eax
  2819e0: 89 45 f0                     	movl	%eax, -16(%ebp)
  2819e3: 83 45 f4 01                  	addl	$1, -12(%ebp)
  2819e7: 8b 45 ec                     	movl	-20(%ebp), %eax
  2819ea: c6 80 bd 00 00 00 00         	movb	$0, 189(%eax)
  2819f1: 8b 45 f4                     	movl	-12(%ebp), %eax
  2819f4: 6b d0 5e                     	imull	$94, %eax, %edx
  2819f7: 8b 45 f0                     	movl	-16(%ebp), %eax
  2819fa: 01 d0                        	addl	%edx, %eax
  2819fc: c1 e0 05                     	shll	$5, %eax
  2819ff: 8d 90 00 10 00 00            	leal	4096(%eax), %edx
  281a05: 8b 45 e8                     	movl	-24(%ebp), %eax
  281a08: 01 d0                        	addl	%edx, %eax
  281a0a: 89 45 e4                     	movl	%eax, -28(%ebp)
  281a0d: 0f be 45 d4                  	movsbl	-44(%ebp), %eax
  281a11: 8b 55 10                     	movl	16(%ebp), %edx
  281a14: 83 ea 08                     	subl	$8, %edx
  281a17: 83 ec 08                     	subl	$8, %esp
  281a1a: ff 75 e4                     	pushl	-28(%ebp)
  281a1d: 50                           	pushl	%eax
  281a1e: ff 75 14                     	pushl	20(%ebp)
  281a21: 52                           	pushl	%edx
  281a22: ff 75 0c                     	pushl	12(%ebp)
  281a25: ff 75 08                     	pushl	8(%ebp)
  281a28: e8 08 fd ff ff               	calll	-760 <putfont8>
  281a2d: 83 c4 20                     	addl	$32, %esp
  281a30: 8b 45 e4                     	movl	-28(%ebp), %eax
  281a33: 8d 50 10                     	leal	16(%eax), %edx
  281a36: 0f be 45 d4                  	movsbl	-44(%ebp), %eax
  281a3a: 83 ec 08                     	subl	$8, %esp
  281a3d: 52                           	pushl	%edx
  281a3e: 50                           	pushl	%eax
  281a3f: ff 75 14                     	pushl	20(%ebp)
  281a42: ff 75 10                     	pushl	16(%ebp)
  281a45: ff 75 0c                     	pushl	12(%ebp)
  281a48: ff 75 08                     	pushl	8(%ebp)
  281a4b: e8 e5 fc ff ff               	calll	-795 <putfont8>
  281a50: 83 c4 20                     	addl	$32, %esp
  281a53: 83 45 10 08                  	addl	$8, 16(%ebp)
  281a57: 83 45 1c 01                  	addl	$1, 28(%ebp)
  281a5b: 8b 45 1c                     	movl	28(%ebp), %eax
  281a5e: 0f b6 00                     	movzbl	(%eax), %eax
  281a61: 84 c0                        	testb	%al, %al
  281a63: 0f 85 54 fe ff ff            	jne	-428 <putfonts8_asc+0x86>
  281a69: 8b 45 ec                     	movl	-20(%ebp), %eax
  281a6c: 0f b6 80 bc 00 00 00         	movzbl	188(%eax), %eax
  281a73: 3c 02                        	cmpb	$2, %al
  281a75: 0f 85 19 01 00 00            	jne	281 <putfonts8_asc+0x35d>
  281a7b: e9 05 01 00 00               	jmp	261 <putfonts8_asc+0x34e>
  281a80: 8b 45 ec                     	movl	-20(%ebp), %eax
  281a83: 0f b6 80 bd 00 00 00         	movzbl	189(%eax), %eax
  281a8a: 84 c0                        	testb	%al, %al
  281a8c: 75 5d                        	jne	93 <putfonts8_asc+0x2b4>
  281a8e: 8b 45 1c                     	movl	28(%ebp), %eax
  281a91: 0f b6 00                     	movzbl	(%eax), %eax
  281a94: 3c 80                        	cmpb	$-128, %al
  281a96: 76 1e                        	jbe	30 <putfonts8_asc+0x27f>
  281a98: 8b 45 1c                     	movl	28(%ebp), %eax
  281a9b: 0f b6 00                     	movzbl	(%eax), %eax
  281a9e: 3c ff                        	cmpb	$-1, %al
  281aa0: 74 14                        	je	20 <putfonts8_asc+0x27f>
  281aa2: 8b 45 1c                     	movl	28(%ebp), %eax
  281aa5: 0f b6 10                     	movzbl	(%eax), %edx
  281aa8: 8b 45 ec                     	movl	-20(%ebp), %eax
  281aab: 88 90 bd 00 00 00            	movb	%dl, 189(%eax)
  281ab1: e9 c7 00 00 00               	jmp	199 <putfonts8_asc+0x346>
  281ab6: 8b 45 1c                     	movl	28(%ebp), %eax
  281ab9: 0f b6 00                     	movzbl	(%eax), %eax
  281abc: 0f b6 c0                     	movzbl	%al, %eax
  281abf: c1 e0 04                     	shll	$4, %eax
  281ac2: 89 c2                        	movl	%eax, %edx
  281ac4: 8b 45 e8                     	movl	-24(%ebp), %eax
  281ac7: 01 c2                        	addl	%eax, %edx
  281ac9: 0f be 45 d4                  	movsbl	-44(%ebp), %eax
  281acd: 83 ec 08                     	subl	$8, %esp
  281ad0: 52                           	pushl	%edx
  281ad1: 50                           	pushl	%eax
  281ad2: ff 75 14                     	pushl	20(%ebp)
  281ad5: ff 75 10                     	pushl	16(%ebp)
  281ad8: ff 75 0c                     	pushl	12(%ebp)
  281adb: ff 75 08                     	pushl	8(%ebp)
  281ade: e8 52 fc ff ff               	calll	-942 <putfont8>
  281ae3: 83 c4 20                     	addl	$32, %esp
  281ae6: e9 92 00 00 00               	jmp	146 <putfonts8_asc+0x346>
  281aeb: 8b 45 ec                     	movl	-20(%ebp), %eax
  281aee: 0f b6 80 bd 00 00 00         	movzbl	189(%eax), %eax
  281af5: 0f b6 c0                     	movzbl	%al, %eax
  281af8: 2d a1 00 00 00               	subl	$161, %eax
  281afd: 89 45 f4                     	movl	%eax, -12(%ebp)
  281b00: 8b 45 1c                     	movl	28(%ebp), %eax
  281b03: 0f b6 00                     	movzbl	(%eax), %eax
  281b06: 0f b6 c0                     	movzbl	%al, %eax
  281b09: 2d a1 00 00 00               	subl	$161, %eax
  281b0e: 89 45 f0                     	movl	%eax, -16(%ebp)
  281b11: 8b 45 ec                     	movl	-20(%ebp), %eax
  281b14: c6 80 bd 00 00 00 00         	movb	$0, 189(%eax)
  281b1b: 8b 45 f4                     	movl	-12(%ebp), %eax
  281b1e: 6b d0 5e                     	imull	$94, %eax, %edx
  281b21: 8b 45 f0                     	movl	-16(%ebp), %eax
  281b24: 01 d0                        	addl	%edx, %eax
  281b26: c1 e0 05                     	shll	$5, %eax
  281b29: 8d 90 00 10 00 00            	leal	4096(%eax), %edx
  281b2f: 8b 45 e8                     	movl	-24(%ebp), %eax
  281b32: 01 d0                        	addl	%edx, %eax
  281b34: 89 45 e4                     	movl	%eax, -28(%ebp)
  281b37: 0f be 45 d4                  	movsbl	-44(%ebp), %eax
  281b3b: 8b 55 10                     	movl	16(%ebp), %edx
  281b3e: 83 ea 08                     	subl	$8, %edx
  281b41: 83 ec 08                     	subl	$8, %esp
  281b44: ff 75 e4                     	pushl	-28(%ebp)
  281b47: 50                           	pushl	%eax
  281b48: ff 75 14                     	pushl	20(%ebp)
  281b4b: 52                           	pushl	%edx
  281b4c: ff 75 0c                     	pushl	12(%ebp)
  281b4f: ff 75 08                     	pushl	8(%ebp)
  281b52: e8 de fb ff ff               	calll	-1058 <putfont8>
  281b57: 83 c4 20                     	addl	$32, %esp
  281b5a: 8b 45 e4                     	movl	-28(%ebp), %eax
  281b5d: 8d 50 10                     	leal	16(%eax), %edx
  281b60: 0f be 45 d4                  	movsbl	-44(%ebp), %eax
  281b64: 83 ec 08                     	subl	$8, %esp
  281b67: 52                           	pushl	%edx
  281b68: 50                           	pushl	%eax
  281b69: ff 75 14                     	pushl	20(%ebp)
  281b6c: ff 75 10                     	pushl	16(%ebp)
  281b6f: ff 75 0c                     	pushl	12(%ebp)
  281b72: ff 75 08                     	pushl	8(%ebp)
  281b75: e8 bb fb ff ff               	calll	-1093 <putfont8>
  281b7a: 83 c4 20                     	addl	$32, %esp
  281b7d: 83 45 10 08                  	addl	$8, 16(%ebp)
  281b81: 83 45 1c 01                  	addl	$1, 28(%ebp)
  281b85: 8b 45 1c                     	movl	28(%ebp), %eax
  281b88: 0f b6 00                     	movzbl	(%eax), %eax
  281b8b: 84 c0                        	testb	%al, %al
  281b8d: 0f 85 ed fe ff ff            	jne	-275 <putfonts8_asc+0x249>
  281b93: 90                           	nop
  281b94: 90                           	nop
  281b95: c9                           	leave
  281b96: c3                           	retl

00281b97 init_mouse_cursor8:
  281b97: 55                           	pushl	%ebp
  281b98: 89 e5                        	movl	%esp, %ebp
  281b9a: 83 ec 14                     	subl	$20, %esp
  281b9d: 8b 45 0c                     	movl	12(%ebp), %eax
  281ba0: 88 45 ec                     	movb	%al, -20(%ebp)
  281ba3: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  281baa: e9 b1 00 00 00               	jmp	177 <init_mouse_cursor8+0xc9>
  281baf: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  281bb6: e9 97 00 00 00               	jmp	151 <init_mouse_cursor8+0xbb>
  281bbb: 8b 45 f8                     	movl	-8(%ebp), %eax
  281bbe: c1 e0 04                     	shll	$4, %eax
  281bc1: 89 c2                        	movl	%eax, %edx
  281bc3: 8b 45 fc                     	movl	-4(%ebp), %eax
  281bc6: 01 d0                        	addl	%edx, %eax
  281bc8: 05 80 11 31 00               	addl	$3215744, %eax
  281bcd: 0f b6 00                     	movzbl	(%eax), %eax
  281bd0: 3c 2a                        	cmpb	$42, %al
  281bd2: 75 17                        	jne	23 <init_mouse_cursor8+0x54>
  281bd4: 8b 45 f8                     	movl	-8(%ebp), %eax
  281bd7: c1 e0 04                     	shll	$4, %eax
  281bda: 89 c2                        	movl	%eax, %edx
  281bdc: 8b 45 fc                     	movl	-4(%ebp), %eax
  281bdf: 01 d0                        	addl	%edx, %eax
  281be1: 89 c2                        	movl	%eax, %edx
  281be3: 8b 45 08                     	movl	8(%ebp), %eax
  281be6: 01 d0                        	addl	%edx, %eax
  281be8: c6 00 00                     	movb	$0, (%eax)
  281beb: 8b 45 f8                     	movl	-8(%ebp), %eax
  281bee: c1 e0 04                     	shll	$4, %eax
  281bf1: 89 c2                        	movl	%eax, %edx
  281bf3: 8b 45 fc                     	movl	-4(%ebp), %eax
  281bf6: 01 d0                        	addl	%edx, %eax
  281bf8: 05 80 11 31 00               	addl	$3215744, %eax
  281bfd: 0f b6 00                     	movzbl	(%eax), %eax
  281c00: 3c 4f                        	cmpb	$79, %al
  281c02: 75 17                        	jne	23 <init_mouse_cursor8+0x84>
  281c04: 8b 45 f8                     	movl	-8(%ebp), %eax
  281c07: c1 e0 04                     	shll	$4, %eax
  281c0a: 89 c2                        	movl	%eax, %edx
  281c0c: 8b 45 fc                     	movl	-4(%ebp), %eax
  281c0f: 01 d0                        	addl	%edx, %eax
  281c11: 89 c2                        	movl	%eax, %edx
  281c13: 8b 45 08                     	movl	8(%ebp), %eax
  281c16: 01 d0                        	addl	%edx, %eax
  281c18: c6 00 07                     	movb	$7, (%eax)
  281c1b: 8b 45 f8                     	movl	-8(%ebp), %eax
  281c1e: c1 e0 04                     	shll	$4, %eax
  281c21: 89 c2                        	movl	%eax, %edx
  281c23: 8b 45 fc                     	movl	-4(%ebp), %eax
  281c26: 01 d0                        	addl	%edx, %eax
  281c28: 05 80 11 31 00               	addl	$3215744, %eax
  281c2d: 0f b6 00                     	movzbl	(%eax), %eax
  281c30: 3c 2e                        	cmpb	$46, %al
  281c32: 75 1a                        	jne	26 <init_mouse_cursor8+0xb7>
  281c34: 8b 45 f8                     	movl	-8(%ebp), %eax
  281c37: c1 e0 04                     	shll	$4, %eax
  281c3a: 89 c2                        	movl	%eax, %edx
  281c3c: 8b 45 fc                     	movl	-4(%ebp), %eax
  281c3f: 01 d0                        	addl	%edx, %eax
  281c41: 89 c2                        	movl	%eax, %edx
  281c43: 8b 45 08                     	movl	8(%ebp), %eax
  281c46: 01 c2                        	addl	%eax, %edx
  281c48: 0f b6 45 ec                  	movzbl	-20(%ebp), %eax
  281c4c: 88 02                        	movb	%al, (%edx)
  281c4e: 83 45 fc 01                  	addl	$1, -4(%ebp)
  281c52: 83 7d fc 0f                  	cmpl	$15, -4(%ebp)
  281c56: 0f 8e 5f ff ff ff            	jle	-161 <init_mouse_cursor8+0x24>
  281c5c: 83 45 f8 01                  	addl	$1, -8(%ebp)
  281c60: 83 7d f8 0f                  	cmpl	$15, -8(%ebp)
  281c64: 0f 8e 45 ff ff ff            	jle	-187 <init_mouse_cursor8+0x18>
  281c6a: 90                           	nop
  281c6b: c9                           	leave
  281c6c: c3                           	retl

00281c6d putblock8_8:
  281c6d: 55                           	pushl	%ebp
  281c6e: 89 e5                        	movl	%esp, %ebp
  281c70: 53                           	pushl	%ebx
  281c71: 83 ec 10                     	subl	$16, %esp
  281c74: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  281c7b: eb 50                        	jmp	80 <putblock8_8+0x60>
  281c7d: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  281c84: eb 3b                        	jmp	59 <putblock8_8+0x54>
  281c86: 8b 45 f4                     	movl	-12(%ebp), %eax
  281c89: 0f af 45 24                  	imull	36(%ebp), %eax
  281c8d: 89 c2                        	movl	%eax, %edx
  281c8f: 8b 45 f8                     	movl	-8(%ebp), %eax
  281c92: 01 d0                        	addl	%edx, %eax
  281c94: 89 c2                        	movl	%eax, %edx
  281c96: 8b 45 20                     	movl	32(%ebp), %eax
  281c99: 01 d0                        	addl	%edx, %eax
  281c9b: 8b 4d 1c                     	movl	28(%ebp), %ecx
  281c9e: 8b 55 f4                     	movl	-12(%ebp), %edx
  281ca1: 01 ca                        	addl	%ecx, %edx
  281ca3: 0f af 55 0c                  	imull	12(%ebp), %edx
  281ca7: 8b 5d 18                     	movl	24(%ebp), %ebx
  281caa: 8b 4d f8                     	movl	-8(%ebp), %ecx
  281cad: 01 d9                        	addl	%ebx, %ecx
  281caf: 01 ca                        	addl	%ecx, %edx
  281cb1: 89 d1                        	movl	%edx, %ecx
  281cb3: 8b 55 08                     	movl	8(%ebp), %edx
  281cb6: 01 ca                        	addl	%ecx, %edx
  281cb8: 0f b6 00                     	movzbl	(%eax), %eax
  281cbb: 88 02                        	movb	%al, (%edx)
  281cbd: 83 45 f8 01                  	addl	$1, -8(%ebp)
  281cc1: 8b 45 f8                     	movl	-8(%ebp), %eax
  281cc4: 3b 45 10                     	cmpl	16(%ebp), %eax
  281cc7: 7c bd                        	jl	-67 <putblock8_8+0x19>
  281cc9: 83 45 f4 01                  	addl	$1, -12(%ebp)
  281ccd: 8b 45 f4                     	movl	-12(%ebp), %eax
  281cd0: 3b 45 14                     	cmpl	20(%ebp), %eax
  281cd3: 7c a8                        	jl	-88 <putblock8_8+0x10>
  281cd5: 90                           	nop
  281cd6: 83 c4 10                     	addl	$16, %esp
  281cd9: 5b                           	popl	%ebx
  281cda: 5d                           	popl	%ebp
  281cdb: c3                           	retl

00281cdc init_gdtidt:
  281cdc: 55                           	pushl	%ebp
  281cdd: 89 e5                        	movl	%esp, %ebp
  281cdf: 83 ec 18                     	subl	$24, %esp
  281ce2: c7 45 f0 00 00 27 00         	movl	$2555904, -16(%ebp)
  281ce9: c7 45 ec 00 f8 26 00         	movl	$2553856, -20(%ebp)
  281cf0: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  281cf7: eb 22                        	jmp	34 <init_gdtidt+0x3f>
  281cf9: 8b 45 f4                     	movl	-12(%ebp), %eax
  281cfc: 8d 14 c5 00 00 00 00         	leal	(,%eax,8), %edx
  281d03: 8b 45 f0                     	movl	-16(%ebp), %eax
  281d06: 01 d0                        	addl	%edx, %eax
  281d08: 6a 00                        	pushl	$0
  281d0a: 6a 00                        	pushl	$0
  281d0c: 6a 00                        	pushl	$0
  281d0e: 50                           	pushl	%eax
  281d0f: e8 51 01 00 00               	calll	337 <set_segmdesc>
  281d14: 83 c4 10                     	addl	$16, %esp
  281d17: 83 45 f4 01                  	addl	$1, -12(%ebp)
  281d1b: 81 7d f4 ff 1f 00 00         	cmpl	$8191, -12(%ebp)
  281d22: 7e d5                        	jle	-43 <init_gdtidt+0x1d>
  281d24: 8b 45 f0                     	movl	-16(%ebp), %eax
  281d27: 83 c0 08                     	addl	$8, %eax
  281d2a: 68 92 40 00 00               	pushl	$16530
  281d2f: 6a 00                        	pushl	$0
  281d31: 6a ff                        	pushl	$-1
  281d33: 50                           	pushl	%eax
  281d34: e8 2c 01 00 00               	calll	300 <set_segmdesc>
  281d39: 83 c4 10                     	addl	$16, %esp
  281d3c: 8b 45 f0                     	movl	-16(%ebp), %eax
  281d3f: 83 c0 10                     	addl	$16, %eax
  281d42: 68 9a 40 00 00               	pushl	$16538
  281d47: 6a 00                        	pushl	$0
  281d49: 6a ff                        	pushl	$-1
  281d4b: 50                           	pushl	%eax
  281d4c: e8 14 01 00 00               	calll	276 <set_segmdesc>
  281d51: 83 c4 10                     	addl	$16, %esp
  281d54: 83 ec 08                     	subl	$8, %esp
  281d57: 68 00 00 27 00               	pushl	$2555904
  281d5c: 68 ff ff 00 00               	pushl	$65535
  281d61: e8 09 f4 ff ff               	calll	-3063 <load_gdtr>
  281d66: 83 c4 10                     	addl	$16, %esp
  281d69: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  281d70: eb 22                        	jmp	34 <init_gdtidt+0xb8>
  281d72: 8b 45 f4                     	movl	-12(%ebp), %eax
  281d75: 8d 14 c5 00 00 00 00         	leal	(,%eax,8), %edx
  281d7c: 8b 45 ec                     	movl	-20(%ebp), %eax
  281d7f: 01 d0                        	addl	%edx, %eax
  281d81: 6a 00                        	pushl	$0
  281d83: 6a 00                        	pushl	$0
  281d85: 6a 00                        	pushl	$0
  281d87: 50                           	pushl	%eax
  281d88: e8 53 01 00 00               	calll	339 <set_gatedesc>
  281d8d: 83 c4 10                     	addl	$16, %esp
  281d90: 83 45 f4 01                  	addl	$1, -12(%ebp)
  281d94: 81 7d f4 ff 00 00 00         	cmpl	$255, -12(%ebp)
  281d9b: 7e d5                        	jle	-43 <init_gdtidt+0x96>
  281d9d: 83 ec 08                     	subl	$8, %esp
  281da0: 68 00 f8 26 00               	pushl	$2553856
  281da5: 68 ff 07 00 00               	pushl	$2047
  281daa: e8 d0 f3 ff ff               	calll	-3120 <load_idtr>
  281daf: 83 c4 10                     	addl	$16, %esp
  281db2: ba e6 11 28 00               	movl	$2626022, %edx
  281db7: 8b 45 ec                     	movl	-20(%ebp), %eax
  281dba: 83 c0 60                     	addl	$96, %eax
  281dbd: 68 8e 00 00 00               	pushl	$142
  281dc2: 6a 10                        	pushl	$16
  281dc4: 52                           	pushl	%edx
  281dc5: 50                           	pushl	%eax
  281dc6: e8 15 01 00 00               	calll	277 <set_gatedesc>
  281dcb: 83 c4 10                     	addl	$16, %esp
  281dce: ba 0a 12 28 00               	movl	$2626058, %edx
  281dd3: 8b 45 ec                     	movl	-20(%ebp), %eax
  281dd6: 83 c0 68                     	addl	$104, %eax
  281dd9: 68 8e 00 00 00               	pushl	$142
  281dde: 6a 10                        	pushl	$16
  281de0: 52                           	pushl	%edx
  281de1: 50                           	pushl	%eax
  281de2: e8 f9 00 00 00               	calll	249 <set_gatedesc>
  281de7: 83 c4 10                     	addl	$16, %esp
  281dea: ba a1 11 28 00               	movl	$2625953, %edx
  281def: 8b 45 ec                     	movl	-20(%ebp), %eax
  281df2: 05 00 01 00 00               	addl	$256, %eax
  281df7: 68 8e 00 00 00               	pushl	$142
  281dfc: 6a 10                        	pushl	$16
  281dfe: 52                           	pushl	%edx
  281dff: 50                           	pushl	%eax
  281e00: e8 db 00 00 00               	calll	219 <set_gatedesc>
  281e05: 83 c4 10                     	addl	$16, %esp
  281e08: ba b8 11 28 00               	movl	$2625976, %edx
  281e0d: 8b 45 ec                     	movl	-20(%ebp), %eax
  281e10: 05 08 01 00 00               	addl	$264, %eax
  281e15: 68 8e 00 00 00               	pushl	$142
  281e1a: 6a 10                        	pushl	$16
  281e1c: 52                           	pushl	%edx
  281e1d: 50                           	pushl	%eax
  281e1e: e8 bd 00 00 00               	calll	189 <set_gatedesc>
  281e23: 83 c4 10                     	addl	$16, %esp
  281e26: ba cf 11 28 00               	movl	$2625999, %edx
  281e2b: 8b 45 ec                     	movl	-20(%ebp), %eax
  281e2e: 05 60 01 00 00               	addl	$352, %eax
  281e33: 68 8e 00 00 00               	pushl	$142
  281e38: 6a 10                        	pushl	$16
  281e3a: 52                           	pushl	%edx
  281e3b: 50                           	pushl	%eax
  281e3c: e8 9f 00 00 00               	calll	159 <set_gatedesc>
  281e41: 83 c4 10                     	addl	$16, %esp
  281e44: ba 76 12 28 00               	movl	$2626166, %edx
  281e49: 8b 45 ec                     	movl	-20(%ebp), %eax
  281e4c: 05 00 02 00 00               	addl	$512, %eax
  281e51: 68 ee 00 00 00               	pushl	$238
  281e56: 6a 10                        	pushl	$16
  281e58: 52                           	pushl	%edx
  281e59: 50                           	pushl	%eax
  281e5a: e8 81 00 00 00               	calll	129 <set_gatedesc>
  281e5f: 83 c4 10                     	addl	$16, %esp
  281e62: 90                           	nop
  281e63: c9                           	leave
  281e64: c3                           	retl

00281e65 set_segmdesc:
  281e65: 55                           	pushl	%ebp
  281e66: 89 e5                        	movl	%esp, %ebp
  281e68: 81 7d 0c ff ff 0f 00         	cmpl	$1048575, 12(%ebp)
  281e6f: 76 10                        	jbe	16 <set_segmdesc+0x1c>
  281e71: 81 4d 14 00 80 00 00         	orl	$32768, 20(%ebp)
  281e78: 8b 45 0c                     	movl	12(%ebp), %eax
  281e7b: c1 e8 0c                     	shrl	$12, %eax
  281e7e: 89 45 0c                     	movl	%eax, 12(%ebp)
  281e81: 8b 45 0c                     	movl	12(%ebp), %eax
  281e84: 89 c2                        	movl	%eax, %edx
  281e86: 8b 45 08                     	movl	8(%ebp), %eax
  281e89: 66 89 10                     	movw	%dx, (%eax)
  281e8c: 8b 45 10                     	movl	16(%ebp), %eax
  281e8f: 89 c2                        	movl	%eax, %edx
  281e91: 8b 45 08                     	movl	8(%ebp), %eax
  281e94: 66 89 50 02                  	movw	%dx, 2(%eax)
  281e98: 8b 45 10                     	movl	16(%ebp), %eax
  281e9b: c1 f8 10                     	sarl	$16, %eax
  281e9e: 89 c2                        	movl	%eax, %edx
  281ea0: 8b 45 08                     	movl	8(%ebp), %eax
  281ea3: 88 50 04                     	movb	%dl, 4(%eax)
  281ea6: 8b 45 14                     	movl	20(%ebp), %eax
  281ea9: 89 c2                        	movl	%eax, %edx
  281eab: 8b 45 08                     	movl	8(%ebp), %eax
  281eae: 88 50 05                     	movb	%dl, 5(%eax)
  281eb1: 8b 45 0c                     	movl	12(%ebp), %eax
  281eb4: c1 e8 10                     	shrl	$16, %eax
  281eb7: 83 e0 0f                     	andl	$15, %eax
  281eba: 89 c2                        	movl	%eax, %edx
  281ebc: 8b 45 14                     	movl	20(%ebp), %eax
  281ebf: c1 f8 08                     	sarl	$8, %eax
  281ec2: 83 e0 f0                     	andl	$-16, %eax
  281ec5: 09 d0                        	orl	%edx, %eax
  281ec7: 89 c2                        	movl	%eax, %edx
  281ec9: 8b 45 08                     	movl	8(%ebp), %eax
  281ecc: 88 50 06                     	movb	%dl, 6(%eax)
  281ecf: 8b 45 10                     	movl	16(%ebp), %eax
  281ed2: c1 e8 18                     	shrl	$24, %eax
  281ed5: 89 c2                        	movl	%eax, %edx
  281ed7: 8b 45 08                     	movl	8(%ebp), %eax
  281eda: 88 50 07                     	movb	%dl, 7(%eax)
  281edd: 90                           	nop
  281ede: 5d                           	popl	%ebp
  281edf: c3                           	retl

00281ee0 set_gatedesc:
  281ee0: 55                           	pushl	%ebp
  281ee1: 89 e5                        	movl	%esp, %ebp
  281ee3: 8b 45 0c                     	movl	12(%ebp), %eax
  281ee6: 89 c2                        	movl	%eax, %edx
  281ee8: 8b 45 08                     	movl	8(%ebp), %eax
  281eeb: 66 89 10                     	movw	%dx, (%eax)
  281eee: 8b 45 10                     	movl	16(%ebp), %eax
  281ef1: 89 c2                        	movl	%eax, %edx
  281ef3: 8b 45 08                     	movl	8(%ebp), %eax
  281ef6: 66 89 50 02                  	movw	%dx, 2(%eax)
  281efa: 8b 45 14                     	movl	20(%ebp), %eax
  281efd: c1 f8 08                     	sarl	$8, %eax
  281f00: 89 c2                        	movl	%eax, %edx
  281f02: 8b 45 08                     	movl	8(%ebp), %eax
  281f05: 88 50 04                     	movb	%dl, 4(%eax)
  281f08: 8b 45 14                     	movl	20(%ebp), %eax
  281f0b: 89 c2                        	movl	%eax, %edx
  281f0d: 8b 45 08                     	movl	8(%ebp), %eax
  281f10: 88 50 05                     	movb	%dl, 5(%eax)
  281f13: 8b 45 0c                     	movl	12(%ebp), %eax
  281f16: c1 e8 10                     	shrl	$16, %eax
  281f19: 89 c2                        	movl	%eax, %edx
  281f1b: 8b 45 08                     	movl	8(%ebp), %eax
  281f1e: 66 89 50 06                  	movw	%dx, 6(%eax)
  281f22: 90                           	nop
  281f23: 5d                           	popl	%ebp
  281f24: c3                           	retl

00281f25 init_pic:
  281f25: 55                           	pushl	%ebp
  281f26: 89 e5                        	movl	%esp, %ebp
  281f28: 83 ec 08                     	subl	$8, %esp
  281f2b: 83 ec 08                     	subl	$8, %esp
  281f2e: 68 ff 00 00 00               	pushl	$255
  281f33: 6a 21                        	pushl	$33
  281f35: e8 0c f2 ff ff               	calll	-3572 <io_out8>
  281f3a: 83 c4 10                     	addl	$16, %esp
  281f3d: 83 ec 08                     	subl	$8, %esp
  281f40: 68 ff 00 00 00               	pushl	$255
  281f45: 68 a1 00 00 00               	pushl	$161
  281f4a: e8 f7 f1 ff ff               	calll	-3593 <io_out8>
  281f4f: 83 c4 10                     	addl	$16, %esp
  281f52: 83 ec 08                     	subl	$8, %esp
  281f55: 6a 11                        	pushl	$17
  281f57: 6a 20                        	pushl	$32
  281f59: e8 e8 f1 ff ff               	calll	-3608 <io_out8>
  281f5e: 83 c4 10                     	addl	$16, %esp
  281f61: 83 ec 08                     	subl	$8, %esp
  281f64: 6a 20                        	pushl	$32
  281f66: 6a 21                        	pushl	$33
  281f68: e8 d9 f1 ff ff               	calll	-3623 <io_out8>
  281f6d: 83 c4 10                     	addl	$16, %esp
  281f70: 83 ec 08                     	subl	$8, %esp
  281f73: 6a 04                        	pushl	$4
  281f75: 6a 21                        	pushl	$33
  281f77: e8 ca f1 ff ff               	calll	-3638 <io_out8>
  281f7c: 83 c4 10                     	addl	$16, %esp
  281f7f: 83 ec 08                     	subl	$8, %esp
  281f82: 6a 01                        	pushl	$1
  281f84: 6a 21                        	pushl	$33
  281f86: e8 bb f1 ff ff               	calll	-3653 <io_out8>
  281f8b: 83 c4 10                     	addl	$16, %esp
  281f8e: 83 ec 08                     	subl	$8, %esp
  281f91: 6a 11                        	pushl	$17
  281f93: 68 a0 00 00 00               	pushl	$160
  281f98: e8 a9 f1 ff ff               	calll	-3671 <io_out8>
  281f9d: 83 c4 10                     	addl	$16, %esp
  281fa0: 83 ec 08                     	subl	$8, %esp
  281fa3: 6a 28                        	pushl	$40
  281fa5: 68 a1 00 00 00               	pushl	$161
  281faa: e8 97 f1 ff ff               	calll	-3689 <io_out8>
  281faf: 83 c4 10                     	addl	$16, %esp
  281fb2: 83 ec 08                     	subl	$8, %esp
  281fb5: 6a 02                        	pushl	$2
  281fb7: 68 a1 00 00 00               	pushl	$161
  281fbc: e8 85 f1 ff ff               	calll	-3707 <io_out8>
  281fc1: 83 c4 10                     	addl	$16, %esp
  281fc4: 83 ec 08                     	subl	$8, %esp
  281fc7: 6a 01                        	pushl	$1
  281fc9: 68 a1 00 00 00               	pushl	$161
  281fce: e8 73 f1 ff ff               	calll	-3725 <io_out8>
  281fd3: 83 c4 10                     	addl	$16, %esp
  281fd6: 83 ec 08                     	subl	$8, %esp
  281fd9: 68 fb 00 00 00               	pushl	$251
  281fde: 6a 21                        	pushl	$33
  281fe0: e8 61 f1 ff ff               	calll	-3743 <io_out8>
  281fe5: 83 c4 10                     	addl	$16, %esp
  281fe8: 83 ec 08                     	subl	$8, %esp
  281feb: 68 ff 00 00 00               	pushl	$255
  281ff0: 68 a1 00 00 00               	pushl	$161
  281ff5: e8 4c f1 ff ff               	calll	-3764 <io_out8>
  281ffa: 83 c4 10                     	addl	$16, %esp
  281ffd: 90                           	nop
  281ffe: c9                           	leave
  281fff: c3                           	retl

00282000 fifo32_init:
  282000: 55                           	pushl	%ebp
  282001: 89 e5                        	movl	%esp, %ebp
  282003: 8b 45 08                     	movl	8(%ebp), %eax
  282006: 8b 55 0c                     	movl	12(%ebp), %edx
  282009: 89 50 0c                     	movl	%edx, 12(%eax)
  28200c: 8b 45 08                     	movl	8(%ebp), %eax
  28200f: 8b 55 10                     	movl	16(%ebp), %edx
  282012: 89 10                        	movl	%edx, (%eax)
  282014: 8b 45 08                     	movl	8(%ebp), %eax
  282017: 8b 55 0c                     	movl	12(%ebp), %edx
  28201a: 89 50 10                     	movl	%edx, 16(%eax)
  28201d: 8b 45 08                     	movl	8(%ebp), %eax
  282020: c7 40 14 00 00 00 00         	movl	$0, 20(%eax)
  282027: 8b 45 08                     	movl	8(%ebp), %eax
  28202a: c7 40 04 00 00 00 00         	movl	$0, 4(%eax)
  282031: 8b 45 08                     	movl	8(%ebp), %eax
  282034: c7 40 08 00 00 00 00         	movl	$0, 8(%eax)
  28203b: 8b 45 08                     	movl	8(%ebp), %eax
  28203e: 8b 55 14                     	movl	20(%ebp), %edx
  282041: 89 50 18                     	movl	%edx, 24(%eax)
  282044: 90                           	nop
  282045: 5d                           	popl	%ebp
  282046: c3                           	retl

00282047 fifo32_put:
  282047: 55                           	pushl	%ebp
  282048: 89 e5                        	movl	%esp, %ebp
  28204a: 83 ec 08                     	subl	$8, %esp
  28204d: 8b 45 08                     	movl	8(%ebp), %eax
  282050: 8b 40 10                     	movl	16(%eax), %eax
  282053: 85 c0                        	testl	%eax, %eax
  282055: 75 1b                        	jne	27 <fifo32_put+0x2b>
  282057: 8b 45 08                     	movl	8(%ebp), %eax
  28205a: 8b 40 14                     	movl	20(%eax), %eax
  28205d: 83 c8 01                     	orl	$1, %eax
  282060: 89 c2                        	movl	%eax, %edx
  282062: 8b 45 08                     	movl	8(%ebp), %eax
  282065: 89 50 14                     	movl	%edx, 20(%eax)
  282068: b8 ff ff ff ff               	movl	$4294967295, %eax
  28206d: e9 80 00 00 00               	jmp	128 <fifo32_put+0xab>
  282072: 8b 45 08                     	movl	8(%ebp), %eax
  282075: 8b 10                        	movl	(%eax), %edx
  282077: 8b 45 08                     	movl	8(%ebp), %eax
  28207a: 8b 40 04                     	movl	4(%eax), %eax
  28207d: c1 e0 02                     	shll	$2, %eax
  282080: 01 c2                        	addl	%eax, %edx
  282082: 8b 45 0c                     	movl	12(%ebp), %eax
  282085: 89 02                        	movl	%eax, (%edx)
  282087: 8b 45 08                     	movl	8(%ebp), %eax
  28208a: 8b 40 04                     	movl	4(%eax), %eax
  28208d: 8d 50 01                     	leal	1(%eax), %edx
  282090: 8b 45 08                     	movl	8(%ebp), %eax
  282093: 89 50 04                     	movl	%edx, 4(%eax)
  282096: 8b 45 08                     	movl	8(%ebp), %eax
  282099: 8b 50 04                     	movl	4(%eax), %edx
  28209c: 8b 45 08                     	movl	8(%ebp), %eax
  28209f: 8b 40 0c                     	movl	12(%eax), %eax
  2820a2: 39 c2                        	cmpl	%eax, %edx
  2820a4: 75 0a                        	jne	10 <fifo32_put+0x69>
  2820a6: 8b 45 08                     	movl	8(%ebp), %eax
  2820a9: c7 40 04 00 00 00 00         	movl	$0, 4(%eax)
  2820b0: 8b 45 08                     	movl	8(%ebp), %eax
  2820b3: 8b 40 10                     	movl	16(%eax), %eax
  2820b6: 8d 50 ff                     	leal	-1(%eax), %edx
  2820b9: 8b 45 08                     	movl	8(%ebp), %eax
  2820bc: 89 50 10                     	movl	%edx, 16(%eax)
  2820bf: 8b 45 08                     	movl	8(%ebp), %eax
  2820c2: 8b 40 18                     	movl	24(%eax), %eax
  2820c5: 85 c0                        	testl	%eax, %eax
  2820c7: 74 24                        	je	36 <fifo32_put+0xa6>
  2820c9: 8b 45 08                     	movl	8(%ebp), %eax
  2820cc: 8b 40 18                     	movl	24(%eax), %eax
  2820cf: 8b 40 04                     	movl	4(%eax), %eax
  2820d2: 83 f8 02                     	cmpl	$2, %eax
  2820d5: 74 16                        	je	22 <fifo32_put+0xa6>
  2820d7: 8b 45 08                     	movl	8(%ebp), %eax
  2820da: 8b 40 18                     	movl	24(%eax), %eax
  2820dd: 83 ec 04                     	subl	$4, %esp
  2820e0: 6a 00                        	pushl	$0
  2820e2: 6a ff                        	pushl	$-1
  2820e4: 50                           	pushl	%eax
  2820e5: e8 f7 1f 00 00               	calll	8183 <task_run>
  2820ea: 83 c4 10                     	addl	$16, %esp
  2820ed: b8 00 00 00 00               	movl	$0, %eax
  2820f2: c9                           	leave
  2820f3: c3                           	retl

002820f4 fifo32_get:
  2820f4: 55                           	pushl	%ebp
  2820f5: 89 e5                        	movl	%esp, %ebp
  2820f7: 83 ec 10                     	subl	$16, %esp
  2820fa: 8b 45 08                     	movl	8(%ebp), %eax
  2820fd: 8b 50 10                     	movl	16(%eax), %edx
  282100: 8b 45 08                     	movl	8(%ebp), %eax
  282103: 8b 40 0c                     	movl	12(%eax), %eax
  282106: 39 c2                        	cmpl	%eax, %edx
  282108: 75 07                        	jne	7 <fifo32_get+0x1d>
  28210a: b8 ff ff ff ff               	movl	$4294967295, %eax
  28210f: eb 50                        	jmp	80 <fifo32_get+0x6d>
  282111: 8b 45 08                     	movl	8(%ebp), %eax
  282114: 8b 10                        	movl	(%eax), %edx
  282116: 8b 45 08                     	movl	8(%ebp), %eax
  282119: 8b 40 08                     	movl	8(%eax), %eax
  28211c: c1 e0 02                     	shll	$2, %eax
  28211f: 01 d0                        	addl	%edx, %eax
  282121: 8b 00                        	movl	(%eax), %eax
  282123: 89 45 fc                     	movl	%eax, -4(%ebp)
  282126: 8b 45 08                     	movl	8(%ebp), %eax
  282129: 8b 40 08                     	movl	8(%eax), %eax
  28212c: 8d 50 01                     	leal	1(%eax), %edx
  28212f: 8b 45 08                     	movl	8(%ebp), %eax
  282132: 89 50 08                     	movl	%edx, 8(%eax)
  282135: 8b 45 08                     	movl	8(%ebp), %eax
  282138: 8b 50 08                     	movl	8(%eax), %edx
  28213b: 8b 45 08                     	movl	8(%ebp), %eax
  28213e: 8b 40 0c                     	movl	12(%eax), %eax
  282141: 39 c2                        	cmpl	%eax, %edx
  282143: 75 0a                        	jne	10 <fifo32_get+0x5b>
  282145: 8b 45 08                     	movl	8(%ebp), %eax
  282148: c7 40 08 00 00 00 00         	movl	$0, 8(%eax)
  28214f: 8b 45 08                     	movl	8(%ebp), %eax
  282152: 8b 40 10                     	movl	16(%eax), %eax
  282155: 8d 50 01                     	leal	1(%eax), %edx
  282158: 8b 45 08                     	movl	8(%ebp), %eax
  28215b: 89 50 10                     	movl	%edx, 16(%eax)
  28215e: 8b 45 fc                     	movl	-4(%ebp), %eax
  282161: c9                           	leave
  282162: c3                           	retl

00282163 fifo32_status:
  282163: 55                           	pushl	%ebp
  282164: 89 e5                        	movl	%esp, %ebp
  282166: 8b 45 08                     	movl	8(%ebp), %eax
  282169: 8b 50 0c                     	movl	12(%eax), %edx
  28216c: 8b 45 08                     	movl	8(%ebp), %eax
  28216f: 8b 40 10                     	movl	16(%eax), %eax
  282172: 29 c2                        	subl	%eax, %edx
  282174: 89 d0                        	movl	%edx, %eax
  282176: 5d                           	popl	%ebp
  282177: c3                           	retl

00282178 inthandler21:
  282178: 55                           	pushl	%ebp
  282179: 89 e5                        	movl	%esp, %ebp
  28217b: 83 ec 18                     	subl	$24, %esp
  28217e: 83 ec 08                     	subl	$8, %esp
  282181: 6a 61                        	pushl	$97
  282183: 6a 20                        	pushl	$32
  282185: e8 bc ef ff ff               	calll	-4164 <io_out8>
  28218a: 83 c4 10                     	addl	$16, %esp
  28218d: 83 ec 0c                     	subl	$12, %esp
  282190: 6a 60                        	pushl	$96
  282192: e8 92 ef ff ff               	calll	-4206 <io_in8>
  282197: 83 c4 10                     	addl	$16, %esp
  28219a: 89 45 f4                     	movl	%eax, -12(%ebp)
  28219d: 8b 15 44 21 32 00            	movl	3285316, %edx
  2821a3: 8b 45 f4                     	movl	-12(%ebp), %eax
  2821a6: 01 c2                        	addl	%eax, %edx
  2821a8: a1 40 21 32 00               	movl	3285312, %eax
  2821ad: 83 ec 08                     	subl	$8, %esp
  2821b0: 52                           	pushl	%edx
  2821b1: 50                           	pushl	%eax
  2821b2: e8 90 fe ff ff               	calll	-368 <fifo32_put>
  2821b7: 83 c4 10                     	addl	$16, %esp
  2821ba: 90                           	nop
  2821bb: c9                           	leave
  2821bc: c3                           	retl

002821bd wait_KBC_sendready:
  2821bd: 55                           	pushl	%ebp
  2821be: 89 e5                        	movl	%esp, %ebp
  2821c0: 83 ec 08                     	subl	$8, %esp
  2821c3: 83 ec 0c                     	subl	$12, %esp
  2821c6: 6a 64                        	pushl	$100
  2821c8: e8 5c ef ff ff               	calll	-4260 <io_in8>
  2821cd: 83 c4 10                     	addl	$16, %esp
  2821d0: 83 e0 02                     	andl	$2, %eax
  2821d3: 85 c0                        	testl	%eax, %eax
  2821d5: 74 02                        	je	2 <wait_KBC_sendready+0x1c>
  2821d7: eb ea                        	jmp	-22 <wait_KBC_sendready+0x6>
  2821d9: 90                           	nop
  2821da: 90                           	nop
  2821db: c9                           	leave
  2821dc: c3                           	retl

002821dd init_keyboard:
  2821dd: 55                           	pushl	%ebp
  2821de: 89 e5                        	movl	%esp, %ebp
  2821e0: 83 ec 08                     	subl	$8, %esp
  2821e3: 8b 45 08                     	movl	8(%ebp), %eax
  2821e6: a3 40 21 32 00               	movl	%eax, 3285312
  2821eb: 8b 45 0c                     	movl	12(%ebp), %eax
  2821ee: a3 44 21 32 00               	movl	%eax, 3285316
  2821f3: e8 c5 ff ff ff               	calll	-59 <wait_KBC_sendready>
  2821f8: 83 ec 08                     	subl	$8, %esp
  2821fb: 6a 60                        	pushl	$96
  2821fd: 6a 64                        	pushl	$100
  2821ff: e8 42 ef ff ff               	calll	-4286 <io_out8>
  282204: 83 c4 10                     	addl	$16, %esp
  282207: e8 b1 ff ff ff               	calll	-79 <wait_KBC_sendready>
  28220c: 83 ec 08                     	subl	$8, %esp
  28220f: 6a 47                        	pushl	$71
  282211: 6a 60                        	pushl	$96
  282213: e8 2e ef ff ff               	calll	-4306 <io_out8>
  282218: 83 c4 10                     	addl	$16, %esp
  28221b: 90                           	nop
  28221c: c9                           	leave
  28221d: c3                           	retl

0028221e inthandler2c:
  28221e: 55                           	pushl	%ebp
  28221f: 89 e5                        	movl	%esp, %ebp
  282221: 83 ec 18                     	subl	$24, %esp
  282224: 83 ec 08                     	subl	$8, %esp
  282227: 6a 64                        	pushl	$100
  282229: 68 a0 00 00 00               	pushl	$160
  28222e: e8 13 ef ff ff               	calll	-4333 <io_out8>
  282233: 83 c4 10                     	addl	$16, %esp
  282236: 83 ec 08                     	subl	$8, %esp
  282239: 6a 62                        	pushl	$98
  28223b: 6a 20                        	pushl	$32
  28223d: e8 04 ef ff ff               	calll	-4348 <io_out8>
  282242: 83 c4 10                     	addl	$16, %esp
  282245: 83 ec 0c                     	subl	$12, %esp
  282248: 6a 60                        	pushl	$96
  28224a: e8 da ee ff ff               	calll	-4390 <io_in8>
  28224f: 83 c4 10                     	addl	$16, %esp
  282252: 89 45 f4                     	movl	%eax, -12(%ebp)
  282255: 8b 15 48 21 32 00            	movl	3285320, %edx
  28225b: 8b 45 f4                     	movl	-12(%ebp), %eax
  28225e: 01 c2                        	addl	%eax, %edx
  282260: a1 4c 21 32 00               	movl	3285324, %eax
  282265: 83 ec 08                     	subl	$8, %esp
  282268: 52                           	pushl	%edx
  282269: 50                           	pushl	%eax
  28226a: e8 d8 fd ff ff               	calll	-552 <fifo32_put>
  28226f: 83 c4 10                     	addl	$16, %esp
  282272: 90                           	nop
  282273: c9                           	leave
  282274: c3                           	retl

00282275 enable_mouse:
  282275: 55                           	pushl	%ebp
  282276: 89 e5                        	movl	%esp, %ebp
  282278: 83 ec 08                     	subl	$8, %esp
  28227b: 8b 45 08                     	movl	8(%ebp), %eax
  28227e: a3 4c 21 32 00               	movl	%eax, 3285324
  282283: 8b 45 0c                     	movl	12(%ebp), %eax
  282286: a3 48 21 32 00               	movl	%eax, 3285320
  28228b: e8 2d ff ff ff               	calll	-211 <wait_KBC_sendready>
  282290: 83 ec 08                     	subl	$8, %esp
  282293: 68 d4 00 00 00               	pushl	$212
  282298: 6a 64                        	pushl	$100
  28229a: e8 a7 ee ff ff               	calll	-4441 <io_out8>
  28229f: 83 c4 10                     	addl	$16, %esp
  2822a2: e8 16 ff ff ff               	calll	-234 <wait_KBC_sendready>
  2822a7: 83 ec 08                     	subl	$8, %esp
  2822aa: 68 f4 00 00 00               	pushl	$244
  2822af: 6a 60                        	pushl	$96
  2822b1: e8 90 ee ff ff               	calll	-4464 <io_out8>
  2822b6: 83 c4 10                     	addl	$16, %esp
  2822b9: 8b 45 10                     	movl	16(%ebp), %eax
  2822bc: c6 40 03 00                  	movb	$0, 3(%eax)
  2822c0: 90                           	nop
  2822c1: c9                           	leave
  2822c2: c3                           	retl

002822c3 mouse_decode:
  2822c3: 55                           	pushl	%ebp
  2822c4: 89 e5                        	movl	%esp, %ebp
  2822c6: 83 ec 04                     	subl	$4, %esp
  2822c9: 8b 45 0c                     	movl	12(%ebp), %eax
  2822cc: 88 45 fc                     	movb	%al, -4(%ebp)
  2822cf: 8b 45 08                     	movl	8(%ebp), %eax
  2822d2: 0f b6 40 03                  	movzbl	3(%eax), %eax
  2822d6: 84 c0                        	testb	%al, %al
  2822d8: 75 17                        	jne	23 <mouse_decode+0x2e>
  2822da: 80 7d fc fa                  	cmpb	$-6, -4(%ebp)
  2822de: 75 07                        	jne	7 <mouse_decode+0x24>
  2822e0: 8b 45 08                     	movl	8(%ebp), %eax
  2822e3: c6 40 03 01                  	movb	$1, 3(%eax)
  2822e7: b8 00 00 00 00               	movl	$0, %eax
  2822ec: e9 0f 01 00 00               	jmp	271 <mouse_decode+0x13d>
  2822f1: 8b 45 08                     	movl	8(%ebp), %eax
  2822f4: 0f b6 40 03                  	movzbl	3(%eax), %eax
  2822f8: 3c 01                        	cmpb	$1, %al
  2822fa: 75 28                        	jne	40 <mouse_decode+0x61>
  2822fc: 0f b6 45 fc                  	movzbl	-4(%ebp), %eax
  282300: 25 c8 00 00 00               	andl	$200, %eax
  282305: 83 f8 08                     	cmpl	$8, %eax
  282308: 75 10                        	jne	16 <mouse_decode+0x57>
  28230a: 8b 45 08                     	movl	8(%ebp), %eax
  28230d: 0f b6 55 fc                  	movzbl	-4(%ebp), %edx
  282311: 88 10                        	movb	%dl, (%eax)
  282313: 8b 45 08                     	movl	8(%ebp), %eax
  282316: c6 40 03 02                  	movb	$2, 3(%eax)
  28231a: b8 00 00 00 00               	movl	$0, %eax
  28231f: e9 dc 00 00 00               	jmp	220 <mouse_decode+0x13d>
  282324: 8b 45 08                     	movl	8(%ebp), %eax
  282327: 0f b6 40 03                  	movzbl	3(%eax), %eax
  28232b: 3c 02                        	cmpb	$2, %al
  28232d: 75 1b                        	jne	27 <mouse_decode+0x87>
  28232f: 8b 45 08                     	movl	8(%ebp), %eax
  282332: 0f b6 55 fc                  	movzbl	-4(%ebp), %edx
  282336: 88 50 01                     	movb	%dl, 1(%eax)
  282339: 8b 45 08                     	movl	8(%ebp), %eax
  28233c: c6 40 03 03                  	movb	$3, 3(%eax)
  282340: b8 00 00 00 00               	movl	$0, %eax
  282345: e9 b6 00 00 00               	jmp	182 <mouse_decode+0x13d>
  28234a: 8b 45 08                     	movl	8(%ebp), %eax
  28234d: 0f b6 40 03                  	movzbl	3(%eax), %eax
  282351: 3c 03                        	cmpb	$3, %al
  282353: 0f 85 a2 00 00 00            	jne	162 <mouse_decode+0x138>
  282359: 8b 45 08                     	movl	8(%ebp), %eax
  28235c: 0f b6 55 fc                  	movzbl	-4(%ebp), %edx
  282360: 88 50 02                     	movb	%dl, 2(%eax)
  282363: 8b 45 08                     	movl	8(%ebp), %eax
  282366: c6 40 03 01                  	movb	$1, 3(%eax)
  28236a: 8b 45 08                     	movl	8(%ebp), %eax
  28236d: 0f b6 00                     	movzbl	(%eax), %eax
  282370: 0f b6 c0                     	movzbl	%al, %eax
  282373: 83 e0 07                     	andl	$7, %eax
  282376: 89 c2                        	movl	%eax, %edx
  282378: 8b 45 08                     	movl	8(%ebp), %eax
  28237b: 89 50 0c                     	movl	%edx, 12(%eax)
  28237e: 8b 45 08                     	movl	8(%ebp), %eax
  282381: 0f b6 40 01                  	movzbl	1(%eax), %eax
  282385: 0f b6 d0                     	movzbl	%al, %edx
  282388: 8b 45 08                     	movl	8(%ebp), %eax
  28238b: 89 50 04                     	movl	%edx, 4(%eax)
  28238e: 8b 45 08                     	movl	8(%ebp), %eax
  282391: 0f b6 40 02                  	movzbl	2(%eax), %eax
  282395: 0f b6 d0                     	movzbl	%al, %edx
  282398: 8b 45 08                     	movl	8(%ebp), %eax
  28239b: 89 50 08                     	movl	%edx, 8(%eax)
  28239e: 8b 45 08                     	movl	8(%ebp), %eax
  2823a1: 0f b6 00                     	movzbl	(%eax), %eax
  2823a4: 0f b6 c0                     	movzbl	%al, %eax
  2823a7: 83 e0 10                     	andl	$16, %eax
  2823aa: 85 c0                        	testl	%eax, %eax
  2823ac: 74 13                        	je	19 <mouse_decode+0xfe>
  2823ae: 8b 45 08                     	movl	8(%ebp), %eax
  2823b1: 8b 40 04                     	movl	4(%eax), %eax
  2823b4: 0d 00 ff ff ff               	orl	$4294967040, %eax
  2823b9: 89 c2                        	movl	%eax, %edx
  2823bb: 8b 45 08                     	movl	8(%ebp), %eax
  2823be: 89 50 04                     	movl	%edx, 4(%eax)
  2823c1: 8b 45 08                     	movl	8(%ebp), %eax
  2823c4: 0f b6 00                     	movzbl	(%eax), %eax
  2823c7: 0f b6 c0                     	movzbl	%al, %eax
  2823ca: 83 e0 20                     	andl	$32, %eax
  2823cd: 85 c0                        	testl	%eax, %eax
  2823cf: 74 13                        	je	19 <mouse_decode+0x121>
  2823d1: 8b 45 08                     	movl	8(%ebp), %eax
  2823d4: 8b 40 08                     	movl	8(%eax), %eax
  2823d7: 0d 00 ff ff ff               	orl	$4294967040, %eax
  2823dc: 89 c2                        	movl	%eax, %edx
  2823de: 8b 45 08                     	movl	8(%ebp), %eax
  2823e1: 89 50 08                     	movl	%edx, 8(%eax)
  2823e4: 8b 45 08                     	movl	8(%ebp), %eax
  2823e7: 8b 40 08                     	movl	8(%eax), %eax
  2823ea: f7 d8                        	negl	%eax
  2823ec: 89 c2                        	movl	%eax, %edx
  2823ee: 8b 45 08                     	movl	8(%ebp), %eax
  2823f1: 89 50 08                     	movl	%edx, 8(%eax)
  2823f4: b8 01 00 00 00               	movl	$1, %eax
  2823f9: eb 05                        	jmp	5 <mouse_decode+0x13d>
  2823fb: b8 ff ff ff ff               	movl	$4294967295, %eax
  282400: c9                           	leave
  282401: c3                           	retl

00282402 memtest:
  282402: 55                           	pushl	%ebp
  282403: 89 e5                        	movl	%esp, %ebp
  282405: 83 ec 18                     	subl	$24, %esp
  282408: c6 45 f7 00                  	movb	$0, -9(%ebp)
  28240c: e8 54 ed ff ff               	calll	-4780 <io_load_eflags>
  282411: 89 45 f0                     	movl	%eax, -16(%ebp)
  282414: 81 4d f0 00 00 04 00         	orl	$262144, -16(%ebp)
  28241b: 8b 45 f0                     	movl	-16(%ebp), %eax
  28241e: 83 ec 0c                     	subl	$12, %esp
  282421: 50                           	pushl	%eax
  282422: e8 41 ed ff ff               	calll	-4799 <io_store_eflags>
  282427: 83 c4 10                     	addl	$16, %esp
  28242a: e8 36 ed ff ff               	calll	-4810 <io_load_eflags>
  28242f: 89 45 f0                     	movl	%eax, -16(%ebp)
  282432: 8b 45 f0                     	movl	-16(%ebp), %eax
  282435: 25 00 00 04 00               	andl	$262144, %eax
  28243a: 85 c0                        	testl	%eax, %eax
  28243c: 74 04                        	je	4 <memtest+0x40>
  28243e: c6 45 f7 01                  	movb	$1, -9(%ebp)
  282442: 81 65 f0 ff ff fb ff         	andl	$4294705151, -16(%ebp)
  282449: 8b 45 f0                     	movl	-16(%ebp), %eax
  28244c: 83 ec 0c                     	subl	$12, %esp
  28244f: 50                           	pushl	%eax
  282450: e8 13 ed ff ff               	calll	-4845 <io_store_eflags>
  282455: 83 c4 10                     	addl	$16, %esp
  282458: 80 7d f7 00                  	cmpb	$0, -9(%ebp)
  28245c: 74 1e                        	je	30 <memtest+0x7a>
  28245e: e8 2c ed ff ff               	calll	-4820 <load_cr0>
  282463: 89 45 ec                     	movl	%eax, -20(%ebp)
  282466: 81 4d ec 00 00 00 60         	orl	$1610612736, -20(%ebp)
  28246d: 8b 45 ec                     	movl	-20(%ebp), %eax
  282470: 83 ec 0c                     	subl	$12, %esp
  282473: 50                           	pushl	%eax
  282474: e8 1a ed ff ff               	calll	-4838 <store_cr0>
  282479: 83 c4 10                     	addl	$16, %esp
  28247c: 83 ec 08                     	subl	$8, %esp
  28247f: ff 75 0c                     	pushl	12(%ebp)
  282482: ff 75 08                     	pushl	8(%ebp)
  282485: e8 a0 ed ff ff               	calll	-4704 <memtest_sub>
  28248a: 83 c4 10                     	addl	$16, %esp
  28248d: 89 45 e8                     	movl	%eax, -24(%ebp)
  282490: 80 7d f7 00                  	cmpb	$0, -9(%ebp)
  282494: 74 1e                        	je	30 <memtest+0xb2>
  282496: e8 f4 ec ff ff               	calll	-4876 <load_cr0>
  28249b: 89 45 ec                     	movl	%eax, -20(%ebp)
  28249e: 81 65 ec ff ff ff 9f         	andl	$2684354559, -20(%ebp)
  2824a5: 8b 45 ec                     	movl	-20(%ebp), %eax
  2824a8: 83 ec 0c                     	subl	$12, %esp
  2824ab: 50                           	pushl	%eax
  2824ac: e8 e2 ec ff ff               	calll	-4894 <store_cr0>
  2824b1: 83 c4 10                     	addl	$16, %esp
  2824b4: 8b 45 e8                     	movl	-24(%ebp), %eax
  2824b7: c9                           	leave
  2824b8: c3                           	retl

002824b9 memman_init:
  2824b9: 55                           	pushl	%ebp
  2824ba: 89 e5                        	movl	%esp, %ebp
  2824bc: 8b 45 08                     	movl	8(%ebp), %eax
  2824bf: c7 00 00 00 00 00            	movl	$0, (%eax)
  2824c5: 8b 45 08                     	movl	8(%ebp), %eax
  2824c8: c7 40 04 00 00 00 00         	movl	$0, 4(%eax)
  2824cf: 8b 45 08                     	movl	8(%ebp), %eax
  2824d2: c7 40 08 00 00 00 00         	movl	$0, 8(%eax)
  2824d9: 8b 45 08                     	movl	8(%ebp), %eax
  2824dc: c7 40 0c 00 00 00 00         	movl	$0, 12(%eax)
  2824e3: 90                           	nop
  2824e4: 5d                           	popl	%ebp
  2824e5: c3                           	retl

002824e6 memman_total:
  2824e6: 55                           	pushl	%ebp
  2824e7: 89 e5                        	movl	%esp, %ebp
  2824e9: 83 ec 10                     	subl	$16, %esp
  2824ec: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  2824f3: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  2824fa: eb 14                        	jmp	20 <memman_total+0x2a>
  2824fc: 8b 45 08                     	movl	8(%ebp), %eax
  2824ff: 8b 55 fc                     	movl	-4(%ebp), %edx
  282502: 83 c2 02                     	addl	$2, %edx
  282505: 8b 44 d0 04                  	movl	4(%eax,%edx,8), %eax
  282509: 01 45 f8                     	addl	%eax, -8(%ebp)
  28250c: 83 45 fc 01                  	addl	$1, -4(%ebp)
  282510: 8b 45 08                     	movl	8(%ebp), %eax
  282513: 8b 00                        	movl	(%eax), %eax
  282515: 39 45 fc                     	cmpl	%eax, -4(%ebp)
  282518: 72 e2                        	jb	-30 <memman_total+0x16>
  28251a: 8b 45 f8                     	movl	-8(%ebp), %eax
  28251d: c9                           	leave
  28251e: c3                           	retl

0028251f memman_alloc:
  28251f: 55                           	pushl	%ebp
  282520: 89 e5                        	movl	%esp, %ebp
  282522: 53                           	pushl	%ebx
  282523: 83 ec 10                     	subl	$16, %esp
  282526: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  28252d: e9 bd 00 00 00               	jmp	189 <memman_alloc+0xd0>
  282532: 8b 45 08                     	movl	8(%ebp), %eax
  282535: 8b 55 f8                     	movl	-8(%ebp), %edx
  282538: 83 c2 02                     	addl	$2, %edx
  28253b: 8b 44 d0 04                  	movl	4(%eax,%edx,8), %eax
  28253f: 39 45 0c                     	cmpl	%eax, 12(%ebp)
  282542: 0f 87 a3 00 00 00            	ja	163 <memman_alloc+0xcc>
  282548: 8b 45 08                     	movl	8(%ebp), %eax
  28254b: 8b 55 f8                     	movl	-8(%ebp), %edx
  28254e: 83 c2 02                     	addl	$2, %edx
  282551: 8b 04 d0                     	movl	(%eax,%edx,8), %eax
  282554: 89 45 f4                     	movl	%eax, -12(%ebp)
  282557: 8b 45 08                     	movl	8(%ebp), %eax
  28255a: 8b 55 f8                     	movl	-8(%ebp), %edx
  28255d: 83 c2 02                     	addl	$2, %edx
  282560: 8b 14 d0                     	movl	(%eax,%edx,8), %edx
  282563: 8b 45 0c                     	movl	12(%ebp), %eax
  282566: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  282569: 8b 45 08                     	movl	8(%ebp), %eax
  28256c: 8b 55 f8                     	movl	-8(%ebp), %edx
  28256f: 83 c2 02                     	addl	$2, %edx
  282572: 89 0c d0                     	movl	%ecx, (%eax,%edx,8)
  282575: 8b 45 08                     	movl	8(%ebp), %eax
  282578: 8b 55 f8                     	movl	-8(%ebp), %edx
  28257b: 83 c2 02                     	addl	$2, %edx
  28257e: 8b 44 d0 04                  	movl	4(%eax,%edx,8), %eax
  282582: 2b 45 0c                     	subl	12(%ebp), %eax
  282585: 89 c2                        	movl	%eax, %edx
  282587: 8b 45 08                     	movl	8(%ebp), %eax
  28258a: 8b 4d f8                     	movl	-8(%ebp), %ecx
  28258d: 83 c1 02                     	addl	$2, %ecx
  282590: 89 54 c8 04                  	movl	%edx, 4(%eax,%ecx,8)
  282594: 8b 45 08                     	movl	8(%ebp), %eax
  282597: 8b 55 f8                     	movl	-8(%ebp), %edx
  28259a: 83 c2 02                     	addl	$2, %edx
  28259d: 8b 44 d0 04                  	movl	4(%eax,%edx,8), %eax
  2825a1: 85 c0                        	testl	%eax, %eax
  2825a3: 75 41                        	jne	65 <memman_alloc+0xc7>
  2825a5: 8b 45 08                     	movl	8(%ebp), %eax
  2825a8: 8b 00                        	movl	(%eax), %eax
  2825aa: 8d 50 ff                     	leal	-1(%eax), %edx
  2825ad: 8b 45 08                     	movl	8(%ebp), %eax
  2825b0: 89 10                        	movl	%edx, (%eax)
  2825b2: eb 28                        	jmp	40 <memman_alloc+0xbd>
  2825b4: 8b 45 f8                     	movl	-8(%ebp), %eax
  2825b7: 8d 50 01                     	leal	1(%eax), %edx
  2825ba: 8b 4d 08                     	movl	8(%ebp), %ecx
  2825bd: 8b 45 f8                     	movl	-8(%ebp), %eax
  2825c0: 8d 58 02                     	leal	2(%eax), %ebx
  2825c3: 8b 45 08                     	movl	8(%ebp), %eax
  2825c6: 83 c2 02                     	addl	$2, %edx
  2825c9: 8d 14 d0                     	leal	(%eax,%edx,8), %edx
  2825cc: 8b 02                        	movl	(%edx), %eax
  2825ce: 8b 52 04                     	movl	4(%edx), %edx
  2825d1: 89 04 d9                     	movl	%eax, (%ecx,%ebx,8)
  2825d4: 89 54 d9 04                  	movl	%edx, 4(%ecx,%ebx,8)
  2825d8: 83 45 f8 01                  	addl	$1, -8(%ebp)
  2825dc: 8b 45 08                     	movl	8(%ebp), %eax
  2825df: 8b 00                        	movl	(%eax), %eax
  2825e1: 39 45 f8                     	cmpl	%eax, -8(%ebp)
  2825e4: 72 ce                        	jb	-50 <memman_alloc+0x95>
  2825e6: 8b 45 f4                     	movl	-12(%ebp), %eax
  2825e9: eb 17                        	jmp	23 <memman_alloc+0xe3>
  2825eb: 83 45 f8 01                  	addl	$1, -8(%ebp)
  2825ef: 8b 45 08                     	movl	8(%ebp), %eax
  2825f2: 8b 00                        	movl	(%eax), %eax
  2825f4: 39 45 f8                     	cmpl	%eax, -8(%ebp)
  2825f7: 0f 82 35 ff ff ff            	jb	-203 <memman_alloc+0x13>
  2825fd: b8 00 00 00 00               	movl	$0, %eax
  282602: 83 c4 10                     	addl	$16, %esp
  282605: 5b                           	popl	%ebx
  282606: 5d                           	popl	%ebp
  282607: c3                           	retl

00282608 memman_free:
  282608: 55                           	pushl	%ebp
  282609: 89 e5                        	movl	%esp, %ebp
  28260b: 53                           	pushl	%ebx
  28260c: 83 ec 10                     	subl	$16, %esp
  28260f: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  282616: eb 15                        	jmp	21 <memman_free+0x25>
  282618: 8b 45 08                     	movl	8(%ebp), %eax
  28261b: 8b 55 f8                     	movl	-8(%ebp), %edx
  28261e: 83 c2 02                     	addl	$2, %edx
  282621: 8b 04 d0                     	movl	(%eax,%edx,8), %eax
  282624: 39 45 0c                     	cmpl	%eax, 12(%ebp)
  282627: 72 10                        	jb	16 <memman_free+0x31>
  282629: 83 45 f8 01                  	addl	$1, -8(%ebp)
  28262d: 8b 45 08                     	movl	8(%ebp), %eax
  282630: 8b 00                        	movl	(%eax), %eax
  282632: 39 45 f8                     	cmpl	%eax, -8(%ebp)
  282635: 7c e1                        	jl	-31 <memman_free+0x10>
  282637: eb 01                        	jmp	1 <memman_free+0x32>
  282639: 90                           	nop
  28263a: 83 7d f8 00                  	cmpl	$0, -8(%ebp)
  28263e: 0f 8e f2 00 00 00            	jle	242 <memman_free+0x12e>
  282644: 8b 45 f8                     	movl	-8(%ebp), %eax
  282647: 8d 50 ff                     	leal	-1(%eax), %edx
  28264a: 8b 45 08                     	movl	8(%ebp), %eax
  28264d: 83 c2 02                     	addl	$2, %edx
  282650: 8b 14 d0                     	movl	(%eax,%edx,8), %edx
  282653: 8b 45 f8                     	movl	-8(%ebp), %eax
  282656: 8d 48 ff                     	leal	-1(%eax), %ecx
  282659: 8b 45 08                     	movl	8(%ebp), %eax
  28265c: 83 c1 02                     	addl	$2, %ecx
  28265f: 8b 44 c8 04                  	movl	4(%eax,%ecx,8), %eax
  282663: 01 d0                        	addl	%edx, %eax
  282665: 39 45 0c                     	cmpl	%eax, 12(%ebp)
  282668: 0f 85 c8 00 00 00            	jne	200 <memman_free+0x12e>
  28266e: 8b 45 f8                     	movl	-8(%ebp), %eax
  282671: 8d 50 ff                     	leal	-1(%eax), %edx
  282674: 8b 45 08                     	movl	8(%ebp), %eax
  282677: 83 c2 02                     	addl	$2, %edx
  28267a: 8b 54 d0 04                  	movl	4(%eax,%edx,8), %edx
  28267e: 8b 45 f8                     	movl	-8(%ebp), %eax
  282681: 8d 58 ff                     	leal	-1(%eax), %ebx
  282684: 8b 45 10                     	movl	16(%ebp), %eax
  282687: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  28268a: 8b 45 08                     	movl	8(%ebp), %eax
  28268d: 8d 53 02                     	leal	2(%ebx), %edx
  282690: 89 4c d0 04                  	movl	%ecx, 4(%eax,%edx,8)
  282694: 8b 45 08                     	movl	8(%ebp), %eax
  282697: 8b 00                        	movl	(%eax), %eax
  282699: 39 45 f8                     	cmpl	%eax, -8(%ebp)
  28269c: 0f 8d 8a 00 00 00            	jge	138 <memman_free+0x124>
  2826a2: 8b 55 0c                     	movl	12(%ebp), %edx
  2826a5: 8b 45 10                     	movl	16(%ebp), %eax
  2826a8: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  2826ab: 8b 45 08                     	movl	8(%ebp), %eax
  2826ae: 8b 55 f8                     	movl	-8(%ebp), %edx
  2826b1: 83 c2 02                     	addl	$2, %edx
  2826b4: 8b 04 d0                     	movl	(%eax,%edx,8), %eax
  2826b7: 39 c1                        	cmpl	%eax, %ecx
  2826b9: 75 71                        	jne	113 <memman_free+0x124>
  2826bb: 8b 45 f8                     	movl	-8(%ebp), %eax
  2826be: 8d 50 ff                     	leal	-1(%eax), %edx
  2826c1: 8b 45 08                     	movl	8(%ebp), %eax
  2826c4: 83 c2 02                     	addl	$2, %edx
  2826c7: 8b 54 d0 04                  	movl	4(%eax,%edx,8), %edx
  2826cb: 8b 45 08                     	movl	8(%ebp), %eax
  2826ce: 8b 4d f8                     	movl	-8(%ebp), %ecx
  2826d1: 83 c1 02                     	addl	$2, %ecx
  2826d4: 8b 44 c8 04                  	movl	4(%eax,%ecx,8), %eax
  2826d8: 8b 4d f8                     	movl	-8(%ebp), %ecx
  2826db: 8d 59 ff                     	leal	-1(%ecx), %ebx
  2826de: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  2826e1: 8b 45 08                     	movl	8(%ebp), %eax
  2826e4: 8d 53 02                     	leal	2(%ebx), %edx
  2826e7: 89 4c d0 04                  	movl	%ecx, 4(%eax,%edx,8)
  2826eb: 8b 45 08                     	movl	8(%ebp), %eax
  2826ee: 8b 00                        	movl	(%eax), %eax
  2826f0: 8d 50 ff                     	leal	-1(%eax), %edx
  2826f3: 8b 45 08                     	movl	8(%ebp), %eax
  2826f6: 89 10                        	movl	%edx, (%eax)
  2826f8: eb 28                        	jmp	40 <memman_free+0x11a>
  2826fa: 8b 45 f8                     	movl	-8(%ebp), %eax
  2826fd: 8d 50 01                     	leal	1(%eax), %edx
  282700: 8b 4d 08                     	movl	8(%ebp), %ecx
  282703: 8b 45 f8                     	movl	-8(%ebp), %eax
  282706: 8d 58 02                     	leal	2(%eax), %ebx
  282709: 8b 45 08                     	movl	8(%ebp), %eax
  28270c: 83 c2 02                     	addl	$2, %edx
  28270f: 8d 14 d0                     	leal	(%eax,%edx,8), %edx
  282712: 8b 02                        	movl	(%edx), %eax
  282714: 8b 52 04                     	movl	4(%edx), %edx
  282717: 89 04 d9                     	movl	%eax, (%ecx,%ebx,8)
  28271a: 89 54 d9 04                  	movl	%edx, 4(%ecx,%ebx,8)
  28271e: 83 45 f8 01                  	addl	$1, -8(%ebp)
  282722: 8b 45 08                     	movl	8(%ebp), %eax
  282725: 8b 00                        	movl	(%eax), %eax
  282727: 39 45 f8                     	cmpl	%eax, -8(%ebp)
  28272a: 7c ce                        	jl	-50 <memman_free+0xf2>
  28272c: b8 00 00 00 00               	movl	$0, %eax
  282731: e9 1c 01 00 00               	jmp	284 <memman_free+0x24a>
  282736: 8b 45 08                     	movl	8(%ebp), %eax
  282739: 8b 00                        	movl	(%eax), %eax
  28273b: 39 45 f8                     	cmpl	%eax, -8(%ebp)
  28273e: 7d 52                        	jge	82 <memman_free+0x18a>
  282740: 8b 55 0c                     	movl	12(%ebp), %edx
  282743: 8b 45 10                     	movl	16(%ebp), %eax
  282746: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  282749: 8b 45 08                     	movl	8(%ebp), %eax
  28274c: 8b 55 f8                     	movl	-8(%ebp), %edx
  28274f: 83 c2 02                     	addl	$2, %edx
  282752: 8b 04 d0                     	movl	(%eax,%edx,8), %eax
  282755: 39 c1                        	cmpl	%eax, %ecx
  282757: 75 39                        	jne	57 <memman_free+0x18a>
  282759: 8b 45 08                     	movl	8(%ebp), %eax
  28275c: 8b 55 f8                     	movl	-8(%ebp), %edx
  28275f: 8d 4a 02                     	leal	2(%edx), %ecx
  282762: 8b 55 0c                     	movl	12(%ebp), %edx
  282765: 89 14 c8                     	movl	%edx, (%eax,%ecx,8)
  282768: 8b 45 08                     	movl	8(%ebp), %eax
  28276b: 8b 55 f8                     	movl	-8(%ebp), %edx
  28276e: 83 c2 02                     	addl	$2, %edx
  282771: 8b 54 d0 04                  	movl	4(%eax,%edx,8), %edx
  282775: 8b 45 10                     	movl	16(%ebp), %eax
  282778: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  28277b: 8b 45 08                     	movl	8(%ebp), %eax
  28277e: 8b 55 f8                     	movl	-8(%ebp), %edx
  282781: 83 c2 02                     	addl	$2, %edx
  282784: 89 4c d0 04                  	movl	%ecx, 4(%eax,%edx,8)
  282788: b8 00 00 00 00               	movl	$0, %eax
  28278d: e9 c0 00 00 00               	jmp	192 <memman_free+0x24a>
  282792: 8b 45 08                     	movl	8(%ebp), %eax
  282795: 8b 00                        	movl	(%eax), %eax
  282797: 3d f9 0f 00 00               	cmpl	$4089, %eax
  28279c: 0f 8f 87 00 00 00            	jg	135 <memman_free+0x221>
  2827a2: 8b 45 08                     	movl	8(%ebp), %eax
  2827a5: 8b 00                        	movl	(%eax), %eax
  2827a7: 89 45 f4                     	movl	%eax, -12(%ebp)
  2827aa: eb 28                        	jmp	40 <memman_free+0x1cc>
  2827ac: 8b 45 f4                     	movl	-12(%ebp), %eax
  2827af: 8d 50 ff                     	leal	-1(%eax), %edx
  2827b2: 8b 4d 08                     	movl	8(%ebp), %ecx
  2827b5: 8b 45 f4                     	movl	-12(%ebp), %eax
  2827b8: 8d 58 02                     	leal	2(%eax), %ebx
  2827bb: 8b 45 08                     	movl	8(%ebp), %eax
  2827be: 83 c2 02                     	addl	$2, %edx
  2827c1: 8d 14 d0                     	leal	(%eax,%edx,8), %edx
  2827c4: 8b 02                        	movl	(%edx), %eax
  2827c6: 8b 52 04                     	movl	4(%edx), %edx
  2827c9: 89 04 d9                     	movl	%eax, (%ecx,%ebx,8)
  2827cc: 89 54 d9 04                  	movl	%edx, 4(%ecx,%ebx,8)
  2827d0: 83 6d f4 01                  	subl	$1, -12(%ebp)
  2827d4: 8b 45 f4                     	movl	-12(%ebp), %eax
  2827d7: 3b 45 f8                     	cmpl	-8(%ebp), %eax
  2827da: 7f d0                        	jg	-48 <memman_free+0x1a4>
  2827dc: 8b 45 08                     	movl	8(%ebp), %eax
  2827df: 8b 00                        	movl	(%eax), %eax
  2827e1: 8d 50 01                     	leal	1(%eax), %edx
  2827e4: 8b 45 08                     	movl	8(%ebp), %eax
  2827e7: 89 10                        	movl	%edx, (%eax)
  2827e9: 8b 45 08                     	movl	8(%ebp), %eax
  2827ec: 8b 50 04                     	movl	4(%eax), %edx
  2827ef: 8b 45 08                     	movl	8(%ebp), %eax
  2827f2: 8b 00                        	movl	(%eax), %eax
  2827f4: 39 c2                        	cmpl	%eax, %edx
  2827f6: 7d 0b                        	jge	11 <memman_free+0x1fb>
  2827f8: 8b 45 08                     	movl	8(%ebp), %eax
  2827fb: 8b 10                        	movl	(%eax), %edx
  2827fd: 8b 45 08                     	movl	8(%ebp), %eax
  282800: 89 50 04                     	movl	%edx, 4(%eax)
  282803: 8b 45 08                     	movl	8(%ebp), %eax
  282806: 8b 55 f8                     	movl	-8(%ebp), %edx
  282809: 8d 4a 02                     	leal	2(%edx), %ecx
  28280c: 8b 55 0c                     	movl	12(%ebp), %edx
  28280f: 89 14 c8                     	movl	%edx, (%eax,%ecx,8)
  282812: 8b 45 08                     	movl	8(%ebp), %eax
  282815: 8b 55 f8                     	movl	-8(%ebp), %edx
  282818: 8d 4a 02                     	leal	2(%edx), %ecx
  28281b: 8b 55 10                     	movl	16(%ebp), %edx
  28281e: 89 54 c8 04                  	movl	%edx, 4(%eax,%ecx,8)
  282822: b8 00 00 00 00               	movl	$0, %eax
  282827: eb 29                        	jmp	41 <memman_free+0x24a>
  282829: 8b 45 08                     	movl	8(%ebp), %eax
  28282c: 8b 40 0c                     	movl	12(%eax), %eax
  28282f: 8d 50 01                     	leal	1(%eax), %edx
  282832: 8b 45 08                     	movl	8(%ebp), %eax
  282835: 89 50 0c                     	movl	%edx, 12(%eax)
  282838: 8b 45 08                     	movl	8(%ebp), %eax
  28283b: 8b 40 08                     	movl	8(%eax), %eax
  28283e: 89 c2                        	movl	%eax, %edx
  282840: 8b 45 10                     	movl	16(%ebp), %eax
  282843: 01 d0                        	addl	%edx, %eax
  282845: 89 c2                        	movl	%eax, %edx
  282847: 8b 45 08                     	movl	8(%ebp), %eax
  28284a: 89 50 08                     	movl	%edx, 8(%eax)
  28284d: b8 ff ff ff ff               	movl	$4294967295, %eax
  282852: 83 c4 10                     	addl	$16, %esp
  282855: 5b                           	popl	%ebx
  282856: 5d                           	popl	%ebp
  282857: c3                           	retl

00282858 memman_alloc_4k:
  282858: 55                           	pushl	%ebp
  282859: 89 e5                        	movl	%esp, %ebp
  28285b: 83 ec 10                     	subl	$16, %esp
  28285e: 8b 45 0c                     	movl	12(%ebp), %eax
  282861: 05 ff 0f 00 00               	addl	$4095, %eax
  282866: 25 00 f0 ff ff               	andl	$4294963200, %eax
  28286b: 89 45 0c                     	movl	%eax, 12(%ebp)
  28286e: ff 75 0c                     	pushl	12(%ebp)
  282871: ff 75 08                     	pushl	8(%ebp)
  282874: e8 a6 fc ff ff               	calll	-858 <memman_alloc>
  282879: 83 c4 08                     	addl	$8, %esp
  28287c: 89 45 fc                     	movl	%eax, -4(%ebp)
  28287f: 8b 45 fc                     	movl	-4(%ebp), %eax
  282882: c9                           	leave
  282883: c3                           	retl

00282884 memman_free_4k:
  282884: 55                           	pushl	%ebp
  282885: 89 e5                        	movl	%esp, %ebp
  282887: 83 ec 10                     	subl	$16, %esp
  28288a: 8b 45 10                     	movl	16(%ebp), %eax
  28288d: 05 ff 0f 00 00               	addl	$4095, %eax
  282892: 25 00 f0 ff ff               	andl	$4294963200, %eax
  282897: 89 45 10                     	movl	%eax, 16(%ebp)
  28289a: ff 75 10                     	pushl	16(%ebp)
  28289d: ff 75 0c                     	pushl	12(%ebp)
  2828a0: ff 75 08                     	pushl	8(%ebp)
  2828a3: e8 60 fd ff ff               	calll	-672 <memman_free>
  2828a8: 83 c4 0c                     	addl	$12, %esp
  2828ab: 89 45 fc                     	movl	%eax, -4(%ebp)
  2828ae: 8b 45 fc                     	movl	-4(%ebp), %eax
  2828b1: c9                           	leave
  2828b2: c3                           	retl

002828b3 shtctl_init:
  2828b3: 55                           	pushl	%ebp
  2828b4: 89 e5                        	movl	%esp, %ebp
  2828b6: 83 ec 18                     	subl	$24, %esp
  2828b9: 83 ec 08                     	subl	$8, %esp
  2828bc: 68 14 2c 00 00               	pushl	$11284
  2828c1: ff 75 08                     	pushl	8(%ebp)
  2828c4: e8 8f ff ff ff               	calll	-113 <memman_alloc_4k>
  2828c9: 83 c4 10                     	addl	$16, %esp
  2828cc: 89 45 f0                     	movl	%eax, -16(%ebp)
  2828cf: 83 7d f0 00                  	cmpl	$0, -16(%ebp)
  2828d3: 0f 84 b7 00 00 00            	je	183 <shtctl_init+0xdd>
  2828d9: 8b 45 10                     	movl	16(%ebp), %eax
  2828dc: 0f af 45 14                  	imull	20(%ebp), %eax
  2828e0: 83 ec 08                     	subl	$8, %esp
  2828e3: 50                           	pushl	%eax
  2828e4: ff 75 08                     	pushl	8(%ebp)
  2828e7: e8 6c ff ff ff               	calll	-148 <memman_alloc_4k>
  2828ec: 83 c4 10                     	addl	$16, %esp
  2828ef: 89 c2                        	movl	%eax, %edx
  2828f1: 8b 45 f0                     	movl	-16(%ebp), %eax
  2828f4: 89 50 04                     	movl	%edx, 4(%eax)
  2828f7: 8b 45 f0                     	movl	-16(%ebp), %eax
  2828fa: 8b 40 04                     	movl	4(%eax), %eax
  2828fd: 85 c0                        	testl	%eax, %eax
  2828ff: 75 19                        	jne	25 <shtctl_init+0x67>
  282901: 8b 45 f0                     	movl	-16(%ebp), %eax
  282904: 83 ec 04                     	subl	$4, %esp
  282907: 68 14 2c 00 00               	pushl	$11284
  28290c: 50                           	pushl	%eax
  28290d: ff 75 08                     	pushl	8(%ebp)
  282910: e8 6f ff ff ff               	calll	-145 <memman_free_4k>
  282915: 83 c4 10                     	addl	$16, %esp
  282918: eb 77                        	jmp	119 <shtctl_init+0xde>
  28291a: 8b 45 f0                     	movl	-16(%ebp), %eax
  28291d: 8b 55 0c                     	movl	12(%ebp), %edx
  282920: 89 10                        	movl	%edx, (%eax)
  282922: 8b 45 f0                     	movl	-16(%ebp), %eax
  282925: 8b 55 10                     	movl	16(%ebp), %edx
  282928: 89 50 08                     	movl	%edx, 8(%eax)
  28292b: 8b 45 f0                     	movl	-16(%ebp), %eax
  28292e: 8b 55 14                     	movl	20(%ebp), %edx
  282931: 89 50 0c                     	movl	%edx, 12(%eax)
  282934: 8b 45 f0                     	movl	-16(%ebp), %eax
  282937: c7 40 10 ff ff ff ff         	movl	$4294967295, 16(%eax)
  28293e: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  282945: eb 3e                        	jmp	62 <shtctl_init+0xd2>
  282947: 8b 4d f0                     	movl	-16(%ebp), %ecx
  28294a: 8b 55 f4                     	movl	-12(%ebp), %edx
  28294d: 89 d0                        	movl	%edx, %eax
  28294f: c1 e0 02                     	shll	$2, %eax
  282952: 01 d0                        	addl	%edx, %eax
  282954: c1 e0 03                     	shll	$3, %eax
  282957: 01 c8                        	addl	%ecx, %eax
  282959: 05 30 04 00 00               	addl	$1072, %eax
  28295e: c7 00 00 00 00 00            	movl	$0, (%eax)
  282964: 8b 4d f0                     	movl	-16(%ebp), %ecx
  282967: 8b 55 f4                     	movl	-12(%ebp), %edx
  28296a: 89 d0                        	movl	%edx, %eax
  28296c: c1 e0 02                     	shll	$2, %eax
  28296f: 01 d0                        	addl	%edx, %eax
  282971: c1 e0 03                     	shll	$3, %eax
  282974: 01 c8                        	addl	%ecx, %eax
  282976: 8d 90 34 04 00 00            	leal	1076(%eax), %edx
  28297c: 8b 45 f0                     	movl	-16(%ebp), %eax
  28297f: 89 02                        	movl	%eax, (%edx)
  282981: 83 45 f4 01                  	addl	$1, -12(%ebp)
  282985: 81 7d f4 ff 00 00 00         	cmpl	$255, -12(%ebp)
  28298c: 7e b9                        	jle	-71 <shtctl_init+0x94>
  28298e: eb 01                        	jmp	1 <shtctl_init+0xde>
  282990: 90                           	nop
  282991: 8b 45 f0                     	movl	-16(%ebp), %eax
  282994: c9                           	leave
  282995: c3                           	retl

00282996 sheet_alloc:
  282996: 55                           	pushl	%ebp
  282997: 89 e5                        	movl	%esp, %ebp
  282999: 83 ec 10                     	subl	$16, %esp
  28299c: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  2829a3: eb 62                        	jmp	98 <sheet_alloc+0x71>
  2829a5: 8b 4d 08                     	movl	8(%ebp), %ecx
  2829a8: 8b 55 fc                     	movl	-4(%ebp), %edx
  2829ab: 89 d0                        	movl	%edx, %eax
  2829ad: c1 e0 02                     	shll	$2, %eax
  2829b0: 01 d0                        	addl	%edx, %eax
  2829b2: c1 e0 03                     	shll	$3, %eax
  2829b5: 01 c8                        	addl	%ecx, %eax
  2829b7: 05 30 04 00 00               	addl	$1072, %eax
  2829bc: 8b 00                        	movl	(%eax), %eax
  2829be: 85 c0                        	testl	%eax, %eax
  2829c0: 75 41                        	jne	65 <sheet_alloc+0x6d>
  2829c2: 8b 55 fc                     	movl	-4(%ebp), %edx
  2829c5: 89 d0                        	movl	%edx, %eax
  2829c7: c1 e0 02                     	shll	$2, %eax
  2829ca: 01 d0                        	addl	%edx, %eax
  2829cc: c1 e0 03                     	shll	$3, %eax
  2829cf: 8d 90 10 04 00 00            	leal	1040(%eax), %edx
  2829d5: 8b 45 08                     	movl	8(%ebp), %eax
  2829d8: 01 d0                        	addl	%edx, %eax
  2829da: 83 c0 04                     	addl	$4, %eax
  2829dd: 89 45 f8                     	movl	%eax, -8(%ebp)
  2829e0: 8b 45 f8                     	movl	-8(%ebp), %eax
  2829e3: c7 40 1c 01 00 00 00         	movl	$1, 28(%eax)
  2829ea: 8b 45 f8                     	movl	-8(%ebp), %eax
  2829ed: c7 40 18 ff ff ff ff         	movl	$4294967295, 24(%eax)
  2829f4: 8b 45 f8                     	movl	-8(%ebp), %eax
  2829f7: c7 40 24 00 00 00 00         	movl	$0, 36(%eax)
  2829fe: 8b 45 f8                     	movl	-8(%ebp), %eax
  282a01: eb 12                        	jmp	18 <sheet_alloc+0x7f>
  282a03: 83 45 fc 01                  	addl	$1, -4(%ebp)
  282a07: 81 7d fc ff 00 00 00         	cmpl	$255, -4(%ebp)
  282a0e: 7e 95                        	jle	-107 <sheet_alloc+0xf>
  282a10: b8 00 00 00 00               	movl	$0, %eax
  282a15: c9                           	leave
  282a16: c3                           	retl

00282a17 sheet_setbuf:
  282a17: 55                           	pushl	%ebp
  282a18: 89 e5                        	movl	%esp, %ebp
  282a1a: 8b 45 08                     	movl	8(%ebp), %eax
  282a1d: 8b 55 0c                     	movl	12(%ebp), %edx
  282a20: 89 10                        	movl	%edx, (%eax)
  282a22: 8b 45 08                     	movl	8(%ebp), %eax
  282a25: 8b 55 10                     	movl	16(%ebp), %edx
  282a28: 89 50 04                     	movl	%edx, 4(%eax)
  282a2b: 8b 45 08                     	movl	8(%ebp), %eax
  282a2e: 8b 55 14                     	movl	20(%ebp), %edx
  282a31: 89 50 08                     	movl	%edx, 8(%eax)
  282a34: 8b 45 08                     	movl	8(%ebp), %eax
  282a37: 8b 55 18                     	movl	24(%ebp), %edx
  282a3a: 89 50 14                     	movl	%edx, 20(%eax)
  282a3d: 90                           	nop
  282a3e: 5d                           	popl	%ebp
  282a3f: c3                           	retl

00282a40 sheet_refreshmap:
  282a40: 55                           	pushl	%ebp
  282a41: 89 e5                        	movl	%esp, %ebp
  282a43: 83 ec 40                     	subl	$64, %esp
  282a46: 8b 45 08                     	movl	8(%ebp), %eax
  282a49: 8b 40 04                     	movl	4(%eax), %eax
  282a4c: 89 45 e0                     	movl	%eax, -32(%ebp)
  282a4f: 83 7d 0c 00                  	cmpl	$0, 12(%ebp)
  282a53: 79 07                        	jns	7 <sheet_refreshmap+0x1c>
  282a55: c7 45 0c 00 00 00 00         	movl	$0, 12(%ebp)
  282a5c: 83 7d 10 00                  	cmpl	$0, 16(%ebp)
  282a60: 79 07                        	jns	7 <sheet_refreshmap+0x29>
  282a62: c7 45 10 00 00 00 00         	movl	$0, 16(%ebp)
  282a69: 8b 45 08                     	movl	8(%ebp), %eax
  282a6c: 8b 40 08                     	movl	8(%eax), %eax
  282a6f: 39 45 14                     	cmpl	%eax, 20(%ebp)
  282a72: 7e 09                        	jle	9 <sheet_refreshmap+0x3d>
  282a74: 8b 45 08                     	movl	8(%ebp), %eax
  282a77: 8b 40 08                     	movl	8(%eax), %eax
  282a7a: 89 45 14                     	movl	%eax, 20(%ebp)
  282a7d: 8b 45 08                     	movl	8(%ebp), %eax
  282a80: 8b 40 0c                     	movl	12(%eax), %eax
  282a83: 39 45 18                     	cmpl	%eax, 24(%ebp)
  282a86: 7e 09                        	jle	9 <sheet_refreshmap+0x51>
  282a88: 8b 45 08                     	movl	8(%ebp), %eax
  282a8b: 8b 40 0c                     	movl	12(%eax), %eax
  282a8e: 89 45 18                     	movl	%eax, 24(%ebp)
  282a91: 8b 45 1c                     	movl	28(%ebp), %eax
  282a94: 89 45 fc                     	movl	%eax, -4(%ebp)
  282a97: e9 98 02 00 00               	jmp	664 <sheet_refreshmap+0x2f4>
  282a9c: 8b 45 08                     	movl	8(%ebp), %eax
  282a9f: 8b 55 fc                     	movl	-4(%ebp), %edx
  282aa2: 83 c2 04                     	addl	$4, %edx
  282aa5: 8b 44 90 04                  	movl	4(%eax,%edx,4), %eax
  282aa9: 89 45 dc                     	movl	%eax, -36(%ebp)
  282aac: 8b 45 dc                     	movl	-36(%ebp), %eax
  282aaf: 8b 55 08                     	movl	8(%ebp), %edx
  282ab2: 81 c2 14 04 00 00            	addl	$1044, %edx
  282ab8: 29 d0                        	subl	%edx, %eax
  282aba: c1 f8 03                     	sarl	$3, %eax
  282abd: 69 c0 cd cc cc cc            	imull	$3435973837, %eax, %eax
  282ac3: 88 45 db                     	movb	%al, -37(%ebp)
  282ac6: 8b 45 dc                     	movl	-36(%ebp), %eax
  282ac9: 8b 00                        	movl	(%eax), %eax
  282acb: 89 45 d4                     	movl	%eax, -44(%ebp)
  282ace: 8b 45 dc                     	movl	-36(%ebp), %eax
  282ad1: 8b 40 0c                     	movl	12(%eax), %eax
  282ad4: 8b 55 0c                     	movl	12(%ebp), %edx
  282ad7: 29 c2                        	subl	%eax, %edx
  282ad9: 89 d0                        	movl	%edx, %eax
  282adb: 89 45 f0                     	movl	%eax, -16(%ebp)
  282ade: 8b 45 dc                     	movl	-36(%ebp), %eax
  282ae1: 8b 40 10                     	movl	16(%eax), %eax
  282ae4: 8b 55 10                     	movl	16(%ebp), %edx
  282ae7: 29 c2                        	subl	%eax, %edx
  282ae9: 89 d0                        	movl	%edx, %eax
  282aeb: 89 45 ec                     	movl	%eax, -20(%ebp)
  282aee: 8b 45 dc                     	movl	-36(%ebp), %eax
  282af1: 8b 40 0c                     	movl	12(%eax), %eax
  282af4: 8b 55 14                     	movl	20(%ebp), %edx
  282af7: 29 c2                        	subl	%eax, %edx
  282af9: 89 d0                        	movl	%edx, %eax
  282afb: 89 45 e8                     	movl	%eax, -24(%ebp)
  282afe: 8b 45 dc                     	movl	-36(%ebp), %eax
  282b01: 8b 40 10                     	movl	16(%eax), %eax
  282b04: 8b 55 18                     	movl	24(%ebp), %edx
  282b07: 29 c2                        	subl	%eax, %edx
  282b09: 89 d0                        	movl	%edx, %eax
  282b0b: 89 45 e4                     	movl	%eax, -28(%ebp)
  282b0e: 83 7d f0 00                  	cmpl	$0, -16(%ebp)
  282b12: 79 07                        	jns	7 <sheet_refreshmap+0xdb>
  282b14: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
  282b1b: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
  282b1f: 79 07                        	jns	7 <sheet_refreshmap+0xe8>
  282b21: c7 45 ec 00 00 00 00         	movl	$0, -20(%ebp)
  282b28: 8b 45 dc                     	movl	-36(%ebp), %eax
  282b2b: 8b 40 04                     	movl	4(%eax), %eax
  282b2e: 39 45 e8                     	cmpl	%eax, -24(%ebp)
  282b31: 7e 09                        	jle	9 <sheet_refreshmap+0xfc>
  282b33: 8b 45 dc                     	movl	-36(%ebp), %eax
  282b36: 8b 40 04                     	movl	4(%eax), %eax
  282b39: 89 45 e8                     	movl	%eax, -24(%ebp)
  282b3c: 8b 45 dc                     	movl	-36(%ebp), %eax
  282b3f: 8b 40 08                     	movl	8(%eax), %eax
  282b42: 39 45 e4                     	cmpl	%eax, -28(%ebp)
  282b45: 7e 09                        	jle	9 <sheet_refreshmap+0x110>
  282b47: 8b 45 dc                     	movl	-36(%ebp), %eax
  282b4a: 8b 40 08                     	movl	8(%eax), %eax
  282b4d: 89 45 e4                     	movl	%eax, -28(%ebp)
  282b50: 8b 45 dc                     	movl	-36(%ebp), %eax
  282b53: 8b 40 14                     	movl	20(%eax), %eax
  282b56: 83 f8 ff                     	cmpl	$-1, %eax
  282b59: 0f 85 43 01 00 00            	jne	323 <sheet_refreshmap+0x262>
  282b5f: 8b 45 dc                     	movl	-36(%ebp), %eax
  282b62: 8b 40 0c                     	movl	12(%eax), %eax
  282b65: 83 e0 03                     	andl	$3, %eax
  282b68: 85 c0                        	testl	%eax, %eax
  282b6a: 0f 85 cb 00 00 00            	jne	203 <sheet_refreshmap+0x1fb>
  282b70: 8b 45 f0                     	movl	-16(%ebp), %eax
  282b73: 83 e0 03                     	andl	$3, %eax
  282b76: 85 c0                        	testl	%eax, %eax
  282b78: 0f 85 bd 00 00 00            	jne	189 <sheet_refreshmap+0x1fb>
  282b7e: 8b 45 e8                     	movl	-24(%ebp), %eax
  282b81: 83 e0 03                     	andl	$3, %eax
  282b84: 85 c0                        	testl	%eax, %eax
  282b86: 0f 85 af 00 00 00            	jne	175 <sheet_refreshmap+0x1fb>
  282b8c: 8b 45 e8                     	movl	-24(%ebp), %eax
  282b8f: 2b 45 f0                     	subl	-16(%ebp), %eax
  282b92: 8d 50 03                     	leal	3(%eax), %edx
  282b95: 85 c0                        	testl	%eax, %eax
  282b97: 0f 48 c2                     	cmovsl	%edx, %eax
  282b9a: c1 f8 02                     	sarl	$2, %eax
  282b9d: 89 45 e8                     	movl	%eax, -24(%ebp)
  282ba0: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  282ba4: 0f b6 55 db                  	movzbl	-37(%ebp), %edx
  282ba8: c1 e2 08                     	shll	$8, %edx
  282bab: 09 c2                        	orl	%eax, %edx
  282bad: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  282bb1: c1 e0 10                     	shll	$16, %eax
  282bb4: 09 c2                        	orl	%eax, %edx
  282bb6: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  282bba: c1 e0 18                     	shll	$24, %eax
  282bbd: 09 d0                        	orl	%edx, %eax
  282bbf: 89 45 c8                     	movl	%eax, -56(%ebp)
  282bc2: 8b 45 ec                     	movl	-20(%ebp), %eax
  282bc5: 89 45 f4                     	movl	%eax, -12(%ebp)
  282bc8: eb 64                        	jmp	100 <sheet_refreshmap+0x1ee>
  282bca: 8b 45 dc                     	movl	-36(%ebp), %eax
  282bcd: 8b 50 10                     	movl	16(%eax), %edx
  282bd0: 8b 45 f4                     	movl	-12(%ebp), %eax
  282bd3: 01 d0                        	addl	%edx, %eax
  282bd5: 89 45 d0                     	movl	%eax, -48(%ebp)
  282bd8: 8b 45 dc                     	movl	-36(%ebp), %eax
  282bdb: 8b 50 0c                     	movl	12(%eax), %edx
  282bde: 8b 45 f0                     	movl	-16(%ebp), %eax
  282be1: 01 d0                        	addl	%edx, %eax
  282be3: 89 45 cc                     	movl	%eax, -52(%ebp)
  282be6: 8b 45 08                     	movl	8(%ebp), %eax
  282be9: 8b 40 08                     	movl	8(%eax), %eax
  282bec: 0f af 45 d0                  	imull	-48(%ebp), %eax
  282bf0: 89 c2                        	movl	%eax, %edx
  282bf2: 8b 45 cc                     	movl	-52(%ebp), %eax
  282bf5: 01 d0                        	addl	%edx, %eax
  282bf7: 89 c2                        	movl	%eax, %edx
  282bf9: 8b 45 e0                     	movl	-32(%ebp), %eax
  282bfc: 01 d0                        	addl	%edx, %eax
  282bfe: 89 45 c4                     	movl	%eax, -60(%ebp)
  282c01: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  282c08: eb 18                        	jmp	24 <sheet_refreshmap+0x1e2>
  282c0a: 8b 45 f8                     	movl	-8(%ebp), %eax
  282c0d: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
  282c14: 8b 45 c4                     	movl	-60(%ebp), %eax
  282c17: 01 c2                        	addl	%eax, %edx
  282c19: 8b 45 c8                     	movl	-56(%ebp), %eax
  282c1c: 89 02                        	movl	%eax, (%edx)
  282c1e: 83 45 f8 01                  	addl	$1, -8(%ebp)
  282c22: 8b 45 f8                     	movl	-8(%ebp), %eax
  282c25: 3b 45 e8                     	cmpl	-24(%ebp), %eax
  282c28: 7c e0                        	jl	-32 <sheet_refreshmap+0x1ca>
  282c2a: 83 45 f4 01                  	addl	$1, -12(%ebp)
  282c2e: 8b 45 f4                     	movl	-12(%ebp), %eax
  282c31: 3b 45 e4                     	cmpl	-28(%ebp), %eax
  282c34: 7c 94                        	jl	-108 <sheet_refreshmap+0x18a>
  282c36: e9 f5 00 00 00               	jmp	245 <sheet_refreshmap+0x2f0>
  282c3b: 8b 45 ec                     	movl	-20(%ebp), %eax
  282c3e: 89 45 f4                     	movl	%eax, -12(%ebp)
  282c41: eb 52                        	jmp	82 <sheet_refreshmap+0x255>
  282c43: 8b 45 dc                     	movl	-36(%ebp), %eax
  282c46: 8b 50 10                     	movl	16(%eax), %edx
  282c49: 8b 45 f4                     	movl	-12(%ebp), %eax
  282c4c: 01 d0                        	addl	%edx, %eax
  282c4e: 89 45 d0                     	movl	%eax, -48(%ebp)
  282c51: 8b 45 f0                     	movl	-16(%ebp), %eax
  282c54: 89 45 f8                     	movl	%eax, -8(%ebp)
  282c57: eb 30                        	jmp	48 <sheet_refreshmap+0x249>
  282c59: 8b 45 dc                     	movl	-36(%ebp), %eax
  282c5c: 8b 50 0c                     	movl	12(%eax), %edx
  282c5f: 8b 45 f8                     	movl	-8(%ebp), %eax
  282c62: 01 d0                        	addl	%edx, %eax
  282c64: 89 45 cc                     	movl	%eax, -52(%ebp)
  282c67: 8b 45 08                     	movl	8(%ebp), %eax
  282c6a: 8b 40 08                     	movl	8(%eax), %eax
  282c6d: 0f af 45 d0                  	imull	-48(%ebp), %eax
  282c71: 89 c2                        	movl	%eax, %edx
  282c73: 8b 45 cc                     	movl	-52(%ebp), %eax
  282c76: 01 d0                        	addl	%edx, %eax
  282c78: 89 c2                        	movl	%eax, %edx
  282c7a: 8b 45 e0                     	movl	-32(%ebp), %eax
  282c7d: 01 c2                        	addl	%eax, %edx
  282c7f: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  282c83: 88 02                        	movb	%al, (%edx)
  282c85: 83 45 f8 01                  	addl	$1, -8(%ebp)
  282c89: 8b 45 f8                     	movl	-8(%ebp), %eax
  282c8c: 3b 45 e8                     	cmpl	-24(%ebp), %eax
  282c8f: 7c c8                        	jl	-56 <sheet_refreshmap+0x219>
  282c91: 83 45 f4 01                  	addl	$1, -12(%ebp)
  282c95: 8b 45 f4                     	movl	-12(%ebp), %eax
  282c98: 3b 45 e4                     	cmpl	-28(%ebp), %eax
  282c9b: 7c a6                        	jl	-90 <sheet_refreshmap+0x203>
  282c9d: e9 8e 00 00 00               	jmp	142 <sheet_refreshmap+0x2f0>
  282ca2: 8b 45 ec                     	movl	-20(%ebp), %eax
  282ca5: 89 45 f4                     	movl	%eax, -12(%ebp)
  282ca8: eb 7a                        	jmp	122 <sheet_refreshmap+0x2e4>
  282caa: 8b 45 dc                     	movl	-36(%ebp), %eax
  282cad: 8b 50 10                     	movl	16(%eax), %edx
  282cb0: 8b 45 f4                     	movl	-12(%ebp), %eax
  282cb3: 01 d0                        	addl	%edx, %eax
  282cb5: 89 45 d0                     	movl	%eax, -48(%ebp)
  282cb8: 8b 45 f0                     	movl	-16(%ebp), %eax
  282cbb: 89 45 f8                     	movl	%eax, -8(%ebp)
  282cbe: eb 58                        	jmp	88 <sheet_refreshmap+0x2d8>
  282cc0: 8b 45 dc                     	movl	-36(%ebp), %eax
  282cc3: 8b 50 0c                     	movl	12(%eax), %edx
  282cc6: 8b 45 f8                     	movl	-8(%ebp), %eax
  282cc9: 01 d0                        	addl	%edx, %eax
  282ccb: 89 45 cc                     	movl	%eax, -52(%ebp)
  282cce: 8b 45 dc                     	movl	-36(%ebp), %eax
  282cd1: 8b 40 04                     	movl	4(%eax), %eax
  282cd4: 0f af 45 f4                  	imull	-12(%ebp), %eax
  282cd8: 89 c2                        	movl	%eax, %edx
  282cda: 8b 45 f8                     	movl	-8(%ebp), %eax
  282cdd: 01 d0                        	addl	%edx, %eax
  282cdf: 89 c2                        	movl	%eax, %edx
  282ce1: 8b 45 d4                     	movl	-44(%ebp), %eax
  282ce4: 01 d0                        	addl	%edx, %eax
  282ce6: 0f b6 00                     	movzbl	(%eax), %eax
  282ce9: 0f b6 d0                     	movzbl	%al, %edx
  282cec: 8b 45 dc                     	movl	-36(%ebp), %eax
  282cef: 8b 40 14                     	movl	20(%eax), %eax
  282cf2: 39 c2                        	cmpl	%eax, %edx
  282cf4: 74 1e                        	je	30 <sheet_refreshmap+0x2d4>
  282cf6: 8b 45 08                     	movl	8(%ebp), %eax
  282cf9: 8b 40 08                     	movl	8(%eax), %eax
  282cfc: 0f af 45 d0                  	imull	-48(%ebp), %eax
  282d00: 89 c2                        	movl	%eax, %edx
  282d02: 8b 45 cc                     	movl	-52(%ebp), %eax
  282d05: 01 d0                        	addl	%edx, %eax
  282d07: 89 c2                        	movl	%eax, %edx
  282d09: 8b 45 e0                     	movl	-32(%ebp), %eax
  282d0c: 01 c2                        	addl	%eax, %edx
  282d0e: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  282d12: 88 02                        	movb	%al, (%edx)
  282d14: 83 45 f8 01                  	addl	$1, -8(%ebp)
  282d18: 8b 45 f8                     	movl	-8(%ebp), %eax
  282d1b: 3b 45 e8                     	cmpl	-24(%ebp), %eax
  282d1e: 7c a0                        	jl	-96 <sheet_refreshmap+0x280>
  282d20: 83 45 f4 01                  	addl	$1, -12(%ebp)
  282d24: 8b 45 f4                     	movl	-12(%ebp), %eax
  282d27: 3b 45 e4                     	cmpl	-28(%ebp), %eax
  282d2a: 0f 8c 7a ff ff ff            	jl	-134 <sheet_refreshmap+0x26a>
  282d30: 83 45 fc 01                  	addl	$1, -4(%ebp)
  282d34: 8b 45 08                     	movl	8(%ebp), %eax
  282d37: 8b 40 10                     	movl	16(%eax), %eax
  282d3a: 39 45 fc                     	cmpl	%eax, -4(%ebp)
  282d3d: 0f 8e 59 fd ff ff            	jle	-679 <sheet_refreshmap+0x5c>
  282d43: 90                           	nop
  282d44: c9                           	leave
  282d45: c3                           	retl

00282d46 sheet_refreshsub:
  282d46: 55                           	pushl	%ebp
  282d47: 89 e5                        	movl	%esp, %ebp
  282d49: 83 ec 60                     	subl	$96, %esp
  282d4c: 8b 45 08                     	movl	8(%ebp), %eax
  282d4f: 8b 00                        	movl	(%eax), %eax
  282d51: 89 45 dc                     	movl	%eax, -36(%ebp)
  282d54: 8b 45 08                     	movl	8(%ebp), %eax
  282d57: 8b 40 04                     	movl	4(%eax), %eax
  282d5a: 89 45 d8                     	movl	%eax, -40(%ebp)
  282d5d: 83 7d 0c 00                  	cmpl	$0, 12(%ebp)
  282d61: 79 07                        	jns	7 <sheet_refreshsub+0x24>
  282d63: c7 45 0c 00 00 00 00         	movl	$0, 12(%ebp)
  282d6a: 83 7d 10 00                  	cmpl	$0, 16(%ebp)
  282d6e: 79 07                        	jns	7 <sheet_refreshsub+0x31>
  282d70: c7 45 10 00 00 00 00         	movl	$0, 16(%ebp)
  282d77: 8b 45 08                     	movl	8(%ebp), %eax
  282d7a: 8b 40 08                     	movl	8(%eax), %eax
  282d7d: 39 45 14                     	cmpl	%eax, 20(%ebp)
  282d80: 7e 09                        	jle	9 <sheet_refreshsub+0x45>
  282d82: 8b 45 08                     	movl	8(%ebp), %eax
  282d85: 8b 40 08                     	movl	8(%eax), %eax
  282d88: 89 45 14                     	movl	%eax, 20(%ebp)
  282d8b: 8b 45 08                     	movl	8(%ebp), %eax
  282d8e: 8b 40 0c                     	movl	12(%eax), %eax
  282d91: 39 45 18                     	cmpl	%eax, 24(%ebp)
  282d94: 7e 09                        	jle	9 <sheet_refreshsub+0x59>
  282d96: 8b 45 08                     	movl	8(%ebp), %eax
  282d99: 8b 40 0c                     	movl	12(%eax), %eax
  282d9c: 89 45 18                     	movl	%eax, 24(%ebp)
  282d9f: 8b 45 1c                     	movl	28(%ebp), %eax
  282da2: 89 45 fc                     	movl	%eax, -4(%ebp)
  282da5: e9 1b 05 00 00               	jmp	1307 <sheet_refreshsub+0x57f>
  282daa: 8b 45 08                     	movl	8(%ebp), %eax
  282dad: 8b 55 fc                     	movl	-4(%ebp), %edx
  282db0: 83 c2 04                     	addl	$4, %edx
  282db3: 8b 44 90 04                  	movl	4(%eax,%edx,4), %eax
  282db7: 89 45 d4                     	movl	%eax, -44(%ebp)
  282dba: 8b 45 d4                     	movl	-44(%ebp), %eax
  282dbd: 8b 00                        	movl	(%eax), %eax
  282dbf: 89 45 d0                     	movl	%eax, -48(%ebp)
  282dc2: 8b 45 d4                     	movl	-44(%ebp), %eax
  282dc5: 8b 55 08                     	movl	8(%ebp), %edx
  282dc8: 81 c2 14 04 00 00            	addl	$1044, %edx
  282dce: 29 d0                        	subl	%edx, %eax
  282dd0: c1 f8 03                     	sarl	$3, %eax
  282dd3: 69 c0 cd cc cc cc            	imull	$3435973837, %eax, %eax
  282dd9: 88 45 cf                     	movb	%al, -49(%ebp)
  282ddc: 8b 45 d4                     	movl	-44(%ebp), %eax
  282ddf: 8b 40 0c                     	movl	12(%eax), %eax
  282de2: 8b 55 0c                     	movl	12(%ebp), %edx
  282de5: 29 c2                        	subl	%eax, %edx
  282de7: 89 d0                        	movl	%edx, %eax
  282de9: 89 45 f0                     	movl	%eax, -16(%ebp)
  282dec: 8b 45 d4                     	movl	-44(%ebp), %eax
  282def: 8b 40 10                     	movl	16(%eax), %eax
  282df2: 8b 55 10                     	movl	16(%ebp), %edx
  282df5: 29 c2                        	subl	%eax, %edx
  282df7: 89 d0                        	movl	%edx, %eax
  282df9: 89 45 ec                     	movl	%eax, -20(%ebp)
  282dfc: 8b 45 d4                     	movl	-44(%ebp), %eax
  282dff: 8b 40 0c                     	movl	12(%eax), %eax
  282e02: 8b 55 14                     	movl	20(%ebp), %edx
  282e05: 29 c2                        	subl	%eax, %edx
  282e07: 89 d0                        	movl	%edx, %eax
  282e09: 89 45 e8                     	movl	%eax, -24(%ebp)
  282e0c: 8b 45 d4                     	movl	-44(%ebp), %eax
  282e0f: 8b 40 10                     	movl	16(%eax), %eax
  282e12: 8b 55 18                     	movl	24(%ebp), %edx
  282e15: 29 c2                        	subl	%eax, %edx
  282e17: 89 d0                        	movl	%edx, %eax
  282e19: 89 45 e4                     	movl	%eax, -28(%ebp)
  282e1c: 83 7d f0 00                  	cmpl	$0, -16(%ebp)
  282e20: 79 07                        	jns	7 <sheet_refreshsub+0xe3>
  282e22: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
  282e29: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
  282e2d: 79 07                        	jns	7 <sheet_refreshsub+0xf0>
  282e2f: c7 45 ec 00 00 00 00         	movl	$0, -20(%ebp)
  282e36: 8b 45 d4                     	movl	-44(%ebp), %eax
  282e39: 8b 40 04                     	movl	4(%eax), %eax
  282e3c: 39 45 e8                     	cmpl	%eax, -24(%ebp)
  282e3f: 7e 09                        	jle	9 <sheet_refreshsub+0x104>
  282e41: 8b 45 d4                     	movl	-44(%ebp), %eax
  282e44: 8b 40 04                     	movl	4(%eax), %eax
  282e47: 89 45 e8                     	movl	%eax, -24(%ebp)
  282e4a: 8b 45 d4                     	movl	-44(%ebp), %eax
  282e4d: 8b 40 08                     	movl	8(%eax), %eax
  282e50: 39 45 e4                     	cmpl	%eax, -28(%ebp)
  282e53: 7e 09                        	jle	9 <sheet_refreshsub+0x118>
  282e55: 8b 45 d4                     	movl	-44(%ebp), %eax
  282e58: 8b 40 08                     	movl	8(%eax), %eax
  282e5b: 89 45 e4                     	movl	%eax, -28(%ebp)
  282e5e: 8b 45 d4                     	movl	-44(%ebp), %eax
  282e61: 8b 40 0c                     	movl	12(%eax), %eax
  282e64: 83 e0 03                     	andl	$3, %eax
  282e67: 85 c0                        	testl	%eax, %eax
  282e69: 0f 85 b1 03 00 00            	jne	945 <sheet_refreshsub+0x4da>
  282e6f: 8b 45 f0                     	movl	-16(%ebp), %eax
  282e72: 83 c0 03                     	addl	$3, %eax
  282e75: 8d 50 03                     	leal	3(%eax), %edx
  282e78: 85 c0                        	testl	%eax, %eax
  282e7a: 0f 48 c2                     	cmovsl	%edx, %eax
  282e7d: c1 f8 02                     	sarl	$2, %eax
  282e80: 89 45 e0                     	movl	%eax, -32(%ebp)
  282e83: 8b 45 e8                     	movl	-24(%ebp), %eax
  282e86: 8d 50 03                     	leal	3(%eax), %edx
  282e89: 85 c0                        	testl	%eax, %eax
  282e8b: 0f 48 c2                     	cmovsl	%edx, %eax
  282e8e: c1 f8 02                     	sarl	$2, %eax
  282e91: 89 45 c0                     	movl	%eax, -64(%ebp)
  282e94: 8b 45 e0                     	movl	-32(%ebp), %eax
  282e97: 29 45 c0                     	subl	%eax, -64(%ebp)
  282e9a: 0f b6 45 cf                  	movzbl	-49(%ebp), %eax
  282e9e: 0f b6 55 cf                  	movzbl	-49(%ebp), %edx
  282ea2: c1 e2 08                     	shll	$8, %edx
  282ea5: 09 c2                        	orl	%eax, %edx
  282ea7: 0f b6 45 cf                  	movzbl	-49(%ebp), %eax
  282eab: c1 e0 10                     	shll	$16, %eax
  282eae: 09 c2                        	orl	%eax, %edx
  282eb0: 0f b6 45 cf                  	movzbl	-49(%ebp), %eax
  282eb4: c1 e0 18                     	shll	$24, %eax
  282eb7: 09 d0                        	orl	%edx, %eax
  282eb9: 89 45 bc                     	movl	%eax, -68(%ebp)
  282ebc: 8b 45 ec                     	movl	-20(%ebp), %eax
  282ebf: 89 45 f4                     	movl	%eax, -12(%ebp)
  282ec2: e9 48 03 00 00               	jmp	840 <sheet_refreshsub+0x4c9>
  282ec7: 8b 45 d4                     	movl	-44(%ebp), %eax
  282eca: 8b 50 10                     	movl	16(%eax), %edx
  282ecd: 8b 45 f4                     	movl	-12(%ebp), %eax
  282ed0: 01 d0                        	addl	%edx, %eax
  282ed2: 89 45 c8                     	movl	%eax, -56(%ebp)
  282ed5: 8b 45 f0                     	movl	-16(%ebp), %eax
  282ed8: 89 45 f8                     	movl	%eax, -8(%ebp)
  282edb: eb 68                        	jmp	104 <sheet_refreshsub+0x1ff>
  282edd: 8b 45 d4                     	movl	-44(%ebp), %eax
  282ee0: 8b 50 0c                     	movl	12(%eax), %edx
  282ee3: 8b 45 f8                     	movl	-8(%ebp), %eax
  282ee6: 01 d0                        	addl	%edx, %eax
  282ee8: 89 45 c4                     	movl	%eax, -60(%ebp)
  282eeb: 8b 45 08                     	movl	8(%ebp), %eax
  282eee: 8b 40 08                     	movl	8(%eax), %eax
  282ef1: 0f af 45 c8                  	imull	-56(%ebp), %eax
  282ef5: 89 c2                        	movl	%eax, %edx
  282ef7: 8b 45 c4                     	movl	-60(%ebp), %eax
  282efa: 01 d0                        	addl	%edx, %eax
  282efc: 89 c2                        	movl	%eax, %edx
  282efe: 8b 45 d8                     	movl	-40(%ebp), %eax
  282f01: 01 d0                        	addl	%edx, %eax
  282f03: 0f b6 00                     	movzbl	(%eax), %eax
  282f06: 38 45 cf                     	cmpb	%al, -49(%ebp)
  282f09: 75 36                        	jne	54 <sheet_refreshsub+0x1fb>
  282f0b: 8b 45 d4                     	movl	-44(%ebp), %eax
  282f0e: 8b 40 04                     	movl	4(%eax), %eax
  282f11: 0f af 45 f4                  	imull	-12(%ebp), %eax
  282f15: 89 c2                        	movl	%eax, %edx
  282f17: 8b 45 f8                     	movl	-8(%ebp), %eax
  282f1a: 01 d0                        	addl	%edx, %eax
  282f1c: 89 c2                        	movl	%eax, %edx
  282f1e: 8b 45 d0                     	movl	-48(%ebp), %eax
  282f21: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  282f24: 8b 45 08                     	movl	8(%ebp), %eax
  282f27: 8b 40 08                     	movl	8(%eax), %eax
  282f2a: 0f af 45 c8                  	imull	-56(%ebp), %eax
  282f2e: 89 c2                        	movl	%eax, %edx
  282f30: 8b 45 c4                     	movl	-60(%ebp), %eax
  282f33: 01 d0                        	addl	%edx, %eax
  282f35: 89 c2                        	movl	%eax, %edx
  282f37: 8b 45 dc                     	movl	-36(%ebp), %eax
  282f3a: 01 c2                        	addl	%eax, %edx
  282f3c: 0f b6 01                     	movzbl	(%ecx), %eax
  282f3f: 88 02                        	movb	%al, (%edx)
  282f41: 83 45 f8 01                  	addl	$1, -8(%ebp)
  282f45: 8b 45 f8                     	movl	-8(%ebp), %eax
  282f48: 3b 45 e8                     	cmpl	-24(%ebp), %eax
  282f4b: 7d 0a                        	jge	10 <sheet_refreshsub+0x211>
  282f4d: 8b 45 f8                     	movl	-8(%ebp), %eax
  282f50: 83 e0 03                     	andl	$3, %eax
  282f53: 85 c0                        	testl	%eax, %eax
  282f55: 75 86                        	jne	-122 <sheet_refreshsub+0x197>
  282f57: 8b 45 d4                     	movl	-44(%ebp), %eax
  282f5a: 8b 50 0c                     	movl	12(%eax), %edx
  282f5d: 8b 45 f8                     	movl	-8(%ebp), %eax
  282f60: 01 d0                        	addl	%edx, %eax
  282f62: 89 45 c4                     	movl	%eax, -60(%ebp)
  282f65: 8b 45 08                     	movl	8(%ebp), %eax
  282f68: 8b 40 08                     	movl	8(%eax), %eax
  282f6b: 0f af 45 c8                  	imull	-56(%ebp), %eax
  282f6f: 89 c2                        	movl	%eax, %edx
  282f71: 8b 45 c4                     	movl	-60(%ebp), %eax
  282f74: 01 d0                        	addl	%edx, %eax
  282f76: 89 c2                        	movl	%eax, %edx
  282f78: 8b 45 d8                     	movl	-40(%ebp), %eax
  282f7b: 01 d0                        	addl	%edx, %eax
  282f7d: 89 45 b8                     	movl	%eax, -72(%ebp)
  282f80: 8b 45 08                     	movl	8(%ebp), %eax
  282f83: 8b 40 08                     	movl	8(%eax), %eax
  282f86: 0f af 45 c8                  	imull	-56(%ebp), %eax
  282f8a: 89 c2                        	movl	%eax, %edx
  282f8c: 8b 45 c4                     	movl	-60(%ebp), %eax
  282f8f: 01 d0                        	addl	%edx, %eax
  282f91: 89 c2                        	movl	%eax, %edx
  282f93: 8b 45 dc                     	movl	-36(%ebp), %eax
  282f96: 01 d0                        	addl	%edx, %eax
  282f98: 89 45 b4                     	movl	%eax, -76(%ebp)
  282f9b: 8b 45 d4                     	movl	-44(%ebp), %eax
  282f9e: 8b 40 04                     	movl	4(%eax), %eax
  282fa1: 0f af 45 f4                  	imull	-12(%ebp), %eax
  282fa5: 89 c2                        	movl	%eax, %edx
  282fa7: 8b 45 f8                     	movl	-8(%ebp), %eax
  282faa: 01 d0                        	addl	%edx, %eax
  282fac: 89 c2                        	movl	%eax, %edx
  282fae: 8b 45 d0                     	movl	-48(%ebp), %eax
  282fb1: 01 d0                        	addl	%edx, %eax
  282fb3: 89 45 b0                     	movl	%eax, -80(%ebp)
  282fb6: c7 45 e0 00 00 00 00         	movl	$0, -32(%ebp)
  282fbd: e9 c2 01 00 00               	jmp	450 <sheet_refreshsub+0x43e>
  282fc2: 8b 45 e0                     	movl	-32(%ebp), %eax
  282fc5: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
  282fcc: 8b 45 b8                     	movl	-72(%ebp), %eax
  282fcf: 01 d0                        	addl	%edx, %eax
  282fd1: 8b 00                        	movl	(%eax), %eax
  282fd3: 39 45 bc                     	cmpl	%eax, -68(%ebp)
  282fd6: 75 27                        	jne	39 <sheet_refreshsub+0x2b9>
  282fd8: 8b 45 e0                     	movl	-32(%ebp), %eax
  282fdb: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
  282fe2: 8b 45 b0                     	movl	-80(%ebp), %eax
  282fe5: 01 d0                        	addl	%edx, %eax
  282fe7: 8b 55 e0                     	movl	-32(%ebp), %edx
  282fea: 8d 0c 95 00 00 00 00         	leal	(,%edx,4), %ecx
  282ff1: 8b 55 b4                     	movl	-76(%ebp), %edx
  282ff4: 01 ca                        	addl	%ecx, %edx
  282ff6: 8b 00                        	movl	(%eax), %eax
  282ff8: 89 02                        	movl	%eax, (%edx)
  282ffa: e9 81 01 00 00               	jmp	385 <sheet_refreshsub+0x43a>
  282fff: 8b 45 e0                     	movl	-32(%ebp), %eax
  283002: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
  283009: 8b 45 f8                     	movl	-8(%ebp), %eax
  28300c: 01 d0                        	addl	%edx, %eax
  28300e: 89 45 ac                     	movl	%eax, -84(%ebp)
  283011: 8b 45 d4                     	movl	-44(%ebp), %eax
  283014: 8b 50 0c                     	movl	12(%eax), %edx
  283017: 8b 45 ac                     	movl	-84(%ebp), %eax
  28301a: 01 d0                        	addl	%edx, %eax
  28301c: 89 45 c4                     	movl	%eax, -60(%ebp)
  28301f: 8b 45 08                     	movl	8(%ebp), %eax
  283022: 8b 40 08                     	movl	8(%eax), %eax
  283025: 0f af 45 c8                  	imull	-56(%ebp), %eax
  283029: 89 c2                        	movl	%eax, %edx
  28302b: 8b 45 c4                     	movl	-60(%ebp), %eax
  28302e: 01 d0                        	addl	%edx, %eax
  283030: 89 c2                        	movl	%eax, %edx
  283032: 8b 45 d8                     	movl	-40(%ebp), %eax
  283035: 01 d0                        	addl	%edx, %eax
  283037: 0f b6 00                     	movzbl	(%eax), %eax
  28303a: 38 45 cf                     	cmpb	%al, -49(%ebp)
  28303d: 75 36                        	jne	54 <sheet_refreshsub+0x32f>
  28303f: 8b 45 d4                     	movl	-44(%ebp), %eax
  283042: 8b 40 04                     	movl	4(%eax), %eax
  283045: 0f af 45 f4                  	imull	-12(%ebp), %eax
  283049: 89 c2                        	movl	%eax, %edx
  28304b: 8b 45 ac                     	movl	-84(%ebp), %eax
  28304e: 01 d0                        	addl	%edx, %eax
  283050: 89 c2                        	movl	%eax, %edx
  283052: 8b 45 d0                     	movl	-48(%ebp), %eax
  283055: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  283058: 8b 45 08                     	movl	8(%ebp), %eax
  28305b: 8b 40 08                     	movl	8(%eax), %eax
  28305e: 0f af 45 c8                  	imull	-56(%ebp), %eax
  283062: 89 c2                        	movl	%eax, %edx
  283064: 8b 45 c4                     	movl	-60(%ebp), %eax
  283067: 01 d0                        	addl	%edx, %eax
  283069: 89 c2                        	movl	%eax, %edx
  28306b: 8b 45 dc                     	movl	-36(%ebp), %eax
  28306e: 01 c2                        	addl	%eax, %edx
  283070: 0f b6 01                     	movzbl	(%ecx), %eax
  283073: 88 02                        	movb	%al, (%edx)
  283075: 8b 45 08                     	movl	8(%ebp), %eax
  283078: 8b 40 08                     	movl	8(%eax), %eax
  28307b: 0f af 45 c8                  	imull	-56(%ebp), %eax
  28307f: 89 c2                        	movl	%eax, %edx
  283081: 8b 45 c4                     	movl	-60(%ebp), %eax
  283084: 01 d0                        	addl	%edx, %eax
  283086: 8d 50 01                     	leal	1(%eax), %edx
  283089: 8b 45 d8                     	movl	-40(%ebp), %eax
  28308c: 01 d0                        	addl	%edx, %eax
  28308e: 0f b6 00                     	movzbl	(%eax), %eax
  283091: 38 45 cf                     	cmpb	%al, -49(%ebp)
  283094: 75 38                        	jne	56 <sheet_refreshsub+0x388>
  283096: 8b 45 d4                     	movl	-44(%ebp), %eax
  283099: 8b 40 04                     	movl	4(%eax), %eax
  28309c: 0f af 45 f4                  	imull	-12(%ebp), %eax
  2830a0: 89 c2                        	movl	%eax, %edx
  2830a2: 8b 45 ac                     	movl	-84(%ebp), %eax
  2830a5: 01 d0                        	addl	%edx, %eax
  2830a7: 8d 50 01                     	leal	1(%eax), %edx
  2830aa: 8b 45 d0                     	movl	-48(%ebp), %eax
  2830ad: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  2830b0: 8b 45 08                     	movl	8(%ebp), %eax
  2830b3: 8b 40 08                     	movl	8(%eax), %eax
  2830b6: 0f af 45 c8                  	imull	-56(%ebp), %eax
  2830ba: 89 c2                        	movl	%eax, %edx
  2830bc: 8b 45 c4                     	movl	-60(%ebp), %eax
  2830bf: 01 d0                        	addl	%edx, %eax
  2830c1: 8d 50 01                     	leal	1(%eax), %edx
  2830c4: 8b 45 dc                     	movl	-36(%ebp), %eax
  2830c7: 01 c2                        	addl	%eax, %edx
  2830c9: 0f b6 01                     	movzbl	(%ecx), %eax
  2830cc: 88 02                        	movb	%al, (%edx)
  2830ce: 8b 45 08                     	movl	8(%ebp), %eax
  2830d1: 8b 40 08                     	movl	8(%eax), %eax
  2830d4: 0f af 45 c8                  	imull	-56(%ebp), %eax
  2830d8: 89 c2                        	movl	%eax, %edx
  2830da: 8b 45 c4                     	movl	-60(%ebp), %eax
  2830dd: 01 d0                        	addl	%edx, %eax
  2830df: 8d 50 02                     	leal	2(%eax), %edx
  2830e2: 8b 45 d8                     	movl	-40(%ebp), %eax
  2830e5: 01 d0                        	addl	%edx, %eax
  2830e7: 0f b6 00                     	movzbl	(%eax), %eax
  2830ea: 38 45 cf                     	cmpb	%al, -49(%ebp)
  2830ed: 75 38                        	jne	56 <sheet_refreshsub+0x3e1>
  2830ef: 8b 45 d4                     	movl	-44(%ebp), %eax
  2830f2: 8b 40 04                     	movl	4(%eax), %eax
  2830f5: 0f af 45 f4                  	imull	-12(%ebp), %eax
  2830f9: 89 c2                        	movl	%eax, %edx
  2830fb: 8b 45 ac                     	movl	-84(%ebp), %eax
  2830fe: 01 d0                        	addl	%edx, %eax
  283100: 8d 50 02                     	leal	2(%eax), %edx
  283103: 8b 45 d0                     	movl	-48(%ebp), %eax
  283106: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  283109: 8b 45 08                     	movl	8(%ebp), %eax
  28310c: 8b 40 08                     	movl	8(%eax), %eax
  28310f: 0f af 45 c8                  	imull	-56(%ebp), %eax
  283113: 89 c2                        	movl	%eax, %edx
  283115: 8b 45 c4                     	movl	-60(%ebp), %eax
  283118: 01 d0                        	addl	%edx, %eax
  28311a: 8d 50 02                     	leal	2(%eax), %edx
  28311d: 8b 45 dc                     	movl	-36(%ebp), %eax
  283120: 01 c2                        	addl	%eax, %edx
  283122: 0f b6 01                     	movzbl	(%ecx), %eax
  283125: 88 02                        	movb	%al, (%edx)
  283127: 8b 45 08                     	movl	8(%ebp), %eax
  28312a: 8b 40 08                     	movl	8(%eax), %eax
  28312d: 0f af 45 c8                  	imull	-56(%ebp), %eax
  283131: 89 c2                        	movl	%eax, %edx
  283133: 8b 45 c4                     	movl	-60(%ebp), %eax
  283136: 01 d0                        	addl	%edx, %eax
  283138: 8d 50 03                     	leal	3(%eax), %edx
  28313b: 8b 45 d8                     	movl	-40(%ebp), %eax
  28313e: 01 d0                        	addl	%edx, %eax
  283140: 0f b6 00                     	movzbl	(%eax), %eax
  283143: 38 45 cf                     	cmpb	%al, -49(%ebp)
  283146: 75 38                        	jne	56 <sheet_refreshsub+0x43a>
  283148: 8b 45 d4                     	movl	-44(%ebp), %eax
  28314b: 8b 40 04                     	movl	4(%eax), %eax
  28314e: 0f af 45 f4                  	imull	-12(%ebp), %eax
  283152: 89 c2                        	movl	%eax, %edx
  283154: 8b 45 ac                     	movl	-84(%ebp), %eax
  283157: 01 d0                        	addl	%edx, %eax
  283159: 8d 50 03                     	leal	3(%eax), %edx
  28315c: 8b 45 d0                     	movl	-48(%ebp), %eax
  28315f: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  283162: 8b 45 08                     	movl	8(%ebp), %eax
  283165: 8b 40 08                     	movl	8(%eax), %eax
  283168: 0f af 45 c8                  	imull	-56(%ebp), %eax
  28316c: 89 c2                        	movl	%eax, %edx
  28316e: 8b 45 c4                     	movl	-60(%ebp), %eax
  283171: 01 d0                        	addl	%edx, %eax
  283173: 8d 50 03                     	leal	3(%eax), %edx
  283176: 8b 45 dc                     	movl	-36(%ebp), %eax
  283179: 01 c2                        	addl	%eax, %edx
  28317b: 0f b6 01                     	movzbl	(%ecx), %eax
  28317e: 88 02                        	movb	%al, (%edx)
  283180: 83 45 e0 01                  	addl	$1, -32(%ebp)
  283184: 8b 45 e0                     	movl	-32(%ebp), %eax
  283187: 3b 45 c0                     	cmpl	-64(%ebp), %eax
  28318a: 0f 8c 32 fe ff ff            	jl	-462 <sheet_refreshsub+0x27c>
  283190: 8b 45 c0                     	movl	-64(%ebp), %eax
  283193: c1 e0 02                     	shll	$2, %eax
  283196: 01 45 f8                     	addl	%eax, -8(%ebp)
  283199: eb 68                        	jmp	104 <sheet_refreshsub+0x4bd>
  28319b: 8b 45 d4                     	movl	-44(%ebp), %eax
  28319e: 8b 50 0c                     	movl	12(%eax), %edx
  2831a1: 8b 45 f8                     	movl	-8(%ebp), %eax
  2831a4: 01 d0                        	addl	%edx, %eax
  2831a6: 89 45 c4                     	movl	%eax, -60(%ebp)
  2831a9: 8b 45 08                     	movl	8(%ebp), %eax
  2831ac: 8b 40 08                     	movl	8(%eax), %eax
  2831af: 0f af 45 c8                  	imull	-56(%ebp), %eax
  2831b3: 89 c2                        	movl	%eax, %edx
  2831b5: 8b 45 c4                     	movl	-60(%ebp), %eax
  2831b8: 01 d0                        	addl	%edx, %eax
  2831ba: 89 c2                        	movl	%eax, %edx
  2831bc: 8b 45 d8                     	movl	-40(%ebp), %eax
  2831bf: 01 d0                        	addl	%edx, %eax
  2831c1: 0f b6 00                     	movzbl	(%eax), %eax
  2831c4: 38 45 cf                     	cmpb	%al, -49(%ebp)
  2831c7: 75 36                        	jne	54 <sheet_refreshsub+0x4b9>
  2831c9: 8b 45 d4                     	movl	-44(%ebp), %eax
  2831cc: 8b 40 04                     	movl	4(%eax), %eax
  2831cf: 0f af 45 f4                  	imull	-12(%ebp), %eax
  2831d3: 89 c2                        	movl	%eax, %edx
  2831d5: 8b 45 f8                     	movl	-8(%ebp), %eax
  2831d8: 01 d0                        	addl	%edx, %eax
  2831da: 89 c2                        	movl	%eax, %edx
  2831dc: 8b 45 d0                     	movl	-48(%ebp), %eax
  2831df: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  2831e2: 8b 45 08                     	movl	8(%ebp), %eax
  2831e5: 8b 40 08                     	movl	8(%eax), %eax
  2831e8: 0f af 45 c8                  	imull	-56(%ebp), %eax
  2831ec: 89 c2                        	movl	%eax, %edx
  2831ee: 8b 45 c4                     	movl	-60(%ebp), %eax
  2831f1: 01 d0                        	addl	%edx, %eax
  2831f3: 89 c2                        	movl	%eax, %edx
  2831f5: 8b 45 dc                     	movl	-36(%ebp), %eax
  2831f8: 01 c2                        	addl	%eax, %edx
  2831fa: 0f b6 01                     	movzbl	(%ecx), %eax
  2831fd: 88 02                        	movb	%al, (%edx)
  2831ff: 83 45 f8 01                  	addl	$1, -8(%ebp)
  283203: 8b 45 f8                     	movl	-8(%ebp), %eax
  283206: 3b 45 e8                     	cmpl	-24(%ebp), %eax
  283209: 7c 90                        	jl	-112 <sheet_refreshsub+0x455>
  28320b: 83 45 f4 01                  	addl	$1, -12(%ebp)
  28320f: 8b 45 f4                     	movl	-12(%ebp), %eax
  283212: 3b 45 e4                     	cmpl	-28(%ebp), %eax
  283215: 0f 8c ac fc ff ff            	jl	-852 <sheet_refreshsub+0x181>
  28321b: e9 a1 00 00 00               	jmp	161 <sheet_refreshsub+0x57b>
  283220: 8b 45 ec                     	movl	-20(%ebp), %eax
  283223: 89 45 f4                     	movl	%eax, -12(%ebp)
  283226: e9 8a 00 00 00               	jmp	138 <sheet_refreshsub+0x56f>
  28322b: 8b 45 d4                     	movl	-44(%ebp), %eax
  28322e: 8b 50 10                     	movl	16(%eax), %edx
  283231: 8b 45 f4                     	movl	-12(%ebp), %eax
  283234: 01 d0                        	addl	%edx, %eax
  283236: 89 45 c8                     	movl	%eax, -56(%ebp)
  283239: 8b 45 f0                     	movl	-16(%ebp), %eax
  28323c: 89 45 f8                     	movl	%eax, -8(%ebp)
  28323f: eb 68                        	jmp	104 <sheet_refreshsub+0x563>
  283241: 8b 45 d4                     	movl	-44(%ebp), %eax
  283244: 8b 50 0c                     	movl	12(%eax), %edx
  283247: 8b 45 f8                     	movl	-8(%ebp), %eax
  28324a: 01 d0                        	addl	%edx, %eax
  28324c: 89 45 c4                     	movl	%eax, -60(%ebp)
  28324f: 8b 45 08                     	movl	8(%ebp), %eax
  283252: 8b 40 08                     	movl	8(%eax), %eax
  283255: 0f af 45 c8                  	imull	-56(%ebp), %eax
  283259: 89 c2                        	movl	%eax, %edx
  28325b: 8b 45 c4                     	movl	-60(%ebp), %eax
  28325e: 01 d0                        	addl	%edx, %eax
  283260: 89 c2                        	movl	%eax, %edx
  283262: 8b 45 d8                     	movl	-40(%ebp), %eax
  283265: 01 d0                        	addl	%edx, %eax
  283267: 0f b6 00                     	movzbl	(%eax), %eax
  28326a: 38 45 cf                     	cmpb	%al, -49(%ebp)
  28326d: 75 36                        	jne	54 <sheet_refreshsub+0x55f>
  28326f: 8b 45 d4                     	movl	-44(%ebp), %eax
  283272: 8b 40 04                     	movl	4(%eax), %eax
  283275: 0f af 45 f4                  	imull	-12(%ebp), %eax
  283279: 89 c2                        	movl	%eax, %edx
  28327b: 8b 45 f8                     	movl	-8(%ebp), %eax
  28327e: 01 d0                        	addl	%edx, %eax
  283280: 89 c2                        	movl	%eax, %edx
  283282: 8b 45 d0                     	movl	-48(%ebp), %eax
  283285: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  283288: 8b 45 08                     	movl	8(%ebp), %eax
  28328b: 8b 40 08                     	movl	8(%eax), %eax
  28328e: 0f af 45 c8                  	imull	-56(%ebp), %eax
  283292: 89 c2                        	movl	%eax, %edx
  283294: 8b 45 c4                     	movl	-60(%ebp), %eax
  283297: 01 d0                        	addl	%edx, %eax
  283299: 89 c2                        	movl	%eax, %edx
  28329b: 8b 45 dc                     	movl	-36(%ebp), %eax
  28329e: 01 c2                        	addl	%eax, %edx
  2832a0: 0f b6 01                     	movzbl	(%ecx), %eax
  2832a3: 88 02                        	movb	%al, (%edx)
  2832a5: 83 45 f8 01                  	addl	$1, -8(%ebp)
  2832a9: 8b 45 f8                     	movl	-8(%ebp), %eax
  2832ac: 3b 45 e8                     	cmpl	-24(%ebp), %eax
  2832af: 7c 90                        	jl	-112 <sheet_refreshsub+0x4fb>
  2832b1: 83 45 f4 01                  	addl	$1, -12(%ebp)
  2832b5: 8b 45 f4                     	movl	-12(%ebp), %eax
  2832b8: 3b 45 e4                     	cmpl	-28(%ebp), %eax
  2832bb: 0f 8c 6a ff ff ff            	jl	-150 <sheet_refreshsub+0x4e5>
  2832c1: 83 45 fc 01                  	addl	$1, -4(%ebp)
  2832c5: 8b 45 fc                     	movl	-4(%ebp), %eax
  2832c8: 3b 45 20                     	cmpl	32(%ebp), %eax
  2832cb: 0f 8e d9 fa ff ff            	jle	-1319 <sheet_refreshsub+0x64>
  2832d1: 90                           	nop
  2832d2: c9                           	leave
  2832d3: c3                           	retl

002832d4 sheet_updown:
  2832d4: 55                           	pushl	%ebp
  2832d5: 89 e5                        	movl	%esp, %ebp
  2832d7: 56                           	pushl	%esi
  2832d8: 53                           	pushl	%ebx
  2832d9: 83 ec 10                     	subl	$16, %esp
  2832dc: 8b 45 08                     	movl	8(%ebp), %eax
  2832df: 8b 40 20                     	movl	32(%eax), %eax
  2832e2: 89 45 f0                     	movl	%eax, -16(%ebp)
  2832e5: 8b 45 08                     	movl	8(%ebp), %eax
  2832e8: 8b 40 18                     	movl	24(%eax), %eax
  2832eb: 89 45 ec                     	movl	%eax, -20(%ebp)
  2832ee: 8b 45 f0                     	movl	-16(%ebp), %eax
  2832f1: 8b 40 10                     	movl	16(%eax), %eax
  2832f4: 83 c0 01                     	addl	$1, %eax
  2832f7: 39 45 0c                     	cmpl	%eax, 12(%ebp)
  2832fa: 7e 0c                        	jle	12 <sheet_updown+0x34>
  2832fc: 8b 45 f0                     	movl	-16(%ebp), %eax
  2832ff: 8b 40 10                     	movl	16(%eax), %eax
  283302: 83 c0 01                     	addl	$1, %eax
  283305: 89 45 0c                     	movl	%eax, 12(%ebp)
  283308: 83 7d 0c ff                  	cmpl	$-1, 12(%ebp)
  28330c: 7d 07                        	jge	7 <sheet_updown+0x41>
  28330e: c7 45 0c ff ff ff ff         	movl	$4294967295, 12(%ebp)
  283315: 8b 45 08                     	movl	8(%ebp), %eax
  283318: 8b 55 0c                     	movl	12(%ebp), %edx
  28331b: 89 50 18                     	movl	%edx, 24(%eax)
  28331e: 8b 45 ec                     	movl	-20(%ebp), %eax
  283321: 3b 45 0c                     	cmpl	12(%ebp), %eax
  283324: 0f 8e c9 01 00 00            	jle	457 <sheet_updown+0x21f>
  28332a: 83 7d 0c 00                  	cmpl	$0, 12(%ebp)
  28332e: 0f 88 dc 00 00 00            	js	220 <sheet_updown+0x13c>
  283334: 8b 45 ec                     	movl	-20(%ebp), %eax
  283337: 89 45 f4                     	movl	%eax, -12(%ebp)
  28333a: eb 34                        	jmp	52 <sheet_updown+0x9c>
  28333c: 8b 45 f4                     	movl	-12(%ebp), %eax
  28333f: 8d 50 ff                     	leal	-1(%eax), %edx
  283342: 8b 45 f0                     	movl	-16(%ebp), %eax
  283345: 83 c2 04                     	addl	$4, %edx
  283348: 8b 54 90 04                  	movl	4(%eax,%edx,4), %edx
  28334c: 8b 45 f0                     	movl	-16(%ebp), %eax
  28334f: 8b 4d f4                     	movl	-12(%ebp), %ecx
  283352: 83 c1 04                     	addl	$4, %ecx
  283355: 89 54 88 04                  	movl	%edx, 4(%eax,%ecx,4)
  283359: 8b 45 f0                     	movl	-16(%ebp), %eax
  28335c: 8b 55 f4                     	movl	-12(%ebp), %edx
  28335f: 83 c2 04                     	addl	$4, %edx
  283362: 8b 44 90 04                  	movl	4(%eax,%edx,4), %eax
  283366: 8b 55 f4                     	movl	-12(%ebp), %edx
  283369: 89 50 18                     	movl	%edx, 24(%eax)
  28336c: 83 6d f4 01                  	subl	$1, -12(%ebp)
  283370: 8b 45 f4                     	movl	-12(%ebp), %eax
  283373: 3b 45 0c                     	cmpl	12(%ebp), %eax
  283376: 7f c4                        	jg	-60 <sheet_updown+0x68>
  283378: 8b 45 f0                     	movl	-16(%ebp), %eax
  28337b: 8b 55 0c                     	movl	12(%ebp), %edx
  28337e: 8d 4a 04                     	leal	4(%edx), %ecx
  283381: 8b 55 08                     	movl	8(%ebp), %edx
  283384: 89 54 88 04                  	movl	%edx, 4(%eax,%ecx,4)
  283388: 8b 45 0c                     	movl	12(%ebp), %eax
  28338b: 8d 70 01                     	leal	1(%eax), %esi
  28338e: 8b 45 08                     	movl	8(%ebp), %eax
  283391: 8b 50 10                     	movl	16(%eax), %edx
  283394: 8b 45 08                     	movl	8(%ebp), %eax
  283397: 8b 40 08                     	movl	8(%eax), %eax
  28339a: 8d 1c 02                     	leal	(%edx,%eax), %ebx
  28339d: 8b 45 08                     	movl	8(%ebp), %eax
  2833a0: 8b 50 0c                     	movl	12(%eax), %edx
  2833a3: 8b 45 08                     	movl	8(%ebp), %eax
  2833a6: 8b 40 04                     	movl	4(%eax), %eax
  2833a9: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  2833ac: 8b 45 08                     	movl	8(%ebp), %eax
  2833af: 8b 50 10                     	movl	16(%eax), %edx
  2833b2: 8b 45 08                     	movl	8(%ebp), %eax
  2833b5: 8b 40 0c                     	movl	12(%eax), %eax
  2833b8: 56                           	pushl	%esi
  2833b9: 53                           	pushl	%ebx
  2833ba: 51                           	pushl	%ecx
  2833bb: 52                           	pushl	%edx
  2833bc: 50                           	pushl	%eax
  2833bd: ff 75 f0                     	pushl	-16(%ebp)
  2833c0: e8 7b f6 ff ff               	calll	-2437 <sheet_refreshmap>
  2833c5: 83 c4 18                     	addl	$24, %esp
  2833c8: 8b 45 0c                     	movl	12(%ebp), %eax
  2833cb: 8d 70 01                     	leal	1(%eax), %esi
  2833ce: 8b 45 08                     	movl	8(%ebp), %eax
  2833d1: 8b 50 10                     	movl	16(%eax), %edx
  2833d4: 8b 45 08                     	movl	8(%ebp), %eax
  2833d7: 8b 40 08                     	movl	8(%eax), %eax
  2833da: 8d 1c 02                     	leal	(%edx,%eax), %ebx
  2833dd: 8b 45 08                     	movl	8(%ebp), %eax
  2833e0: 8b 50 0c                     	movl	12(%eax), %edx
  2833e3: 8b 45 08                     	movl	8(%ebp), %eax
  2833e6: 8b 40 04                     	movl	4(%eax), %eax
  2833e9: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  2833ec: 8b 45 08                     	movl	8(%ebp), %eax
  2833ef: 8b 50 10                     	movl	16(%eax), %edx
  2833f2: 8b 45 08                     	movl	8(%ebp), %eax
  2833f5: 8b 40 0c                     	movl	12(%eax), %eax
  2833f8: ff 75 ec                     	pushl	-20(%ebp)
  2833fb: 56                           	pushl	%esi
  2833fc: 53                           	pushl	%ebx
  2833fd: 51                           	pushl	%ecx
  2833fe: 52                           	pushl	%edx
  2833ff: 50                           	pushl	%eax
  283400: ff 75 f0                     	pushl	-16(%ebp)
  283403: e8 3e f9 ff ff               	calll	-1730 <sheet_refreshsub>
  283408: 83 c4 1c                     	addl	$28, %esp
  28340b: e9 33 02 00 00               	jmp	563 <sheet_updown+0x36f>
  283410: 8b 45 f0                     	movl	-16(%ebp), %eax
  283413: 8b 40 10                     	movl	16(%eax), %eax
  283416: 39 45 ec                     	cmpl	%eax, -20(%ebp)
  283419: 7d 47                        	jge	71 <sheet_updown+0x18e>
  28341b: 8b 45 ec                     	movl	-20(%ebp), %eax
  28341e: 89 45 f4                     	movl	%eax, -12(%ebp)
  283421: eb 34                        	jmp	52 <sheet_updown+0x183>
  283423: 8b 45 f4                     	movl	-12(%ebp), %eax
  283426: 8d 50 01                     	leal	1(%eax), %edx
  283429: 8b 45 f0                     	movl	-16(%ebp), %eax
  28342c: 83 c2 04                     	addl	$4, %edx
  28342f: 8b 54 90 04                  	movl	4(%eax,%edx,4), %edx
  283433: 8b 45 f0                     	movl	-16(%ebp), %eax
  283436: 8b 4d f4                     	movl	-12(%ebp), %ecx
  283439: 83 c1 04                     	addl	$4, %ecx
  28343c: 89 54 88 04                  	movl	%edx, 4(%eax,%ecx,4)
  283440: 8b 45 f0                     	movl	-16(%ebp), %eax
  283443: 8b 55 f4                     	movl	-12(%ebp), %edx
  283446: 83 c2 04                     	addl	$4, %edx
  283449: 8b 44 90 04                  	movl	4(%eax,%edx,4), %eax
  28344d: 8b 55 f4                     	movl	-12(%ebp), %edx
  283450: 89 50 18                     	movl	%edx, 24(%eax)
  283453: 83 45 f4 01                  	addl	$1, -12(%ebp)
  283457: 8b 45 f0                     	movl	-16(%ebp), %eax
  28345a: 8b 40 10                     	movl	16(%eax), %eax
  28345d: 39 45 f4                     	cmpl	%eax, -12(%ebp)
  283460: 7c c1                        	jl	-63 <sheet_updown+0x14f>
  283462: 8b 45 f0                     	movl	-16(%ebp), %eax
  283465: 8b 40 10                     	movl	16(%eax), %eax
  283468: 8d 50 ff                     	leal	-1(%eax), %edx
  28346b: 8b 45 f0                     	movl	-16(%ebp), %eax
  28346e: 89 50 10                     	movl	%edx, 16(%eax)
  283471: 8b 45 08                     	movl	8(%ebp), %eax
  283474: 8b 50 10                     	movl	16(%eax), %edx
  283477: 8b 45 08                     	movl	8(%ebp), %eax
  28347a: 8b 40 08                     	movl	8(%eax), %eax
  28347d: 8d 1c 02                     	leal	(%edx,%eax), %ebx
  283480: 8b 45 08                     	movl	8(%ebp), %eax
  283483: 8b 50 0c                     	movl	12(%eax), %edx
  283486: 8b 45 08                     	movl	8(%ebp), %eax
  283489: 8b 40 04                     	movl	4(%eax), %eax
  28348c: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  28348f: 8b 45 08                     	movl	8(%ebp), %eax
  283492: 8b 50 10                     	movl	16(%eax), %edx
  283495: 8b 45 08                     	movl	8(%ebp), %eax
  283498: 8b 40 0c                     	movl	12(%eax), %eax
  28349b: 6a 00                        	pushl	$0
  28349d: 53                           	pushl	%ebx
  28349e: 51                           	pushl	%ecx
  28349f: 52                           	pushl	%edx
  2834a0: 50                           	pushl	%eax
  2834a1: ff 75 f0                     	pushl	-16(%ebp)
  2834a4: e8 97 f5 ff ff               	calll	-2665 <sheet_refreshmap>
  2834a9: 83 c4 18                     	addl	$24, %esp
  2834ac: 8b 45 ec                     	movl	-20(%ebp), %eax
  2834af: 8d 70 ff                     	leal	-1(%eax), %esi
  2834b2: 8b 45 08                     	movl	8(%ebp), %eax
  2834b5: 8b 50 10                     	movl	16(%eax), %edx
  2834b8: 8b 45 08                     	movl	8(%ebp), %eax
  2834bb: 8b 40 08                     	movl	8(%eax), %eax
  2834be: 8d 1c 02                     	leal	(%edx,%eax), %ebx
  2834c1: 8b 45 08                     	movl	8(%ebp), %eax
  2834c4: 8b 50 0c                     	movl	12(%eax), %edx
  2834c7: 8b 45 08                     	movl	8(%ebp), %eax
  2834ca: 8b 40 04                     	movl	4(%eax), %eax
  2834cd: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  2834d0: 8b 45 08                     	movl	8(%ebp), %eax
  2834d3: 8b 50 10                     	movl	16(%eax), %edx
  2834d6: 8b 45 08                     	movl	8(%ebp), %eax
  2834d9: 8b 40 0c                     	movl	12(%eax), %eax
  2834dc: 56                           	pushl	%esi
  2834dd: 6a 00                        	pushl	$0
  2834df: 53                           	pushl	%ebx
  2834e0: 51                           	pushl	%ecx
  2834e1: 52                           	pushl	%edx
  2834e2: 50                           	pushl	%eax
  2834e3: ff 75 f0                     	pushl	-16(%ebp)
  2834e6: e8 5b f8 ff ff               	calll	-1957 <sheet_refreshsub>
  2834eb: 83 c4 1c                     	addl	$28, %esp
  2834ee: e9 50 01 00 00               	jmp	336 <sheet_updown+0x36f>
  2834f3: 8b 45 ec                     	movl	-20(%ebp), %eax
  2834f6: 3b 45 0c                     	cmpl	12(%ebp), %eax
  2834f9: 0f 8d 44 01 00 00            	jge	324 <sheet_updown+0x36f>
  2834ff: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
  283503: 78 56                        	js	86 <sheet_updown+0x287>
  283505: 8b 45 ec                     	movl	-20(%ebp), %eax
  283508: 89 45 f4                     	movl	%eax, -12(%ebp)
  28350b: eb 34                        	jmp	52 <sheet_updown+0x26d>
  28350d: 8b 45 f4                     	movl	-12(%ebp), %eax
  283510: 8d 50 01                     	leal	1(%eax), %edx
  283513: 8b 45 f0                     	movl	-16(%ebp), %eax
  283516: 83 c2 04                     	addl	$4, %edx
  283519: 8b 54 90 04                  	movl	4(%eax,%edx,4), %edx
  28351d: 8b 45 f0                     	movl	-16(%ebp), %eax
  283520: 8b 4d f4                     	movl	-12(%ebp), %ecx
  283523: 83 c1 04                     	addl	$4, %ecx
  283526: 89 54 88 04                  	movl	%edx, 4(%eax,%ecx,4)
  28352a: 8b 45 f0                     	movl	-16(%ebp), %eax
  28352d: 8b 55 f4                     	movl	-12(%ebp), %edx
  283530: 83 c2 04                     	addl	$4, %edx
  283533: 8b 44 90 04                  	movl	4(%eax,%edx,4), %eax
  283537: 8b 55 f4                     	movl	-12(%ebp), %edx
  28353a: 89 50 18                     	movl	%edx, 24(%eax)
  28353d: 83 45 f4 01                  	addl	$1, -12(%ebp)
  283541: 8b 45 f4                     	movl	-12(%ebp), %eax
  283544: 3b 45 0c                     	cmpl	12(%ebp), %eax
  283547: 7c c4                        	jl	-60 <sheet_updown+0x239>
  283549: 8b 45 f0                     	movl	-16(%ebp), %eax
  28354c: 8b 55 0c                     	movl	12(%ebp), %edx
  28354f: 8d 4a 04                     	leal	4(%edx), %ecx
  283552: 8b 55 08                     	movl	8(%ebp), %edx
  283555: 89 54 88 04                  	movl	%edx, 4(%eax,%ecx,4)
  283559: eb 6c                        	jmp	108 <sheet_updown+0x2f3>
  28355b: 8b 45 f0                     	movl	-16(%ebp), %eax
  28355e: 8b 40 10                     	movl	16(%eax), %eax
  283561: 89 45 f4                     	movl	%eax, -12(%ebp)
  283564: eb 3a                        	jmp	58 <sheet_updown+0x2cc>
  283566: 8b 45 f4                     	movl	-12(%ebp), %eax
  283569: 8d 48 01                     	leal	1(%eax), %ecx
  28356c: 8b 45 f0                     	movl	-16(%ebp), %eax
  28356f: 8b 55 f4                     	movl	-12(%ebp), %edx
  283572: 83 c2 04                     	addl	$4, %edx
  283575: 8b 54 90 04                  	movl	4(%eax,%edx,4), %edx
  283579: 8b 45 f0                     	movl	-16(%ebp), %eax
  28357c: 83 c1 04                     	addl	$4, %ecx
  28357f: 89 54 88 04                  	movl	%edx, 4(%eax,%ecx,4)
  283583: 8b 45 f4                     	movl	-12(%ebp), %eax
  283586: 8d 50 01                     	leal	1(%eax), %edx
  283589: 8b 45 f0                     	movl	-16(%ebp), %eax
  28358c: 83 c2 04                     	addl	$4, %edx
  28358f: 8b 44 90 04                  	movl	4(%eax,%edx,4), %eax
  283593: 8b 55 f4                     	movl	-12(%ebp), %edx
  283596: 83 c2 01                     	addl	$1, %edx
  283599: 89 50 18                     	movl	%edx, 24(%eax)
  28359c: 83 6d f4 01                  	subl	$1, -12(%ebp)
  2835a0: 8b 45 f4                     	movl	-12(%ebp), %eax
  2835a3: 3b 45 0c                     	cmpl	12(%ebp), %eax
  2835a6: 7d be                        	jge	-66 <sheet_updown+0x292>
  2835a8: 8b 45 f0                     	movl	-16(%ebp), %eax
  2835ab: 8b 55 0c                     	movl	12(%ebp), %edx
  2835ae: 8d 4a 04                     	leal	4(%edx), %ecx
  2835b1: 8b 55 08                     	movl	8(%ebp), %edx
  2835b4: 89 54 88 04                  	movl	%edx, 4(%eax,%ecx,4)
  2835b8: 8b 45 f0                     	movl	-16(%ebp), %eax
  2835bb: 8b 40 10                     	movl	16(%eax), %eax
  2835be: 8d 50 01                     	leal	1(%eax), %edx
  2835c1: 8b 45 f0                     	movl	-16(%ebp), %eax
  2835c4: 89 50 10                     	movl	%edx, 16(%eax)
  2835c7: 8b 45 08                     	movl	8(%ebp), %eax
  2835ca: 8b 50 10                     	movl	16(%eax), %edx
  2835cd: 8b 45 08                     	movl	8(%ebp), %eax
  2835d0: 8b 40 08                     	movl	8(%eax), %eax
  2835d3: 8d 1c 02                     	leal	(%edx,%eax), %ebx
  2835d6: 8b 45 08                     	movl	8(%ebp), %eax
  2835d9: 8b 50 0c                     	movl	12(%eax), %edx
  2835dc: 8b 45 08                     	movl	8(%ebp), %eax
  2835df: 8b 40 04                     	movl	4(%eax), %eax
  2835e2: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  2835e5: 8b 45 08                     	movl	8(%ebp), %eax
  2835e8: 8b 50 10                     	movl	16(%eax), %edx
  2835eb: 8b 45 08                     	movl	8(%ebp), %eax
  2835ee: 8b 40 0c                     	movl	12(%eax), %eax
  2835f1: ff 75 0c                     	pushl	12(%ebp)
  2835f4: 53                           	pushl	%ebx
  2835f5: 51                           	pushl	%ecx
  2835f6: 52                           	pushl	%edx
  2835f7: 50                           	pushl	%eax
  2835f8: ff 75 f0                     	pushl	-16(%ebp)
  2835fb: e8 40 f4 ff ff               	calll	-3008 <sheet_refreshmap>
  283600: 83 c4 18                     	addl	$24, %esp
  283603: 8b 45 08                     	movl	8(%ebp), %eax
  283606: 8b 50 10                     	movl	16(%eax), %edx
  283609: 8b 45 08                     	movl	8(%ebp), %eax
  28360c: 8b 40 08                     	movl	8(%eax), %eax
  28360f: 8d 1c 02                     	leal	(%edx,%eax), %ebx
  283612: 8b 45 08                     	movl	8(%ebp), %eax
  283615: 8b 50 0c                     	movl	12(%eax), %edx
  283618: 8b 45 08                     	movl	8(%ebp), %eax
  28361b: 8b 40 04                     	movl	4(%eax), %eax
  28361e: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  283621: 8b 45 08                     	movl	8(%ebp), %eax
  283624: 8b 50 10                     	movl	16(%eax), %edx
  283627: 8b 45 08                     	movl	8(%ebp), %eax
  28362a: 8b 40 0c                     	movl	12(%eax), %eax
  28362d: ff 75 0c                     	pushl	12(%ebp)
  283630: ff 75 0c                     	pushl	12(%ebp)
  283633: 53                           	pushl	%ebx
  283634: 51                           	pushl	%ecx
  283635: 52                           	pushl	%edx
  283636: 50                           	pushl	%eax
  283637: ff 75 f0                     	pushl	-16(%ebp)
  28363a: e8 07 f7 ff ff               	calll	-2297 <sheet_refreshsub>
  28363f: 83 c4 1c                     	addl	$28, %esp
  283642: 90                           	nop
  283643: 90                           	nop
  283644: 8d 65 f8                     	leal	-8(%ebp), %esp
  283647: 5b                           	popl	%ebx
  283648: 5e                           	popl	%esi
  283649: 5d                           	popl	%ebp
  28364a: c3                           	retl

0028364b sheet_refresh:
  28364b: 55                           	pushl	%ebp
  28364c: 89 e5                        	movl	%esp, %ebp
  28364e: 57                           	pushl	%edi
  28364f: 56                           	pushl	%esi
  283650: 53                           	pushl	%ebx
  283651: 83 ec 04                     	subl	$4, %esp
  283654: 8b 45 08                     	movl	8(%ebp), %eax
  283657: 8b 40 18                     	movl	24(%eax), %eax
  28365a: 85 c0                        	testl	%eax, %eax
  28365c: 78 55                        	js	85 <sheet_refresh+0x68>
  28365e: 8b 45 08                     	movl	8(%ebp), %eax
  283661: 8b 58 18                     	movl	24(%eax), %ebx
  283664: 8b 45 08                     	movl	8(%ebp), %eax
  283667: 8b 48 18                     	movl	24(%eax), %ecx
  28366a: 8b 45 08                     	movl	8(%ebp), %eax
  28366d: 8b 50 10                     	movl	16(%eax), %edx
  283670: 8b 45 18                     	movl	24(%ebp), %eax
  283673: 01 d0                        	addl	%edx, %eax
  283675: 89 45 f0                     	movl	%eax, -16(%ebp)
  283678: 8b 45 08                     	movl	8(%ebp), %eax
  28367b: 8b 50 0c                     	movl	12(%eax), %edx
  28367e: 8b 45 14                     	movl	20(%ebp), %eax
  283681: 8d 3c 02                     	leal	(%edx,%eax), %edi
  283684: 8b 45 08                     	movl	8(%ebp), %eax
  283687: 8b 50 10                     	movl	16(%eax), %edx
  28368a: 8b 45 10                     	movl	16(%ebp), %eax
  28368d: 8d 34 02                     	leal	(%edx,%eax), %esi
  283690: 8b 45 08                     	movl	8(%ebp), %eax
  283693: 8b 50 0c                     	movl	12(%eax), %edx
  283696: 8b 45 0c                     	movl	12(%ebp), %eax
  283699: 01 c2                        	addl	%eax, %edx
  28369b: 8b 45 08                     	movl	8(%ebp), %eax
  28369e: 8b 40 20                     	movl	32(%eax), %eax
  2836a1: 53                           	pushl	%ebx
  2836a2: 51                           	pushl	%ecx
  2836a3: ff 75 f0                     	pushl	-16(%ebp)
  2836a6: 57                           	pushl	%edi
  2836a7: 56                           	pushl	%esi
  2836a8: 52                           	pushl	%edx
  2836a9: 50                           	pushl	%eax
  2836aa: e8 97 f6 ff ff               	calll	-2409 <sheet_refreshsub>
  2836af: 83 c4 1c                     	addl	$28, %esp
  2836b2: 90                           	nop
  2836b3: 90                           	nop
  2836b4: 8d 65 f4                     	leal	-12(%ebp), %esp
  2836b7: 5b                           	popl	%ebx
  2836b8: 5e                           	popl	%esi
  2836b9: 5f                           	popl	%edi
  2836ba: 5d                           	popl	%ebp
  2836bb: c3                           	retl

002836bc sheet_slide:
  2836bc: 55                           	pushl	%ebp
  2836bd: 89 e5                        	movl	%esp, %ebp
  2836bf: 56                           	pushl	%esi
  2836c0: 53                           	pushl	%ebx
  2836c1: 83 ec 10                     	subl	$16, %esp
  2836c4: 8b 45 08                     	movl	8(%ebp), %eax
  2836c7: 8b 40 20                     	movl	32(%eax), %eax
  2836ca: 89 45 f4                     	movl	%eax, -12(%ebp)
  2836cd: 8b 45 08                     	movl	8(%ebp), %eax
  2836d0: 8b 40 0c                     	movl	12(%eax), %eax
  2836d3: 89 45 f0                     	movl	%eax, -16(%ebp)
  2836d6: 8b 45 08                     	movl	8(%ebp), %eax
  2836d9: 8b 40 10                     	movl	16(%eax), %eax
  2836dc: 89 45 ec                     	movl	%eax, -20(%ebp)
  2836df: 8b 45 08                     	movl	8(%ebp), %eax
  2836e2: 8b 55 0c                     	movl	12(%ebp), %edx
  2836e5: 89 50 0c                     	movl	%edx, 12(%eax)
  2836e8: 8b 45 08                     	movl	8(%ebp), %eax
  2836eb: 8b 55 10                     	movl	16(%ebp), %edx
  2836ee: 89 50 10                     	movl	%edx, 16(%eax)
  2836f1: 8b 45 08                     	movl	8(%ebp), %eax
  2836f4: 8b 40 18                     	movl	24(%eax), %eax
  2836f7: 85 c0                        	testl	%eax, %eax
  2836f9: 0f 88 c8 00 00 00            	js	200 <sheet_slide+0x10b>
  2836ff: 8b 45 08                     	movl	8(%ebp), %eax
  283702: 8b 50 08                     	movl	8(%eax), %edx
  283705: 8b 45 ec                     	movl	-20(%ebp), %eax
  283708: 01 c2                        	addl	%eax, %edx
  28370a: 8b 45 08                     	movl	8(%ebp), %eax
  28370d: 8b 48 04                     	movl	4(%eax), %ecx
  283710: 8b 45 f0                     	movl	-16(%ebp), %eax
  283713: 01 c8                        	addl	%ecx, %eax
  283715: 6a 00                        	pushl	$0
  283717: 52                           	pushl	%edx
  283718: 50                           	pushl	%eax
  283719: ff 75 ec                     	pushl	-20(%ebp)
  28371c: ff 75 f0                     	pushl	-16(%ebp)
  28371f: ff 75 f4                     	pushl	-12(%ebp)
  283722: e8 19 f3 ff ff               	calll	-3303 <sheet_refreshmap>
  283727: 83 c4 18                     	addl	$24, %esp
  28372a: 8b 45 08                     	movl	8(%ebp), %eax
  28372d: 8b 40 18                     	movl	24(%eax), %eax
  283730: 8b 55 08                     	movl	8(%ebp), %edx
  283733: 8b 4a 08                     	movl	8(%edx), %ecx
  283736: 8b 55 10                     	movl	16(%ebp), %edx
  283739: 01 d1                        	addl	%edx, %ecx
  28373b: 8b 55 08                     	movl	8(%ebp), %edx
  28373e: 8b 5a 04                     	movl	4(%edx), %ebx
  283741: 8b 55 0c                     	movl	12(%ebp), %edx
  283744: 01 da                        	addl	%ebx, %edx
  283746: 50                           	pushl	%eax
  283747: 51                           	pushl	%ecx
  283748: 52                           	pushl	%edx
  283749: ff 75 10                     	pushl	16(%ebp)
  28374c: ff 75 0c                     	pushl	12(%ebp)
  28374f: ff 75 f4                     	pushl	-12(%ebp)
  283752: e8 e9 f2 ff ff               	calll	-3351 <sheet_refreshmap>
  283757: 83 c4 18                     	addl	$24, %esp
  28375a: 8b 45 08                     	movl	8(%ebp), %eax
  28375d: 8b 40 18                     	movl	24(%eax), %eax
  283760: 8d 48 ff                     	leal	-1(%eax), %ecx
  283763: 8b 45 08                     	movl	8(%ebp), %eax
  283766: 8b 50 08                     	movl	8(%eax), %edx
  283769: 8b 45 ec                     	movl	-20(%ebp), %eax
  28376c: 01 c2                        	addl	%eax, %edx
  28376e: 8b 45 08                     	movl	8(%ebp), %eax
  283771: 8b 58 04                     	movl	4(%eax), %ebx
  283774: 8b 45 f0                     	movl	-16(%ebp), %eax
  283777: 01 d8                        	addl	%ebx, %eax
  283779: 51                           	pushl	%ecx
  28377a: 6a 00                        	pushl	$0
  28377c: 52                           	pushl	%edx
  28377d: 50                           	pushl	%eax
  28377e: ff 75 ec                     	pushl	-20(%ebp)
  283781: ff 75 f0                     	pushl	-16(%ebp)
  283784: ff 75 f4                     	pushl	-12(%ebp)
  283787: e8 ba f5 ff ff               	calll	-2630 <sheet_refreshsub>
  28378c: 83 c4 1c                     	addl	$28, %esp
  28378f: 8b 45 08                     	movl	8(%ebp), %eax
  283792: 8b 50 18                     	movl	24(%eax), %edx
  283795: 8b 45 08                     	movl	8(%ebp), %eax
  283798: 8b 40 18                     	movl	24(%eax), %eax
  28379b: 8b 4d 08                     	movl	8(%ebp), %ecx
  28379e: 8b 59 08                     	movl	8(%ecx), %ebx
  2837a1: 8b 4d 10                     	movl	16(%ebp), %ecx
  2837a4: 01 cb                        	addl	%ecx, %ebx
  2837a6: 8b 4d 08                     	movl	8(%ebp), %ecx
  2837a9: 8b 71 04                     	movl	4(%ecx), %esi
  2837ac: 8b 4d 0c                     	movl	12(%ebp), %ecx
  2837af: 01 f1                        	addl	%esi, %ecx
  2837b1: 52                           	pushl	%edx
  2837b2: 50                           	pushl	%eax
  2837b3: 53                           	pushl	%ebx
  2837b4: 51                           	pushl	%ecx
  2837b5: ff 75 10                     	pushl	16(%ebp)
  2837b8: ff 75 0c                     	pushl	12(%ebp)
  2837bb: ff 75 f4                     	pushl	-12(%ebp)
  2837be: e8 83 f5 ff ff               	calll	-2685 <sheet_refreshsub>
  2837c3: 83 c4 1c                     	addl	$28, %esp
  2837c6: 90                           	nop
  2837c7: 90                           	nop
  2837c8: 8d 65 f8                     	leal	-8(%ebp), %esp
  2837cb: 5b                           	popl	%ebx
  2837cc: 5e                           	popl	%esi
  2837cd: 5d                           	popl	%ebp
  2837ce: c3                           	retl

002837cf sheet_free:
  2837cf: 55                           	pushl	%ebp
  2837d0: 89 e5                        	movl	%esp, %ebp
  2837d2: 8b 45 08                     	movl	8(%ebp), %eax
  2837d5: 8b 40 18                     	movl	24(%eax), %eax
  2837d8: 85 c0                        	testl	%eax, %eax
  2837da: 78 0d                        	js	13 <sheet_free+0x1a>
  2837dc: 6a ff                        	pushl	$-1
  2837de: ff 75 08                     	pushl	8(%ebp)
  2837e1: e8 ee fa ff ff               	calll	-1298 <sheet_updown>
  2837e6: 83 c4 08                     	addl	$8, %esp
  2837e9: 8b 45 08                     	movl	8(%ebp), %eax
  2837ec: c7 40 1c 00 00 00 00         	movl	$0, 28(%eax)
  2837f3: 90                           	nop
  2837f4: c9                           	leave
  2837f5: c3                           	retl

002837f6 init_pit:
  2837f6: 55                           	pushl	%ebp
  2837f7: 89 e5                        	movl	%esp, %ebp
  2837f9: 83 ec 18                     	subl	$24, %esp
  2837fc: 83 ec 08                     	subl	$8, %esp
  2837ff: 6a 34                        	pushl	$52
  283801: 6a 43                        	pushl	$67
  283803: e8 3e d9 ff ff               	calll	-9922 <io_out8>
  283808: 83 c4 10                     	addl	$16, %esp
  28380b: 83 ec 08                     	subl	$8, %esp
  28380e: 68 9c 00 00 00               	pushl	$156
  283813: 6a 40                        	pushl	$64
  283815: e8 2c d9 ff ff               	calll	-9940 <io_out8>
  28381a: 83 c4 10                     	addl	$16, %esp
  28381d: 83 ec 08                     	subl	$8, %esp
  283820: 6a 2e                        	pushl	$46
  283822: 6a 40                        	pushl	$64
  283824: e8 1d d9 ff ff               	calll	-9955 <io_out8>
  283829: 83 c4 10                     	addl	$16, %esp
  28382c: c7 05 60 21 32 00 00 00 00 00	movl	$0, 3285344
  283836: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  28383d: eb 19                        	jmp	25 <init_pit+0x62>
  28383f: 8b 55 f4                     	movl	-12(%ebp), %edx
  283842: 89 d0                        	movl	%edx, %eax
  283844: c1 e0 02                     	shll	$2, %eax
  283847: 01 d0                        	addl	%edx, %eax
  283849: c1 e0 02                     	shll	$2, %eax
  28384c: 05 74 21 32 00               	addl	$3285364, %eax
  283851: c6 00 00                     	movb	$0, (%eax)
  283854: 83 45 f4 01                  	addl	$1, -12(%ebp)
  283858: 81 7d f4 f3 01 00 00         	cmpl	$499, -12(%ebp)
  28385f: 7e de                        	jle	-34 <init_pit+0x49>
  283861: e8 32 00 00 00               	calll	50 <timer_alloc>
  283866: 89 45 f0                     	movl	%eax, -16(%ebp)
  283869: 8b 45 f0                     	movl	-16(%ebp), %eax
  28386c: c7 40 04 ff ff ff ff         	movl	$4294967295, 4(%eax)
  283873: 8b 45 f0                     	movl	-16(%ebp), %eax
  283876: c6 40 08 02                  	movb	$2, 8(%eax)
  28387a: 8b 45 f0                     	movl	-16(%ebp), %eax
  28387d: c7 00 00 00 00 00            	movl	$0, (%eax)
  283883: 8b 45 f0                     	movl	-16(%ebp), %eax
  283886: a3 68 21 32 00               	movl	%eax, 3285352
  28388b: c7 05 64 21 32 00 ff ff ff ff	movl	$4294967295, 3285348
  283895: 90                           	nop
  283896: c9                           	leave
  283897: c3                           	retl

00283898 timer_alloc:
  283898: 55                           	pushl	%ebp
  283899: 89 e5                        	movl	%esp, %ebp
  28389b: 83 ec 10                     	subl	$16, %esp
  28389e: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  2838a5: eb 5e                        	jmp	94 <timer_alloc+0x6d>
  2838a7: 8b 55 fc                     	movl	-4(%ebp), %edx
  2838aa: 89 d0                        	movl	%edx, %eax
  2838ac: c1 e0 02                     	shll	$2, %eax
  2838af: 01 d0                        	addl	%edx, %eax
  2838b1: c1 e0 02                     	shll	$2, %eax
  2838b4: 05 74 21 32 00               	addl	$3285364, %eax
  2838b9: 0f b6 00                     	movzbl	(%eax), %eax
  2838bc: 84 c0                        	testb	%al, %al
  2838be: 75 41                        	jne	65 <timer_alloc+0x69>
  2838c0: 8b 55 fc                     	movl	-4(%ebp), %edx
  2838c3: 89 d0                        	movl	%edx, %eax
  2838c5: c1 e0 02                     	shll	$2, %eax
  2838c8: 01 d0                        	addl	%edx, %eax
  2838ca: c1 e0 02                     	shll	$2, %eax
  2838cd: 05 74 21 32 00               	addl	$3285364, %eax
  2838d2: c6 00 01                     	movb	$1, (%eax)
  2838d5: 8b 55 fc                     	movl	-4(%ebp), %edx
  2838d8: 89 d0                        	movl	%edx, %eax
  2838da: c1 e0 02                     	shll	$2, %eax
  2838dd: 01 d0                        	addl	%edx, %eax
  2838df: c1 e0 02                     	shll	$2, %eax
  2838e2: 05 75 21 32 00               	addl	$3285365, %eax
  2838e7: c6 00 00                     	movb	$0, (%eax)
  2838ea: 8b 55 fc                     	movl	-4(%ebp), %edx
  2838ed: 89 d0                        	movl	%edx, %eax
  2838ef: c1 e0 02                     	shll	$2, %eax
  2838f2: 01 d0                        	addl	%edx, %eax
  2838f4: c1 e0 02                     	shll	$2, %eax
  2838f7: 05 60 21 32 00               	addl	$3285344, %eax
  2838fc: 83 c0 0c                     	addl	$12, %eax
  2838ff: eb 12                        	jmp	18 <timer_alloc+0x7b>
  283901: 83 45 fc 01                  	addl	$1, -4(%ebp)
  283905: 81 7d fc f3 01 00 00         	cmpl	$499, -4(%ebp)
  28390c: 7e 99                        	jle	-103 <timer_alloc+0xf>
  28390e: b8 00 00 00 00               	movl	$0, %eax
  283913: c9                           	leave
  283914: c3                           	retl

00283915 timer_free:
  283915: 55                           	pushl	%ebp
  283916: 89 e5                        	movl	%esp, %ebp
  283918: 8b 45 08                     	movl	8(%ebp), %eax
  28391b: c6 40 08 00                  	movb	$0, 8(%eax)
  28391f: 90                           	nop
  283920: 5d                           	popl	%ebp
  283921: c3                           	retl

00283922 timer_init:
  283922: 55                           	pushl	%ebp
  283923: 89 e5                        	movl	%esp, %ebp
  283925: 8b 45 08                     	movl	8(%ebp), %eax
  283928: 8b 55 0c                     	movl	12(%ebp), %edx
  28392b: 89 50 0c                     	movl	%edx, 12(%eax)
  28392e: 8b 45 08                     	movl	8(%ebp), %eax
  283931: 8b 55 10                     	movl	16(%ebp), %edx
  283934: 89 50 10                     	movl	%edx, 16(%eax)
  283937: 90                           	nop
  283938: 5d                           	popl	%ebp
  283939: c3                           	retl

0028393a timer_settime:
  28393a: 55                           	pushl	%ebp
  28393b: 89 e5                        	movl	%esp, %ebp
  28393d: 83 ec 18                     	subl	$24, %esp
  283940: 8b 15 60 21 32 00            	movl	3285344, %edx
  283946: 8b 45 0c                     	movl	12(%ebp), %eax
  283949: 01 c2                        	addl	%eax, %edx
  28394b: 8b 45 08                     	movl	8(%ebp), %eax
  28394e: 89 50 04                     	movl	%edx, 4(%eax)
  283951: 8b 45 08                     	movl	8(%ebp), %eax
  283954: c6 40 08 02                  	movb	$2, 8(%eax)
  283958: e8 08 d8 ff ff               	calll	-10232 <io_load_eflags>
  28395d: 89 45 f0                     	movl	%eax, -16(%ebp)
  283960: e8 bd d7 ff ff               	calll	-10307 <io_cli>
  283965: a1 68 21 32 00               	movl	3285352, %eax
  28396a: 89 45 f4                     	movl	%eax, -12(%ebp)
  28396d: 8b 45 08                     	movl	8(%ebp), %eax
  283970: 8b 50 04                     	movl	4(%eax), %edx
  283973: 8b 45 f4                     	movl	-12(%ebp), %eax
  283976: 8b 40 04                     	movl	4(%eax), %eax
  283979: 39 c2                        	cmpl	%eax, %edx
  28397b: 77 2b                        	ja	43 <timer_settime+0x6e>
  28397d: 8b 45 08                     	movl	8(%ebp), %eax
  283980: a3 68 21 32 00               	movl	%eax, 3285352
  283985: 8b 45 08                     	movl	8(%ebp), %eax
  283988: 8b 55 f4                     	movl	-12(%ebp), %edx
  28398b: 89 10                        	movl	%edx, (%eax)
  28398d: 8b 45 08                     	movl	8(%ebp), %eax
  283990: 8b 40 04                     	movl	4(%eax), %eax
  283993: a3 64 21 32 00               	movl	%eax, 3285348
  283998: 83 ec 0c                     	subl	$12, %esp
  28399b: ff 75 f0                     	pushl	-16(%ebp)
  28399e: e8 c5 d7 ff ff               	calll	-10299 <io_store_eflags>
  2839a3: 83 c4 10                     	addl	$16, %esp
  2839a6: eb 3c                        	jmp	60 <timer_settime+0xaa>
  2839a8: 8b 45 f4                     	movl	-12(%ebp), %eax
  2839ab: 89 45 ec                     	movl	%eax, -20(%ebp)
  2839ae: 8b 45 f4                     	movl	-12(%ebp), %eax
  2839b1: 8b 00                        	movl	(%eax), %eax
  2839b3: 89 45 f4                     	movl	%eax, -12(%ebp)
  2839b6: 8b 45 08                     	movl	8(%ebp), %eax
  2839b9: 8b 50 04                     	movl	4(%eax), %edx
  2839bc: 8b 45 f4                     	movl	-12(%ebp), %eax
  2839bf: 8b 40 04                     	movl	4(%eax), %eax
  2839c2: 39 c2                        	cmpl	%eax, %edx
  2839c4: 77 e2                        	ja	-30 <timer_settime+0x6e>
  2839c6: 8b 45 ec                     	movl	-20(%ebp), %eax
  2839c9: 8b 55 08                     	movl	8(%ebp), %edx
  2839cc: 89 10                        	movl	%edx, (%eax)
  2839ce: 8b 45 08                     	movl	8(%ebp), %eax
  2839d1: 8b 55 f4                     	movl	-12(%ebp), %edx
  2839d4: 89 10                        	movl	%edx, (%eax)
  2839d6: 83 ec 0c                     	subl	$12, %esp
  2839d9: ff 75 f0                     	pushl	-16(%ebp)
  2839dc: e8 87 d7 ff ff               	calll	-10361 <io_store_eflags>
  2839e1: 83 c4 10                     	addl	$16, %esp
  2839e4: c9                           	leave
  2839e5: c3                           	retl

002839e6 inthandler20:
  2839e6: 55                           	pushl	%ebp
  2839e7: 89 e5                        	movl	%esp, %ebp
  2839e9: 83 ec 18                     	subl	$24, %esp
  2839ec: c6 45 f3 00                  	movb	$0, -13(%ebp)
  2839f0: 83 ec 08                     	subl	$8, %esp
  2839f3: 6a 60                        	pushl	$96
  2839f5: 6a 20                        	pushl	$32
  2839f7: e8 4a d7 ff ff               	calll	-10422 <io_out8>
  2839fc: 83 c4 10                     	addl	$16, %esp
  2839ff: a1 60 21 32 00               	movl	3285344, %eax
  283a04: 83 c0 01                     	addl	$1, %eax
  283a07: a3 60 21 32 00               	movl	%eax, 3285344
  283a0c: 8b 15 64 21 32 00            	movl	3285348, %edx
  283a12: a1 60 21 32 00               	movl	3285344, %eax
  283a17: 39 c2                        	cmpl	%eax, %edx
  283a19: 77 73                        	ja	115 <inthandler20+0xa8>
  283a1b: a1 68 21 32 00               	movl	3285352, %eax
  283a20: 89 45 f4                     	movl	%eax, -12(%ebp)
  283a23: 8b 45 f4                     	movl	-12(%ebp), %eax
  283a26: 8b 50 04                     	movl	4(%eax), %edx
  283a29: a1 60 21 32 00               	movl	3285344, %eax
  283a2e: 39 c2                        	cmpl	%eax, %edx
  283a30: 77 3a                        	ja	58 <inthandler20+0x86>
  283a32: 8b 45 f4                     	movl	-12(%ebp), %eax
  283a35: c6 40 08 01                  	movb	$1, 8(%eax)
  283a39: a1 80 48 32 00               	movl	3295360, %eax
  283a3e: 39 45 f4                     	cmpl	%eax, -12(%ebp)
  283a41: 74 1b                        	je	27 <inthandler20+0x78>
  283a43: 8b 45 f4                     	movl	-12(%ebp), %eax
  283a46: 8b 50 10                     	movl	16(%eax), %edx
  283a49: 8b 45 f4                     	movl	-12(%ebp), %eax
  283a4c: 8b 40 0c                     	movl	12(%eax), %eax
  283a4f: 83 ec 08                     	subl	$8, %esp
  283a52: 52                           	pushl	%edx
  283a53: 50                           	pushl	%eax
  283a54: e8 ee e5 ff ff               	calll	-6674 <fifo32_put>
  283a59: 83 c4 10                     	addl	$16, %esp
  283a5c: eb 04                        	jmp	4 <inthandler20+0x7c>
  283a5e: c6 45 f3 01                  	movb	$1, -13(%ebp)
  283a62: 8b 45 f4                     	movl	-12(%ebp), %eax
  283a65: 8b 00                        	movl	(%eax), %eax
  283a67: 89 45 f4                     	movl	%eax, -12(%ebp)
  283a6a: eb b7                        	jmp	-73 <inthandler20+0x3d>
  283a6c: 90                           	nop
  283a6d: 8b 45 f4                     	movl	-12(%ebp), %eax
  283a70: a3 68 21 32 00               	movl	%eax, 3285352
  283a75: 8b 45 f4                     	movl	-12(%ebp), %eax
  283a78: 8b 40 04                     	movl	4(%eax), %eax
  283a7b: a3 64 21 32 00               	movl	%eax, 3285348
  283a80: 80 7d f3 00                  	cmpb	$0, -13(%ebp)
  283a84: 74 0b                        	je	11 <inthandler20+0xab>
  283a86: e8 13 07 00 00               	calll	1811 <task_switch>
  283a8b: 90                           	nop
  283a8c: eb 03                        	jmp	3 <inthandler20+0xab>
  283a8e: 90                           	nop
  283a8f: eb 01                        	jmp	1 <inthandler20+0xac>
  283a91: 90                           	nop
  283a92: c9                           	leave
  283a93: c3                           	retl

00283a94 timer_cancel:
  283a94: 55                           	pushl	%ebp
  283a95: 89 e5                        	movl	%esp, %ebp
  283a97: 83 ec 18                     	subl	$24, %esp
  283a9a: e8 c6 d6 ff ff               	calll	-10554 <io_load_eflags>
  283a9f: 89 45 f0                     	movl	%eax, -16(%ebp)
  283aa2: e8 7b d6 ff ff               	calll	-10629 <io_cli>
  283aa7: 8b 45 08                     	movl	8(%ebp), %eax
  283aaa: 0f b6 40 08                  	movzbl	8(%eax), %eax
  283aae: 3c 02                        	cmpb	$2, %al
  283ab0: 75 6a                        	jne	106 <timer_cancel+0x88>
  283ab2: a1 68 21 32 00               	movl	3285352, %eax
  283ab7: 39 45 08                     	cmpl	%eax, 8(%ebp)
  283aba: 75 1d                        	jne	29 <timer_cancel+0x45>
  283abc: 8b 45 08                     	movl	8(%ebp), %eax
  283abf: 8b 00                        	movl	(%eax), %eax
  283ac1: 89 45 f4                     	movl	%eax, -12(%ebp)
  283ac4: 8b 45 f4                     	movl	-12(%ebp), %eax
  283ac7: a3 68 21 32 00               	movl	%eax, 3285352
  283acc: 8b 45 f4                     	movl	-12(%ebp), %eax
  283acf: 8b 40 04                     	movl	4(%eax), %eax
  283ad2: a3 64 21 32 00               	movl	%eax, 3285348
  283ad7: eb 27                        	jmp	39 <timer_cancel+0x6c>
  283ad9: a1 68 21 32 00               	movl	3285352, %eax
  283ade: 89 45 f4                     	movl	%eax, -12(%ebp)
  283ae1: 8b 45 f4                     	movl	-12(%ebp), %eax
  283ae4: 8b 00                        	movl	(%eax), %eax
  283ae6: 39 45 08                     	cmpl	%eax, 8(%ebp)
  283ae9: 74 0a                        	je	10 <timer_cancel+0x61>
  283aeb: 8b 45 f4                     	movl	-12(%ebp), %eax
  283aee: 8b 00                        	movl	(%eax), %eax
  283af0: 89 45 f4                     	movl	%eax, -12(%ebp)
  283af3: eb ec                        	jmp	-20 <timer_cancel+0x4d>
  283af5: 90                           	nop
  283af6: 8b 45 08                     	movl	8(%ebp), %eax
  283af9: 8b 10                        	movl	(%eax), %edx
  283afb: 8b 45 f4                     	movl	-12(%ebp), %eax
  283afe: 89 10                        	movl	%edx, (%eax)
  283b00: 8b 45 08                     	movl	8(%ebp), %eax
  283b03: c6 40 08 01                  	movb	$1, 8(%eax)
  283b07: 83 ec 0c                     	subl	$12, %esp
  283b0a: ff 75 f0                     	pushl	-16(%ebp)
  283b0d: e8 56 d6 ff ff               	calll	-10666 <io_store_eflags>
  283b12: 83 c4 10                     	addl	$16, %esp
  283b15: b8 01 00 00 00               	movl	$1, %eax
  283b1a: eb 13                        	jmp	19 <timer_cancel+0x9b>
  283b1c: 83 ec 0c                     	subl	$12, %esp
  283b1f: ff 75 f0                     	pushl	-16(%ebp)
  283b22: e8 41 d6 ff ff               	calll	-10687 <io_store_eflags>
  283b27: 83 c4 10                     	addl	$16, %esp
  283b2a: b8 00 00 00 00               	movl	$0, %eax
  283b2f: c9                           	leave
  283b30: c3                           	retl

00283b31 timer_cancelall:
  283b31: 55                           	pushl	%ebp
  283b32: 89 e5                        	movl	%esp, %ebp
  283b34: 83 ec 18                     	subl	$24, %esp
  283b37: e8 29 d6 ff ff               	calll	-10711 <io_load_eflags>
  283b3c: 89 45 f0                     	movl	%eax, -16(%ebp)
  283b3f: e8 de d5 ff ff               	calll	-10786 <io_cli>
  283b44: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  283b4b: eb 59                        	jmp	89 <timer_cancelall+0x75>
  283b4d: 8b 55 f4                     	movl	-12(%ebp), %edx
  283b50: 89 d0                        	movl	%edx, %eax
  283b52: c1 e0 02                     	shll	$2, %eax
  283b55: 01 d0                        	addl	%edx, %eax
  283b57: c1 e0 02                     	shll	$2, %eax
  283b5a: 05 60 21 32 00               	addl	$3285344, %eax
  283b5f: 83 c0 0c                     	addl	$12, %eax
  283b62: 89 45 ec                     	movl	%eax, -20(%ebp)
  283b65: 8b 45 ec                     	movl	-20(%ebp), %eax
  283b68: 0f b6 40 08                  	movzbl	8(%eax), %eax
  283b6c: 84 c0                        	testb	%al, %al
  283b6e: 74 32                        	je	50 <timer_cancelall+0x71>
  283b70: 8b 45 ec                     	movl	-20(%ebp), %eax
  283b73: 0f b6 40 09                  	movzbl	9(%eax), %eax
  283b77: 84 c0                        	testb	%al, %al
  283b79: 74 27                        	je	39 <timer_cancelall+0x71>
  283b7b: 8b 45 ec                     	movl	-20(%ebp), %eax
  283b7e: 8b 40 0c                     	movl	12(%eax), %eax
  283b81: 39 45 08                     	cmpl	%eax, 8(%ebp)
  283b84: 75 1c                        	jne	28 <timer_cancelall+0x71>
  283b86: 83 ec 0c                     	subl	$12, %esp
  283b89: ff 75 ec                     	pushl	-20(%ebp)
  283b8c: e8 03 ff ff ff               	calll	-253 <timer_cancel>
  283b91: 83 c4 10                     	addl	$16, %esp
  283b94: 83 ec 0c                     	subl	$12, %esp
  283b97: ff 75 ec                     	pushl	-20(%ebp)
  283b9a: e8 76 fd ff ff               	calll	-650 <timer_free>
  283b9f: 83 c4 10                     	addl	$16, %esp
  283ba2: 83 45 f4 01                  	addl	$1, -12(%ebp)
  283ba6: 81 7d f4 f3 01 00 00         	cmpl	$499, -12(%ebp)
  283bad: 7e 9e                        	jle	-98 <timer_cancelall+0x1c>
  283baf: 83 ec 0c                     	subl	$12, %esp
  283bb2: ff 75 f0                     	pushl	-16(%ebp)
  283bb5: e8 ae d5 ff ff               	calll	-10834 <io_store_eflags>
  283bba: 83 c4 10                     	addl	$16, %esp
  283bbd: 90                           	nop
  283bbe: c9                           	leave
  283bbf: c3                           	retl

00283bc0 task_now:
  283bc0: 55                           	pushl	%ebp
  283bc1: 89 e5                        	movl	%esp, %ebp
  283bc3: 83 ec 10                     	subl	$16, %esp
  283bc6: 8b 15 7c 48 32 00            	movl	3295356, %edx
  283bcc: a1 7c 48 32 00               	movl	3295356, %eax
  283bd1: 8b 00                        	movl	(%eax), %eax
  283bd3: 69 c0 98 01 00 00            	imull	$408, %eax, %eax
  283bd9: 01 d0                        	addl	%edx, %eax
  283bdb: 83 c0 08                     	addl	$8, %eax
  283bde: 89 45 fc                     	movl	%eax, -4(%ebp)
  283be1: 8b 45 fc                     	movl	-4(%ebp), %eax
  283be4: 8b 50 04                     	movl	4(%eax), %edx
  283be7: 8b 45 fc                     	movl	-4(%ebp), %eax
  283bea: 8b 44 90 08                  	movl	8(%eax,%edx,4), %eax
  283bee: c9                           	leave
  283bef: c3                           	retl

00283bf0 task_add:
  283bf0: 55                           	pushl	%ebp
  283bf1: 89 e5                        	movl	%esp, %ebp
  283bf3: 83 ec 10                     	subl	$16, %esp
  283bf6: 8b 15 7c 48 32 00            	movl	3295356, %edx
  283bfc: 8b 45 08                     	movl	8(%ebp), %eax
  283bff: 8b 40 08                     	movl	8(%eax), %eax
  283c02: 69 c0 98 01 00 00            	imull	$408, %eax, %eax
  283c08: 01 d0                        	addl	%edx, %eax
  283c0a: 83 c0 08                     	addl	$8, %eax
  283c0d: 89 45 fc                     	movl	%eax, -4(%ebp)
  283c10: 8b 45 fc                     	movl	-4(%ebp), %eax
  283c13: 8b 10                        	movl	(%eax), %edx
  283c15: 8b 45 fc                     	movl	-4(%ebp), %eax
  283c18: 8b 4d 08                     	movl	8(%ebp), %ecx
  283c1b: 89 4c 90 08                  	movl	%ecx, 8(%eax,%edx,4)
  283c1f: 8b 45 fc                     	movl	-4(%ebp), %eax
  283c22: 8b 00                        	movl	(%eax), %eax
  283c24: 8d 50 01                     	leal	1(%eax), %edx
  283c27: 8b 45 fc                     	movl	-4(%ebp), %eax
  283c2a: 89 10                        	movl	%edx, (%eax)
  283c2c: 8b 45 08                     	movl	8(%ebp), %eax
  283c2f: c7 40 04 02 00 00 00         	movl	$2, 4(%eax)
  283c36: 90                           	nop
  283c37: c9                           	leave
  283c38: c3                           	retl

00283c39 task_remove:
  283c39: 55                           	pushl	%ebp
  283c3a: 89 e5                        	movl	%esp, %ebp
  283c3c: 83 ec 10                     	subl	$16, %esp
  283c3f: 8b 15 7c 48 32 00            	movl	3295356, %edx
  283c45: 8b 45 08                     	movl	8(%ebp), %eax
  283c48: 8b 40 08                     	movl	8(%eax), %eax
  283c4b: 69 c0 98 01 00 00            	imull	$408, %eax, %eax
  283c51: 01 d0                        	addl	%edx, %eax
  283c53: 83 c0 08                     	addl	$8, %eax
  283c56: 89 45 f8                     	movl	%eax, -8(%ebp)
  283c59: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  283c60: eb 13                        	jmp	19 <task_remove+0x3c>
  283c62: 8b 45 f8                     	movl	-8(%ebp), %eax
  283c65: 8b 55 fc                     	movl	-4(%ebp), %edx
  283c68: 8b 44 90 08                  	movl	8(%eax,%edx,4), %eax
  283c6c: 39 45 08                     	cmpl	%eax, 8(%ebp)
  283c6f: 74 10                        	je	16 <task_remove+0x48>
  283c71: 83 45 fc 01                  	addl	$1, -4(%ebp)
  283c75: 8b 45 f8                     	movl	-8(%ebp), %eax
  283c78: 8b 00                        	movl	(%eax), %eax
  283c7a: 39 45 fc                     	cmpl	%eax, -4(%ebp)
  283c7d: 7c e3                        	jl	-29 <task_remove+0x29>
  283c7f: eb 01                        	jmp	1 <task_remove+0x49>
  283c81: 90                           	nop
  283c82: 8b 45 f8                     	movl	-8(%ebp), %eax
  283c85: 8b 00                        	movl	(%eax), %eax
  283c87: 8d 50 ff                     	leal	-1(%eax), %edx
  283c8a: 8b 45 f8                     	movl	-8(%ebp), %eax
  283c8d: 89 10                        	movl	%edx, (%eax)
  283c8f: 8b 45 f8                     	movl	-8(%ebp), %eax
  283c92: 8b 40 04                     	movl	4(%eax), %eax
  283c95: 39 45 fc                     	cmpl	%eax, -4(%ebp)
  283c98: 7d 0f                        	jge	15 <task_remove+0x70>
  283c9a: 8b 45 f8                     	movl	-8(%ebp), %eax
  283c9d: 8b 40 04                     	movl	4(%eax), %eax
  283ca0: 8d 50 ff                     	leal	-1(%eax), %edx
  283ca3: 8b 45 f8                     	movl	-8(%ebp), %eax
  283ca6: 89 50 04                     	movl	%edx, 4(%eax)
  283ca9: 8b 45 f8                     	movl	-8(%ebp), %eax
  283cac: 8b 50 04                     	movl	4(%eax), %edx
  283caf: 8b 45 f8                     	movl	-8(%ebp), %eax
  283cb2: 8b 00                        	movl	(%eax), %eax
  283cb4: 39 c2                        	cmpl	%eax, %edx
  283cb6: 7c 0a                        	jl	10 <task_remove+0x89>
  283cb8: 8b 45 f8                     	movl	-8(%ebp), %eax
  283cbb: c7 40 04 00 00 00 00         	movl	$0, 4(%eax)
  283cc2: 8b 45 08                     	movl	8(%ebp), %eax
  283cc5: c7 40 04 01 00 00 00         	movl	$1, 4(%eax)
  283ccc: eb 1b                        	jmp	27 <task_remove+0xb0>
  283cce: 8b 45 fc                     	movl	-4(%ebp), %eax
  283cd1: 8d 50 01                     	leal	1(%eax), %edx
  283cd4: 8b 45 f8                     	movl	-8(%ebp), %eax
  283cd7: 8b 4c 90 08                  	movl	8(%eax,%edx,4), %ecx
  283cdb: 8b 45 f8                     	movl	-8(%ebp), %eax
  283cde: 8b 55 fc                     	movl	-4(%ebp), %edx
  283ce1: 89 4c 90 08                  	movl	%ecx, 8(%eax,%edx,4)
  283ce5: 83 45 fc 01                  	addl	$1, -4(%ebp)
  283ce9: 8b 45 f8                     	movl	-8(%ebp), %eax
  283cec: 8b 00                        	movl	(%eax), %eax
  283cee: 39 45 fc                     	cmpl	%eax, -4(%ebp)
  283cf1: 7c db                        	jl	-37 <task_remove+0x95>
  283cf3: 90                           	nop
  283cf4: c9                           	leave
  283cf5: c3                           	retl

00283cf6 task_switchsub:
  283cf6: 55                           	pushl	%ebp
  283cf7: 89 e5                        	movl	%esp, %ebp
  283cf9: 83 ec 10                     	subl	$16, %esp
  283cfc: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  283d03: eb 1e                        	jmp	30 <task_switchsub+0x2d>
  283d05: 8b 15 7c 48 32 00            	movl	3295356, %edx
  283d0b: 8b 45 fc                     	movl	-4(%ebp), %eax
  283d0e: 69 c0 98 01 00 00            	imull	$408, %eax, %eax
  283d14: 01 d0                        	addl	%edx, %eax
  283d16: 83 c0 08                     	addl	$8, %eax
  283d19: 8b 00                        	movl	(%eax), %eax
  283d1b: 85 c0                        	testl	%eax, %eax
  283d1d: 7f 0c                        	jg	12 <task_switchsub+0x35>
  283d1f: 83 45 fc 01                  	addl	$1, -4(%ebp)
  283d23: 83 7d fc 09                  	cmpl	$9, -4(%ebp)
  283d27: 7e dc                        	jle	-36 <task_switchsub+0xf>
  283d29: eb 01                        	jmp	1 <task_switchsub+0x36>
  283d2b: 90                           	nop
  283d2c: a1 7c 48 32 00               	movl	3295356, %eax
  283d31: 8b 55 fc                     	movl	-4(%ebp), %edx
  283d34: 89 10                        	movl	%edx, (%eax)
  283d36: a1 7c 48 32 00               	movl	3295356, %eax
  283d3b: c6 40 04 00                  	movb	$0, 4(%eax)
  283d3f: 90                           	nop
  283d40: c9                           	leave
  283d41: c3                           	retl

00283d42 task_idle:
  283d42: 55                           	pushl	%ebp
  283d43: 89 e5                        	movl	%esp, %ebp
  283d45: 83 ec 08                     	subl	$8, %esp
  283d48: e8 d3 d3 ff ff               	calll	-11309 <io_hlt>
  283d4d: eb f9                        	jmp	-7 <task_idle+0x6>

00283d4f task_init:
  283d4f: 55                           	pushl	%ebp
  283d50: 89 e5                        	movl	%esp, %ebp
  283d52: 53                           	pushl	%ebx
  283d53: 83 ec 14                     	subl	$20, %esp
  283d56: c7 45 f0 00 00 27 00         	movl	$2555904, -16(%ebp)
  283d5d: 83 ec 08                     	subl	$8, %esp
  283d60: 68 f8 fd 02 00               	pushl	$196088
  283d65: ff 75 08                     	pushl	8(%ebp)
  283d68: e8 eb ea ff ff               	calll	-5397 <memman_alloc_4k>
  283d6d: 83 c4 10                     	addl	$16, %esp
  283d70: a3 7c 48 32 00               	movl	%eax, 3295356
  283d75: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  283d7c: e9 f9 00 00 00               	jmp	249 <task_init+0x12b>
  283d81: 8b 0d 7c 48 32 00            	movl	3295356, %ecx
  283d87: 8b 55 f4                     	movl	-12(%ebp), %edx
  283d8a: 89 d0                        	movl	%edx, %eax
  283d8c: 01 c0                        	addl	%eax, %eax
  283d8e: 01 d0                        	addl	%edx, %eax
  283d90: c1 e0 06                     	shll	$6, %eax
  283d93: 01 c8                        	addl	%ecx, %eax
  283d95: 05 fc 0f 00 00               	addl	$4092, %eax
  283d9a: c7 00 00 00 00 00            	movl	$0, (%eax)
  283da0: 8b 45 f4                     	movl	-12(%ebp), %eax
  283da3: 83 c0 03                     	addl	$3, %eax
  283da6: 8b 1d 7c 48 32 00            	movl	3295356, %ebx
  283dac: 8d 0c c5 00 00 00 00         	leal	(,%eax,8), %ecx
  283db3: 8b 55 f4                     	movl	-12(%ebp), %edx
  283db6: 89 d0                        	movl	%edx, %eax
  283db8: 01 c0                        	addl	%eax, %eax
  283dba: 01 d0                        	addl	%edx, %eax
  283dbc: c1 e0 06                     	shll	$6, %eax
  283dbf: 01 d8                        	addl	%ebx, %eax
  283dc1: 05 f8 0f 00 00               	addl	$4088, %eax
  283dc6: 89 08                        	movl	%ecx, (%eax)
  283dc8: 8b 45 f4                     	movl	-12(%ebp), %eax
  283dcb: 05 eb 03 00 00               	addl	$1003, %eax
  283dd0: 8b 1d 7c 48 32 00            	movl	3295356, %ebx
  283dd6: 8d 0c c5 00 00 00 00         	leal	(,%eax,8), %ecx
  283ddd: 8b 55 f4                     	movl	-12(%ebp), %edx
  283de0: 89 d0                        	movl	%edx, %eax
  283de2: 01 c0                        	addl	%eax, %eax
  283de4: 01 d0                        	addl	%edx, %eax
  283de6: c1 e0 06                     	shll	$6, %eax
  283de9: 01 d8                        	addl	%ebx, %eax
  283deb: 05 84 10 00 00               	addl	$4228, %eax
  283df0: 89 08                        	movl	%ecx, (%eax)
  283df2: 8b 0d 7c 48 32 00            	movl	3295356, %ecx
  283df8: 8b 55 f4                     	movl	-12(%ebp), %edx
  283dfb: 89 d0                        	movl	%edx, %eax
  283dfd: 01 c0                        	addl	%eax, %eax
  283dff: 01 d0                        	addl	%edx, %eax
  283e01: c1 e0 06                     	shll	$6, %eax
  283e04: 05 10 10 00 00               	addl	$4112, %eax
  283e09: 01 c8                        	addl	%ecx, %eax
  283e0b: 83 c0 14                     	addl	$20, %eax
  283e0e: 89 c1                        	movl	%eax, %ecx
  283e10: 8b 45 f4                     	movl	-12(%ebp), %eax
  283e13: 83 c0 03                     	addl	$3, %eax
  283e16: 8d 14 c5 00 00 00 00         	leal	(,%eax,8), %edx
  283e1d: 8b 45 f0                     	movl	-16(%ebp), %eax
  283e20: 01 d0                        	addl	%edx, %eax
  283e22: 68 89 00 00 00               	pushl	$137
  283e27: 51                           	pushl	%ecx
  283e28: 6a 67                        	pushl	$103
  283e2a: 50                           	pushl	%eax
  283e2b: e8 35 e0 ff ff               	calll	-8139 <set_segmdesc>
  283e30: 83 c4 10                     	addl	$16, %esp
  283e33: 8b 0d 7c 48 32 00            	movl	3295356, %ecx
  283e39: 8b 55 f4                     	movl	-12(%ebp), %edx
  283e3c: 89 d0                        	movl	%edx, %eax
  283e3e: 01 c0                        	addl	%eax, %eax
  283e40: 01 d0                        	addl	%edx, %eax
  283e42: c1 e0 06                     	shll	$6, %eax
  283e45: 05 80 10 00 00               	addl	$4224, %eax
  283e4a: 01 c8                        	addl	%ecx, %eax
  283e4c: 83 c0 0c                     	addl	$12, %eax
  283e4f: 89 c1                        	movl	%eax, %ecx
  283e51: 8b 45 f4                     	movl	-12(%ebp), %eax
  283e54: 05 eb 03 00 00               	addl	$1003, %eax
  283e59: 8d 14 c5 00 00 00 00         	leal	(,%eax,8), %edx
  283e60: 8b 45 f0                     	movl	-16(%ebp), %eax
  283e63: 01 d0                        	addl	%edx, %eax
  283e65: 68 82 00 00 00               	pushl	$130
  283e6a: 51                           	pushl	%ecx
  283e6b: 6a 0f                        	pushl	$15
  283e6d: 50                           	pushl	%eax
  283e6e: e8 f2 df ff ff               	calll	-8206 <set_segmdesc>
  283e73: 83 c4 10                     	addl	$16, %esp
  283e76: 83 45 f4 01                  	addl	$1, -12(%ebp)
  283e7a: 81 7d f4 e7 03 00 00         	cmpl	$999, -12(%ebp)
  283e81: 0f 8e fa fe ff ff            	jle	-262 <task_init+0x32>
  283e87: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  283e8e: eb 38                        	jmp	56 <task_init+0x179>
  283e90: 8b 15 7c 48 32 00            	movl	3295356, %edx
  283e96: 8b 45 f4                     	movl	-12(%ebp), %eax
  283e99: 69 c0 98 01 00 00            	imull	$408, %eax, %eax
  283e9f: 01 d0                        	addl	%edx, %eax
  283ea1: 83 c0 08                     	addl	$8, %eax
  283ea4: c7 00 00 00 00 00            	movl	$0, (%eax)
  283eaa: 8b 15 7c 48 32 00            	movl	3295356, %edx
  283eb0: 8b 45 f4                     	movl	-12(%ebp), %eax
  283eb3: 69 c0 98 01 00 00            	imull	$408, %eax, %eax
  283eb9: 01 d0                        	addl	%edx, %eax
  283ebb: 83 c0 0c                     	addl	$12, %eax
  283ebe: c7 00 00 00 00 00            	movl	$0, (%eax)
  283ec4: 83 45 f4 01                  	addl	$1, -12(%ebp)
  283ec8: 83 7d f4 09                  	cmpl	$9, -12(%ebp)
  283ecc: 7e c2                        	jle	-62 <task_init+0x141>
  283ece: e8 fb 00 00 00               	calll	251 <task_alloc>
  283ed3: 89 45 ec                     	movl	%eax, -20(%ebp)
  283ed6: 8b 45 ec                     	movl	-20(%ebp), %eax
  283ed9: c7 40 04 02 00 00 00         	movl	$2, 4(%eax)
  283ee0: 8b 45 ec                     	movl	-20(%ebp), %eax
  283ee3: c7 40 0c 02 00 00 00         	movl	$2, 12(%eax)
  283eea: 8b 45 ec                     	movl	-20(%ebp), %eax
  283eed: c7 40 08 00 00 00 00         	movl	$0, 8(%eax)
  283ef4: 83 ec 0c                     	subl	$12, %esp
  283ef7: ff 75 ec                     	pushl	-20(%ebp)
  283efa: e8 f1 fc ff ff               	calll	-783 <task_add>
  283eff: 83 c4 10                     	addl	$16, %esp
  283f02: e8 ef fd ff ff               	calll	-529 <task_switchsub>
  283f07: 8b 45 ec                     	movl	-20(%ebp), %eax
  283f0a: 8b 00                        	movl	(%eax), %eax
  283f0c: 83 ec 0c                     	subl	$12, %esp
  283f0f: 50                           	pushl	%eax
  283f10: e8 86 d2 ff ff               	calll	-11642 <load_tr>
  283f15: 83 c4 10                     	addl	$16, %esp
  283f18: e8 7b f9 ff ff               	calll	-1669 <timer_alloc>
  283f1d: a3 80 48 32 00               	movl	%eax, 3295360
  283f22: 8b 45 ec                     	movl	-20(%ebp), %eax
  283f25: 8b 40 0c                     	movl	12(%eax), %eax
  283f28: 89 c2                        	movl	%eax, %edx
  283f2a: a1 80 48 32 00               	movl	3295360, %eax
  283f2f: 83 ec 08                     	subl	$8, %esp
  283f32: 52                           	pushl	%edx
  283f33: 50                           	pushl	%eax
  283f34: e8 01 fa ff ff               	calll	-1535 <timer_settime>
  283f39: 83 c4 10                     	addl	$16, %esp
  283f3c: e8 8d 00 00 00               	calll	141 <task_alloc>
  283f41: 89 45 e8                     	movl	%eax, -24(%ebp)
  283f44: 83 ec 08                     	subl	$8, %esp
  283f47: 68 00 00 01 00               	pushl	$65536
  283f4c: ff 75 08                     	pushl	8(%ebp)
  283f4f: e8 04 e9 ff ff               	calll	-5884 <memman_alloc_4k>
  283f54: 83 c4 10                     	addl	$16, %esp
  283f57: 05 00 00 01 00               	addl	$65536, %eax
  283f5c: 89 c2                        	movl	%eax, %edx
  283f5e: 8b 45 e8                     	movl	-24(%ebp), %eax
  283f61: 89 50 64                     	movl	%edx, 100(%eax)
  283f64: ba 42 3d 28 00               	movl	$2637122, %edx
  283f69: 8b 45 e8                     	movl	-24(%ebp), %eax
  283f6c: 89 50 4c                     	movl	%edx, 76(%eax)
  283f6f: 8b 45 e8                     	movl	-24(%ebp), %eax
  283f72: c7 40 74 08 00 00 00         	movl	$8, 116(%eax)
  283f79: 8b 45 e8                     	movl	-24(%ebp), %eax
  283f7c: c7 40 78 10 00 00 00         	movl	$16, 120(%eax)
  283f83: 8b 45 e8                     	movl	-24(%ebp), %eax
  283f86: c7 40 7c 08 00 00 00         	movl	$8, 124(%eax)
  283f8d: 8b 45 e8                     	movl	-24(%ebp), %eax
  283f90: c7 80 80 00 00 00 08 00 00 00	movl	$8, 128(%eax)
  283f9a: 8b 45 e8                     	movl	-24(%ebp), %eax
  283f9d: c7 80 84 00 00 00 08 00 00 00	movl	$8, 132(%eax)
  283fa7: 8b 45 e8                     	movl	-24(%ebp), %eax
  283faa: c7 80 88 00 00 00 08 00 00 00	movl	$8, 136(%eax)
  283fb4: 83 ec 04                     	subl	$4, %esp
  283fb7: 6a 01                        	pushl	$1
  283fb9: 6a 09                        	pushl	$9
  283fbb: ff 75 e8                     	pushl	-24(%ebp)
  283fbe: e8 1e 01 00 00               	calll	286 <task_run>
  283fc3: 83 c4 10                     	addl	$16, %esp
  283fc6: 8b 45 ec                     	movl	-20(%ebp), %eax
  283fc9: 8b 5d fc                     	movl	-4(%ebp), %ebx
  283fcc: c9                           	leave
  283fcd: c3                           	retl

00283fce task_alloc:
  283fce: 55                           	pushl	%ebp
  283fcf: 89 e5                        	movl	%esp, %ebp
  283fd1: 83 ec 10                     	subl	$16, %esp
  283fd4: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  283fdb: e9 ed 00 00 00               	jmp	237 <task_alloc+0xff>
  283fe0: 8b 0d 7c 48 32 00            	movl	3295356, %ecx
  283fe6: 8b 55 fc                     	movl	-4(%ebp), %edx
  283fe9: 89 d0                        	movl	%edx, %eax
  283feb: 01 c0                        	addl	%eax, %eax
  283fed: 01 d0                        	addl	%edx, %eax
  283fef: c1 e0 06                     	shll	$6, %eax
  283ff2: 01 c8                        	addl	%ecx, %eax
  283ff4: 05 fc 0f 00 00               	addl	$4092, %eax
  283ff9: 8b 00                        	movl	(%eax), %eax
  283ffb: 85 c0                        	testl	%eax, %eax
  283ffd: 0f 85 c6 00 00 00            	jne	198 <task_alloc+0xfb>
  284003: 8b 0d 7c 48 32 00            	movl	3295356, %ecx
  284009: 8b 55 fc                     	movl	-4(%ebp), %edx
  28400c: 89 d0                        	movl	%edx, %eax
  28400e: 01 c0                        	addl	%eax, %eax
  284010: 01 d0                        	addl	%edx, %eax
  284012: c1 e0 06                     	shll	$6, %eax
  284015: 05 f0 0f 00 00               	addl	$4080, %eax
  28401a: 01 c8                        	addl	%ecx, %eax
  28401c: 83 c0 08                     	addl	$8, %eax
  28401f: 89 45 f8                     	movl	%eax, -8(%ebp)
  284022: 8b 45 f8                     	movl	-8(%ebp), %eax
  284025: c7 40 04 01 00 00 00         	movl	$1, 4(%eax)
  28402c: 8b 45 f8                     	movl	-8(%ebp), %eax
  28402f: c7 40 50 02 02 00 00         	movl	$514, 80(%eax)
  284036: 8b 45 f8                     	movl	-8(%ebp), %eax
  284039: c7 40 54 00 00 00 00         	movl	$0, 84(%eax)
  284040: 8b 45 f8                     	movl	-8(%ebp), %eax
  284043: c7 40 58 00 00 00 00         	movl	$0, 88(%eax)
  28404a: 8b 45 f8                     	movl	-8(%ebp), %eax
  28404d: c7 40 5c 00 00 00 00         	movl	$0, 92(%eax)
  284054: 8b 45 f8                     	movl	-8(%ebp), %eax
  284057: c7 40 60 00 00 00 00         	movl	$0, 96(%eax)
  28405e: 8b 45 f8                     	movl	-8(%ebp), %eax
  284061: c7 40 68 00 00 00 00         	movl	$0, 104(%eax)
  284068: 8b 45 f8                     	movl	-8(%ebp), %eax
  28406b: c7 40 6c 00 00 00 00         	movl	$0, 108(%eax)
  284072: 8b 45 f8                     	movl	-8(%ebp), %eax
  284075: c7 40 70 00 00 00 00         	movl	$0, 112(%eax)
  28407c: 8b 45 f8                     	movl	-8(%ebp), %eax
  28407f: c7 40 74 00 00 00 00         	movl	$0, 116(%eax)
  284086: 8b 45 f8                     	movl	-8(%ebp), %eax
  284089: c7 80 80 00 00 00 00 00 00 00	movl	$0, 128(%eax)
  284093: 8b 45 f8                     	movl	-8(%ebp), %eax
  284096: c7 80 84 00 00 00 00 00 00 00	movl	$0, 132(%eax)
  2840a0: 8b 45 f8                     	movl	-8(%ebp), %eax
  2840a3: c7 80 88 00 00 00 00 00 00 00	movl	$0, 136(%eax)
  2840ad: 8b 45 f8                     	movl	-8(%ebp), %eax
  2840b0: c7 80 90 00 00 00 00 00 00 40	movl	$1073741824, 144(%eax)
  2840ba: 8b 45 f8                     	movl	-8(%ebp), %eax
  2840bd: c7 40 34 00 00 00 00         	movl	$0, 52(%eax)
  2840c4: 8b 45 f8                     	movl	-8(%ebp), %eax
  2840c7: eb 16                        	jmp	22 <task_alloc+0x111>
  2840c9: 83 45 fc 01                  	addl	$1, -4(%ebp)
  2840cd: 81 7d fc e7 03 00 00         	cmpl	$999, -4(%ebp)
  2840d4: 0f 8e 06 ff ff ff            	jle	-250 <task_alloc+0x12>
  2840da: b8 00 00 00 00               	movl	$0, %eax
  2840df: c9                           	leave
  2840e0: c3                           	retl

002840e1 task_run:
  2840e1: 55                           	pushl	%ebp
  2840e2: 89 e5                        	movl	%esp, %ebp
  2840e4: 83 7d 0c 00                  	cmpl	$0, 12(%ebp)
  2840e8: 79 09                        	jns	9 <task_run+0x12>
  2840ea: 8b 45 08                     	movl	8(%ebp), %eax
  2840ed: 8b 40 08                     	movl	8(%eax), %eax
  2840f0: 89 45 0c                     	movl	%eax, 12(%ebp)
  2840f3: 83 7d 10 00                  	cmpl	$0, 16(%ebp)
  2840f7: 7e 09                        	jle	9 <task_run+0x21>
  2840f9: 8b 45 08                     	movl	8(%ebp), %eax
  2840fc: 8b 55 10                     	movl	16(%ebp), %edx
  2840ff: 89 50 0c                     	movl	%edx, 12(%eax)
  284102: 8b 45 08                     	movl	8(%ebp), %eax
  284105: 8b 40 04                     	movl	4(%eax), %eax
  284108: 83 f8 02                     	cmpl	$2, %eax
  28410b: 75 16                        	jne	22 <task_run+0x42>
  28410d: 8b 45 08                     	movl	8(%ebp), %eax
  284110: 8b 40 08                     	movl	8(%eax), %eax
  284113: 39 45 0c                     	cmpl	%eax, 12(%ebp)
  284116: 74 0b                        	je	11 <task_run+0x42>
  284118: ff 75 08                     	pushl	8(%ebp)
  28411b: e8 19 fb ff ff               	calll	-1255 <task_remove>
  284120: 83 c4 04                     	addl	$4, %esp
  284123: 8b 45 08                     	movl	8(%ebp), %eax
  284126: 8b 40 04                     	movl	4(%eax), %eax
  284129: 83 f8 02                     	cmpl	$2, %eax
  28412c: 74 14                        	je	20 <task_run+0x61>
  28412e: 8b 45 08                     	movl	8(%ebp), %eax
  284131: 8b 55 0c                     	movl	12(%ebp), %edx
  284134: 89 50 08                     	movl	%edx, 8(%eax)
  284137: ff 75 08                     	pushl	8(%ebp)
  28413a: e8 b1 fa ff ff               	calll	-1359 <task_add>
  28413f: 83 c4 04                     	addl	$4, %esp
  284142: a1 7c 48 32 00               	movl	3295356, %eax
  284147: c6 40 04 01                  	movb	$1, 4(%eax)
  28414b: 90                           	nop
  28414c: c9                           	leave
  28414d: c3                           	retl

0028414e task_sleep:
  28414e: 55                           	pushl	%ebp
  28414f: 89 e5                        	movl	%esp, %ebp
  284151: 83 ec 18                     	subl	$24, %esp
  284154: 8b 45 08                     	movl	8(%ebp), %eax
  284157: 8b 40 04                     	movl	4(%eax), %eax
  28415a: 83 f8 02                     	cmpl	$2, %eax
  28415d: 75 3c                        	jne	60 <task_sleep+0x4d>
  28415f: e8 5c fa ff ff               	calll	-1444 <task_now>
  284164: 89 45 f4                     	movl	%eax, -12(%ebp)
  284167: ff 75 08                     	pushl	8(%ebp)
  28416a: e8 ca fa ff ff               	calll	-1334 <task_remove>
  28416f: 83 c4 04                     	addl	$4, %esp
  284172: 8b 45 08                     	movl	8(%ebp), %eax
  284175: 3b 45 f4                     	cmpl	-12(%ebp), %eax
  284178: 75 21                        	jne	33 <task_sleep+0x4d>
  28417a: e8 77 fb ff ff               	calll	-1161 <task_switchsub>
  28417f: e8 3c fa ff ff               	calll	-1476 <task_now>
  284184: 89 45 f4                     	movl	%eax, -12(%ebp)
  284187: 8b 45 f4                     	movl	-12(%ebp), %eax
  28418a: 8b 00                        	movl	(%eax), %eax
  28418c: 83 ec 08                     	subl	$8, %esp
  28418f: 50                           	pushl	%eax
  284190: 6a 00                        	pushl	$0
  284192: e8 d5 d0 ff ff               	calll	-12075 <farjmp>
  284197: 83 c4 10                     	addl	$16, %esp
  28419a: 90                           	nop
  28419b: 90                           	nop
  28419c: c9                           	leave
  28419d: c3                           	retl

0028419e task_switch:
  28419e: 55                           	pushl	%ebp
  28419f: 89 e5                        	movl	%esp, %ebp
  2841a1: 83 ec 18                     	subl	$24, %esp
  2841a4: 8b 15 7c 48 32 00            	movl	3295356, %edx
  2841aa: a1 7c 48 32 00               	movl	3295356, %eax
  2841af: 8b 00                        	movl	(%eax), %eax
  2841b1: 69 c0 98 01 00 00            	imull	$408, %eax, %eax
  2841b7: 01 d0                        	addl	%edx, %eax
  2841b9: 83 c0 08                     	addl	$8, %eax
  2841bc: 89 45 f4                     	movl	%eax, -12(%ebp)
  2841bf: 8b 45 f4                     	movl	-12(%ebp), %eax
  2841c2: 8b 50 04                     	movl	4(%eax), %edx
  2841c5: 8b 45 f4                     	movl	-12(%ebp), %eax
  2841c8: 8b 44 90 08                  	movl	8(%eax,%edx,4), %eax
  2841cc: 89 45 f0                     	movl	%eax, -16(%ebp)
  2841cf: 8b 45 f4                     	movl	-12(%ebp), %eax
  2841d2: 8b 40 04                     	movl	4(%eax), %eax
  2841d5: 8d 50 01                     	leal	1(%eax), %edx
  2841d8: 8b 45 f4                     	movl	-12(%ebp), %eax
  2841db: 89 50 04                     	movl	%edx, 4(%eax)
  2841de: 8b 45 f4                     	movl	-12(%ebp), %eax
  2841e1: 8b 50 04                     	movl	4(%eax), %edx
  2841e4: 8b 45 f4                     	movl	-12(%ebp), %eax
  2841e7: 8b 00                        	movl	(%eax), %eax
  2841e9: 39 c2                        	cmpl	%eax, %edx
  2841eb: 75 0a                        	jne	10 <task_switch+0x59>
  2841ed: 8b 45 f4                     	movl	-12(%ebp), %eax
  2841f0: c7 40 04 00 00 00 00         	movl	$0, 4(%eax)
  2841f7: a1 7c 48 32 00               	movl	3295356, %eax
  2841fc: 0f b6 40 04                  	movzbl	4(%eax), %eax
  284200: 84 c0                        	testb	%al, %al
  284202: 74 20                        	je	32 <task_switch+0x86>
  284204: e8 ed fa ff ff               	calll	-1299 <task_switchsub>
  284209: 8b 15 7c 48 32 00            	movl	3295356, %edx
  28420f: a1 7c 48 32 00               	movl	3295356, %eax
  284214: 8b 00                        	movl	(%eax), %eax
  284216: 69 c0 98 01 00 00            	imull	$408, %eax, %eax
  28421c: 01 d0                        	addl	%edx, %eax
  28421e: 83 c0 08                     	addl	$8, %eax
  284221: 89 45 f4                     	movl	%eax, -12(%ebp)
  284224: 8b 45 f4                     	movl	-12(%ebp), %eax
  284227: 8b 50 04                     	movl	4(%eax), %edx
  28422a: 8b 45 f4                     	movl	-12(%ebp), %eax
  28422d: 8b 44 90 08                  	movl	8(%eax,%edx,4), %eax
  284231: 89 45 ec                     	movl	%eax, -20(%ebp)
  284234: 8b 45 ec                     	movl	-20(%ebp), %eax
  284237: 8b 40 0c                     	movl	12(%eax), %eax
  28423a: 89 c2                        	movl	%eax, %edx
  28423c: a1 80 48 32 00               	movl	3295360, %eax
  284241: 83 ec 08                     	subl	$8, %esp
  284244: 52                           	pushl	%edx
  284245: 50                           	pushl	%eax
  284246: e8 ef f6 ff ff               	calll	-2321 <timer_settime>
  28424b: 83 c4 10                     	addl	$16, %esp
  28424e: 8b 45 ec                     	movl	-20(%ebp), %eax
  284251: 3b 45 f0                     	cmpl	-16(%ebp), %eax
  284254: 74 14                        	je	20 <task_switch+0xcc>
  284256: 8b 45 ec                     	movl	-20(%ebp), %eax
  284259: 8b 00                        	movl	(%eax), %eax
  28425b: 83 ec 08                     	subl	$8, %esp
  28425e: 50                           	pushl	%eax
  28425f: 6a 00                        	pushl	$0
  284261: e8 06 d0 ff ff               	calll	-12282 <farjmp>
  284266: 83 c4 10                     	addl	$16, %esp
  284269: 90                           	nop
  28426a: 90                           	nop
  28426b: c9                           	leave
  28426c: c3                           	retl

0028426d make_window8:
  28426d: 55                           	pushl	%ebp
  28426e: 89 e5                        	movl	%esp, %ebp
  284270: 83 ec 18                     	subl	$24, %esp
  284273: 8b 45 18                     	movl	24(%ebp), %eax
  284276: 88 45 f4                     	movb	%al, -12(%ebp)
  284279: 8b 45 0c                     	movl	12(%ebp), %eax
  28427c: 83 e8 01                     	subl	$1, %eax
  28427f: 83 ec 04                     	subl	$4, %esp
  284282: 6a 00                        	pushl	$0
  284284: 50                           	pushl	%eax
  284285: 6a 00                        	pushl	$0
  284287: 6a 00                        	pushl	$0
  284289: 6a 08                        	pushl	$8
  28428b: ff 75 0c                     	pushl	12(%ebp)
  28428e: ff 75 08                     	pushl	8(%ebp)
  284291: e8 30 d2 ff ff               	calll	-11728 <boxfill8>
  284296: 83 c4 20                     	addl	$32, %esp
  284299: 8b 45 0c                     	movl	12(%ebp), %eax
  28429c: 83 e8 02                     	subl	$2, %eax
  28429f: 83 ec 04                     	subl	$4, %esp
  2842a2: 6a 01                        	pushl	$1
  2842a4: 50                           	pushl	%eax
  2842a5: 6a 01                        	pushl	$1
  2842a7: 6a 01                        	pushl	$1
  2842a9: 6a 07                        	pushl	$7
  2842ab: ff 75 0c                     	pushl	12(%ebp)
  2842ae: ff 75 08                     	pushl	8(%ebp)
  2842b1: e8 10 d2 ff ff               	calll	-11760 <boxfill8>
  2842b6: 83 c4 20                     	addl	$32, %esp
  2842b9: 8b 45 10                     	movl	16(%ebp), %eax
  2842bc: 83 e8 01                     	subl	$1, %eax
  2842bf: 83 ec 04                     	subl	$4, %esp
  2842c2: 50                           	pushl	%eax
  2842c3: 6a 00                        	pushl	$0
  2842c5: 6a 00                        	pushl	$0
  2842c7: 6a 00                        	pushl	$0
  2842c9: 6a 08                        	pushl	$8
  2842cb: ff 75 0c                     	pushl	12(%ebp)
  2842ce: ff 75 08                     	pushl	8(%ebp)
  2842d1: e8 f0 d1 ff ff               	calll	-11792 <boxfill8>
  2842d6: 83 c4 20                     	addl	$32, %esp
  2842d9: 8b 45 10                     	movl	16(%ebp), %eax
  2842dc: 83 e8 02                     	subl	$2, %eax
  2842df: 83 ec 04                     	subl	$4, %esp
  2842e2: 50                           	pushl	%eax
  2842e3: 6a 01                        	pushl	$1
  2842e5: 6a 01                        	pushl	$1
  2842e7: 6a 01                        	pushl	$1
  2842e9: 6a 07                        	pushl	$7
  2842eb: ff 75 0c                     	pushl	12(%ebp)
  2842ee: ff 75 08                     	pushl	8(%ebp)
  2842f1: e8 d0 d1 ff ff               	calll	-11824 <boxfill8>
  2842f6: 83 c4 20                     	addl	$32, %esp
  2842f9: 8b 45 10                     	movl	16(%ebp), %eax
  2842fc: 8d 48 fe                     	leal	-2(%eax), %ecx
  2842ff: 8b 45 0c                     	movl	12(%ebp), %eax
  284302: 8d 50 fe                     	leal	-2(%eax), %edx
  284305: 8b 45 0c                     	movl	12(%ebp), %eax
  284308: 83 e8 02                     	subl	$2, %eax
  28430b: 83 ec 04                     	subl	$4, %esp
  28430e: 51                           	pushl	%ecx
  28430f: 52                           	pushl	%edx
  284310: 6a 01                        	pushl	$1
  284312: 50                           	pushl	%eax
  284313: 6a 0f                        	pushl	$15
  284315: ff 75 0c                     	pushl	12(%ebp)
  284318: ff 75 08                     	pushl	8(%ebp)
  28431b: e8 a6 d1 ff ff               	calll	-11866 <boxfill8>
  284320: 83 c4 20                     	addl	$32, %esp
  284323: 8b 45 10                     	movl	16(%ebp), %eax
  284326: 8d 48 ff                     	leal	-1(%eax), %ecx
  284329: 8b 45 0c                     	movl	12(%ebp), %eax
  28432c: 8d 50 ff                     	leal	-1(%eax), %edx
  28432f: 8b 45 0c                     	movl	12(%ebp), %eax
  284332: 83 e8 01                     	subl	$1, %eax
  284335: 83 ec 04                     	subl	$4, %esp
  284338: 51                           	pushl	%ecx
  284339: 52                           	pushl	%edx
  28433a: 6a 00                        	pushl	$0
  28433c: 50                           	pushl	%eax
  28433d: 6a 00                        	pushl	$0
  28433f: ff 75 0c                     	pushl	12(%ebp)
  284342: ff 75 08                     	pushl	8(%ebp)
  284345: e8 7c d1 ff ff               	calll	-11908 <boxfill8>
  28434a: 83 c4 20                     	addl	$32, %esp
  28434d: 8b 45 10                     	movl	16(%ebp), %eax
  284350: 8d 50 fd                     	leal	-3(%eax), %edx
  284353: 8b 45 0c                     	movl	12(%ebp), %eax
  284356: 83 e8 03                     	subl	$3, %eax
  284359: 83 ec 04                     	subl	$4, %esp
  28435c: 52                           	pushl	%edx
  28435d: 50                           	pushl	%eax
  28435e: 6a 02                        	pushl	$2
  284360: 6a 02                        	pushl	$2
  284362: 6a 08                        	pushl	$8
  284364: ff 75 0c                     	pushl	12(%ebp)
  284367: ff 75 08                     	pushl	8(%ebp)
  28436a: e8 57 d1 ff ff               	calll	-11945 <boxfill8>
  28436f: 83 c4 20                     	addl	$32, %esp
  284372: 8b 45 10                     	movl	16(%ebp), %eax
  284375: 8d 48 fe                     	leal	-2(%eax), %ecx
  284378: 8b 45 0c                     	movl	12(%ebp), %eax
  28437b: 8d 50 fe                     	leal	-2(%eax), %edx
  28437e: 8b 45 10                     	movl	16(%ebp), %eax
  284381: 83 e8 02                     	subl	$2, %eax
  284384: 83 ec 04                     	subl	$4, %esp
  284387: 51                           	pushl	%ecx
  284388: 52                           	pushl	%edx
  284389: 50                           	pushl	%eax
  28438a: 6a 01                        	pushl	$1
  28438c: 6a 0f                        	pushl	$15
  28438e: ff 75 0c                     	pushl	12(%ebp)
  284391: ff 75 08                     	pushl	8(%ebp)
  284394: e8 2d d1 ff ff               	calll	-11987 <boxfill8>
  284399: 83 c4 20                     	addl	$32, %esp
  28439c: 8b 45 10                     	movl	16(%ebp), %eax
  28439f: 8d 48 ff                     	leal	-1(%eax), %ecx
  2843a2: 8b 45 0c                     	movl	12(%ebp), %eax
  2843a5: 8d 50 ff                     	leal	-1(%eax), %edx
  2843a8: 8b 45 10                     	movl	16(%ebp), %eax
  2843ab: 83 e8 01                     	subl	$1, %eax
  2843ae: 83 ec 04                     	subl	$4, %esp
  2843b1: 51                           	pushl	%ecx
  2843b2: 52                           	pushl	%edx
  2843b3: 50                           	pushl	%eax
  2843b4: 6a 00                        	pushl	$0
  2843b6: 6a 00                        	pushl	$0
  2843b8: ff 75 0c                     	pushl	12(%ebp)
  2843bb: ff 75 08                     	pushl	8(%ebp)
  2843be: e8 03 d1 ff ff               	calll	-12029 <boxfill8>
  2843c3: 83 c4 20                     	addl	$32, %esp
  2843c6: 0f be 45 f4                  	movsbl	-12(%ebp), %eax
  2843ca: 50                           	pushl	%eax
  2843cb: ff 75 14                     	pushl	20(%ebp)
  2843ce: ff 75 0c                     	pushl	12(%ebp)
  2843d1: ff 75 08                     	pushl	8(%ebp)
  2843d4: e8 06 00 00 00               	calll	6 <make_wtitle8>
  2843d9: 83 c4 10                     	addl	$16, %esp
  2843dc: 90                           	nop
  2843dd: c9                           	leave
  2843de: c3                           	retl

002843df make_wtitle8:
  2843df: 55                           	pushl	%ebp
  2843e0: 89 e5                        	movl	%esp, %ebp
  2843e2: 83 ec 28                     	subl	$40, %esp
  2843e5: 8b 45 14                     	movl	20(%ebp), %eax
  2843e8: 88 45 e4                     	movb	%al, -28(%ebp)
  2843eb: 80 7d e4 00                  	cmpb	$0, -28(%ebp)
  2843ef: 74 0a                        	je	10 <make_wtitle8+0x1c>
  2843f1: c6 45 ee 07                  	movb	$7, -18(%ebp)
  2843f5: c6 45 ed 0c                  	movb	$12, -19(%ebp)
  2843f9: eb 08                        	jmp	8 <make_wtitle8+0x24>
  2843fb: c6 45 ee 08                  	movb	$8, -18(%ebp)
  2843ff: c6 45 ed 0f                  	movb	$15, -19(%ebp)
  284403: 8b 45 0c                     	movl	12(%ebp), %eax
  284406: 8d 50 fc                     	leal	-4(%eax), %edx
  284409: 0f b6 45 ed                  	movzbl	-19(%ebp), %eax
  28440d: 0f b6 c0                     	movzbl	%al, %eax
  284410: 83 ec 04                     	subl	$4, %esp
  284413: 6a 14                        	pushl	$20
  284415: 52                           	pushl	%edx
  284416: 6a 03                        	pushl	$3
  284418: 6a 03                        	pushl	$3
  28441a: 50                           	pushl	%eax
  28441b: ff 75 0c                     	pushl	12(%ebp)
  28441e: ff 75 08                     	pushl	8(%ebp)
  284421: e8 a0 d0 ff ff               	calll	-12128 <boxfill8>
  284426: 83 c4 20                     	addl	$32, %esp
  284429: 0f be 45 ee                  	movsbl	-18(%ebp), %eax
  28442d: 83 ec 08                     	subl	$8, %esp
  284430: ff 75 10                     	pushl	16(%ebp)
  284433: 50                           	pushl	%eax
  284434: 6a 04                        	pushl	$4
  284436: 6a 18                        	pushl	$24
  284438: ff 75 0c                     	pushl	12(%ebp)
  28443b: ff 75 08                     	pushl	8(%ebp)
  28443e: e8 f4 d3 ff ff               	calll	-11276 <putfonts8_asc>
  284443: 83 c4 20                     	addl	$32, %esp
  284446: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
  28444d: eb 7b                        	jmp	123 <make_wtitle8+0xeb>
  28444f: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  284456: eb 68                        	jmp	104 <make_wtitle8+0xe1>
  284458: 8b 45 f0                     	movl	-16(%ebp), %eax
  28445b: c1 e0 04                     	shll	$4, %eax
  28445e: 89 c2                        	movl	%eax, %edx
  284460: 8b 45 f4                     	movl	-12(%ebp), %eax
  284463: 01 d0                        	addl	%edx, %eax
  284465: 05 80 12 31 00               	addl	$3216000, %eax
  28446a: 0f b6 00                     	movzbl	(%eax), %eax
  28446d: 88 45 ef                     	movb	%al, -17(%ebp)
  284470: 80 7d ef 40                  	cmpb	$64, -17(%ebp)
  284474: 75 06                        	jne	6 <make_wtitle8+0x9d>
  284476: c6 45 ef 00                  	movb	$0, -17(%ebp)
  28447a: eb 1c                        	jmp	28 <make_wtitle8+0xb9>
  28447c: 80 7d ef 24                  	cmpb	$36, -17(%ebp)
  284480: 75 06                        	jne	6 <make_wtitle8+0xa9>
  284482: c6 45 ef 0f                  	movb	$15, -17(%ebp)
  284486: eb 10                        	jmp	16 <make_wtitle8+0xb9>
  284488: 80 7d ef 51                  	cmpb	$81, -17(%ebp)
  28448c: 75 06                        	jne	6 <make_wtitle8+0xb5>
  28448e: c6 45 ef 08                  	movb	$8, -17(%ebp)
  284492: eb 04                        	jmp	4 <make_wtitle8+0xb9>
  284494: c6 45 ef 07                  	movb	$7, -17(%ebp)
  284498: 8b 45 f0                     	movl	-16(%ebp), %eax
  28449b: 83 c0 05                     	addl	$5, %eax
  28449e: 0f af 45 0c                  	imull	12(%ebp), %eax
  2844a2: 8b 55 0c                     	movl	12(%ebp), %edx
  2844a5: 8d 4a eb                     	leal	-21(%edx), %ecx
  2844a8: 8b 55 f4                     	movl	-12(%ebp), %edx
  2844ab: 01 ca                        	addl	%ecx, %edx
  2844ad: 01 d0                        	addl	%edx, %eax
  2844af: 89 c2                        	movl	%eax, %edx
  2844b1: 8b 45 08                     	movl	8(%ebp), %eax
  2844b4: 01 c2                        	addl	%eax, %edx
  2844b6: 0f b6 45 ef                  	movzbl	-17(%ebp), %eax
  2844ba: 88 02                        	movb	%al, (%edx)
  2844bc: 83 45 f4 01                  	addl	$1, -12(%ebp)
  2844c0: 83 7d f4 0f                  	cmpl	$15, -12(%ebp)
  2844c4: 7e 92                        	jle	-110 <make_wtitle8+0x79>
  2844c6: 83 45 f0 01                  	addl	$1, -16(%ebp)
  2844ca: 83 7d f0 0d                  	cmpl	$13, -16(%ebp)
  2844ce: 0f 8e 7b ff ff ff            	jle	-133 <make_wtitle8+0x70>
  2844d4: 90                           	nop
  2844d5: c9                           	leave
  2844d6: c3                           	retl

002844d7 putfonts8_asc_sht:
  2844d7: 55                           	pushl	%ebp
  2844d8: 89 e5                        	movl	%esp, %ebp
  2844da: 56                           	pushl	%esi
  2844db: 53                           	pushl	%ebx
  2844dc: 83 ec 10                     	subl	$16, %esp
  2844df: e8 dc f6 ff ff               	calll	-2340 <task_now>
  2844e4: 89 45 f4                     	movl	%eax, -12(%ebp)
  2844e7: 8b 45 10                     	movl	16(%ebp), %eax
  2844ea: 8d 70 0f                     	leal	15(%eax), %esi
  2844ed: 8b 45 20                     	movl	32(%ebp), %eax
  2844f0: 8d 14 c5 00 00 00 00         	leal	(,%eax,8), %edx
  2844f7: 8b 45 0c                     	movl	12(%ebp), %eax
  2844fa: 01 d0                        	addl	%edx, %eax
  2844fc: 8d 58 ff                     	leal	-1(%eax), %ebx
  2844ff: 8b 45 18                     	movl	24(%ebp), %eax
  284502: 0f b6 c8                     	movzbl	%al, %ecx
  284505: 8b 45 08                     	movl	8(%ebp), %eax
  284508: 8b 50 04                     	movl	4(%eax), %edx
  28450b: 8b 45 08                     	movl	8(%ebp), %eax
  28450e: 8b 00                        	movl	(%eax), %eax
  284510: 83 ec 04                     	subl	$4, %esp
  284513: 56                           	pushl	%esi
  284514: 53                           	pushl	%ebx
  284515: ff 75 10                     	pushl	16(%ebp)
  284518: ff 75 0c                     	pushl	12(%ebp)
  28451b: 51                           	pushl	%ecx
  28451c: 52                           	pushl	%edx
  28451d: 50                           	pushl	%eax
  28451e: e8 a3 cf ff ff               	calll	-12381 <boxfill8>
  284523: 83 c4 20                     	addl	$32, %esp
  284526: 8b 45 f4                     	movl	-12(%ebp), %eax
  284529: 0f b6 80 bc 00 00 00         	movzbl	188(%eax), %eax
  284530: 84 c0                        	testb	%al, %al
  284532: 74 67                        	je	103 <putfonts8_asc_sht+0xc4>
  284534: 8b 45 f4                     	movl	-12(%ebp), %eax
  284537: 0f b6 80 bd 00 00 00         	movzbl	189(%eax), %eax
  28453e: 84 c0                        	testb	%al, %al
  284540: 74 59                        	je	89 <putfonts8_asc_sht+0xc4>
  284542: 8b 45 14                     	movl	20(%ebp), %eax
  284545: 0f be c8                     	movsbl	%al, %ecx
  284548: 8b 45 08                     	movl	8(%ebp), %eax
  28454b: 8b 50 04                     	movl	4(%eax), %edx
  28454e: 8b 45 08                     	movl	8(%ebp), %eax
  284551: 8b 00                        	movl	(%eax), %eax
  284553: 83 ec 08                     	subl	$8, %esp
  284556: ff 75 1c                     	pushl	28(%ebp)
  284559: 51                           	pushl	%ecx
  28455a: ff 75 10                     	pushl	16(%ebp)
  28455d: ff 75 0c                     	pushl	12(%ebp)
  284560: 52                           	pushl	%edx
  284561: 50                           	pushl	%eax
  284562: e8 d0 d2 ff ff               	calll	-11568 <putfonts8_asc>
  284567: 83 c4 20                     	addl	$32, %esp
  28456a: 8b 45 10                     	movl	16(%ebp), %eax
  28456d: 8d 48 10                     	leal	16(%eax), %ecx
  284570: 8b 45 20                     	movl	32(%ebp), %eax
  284573: 8d 14 c5 00 00 00 00         	leal	(,%eax,8), %edx
  28457a: 8b 45 0c                     	movl	12(%ebp), %eax
  28457d: 01 c2                        	addl	%eax, %edx
  28457f: 8b 45 0c                     	movl	12(%ebp), %eax
  284582: 83 e8 08                     	subl	$8, %eax
  284585: 83 ec 0c                     	subl	$12, %esp
  284588: 51                           	pushl	%ecx
  284589: 52                           	pushl	%edx
  28458a: ff 75 10                     	pushl	16(%ebp)
  28458d: 50                           	pushl	%eax
  28458e: ff 75 08                     	pushl	8(%ebp)
  284591: e8 b5 f0 ff ff               	calll	-3915 <sheet_refresh>
  284596: 83 c4 20                     	addl	$32, %esp
  284599: eb 53                        	jmp	83 <putfonts8_asc_sht+0x117>
  28459b: 8b 45 14                     	movl	20(%ebp), %eax
  28459e: 0f be c8                     	movsbl	%al, %ecx
  2845a1: 8b 45 08                     	movl	8(%ebp), %eax
  2845a4: 8b 50 04                     	movl	4(%eax), %edx
  2845a7: 8b 45 08                     	movl	8(%ebp), %eax
  2845aa: 8b 00                        	movl	(%eax), %eax
  2845ac: 83 ec 08                     	subl	$8, %esp
  2845af: ff 75 1c                     	pushl	28(%ebp)
  2845b2: 51                           	pushl	%ecx
  2845b3: ff 75 10                     	pushl	16(%ebp)
  2845b6: ff 75 0c                     	pushl	12(%ebp)
  2845b9: 52                           	pushl	%edx
  2845ba: 50                           	pushl	%eax
  2845bb: e8 77 d2 ff ff               	calll	-11657 <putfonts8_asc>
  2845c0: 83 c4 20                     	addl	$32, %esp
  2845c3: 8b 45 10                     	movl	16(%ebp), %eax
  2845c6: 8d 50 10                     	leal	16(%eax), %edx
  2845c9: 8b 45 20                     	movl	32(%ebp), %eax
  2845cc: 8d 0c c5 00 00 00 00         	leal	(,%eax,8), %ecx
  2845d3: 8b 45 0c                     	movl	12(%ebp), %eax
  2845d6: 01 c8                        	addl	%ecx, %eax
  2845d8: 83 ec 0c                     	subl	$12, %esp
  2845db: 52                           	pushl	%edx
  2845dc: 50                           	pushl	%eax
  2845dd: ff 75 10                     	pushl	16(%ebp)
  2845e0: ff 75 0c                     	pushl	12(%ebp)
  2845e3: ff 75 08                     	pushl	8(%ebp)
  2845e6: e8 60 f0 ff ff               	calll	-4000 <sheet_refresh>
  2845eb: 83 c4 20                     	addl	$32, %esp
  2845ee: 90                           	nop
  2845ef: 8d 65 f8                     	leal	-8(%ebp), %esp
  2845f2: 5b                           	popl	%ebx
  2845f3: 5e                           	popl	%esi
  2845f4: 5d                           	popl	%ebp
  2845f5: c3                           	retl

002845f6 make_textbox8:
  2845f6: 55                           	pushl	%ebp
  2845f7: 89 e5                        	movl	%esp, %ebp
  2845f9: 57                           	pushl	%edi
  2845fa: 56                           	pushl	%esi
  2845fb: 53                           	pushl	%ebx
  2845fc: 83 ec 1c                     	subl	$28, %esp
  2845ff: 8b 55 0c                     	movl	12(%ebp), %edx
  284602: 8b 45 14                     	movl	20(%ebp), %eax
  284605: 01 d0                        	addl	%edx, %eax
  284607: 89 45 e4                     	movl	%eax, -28(%ebp)
  28460a: 8b 55 10                     	movl	16(%ebp), %edx
  28460d: 8b 45 18                     	movl	24(%ebp), %eax
  284610: 01 d0                        	addl	%edx, %eax
  284612: 89 45 e0                     	movl	%eax, -32(%ebp)
  284615: 8b 45 10                     	movl	16(%ebp), %eax
  284618: 8d 78 fd                     	leal	-3(%eax), %edi
  28461b: 8b 45 e4                     	movl	-28(%ebp), %eax
  28461e: 8d 70 01                     	leal	1(%eax), %esi
  284621: 8b 45 10                     	movl	16(%ebp), %eax
  284624: 8d 58 fd                     	leal	-3(%eax), %ebx
  284627: 8b 45 0c                     	movl	12(%ebp), %eax
  28462a: 8d 48 fe                     	leal	-2(%eax), %ecx
  28462d: 8b 45 08                     	movl	8(%ebp), %eax
  284630: 8b 50 04                     	movl	4(%eax), %edx
  284633: 8b 45 08                     	movl	8(%ebp), %eax
  284636: 8b 00                        	movl	(%eax), %eax
  284638: 83 ec 04                     	subl	$4, %esp
  28463b: 57                           	pushl	%edi
  28463c: 56                           	pushl	%esi
  28463d: 53                           	pushl	%ebx
  28463e: 51                           	pushl	%ecx
  28463f: 6a 0f                        	pushl	$15
  284641: 52                           	pushl	%edx
  284642: 50                           	pushl	%eax
  284643: e8 7e ce ff ff               	calll	-12674 <boxfill8>
  284648: 83 c4 20                     	addl	$32, %esp
  28464b: 8b 45 e0                     	movl	-32(%ebp), %eax
  28464e: 8d 78 01                     	leal	1(%eax), %edi
  284651: 8b 45 0c                     	movl	12(%ebp), %eax
  284654: 8d 70 fd                     	leal	-3(%eax), %esi
  284657: 8b 45 10                     	movl	16(%ebp), %eax
  28465a: 8d 58 fd                     	leal	-3(%eax), %ebx
  28465d: 8b 45 0c                     	movl	12(%ebp), %eax
  284660: 8d 48 fd                     	leal	-3(%eax), %ecx
  284663: 8b 45 08                     	movl	8(%ebp), %eax
  284666: 8b 50 04                     	movl	4(%eax), %edx
  284669: 8b 45 08                     	movl	8(%ebp), %eax
  28466c: 8b 00                        	movl	(%eax), %eax
  28466e: 83 ec 04                     	subl	$4, %esp
  284671: 57                           	pushl	%edi
  284672: 56                           	pushl	%esi
  284673: 53                           	pushl	%ebx
  284674: 51                           	pushl	%ecx
  284675: 6a 0f                        	pushl	$15
  284677: 52                           	pushl	%edx
  284678: 50                           	pushl	%eax
  284679: e8 48 ce ff ff               	calll	-12728 <boxfill8>
  28467e: 83 c4 20                     	addl	$32, %esp
  284681: 8b 45 e0                     	movl	-32(%ebp), %eax
  284684: 8d 78 02                     	leal	2(%eax), %edi
  284687: 8b 45 e4                     	movl	-28(%ebp), %eax
  28468a: 8d 70 01                     	leal	1(%eax), %esi
  28468d: 8b 45 e0                     	movl	-32(%ebp), %eax
  284690: 8d 58 02                     	leal	2(%eax), %ebx
  284693: 8b 45 0c                     	movl	12(%ebp), %eax
  284696: 8d 48 fd                     	leal	-3(%eax), %ecx
  284699: 8b 45 08                     	movl	8(%ebp), %eax
  28469c: 8b 50 04                     	movl	4(%eax), %edx
  28469f: 8b 45 08                     	movl	8(%ebp), %eax
  2846a2: 8b 00                        	movl	(%eax), %eax
  2846a4: 83 ec 04                     	subl	$4, %esp
  2846a7: 57                           	pushl	%edi
  2846a8: 56                           	pushl	%esi
  2846a9: 53                           	pushl	%ebx
  2846aa: 51                           	pushl	%ecx
  2846ab: 6a 07                        	pushl	$7
  2846ad: 52                           	pushl	%edx
  2846ae: 50                           	pushl	%eax
  2846af: e8 12 ce ff ff               	calll	-12782 <boxfill8>
  2846b4: 83 c4 20                     	addl	$32, %esp
  2846b7: 8b 45 e0                     	movl	-32(%ebp), %eax
  2846ba: 8d 78 02                     	leal	2(%eax), %edi
  2846bd: 8b 45 e4                     	movl	-28(%ebp), %eax
  2846c0: 8d 70 02                     	leal	2(%eax), %esi
  2846c3: 8b 45 10                     	movl	16(%ebp), %eax
  2846c6: 8d 58 fd                     	leal	-3(%eax), %ebx
  2846c9: 8b 45 e4                     	movl	-28(%ebp), %eax
  2846cc: 8d 48 02                     	leal	2(%eax), %ecx
  2846cf: 8b 45 08                     	movl	8(%ebp), %eax
  2846d2: 8b 50 04                     	movl	4(%eax), %edx
  2846d5: 8b 45 08                     	movl	8(%ebp), %eax
  2846d8: 8b 00                        	movl	(%eax), %eax
  2846da: 83 ec 04                     	subl	$4, %esp
  2846dd: 57                           	pushl	%edi
  2846de: 56                           	pushl	%esi
  2846df: 53                           	pushl	%ebx
  2846e0: 51                           	pushl	%ecx
  2846e1: 6a 07                        	pushl	$7
  2846e3: 52                           	pushl	%edx
  2846e4: 50                           	pushl	%eax
  2846e5: e8 dc cd ff ff               	calll	-12836 <boxfill8>
  2846ea: 83 c4 20                     	addl	$32, %esp
  2846ed: 8b 45 10                     	movl	16(%ebp), %eax
  2846f0: 8d 70 fe                     	leal	-2(%eax), %esi
  2846f3: 8b 45 10                     	movl	16(%ebp), %eax
  2846f6: 8d 58 fe                     	leal	-2(%eax), %ebx
  2846f9: 8b 45 0c                     	movl	12(%ebp), %eax
  2846fc: 8d 48 ff                     	leal	-1(%eax), %ecx
  2846ff: 8b 45 08                     	movl	8(%ebp), %eax
  284702: 8b 50 04                     	movl	4(%eax), %edx
  284705: 8b 45 08                     	movl	8(%ebp), %eax
  284708: 8b 00                        	movl	(%eax), %eax
  28470a: 83 ec 04                     	subl	$4, %esp
  28470d: 56                           	pushl	%esi
  28470e: ff 75 e4                     	pushl	-28(%ebp)
  284711: 53                           	pushl	%ebx
  284712: 51                           	pushl	%ecx
  284713: 6a 00                        	pushl	$0
  284715: 52                           	pushl	%edx
  284716: 50                           	pushl	%eax
  284717: e8 aa cd ff ff               	calll	-12886 <boxfill8>
  28471c: 83 c4 20                     	addl	$32, %esp
  28471f: 8b 45 0c                     	movl	12(%ebp), %eax
  284722: 8d 70 fe                     	leal	-2(%eax), %esi
  284725: 8b 45 10                     	movl	16(%ebp), %eax
  284728: 8d 58 fe                     	leal	-2(%eax), %ebx
  28472b: 8b 45 0c                     	movl	12(%ebp), %eax
  28472e: 8d 48 fe                     	leal	-2(%eax), %ecx
  284731: 8b 45 08                     	movl	8(%ebp), %eax
  284734: 8b 50 04                     	movl	4(%eax), %edx
  284737: 8b 45 08                     	movl	8(%ebp), %eax
  28473a: 8b 00                        	movl	(%eax), %eax
  28473c: 83 ec 04                     	subl	$4, %esp
  28473f: ff 75 e0                     	pushl	-32(%ebp)
  284742: 56                           	pushl	%esi
  284743: 53                           	pushl	%ebx
  284744: 51                           	pushl	%ecx
  284745: 6a 00                        	pushl	$0
  284747: 52                           	pushl	%edx
  284748: 50                           	pushl	%eax
  284749: e8 78 cd ff ff               	calll	-12936 <boxfill8>
  28474e: 83 c4 20                     	addl	$32, %esp
  284751: 8b 45 e0                     	movl	-32(%ebp), %eax
  284754: 8d 70 01                     	leal	1(%eax), %esi
  284757: 8b 45 e0                     	movl	-32(%ebp), %eax
  28475a: 8d 58 01                     	leal	1(%eax), %ebx
  28475d: 8b 45 0c                     	movl	12(%ebp), %eax
  284760: 8d 48 fe                     	leal	-2(%eax), %ecx
  284763: 8b 45 08                     	movl	8(%ebp), %eax
  284766: 8b 50 04                     	movl	4(%eax), %edx
  284769: 8b 45 08                     	movl	8(%ebp), %eax
  28476c: 8b 00                        	movl	(%eax), %eax
  28476e: 83 ec 04                     	subl	$4, %esp
  284771: 56                           	pushl	%esi
  284772: ff 75 e4                     	pushl	-28(%ebp)
  284775: 53                           	pushl	%ebx
  284776: 51                           	pushl	%ecx
  284777: 6a 08                        	pushl	$8
  284779: 52                           	pushl	%edx
  28477a: 50                           	pushl	%eax
  28477b: e8 46 cd ff ff               	calll	-12986 <boxfill8>
  284780: 83 c4 20                     	addl	$32, %esp
  284783: 8b 45 e0                     	movl	-32(%ebp), %eax
  284786: 8d 78 01                     	leal	1(%eax), %edi
  284789: 8b 45 e4                     	movl	-28(%ebp), %eax
  28478c: 8d 70 01                     	leal	1(%eax), %esi
  28478f: 8b 45 10                     	movl	16(%ebp), %eax
  284792: 8d 58 fe                     	leal	-2(%eax), %ebx
  284795: 8b 45 e4                     	movl	-28(%ebp), %eax
  284798: 8d 48 01                     	leal	1(%eax), %ecx
  28479b: 8b 45 08                     	movl	8(%ebp), %eax
  28479e: 8b 50 04                     	movl	4(%eax), %edx
  2847a1: 8b 45 08                     	movl	8(%ebp), %eax
  2847a4: 8b 00                        	movl	(%eax), %eax
  2847a6: 83 ec 04                     	subl	$4, %esp
  2847a9: 57                           	pushl	%edi
  2847aa: 56                           	pushl	%esi
  2847ab: 53                           	pushl	%ebx
  2847ac: 51                           	pushl	%ecx
  2847ad: 6a 08                        	pushl	$8
  2847af: 52                           	pushl	%edx
  2847b0: 50                           	pushl	%eax
  2847b1: e8 10 cd ff ff               	calll	-13040 <boxfill8>
  2847b6: 83 c4 20                     	addl	$32, %esp
  2847b9: 8b 45 10                     	movl	16(%ebp), %eax
  2847bc: 8d 70 ff                     	leal	-1(%eax), %esi
  2847bf: 8b 45 0c                     	movl	12(%ebp), %eax
  2847c2: 8d 58 ff                     	leal	-1(%eax), %ebx
  2847c5: 8b 45 1c                     	movl	28(%ebp), %eax
  2847c8: 0f b6 c8                     	movzbl	%al, %ecx
  2847cb: 8b 45 08                     	movl	8(%ebp), %eax
  2847ce: 8b 50 04                     	movl	4(%eax), %edx
  2847d1: 8b 45 08                     	movl	8(%ebp), %eax
  2847d4: 8b 00                        	movl	(%eax), %eax
  2847d6: 83 ec 04                     	subl	$4, %esp
  2847d9: ff 75 e0                     	pushl	-32(%ebp)
  2847dc: ff 75 e4                     	pushl	-28(%ebp)
  2847df: 56                           	pushl	%esi
  2847e0: 53                           	pushl	%ebx
  2847e1: 51                           	pushl	%ecx
  2847e2: 52                           	pushl	%edx
  2847e3: 50                           	pushl	%eax
  2847e4: e8 dd cc ff ff               	calll	-13091 <boxfill8>
  2847e9: 83 c4 20                     	addl	$32, %esp
  2847ec: 90                           	nop
  2847ed: 8d 65 f4                     	leal	-12(%ebp), %esp
  2847f0: 5b                           	popl	%ebx
  2847f1: 5e                           	popl	%esi
  2847f2: 5f                           	popl	%edi
  2847f3: 5d                           	popl	%ebp
  2847f4: c3                           	retl

002847f5 change_wtitle8:
  2847f5: 55                           	pushl	%ebp
  2847f6: 89 e5                        	movl	%esp, %ebp
  2847f8: 83 ec 38                     	subl	$56, %esp
  2847fb: 8b 45 0c                     	movl	12(%ebp), %eax
  2847fe: 88 45 d4                     	movb	%al, -44(%ebp)
  284801: 8b 45 08                     	movl	8(%ebp), %eax
  284804: 8b 40 04                     	movl	4(%eax), %eax
  284807: 89 45 e4                     	movl	%eax, -28(%ebp)
  28480a: 8b 45 08                     	movl	8(%ebp), %eax
  28480d: 8b 00                        	movl	(%eax), %eax
  28480f: 89 45 e0                     	movl	%eax, -32(%ebp)
  284812: 80 7d d4 00                  	cmpb	$0, -44(%ebp)
  284816: 74 12                        	je	18 <change_wtitle8+0x35>
  284818: c6 45 ee 07                  	movb	$7, -18(%ebp)
  28481c: c6 45 ed 0c                  	movb	$12, -19(%ebp)
  284820: c6 45 ec 08                  	movb	$8, -20(%ebp)
  284824: c6 45 eb 0f                  	movb	$15, -21(%ebp)
  284828: eb 10                        	jmp	16 <change_wtitle8+0x45>
  28482a: c6 45 ee 08                  	movb	$8, -18(%ebp)
  28482e: c6 45 ed 0f                  	movb	$15, -19(%ebp)
  284832: c6 45 ec 07                  	movb	$7, -20(%ebp)
  284836: c6 45 eb 0c                  	movb	$12, -21(%ebp)
  28483a: c7 45 f0 03 00 00 00         	movl	$3, -16(%ebp)
  284841: eb 7f                        	jmp	127 <change_wtitle8+0xcd>
  284843: c7 45 f4 03 00 00 00         	movl	$3, -12(%ebp)
  28484a: eb 67                        	jmp	103 <change_wtitle8+0xbe>
  28484c: 8b 45 f0                     	movl	-16(%ebp), %eax
  28484f: 0f af 45 e4                  	imull	-28(%ebp), %eax
  284853: 89 c2                        	movl	%eax, %edx
  284855: 8b 45 f4                     	movl	-12(%ebp), %eax
  284858: 01 d0                        	addl	%edx, %eax
  28485a: 89 c2                        	movl	%eax, %edx
  28485c: 8b 45 e0                     	movl	-32(%ebp), %eax
  28485f: 01 d0                        	addl	%edx, %eax
  284861: 0f b6 00                     	movzbl	(%eax), %eax
  284864: 88 45 ef                     	movb	%al, -17(%ebp)
  284867: 0f b6 45 ef                  	movzbl	-17(%ebp), %eax
  28486b: 3a 45 ec                     	cmpb	-20(%ebp), %al
  28486e: 75 14                        	jne	20 <change_wtitle8+0x8f>
  284870: 8b 45 e4                     	movl	-28(%ebp), %eax
  284873: 83 e8 16                     	subl	$22, %eax
  284876: 39 45 f4                     	cmpl	%eax, -12(%ebp)
  284879: 7f 09                        	jg	9 <change_wtitle8+0x8f>
  28487b: 0f b6 45 ee                  	movzbl	-18(%ebp), %eax
  28487f: 88 45 ef                     	movb	%al, -17(%ebp)
  284882: eb 10                        	jmp	16 <change_wtitle8+0x9f>
  284884: 0f b6 45 ef                  	movzbl	-17(%ebp), %eax
  284888: 3a 45 eb                     	cmpb	-21(%ebp), %al
  28488b: 75 07                        	jne	7 <change_wtitle8+0x9f>
  28488d: 0f b6 45 ed                  	movzbl	-19(%ebp), %eax
  284891: 88 45 ef                     	movb	%al, -17(%ebp)
  284894: 8b 45 f0                     	movl	-16(%ebp), %eax
  284897: 0f af 45 e4                  	imull	-28(%ebp), %eax
  28489b: 89 c2                        	movl	%eax, %edx
  28489d: 8b 45 f4                     	movl	-12(%ebp), %eax
  2848a0: 01 d0                        	addl	%edx, %eax
  2848a2: 89 c2                        	movl	%eax, %edx
  2848a4: 8b 45 e0                     	movl	-32(%ebp), %eax
  2848a7: 01 c2                        	addl	%eax, %edx
  2848a9: 0f b6 45 ef                  	movzbl	-17(%ebp), %eax
  2848ad: 88 02                        	movb	%al, (%edx)
  2848af: 83 45 f4 01                  	addl	$1, -12(%ebp)
  2848b3: 8b 45 e4                     	movl	-28(%ebp), %eax
  2848b6: 83 e8 04                     	subl	$4, %eax
  2848b9: 39 45 f4                     	cmpl	%eax, -12(%ebp)
  2848bc: 7e 8e                        	jle	-114 <change_wtitle8+0x57>
  2848be: 83 45 f0 01                  	addl	$1, -16(%ebp)
  2848c2: 83 7d f0 14                  	cmpl	$20, -16(%ebp)
  2848c6: 0f 8e 77 ff ff ff            	jle	-137 <change_wtitle8+0x4e>
  2848cc: 83 ec 0c                     	subl	$12, %esp
  2848cf: 6a 15                        	pushl	$21
  2848d1: ff 75 e4                     	pushl	-28(%ebp)
  2848d4: 6a 03                        	pushl	$3
  2848d6: 6a 03                        	pushl	$3
  2848d8: ff 75 08                     	pushl	8(%ebp)
  2848db: e8 6b ed ff ff               	calll	-4757 <sheet_refresh>
  2848e0: 83 c4 20                     	addl	$32, %esp
  2848e3: 90                           	nop
  2848e4: c9                           	leave
  2848e5: c3                           	retl

002848e6 console_task:
  2848e6: 55                           	pushl	%ebp
  2848e7: 89 e5                        	movl	%esp, %ebp
  2848e9: 57                           	pushl	%edi
  2848ea: 56                           	pushl	%esi
  2848eb: 53                           	pushl	%ebx
  2848ec: 81 ec cc 00 00 00            	subl	$204, %esp
  2848f2: e8 c9 f2 ff ff               	calll	-3383 <task_now>
  2848f7: 89 45 e0                     	movl	%eax, -32(%ebp)
  2848fa: c7 45 dc 00 00 3c 00         	movl	$3932160, -36(%ebp)
  284901: 83 ec 08                     	subl	$8, %esp
  284904: 68 00 2d 00 00               	pushl	$11520
  284909: ff 75 dc                     	pushl	-36(%ebp)
  28490c: e8 47 df ff ff               	calll	-8377 <memman_alloc_4k>
  284911: 83 c4 10                     	addl	$16, %esp
  284914: 89 45 d8                     	movl	%eax, -40(%ebp)
  284917: b8 e8 0f 00 00               	movl	$4072, %eax
  28491c: 8b 00                        	movl	(%eax), %eax
  28491e: 89 45 d4                     	movl	%eax, -44(%ebp)
  284921: 8b 45 08                     	movl	8(%ebp), %eax
  284924: 89 45 c0                     	movl	%eax, -64(%ebp)
  284927: c7 45 c4 08 00 00 00         	movl	$8, -60(%ebp)
  28492e: c7 45 c8 1c 00 00 00         	movl	$28, -56(%ebp)
  284935: c7 45 cc ff ff ff ff         	movl	$4294967295, -52(%ebp)
  28493c: 8b 45 e0                     	movl	-32(%ebp), %eax
  28493f: 8d 55 c0                     	leal	-64(%ebp), %edx
  284942: 89 90 a4 00 00 00            	movl	%edx, 164(%eax)
  284948: 8b 45 e0                     	movl	-32(%ebp), %eax
  28494b: 8d 95 42 ff ff ff            	leal	-190(%ebp), %edx
  284951: 89 90 b8 00 00 00            	movl	%edx, 184(%eax)
  284957: 8b 45 c0                     	movl	-64(%ebp), %eax
  28495a: 85 c0                        	testl	%eax, %eax
  28495c: 74 31                        	je	49 <console_task+0xa9>
  28495e: e8 35 ef ff ff               	calll	-4299 <timer_alloc>
  284963: 89 45 d0                     	movl	%eax, -48(%ebp)
  284966: 8b 45 e0                     	movl	-32(%ebp), %eax
  284969: 8d 50 10                     	leal	16(%eax), %edx
  28496c: 8b 45 d0                     	movl	-48(%ebp), %eax
  28496f: 83 ec 04                     	subl	$4, %esp
  284972: 6a 01                        	pushl	$1
  284974: 52                           	pushl	%edx
  284975: 50                           	pushl	%eax
  284976: e8 a7 ef ff ff               	calll	-4185 <timer_init>
  28497b: 83 c4 10                     	addl	$16, %esp
  28497e: 8b 45 d0                     	movl	-48(%ebp), %eax
  284981: 83 ec 08                     	subl	$8, %esp
  284984: 6a 32                        	pushl	$50
  284986: 50                           	pushl	%eax
  284987: e8 ae ef ff ff               	calll	-4178 <timer_settime>
  28498c: 83 c4 10                     	addl	$16, %esp
  28498f: 83 ec 08                     	subl	$8, %esp
  284992: 68 00 02 10 00               	pushl	$1049088
  284997: ff 75 d8                     	pushl	-40(%ebp)
  28499a: e8 e7 1b 00 00               	calll	7143 <file_readfat>
  28499f: 83 c4 10                     	addl	$16, %esp
  2849a2: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
  2849a9: eb 20                        	jmp	32 <console_task+0xe5>
  2849ab: 8b 55 e4                     	movl	-28(%ebp), %edx
  2849ae: 89 d0                        	movl	%edx, %eax
  2849b0: 01 c0                        	addl	%eax, %eax
  2849b2: 01 d0                        	addl	%edx, %eax
  2849b4: c1 e0 02                     	shll	$2, %eax
  2849b7: 8d 7d e8                     	leal	-24(%ebp), %edi
  2849ba: 01 f8                        	addl	%edi, %eax
  2849bc: 2d 88 00 00 00               	subl	$136, %eax
  2849c1: c7 00 00 00 00 00            	movl	$0, (%eax)
  2849c7: 83 45 e4 01                  	addl	$1, -28(%ebp)
  2849cb: 83 7d e4 07                  	cmpl	$7, -28(%ebp)
  2849cf: 7e da                        	jle	-38 <console_task+0xc5>
  2849d1: 8b 45 e0                     	movl	-32(%ebp), %eax
  2849d4: 8d 95 60 ff ff ff            	leal	-160(%ebp), %edx
  2849da: 89 90 b0 00 00 00            	movl	%edx, 176(%eax)
  2849e0: 8b 45 e0                     	movl	-32(%ebp), %eax
  2849e3: 8b 55 d8                     	movl	-40(%ebp), %edx
  2849e6: 89 90 b4 00 00 00            	movl	%edx, 180(%eax)
  2849ec: 8b 45 d4                     	movl	-44(%ebp), %eax
  2849ef: 05 00 10 00 00               	addl	$4096, %eax
  2849f4: 0f b6 00                     	movzbl	(%eax), %eax
  2849f7: 3c ff                        	cmpb	$-1, %al
  2849f9: 74 0c                        	je	12 <console_task+0x121>
  2849fb: 8b 45 e0                     	movl	-32(%ebp), %eax
  2849fe: c6 80 bc 00 00 00 01         	movb	$1, 188(%eax)
  284a05: eb 0a                        	jmp	10 <console_task+0x12b>
  284a07: 8b 45 e0                     	movl	-32(%ebp), %eax
  284a0a: c6 80 bc 00 00 00 00         	movb	$0, 188(%eax)
  284a11: 8b 45 e0                     	movl	-32(%ebp), %eax
  284a14: c6 80 bd 00 00 00 00         	movb	$0, 189(%eax)
  284a1b: 83 ec 04                     	subl	$4, %esp
  284a1e: 6a 01                        	pushl	$1
  284a20: 6a 3e                        	pushl	$62
  284a22: 8d 45 c0                     	leal	-64(%ebp), %eax
  284a25: 50                           	pushl	%eax
  284a26: e8 c2 02 00 00               	calll	706 <cons_putchar>
  284a2b: 83 c4 10                     	addl	$16, %esp
  284a2e: e8 ef c6 ff ff               	calll	-14609 <io_cli>
  284a33: 8b 45 e0                     	movl	-32(%ebp), %eax
  284a36: 83 c0 10                     	addl	$16, %eax
  284a39: 83 ec 0c                     	subl	$12, %esp
  284a3c: 50                           	pushl	%eax
  284a3d: e8 21 d7 ff ff               	calll	-10463 <fifo32_status>
  284a42: 83 c4 10                     	addl	$16, %esp
  284a45: 85 c0                        	testl	%eax, %eax
  284a47: 75 15                        	jne	21 <console_task+0x178>
  284a49: 83 ec 0c                     	subl	$12, %esp
  284a4c: ff 75 e0                     	pushl	-32(%ebp)
  284a4f: e8 fa f6 ff ff               	calll	-2310 <task_sleep>
  284a54: 83 c4 10                     	addl	$16, %esp
  284a57: e8 c8 c6 ff ff               	calll	-14648 <io_sti>
  284a5c: eb d0                        	jmp	-48 <console_task+0x148>
  284a5e: 8b 45 e0                     	movl	-32(%ebp), %eax
  284a61: 83 c0 10                     	addl	$16, %eax
  284a64: 83 ec 0c                     	subl	$12, %esp
  284a67: 50                           	pushl	%eax
  284a68: e8 87 d6 ff ff               	calll	-10617 <fifo32_get>
  284a6d: 83 c4 10                     	addl	$16, %esp
  284a70: 89 45 e4                     	movl	%eax, -28(%ebp)
  284a73: e8 ac c6 ff ff               	calll	-14676 <io_sti>
  284a78: 83 7d e4 01                  	cmpl	$1, -28(%ebp)
  284a7c: 7f 6c                        	jg	108 <console_task+0x204>
  284a7e: 8b 45 c0                     	movl	-64(%ebp), %eax
  284a81: 85 c0                        	testl	%eax, %eax
  284a83: 74 65                        	je	101 <console_task+0x204>
  284a85: 83 7d e4 00                  	cmpl	$0, -28(%ebp)
  284a89: 74 28                        	je	40 <console_task+0x1cd>
  284a8b: 8b 45 e0                     	movl	-32(%ebp), %eax
  284a8e: 8d 50 10                     	leal	16(%eax), %edx
  284a91: 8b 45 d0                     	movl	-48(%ebp), %eax
  284a94: 83 ec 04                     	subl	$4, %esp
  284a97: 6a 00                        	pushl	$0
  284a99: 52                           	pushl	%edx
  284a9a: 50                           	pushl	%eax
  284a9b: e8 82 ee ff ff               	calll	-4478 <timer_init>
  284aa0: 83 c4 10                     	addl	$16, %esp
  284aa3: 8b 45 cc                     	movl	-52(%ebp), %eax
  284aa6: 85 c0                        	testl	%eax, %eax
  284aa8: 78 2f                        	js	47 <console_task+0x1f3>
  284aaa: c7 45 cc 07 00 00 00         	movl	$7, -52(%ebp)
  284ab1: eb 26                        	jmp	38 <console_task+0x1f3>
  284ab3: 8b 45 e0                     	movl	-32(%ebp), %eax
  284ab6: 8d 50 10                     	leal	16(%eax), %edx
  284ab9: 8b 45 d0                     	movl	-48(%ebp), %eax
  284abc: 83 ec 04                     	subl	$4, %esp
  284abf: 6a 01                        	pushl	$1
  284ac1: 52                           	pushl	%edx
  284ac2: 50                           	pushl	%eax
  284ac3: e8 5a ee ff ff               	calll	-4518 <timer_init>
  284ac8: 83 c4 10                     	addl	$16, %esp
  284acb: 8b 45 cc                     	movl	-52(%ebp), %eax
  284ace: 85 c0                        	testl	%eax, %eax
  284ad0: 78 07                        	js	7 <console_task+0x1f3>
  284ad2: c7 45 cc 00 00 00 00         	movl	$0, -52(%ebp)
  284ad9: 8b 45 d0                     	movl	-48(%ebp), %eax
  284adc: 83 ec 08                     	subl	$8, %esp
  284adf: 6a 32                        	pushl	$50
  284ae1: 50                           	pushl	%eax
  284ae2: e8 53 ee ff ff               	calll	-4525 <timer_settime>
  284ae7: 83 c4 10                     	addl	$16, %esp
  284aea: 83 7d e4 02                  	cmpl	$2, -28(%ebp)
  284aee: 75 07                        	jne	7 <console_task+0x211>
  284af0: c7 45 cc 07 00 00 00         	movl	$7, -52(%ebp)
  284af7: 83 7d e4 03                  	cmpl	$3, -28(%ebp)
  284afb: 75 3e                        	jne	62 <console_task+0x255>
  284afd: 8b 45 c0                     	movl	-64(%ebp), %eax
  284b00: 85 c0                        	testl	%eax, %eax
  284b02: 74 30                        	je	48 <console_task+0x24e>
  284b04: 8b 45 c8                     	movl	-56(%ebp), %eax
  284b07: 8d 78 0f                     	leal	15(%eax), %edi
  284b0a: 8b 45 c4                     	movl	-60(%ebp), %eax
  284b0d: 8d 70 07                     	leal	7(%eax), %esi
  284b10: 8b 5d c8                     	movl	-56(%ebp), %ebx
  284b13: 8b 4d c4                     	movl	-60(%ebp), %ecx
  284b16: 8b 45 c0                     	movl	-64(%ebp), %eax
  284b19: 8b 50 04                     	movl	4(%eax), %edx
  284b1c: 8b 45 c0                     	movl	-64(%ebp), %eax
  284b1f: 8b 00                        	movl	(%eax), %eax
  284b21: 83 ec 04                     	subl	$4, %esp
  284b24: 57                           	pushl	%edi
  284b25: 56                           	pushl	%esi
  284b26: 53                           	pushl	%ebx
  284b27: 51                           	pushl	%ecx
  284b28: 6a 00                        	pushl	$0
  284b2a: 52                           	pushl	%edx
  284b2b: 50                           	pushl	%eax
  284b2c: e8 95 c9 ff ff               	calll	-13931 <boxfill8>
  284b31: 83 c4 20                     	addl	$32, %esp
  284b34: c7 45 cc ff ff ff ff         	movl	$4294967295, -52(%ebp)
  284b3b: 83 7d e4 04                  	cmpl	$4, -28(%ebp)
  284b3f: 75 12                        	jne	18 <console_task+0x26d>
  284b41: 83 ec 08                     	subl	$8, %esp
  284b44: ff 75 d8                     	pushl	-40(%ebp)
  284b47: 8d 45 c0                     	leal	-64(%ebp), %eax
  284b4a: 50                           	pushl	%eax
  284b4b: e8 0c 08 00 00               	calll	2060 <cmd_exit>
  284b50: 83 c4 10                     	addl	$16, %esp
  284b53: 81 7d e4 ff 00 00 00         	cmpl	$255, -28(%ebp)
  284b5a: 0f 8e 11 01 00 00            	jle	273 <console_task+0x38b>
  284b60: 81 7d e4 ff 01 00 00         	cmpl	$511, -28(%ebp)
  284b67: 0f 8f 04 01 00 00            	jg	260 <console_task+0x38b>
  284b6d: 81 7d e4 08 01 00 00         	cmpl	$264, -28(%ebp)
  284b74: 75 2d                        	jne	45 <console_task+0x2bd>
  284b76: 8b 45 c4                     	movl	-60(%ebp), %eax
  284b79: 83 f8 10                     	cmpl	$16, %eax
  284b7c: 0f 8e ef 00 00 00            	jle	239 <console_task+0x38b>
  284b82: 83 ec 04                     	subl	$4, %esp
  284b85: 6a 00                        	pushl	$0
  284b87: 6a 20                        	pushl	$32
  284b89: 8d 45 c0                     	leal	-64(%ebp), %eax
  284b8c: 50                           	pushl	%eax
  284b8d: e8 5b 01 00 00               	calll	347 <cons_putchar>
  284b92: 83 c4 10                     	addl	$16, %esp
  284b95: 8b 45 c4                     	movl	-60(%ebp), %eax
  284b98: 83 e8 08                     	subl	$8, %eax
  284b9b: 89 45 c4                     	movl	%eax, -60(%ebp)
  284b9e: e9 ce 00 00 00               	jmp	206 <console_task+0x38b>
  284ba3: 81 7d e4 0a 01 00 00         	cmpl	$266, -28(%ebp)
  284baa: 0f 85 82 00 00 00            	jne	130 <console_task+0x34c>
  284bb0: 83 ec 04                     	subl	$4, %esp
  284bb3: 6a 00                        	pushl	$0
  284bb5: 6a 20                        	pushl	$32
  284bb7: 8d 45 c0                     	leal	-64(%ebp), %eax
  284bba: 50                           	pushl	%eax
  284bbb: e8 2d 01 00 00               	calll	301 <cons_putchar>
  284bc0: 83 c4 10                     	addl	$16, %esp
  284bc3: 8b 45 c4                     	movl	-60(%ebp), %eax
  284bc6: 8d 50 07                     	leal	7(%eax), %edx
  284bc9: 85 c0                        	testl	%eax, %eax
  284bcb: 0f 48 c2                     	cmovsl	%edx, %eax
  284bce: c1 f8 03                     	sarl	$3, %eax
  284bd1: 83 e8 02                     	subl	$2, %eax
  284bd4: c6 84 05 42 ff ff ff 00      	movb	$0, -190(%ebp,%eax)
  284bdc: 83 ec 0c                     	subl	$12, %esp
  284bdf: 8d 45 c0                     	leal	-64(%ebp), %eax
  284be2: 50                           	pushl	%eax
  284be3: e8 23 02 00 00               	calll	547 <cons_newline>
  284be8: 83 c4 10                     	addl	$16, %esp
  284beb: ff 75 0c                     	pushl	12(%ebp)
  284bee: ff 75 d8                     	pushl	-40(%ebp)
  284bf1: 8d 45 c0                     	leal	-64(%ebp), %eax
  284bf4: 50                           	pushl	%eax
  284bf5: 8d 85 42 ff ff ff            	leal	-190(%ebp), %eax
  284bfb: 50                           	pushl	%eax
  284bfc: e8 bb 03 00 00               	calll	955 <cons_runcmd>
  284c01: 83 c4 10                     	addl	$16, %esp
  284c04: 8b 45 c0                     	movl	-64(%ebp), %eax
  284c07: 85 c0                        	testl	%eax, %eax
  284c09: 75 12                        	jne	18 <console_task+0x337>
  284c0b: 83 ec 08                     	subl	$8, %esp
  284c0e: ff 75 d8                     	pushl	-40(%ebp)
  284c11: 8d 45 c0                     	leal	-64(%ebp), %eax
  284c14: 50                           	pushl	%eax
  284c15: e8 42 07 00 00               	calll	1858 <cmd_exit>
  284c1a: 83 c4 10                     	addl	$16, %esp
  284c1d: 83 ec 04                     	subl	$4, %esp
  284c20: 6a 01                        	pushl	$1
  284c22: 6a 3e                        	pushl	$62
  284c24: 8d 45 c0                     	leal	-64(%ebp), %eax
  284c27: 50                           	pushl	%eax
  284c28: e8 c0 00 00 00               	calll	192 <cons_putchar>
  284c2d: 83 c4 10                     	addl	$16, %esp
  284c30: eb 3f                        	jmp	63 <console_task+0x38b>
  284c32: 8b 45 c4                     	movl	-60(%ebp), %eax
  284c35: 3d ef 00 00 00               	cmpl	$239, %eax
  284c3a: 7f 35                        	jg	53 <console_task+0x38b>
  284c3c: 8b 45 c4                     	movl	-60(%ebp), %eax
  284c3f: 8d 50 07                     	leal	7(%eax), %edx
  284c42: 85 c0                        	testl	%eax, %eax
  284c44: 0f 48 c2                     	cmovsl	%edx, %eax
  284c47: c1 f8 03                     	sarl	$3, %eax
  284c4a: 83 e8 02                     	subl	$2, %eax
  284c4d: 8b 55 e4                     	movl	-28(%ebp), %edx
  284c50: 88 94 05 42 ff ff ff         	movb	%dl, -190(%ebp,%eax)
  284c57: 8b 45 e4                     	movl	-28(%ebp), %eax
  284c5a: 2d 00 01 00 00               	subl	$256, %eax
  284c5f: 83 ec 04                     	subl	$4, %esp
  284c62: 6a 01                        	pushl	$1
  284c64: 50                           	pushl	%eax
  284c65: 8d 45 c0                     	leal	-64(%ebp), %eax
  284c68: 50                           	pushl	%eax
  284c69: e8 7f 00 00 00               	calll	127 <cons_putchar>
  284c6e: 83 c4 10                     	addl	$16, %esp
  284c71: 8b 45 c0                     	movl	-64(%ebp), %eax
  284c74: 85 c0                        	testl	%eax, %eax
  284c76: 0f 84 b2 fd ff ff            	je	-590 <console_task+0x148>
  284c7c: 8b 45 cc                     	movl	-52(%ebp), %eax
  284c7f: 85 c0                        	testl	%eax, %eax
  284c81: 78 40                        	js	64 <console_task+0x3dd>
  284c83: 8b 45 c8                     	movl	-56(%ebp), %eax
  284c86: 83 c0 0f                     	addl	$15, %eax
  284c89: 89 85 34 ff ff ff            	movl	%eax, -204(%ebp)
  284c8f: 8b 45 c4                     	movl	-60(%ebp), %eax
  284c92: 8d 78 07                     	leal	7(%eax), %edi
  284c95: 8b 75 c8                     	movl	-56(%ebp), %esi
  284c98: 8b 5d c4                     	movl	-60(%ebp), %ebx
  284c9b: 8b 45 cc                     	movl	-52(%ebp), %eax
  284c9e: 0f b6 c8                     	movzbl	%al, %ecx
  284ca1: 8b 45 c0                     	movl	-64(%ebp), %eax
  284ca4: 8b 50 04                     	movl	4(%eax), %edx
  284ca7: 8b 45 c0                     	movl	-64(%ebp), %eax
  284caa: 8b 00                        	movl	(%eax), %eax
  284cac: 83 ec 04                     	subl	$4, %esp
  284caf: ff b5 34 ff ff ff            	pushl	-204(%ebp)
  284cb5: 57                           	pushl	%edi
  284cb6: 56                           	pushl	%esi
  284cb7: 53                           	pushl	%ebx
  284cb8: 51                           	pushl	%ecx
  284cb9: 52                           	pushl	%edx
  284cba: 50                           	pushl	%eax
  284cbb: e8 06 c8 ff ff               	calll	-14330 <boxfill8>
  284cc0: 83 c4 20                     	addl	$32, %esp
  284cc3: 8b 45 c8                     	movl	-56(%ebp), %eax
  284cc6: 8d 70 10                     	leal	16(%eax), %esi
  284cc9: 8b 45 c4                     	movl	-60(%ebp), %eax
  284ccc: 8d 58 08                     	leal	8(%eax), %ebx
  284ccf: 8b 4d c8                     	movl	-56(%ebp), %ecx
  284cd2: 8b 55 c4                     	movl	-60(%ebp), %edx
  284cd5: 8b 45 c0                     	movl	-64(%ebp), %eax
  284cd8: 83 ec 0c                     	subl	$12, %esp
  284cdb: 56                           	pushl	%esi
  284cdc: 53                           	pushl	%ebx
  284cdd: 51                           	pushl	%ecx
  284cde: 52                           	pushl	%edx
  284cdf: 50                           	pushl	%eax
  284ce0: e8 66 e9 ff ff               	calll	-5786 <sheet_refresh>
  284ce5: 83 c4 20                     	addl	$32, %esp
  284ce8: e9 41 fd ff ff               	jmp	-703 <console_task+0x148>

00284ced cons_putchar:
  284ced: 55                           	pushl	%ebp
  284cee: 89 e5                        	movl	%esp, %ebp
  284cf0: 53                           	pushl	%ebx
  284cf1: 83 ec 24                     	subl	$36, %esp
  284cf4: 8b 45 10                     	movl	16(%ebp), %eax
  284cf7: 88 45 e4                     	movb	%al, -28(%ebp)
  284cfa: 8b 45 0c                     	movl	12(%ebp), %eax
  284cfd: 88 45 f6                     	movb	%al, -10(%ebp)
  284d00: c6 45 f7 00                  	movb	$0, -9(%ebp)
  284d04: 0f b6 45 f6                  	movzbl	-10(%ebp), %eax
  284d08: 3c 09                        	cmpb	$9, %al
  284d0a: 75 73                        	jne	115 <cons_putchar+0x92>
  284d0c: 8b 45 08                     	movl	8(%ebp), %eax
  284d0f: 8b 00                        	movl	(%eax), %eax
  284d11: 85 c0                        	testl	%eax, %eax
  284d13: 74 2a                        	je	42 <cons_putchar+0x52>
  284d15: 8b 45 08                     	movl	8(%ebp), %eax
  284d18: 8b 48 08                     	movl	8(%eax), %ecx
  284d1b: 8b 45 08                     	movl	8(%ebp), %eax
  284d1e: 8b 50 04                     	movl	4(%eax), %edx
  284d21: 8b 45 08                     	movl	8(%ebp), %eax
  284d24: 8b 00                        	movl	(%eax), %eax
  284d26: 83 ec 04                     	subl	$4, %esp
  284d29: 6a 01                        	pushl	$1
  284d2b: 68 60 13 31 00               	pushl	$3216224
  284d30: 6a 00                        	pushl	$0
  284d32: 6a 07                        	pushl	$7
  284d34: 51                           	pushl	%ecx
  284d35: 52                           	pushl	%edx
  284d36: 50                           	pushl	%eax
  284d37: e8 9b f7 ff ff               	calll	-2149 <putfonts8_asc_sht>
  284d3c: 83 c4 20                     	addl	$32, %esp
  284d3f: 8b 45 08                     	movl	8(%ebp), %eax
  284d42: 8b 40 04                     	movl	4(%eax), %eax
  284d45: 8d 50 08                     	leal	8(%eax), %edx
  284d48: 8b 45 08                     	movl	8(%ebp), %eax
  284d4b: 89 50 04                     	movl	%edx, 4(%eax)
  284d4e: 8b 45 08                     	movl	8(%ebp), %eax
  284d51: 8b 40 04                     	movl	4(%eax), %eax
  284d54: 3d f8 00 00 00               	cmpl	$248, %eax
  284d59: 75 0e                        	jne	14 <cons_putchar+0x7c>
  284d5b: 83 ec 0c                     	subl	$12, %esp
  284d5e: ff 75 08                     	pushl	8(%ebp)
  284d61: e8 a5 00 00 00               	calll	165 <cons_newline>
  284d66: 83 c4 10                     	addl	$16, %esp
  284d69: 8b 45 08                     	movl	8(%ebp), %eax
  284d6c: 8b 40 04                     	movl	4(%eax), %eax
  284d6f: 83 e8 08                     	subl	$8, %eax
  284d72: 83 e0 1f                     	andl	$31, %eax
  284d75: 85 c0                        	testl	%eax, %eax
  284d77: 0f 84 86 00 00 00            	je	134 <cons_putchar+0x116>
  284d7d: eb 8d                        	jmp	-115 <cons_putchar+0x1f>
  284d7f: 0f b6 45 f6                  	movzbl	-10(%ebp), %eax
  284d83: 3c 0a                        	cmpb	$10, %al
  284d85: 75 10                        	jne	16 <cons_putchar+0xaa>
  284d87: 83 ec 0c                     	subl	$12, %esp
  284d8a: ff 75 08                     	pushl	8(%ebp)
  284d8d: e8 79 00 00 00               	calll	121 <cons_newline>
  284d92: 83 c4 10                     	addl	$16, %esp
  284d95: eb 6e                        	jmp	110 <cons_putchar+0x118>
  284d97: 0f b6 45 f6                  	movzbl	-10(%ebp), %eax
  284d9b: 3c 0d                        	cmpb	$13, %al
  284d9d: 74 66                        	je	102 <cons_putchar+0x118>
  284d9f: 8b 45 08                     	movl	8(%ebp), %eax
  284da2: 8b 00                        	movl	(%eax), %eax
  284da4: 85 c0                        	testl	%eax, %eax
  284da6: 74 29                        	je	41 <cons_putchar+0xe4>
  284da8: 8b 45 08                     	movl	8(%ebp), %eax
  284dab: 8b 48 08                     	movl	8(%eax), %ecx
  284dae: 8b 45 08                     	movl	8(%ebp), %eax
  284db1: 8b 50 04                     	movl	4(%eax), %edx
  284db4: 8b 45 08                     	movl	8(%ebp), %eax
  284db7: 8b 00                        	movl	(%eax), %eax
  284db9: 83 ec 04                     	subl	$4, %esp
  284dbc: 6a 01                        	pushl	$1
  284dbe: 8d 5d f6                     	leal	-10(%ebp), %ebx
  284dc1: 53                           	pushl	%ebx
  284dc2: 6a 00                        	pushl	$0
  284dc4: 6a 07                        	pushl	$7
  284dc6: 51                           	pushl	%ecx
  284dc7: 52                           	pushl	%edx
  284dc8: 50                           	pushl	%eax
  284dc9: e8 09 f7 ff ff               	calll	-2295 <putfonts8_asc_sht>
  284dce: 83 c4 20                     	addl	$32, %esp
  284dd1: 80 7d e4 00                  	cmpb	$0, -28(%ebp)
  284dd5: 74 2e                        	je	46 <cons_putchar+0x118>
  284dd7: 8b 45 08                     	movl	8(%ebp), %eax
  284dda: 8b 40 04                     	movl	4(%eax), %eax
  284ddd: 8d 50 08                     	leal	8(%eax), %edx
  284de0: 8b 45 08                     	movl	8(%ebp), %eax
  284de3: 89 50 04                     	movl	%edx, 4(%eax)
  284de6: 8b 45 08                     	movl	8(%ebp), %eax
  284de9: 8b 40 04                     	movl	4(%eax), %eax
  284dec: 3d f8 00 00 00               	cmpl	$248, %eax
  284df1: 75 12                        	jne	18 <cons_putchar+0x118>
  284df3: 83 ec 0c                     	subl	$12, %esp
  284df6: ff 75 08                     	pushl	8(%ebp)
  284df9: e8 0d 00 00 00               	calll	13 <cons_newline>
  284dfe: 83 c4 10                     	addl	$16, %esp
  284e01: eb 01                        	jmp	1 <cons_putchar+0x117>
  284e03: 90                           	nop
  284e04: 90                           	nop
  284e05: 90                           	nop
  284e06: 8b 5d fc                     	movl	-4(%ebp), %ebx
  284e09: c9                           	leave
  284e0a: c3                           	retl

00284e0b cons_newline:
  284e0b: 55                           	pushl	%ebp
  284e0c: 89 e5                        	movl	%esp, %ebp
  284e0e: 53                           	pushl	%ebx
  284e0f: 83 ec 14                     	subl	$20, %esp
  284e12: 8b 45 08                     	movl	8(%ebp), %eax
  284e15: 8b 00                        	movl	(%eax), %eax
  284e17: 89 45 ec                     	movl	%eax, -20(%ebp)
  284e1a: e8 a1 ed ff ff               	calll	-4703 <task_now>
  284e1f: 89 45 e8                     	movl	%eax, -24(%ebp)
  284e22: 8b 45 08                     	movl	8(%ebp), %eax
  284e25: 8b 40 08                     	movl	8(%eax), %eax
  284e28: 3d 8b 00 00 00               	cmpl	$139, %eax
  284e2d: 7f 14                        	jg	20 <cons_newline+0x38>
  284e2f: 8b 45 08                     	movl	8(%ebp), %eax
  284e32: 8b 40 08                     	movl	8(%eax), %eax
  284e35: 8d 50 10                     	leal	16(%eax), %edx
  284e38: 8b 45 08                     	movl	8(%ebp), %eax
  284e3b: 89 50 08                     	movl	%edx, 8(%eax)
  284e3e: e9 d2 00 00 00               	jmp	210 <cons_newline+0x10a>
  284e43: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
  284e47: 0f 84 c8 00 00 00            	je	200 <cons_newline+0x10a>
  284e4d: c7 45 f0 1c 00 00 00         	movl	$28, -16(%ebp)
  284e54: eb 53                        	jmp	83 <cons_newline+0x9e>
  284e56: c7 45 f4 08 00 00 00         	movl	$8, -12(%ebp)
  284e5d: eb 3d                        	jmp	61 <cons_newline+0x91>
  284e5f: 8b 45 ec                     	movl	-20(%ebp), %eax
  284e62: 8b 10                        	movl	(%eax), %edx
  284e64: 8b 45 f0                     	movl	-16(%ebp), %eax
  284e67: 8d 48 10                     	leal	16(%eax), %ecx
  284e6a: 8b 45 ec                     	movl	-20(%ebp), %eax
  284e6d: 8b 40 04                     	movl	4(%eax), %eax
  284e70: 0f af c8                     	imull	%eax, %ecx
  284e73: 8b 45 f4                     	movl	-12(%ebp), %eax
  284e76: 01 c8                        	addl	%ecx, %eax
  284e78: 8d 0c 02                     	leal	(%edx,%eax), %ecx
  284e7b: 8b 45 ec                     	movl	-20(%ebp), %eax
  284e7e: 8b 10                        	movl	(%eax), %edx
  284e80: 8b 45 ec                     	movl	-20(%ebp), %eax
  284e83: 8b 40 04                     	movl	4(%eax), %eax
  284e86: 0f af 45 f0                  	imull	-16(%ebp), %eax
  284e8a: 89 c3                        	movl	%eax, %ebx
  284e8c: 8b 45 f4                     	movl	-12(%ebp), %eax
  284e8f: 01 d8                        	addl	%ebx, %eax
  284e91: 01 c2                        	addl	%eax, %edx
  284e93: 0f b6 01                     	movzbl	(%ecx), %eax
  284e96: 88 02                        	movb	%al, (%edx)
  284e98: 83 45 f4 01                  	addl	$1, -12(%ebp)
  284e9c: 81 7d f4 f7 00 00 00         	cmpl	$247, -12(%ebp)
  284ea3: 7e ba                        	jle	-70 <cons_newline+0x54>
  284ea5: 83 45 f0 01                  	addl	$1, -16(%ebp)
  284ea9: 81 7d f0 8b 00 00 00         	cmpl	$139, -16(%ebp)
  284eb0: 7e a4                        	jle	-92 <cons_newline+0x4b>
  284eb2: c7 45 f0 8c 00 00 00         	movl	$140, -16(%ebp)
  284eb9: eb 35                        	jmp	53 <cons_newline+0xe5>
  284ebb: c7 45 f4 08 00 00 00         	movl	$8, -12(%ebp)
  284ec2: eb 1f                        	jmp	31 <cons_newline+0xd8>
  284ec4: 8b 45 ec                     	movl	-20(%ebp), %eax
  284ec7: 8b 10                        	movl	(%eax), %edx
  284ec9: 8b 45 ec                     	movl	-20(%ebp), %eax
  284ecc: 8b 40 04                     	movl	4(%eax), %eax
  284ecf: 0f af 45 f0                  	imull	-16(%ebp), %eax
  284ed3: 89 c1                        	movl	%eax, %ecx
  284ed5: 8b 45 f4                     	movl	-12(%ebp), %eax
  284ed8: 01 c8                        	addl	%ecx, %eax
  284eda: 01 d0                        	addl	%edx, %eax
  284edc: c6 00 00                     	movb	$0, (%eax)
  284edf: 83 45 f4 01                  	addl	$1, -12(%ebp)
  284ee3: 81 7d f4 f7 00 00 00         	cmpl	$247, -12(%ebp)
  284eea: 7e d8                        	jle	-40 <cons_newline+0xb9>
  284eec: 83 45 f0 01                  	addl	$1, -16(%ebp)
  284ef0: 81 7d f0 9b 00 00 00         	cmpl	$155, -16(%ebp)
  284ef7: 7e c2                        	jle	-62 <cons_newline+0xb0>
  284ef9: 83 ec 0c                     	subl	$12, %esp
  284efc: 68 9c 00 00 00               	pushl	$156
  284f01: 68 f8 00 00 00               	pushl	$248
  284f06: 6a 1c                        	pushl	$28
  284f08: 6a 08                        	pushl	$8
  284f0a: ff 75 ec                     	pushl	-20(%ebp)
  284f0d: e8 39 e7 ff ff               	calll	-6343 <sheet_refresh>
  284f12: 83 c4 20                     	addl	$32, %esp
  284f15: 8b 45 08                     	movl	8(%ebp), %eax
  284f18: c7 40 04 08 00 00 00         	movl	$8, 4(%eax)
  284f1f: 8b 45 e8                     	movl	-24(%ebp), %eax
  284f22: 0f b6 80 bc 00 00 00         	movzbl	188(%eax), %eax
  284f29: 3c 01                        	cmpb	$1, %al
  284f2b: 75 19                        	jne	25 <cons_newline+0x13b>
  284f2d: 8b 45 e8                     	movl	-24(%ebp), %eax
  284f30: 0f b6 80 bd 00 00 00         	movzbl	189(%eax), %eax
  284f37: 84 c0                        	testb	%al, %al
  284f39: 74 0b                        	je	11 <cons_newline+0x13b>
  284f3b: 8b 45 08                     	movl	8(%ebp), %eax
  284f3e: c7 40 04 10 00 00 00         	movl	$16, 4(%eax)
  284f45: 90                           	nop
  284f46: 90                           	nop
  284f47: 8b 5d fc                     	movl	-4(%ebp), %ebx
  284f4a: c9                           	leave
  284f4b: c3                           	retl

00284f4c cons_putstr0:
  284f4c: 55                           	pushl	%ebp
  284f4d: 89 e5                        	movl	%esp, %ebp
  284f4f: 83 ec 08                     	subl	$8, %esp
  284f52: eb 1e                        	jmp	30 <cons_putstr0+0x26>
  284f54: 8b 45 0c                     	movl	12(%ebp), %eax
  284f57: 0f b6 00                     	movzbl	(%eax), %eax
  284f5a: 0f be c0                     	movsbl	%al, %eax
  284f5d: 83 ec 04                     	subl	$4, %esp
  284f60: 6a 01                        	pushl	$1
  284f62: 50                           	pushl	%eax
  284f63: ff 75 08                     	pushl	8(%ebp)
  284f66: e8 82 fd ff ff               	calll	-638 <cons_putchar>
  284f6b: 83 c4 10                     	addl	$16, %esp
  284f6e: 83 45 0c 01                  	addl	$1, 12(%ebp)
  284f72: 8b 45 0c                     	movl	12(%ebp), %eax
  284f75: 0f b6 00                     	movzbl	(%eax), %eax
  284f78: 84 c0                        	testb	%al, %al
  284f7a: 75 d8                        	jne	-40 <cons_putstr0+0x8>
  284f7c: 90                           	nop
  284f7d: c9                           	leave
  284f7e: c3                           	retl

00284f7f cons_putstr1:
  284f7f: 55                           	pushl	%ebp
  284f80: 89 e5                        	movl	%esp, %ebp
  284f82: 83 ec 18                     	subl	$24, %esp
  284f85: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  284f8c: eb 23                        	jmp	35 <cons_putstr1+0x32>
  284f8e: 8b 55 f4                     	movl	-12(%ebp), %edx
  284f91: 8b 45 0c                     	movl	12(%ebp), %eax
  284f94: 01 d0                        	addl	%edx, %eax
  284f96: 0f b6 00                     	movzbl	(%eax), %eax
  284f99: 0f be c0                     	movsbl	%al, %eax
  284f9c: 83 ec 04                     	subl	$4, %esp
  284f9f: 6a 01                        	pushl	$1
  284fa1: 50                           	pushl	%eax
  284fa2: ff 75 08                     	pushl	8(%ebp)
  284fa5: e8 43 fd ff ff               	calll	-701 <cons_putchar>
  284faa: 83 c4 10                     	addl	$16, %esp
  284fad: 83 45 f4 01                  	addl	$1, -12(%ebp)
  284fb1: 8b 45 f4                     	movl	-12(%ebp), %eax
  284fb4: 3b 45 10                     	cmpl	16(%ebp), %eax
  284fb7: 7c d5                        	jl	-43 <cons_putstr1+0xf>
  284fb9: 90                           	nop
  284fba: c9                           	leave
  284fbb: c3                           	retl

00284fbc cons_runcmd:
  284fbc: 55                           	pushl	%ebp
  284fbd: 89 e5                        	movl	%esp, %ebp
  284fbf: 83 ec 08                     	subl	$8, %esp
  284fc2: 83 ec 08                     	subl	$8, %esp
  284fc5: 68 62 13 31 00               	pushl	$3216226
  284fca: ff 75 08                     	pushl	8(%ebp)
  284fcd: e8 d5 35 00 00               	calll	13781 <strcmp>
  284fd2: 83 c4 10                     	addl	$16, %esp
  284fd5: 85 c0                        	testl	%eax, %eax
  284fd7: 75 1f                        	jne	31 <cons_runcmd+0x3c>
  284fd9: 8b 45 0c                     	movl	12(%ebp), %eax
  284fdc: 8b 00                        	movl	(%eax), %eax
  284fde: 85 c0                        	testl	%eax, %eax
  284fe0: 74 16                        	je	22 <cons_runcmd+0x3c>
  284fe2: 83 ec 08                     	subl	$8, %esp
  284fe5: ff 75 14                     	pushl	20(%ebp)
  284fe8: ff 75 0c                     	pushl	12(%ebp)
  284feb: e8 61 01 00 00               	calll	353 <cmd_mem>
  284ff0: 83 c4 10                     	addl	$16, %esp
  284ff3: e9 55 01 00 00               	jmp	341 <cons_runcmd+0x191>
  284ff8: 83 ec 08                     	subl	$8, %esp
  284ffb: 68 66 13 31 00               	pushl	$3216230
  285000: ff 75 08                     	pushl	8(%ebp)
  285003: e8 9f 35 00 00               	calll	13727 <strcmp>
  285008: 83 c4 10                     	addl	$16, %esp
  28500b: 85 c0                        	testl	%eax, %eax
  28500d: 75 1c                        	jne	28 <cons_runcmd+0x6f>
  28500f: 8b 45 0c                     	movl	12(%ebp), %eax
  285012: 8b 00                        	movl	(%eax), %eax
  285014: 85 c0                        	testl	%eax, %eax
  285016: 74 13                        	je	19 <cons_runcmd+0x6f>
  285018: 83 ec 0c                     	subl	$12, %esp
  28501b: ff 75 0c                     	pushl	12(%ebp)
  28501e: e8 87 01 00 00               	calll	391 <cmd_cls>
  285023: 83 c4 10                     	addl	$16, %esp
  285026: e9 22 01 00 00               	jmp	290 <cons_runcmd+0x191>
  28502b: 83 ec 08                     	subl	$8, %esp
  28502e: 68 6a 13 31 00               	pushl	$3216234
  285033: ff 75 08                     	pushl	8(%ebp)
  285036: e8 6c 35 00 00               	calll	13676 <strcmp>
  28503b: 83 c4 10                     	addl	$16, %esp
  28503e: 85 c0                        	testl	%eax, %eax
  285040: 75 1c                        	jne	28 <cons_runcmd+0xa2>
  285042: 8b 45 0c                     	movl	12(%ebp), %eax
  285045: 8b 00                        	movl	(%eax), %eax
  285047: 85 c0                        	testl	%eax, %eax
  285049: 74 13                        	je	19 <cons_runcmd+0xa2>
  28504b: 83 ec 0c                     	subl	$12, %esp
  28504e: ff 75 0c                     	pushl	12(%ebp)
  285051: e8 d2 01 00 00               	calll	466 <cmd_dir>
  285056: 83 c4 10                     	addl	$16, %esp
  285059: e9 ef 00 00 00               	jmp	239 <cons_runcmd+0x191>
  28505e: 83 ec 08                     	subl	$8, %esp
  285061: 68 6e 13 31 00               	pushl	$3216238
  285066: ff 75 08                     	pushl	8(%ebp)
  285069: e8 39 35 00 00               	calll	13625 <strcmp>
  28506e: 83 c4 10                     	addl	$16, %esp
  285071: 85 c0                        	testl	%eax, %eax
  285073: 75 16                        	jne	22 <cons_runcmd+0xcf>
  285075: 83 ec 08                     	subl	$8, %esp
  285078: ff 75 10                     	pushl	16(%ebp)
  28507b: ff 75 0c                     	pushl	12(%ebp)
  28507e: e8 d9 02 00 00               	calll	729 <cmd_exit>
  285083: 83 c4 10                     	addl	$16, %esp
  285086: e9 c3 00 00 00               	jmp	195 <cons_runcmd+0x192>
  28508b: 83 ec 04                     	subl	$4, %esp
  28508e: 6a 06                        	pushl	$6
  285090: 68 73 13 31 00               	pushl	$3216243
  285095: ff 75 08                     	pushl	8(%ebp)
  285098: e8 61 35 00 00               	calll	13665 <strncmp>
  28509d: 83 c4 10                     	addl	$16, %esp
  2850a0: 85 c0                        	testl	%eax, %eax
  2850a2: 75 19                        	jne	25 <cons_runcmd+0x101>
  2850a4: 83 ec 04                     	subl	$4, %esp
  2850a7: ff 75 14                     	pushl	20(%ebp)
  2850aa: ff 75 08                     	pushl	8(%ebp)
  2850ad: ff 75 0c                     	pushl	12(%ebp)
  2850b0: e8 85 03 00 00               	calll	901 <cmd_start>
  2850b5: 83 c4 10                     	addl	$16, %esp
  2850b8: e9 91 00 00 00               	jmp	145 <cons_runcmd+0x192>
  2850bd: 83 ec 04                     	subl	$4, %esp
  2850c0: 6a 05                        	pushl	$5
  2850c2: 68 7a 13 31 00               	pushl	$3216250
  2850c7: ff 75 08                     	pushl	8(%ebp)
  2850ca: e8 2f 35 00 00               	calll	13615 <strncmp>
  2850cf: 83 c4 10                     	addl	$16, %esp
  2850d2: 85 c0                        	testl	%eax, %eax
  2850d4: 75 16                        	jne	22 <cons_runcmd+0x130>
  2850d6: 83 ec 04                     	subl	$4, %esp
  2850d9: ff 75 14                     	pushl	20(%ebp)
  2850dc: ff 75 08                     	pushl	8(%ebp)
  2850df: ff 75 0c                     	pushl	12(%ebp)
  2850e2: e8 0d 04 00 00               	calll	1037 <cmd_ncst>
  2850e7: 83 c4 10                     	addl	$16, %esp
  2850ea: eb 62                        	jmp	98 <cons_runcmd+0x192>
  2850ec: 83 ec 04                     	subl	$4, %esp
  2850ef: 6a 09                        	pushl	$9
  2850f1: 68 80 13 31 00               	pushl	$3216256
  2850f6: ff 75 08                     	pushl	8(%ebp)
  2850f9: e8 00 35 00 00               	calll	13568 <strncmp>
  2850fe: 83 c4 10                     	addl	$16, %esp
  285101: 85 c0                        	testl	%eax, %eax
  285103: 75 13                        	jne	19 <cons_runcmd+0x15c>
  285105: 83 ec 08                     	subl	$8, %esp
  285108: ff 75 08                     	pushl	8(%ebp)
  28510b: ff 75 0c                     	pushl	12(%ebp)
  28510e: e8 66 04 00 00               	calll	1126 <cmd_langmode>
  285113: 83 c4 10                     	addl	$16, %esp
  285116: eb 36                        	jmp	54 <cons_runcmd+0x192>
  285118: 8b 45 08                     	movl	8(%ebp), %eax
  28511b: 0f b6 00                     	movzbl	(%eax), %eax
  28511e: 84 c0                        	testb	%al, %al
  285120: 74 2c                        	je	44 <cons_runcmd+0x192>
  285122: 83 ec 04                     	subl	$4, %esp
  285125: ff 75 08                     	pushl	8(%ebp)
  285128: ff 75 10                     	pushl	16(%ebp)
  28512b: ff 75 0c                     	pushl	12(%ebp)
  28512e: e8 9c 04 00 00               	calll	1180 <cmd_app>
  285133: 83 c4 10                     	addl	$16, %esp
  285136: 85 c0                        	testl	%eax, %eax
  285138: 75 14                        	jne	20 <cons_runcmd+0x192>
  28513a: 83 ec 08                     	subl	$8, %esp
  28513d: 68 8a 13 31 00               	pushl	$3216266
  285142: ff 75 0c                     	pushl	12(%ebp)
  285145: e8 02 fe ff ff               	calll	-510 <cons_putstr0>
  28514a: 83 c4 10                     	addl	$16, %esp
  28514d: 90                           	nop
  28514e: 90                           	nop
  28514f: c9                           	leave
  285150: c3                           	retl

00285151 cmd_mem:
  285151: 55                           	pushl	%ebp
  285152: 89 e5                        	movl	%esp, %ebp
  285154: 83 ec 48                     	subl	$72, %esp
  285157: c7 45 f4 00 00 3c 00         	movl	$3932160, -12(%ebp)
  28515e: 83 ec 0c                     	subl	$12, %esp
  285161: ff 75 f4                     	pushl	-12(%ebp)
  285164: e8 7d d3 ff ff               	calll	-11395 <memman_total>
  285169: 83 c4 10                     	addl	$16, %esp
  28516c: c1 e8 0a                     	shrl	$10, %eax
  28516f: 89 c2                        	movl	%eax, %edx
  285171: 8b 45 0c                     	movl	12(%ebp), %eax
  285174: 8d 88 ff ff 0f 00            	leal	1048575(%eax), %ecx
  28517a: 85 c0                        	testl	%eax, %eax
  28517c: 0f 48 c1                     	cmovsl	%ecx, %eax
  28517f: c1 f8 14                     	sarl	$20, %eax
  285182: 52                           	pushl	%edx
  285183: 50                           	pushl	%eax
  285184: 68 99 13 31 00               	pushl	$3216281
  285189: 8d 45 b8                     	leal	-72(%ebp), %eax
  28518c: 50                           	pushl	%eax
  28518d: e8 ec 33 00 00               	calll	13292 <sprintf>
  285192: 83 c4 10                     	addl	$16, %esp
  285195: 83 ec 08                     	subl	$8, %esp
  285198: 8d 45 b8                     	leal	-72(%ebp), %eax
  28519b: 50                           	pushl	%eax
  28519c: ff 75 08                     	pushl	8(%ebp)
  28519f: e8 a8 fd ff ff               	calll	-600 <cons_putstr0>
  2851a4: 83 c4 10                     	addl	$16, %esp
  2851a7: 90                           	nop
  2851a8: c9                           	leave
  2851a9: c3                           	retl

002851aa cmd_cls:
  2851aa: 55                           	pushl	%ebp
  2851ab: 89 e5                        	movl	%esp, %ebp
  2851ad: 83 ec 18                     	subl	$24, %esp
  2851b0: 8b 45 08                     	movl	8(%ebp), %eax
  2851b3: 8b 00                        	movl	(%eax), %eax
  2851b5: 89 45 ec                     	movl	%eax, -20(%ebp)
  2851b8: c7 45 f0 1c 00 00 00         	movl	$28, -16(%ebp)
  2851bf: eb 35                        	jmp	53 <cmd_cls+0x4c>
  2851c1: c7 45 f4 08 00 00 00         	movl	$8, -12(%ebp)
  2851c8: eb 1f                        	jmp	31 <cmd_cls+0x3f>
  2851ca: 8b 45 ec                     	movl	-20(%ebp), %eax
  2851cd: 8b 10                        	movl	(%eax), %edx
  2851cf: 8b 45 ec                     	movl	-20(%ebp), %eax
  2851d2: 8b 40 04                     	movl	4(%eax), %eax
  2851d5: 0f af 45 f0                  	imull	-16(%ebp), %eax
  2851d9: 89 c1                        	movl	%eax, %ecx
  2851db: 8b 45 f4                     	movl	-12(%ebp), %eax
  2851de: 01 c8                        	addl	%ecx, %eax
  2851e0: 01 d0                        	addl	%edx, %eax
  2851e2: c6 00 00                     	movb	$0, (%eax)
  2851e5: 83 45 f4 01                  	addl	$1, -12(%ebp)
  2851e9: 81 7d f4 f7 00 00 00         	cmpl	$247, -12(%ebp)
  2851f0: 7e d8                        	jle	-40 <cmd_cls+0x20>
  2851f2: 83 45 f0 01                  	addl	$1, -16(%ebp)
  2851f6: 81 7d f0 9b 00 00 00         	cmpl	$155, -16(%ebp)
  2851fd: 7e c2                        	jle	-62 <cmd_cls+0x17>
  2851ff: 83 ec 0c                     	subl	$12, %esp
  285202: 68 9c 00 00 00               	pushl	$156
  285207: 68 f8 00 00 00               	pushl	$248
  28520c: 6a 1c                        	pushl	$28
  28520e: 6a 08                        	pushl	$8
  285210: ff 75 ec                     	pushl	-20(%ebp)
  285213: e8 33 e4 ff ff               	calll	-7117 <sheet_refresh>
  285218: 83 c4 20                     	addl	$32, %esp
  28521b: 8b 45 08                     	movl	8(%ebp), %eax
  28521e: c7 40 08 1c 00 00 00         	movl	$28, 8(%eax)
  285225: 90                           	nop
  285226: c9                           	leave
  285227: c3                           	retl

00285228 cmd_dir:
  285228: 55                           	pushl	%ebp
  285229: 89 e5                        	movl	%esp, %ebp
  28522b: 83 ec 38                     	subl	$56, %esp
  28522e: c7 45 ec 00 26 10 00         	movl	$1058304, -20(%ebp)
  285235: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  28523c: e9 fa 00 00 00               	jmp	250 <cmd_dir+0x113>
  285241: 8b 45 f4                     	movl	-12(%ebp), %eax
  285244: c1 e0 05                     	shll	$5, %eax
  285247: 89 c2                        	movl	%eax, %edx
  285249: 8b 45 ec                     	movl	-20(%ebp), %eax
  28524c: 01 d0                        	addl	%edx, %eax
  28524e: 0f b6 00                     	movzbl	(%eax), %eax
  285251: 84 c0                        	testb	%al, %al
  285253: 0f 84 f1 00 00 00            	je	241 <cmd_dir+0x122>
  285259: 8b 45 f4                     	movl	-12(%ebp), %eax
  28525c: c1 e0 05                     	shll	$5, %eax
  28525f: 89 c2                        	movl	%eax, %edx
  285261: 8b 45 ec                     	movl	-20(%ebp), %eax
  285264: 01 d0                        	addl	%edx, %eax
  285266: 0f b6 00                     	movzbl	(%eax), %eax
  285269: 3c e5                        	cmpb	$-27, %al
  28526b: 0f 84 c6 00 00 00            	je	198 <cmd_dir+0x10f>
  285271: 8b 45 f4                     	movl	-12(%ebp), %eax
  285274: c1 e0 05                     	shll	$5, %eax
  285277: 89 c2                        	movl	%eax, %edx
  285279: 8b 45 ec                     	movl	-20(%ebp), %eax
  28527c: 01 d0                        	addl	%edx, %eax
  28527e: 0f b6 40 0b                  	movzbl	11(%eax), %eax
  285282: 0f b6 c0                     	movzbl	%al, %eax
  285285: 83 e0 18                     	andl	$24, %eax
  285288: 85 c0                        	testl	%eax, %eax
  28528a: 0f 85 a7 00 00 00            	jne	167 <cmd_dir+0x10f>
  285290: 8b 45 f4                     	movl	-12(%ebp), %eax
  285293: c1 e0 05                     	shll	$5, %eax
  285296: 89 c2                        	movl	%eax, %edx
  285298: 8b 45 ec                     	movl	-20(%ebp), %eax
  28529b: 01 d0                        	addl	%edx, %eax
  28529d: 8b 40 1c                     	movl	28(%eax), %eax
  2852a0: 83 ec 04                     	subl	$4, %esp
  2852a3: 50                           	pushl	%eax
  2852a4: 68 b2 13 31 00               	pushl	$3216306
  2852a9: 8d 45 ce                     	leal	-50(%ebp), %eax
  2852ac: 50                           	pushl	%eax
  2852ad: e8 cc 32 00 00               	calll	13004 <sprintf>
  2852b2: 83 c4 10                     	addl	$16, %esp
  2852b5: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
  2852bc: eb 25                        	jmp	37 <cmd_dir+0xbb>
  2852be: 8b 45 f4                     	movl	-12(%ebp), %eax
  2852c1: c1 e0 05                     	shll	$5, %eax
  2852c4: 89 c2                        	movl	%eax, %edx
  2852c6: 8b 45 ec                     	movl	-20(%ebp), %eax
  2852c9: 01 c2                        	addl	%eax, %edx
  2852cb: 8b 45 f0                     	movl	-16(%ebp), %eax
  2852ce: 01 d0                        	addl	%edx, %eax
  2852d0: 0f b6 00                     	movzbl	(%eax), %eax
  2852d3: 89 c1                        	movl	%eax, %ecx
  2852d5: 8d 55 ce                     	leal	-50(%ebp), %edx
  2852d8: 8b 45 f0                     	movl	-16(%ebp), %eax
  2852db: 01 d0                        	addl	%edx, %eax
  2852dd: 88 08                        	movb	%cl, (%eax)
  2852df: 83 45 f0 01                  	addl	$1, -16(%ebp)
  2852e3: 83 7d f0 07                  	cmpl	$7, -16(%ebp)
  2852e7: 7e d5                        	jle	-43 <cmd_dir+0x96>
  2852e9: 8b 45 f4                     	movl	-12(%ebp), %eax
  2852ec: c1 e0 05                     	shll	$5, %eax
  2852ef: 89 c2                        	movl	%eax, %edx
  2852f1: 8b 45 ec                     	movl	-20(%ebp), %eax
  2852f4: 01 d0                        	addl	%edx, %eax
  2852f6: 0f b6 40 08                  	movzbl	8(%eax), %eax
  2852fa: 88 45 d7                     	movb	%al, -41(%ebp)
  2852fd: 8b 45 f4                     	movl	-12(%ebp), %eax
  285300: c1 e0 05                     	shll	$5, %eax
  285303: 89 c2                        	movl	%eax, %edx
  285305: 8b 45 ec                     	movl	-20(%ebp), %eax
  285308: 01 d0                        	addl	%edx, %eax
  28530a: 0f b6 40 09                  	movzbl	9(%eax), %eax
  28530e: 88 45 d8                     	movb	%al, -40(%ebp)
  285311: 8b 45 f4                     	movl	-12(%ebp), %eax
  285314: c1 e0 05                     	shll	$5, %eax
  285317: 89 c2                        	movl	%eax, %edx
  285319: 8b 45 ec                     	movl	-20(%ebp), %eax
  28531c: 01 d0                        	addl	%edx, %eax
  28531e: 0f b6 40 0a                  	movzbl	10(%eax), %eax
  285322: 88 45 d9                     	movb	%al, -39(%ebp)
  285325: 83 ec 08                     	subl	$8, %esp
  285328: 8d 45 ce                     	leal	-50(%ebp), %eax
  28532b: 50                           	pushl	%eax
  28532c: ff 75 08                     	pushl	8(%ebp)
  28532f: e8 18 fc ff ff               	calll	-1000 <cons_putstr0>
  285334: 83 c4 10                     	addl	$16, %esp
  285337: 83 45 f4 01                  	addl	$1, -12(%ebp)
  28533b: 81 7d f4 df 00 00 00         	cmpl	$223, -12(%ebp)
  285342: 0f 8e f9 fe ff ff            	jle	-263 <cmd_dir+0x19>
  285348: eb 01                        	jmp	1 <cmd_dir+0x123>
  28534a: 90                           	nop
  28534b: 83 ec 0c                     	subl	$12, %esp
  28534e: ff 75 08                     	pushl	8(%ebp)
  285351: e8 b5 fa ff ff               	calll	-1355 <cons_newline>
  285356: 83 c4 10                     	addl	$16, %esp
  285359: 90                           	nop
  28535a: c9                           	leave
  28535b: c3                           	retl

0028535c cmd_exit:
  28535c: 55                           	pushl	%ebp
  28535d: 89 e5                        	movl	%esp, %ebp
  28535f: 83 ec 18                     	subl	$24, %esp
  285362: c7 45 f4 00 00 3c 00         	movl	$3932160, -12(%ebp)
  285369: e8 52 e8 ff ff               	calll	-6062 <task_now>
  28536e: 89 45 f0                     	movl	%eax, -16(%ebp)
  285371: b8 e4 0f 00 00               	movl	$4068, %eax
  285376: 8b 00                        	movl	(%eax), %eax
  285378: 89 45 ec                     	movl	%eax, -20(%ebp)
  28537b: b8 ec 0f 00 00               	movl	$4076, %eax
  285380: 8b 00                        	movl	(%eax), %eax
  285382: 89 45 e8                     	movl	%eax, -24(%ebp)
  285385: 8b 45 08                     	movl	8(%ebp), %eax
  285388: 8b 00                        	movl	(%eax), %eax
  28538a: 85 c0                        	testl	%eax, %eax
  28538c: 74 12                        	je	18 <cmd_exit+0x44>
  28538e: 8b 45 08                     	movl	8(%ebp), %eax
  285391: 8b 40 10                     	movl	16(%eax), %eax
  285394: 83 ec 0c                     	subl	$12, %esp
  285397: 50                           	pushl	%eax
  285398: e8 f7 e6 ff ff               	calll	-6409 <timer_cancel>
  28539d: 83 c4 10                     	addl	$16, %esp
  2853a0: 8b 45 0c                     	movl	12(%ebp), %eax
  2853a3: 83 ec 04                     	subl	$4, %esp
  2853a6: 68 00 2d 00 00               	pushl	$11520
  2853ab: 50                           	pushl	%eax
  2853ac: ff 75 f4                     	pushl	-12(%ebp)
  2853af: e8 d0 d4 ff ff               	calll	-11056 <memman_free_4k>
  2853b4: 83 c4 10                     	addl	$16, %esp
  2853b7: e8 66 bd ff ff               	calll	-17050 <io_cli>
  2853bc: 8b 45 08                     	movl	8(%ebp), %eax
  2853bf: 8b 00                        	movl	(%eax), %eax
  2853c1: 85 c0                        	testl	%eax, %eax
  2853c3: 74 32                        	je	50 <cmd_exit+0x9b>
  2853c5: 8b 45 08                     	movl	8(%ebp), %eax
  2853c8: 8b 00                        	movl	(%eax), %eax
  2853ca: 89 c2                        	movl	%eax, %edx
  2853cc: 8b 45 ec                     	movl	-20(%ebp), %eax
  2853cf: 05 14 04 00 00               	addl	$1044, %eax
  2853d4: 29 c2                        	subl	%eax, %edx
  2853d6: 89 d0                        	movl	%edx, %eax
  2853d8: c1 f8 03                     	sarl	$3, %eax
  2853db: 69 c0 cd cc cc cc            	imull	$3435973837, %eax, %eax
  2853e1: 05 00 03 00 00               	addl	$768, %eax
  2853e6: 83 ec 08                     	subl	$8, %esp
  2853e9: 50                           	pushl	%eax
  2853ea: ff 75 e8                     	pushl	-24(%ebp)
  2853ed: e8 55 cc ff ff               	calll	-13227 <fifo32_put>
  2853f2: 83 c4 10                     	addl	$16, %esp
  2853f5: eb 2e                        	jmp	46 <cmd_exit+0xc9>
  2853f7: 8b 45 f0                     	movl	-16(%ebp), %eax
  2853fa: 8b 15 7c 48 32 00            	movl	3295356, %edx
  285400: 81 c2 f8 0f 00 00            	addl	$4088, %edx
  285406: 29 d0                        	subl	%edx, %eax
  285408: c1 f8 06                     	sarl	$6, %eax
  28540b: 69 c0 ab aa aa aa            	imull	$2863311531, %eax, %eax
  285411: 05 00 04 00 00               	addl	$1024, %eax
  285416: 83 ec 08                     	subl	$8, %esp
  285419: 50                           	pushl	%eax
  28541a: ff 75 e8                     	pushl	-24(%ebp)
  28541d: e8 25 cc ff ff               	calll	-13275 <fifo32_put>
  285422: 83 c4 10                     	addl	$16, %esp
  285425: e8 fa bc ff ff               	calll	-17158 <io_sti>
  28542a: 83 ec 0c                     	subl	$12, %esp
  28542d: ff 75 f0                     	pushl	-16(%ebp)
  285430: e8 19 ed ff ff               	calll	-4839 <task_sleep>
  285435: 83 c4 10                     	addl	$16, %esp
  285438: eb f0                        	jmp	-16 <cmd_exit+0xce>

0028543a cmd_start:
  28543a: 55                           	pushl	%ebp
  28543b: 89 e5                        	movl	%esp, %ebp
  28543d: 83 ec 18                     	subl	$24, %esp
  285440: b8 e4 0f 00 00               	movl	$4068, %eax
  285445: 8b 00                        	movl	(%eax), %eax
  285447: 89 45 f0                     	movl	%eax, -16(%ebp)
  28544a: 8b 45 10                     	movl	16(%ebp), %eax
  28544d: 83 ec 08                     	subl	$8, %esp
  285450: 50                           	pushl	%eax
  285451: ff 75 f0                     	pushl	-16(%ebp)
  285454: e8 50 bb ff ff               	calll	-17584 <open_console>
  285459: 83 c4 10                     	addl	$16, %esp
  28545c: 89 45 ec                     	movl	%eax, -20(%ebp)
  28545f: 8b 45 ec                     	movl	-20(%ebp), %eax
  285462: 8b 40 24                     	movl	36(%eax), %eax
  285465: 83 c0 10                     	addl	$16, %eax
  285468: 89 45 e8                     	movl	%eax, -24(%ebp)
  28546b: 83 ec 04                     	subl	$4, %esp
  28546e: 6a 04                        	pushl	$4
  285470: 6a 20                        	pushl	$32
  285472: ff 75 ec                     	pushl	-20(%ebp)
  285475: e8 42 e2 ff ff               	calll	-7614 <sheet_slide>
  28547a: 83 c4 10                     	addl	$16, %esp
  28547d: 8b 45 f0                     	movl	-16(%ebp), %eax
  285480: 8b 40 10                     	movl	16(%eax), %eax
  285483: 83 ec 08                     	subl	$8, %esp
  285486: 50                           	pushl	%eax
  285487: ff 75 ec                     	pushl	-20(%ebp)
  28548a: e8 45 de ff ff               	calll	-8635 <sheet_updown>
  28548f: 83 c4 10                     	addl	$16, %esp
  285492: c7 45 f4 06 00 00 00         	movl	$6, -12(%ebp)
  285499: eb 26                        	jmp	38 <cmd_start+0x87>
  28549b: 8b 55 f4                     	movl	-12(%ebp), %edx
  28549e: 8b 45 0c                     	movl	12(%ebp), %eax
  2854a1: 01 d0                        	addl	%edx, %eax
  2854a3: 0f b6 00                     	movzbl	(%eax), %eax
  2854a6: 0f be c0                     	movsbl	%al, %eax
  2854a9: 05 00 01 00 00               	addl	$256, %eax
  2854ae: 83 ec 08                     	subl	$8, %esp
  2854b1: 50                           	pushl	%eax
  2854b2: ff 75 e8                     	pushl	-24(%ebp)
  2854b5: e8 8d cb ff ff               	calll	-13427 <fifo32_put>
  2854ba: 83 c4 10                     	addl	$16, %esp
  2854bd: 83 45 f4 01                  	addl	$1, -12(%ebp)
  2854c1: 8b 55 f4                     	movl	-12(%ebp), %edx
  2854c4: 8b 45 0c                     	movl	12(%ebp), %eax
  2854c7: 01 d0                        	addl	%edx, %eax
  2854c9: 0f b6 00                     	movzbl	(%eax), %eax
  2854cc: 84 c0                        	testb	%al, %al
  2854ce: 75 cb                        	jne	-53 <cmd_start+0x61>
  2854d0: 83 ec 08                     	subl	$8, %esp
  2854d3: 68 0a 01 00 00               	pushl	$266
  2854d8: ff 75 e8                     	pushl	-24(%ebp)
  2854db: e8 67 cb ff ff               	calll	-13465 <fifo32_put>
  2854e0: 83 c4 10                     	addl	$16, %esp
  2854e3: 83 ec 0c                     	subl	$12, %esp
  2854e6: ff 75 08                     	pushl	8(%ebp)
  2854e9: e8 1d f9 ff ff               	calll	-1763 <cons_newline>
  2854ee: 83 c4 10                     	addl	$16, %esp
  2854f1: 90                           	nop
  2854f2: c9                           	leave
  2854f3: c3                           	retl

002854f4 cmd_ncst:
  2854f4: 55                           	pushl	%ebp
  2854f5: 89 e5                        	movl	%esp, %ebp
  2854f7: 83 ec 18                     	subl	$24, %esp
  2854fa: 8b 45 10                     	movl	16(%ebp), %eax
  2854fd: 83 ec 08                     	subl	$8, %esp
  285500: 50                           	pushl	%eax
  285501: 6a 00                        	pushl	$0
  285503: e8 a2 b9 ff ff               	calll	-18014 <open_constask>
  285508: 83 c4 10                     	addl	$16, %esp
  28550b: 89 45 f0                     	movl	%eax, -16(%ebp)
  28550e: 8b 45 f0                     	movl	-16(%ebp), %eax
  285511: 83 c0 10                     	addl	$16, %eax
  285514: 89 45 ec                     	movl	%eax, -20(%ebp)
  285517: c7 45 f4 05 00 00 00         	movl	$5, -12(%ebp)
  28551e: eb 26                        	jmp	38 <cmd_ncst+0x52>
  285520: 8b 55 f4                     	movl	-12(%ebp), %edx
  285523: 8b 45 0c                     	movl	12(%ebp), %eax
  285526: 01 d0                        	addl	%edx, %eax
  285528: 0f b6 00                     	movzbl	(%eax), %eax
  28552b: 0f be c0                     	movsbl	%al, %eax
  28552e: 05 00 01 00 00               	addl	$256, %eax
  285533: 83 ec 08                     	subl	$8, %esp
  285536: 50                           	pushl	%eax
  285537: ff 75 ec                     	pushl	-20(%ebp)
  28553a: e8 08 cb ff ff               	calll	-13560 <fifo32_put>
  28553f: 83 c4 10                     	addl	$16, %esp
  285542: 83 45 f4 01                  	addl	$1, -12(%ebp)
  285546: 8b 55 f4                     	movl	-12(%ebp), %edx
  285549: 8b 45 0c                     	movl	12(%ebp), %eax
  28554c: 01 d0                        	addl	%edx, %eax
  28554e: 0f b6 00                     	movzbl	(%eax), %eax
  285551: 84 c0                        	testb	%al, %al
  285553: 75 cb                        	jne	-53 <cmd_ncst+0x2c>
  285555: 83 ec 08                     	subl	$8, %esp
  285558: 68 0a 01 00 00               	pushl	$266
  28555d: ff 75 ec                     	pushl	-20(%ebp)
  285560: e8 e2 ca ff ff               	calll	-13598 <fifo32_put>
  285565: 83 c4 10                     	addl	$16, %esp
  285568: 83 ec 0c                     	subl	$12, %esp
  28556b: ff 75 08                     	pushl	8(%ebp)
  28556e: e8 98 f8 ff ff               	calll	-1896 <cons_newline>
  285573: 83 c4 10                     	addl	$16, %esp
  285576: 90                           	nop
  285577: c9                           	leave
  285578: c3                           	retl

00285579 cmd_langmode:
  285579: 55                           	pushl	%ebp
  28557a: 89 e5                        	movl	%esp, %ebp
  28557c: 83 ec 18                     	subl	$24, %esp
  28557f: e8 3c e6 ff ff               	calll	-6596 <task_now>
  285584: 89 45 f4                     	movl	%eax, -12(%ebp)
  285587: 8b 45 0c                     	movl	12(%ebp), %eax
  28558a: 83 c0 09                     	addl	$9, %eax
  28558d: 0f b6 00                     	movzbl	(%eax), %eax
  285590: 83 e8 30                     	subl	$48, %eax
  285593: 88 45 f3                     	movb	%al, -13(%ebp)
  285596: 80 7d f3 02                  	cmpb	$2, -13(%ebp)
  28559a: 77 0f                        	ja	15 <cmd_langmode+0x32>
  28559c: 8b 45 f4                     	movl	-12(%ebp), %eax
  28559f: 0f b6 55 f3                  	movzbl	-13(%ebp), %edx
  2855a3: 88 90 bc 00 00 00            	movb	%dl, 188(%eax)
  2855a9: eb 13                        	jmp	19 <cmd_langmode+0x45>
  2855ab: 83 ec 08                     	subl	$8, %esp
  2855ae: 68 c6 13 31 00               	pushl	$3216326
  2855b3: ff 75 08                     	pushl	8(%ebp)
  2855b6: e8 91 f9 ff ff               	calll	-1647 <cons_putstr0>
  2855bb: 83 c4 10                     	addl	$16, %esp
  2855be: 83 ec 0c                     	subl	$12, %esp
  2855c1: ff 75 08                     	pushl	8(%ebp)
  2855c4: e8 42 f8 ff ff               	calll	-1982 <cons_newline>
  2855c9: 83 c4 10                     	addl	$16, %esp
  2855cc: 90                           	nop
  2855cd: c9                           	leave
  2855ce: c3                           	retl

002855cf cmd_app:
  2855cf: 55                           	pushl	%ebp
  2855d0: 89 e5                        	movl	%esp, %ebp
  2855d2: 53                           	pushl	%ebx
  2855d3: 83 ec 54                     	subl	$84, %esp
  2855d6: c7 45 ec 00 00 3c 00         	movl	$3932160, -20(%ebp)
  2855dd: e8 de e5 ff ff               	calll	-6690 <task_now>
  2855e2: 89 45 e8                     	movl	%eax, -24(%ebp)
  2855e5: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
  2855ec: eb 28                        	jmp	40 <cmd_app+0x47>
  2855ee: 8b 55 f0                     	movl	-16(%ebp), %edx
  2855f1: 8b 45 10                     	movl	16(%ebp), %eax
  2855f4: 01 d0                        	addl	%edx, %eax
  2855f6: 0f b6 00                     	movzbl	(%eax), %eax
  2855f9: 3c 20                        	cmpb	$32, %al
  2855fb: 7e 21                        	jle	33 <cmd_app+0x4f>
  2855fd: 8b 55 f0                     	movl	-16(%ebp), %edx
  285600: 8b 45 10                     	movl	16(%ebp), %eax
  285603: 01 d0                        	addl	%edx, %eax
  285605: 0f b6 00                     	movzbl	(%eax), %eax
  285608: 8d 4d b6                     	leal	-74(%ebp), %ecx
  28560b: 8b 55 f0                     	movl	-16(%ebp), %edx
  28560e: 01 ca                        	addl	%ecx, %edx
  285610: 88 02                        	movb	%al, (%edx)
  285612: 83 45 f0 01                  	addl	$1, -16(%ebp)
  285616: 83 7d f0 0c                  	cmpl	$12, -16(%ebp)
  28561a: 7e d2                        	jle	-46 <cmd_app+0x1f>
  28561c: eb 01                        	jmp	1 <cmd_app+0x50>
  28561e: 90                           	nop
  28561f: 8d 55 b6                     	leal	-74(%ebp), %edx
  285622: 8b 45 f0                     	movl	-16(%ebp), %eax
  285625: 01 d0                        	addl	%edx, %eax
  285627: c6 00 00                     	movb	$0, (%eax)
  28562a: 83 ec 04                     	subl	$4, %esp
  28562d: 68 e0 00 00 00               	pushl	$224
  285632: 68 00 26 10 00               	pushl	$1058304
  285637: 8d 45 b6                     	leal	-74(%ebp), %eax
  28563a: 50                           	pushl	%eax
  28563b: e8 9e 10 00 00               	calll	4254 <file_search>
  285640: 83 c4 10                     	addl	$16, %esp
  285643: 89 45 f4                     	movl	%eax, -12(%ebp)
  285646: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
  28564a: 75 62                        	jne	98 <cmd_app+0xdf>
  28564c: 8b 45 f0                     	movl	-16(%ebp), %eax
  28564f: 83 e8 01                     	subl	$1, %eax
  285652: 0f b6 44 05 b6               	movzbl	-74(%ebp,%eax), %eax
  285657: 3c 2e                        	cmpb	$46, %al
  285659: 74 53                        	je	83 <cmd_app+0xdf>
  28565b: 8d 55 b6                     	leal	-74(%ebp), %edx
  28565e: 8b 45 f0                     	movl	-16(%ebp), %eax
  285661: 01 d0                        	addl	%edx, %eax
  285663: c6 00 2e                     	movb	$46, (%eax)
  285666: 8b 45 f0                     	movl	-16(%ebp), %eax
  285669: 83 c0 01                     	addl	$1, %eax
  28566c: c6 44 05 b6 48               	movb	$72, -74(%ebp,%eax)
  285671: 8b 45 f0                     	movl	-16(%ebp), %eax
  285674: 83 c0 02                     	addl	$2, %eax
  285677: c6 44 05 b6 52               	movb	$82, -74(%ebp,%eax)
  28567c: 8b 45 f0                     	movl	-16(%ebp), %eax
  28567f: 83 c0 03                     	addl	$3, %eax
  285682: c6 44 05 b6 42               	movb	$66, -74(%ebp,%eax)
  285687: 8b 45 f0                     	movl	-16(%ebp), %eax
  28568a: 83 c0 04                     	addl	$4, %eax
  28568d: c6 44 05 b6 00               	movb	$0, -74(%ebp,%eax)
  285692: 83 ec 04                     	subl	$4, %esp
  285695: 68 e0 00 00 00               	pushl	$224
  28569a: 68 00 26 10 00               	pushl	$1058304
  28569f: 8d 45 b6                     	leal	-74(%ebp), %eax
  2856a2: 50                           	pushl	%eax
  2856a3: e8 36 10 00 00               	calll	4150 <file_search>
  2856a8: 83 c4 10                     	addl	$16, %esp
  2856ab: 89 45 f4                     	movl	%eax, -12(%ebp)
  2856ae: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
  2856b2: 0f 84 b8 02 00 00            	je	696 <cmd_app+0x3a1>
  2856b8: 8b 45 f4                     	movl	-12(%ebp), %eax
  2856bb: 8b 40 1c                     	movl	28(%eax), %eax
  2856be: 89 45 b0                     	movl	%eax, -80(%ebp)
  2856c1: 8b 45 f4                     	movl	-12(%ebp), %eax
  2856c4: 0f b7 40 1a                  	movzwl	26(%eax), %eax
  2856c8: 0f b7 c0                     	movzwl	%ax, %eax
  2856cb: 83 ec 04                     	subl	$4, %esp
  2856ce: ff 75 0c                     	pushl	12(%ebp)
  2856d1: 8d 55 b0                     	leal	-80(%ebp), %edx
  2856d4: 52                           	pushl	%edx
  2856d5: 50                           	pushl	%eax
  2856d6: e8 68 11 00 00               	calll	4456 <file_loadfile2>
  2856db: 83 c4 10                     	addl	$16, %esp
  2856de: 89 45 e4                     	movl	%eax, -28(%ebp)
  2856e1: 8b 45 b0                     	movl	-80(%ebp), %eax
  2856e4: 83 f8 23                     	cmpl	$35, %eax
  2856e7: 0f 8e 43 02 00 00            	jle	579 <cmd_app+0x361>
  2856ed: 8b 45 e4                     	movl	-28(%ebp), %eax
  2856f0: 83 c0 04                     	addl	$4, %eax
  2856f3: 83 ec 04                     	subl	$4, %esp
  2856f6: 6a 04                        	pushl	$4
  2856f8: 68 da 13 31 00               	pushl	$3216346
  2856fd: 50                           	pushl	%eax
  2856fe: e8 fb 2e 00 00               	calll	12027 <strncmp>
  285703: 83 c4 10                     	addl	$16, %esp
  285706: 85 c0                        	testl	%eax, %eax
  285708: 0f 85 22 02 00 00            	jne	546 <cmd_app+0x361>
  28570e: 8b 45 e4                     	movl	-28(%ebp), %eax
  285711: 0f b6 00                     	movzbl	(%eax), %eax
  285714: 84 c0                        	testb	%al, %al
  285716: 0f 85 14 02 00 00            	jne	532 <cmd_app+0x361>
  28571c: 8b 45 e4                     	movl	-28(%ebp), %eax
  28571f: 8b 00                        	movl	(%eax), %eax
  285721: 89 45 e0                     	movl	%eax, -32(%ebp)
  285724: 8b 45 e4                     	movl	-28(%ebp), %eax
  285727: 8b 40 0c                     	movl	12(%eax), %eax
  28572a: 89 45 dc                     	movl	%eax, -36(%ebp)
  28572d: 8b 45 e4                     	movl	-28(%ebp), %eax
  285730: 8b 40 10                     	movl	16(%eax), %eax
  285733: 89 45 d8                     	movl	%eax, -40(%ebp)
  285736: 8b 45 e4                     	movl	-28(%ebp), %eax
  285739: 8b 40 14                     	movl	20(%eax), %eax
  28573c: 89 45 d4                     	movl	%eax, -44(%ebp)
  28573f: 8b 45 e0                     	movl	-32(%ebp), %eax
  285742: 83 ec 08                     	subl	$8, %esp
  285745: 50                           	pushl	%eax
  285746: ff 75 ec                     	pushl	-20(%ebp)
  285749: e8 0a d1 ff ff               	calll	-12022 <memman_alloc_4k>
  28574e: 83 c4 10                     	addl	$16, %esp
  285751: 89 45 d0                     	movl	%eax, -48(%ebp)
  285754: 8b 55 d0                     	movl	-48(%ebp), %edx
  285757: 8b 45 e8                     	movl	-24(%ebp), %eax
  28575a: 89 90 a8 00 00 00            	movl	%edx, 168(%eax)
  285760: 8b 45 e4                     	movl	-28(%ebp), %eax
  285763: 8b 55 b0                     	movl	-80(%ebp), %edx
  285766: 83 ea 01                     	subl	$1, %edx
  285769: 89 d1                        	movl	%edx, %ecx
  28576b: 8b 55 e8                     	movl	-24(%ebp), %edx
  28576e: 81 c2 94 00 00 00            	addl	$148, %edx
  285774: 68 fa 40 00 00               	pushl	$16634
  285779: 50                           	pushl	%eax
  28577a: 51                           	pushl	%ecx
  28577b: 52                           	pushl	%edx
  28577c: e8 e4 c6 ff ff               	calll	-14620 <set_segmdesc>
  285781: 83 c4 10                     	addl	$16, %esp
  285784: 8b 45 d0                     	movl	-48(%ebp), %eax
  285787: 8b 55 e0                     	movl	-32(%ebp), %edx
  28578a: 83 ea 01                     	subl	$1, %edx
  28578d: 89 d1                        	movl	%edx, %ecx
  28578f: 8b 55 e8                     	movl	-24(%ebp), %edx
  285792: 81 c2 94 00 00 00            	addl	$148, %edx
  285798: 83 c2 08                     	addl	$8, %edx
  28579b: 68 f2 40 00 00               	pushl	$16626
  2857a0: 50                           	pushl	%eax
  2857a1: 51                           	pushl	%ecx
  2857a2: 52                           	pushl	%edx
  2857a3: e8 bd c6 ff ff               	calll	-14659 <set_segmdesc>
  2857a8: 83 c4 10                     	addl	$16, %esp
  2857ab: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
  2857b2: eb 27                        	jmp	39 <cmd_app+0x20c>
  2857b4: 8b 55 d4                     	movl	-44(%ebp), %edx
  2857b7: 8b 45 f0                     	movl	-16(%ebp), %eax
  2857ba: 01 d0                        	addl	%edx, %eax
  2857bc: 89 c2                        	movl	%eax, %edx
  2857be: 8b 45 e4                     	movl	-28(%ebp), %eax
  2857c1: 01 d0                        	addl	%edx, %eax
  2857c3: 8b 4d dc                     	movl	-36(%ebp), %ecx
  2857c6: 8b 55 f0                     	movl	-16(%ebp), %edx
  2857c9: 01 ca                        	addl	%ecx, %edx
  2857cb: 89 d1                        	movl	%edx, %ecx
  2857cd: 8b 55 d0                     	movl	-48(%ebp), %edx
  2857d0: 01 ca                        	addl	%ecx, %edx
  2857d2: 0f b6 00                     	movzbl	(%eax), %eax
  2857d5: 88 02                        	movb	%al, (%edx)
  2857d7: 83 45 f0 01                  	addl	$1, -16(%ebp)
  2857db: 8b 45 f0                     	movl	-16(%ebp), %eax
  2857de: 3b 45 d8                     	cmpl	-40(%ebp), %eax
  2857e1: 7c d1                        	jl	-47 <cmd_app+0x1e5>
  2857e3: 8b 45 e8                     	movl	-24(%ebp), %eax
  2857e6: 83 c0 30                     	addl	$48, %eax
  2857e9: 83 ec 0c                     	subl	$12, %esp
  2857ec: 50                           	pushl	%eax
  2857ed: 6a 0c                        	pushl	$12
  2857ef: ff 75 dc                     	pushl	-36(%ebp)
  2857f2: 6a 04                        	pushl	$4
  2857f4: 6a 1b                        	pushl	$27
  2857f6: e8 a3 ba ff ff               	calll	-17757 <start_app>
  2857fb: 83 c4 20                     	addl	$32, %esp
  2857fe: b8 e4 0f 00 00               	movl	$4068, %eax
  285803: 8b 00                        	movl	(%eax), %eax
  285805: 89 45 cc                     	movl	%eax, -52(%ebp)
  285808: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
  28580f: eb 49                        	jmp	73 <cmd_app+0x28b>
  285811: 8b 55 f0                     	movl	-16(%ebp), %edx
  285814: 89 d0                        	movl	%edx, %eax
  285816: c1 e0 02                     	shll	$2, %eax
  285819: 01 d0                        	addl	%edx, %eax
  28581b: c1 e0 03                     	shll	$3, %eax
  28581e: 8d 90 10 04 00 00            	leal	1040(%eax), %edx
  285824: 8b 45 cc                     	movl	-52(%ebp), %eax
  285827: 01 d0                        	addl	%edx, %eax
  285829: 83 c0 04                     	addl	$4, %eax
  28582c: 89 45 c8                     	movl	%eax, -56(%ebp)
  28582f: 8b 45 c8                     	movl	-56(%ebp), %eax
  285832: 8b 40 1c                     	movl	28(%eax), %eax
  285835: 83 e0 11                     	andl	$17, %eax
  285838: 83 f8 11                     	cmpl	$17, %eax
  28583b: 75 19                        	jne	25 <cmd_app+0x287>
  28583d: 8b 45 c8                     	movl	-56(%ebp), %eax
  285840: 8b 40 24                     	movl	36(%eax), %eax
  285843: 39 45 e8                     	cmpl	%eax, -24(%ebp)
  285846: 75 0e                        	jne	14 <cmd_app+0x287>
  285848: 83 ec 0c                     	subl	$12, %esp
  28584b: ff 75 c8                     	pushl	-56(%ebp)
  28584e: e8 7c df ff ff               	calll	-8324 <sheet_free>
  285853: 83 c4 10                     	addl	$16, %esp
  285856: 83 45 f0 01                  	addl	$1, -16(%ebp)
  28585a: 81 7d f0 ff 00 00 00         	cmpl	$255, -16(%ebp)
  285861: 7e ae                        	jle	-82 <cmd_app+0x242>
  285863: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
  28586a: e9 83 00 00 00               	jmp	131 <cmd_app+0x323>
  28586f: 8b 45 e8                     	movl	-24(%ebp), %eax
  285872: 8b 88 b0 00 00 00            	movl	176(%eax), %ecx
  285878: 8b 55 f0                     	movl	-16(%ebp), %edx
  28587b: 89 d0                        	movl	%edx, %eax
  28587d: 01 c0                        	addl	%eax, %eax
  28587f: 01 d0                        	addl	%edx, %eax
  285881: c1 e0 02                     	shll	$2, %eax
  285884: 01 c8                        	addl	%ecx, %eax
  285886: 8b 00                        	movl	(%eax), %eax
  285888: 85 c0                        	testl	%eax, %eax
  28588a: 74 62                        	je	98 <cmd_app+0x31f>
  28588c: 8b 45 e8                     	movl	-24(%ebp), %eax
  28588f: 8b 88 b0 00 00 00            	movl	176(%eax), %ecx
  285895: 8b 55 f0                     	movl	-16(%ebp), %edx
  285898: 89 d0                        	movl	%edx, %eax
  28589a: 01 c0                        	addl	%eax, %eax
  28589c: 01 d0                        	addl	%edx, %eax
  28589e: c1 e0 02                     	shll	$2, %eax
  2858a1: 01 c8                        	addl	%ecx, %eax
  2858a3: 8b 40 04                     	movl	4(%eax), %eax
  2858a6: 89 c3                        	movl	%eax, %ebx
  2858a8: 8b 45 e8                     	movl	-24(%ebp), %eax
  2858ab: 8b 88 b0 00 00 00            	movl	176(%eax), %ecx
  2858b1: 8b 55 f0                     	movl	-16(%ebp), %edx
  2858b4: 89 d0                        	movl	%edx, %eax
  2858b6: 01 c0                        	addl	%eax, %eax
  2858b8: 01 d0                        	addl	%edx, %eax
  2858ba: c1 e0 02                     	shll	$2, %eax
  2858bd: 01 c8                        	addl	%ecx, %eax
  2858bf: 8b 00                        	movl	(%eax), %eax
  2858c1: 83 ec 04                     	subl	$4, %esp
  2858c4: 53                           	pushl	%ebx
  2858c5: 50                           	pushl	%eax
  2858c6: ff 75 ec                     	pushl	-20(%ebp)
  2858c9: e8 b6 cf ff ff               	calll	-12362 <memman_free_4k>
  2858ce: 83 c4 10                     	addl	$16, %esp
  2858d1: 8b 45 e8                     	movl	-24(%ebp), %eax
  2858d4: 8b 88 b0 00 00 00            	movl	176(%eax), %ecx
  2858da: 8b 55 f0                     	movl	-16(%ebp), %edx
  2858dd: 89 d0                        	movl	%edx, %eax
  2858df: 01 c0                        	addl	%eax, %eax
  2858e1: 01 d0                        	addl	%edx, %eax
  2858e3: c1 e0 02                     	shll	$2, %eax
  2858e6: 01 c8                        	addl	%ecx, %eax
  2858e8: c7 00 00 00 00 00            	movl	$0, (%eax)
  2858ee: 83 45 f0 01                  	addl	$1, -16(%ebp)
  2858f2: 83 7d f0 07                  	cmpl	$7, -16(%ebp)
  2858f6: 0f 8e 73 ff ff ff            	jle	-141 <cmd_app+0x2a0>
  2858fc: 8b 45 e8                     	movl	-24(%ebp), %eax
  2858ff: 83 c0 10                     	addl	$16, %eax
  285902: 83 ec 0c                     	subl	$12, %esp
  285905: 50                           	pushl	%eax
  285906: e8 26 e2 ff ff               	calll	-7642 <timer_cancelall>
  28590b: 83 c4 10                     	addl	$16, %esp
  28590e: 8b 55 e0                     	movl	-32(%ebp), %edx
  285911: 8b 45 d0                     	movl	-48(%ebp), %eax
  285914: 83 ec 04                     	subl	$4, %esp
  285917: 52                           	pushl	%edx
  285918: 50                           	pushl	%eax
  285919: ff 75 ec                     	pushl	-20(%ebp)
  28591c: e8 63 cf ff ff               	calll	-12445 <memman_free_4k>
  285921: 83 c4 10                     	addl	$16, %esp
  285924: 8b 45 e8                     	movl	-24(%ebp), %eax
  285927: c6 80 bd 00 00 00 00         	movb	$0, 189(%eax)
  28592e: eb 13                        	jmp	19 <cmd_app+0x374>
  285930: 83 ec 08                     	subl	$8, %esp
  285933: 68 df 13 31 00               	pushl	$3216351
  285938: ff 75 08                     	pushl	8(%ebp)
  28593b: e8 0c f6 ff ff               	calll	-2548 <cons_putstr0>
  285940: 83 c4 10                     	addl	$16, %esp
  285943: 8b 45 b0                     	movl	-80(%ebp), %eax
  285946: 89 c2                        	movl	%eax, %edx
  285948: 8b 45 e4                     	movl	-28(%ebp), %eax
  28594b: 83 ec 04                     	subl	$4, %esp
  28594e: 52                           	pushl	%edx
  28594f: 50                           	pushl	%eax
  285950: ff 75 ec                     	pushl	-20(%ebp)
  285953: e8 2c cf ff ff               	calll	-12500 <memman_free_4k>
  285958: 83 c4 10                     	addl	$16, %esp
  28595b: 83 ec 0c                     	subl	$12, %esp
  28595e: ff 75 08                     	pushl	8(%ebp)
  285961: e8 a5 f4 ff ff               	calll	-2907 <cons_newline>
  285966: 83 c4 10                     	addl	$16, %esp
  285969: b8 01 00 00 00               	movl	$1, %eax
  28596e: eb 05                        	jmp	5 <cmd_app+0x3a6>
  285970: b8 00 00 00 00               	movl	$0, %eax
  285975: 8b 5d fc                     	movl	-4(%ebp), %ebx
  285978: c9                           	leave
  285979: c3                           	retl

0028597a hrb_api:
  28597a: 55                           	pushl	%ebp
  28597b: 89 e5                        	movl	%esp, %ebp
  28597d: 53                           	pushl	%ebx
  28597e: 83 ec 34                     	subl	$52, %esp
  285981: e8 3a e2 ff ff               	calll	-7622 <task_now>
  285986: 89 45 f0                     	movl	%eax, -16(%ebp)
  285989: 8b 45 f0                     	movl	-16(%ebp), %eax
  28598c: 8b 80 a8 00 00 00            	movl	168(%eax), %eax
  285992: 89 45 ec                     	movl	%eax, -20(%ebp)
  285995: 8b 45 f0                     	movl	-16(%ebp), %eax
  285998: 8b 80 a4 00 00 00            	movl	164(%eax), %eax
  28599e: 89 45 e8                     	movl	%eax, -24(%ebp)
  2859a1: b8 e4 0f 00 00               	movl	$4068, %eax
  2859a6: 8b 00                        	movl	(%eax), %eax
  2859a8: 89 45 e4                     	movl	%eax, -28(%ebp)
  2859ab: b8 ec 0f 00 00               	movl	$4076, %eax
  2859b0: 8b 00                        	movl	(%eax), %eax
  2859b2: 89 45 e0                     	movl	%eax, -32(%ebp)
  2859b5: 8d 45 24                     	leal	36(%ebp), %eax
  2859b8: 83 c0 04                     	addl	$4, %eax
  2859bb: 89 45 dc                     	movl	%eax, -36(%ebp)
  2859be: c7 45 d8 00 00 3c 00         	movl	$3932160, -40(%ebp)
  2859c5: 83 7d 1c 01                  	cmpl	$1, 28(%ebp)
  2859c9: 75 1c                        	jne	28 <hrb_api+0x6d>
  2859cb: 8b 45 24                     	movl	36(%ebp), %eax
  2859ce: 0f b6 c0                     	movzbl	%al, %eax
  2859d1: 83 ec 04                     	subl	$4, %esp
  2859d4: 6a 01                        	pushl	$1
  2859d6: 50                           	pushl	%eax
  2859d7: ff 75 e8                     	pushl	-24(%ebp)
  2859da: e8 0e f3 ff ff               	calll	-3314 <cons_putchar>
  2859df: 83 c4 10                     	addl	$16, %esp
  2859e2: e9 9c 09 00 00               	jmp	2460 <hrb_api+0xa09>
  2859e7: 83 7d 1c 02                  	cmpl	$2, 28(%ebp)
  2859eb: 75 1c                        	jne	28 <hrb_api+0x8f>
  2859ed: 8b 55 ec                     	movl	-20(%ebp), %edx
  2859f0: 8b 45 18                     	movl	24(%ebp), %eax
  2859f3: 01 d0                        	addl	%edx, %eax
  2859f5: 83 ec 08                     	subl	$8, %esp
  2859f8: 50                           	pushl	%eax
  2859f9: ff 75 e8                     	pushl	-24(%ebp)
  2859fc: e8 4b f5 ff ff               	calll	-2741 <cons_putstr0>
  285a01: 83 c4 10                     	addl	$16, %esp
  285a04: e9 7a 09 00 00               	jmp	2426 <hrb_api+0xa09>
  285a09: 83 7d 1c 03                  	cmpl	$3, 28(%ebp)
  285a0d: 75 1f                        	jne	31 <hrb_api+0xb4>
  285a0f: 8b 55 ec                     	movl	-20(%ebp), %edx
  285a12: 8b 45 18                     	movl	24(%ebp), %eax
  285a15: 01 d0                        	addl	%edx, %eax
  285a17: 83 ec 04                     	subl	$4, %esp
  285a1a: ff 75 20                     	pushl	32(%ebp)
  285a1d: 50                           	pushl	%eax
  285a1e: ff 75 e8                     	pushl	-24(%ebp)
  285a21: e8 59 f5 ff ff               	calll	-2727 <cons_putstr1>
  285a26: 83 c4 10                     	addl	$16, %esp
  285a29: e9 55 09 00 00               	jmp	2389 <hrb_api+0xa09>
  285a2e: 83 7d 1c 04                  	cmpl	$4, 28(%ebp)
  285a32: 75 0b                        	jne	11 <hrb_api+0xc5>
  285a34: 8b 45 f0                     	movl	-16(%ebp), %eax
  285a37: 83 c0 30                     	addl	$48, %eax
  285a3a: e9 49 09 00 00               	jmp	2377 <hrb_api+0xa0e>
  285a3f: 83 7d 1c 05                  	cmpl	$5, 28(%ebp)
  285a43: 0f 85 d1 00 00 00            	jne	209 <hrb_api+0x1a0>
  285a49: 83 ec 0c                     	subl	$12, %esp
  285a4c: ff 75 e4                     	pushl	-28(%ebp)
  285a4f: e8 42 cf ff ff               	calll	-12478 <sheet_alloc>
  285a54: 83 c4 10                     	addl	$16, %esp
  285a57: 89 45 cc                     	movl	%eax, -52(%ebp)
  285a5a: 8b 45 cc                     	movl	-52(%ebp), %eax
  285a5d: 8b 55 f0                     	movl	-16(%ebp), %edx
  285a60: 89 50 24                     	movl	%edx, 36(%eax)
  285a63: 8b 45 cc                     	movl	-52(%ebp), %eax
  285a66: 8b 40 1c                     	movl	28(%eax), %eax
  285a69: 83 c8 10                     	orl	$16, %eax
  285a6c: 89 c2                        	movl	%eax, %edx
  285a6e: 8b 45 cc                     	movl	-52(%ebp), %eax
  285a71: 89 50 1c                     	movl	%edx, 28(%eax)
  285a74: 8b 45 24                     	movl	36(%ebp), %eax
  285a77: 8b 4d ec                     	movl	-20(%ebp), %ecx
  285a7a: 8b 55 18                     	movl	24(%ebp), %edx
  285a7d: 01 ca                        	addl	%ecx, %edx
  285a7f: 83 ec 0c                     	subl	$12, %esp
  285a82: 50                           	pushl	%eax
  285a83: ff 75 08                     	pushl	8(%ebp)
  285a86: ff 75 0c                     	pushl	12(%ebp)
  285a89: 52                           	pushl	%edx
  285a8a: ff 75 cc                     	pushl	-52(%ebp)
  285a8d: e8 85 cf ff ff               	calll	-12411 <sheet_setbuf>
  285a92: 83 c4 20                     	addl	$32, %esp
  285a95: 8b 55 ec                     	movl	-20(%ebp), %edx
  285a98: 8b 45 20                     	movl	32(%ebp), %eax
  285a9b: 01 d0                        	addl	%edx, %eax
  285a9d: 89 c1                        	movl	%eax, %ecx
  285a9f: 8b 55 ec                     	movl	-20(%ebp), %edx
  285aa2: 8b 45 18                     	movl	24(%ebp), %eax
  285aa5: 01 d0                        	addl	%edx, %eax
  285aa7: 83 ec 0c                     	subl	$12, %esp
  285aaa: 6a 00                        	pushl	$0
  285aac: 51                           	pushl	%ecx
  285aad: ff 75 08                     	pushl	8(%ebp)
  285ab0: ff 75 0c                     	pushl	12(%ebp)
  285ab3: 50                           	pushl	%eax
  285ab4: e8 b4 e7 ff ff               	calll	-6220 <make_window8>
  285ab9: 83 c4 20                     	addl	$32, %esp
  285abc: 8b 45 e4                     	movl	-28(%ebp), %eax
  285abf: 8b 40 0c                     	movl	12(%eax), %eax
  285ac2: 2b 45 08                     	subl	8(%ebp), %eax
  285ac5: 89 c2                        	movl	%eax, %edx
  285ac7: c1 ea 1f                     	shrl	$31, %edx
  285aca: 01 d0                        	addl	%edx, %eax
  285acc: d1 f8                        	sarl	%eax
  285ace: 89 c1                        	movl	%eax, %ecx
  285ad0: 8b 45 e4                     	movl	-28(%ebp), %eax
  285ad3: 8b 40 08                     	movl	8(%eax), %eax
  285ad6: 2b 45 0c                     	subl	12(%ebp), %eax
  285ad9: 89 c2                        	movl	%eax, %edx
  285adb: c1 ea 1f                     	shrl	$31, %edx
  285ade: 01 d0                        	addl	%edx, %eax
  285ae0: d1 f8                        	sarl	%eax
  285ae2: 83 e0 fc                     	andl	$-4, %eax
  285ae5: 83 ec 04                     	subl	$4, %esp
  285ae8: 51                           	pushl	%ecx
  285ae9: 50                           	pushl	%eax
  285aea: ff 75 cc                     	pushl	-52(%ebp)
  285aed: e8 ca db ff ff               	calll	-9270 <sheet_slide>
  285af2: 83 c4 10                     	addl	$16, %esp
  285af5: 8b 45 e4                     	movl	-28(%ebp), %eax
  285af8: 8b 40 10                     	movl	16(%eax), %eax
  285afb: 83 ec 08                     	subl	$8, %esp
  285afe: 50                           	pushl	%eax
  285aff: ff 75 cc                     	pushl	-52(%ebp)
  285b02: e8 cd d7 ff ff               	calll	-10291 <sheet_updown>
  285b07: 83 c4 10                     	addl	$16, %esp
  285b0a: 8b 45 dc                     	movl	-36(%ebp), %eax
  285b0d: 8d 50 1c                     	leal	28(%eax), %edx
  285b10: 8b 45 cc                     	movl	-52(%ebp), %eax
  285b13: 89 02                        	movl	%eax, (%edx)
  285b15: e9 69 08 00 00               	jmp	2153 <hrb_api+0xa09>
  285b1a: 83 7d 1c 06                  	cmpl	$6, 28(%ebp)
  285b1e: 75 77                        	jne	119 <hrb_api+0x21d>
  285b20: 8b 45 18                     	movl	24(%ebp), %eax
  285b23: 83 e0 fe                     	andl	$-2, %eax
  285b26: 89 45 cc                     	movl	%eax, -52(%ebp)
  285b29: 8b 55 ec                     	movl	-20(%ebp), %edx
  285b2c: 8b 45 10                     	movl	16(%ebp), %eax
  285b2f: 01 d0                        	addl	%edx, %eax
  285b31: 89 c3                        	movl	%eax, %ebx
  285b33: 8b 45 24                     	movl	36(%ebp), %eax
  285b36: 0f be c8                     	movsbl	%al, %ecx
  285b39: 8b 45 cc                     	movl	-52(%ebp), %eax
  285b3c: 8b 50 04                     	movl	4(%eax), %edx
  285b3f: 8b 45 cc                     	movl	-52(%ebp), %eax
  285b42: 8b 00                        	movl	(%eax), %eax
  285b44: 83 ec 08                     	subl	$8, %esp
  285b47: 53                           	pushl	%ebx
  285b48: 51                           	pushl	%ecx
  285b49: ff 75 08                     	pushl	8(%ebp)
  285b4c: ff 75 0c                     	pushl	12(%ebp)
  285b4f: 52                           	pushl	%edx
  285b50: 50                           	pushl	%eax
  285b51: e8 e1 bc ff ff               	calll	-17183 <putfonts8_asc>
  285b56: 83 c4 20                     	addl	$32, %esp
  285b59: 8b 45 18                     	movl	24(%ebp), %eax
  285b5c: 83 e0 01                     	andl	$1, %eax
  285b5f: 85 c0                        	testl	%eax, %eax
  285b61: 0f 85 1c 08 00 00            	jne	2076 <hrb_api+0xa09>
  285b67: 8b 45 08                     	movl	8(%ebp), %eax
  285b6a: 8d 50 10                     	leal	16(%eax), %edx
  285b6d: 8b 45 20                     	movl	32(%ebp), %eax
  285b70: 8d 0c c5 00 00 00 00         	leal	(,%eax,8), %ecx
  285b77: 8b 45 0c                     	movl	12(%ebp), %eax
  285b7a: 01 c8                        	addl	%ecx, %eax
  285b7c: 83 ec 0c                     	subl	$12, %esp
  285b7f: 52                           	pushl	%edx
  285b80: 50                           	pushl	%eax
  285b81: ff 75 08                     	pushl	8(%ebp)
  285b84: ff 75 0c                     	pushl	12(%ebp)
  285b87: ff 75 cc                     	pushl	-52(%ebp)
  285b8a: e8 bc da ff ff               	calll	-9540 <sheet_refresh>
  285b8f: 83 c4 20                     	addl	$32, %esp
  285b92: e9 ec 07 00 00               	jmp	2028 <hrb_api+0xa09>
  285b97: 83 7d 1c 07                  	cmpl	$7, 28(%ebp)
  285b9b: 75 6b                        	jne	107 <hrb_api+0x28e>
  285b9d: 8b 45 18                     	movl	24(%ebp), %eax
  285ba0: 83 e0 fe                     	andl	$-2, %eax
  285ba3: 89 45 cc                     	movl	%eax, -52(%ebp)
  285ba6: 8b 5d 24                     	movl	36(%ebp), %ebx
  285ba9: 8b 45 10                     	movl	16(%ebp), %eax
  285bac: 0f b6 c8                     	movzbl	%al, %ecx
  285baf: 8b 45 cc                     	movl	-52(%ebp), %eax
  285bb2: 8b 50 04                     	movl	4(%eax), %edx
  285bb5: 8b 45 cc                     	movl	-52(%ebp), %eax
  285bb8: 8b 00                        	movl	(%eax), %eax
  285bba: 83 ec 04                     	subl	$4, %esp
  285bbd: ff 75 08                     	pushl	8(%ebp)
  285bc0: ff 75 0c                     	pushl	12(%ebp)
  285bc3: ff 75 20                     	pushl	32(%ebp)
  285bc6: 53                           	pushl	%ebx
  285bc7: 51                           	pushl	%ecx
  285bc8: 52                           	pushl	%edx
  285bc9: 50                           	pushl	%eax
  285bca: e8 f7 b8 ff ff               	calll	-18185 <boxfill8>
  285bcf: 83 c4 20                     	addl	$32, %esp
  285bd2: 8b 45 18                     	movl	24(%ebp), %eax
  285bd5: 83 e0 01                     	andl	$1, %eax
  285bd8: 85 c0                        	testl	%eax, %eax
  285bda: 0f 85 a3 07 00 00            	jne	1955 <hrb_api+0xa09>
  285be0: 8b 45 08                     	movl	8(%ebp), %eax
  285be3: 8d 48 01                     	leal	1(%eax), %ecx
  285be6: 8b 45 0c                     	movl	12(%ebp), %eax
  285be9: 8d 50 01                     	leal	1(%eax), %edx
  285bec: 8b 45 24                     	movl	36(%ebp), %eax
  285bef: 83 ec 0c                     	subl	$12, %esp
  285bf2: 51                           	pushl	%ecx
  285bf3: 52                           	pushl	%edx
  285bf4: ff 75 20                     	pushl	32(%ebp)
  285bf7: 50                           	pushl	%eax
  285bf8: ff 75 cc                     	pushl	-52(%ebp)
  285bfb: e8 4b da ff ff               	calll	-9653 <sheet_refresh>
  285c00: 83 c4 20                     	addl	$32, %esp
  285c03: e9 7b 07 00 00               	jmp	1915 <hrb_api+0xa09>
  285c08: 83 7d 1c 08                  	cmpl	$8, 28(%ebp)
  285c0c: 75 3b                        	jne	59 <hrb_api+0x2cf>
  285c0e: 8b 55 18                     	movl	24(%ebp), %edx
  285c11: 8b 45 ec                     	movl	-20(%ebp), %eax
  285c14: 01 d0                        	addl	%edx, %eax
  285c16: 83 ec 0c                     	subl	$12, %esp
  285c19: 50                           	pushl	%eax
  285c1a: e8 9a c8 ff ff               	calll	-14182 <memman_init>
  285c1f: 83 c4 10                     	addl	$16, %esp
  285c22: 83 65 20 f0                  	andl	$-16, 32(%ebp)
  285c26: 8b 45 20                     	movl	32(%ebp), %eax
  285c29: 8b 55 24                     	movl	36(%ebp), %edx
  285c2c: 89 d3                        	movl	%edx, %ebx
  285c2e: 8b 4d 18                     	movl	24(%ebp), %ecx
  285c31: 8b 55 ec                     	movl	-20(%ebp), %edx
  285c34: 01 ca                        	addl	%ecx, %edx
  285c36: 83 ec 04                     	subl	$4, %esp
  285c39: 50                           	pushl	%eax
  285c3a: 53                           	pushl	%ebx
  285c3b: 52                           	pushl	%edx
  285c3c: e8 c7 c9 ff ff               	calll	-13881 <memman_free>
  285c41: 83 c4 10                     	addl	$16, %esp
  285c44: e9 3a 07 00 00               	jmp	1850 <hrb_api+0xa09>
  285c49: 83 7d 1c 09                  	cmpl	$9, 28(%ebp)
  285c4d: 75 33                        	jne	51 <hrb_api+0x308>
  285c4f: 8b 45 20                     	movl	32(%ebp), %eax
  285c52: 83 c0 0f                     	addl	$15, %eax
  285c55: 83 e0 f0                     	andl	$-16, %eax
  285c58: 89 45 20                     	movl	%eax, 32(%ebp)
  285c5b: 8b 45 20                     	movl	32(%ebp), %eax
  285c5e: 8b 4d 18                     	movl	24(%ebp), %ecx
  285c61: 8b 55 ec                     	movl	-20(%ebp), %edx
  285c64: 01 ca                        	addl	%ecx, %edx
  285c66: 83 ec 08                     	subl	$8, %esp
  285c69: 50                           	pushl	%eax
  285c6a: 52                           	pushl	%edx
  285c6b: e8 af c8 ff ff               	calll	-14161 <memman_alloc>
  285c70: 83 c4 10                     	addl	$16, %esp
  285c73: 89 c2                        	movl	%eax, %edx
  285c75: 8b 45 dc                     	movl	-36(%ebp), %eax
  285c78: 83 c0 1c                     	addl	$28, %eax
  285c7b: 89 10                        	movl	%edx, (%eax)
  285c7d: e9 01 07 00 00               	jmp	1793 <hrb_api+0xa09>
  285c82: 83 7d 1c 0a                  	cmpl	$10, 28(%ebp)
  285c86: 75 2f                        	jne	47 <hrb_api+0x33d>
  285c88: 8b 45 20                     	movl	32(%ebp), %eax
  285c8b: 83 c0 0f                     	addl	$15, %eax
  285c8e: 83 e0 f0                     	andl	$-16, %eax
  285c91: 89 45 20                     	movl	%eax, 32(%ebp)
  285c94: 8b 45 20                     	movl	32(%ebp), %eax
  285c97: 8b 55 24                     	movl	36(%ebp), %edx
  285c9a: 89 d3                        	movl	%edx, %ebx
  285c9c: 8b 4d 18                     	movl	24(%ebp), %ecx
  285c9f: 8b 55 ec                     	movl	-20(%ebp), %edx
  285ca2: 01 ca                        	addl	%ecx, %edx
  285ca4: 83 ec 04                     	subl	$4, %esp
  285ca7: 50                           	pushl	%eax
  285ca8: 53                           	pushl	%ebx
  285ca9: 52                           	pushl	%edx
  285caa: e8 59 c9 ff ff               	calll	-13991 <memman_free>
  285caf: 83 c4 10                     	addl	$16, %esp
  285cb2: e9 cc 06 00 00               	jmp	1740 <hrb_api+0xa09>
  285cb7: 83 7d 1c 0b                  	cmpl	$11, 28(%ebp)
  285cbb: 75 5b                        	jne	91 <hrb_api+0x39e>
  285cbd: 8b 45 18                     	movl	24(%ebp), %eax
  285cc0: 83 e0 fe                     	andl	$-2, %eax
  285cc3: 89 45 cc                     	movl	%eax, -52(%ebp)
  285cc6: 8b 55 24                     	movl	36(%ebp), %edx
  285cc9: 8b 45 cc                     	movl	-52(%ebp), %eax
  285ccc: 8b 08                        	movl	(%eax), %ecx
  285cce: 8b 45 cc                     	movl	-52(%ebp), %eax
  285cd1: 8b 40 04                     	movl	4(%eax), %eax
  285cd4: 0f af 45 08                  	imull	8(%ebp), %eax
  285cd8: 89 c3                        	movl	%eax, %ebx
  285cda: 8b 45 0c                     	movl	12(%ebp), %eax
  285cdd: 01 d8                        	addl	%ebx, %eax
  285cdf: 01 c8                        	addl	%ecx, %eax
  285ce1: 88 10                        	movb	%dl, (%eax)
  285ce3: 8b 45 18                     	movl	24(%ebp), %eax
  285ce6: 83 e0 01                     	andl	$1, %eax
  285ce9: 85 c0                        	testl	%eax, %eax
  285ceb: 0f 85 92 06 00 00            	jne	1682 <hrb_api+0xa09>
  285cf1: 8b 45 08                     	movl	8(%ebp), %eax
  285cf4: 8d 50 01                     	leal	1(%eax), %edx
  285cf7: 8b 45 0c                     	movl	12(%ebp), %eax
  285cfa: 83 c0 01                     	addl	$1, %eax
  285cfd: 83 ec 0c                     	subl	$12, %esp
  285d00: 52                           	pushl	%edx
  285d01: 50                           	pushl	%eax
  285d02: ff 75 08                     	pushl	8(%ebp)
  285d05: ff 75 0c                     	pushl	12(%ebp)
  285d08: ff 75 cc                     	pushl	-52(%ebp)
  285d0b: e8 3b d9 ff ff               	calll	-9925 <sheet_refresh>
  285d10: 83 c4 20                     	addl	$32, %esp
  285d13: e9 6b 06 00 00               	jmp	1643 <hrb_api+0xa09>
  285d18: 83 7d 1c 0c                  	cmpl	$12, 28(%ebp)
  285d1c: 75 26                        	jne	38 <hrb_api+0x3ca>
  285d1e: 8b 45 18                     	movl	24(%ebp), %eax
  285d21: 89 45 cc                     	movl	%eax, -52(%ebp)
  285d24: 8b 45 24                     	movl	36(%ebp), %eax
  285d27: 83 ec 0c                     	subl	$12, %esp
  285d2a: ff 75 08                     	pushl	8(%ebp)
  285d2d: ff 75 0c                     	pushl	12(%ebp)
  285d30: ff 75 20                     	pushl	32(%ebp)
  285d33: 50                           	pushl	%eax
  285d34: ff 75 cc                     	pushl	-52(%ebp)
  285d37: e8 0f d9 ff ff               	calll	-9969 <sheet_refresh>
  285d3c: 83 c4 20                     	addl	$32, %esp
  285d3f: e9 3f 06 00 00               	jmp	1599 <hrb_api+0xa09>
  285d44: 83 7d 1c 0d                  	cmpl	$13, 28(%ebp)
  285d48: 0f 85 91 00 00 00            	jne	145 <hrb_api+0x465>
  285d4e: 8b 45 18                     	movl	24(%ebp), %eax
  285d51: 83 e0 fe                     	andl	$-2, %eax
  285d54: 89 45 cc                     	movl	%eax, -52(%ebp)
  285d57: 8b 45 24                     	movl	36(%ebp), %eax
  285d5a: 83 ec 08                     	subl	$8, %esp
  285d5d: ff 75 10                     	pushl	16(%ebp)
  285d60: ff 75 08                     	pushl	8(%ebp)
  285d63: ff 75 0c                     	pushl	12(%ebp)
  285d66: ff 75 20                     	pushl	32(%ebp)
  285d69: 50                           	pushl	%eax
  285d6a: ff 75 cc                     	pushl	-52(%ebp)
  285d6d: e8 e3 06 00 00               	calll	1763 <hrb_api_linewin>
  285d72: 83 c4 20                     	addl	$32, %esp
  285d75: 8b 45 18                     	movl	24(%ebp), %eax
  285d78: 83 e0 01                     	andl	$1, %eax
  285d7b: 85 c0                        	testl	%eax, %eax
  285d7d: 0f 85 00 06 00 00            	jne	1536 <hrb_api+0xa09>
  285d83: 8b 45 24                     	movl	36(%ebp), %eax
  285d86: 39 45 0c                     	cmpl	%eax, 12(%ebp)
  285d89: 7d 12                        	jge	18 <hrb_api+0x423>
  285d8b: 8b 45 24                     	movl	36(%ebp), %eax
  285d8e: 89 45 f4                     	movl	%eax, -12(%ebp)
  285d91: 8b 45 0c                     	movl	12(%ebp), %eax
  285d94: 89 45 24                     	movl	%eax, 36(%ebp)
  285d97: 8b 45 f4                     	movl	-12(%ebp), %eax
  285d9a: 89 45 0c                     	movl	%eax, 12(%ebp)
  285d9d: 8b 45 20                     	movl	32(%ebp), %eax
  285da0: 3b 45 08                     	cmpl	8(%ebp), %eax
  285da3: 7e 12                        	jle	18 <hrb_api+0x43d>
  285da5: 8b 45 20                     	movl	32(%ebp), %eax
  285da8: 89 45 f4                     	movl	%eax, -12(%ebp)
  285dab: 8b 45 08                     	movl	8(%ebp), %eax
  285dae: 89 45 20                     	movl	%eax, 32(%ebp)
  285db1: 8b 45 f4                     	movl	-12(%ebp), %eax
  285db4: 89 45 08                     	movl	%eax, 8(%ebp)
  285db7: 8b 45 08                     	movl	8(%ebp), %eax
  285dba: 8d 48 01                     	leal	1(%eax), %ecx
  285dbd: 8b 45 0c                     	movl	12(%ebp), %eax
  285dc0: 8d 50 01                     	leal	1(%eax), %edx
  285dc3: 8b 45 24                     	movl	36(%ebp), %eax
  285dc6: 83 ec 0c                     	subl	$12, %esp
  285dc9: 51                           	pushl	%ecx
  285dca: 52                           	pushl	%edx
  285dcb: ff 75 20                     	pushl	32(%ebp)
  285dce: 50                           	pushl	%eax
  285dcf: ff 75 cc                     	pushl	-52(%ebp)
  285dd2: e8 74 d8 ff ff               	calll	-10124 <sheet_refresh>
  285dd7: 83 c4 20                     	addl	$32, %esp
  285dda: e9 a4 05 00 00               	jmp	1444 <hrb_api+0xa09>
  285ddf: 83 7d 1c 0e                  	cmpl	$14, 28(%ebp)
  285de3: 75 14                        	jne	20 <hrb_api+0x47f>
  285de5: 8b 45 18                     	movl	24(%ebp), %eax
  285de8: 83 ec 0c                     	subl	$12, %esp
  285deb: 50                           	pushl	%eax
  285dec: e8 de d9 ff ff               	calll	-9762 <sheet_free>
  285df1: 83 c4 10                     	addl	$16, %esp
  285df4: e9 8a 05 00 00               	jmp	1418 <hrb_api+0xa09>
  285df9: 83 7d 1c 0f                  	cmpl	$15, 28(%ebp)
  285dfd: 0f 85 48 01 00 00            	jne	328 <hrb_api+0x5d1>
  285e03: e8 1a b3 ff ff               	calll	-19686 <io_cli>
  285e08: 8b 45 f0                     	movl	-16(%ebp), %eax
  285e0b: 83 c0 10                     	addl	$16, %eax
  285e0e: 83 ec 0c                     	subl	$12, %esp
  285e11: 50                           	pushl	%eax
  285e12: e8 4c c3 ff ff               	calll	-15540 <fifo32_status>
  285e17: 83 c4 10                     	addl	$16, %esp
  285e1a: 85 c0                        	testl	%eax, %eax
  285e1c: 75 32                        	jne	50 <hrb_api+0x4d6>
  285e1e: 8b 45 24                     	movl	36(%ebp), %eax
  285e21: 85 c0                        	testl	%eax, %eax
  285e23: 74 10                        	je	16 <hrb_api+0x4bb>
  285e25: 83 ec 0c                     	subl	$12, %esp
  285e28: ff 75 f0                     	pushl	-16(%ebp)
  285e2b: e8 1e e3 ff ff               	calll	-7394 <task_sleep>
  285e30: 83 c4 10                     	addl	$16, %esp
  285e33: eb 1b                        	jmp	27 <hrb_api+0x4d6>
  285e35: e8 ea b2 ff ff               	calll	-19734 <io_sti>
  285e3a: 8b 45 dc                     	movl	-36(%ebp), %eax
  285e3d: 83 c0 1c                     	addl	$28, %eax
  285e40: c7 00 ff ff ff ff            	movl	$4294967295, (%eax)
  285e46: b8 00 00 00 00               	movl	$0, %eax
  285e4b: e9 38 05 00 00               	jmp	1336 <hrb_api+0xa0e>
  285e50: 8b 45 f0                     	movl	-16(%ebp), %eax
  285e53: 83 c0 10                     	addl	$16, %eax
  285e56: 83 ec 0c                     	subl	$12, %esp
  285e59: 50                           	pushl	%eax
  285e5a: e8 95 c2 ff ff               	calll	-15723 <fifo32_get>
  285e5f: 83 c4 10                     	addl	$16, %esp
  285e62: 89 45 f4                     	movl	%eax, -12(%ebp)
  285e65: e8 ba b2 ff ff               	calll	-19782 <io_sti>
  285e6a: 83 7d f4 01                  	cmpl	$1, -12(%ebp)
  285e6e: 7f 38                        	jg	56 <hrb_api+0x52e>
  285e70: 8b 45 e8                     	movl	-24(%ebp), %eax
  285e73: 8b 00                        	movl	(%eax), %eax
  285e75: 85 c0                        	testl	%eax, %eax
  285e77: 74 2f                        	je	47 <hrb_api+0x52e>
  285e79: 8b 45 f0                     	movl	-16(%ebp), %eax
  285e7c: 8d 50 10                     	leal	16(%eax), %edx
  285e7f: 8b 45 e8                     	movl	-24(%ebp), %eax
  285e82: 8b 40 10                     	movl	16(%eax), %eax
  285e85: 83 ec 04                     	subl	$4, %esp
  285e88: 6a 01                        	pushl	$1
  285e8a: 52                           	pushl	%edx
  285e8b: 50                           	pushl	%eax
  285e8c: e8 91 da ff ff               	calll	-9583 <timer_init>
  285e91: 83 c4 10                     	addl	$16, %esp
  285e94: 8b 45 e8                     	movl	-24(%ebp), %eax
  285e97: 8b 40 10                     	movl	16(%eax), %eax
  285e9a: 83 ec 08                     	subl	$8, %esp
  285e9d: 6a 32                        	pushl	$50
  285e9f: 50                           	pushl	%eax
  285ea0: e8 95 da ff ff               	calll	-9579 <timer_settime>
  285ea5: 83 c4 10                     	addl	$16, %esp
  285ea8: 83 7d f4 02                  	cmpl	$2, -12(%ebp)
  285eac: 75 0a                        	jne	10 <hrb_api+0x53e>
  285eae: 8b 45 e8                     	movl	-24(%ebp), %eax
  285eb1: c7 40 0c 07 00 00 00         	movl	$7, 12(%eax)
  285eb8: 83 7d f4 03                  	cmpl	$3, -12(%ebp)
  285ebc: 75 0a                        	jne	10 <hrb_api+0x54e>
  285ebe: 8b 45 e8                     	movl	-24(%ebp), %eax
  285ec1: c7 40 0c ff ff ff ff         	movl	$4294967295, 12(%eax)
  285ec8: 83 7d f4 04                  	cmpl	$4, -12(%ebp)
  285ecc: 75 55                        	jne	85 <hrb_api+0x5a9>
  285ece: 8b 45 e8                     	movl	-24(%ebp), %eax
  285ed1: 8b 40 10                     	movl	16(%eax), %eax
  285ed4: 83 ec 0c                     	subl	$12, %esp
  285ed7: 50                           	pushl	%eax
  285ed8: e8 b7 db ff ff               	calll	-9289 <timer_cancel>
  285edd: 83 c4 10                     	addl	$16, %esp
  285ee0: e8 3d b2 ff ff               	calll	-19907 <io_cli>
  285ee5: 8b 45 e8                     	movl	-24(%ebp), %eax
  285ee8: 8b 00                        	movl	(%eax), %eax
  285eea: 89 c2                        	movl	%eax, %edx
  285eec: 8b 45 e4                     	movl	-28(%ebp), %eax
  285eef: 05 14 04 00 00               	addl	$1044, %eax
  285ef4: 29 c2                        	subl	%eax, %edx
  285ef6: 89 d0                        	movl	%edx, %eax
  285ef8: c1 f8 03                     	sarl	$3, %eax
  285efb: 69 c0 cd cc cc cc            	imull	$3435973837, %eax, %eax
  285f01: 05 e8 07 00 00               	addl	$2024, %eax
  285f06: 83 ec 08                     	subl	$8, %esp
  285f09: 50                           	pushl	%eax
  285f0a: ff 75 e0                     	pushl	-32(%ebp)
  285f0d: e8 35 c1 ff ff               	calll	-16075 <fifo32_put>
  285f12: 83 c4 10                     	addl	$16, %esp
  285f15: 8b 45 e8                     	movl	-24(%ebp), %eax
  285f18: c7 00 00 00 00 00            	movl	$0, (%eax)
  285f1e: e8 01 b2 ff ff               	calll	-19967 <io_sti>
  285f23: 81 7d f4 ff 00 00 00         	cmpl	$255, -12(%ebp)
  285f2a: 0f 8e d3 fe ff ff            	jle	-301 <hrb_api+0x489>
  285f30: 8b 45 dc                     	movl	-36(%ebp), %eax
  285f33: 83 c0 1c                     	addl	$28, %eax
  285f36: 8b 55 f4                     	movl	-12(%ebp), %edx
  285f39: 81 ea 00 01 00 00            	subl	$256, %edx
  285f3f: 89 10                        	movl	%edx, (%eax)
  285f41: b8 00 00 00 00               	movl	$0, %eax
  285f46: e9 3d 04 00 00               	jmp	1085 <hrb_api+0xa0e>
  285f4b: 83 7d 1c 10                  	cmpl	$16, 28(%ebp)
  285f4f: 75 20                        	jne	32 <hrb_api+0x5f7>
  285f51: e8 42 d9 ff ff               	calll	-9918 <timer_alloc>
  285f56: 89 c2                        	movl	%eax, %edx
  285f58: 8b 45 dc                     	movl	-36(%ebp), %eax
  285f5b: 83 c0 1c                     	addl	$28, %eax
  285f5e: 89 10                        	movl	%edx, (%eax)
  285f60: 8b 45 dc                     	movl	-36(%ebp), %eax
  285f63: 83 c0 1c                     	addl	$28, %eax
  285f66: 8b 00                        	movl	(%eax), %eax
  285f68: c6 40 09 01                  	movb	$1, 9(%eax)
  285f6c: e9 12 04 00 00               	jmp	1042 <hrb_api+0xa09>
  285f71: 83 7d 1c 11                  	cmpl	$17, 28(%ebp)
  285f75: 75 25                        	jne	37 <hrb_api+0x622>
  285f77: 8b 45 24                     	movl	36(%ebp), %eax
  285f7a: 8d 88 00 01 00 00            	leal	256(%eax), %ecx
  285f80: 8b 45 f0                     	movl	-16(%ebp), %eax
  285f83: 8d 50 10                     	leal	16(%eax), %edx
  285f86: 8b 45 18                     	movl	24(%ebp), %eax
  285f89: 83 ec 04                     	subl	$4, %esp
  285f8c: 51                           	pushl	%ecx
  285f8d: 52                           	pushl	%edx
  285f8e: 50                           	pushl	%eax
  285f8f: e8 8e d9 ff ff               	calll	-9842 <timer_init>
  285f94: 83 c4 10                     	addl	$16, %esp
  285f97: e9 e7 03 00 00               	jmp	999 <hrb_api+0xa09>
  285f9c: 83 7d 1c 12                  	cmpl	$18, 28(%ebp)
  285fa0: 75 1a                        	jne	26 <hrb_api+0x642>
  285fa2: 8b 45 24                     	movl	36(%ebp), %eax
  285fa5: 89 c2                        	movl	%eax, %edx
  285fa7: 8b 45 18                     	movl	24(%ebp), %eax
  285faa: 83 ec 08                     	subl	$8, %esp
  285fad: 52                           	pushl	%edx
  285fae: 50                           	pushl	%eax
  285faf: e8 86 d9 ff ff               	calll	-9850 <timer_settime>
  285fb4: 83 c4 10                     	addl	$16, %esp
  285fb7: e9 c7 03 00 00               	jmp	967 <hrb_api+0xa09>
  285fbc: 83 7d 1c 13                  	cmpl	$19, 28(%ebp)
  285fc0: 75 14                        	jne	20 <hrb_api+0x65c>
  285fc2: 8b 45 18                     	movl	24(%ebp), %eax
  285fc5: 83 ec 0c                     	subl	$12, %esp
  285fc8: 50                           	pushl	%eax
  285fc9: e8 47 d9 ff ff               	calll	-9913 <timer_free>
  285fce: 83 c4 10                     	addl	$16, %esp
  285fd1: e9 ad 03 00 00               	jmp	941 <hrb_api+0xa09>
  285fd6: 83 7d 1c 14                  	cmpl	$20, 28(%ebp)
  285fda: 0f 85 a4 00 00 00            	jne	164 <hrb_api+0x70a>
  285fe0: 8b 45 24                     	movl	36(%ebp), %eax
  285fe3: 85 c0                        	testl	%eax, %eax
  285fe5: 75 29                        	jne	41 <hrb_api+0x696>
  285fe7: 83 ec 0c                     	subl	$12, %esp
  285fea: 6a 61                        	pushl	$97
  285fec: e8 38 b1 ff ff               	calll	-20168 <io_in8>
  285ff1: 83 c4 10                     	addl	$16, %esp
  285ff4: 89 45 f4                     	movl	%eax, -12(%ebp)
  285ff7: 8b 45 f4                     	movl	-12(%ebp), %eax
  285ffa: 83 e0 0d                     	andl	$13, %eax
  285ffd: 83 ec 08                     	subl	$8, %esp
  286000: 50                           	pushl	%eax
  286001: 6a 61                        	pushl	$97
  286003: e8 3e b1 ff ff               	calll	-20162 <io_out8>
  286008: 83 c4 10                     	addl	$16, %esp
  28600b: e9 73 03 00 00               	jmp	883 <hrb_api+0xa09>
  286010: 8b 5d 24                     	movl	36(%ebp), %ebx
  286013: b8 60 7b 1e 47               	movl	$1193180000, %eax
  286018: 99                           	cltd
  286019: f7 fb                        	idivl	%ebx
  28601b: 89 45 f4                     	movl	%eax, -12(%ebp)
  28601e: 83 ec 08                     	subl	$8, %esp
  286021: 68 b6 00 00 00               	pushl	$182
  286026: 6a 43                        	pushl	$67
  286028: e8 19 b1 ff ff               	calll	-20199 <io_out8>
  28602d: 83 c4 10                     	addl	$16, %esp
  286030: 8b 45 f4                     	movl	-12(%ebp), %eax
  286033: 0f b6 c0                     	movzbl	%al, %eax
  286036: 83 ec 08                     	subl	$8, %esp
  286039: 50                           	pushl	%eax
  28603a: 6a 42                        	pushl	$66
  28603c: e8 05 b1 ff ff               	calll	-20219 <io_out8>
  286041: 83 c4 10                     	addl	$16, %esp
  286044: 8b 45 f4                     	movl	-12(%ebp), %eax
  286047: c1 f8 08                     	sarl	$8, %eax
  28604a: 83 ec 08                     	subl	$8, %esp
  28604d: 50                           	pushl	%eax
  28604e: 6a 42                        	pushl	$66
  286050: e8 f1 b0 ff ff               	calll	-20239 <io_out8>
  286055: 83 c4 10                     	addl	$16, %esp
  286058: 83 ec 0c                     	subl	$12, %esp
  28605b: 6a 61                        	pushl	$97
  28605d: e8 c7 b0 ff ff               	calll	-20281 <io_in8>
  286062: 83 c4 10                     	addl	$16, %esp
  286065: 89 45 f4                     	movl	%eax, -12(%ebp)
  286068: 8b 45 f4                     	movl	-12(%ebp), %eax
  28606b: 83 e0 0c                     	andl	$12, %eax
  28606e: 83 c8 03                     	orl	$3, %eax
  286071: 83 ec 08                     	subl	$8, %esp
  286074: 50                           	pushl	%eax
  286075: 6a 61                        	pushl	$97
  286077: e8 ca b0 ff ff               	calll	-20278 <io_out8>
  28607c: 83 c4 10                     	addl	$16, %esp
  28607f: e9 ff 02 00 00               	jmp	767 <hrb_api+0xa09>
  286084: 83 7d 1c 15                  	cmpl	$21, 28(%ebp)
  286088: 0f 85 e4 00 00 00            	jne	228 <hrb_api+0x7f8>
  28608e: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  286095: eb 21                        	jmp	33 <hrb_api+0x73e>
  286097: 8b 45 f0                     	movl	-16(%ebp), %eax
  28609a: 8b 88 b0 00 00 00            	movl	176(%eax), %ecx
  2860a0: 8b 55 f4                     	movl	-12(%ebp), %edx
  2860a3: 89 d0                        	movl	%edx, %eax
  2860a5: 01 c0                        	addl	%eax, %eax
  2860a7: 01 d0                        	addl	%edx, %eax
  2860a9: c1 e0 02                     	shll	$2, %eax
  2860ac: 01 c8                        	addl	%ecx, %eax
  2860ae: 8b 00                        	movl	(%eax), %eax
  2860b0: 85 c0                        	testl	%eax, %eax
  2860b2: 74 0c                        	je	12 <hrb_api+0x746>
  2860b4: 83 45 f4 01                  	addl	$1, -12(%ebp)
  2860b8: 83 7d f4 07                  	cmpl	$7, -12(%ebp)
  2860bc: 7e d9                        	jle	-39 <hrb_api+0x71d>
  2860be: eb 01                        	jmp	1 <hrb_api+0x747>
  2860c0: 90                           	nop
  2860c1: 8b 45 f0                     	movl	-16(%ebp), %eax
  2860c4: 8b 88 b0 00 00 00            	movl	176(%eax), %ecx
  2860ca: 8b 55 f4                     	movl	-12(%ebp), %edx
  2860cd: 89 d0                        	movl	%edx, %eax
  2860cf: 01 c0                        	addl	%eax, %eax
  2860d1: 01 d0                        	addl	%edx, %eax
  2860d3: c1 e0 02                     	shll	$2, %eax
  2860d6: 01 c8                        	addl	%ecx, %eax
  2860d8: 89 45 d4                     	movl	%eax, -44(%ebp)
  2860db: 8b 45 dc                     	movl	-36(%ebp), %eax
  2860de: 83 c0 1c                     	addl	$28, %eax
  2860e1: c7 00 00 00 00 00            	movl	$0, (%eax)
  2860e7: 83 7d f4 07                  	cmpl	$7, -12(%ebp)
  2860eb: 0f 8f 92 02 00 00            	jg	658 <hrb_api+0xa09>
  2860f1: 8b 55 ec                     	movl	-20(%ebp), %edx
  2860f4: 8b 45 18                     	movl	24(%ebp), %eax
  2860f7: 01 d0                        	addl	%edx, %eax
  2860f9: 83 ec 04                     	subl	$4, %esp
  2860fc: 68 e0 00 00 00               	pushl	$224
  286101: 68 00 26 10 00               	pushl	$1058304
  286106: 50                           	pushl	%eax
  286107: e8 d2 05 00 00               	calll	1490 <file_search>
  28610c: 83 c4 10                     	addl	$16, %esp
  28610f: 89 45 d0                     	movl	%eax, -48(%ebp)
  286112: 83 7d d0 00                  	cmpl	$0, -48(%ebp)
  286116: 0f 84 67 02 00 00            	je	615 <hrb_api+0xa09>
  28611c: 8b 45 dc                     	movl	-36(%ebp), %eax
  28611f: 8d 50 1c                     	leal	28(%eax), %edx
  286122: 8b 45 d4                     	movl	-44(%ebp), %eax
  286125: 89 02                        	movl	%eax, (%edx)
  286127: 8b 45 d0                     	movl	-48(%ebp), %eax
  28612a: 8b 40 1c                     	movl	28(%eax), %eax
  28612d: 89 c2                        	movl	%eax, %edx
  28612f: 8b 45 d4                     	movl	-44(%ebp), %eax
  286132: 89 50 04                     	movl	%edx, 4(%eax)
  286135: 8b 45 d4                     	movl	-44(%ebp), %eax
  286138: c7 40 08 00 00 00 00         	movl	$0, 8(%eax)
  28613f: 8b 45 f0                     	movl	-16(%ebp), %eax
  286142: 8b 90 b4 00 00 00            	movl	180(%eax), %edx
  286148: 8b 45 d4                     	movl	-44(%ebp), %eax
  28614b: 8d 48 04                     	leal	4(%eax), %ecx
  28614e: 8b 45 d0                     	movl	-48(%ebp), %eax
  286151: 0f b7 40 1a                  	movzwl	26(%eax), %eax
  286155: 0f b7 c0                     	movzwl	%ax, %eax
  286158: 83 ec 04                     	subl	$4, %esp
  28615b: 52                           	pushl	%edx
  28615c: 51                           	pushl	%ecx
  28615d: 50                           	pushl	%eax
  28615e: e8 e0 06 00 00               	calll	1760 <file_loadfile2>
  286163: 83 c4 10                     	addl	$16, %esp
  286166: 89 c2                        	movl	%eax, %edx
  286168: 8b 45 d4                     	movl	-44(%ebp), %eax
  28616b: 89 10                        	movl	%edx, (%eax)
  28616d: e9 11 02 00 00               	jmp	529 <hrb_api+0xa09>
  286172: 83 7d 1c 16                  	cmpl	$22, 28(%ebp)
  286176: 75 31                        	jne	49 <hrb_api+0x82f>
  286178: 8b 45 24                     	movl	36(%ebp), %eax
  28617b: 89 45 d4                     	movl	%eax, -44(%ebp)
  28617e: 8b 45 d4                     	movl	-44(%ebp), %eax
  286181: 8b 40 04                     	movl	4(%eax), %eax
  286184: 89 c2                        	movl	%eax, %edx
  286186: 8b 45 d4                     	movl	-44(%ebp), %eax
  286189: 8b 00                        	movl	(%eax), %eax
  28618b: 83 ec 04                     	subl	$4, %esp
  28618e: 52                           	pushl	%edx
  28618f: 50                           	pushl	%eax
  286190: ff 75 d8                     	pushl	-40(%ebp)
  286193: e8 ec c6 ff ff               	calll	-14612 <memman_free_4k>
  286198: 83 c4 10                     	addl	$16, %esp
  28619b: 8b 45 d4                     	movl	-44(%ebp), %eax
  28619e: c7 00 00 00 00 00            	movl	$0, (%eax)
  2861a4: e9 da 01 00 00               	jmp	474 <hrb_api+0xa09>
  2861a9: 83 7d 1c 17                  	cmpl	$23, 28(%ebp)
  2861ad: 0f 85 80 00 00 00            	jne	128 <hrb_api+0x8b9>
  2861b3: 8b 45 24                     	movl	36(%ebp), %eax
  2861b6: 89 45 d4                     	movl	%eax, -44(%ebp)
  2861b9: 83 7d 20 00                  	cmpl	$0, 32(%ebp)
  2861bd: 75 0b                        	jne	11 <hrb_api+0x850>
  2861bf: 8b 45 d4                     	movl	-44(%ebp), %eax
  2861c2: 8b 55 18                     	movl	24(%ebp), %edx
  2861c5: 89 50 08                     	movl	%edx, 8(%eax)
  2861c8: eb 30                        	jmp	48 <hrb_api+0x880>
  2861ca: 83 7d 20 01                  	cmpl	$1, 32(%ebp)
  2861ce: 75 13                        	jne	19 <hrb_api+0x869>
  2861d0: 8b 45 d4                     	movl	-44(%ebp), %eax
  2861d3: 8b 50 08                     	movl	8(%eax), %edx
  2861d6: 8b 45 18                     	movl	24(%ebp), %eax
  2861d9: 01 c2                        	addl	%eax, %edx
  2861db: 8b 45 d4                     	movl	-44(%ebp), %eax
  2861de: 89 50 08                     	movl	%edx, 8(%eax)
  2861e1: eb 17                        	jmp	23 <hrb_api+0x880>
  2861e3: 83 7d 20 02                  	cmpl	$2, 32(%ebp)
  2861e7: 75 11                        	jne	17 <hrb_api+0x880>
  2861e9: 8b 45 d4                     	movl	-44(%ebp), %eax
  2861ec: 8b 50 04                     	movl	4(%eax), %edx
  2861ef: 8b 45 18                     	movl	24(%ebp), %eax
  2861f2: 01 c2                        	addl	%eax, %edx
  2861f4: 8b 45 d4                     	movl	-44(%ebp), %eax
  2861f7: 89 50 08                     	movl	%edx, 8(%eax)
  2861fa: 8b 45 d4                     	movl	-44(%ebp), %eax
  2861fd: 8b 40 08                     	movl	8(%eax), %eax
  286200: 85 c0                        	testl	%eax, %eax
  286202: 79 0a                        	jns	10 <hrb_api+0x894>
  286204: 8b 45 d4                     	movl	-44(%ebp), %eax
  286207: c7 40 08 00 00 00 00         	movl	$0, 8(%eax)
  28620e: 8b 45 d4                     	movl	-44(%ebp), %eax
  286211: 8b 50 08                     	movl	8(%eax), %edx
  286214: 8b 45 d4                     	movl	-44(%ebp), %eax
  286217: 8b 40 04                     	movl	4(%eax), %eax
  28621a: 39 c2                        	cmpl	%eax, %edx
  28621c: 0f 8e 61 01 00 00            	jle	353 <hrb_api+0xa09>
  286222: 8b 45 d4                     	movl	-44(%ebp), %eax
  286225: 8b 50 04                     	movl	4(%eax), %edx
  286228: 8b 45 d4                     	movl	-44(%ebp), %eax
  28622b: 89 50 08                     	movl	%edx, 8(%eax)
  28622e: e9 50 01 00 00               	jmp	336 <hrb_api+0xa09>
  286233: 83 7d 1c 18                  	cmpl	$24, 28(%ebp)
  286237: 75 5f                        	jne	95 <hrb_api+0x91e>
  286239: 8b 45 24                     	movl	36(%ebp), %eax
  28623c: 89 45 d4                     	movl	%eax, -44(%ebp)
  28623f: 83 7d 20 00                  	cmpl	$0, 32(%ebp)
  286243: 75 13                        	jne	19 <hrb_api+0x8de>
  286245: 8b 45 dc                     	movl	-36(%ebp), %eax
  286248: 8d 50 1c                     	leal	28(%eax), %edx
  28624b: 8b 45 d4                     	movl	-44(%ebp), %eax
  28624e: 8b 40 04                     	movl	4(%eax), %eax
  286251: 89 02                        	movl	%eax, (%edx)
  286253: e9 2b 01 00 00               	jmp	299 <hrb_api+0xa09>
  286258: 83 7d 20 01                  	cmpl	$1, 32(%ebp)
  28625c: 75 13                        	jne	19 <hrb_api+0x8f7>
  28625e: 8b 45 dc                     	movl	-36(%ebp), %eax
  286261: 8d 50 1c                     	leal	28(%eax), %edx
  286264: 8b 45 d4                     	movl	-44(%ebp), %eax
  286267: 8b 40 08                     	movl	8(%eax), %eax
  28626a: 89 02                        	movl	%eax, (%edx)
  28626c: e9 12 01 00 00               	jmp	274 <hrb_api+0xa09>
  286271: 83 7d 20 02                  	cmpl	$2, 32(%ebp)
  286275: 0f 85 08 01 00 00            	jne	264 <hrb_api+0xa09>
  28627b: 8b 45 d4                     	movl	-44(%ebp), %eax
  28627e: 8b 48 08                     	movl	8(%eax), %ecx
  286281: 8b 45 d4                     	movl	-44(%ebp), %eax
  286284: 8b 50 04                     	movl	4(%eax), %edx
  286287: 8b 45 dc                     	movl	-36(%ebp), %eax
  28628a: 83 c0 1c                     	addl	$28, %eax
  28628d: 29 d1                        	subl	%edx, %ecx
  28628f: 89 ca                        	movl	%ecx, %edx
  286291: 89 10                        	movl	%edx, (%eax)
  286293: e9 eb 00 00 00               	jmp	235 <hrb_api+0xa09>
  286298: 83 7d 1c 19                  	cmpl	$25, 28(%ebp)
  28629c: 75 69                        	jne	105 <hrb_api+0x98d>
  28629e: 8b 45 24                     	movl	36(%ebp), %eax
  2862a1: 89 45 d4                     	movl	%eax, -44(%ebp)
  2862a4: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  2862ab: eb 42                        	jmp	66 <hrb_api+0x975>
  2862ad: 8b 45 d4                     	movl	-44(%ebp), %eax
  2862b0: 8b 50 08                     	movl	8(%eax), %edx
  2862b3: 8b 45 d4                     	movl	-44(%ebp), %eax
  2862b6: 8b 40 04                     	movl	4(%eax), %eax
  2862b9: 39 c2                        	cmpl	%eax, %edx
  2862bb: 74 3c                        	je	60 <hrb_api+0x97f>
  2862bd: 8b 45 d4                     	movl	-44(%ebp), %eax
  2862c0: 8b 10                        	movl	(%eax), %edx
  2862c2: 8b 45 d4                     	movl	-44(%ebp), %eax
  2862c5: 8b 40 08                     	movl	8(%eax), %eax
  2862c8: 01 d0                        	addl	%edx, %eax
  2862ca: 8b 4d ec                     	movl	-20(%ebp), %ecx
  2862cd: 8b 55 18                     	movl	24(%ebp), %edx
  2862d0: 01 d1                        	addl	%edx, %ecx
  2862d2: 8b 55 f4                     	movl	-12(%ebp), %edx
  2862d5: 01 ca                        	addl	%ecx, %edx
  2862d7: 0f b6 00                     	movzbl	(%eax), %eax
  2862da: 88 02                        	movb	%al, (%edx)
  2862dc: 8b 45 d4                     	movl	-44(%ebp), %eax
  2862df: 8b 40 08                     	movl	8(%eax), %eax
  2862e2: 8d 50 01                     	leal	1(%eax), %edx
  2862e5: 8b 45 d4                     	movl	-44(%ebp), %eax
  2862e8: 89 50 08                     	movl	%edx, 8(%eax)
  2862eb: 83 45 f4 01                  	addl	$1, -12(%ebp)
  2862ef: 8b 45 f4                     	movl	-12(%ebp), %eax
  2862f2: 3b 45 20                     	cmpl	32(%ebp), %eax
  2862f5: 7c b6                        	jl	-74 <hrb_api+0x933>
  2862f7: eb 01                        	jmp	1 <hrb_api+0x980>
  2862f9: 90                           	nop
  2862fa: 8b 45 dc                     	movl	-36(%ebp), %eax
  2862fd: 8d 50 1c                     	leal	28(%eax), %edx
  286300: 8b 45 f4                     	movl	-12(%ebp), %eax
  286303: 89 02                        	movl	%eax, (%edx)
  286305: eb 7c                        	jmp	124 <hrb_api+0xa09>
  286307: 83 7d 1c 1a                  	cmpl	$26, 28(%ebp)
  28630b: 75 5b                        	jne	91 <hrb_api+0x9ee>
  28630d: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  286314: 8b 45 f0                     	movl	-16(%ebp), %eax
  286317: 8b 90 b8 00 00 00            	movl	184(%eax), %edx
  28631d: 8b 45 f4                     	movl	-12(%ebp), %eax
  286320: 01 d0                        	addl	%edx, %eax
  286322: 8b 4d ec                     	movl	-20(%ebp), %ecx
  286325: 8b 55 18                     	movl	24(%ebp), %edx
  286328: 01 d1                        	addl	%edx, %ecx
  28632a: 8b 55 f4                     	movl	-12(%ebp), %edx
  28632d: 01 ca                        	addl	%ecx, %edx
  28632f: 0f b6 00                     	movzbl	(%eax), %eax
  286332: 88 02                        	movb	%al, (%edx)
  286334: 8b 45 f0                     	movl	-16(%ebp), %eax
  286337: 8b 90 b8 00 00 00            	movl	184(%eax), %edx
  28633d: 8b 45 f4                     	movl	-12(%ebp), %eax
  286340: 01 d0                        	addl	%edx, %eax
  286342: 0f b6 00                     	movzbl	(%eax), %eax
  286345: 84 c0                        	testb	%al, %al
  286347: 74 0e                        	je	14 <hrb_api+0x9dd>
  286349: 8b 45 f4                     	movl	-12(%ebp), %eax
  28634c: 3b 45 20                     	cmpl	32(%ebp), %eax
  28634f: 7d 09                        	jge	9 <hrb_api+0x9e0>
  286351: 83 45 f4 01                  	addl	$1, -12(%ebp)
  286355: eb bd                        	jmp	-67 <hrb_api+0x99a>
  286357: 90                           	nop
  286358: eb 01                        	jmp	1 <hrb_api+0x9e1>
  28635a: 90                           	nop
  28635b: 8b 45 dc                     	movl	-36(%ebp), %eax
  28635e: 8d 50 1c                     	leal	28(%eax), %edx
  286361: 8b 45 f4                     	movl	-12(%ebp), %eax
  286364: 89 02                        	movl	%eax, (%edx)
  286366: eb 1b                        	jmp	27 <hrb_api+0xa09>
  286368: 83 7d 1c 1b                  	cmpl	$27, 28(%ebp)
  28636c: 75 15                        	jne	21 <hrb_api+0xa09>
  28636e: 8b 45 f0                     	movl	-16(%ebp), %eax
  286371: 0f b6 80 bc 00 00 00         	movzbl	188(%eax), %eax
  286378: 8b 55 dc                     	movl	-36(%ebp), %edx
  28637b: 83 c2 1c                     	addl	$28, %edx
  28637e: 0f b6 c0                     	movzbl	%al, %eax
  286381: 89 02                        	movl	%eax, (%edx)
  286383: b8 00 00 00 00               	movl	$0, %eax
  286388: 8b 5d fc                     	movl	-4(%ebp), %ebx
  28638b: c9                           	leave
  28638c: c3                           	retl

0028638d inthandler0c:
  28638d: 55                           	pushl	%ebp
  28638e: 89 e5                        	movl	%esp, %ebp
  286390: 83 ec 38                     	subl	$56, %esp
  286393: e8 28 d8 ff ff               	calll	-10200 <task_now>
  286398: 89 45 f4                     	movl	%eax, -12(%ebp)
  28639b: 8b 45 f4                     	movl	-12(%ebp), %eax
  28639e: 8b 80 a4 00 00 00            	movl	164(%eax), %eax
  2863a4: 89 45 f0                     	movl	%eax, -16(%ebp)
  2863a7: 83 ec 08                     	subl	$8, %esp
  2863aa: 68 f8 13 31 00               	pushl	$3216376
  2863af: ff 75 f0                     	pushl	-16(%ebp)
  2863b2: e8 95 eb ff ff               	calll	-5227 <cons_putstr0>
  2863b7: 83 c4 10                     	addl	$16, %esp
  2863ba: 8b 45 08                     	movl	8(%ebp), %eax
  2863bd: 83 c0 2c                     	addl	$44, %eax
  2863c0: 8b 00                        	movl	(%eax), %eax
  2863c2: 83 ec 04                     	subl	$4, %esp
  2863c5: 50                           	pushl	%eax
  2863c6: 68 15 14 31 00               	pushl	$3216405
  2863cb: 8d 45 d2                     	leal	-46(%ebp), %eax
  2863ce: 50                           	pushl	%eax
  2863cf: e8 aa 21 00 00               	calll	8618 <sprintf>
  2863d4: 83 c4 10                     	addl	$16, %esp
  2863d7: 83 ec 08                     	subl	$8, %esp
  2863da: 8d 45 d2                     	leal	-46(%ebp), %eax
  2863dd: 50                           	pushl	%eax
  2863de: ff 75 f0                     	pushl	-16(%ebp)
  2863e1: e8 66 eb ff ff               	calll	-5274 <cons_putstr0>
  2863e6: 83 c4 10                     	addl	$16, %esp
  2863e9: 8b 45 f4                     	movl	-12(%ebp), %eax
  2863ec: 83 c0 30                     	addl	$48, %eax
  2863ef: c9                           	leave
  2863f0: c3                           	retl

002863f1 inthandler0d:
  2863f1: 55                           	pushl	%ebp
  2863f2: 89 e5                        	movl	%esp, %ebp
  2863f4: 83 ec 38                     	subl	$56, %esp
  2863f7: e8 c4 d7 ff ff               	calll	-10300 <task_now>
  2863fc: 89 45 f4                     	movl	%eax, -12(%ebp)
  2863ff: 8b 45 f4                     	movl	-12(%ebp), %eax
  286402: 8b 80 a4 00 00 00            	movl	164(%eax), %eax
  286408: 89 45 f0                     	movl	%eax, -16(%ebp)
  28640b: 83 ec 08                     	subl	$8, %esp
  28640e: 68 24 14 31 00               	pushl	$3216420
  286413: ff 75 f0                     	pushl	-16(%ebp)
  286416: e8 31 eb ff ff               	calll	-5327 <cons_putstr0>
  28641b: 83 c4 10                     	addl	$16, %esp
  28641e: 8b 45 08                     	movl	8(%ebp), %eax
  286421: 83 c0 2c                     	addl	$44, %eax
  286424: 8b 00                        	movl	(%eax), %eax
  286426: 83 ec 04                     	subl	$4, %esp
  286429: 50                           	pushl	%eax
  28642a: 68 15 14 31 00               	pushl	$3216405
  28642f: 8d 45 d2                     	leal	-46(%ebp), %eax
  286432: 50                           	pushl	%eax
  286433: e8 46 21 00 00               	calll	8518 <sprintf>
  286438: 83 c4 10                     	addl	$16, %esp
  28643b: 83 ec 08                     	subl	$8, %esp
  28643e: 8d 45 d2                     	leal	-46(%ebp), %eax
  286441: 50                           	pushl	%eax
  286442: ff 75 f0                     	pushl	-16(%ebp)
  286445: e8 02 eb ff ff               	calll	-5374 <cons_putstr0>
  28644a: 83 c4 10                     	addl	$16, %esp
  28644d: 8b 45 f4                     	movl	-12(%ebp), %eax
  286450: 83 c0 30                     	addl	$48, %eax
  286453: c9                           	leave
  286454: c3                           	retl

00286455 hrb_api_linewin:
  286455: 55                           	pushl	%ebp
  286456: 89 e5                        	movl	%esp, %ebp
  286458: 83 ec 20                     	subl	$32, %esp
  28645b: 8b 45 14                     	movl	20(%ebp), %eax
  28645e: 2b 45 0c                     	subl	12(%ebp), %eax
  286461: 89 45 ec                     	movl	%eax, -20(%ebp)
  286464: 8b 45 18                     	movl	24(%ebp), %eax
  286467: 2b 45 10                     	subl	16(%ebp), %eax
  28646a: 89 45 e8                     	movl	%eax, -24(%ebp)
  28646d: 8b 45 0c                     	movl	12(%ebp), %eax
  286470: c1 e0 0a                     	shll	$10, %eax
  286473: 89 45 f8                     	movl	%eax, -8(%ebp)
  286476: 8b 45 10                     	movl	16(%ebp), %eax
  286479: c1 e0 0a                     	shll	$10, %eax
  28647c: 89 45 f4                     	movl	%eax, -12(%ebp)
  28647f: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
  286483: 79 03                        	jns	3 <hrb_api_linewin+0x33>
  286485: f7 5d ec                     	negl	-20(%ebp)
  286488: 83 7d e8 00                  	cmpl	$0, -24(%ebp)
  28648c: 79 03                        	jns	3 <hrb_api_linewin+0x3c>
  28648e: f7 5d e8                     	negl	-24(%ebp)
  286491: 8b 45 ec                     	movl	-20(%ebp), %eax
  286494: 3b 45 e8                     	cmpl	-24(%ebp), %eax
  286497: 7c 53                        	jl	83 <hrb_api_linewin+0x97>
  286499: 8b 45 ec                     	movl	-20(%ebp), %eax
  28649c: 83 c0 01                     	addl	$1, %eax
  28649f: 89 45 f0                     	movl	%eax, -16(%ebp)
  2864a2: 8b 45 0c                     	movl	12(%ebp), %eax
  2864a5: 3b 45 14                     	cmpl	20(%ebp), %eax
  2864a8: 7e 09                        	jle	9 <hrb_api_linewin+0x5e>
  2864aa: c7 45 ec 00 fc ff ff         	movl	$4294966272, -20(%ebp)
  2864b1: eb 07                        	jmp	7 <hrb_api_linewin+0x65>
  2864b3: c7 45 ec 00 04 00 00         	movl	$1024, -20(%ebp)
  2864ba: 8b 45 10                     	movl	16(%ebp), %eax
  2864bd: 3b 45 18                     	cmpl	24(%ebp), %eax
  2864c0: 7f 15                        	jg	21 <hrb_api_linewin+0x82>
  2864c2: 8b 45 18                     	movl	24(%ebp), %eax
  2864c5: 2b 45 10                     	subl	16(%ebp), %eax
  2864c8: 83 c0 01                     	addl	$1, %eax
  2864cb: c1 e0 0a                     	shll	$10, %eax
  2864ce: 99                           	cltd
  2864cf: f7 7d f0                     	idivl	-16(%ebp)
  2864d2: 89 45 e8                     	movl	%eax, -24(%ebp)
  2864d5: eb 66                        	jmp	102 <hrb_api_linewin+0xe8>
  2864d7: 8b 45 18                     	movl	24(%ebp), %eax
  2864da: 2b 45 10                     	subl	16(%ebp), %eax
  2864dd: 83 e8 01                     	subl	$1, %eax
  2864e0: c1 e0 0a                     	shll	$10, %eax
  2864e3: 99                           	cltd
  2864e4: f7 7d f0                     	idivl	-16(%ebp)
  2864e7: 89 45 e8                     	movl	%eax, -24(%ebp)
  2864ea: eb 51                        	jmp	81 <hrb_api_linewin+0xe8>
  2864ec: 8b 45 e8                     	movl	-24(%ebp), %eax
  2864ef: 83 c0 01                     	addl	$1, %eax
  2864f2: 89 45 f0                     	movl	%eax, -16(%ebp)
  2864f5: 8b 45 10                     	movl	16(%ebp), %eax
  2864f8: 3b 45 18                     	cmpl	24(%ebp), %eax
  2864fb: 7e 09                        	jle	9 <hrb_api_linewin+0xb1>
  2864fd: c7 45 e8 00 fc ff ff         	movl	$4294966272, -24(%ebp)
  286504: eb 07                        	jmp	7 <hrb_api_linewin+0xb8>
  286506: c7 45 e8 00 04 00 00         	movl	$1024, -24(%ebp)
  28650d: 8b 45 0c                     	movl	12(%ebp), %eax
  286510: 3b 45 14                     	cmpl	20(%ebp), %eax
  286513: 7f 15                        	jg	21 <hrb_api_linewin+0xd5>
  286515: 8b 45 14                     	movl	20(%ebp), %eax
  286518: 2b 45 0c                     	subl	12(%ebp), %eax
  28651b: 83 c0 01                     	addl	$1, %eax
  28651e: c1 e0 0a                     	shll	$10, %eax
  286521: 99                           	cltd
  286522: f7 7d f0                     	idivl	-16(%ebp)
  286525: 89 45 ec                     	movl	%eax, -20(%ebp)
  286528: eb 13                        	jmp	19 <hrb_api_linewin+0xe8>
  28652a: 8b 45 14                     	movl	20(%ebp), %eax
  28652d: 2b 45 0c                     	subl	12(%ebp), %eax
  286530: 83 e8 01                     	subl	$1, %eax
  286533: c1 e0 0a                     	shll	$10, %eax
  286536: 99                           	cltd
  286537: f7 7d f0                     	idivl	-16(%ebp)
  28653a: 89 45 ec                     	movl	%eax, -20(%ebp)
  28653d: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  286544: eb 35                        	jmp	53 <hrb_api_linewin+0x126>
  286546: 8b 45 08                     	movl	8(%ebp), %eax
  286549: 8b 10                        	movl	(%eax), %edx
  28654b: 8b 45 f4                     	movl	-12(%ebp), %eax
  28654e: c1 f8 0a                     	sarl	$10, %eax
  286551: 89 c1                        	movl	%eax, %ecx
  286553: 8b 45 08                     	movl	8(%ebp), %eax
  286556: 8b 40 04                     	movl	4(%eax), %eax
  286559: 0f af c1                     	imull	%ecx, %eax
  28655c: 8b 4d f8                     	movl	-8(%ebp), %ecx
  28655f: c1 f9 0a                     	sarl	$10, %ecx
  286562: 01 c8                        	addl	%ecx, %eax
  286564: 01 d0                        	addl	%edx, %eax
  286566: 8b 55 1c                     	movl	28(%ebp), %edx
  286569: 88 10                        	movb	%dl, (%eax)
  28656b: 8b 45 ec                     	movl	-20(%ebp), %eax
  28656e: 01 45 f8                     	addl	%eax, -8(%ebp)
  286571: 8b 45 e8                     	movl	-24(%ebp), %eax
  286574: 01 45 f4                     	addl	%eax, -12(%ebp)
  286577: 83 45 fc 01                  	addl	$1, -4(%ebp)
  28657b: 8b 45 fc                     	movl	-4(%ebp), %eax
  28657e: 3b 45 f0                     	cmpl	-16(%ebp), %eax
  286581: 7c c3                        	jl	-61 <hrb_api_linewin+0xf1>
  286583: 90                           	nop
  286584: c9                           	leave
  286585: c3                           	retl

00286586 file_readfat:
  286586: 55                           	pushl	%ebp
  286587: 89 e5                        	movl	%esp, %ebp
  286589: 83 ec 10                     	subl	$16, %esp
  28658c: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  286593: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  28659a: e9 87 00 00 00               	jmp	135 <file_readfat+0xa0>
  28659f: 8b 55 f8                     	movl	-8(%ebp), %edx
  2865a2: 8b 45 0c                     	movl	12(%ebp), %eax
  2865a5: 01 d0                        	addl	%edx, %eax
  2865a7: 0f b6 00                     	movzbl	(%eax), %eax
  2865aa: 0f b6 c0                     	movzbl	%al, %eax
  2865ad: 8b 55 f8                     	movl	-8(%ebp), %edx
  2865b0: 8d 4a 01                     	leal	1(%edx), %ecx
  2865b3: 8b 55 0c                     	movl	12(%ebp), %edx
  2865b6: 01 ca                        	addl	%ecx, %edx
  2865b8: 0f b6 12                     	movzbl	(%edx), %edx
  2865bb: 0f b6 d2                     	movzbl	%dl, %edx
  2865be: c1 e2 08                     	shll	$8, %edx
  2865c1: 09 c2                        	orl	%eax, %edx
  2865c3: 8b 45 fc                     	movl	-4(%ebp), %eax
  2865c6: 8d 0c 85 00 00 00 00         	leal	(,%eax,4), %ecx
  2865cd: 8b 45 08                     	movl	8(%ebp), %eax
  2865d0: 01 c8                        	addl	%ecx, %eax
  2865d2: 81 e2 ff 0f 00 00            	andl	$4095, %edx
  2865d8: 89 10                        	movl	%edx, (%eax)
  2865da: 8b 45 f8                     	movl	-8(%ebp), %eax
  2865dd: 8d 50 01                     	leal	1(%eax), %edx
  2865e0: 8b 45 0c                     	movl	12(%ebp), %eax
  2865e3: 01 d0                        	addl	%edx, %eax
  2865e5: 0f b6 00                     	movzbl	(%eax), %eax
  2865e8: c0 e8 04                     	shrb	$4, %al
  2865eb: 0f b6 c0                     	movzbl	%al, %eax
  2865ee: 8b 55 f8                     	movl	-8(%ebp), %edx
  2865f1: 8d 4a 02                     	leal	2(%edx), %ecx
  2865f4: 8b 55 0c                     	movl	12(%ebp), %edx
  2865f7: 01 ca                        	addl	%ecx, %edx
  2865f9: 0f b6 12                     	movzbl	(%edx), %edx
  2865fc: 0f b6 d2                     	movzbl	%dl, %edx
  2865ff: c1 e2 04                     	shll	$4, %edx
  286602: 09 c2                        	orl	%eax, %edx
  286604: 8b 45 fc                     	movl	-4(%ebp), %eax
  286607: 83 c0 01                     	addl	$1, %eax
  28660a: 8d 0c 85 00 00 00 00         	leal	(,%eax,4), %ecx
  286611: 8b 45 08                     	movl	8(%ebp), %eax
  286614: 01 c8                        	addl	%ecx, %eax
  286616: 81 e2 ff 0f 00 00            	andl	$4095, %edx
  28661c: 89 10                        	movl	%edx, (%eax)
  28661e: 83 45 f8 03                  	addl	$3, -8(%ebp)
  286622: 83 45 fc 02                  	addl	$2, -4(%ebp)
  286626: 81 7d fc 3f 0b 00 00         	cmpl	$2879, -4(%ebp)
  28662d: 0f 8e 6c ff ff ff            	jle	-148 <file_readfat+0x19>
  286633: 90                           	nop
  286634: c9                           	leave
  286635: c3                           	retl

00286636 file_loadfile:
  286636: 55                           	pushl	%ebp
  286637: 89 e5                        	movl	%esp, %ebp
  286639: 83 ec 10                     	subl	$16, %esp
  28663c: 81 7d 0c 00 02 00 00         	cmpl	$512, 12(%ebp)
  286643: 7f 38                        	jg	56 <file_loadfile+0x47>
  286645: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  28664c: eb 25                        	jmp	37 <file_loadfile+0x3d>
  28664e: 8b 45 08                     	movl	8(%ebp), %eax
  286651: c1 e0 09                     	shll	$9, %eax
  286654: 89 c2                        	movl	%eax, %edx
  286656: 8b 45 fc                     	movl	-4(%ebp), %eax
  286659: 01 d0                        	addl	%edx, %eax
  28665b: 89 c2                        	movl	%eax, %edx
  28665d: 8b 45 18                     	movl	24(%ebp), %eax
  286660: 01 d0                        	addl	%edx, %eax
  286662: 8b 4d fc                     	movl	-4(%ebp), %ecx
  286665: 8b 55 10                     	movl	16(%ebp), %edx
  286668: 01 ca                        	addl	%ecx, %edx
  28666a: 0f b6 00                     	movzbl	(%eax), %eax
  28666d: 88 02                        	movb	%al, (%edx)
  28666f: 83 45 fc 01                  	addl	$1, -4(%ebp)
  286673: 8b 45 fc                     	movl	-4(%ebp), %eax
  286676: 3b 45 0c                     	cmpl	12(%ebp), %eax
  286679: 7c d3                        	jl	-45 <file_loadfile+0x18>
  28667b: eb 5e                        	jmp	94 <file_loadfile+0xa5>
  28667d: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  286684: eb 25                        	jmp	37 <file_loadfile+0x75>
  286686: 8b 45 08                     	movl	8(%ebp), %eax
  286689: c1 e0 09                     	shll	$9, %eax
  28668c: 89 c2                        	movl	%eax, %edx
  28668e: 8b 45 fc                     	movl	-4(%ebp), %eax
  286691: 01 d0                        	addl	%edx, %eax
  286693: 89 c2                        	movl	%eax, %edx
  286695: 8b 45 18                     	movl	24(%ebp), %eax
  286698: 01 d0                        	addl	%edx, %eax
  28669a: 8b 4d fc                     	movl	-4(%ebp), %ecx
  28669d: 8b 55 10                     	movl	16(%ebp), %edx
  2866a0: 01 ca                        	addl	%ecx, %edx
  2866a2: 0f b6 00                     	movzbl	(%eax), %eax
  2866a5: 88 02                        	movb	%al, (%edx)
  2866a7: 83 45 fc 01                  	addl	$1, -4(%ebp)
  2866ab: 81 7d fc ff 01 00 00         	cmpl	$511, -4(%ebp)
  2866b2: 7e d2                        	jle	-46 <file_loadfile+0x50>
  2866b4: 81 6d 0c 00 02 00 00         	subl	$512, 12(%ebp)
  2866bb: 81 45 10 00 02 00 00         	addl	$512, 16(%ebp)
  2866c2: 8b 45 08                     	movl	8(%ebp), %eax
  2866c5: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
  2866cc: 8b 45 14                     	movl	20(%ebp), %eax
  2866cf: 01 d0                        	addl	%edx, %eax
  2866d1: 8b 00                        	movl	(%eax), %eax
  2866d3: 89 45 08                     	movl	%eax, 8(%ebp)
  2866d6: e9 61 ff ff ff               	jmp	-159 <file_loadfile+0x6>
  2866db: 90                           	nop
  2866dc: c9                           	leave
  2866dd: c3                           	retl

002866de file_search:
  2866de: 55                           	pushl	%ebp
  2866df: 89 e5                        	movl	%esp, %ebp
  2866e1: 83 ec 20                     	subl	$32, %esp
  2866e4: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  2866eb: eb 0f                        	jmp	15 <file_search+0x1e>
  2866ed: 8d 55 ec                     	leal	-20(%ebp), %edx
  2866f0: 8b 45 f8                     	movl	-8(%ebp), %eax
  2866f3: 01 d0                        	addl	%edx, %eax
  2866f5: c6 00 20                     	movb	$32, (%eax)
  2866f8: 83 45 f8 01                  	addl	$1, -8(%ebp)
  2866fc: 83 7d f8 0a                  	cmpl	$10, -8(%ebp)
  286700: 7e eb                        	jle	-21 <file_search+0xf>
  286702: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  286709: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  286710: e9 83 00 00 00               	jmp	131 <file_search+0xba>
  286715: 83 7d f8 0a                  	cmpl	$10, -8(%ebp)
  286719: 7e 0a                        	jle	10 <file_search+0x47>
  28671b: b8 00 00 00 00               	movl	$0, %eax
  286720: e9 1c 01 00 00               	jmp	284 <file_search+0x163>
  286725: 8b 55 fc                     	movl	-4(%ebp), %edx
  286728: 8b 45 08                     	movl	8(%ebp), %eax
  28672b: 01 d0                        	addl	%edx, %eax
  28672d: 0f b6 00                     	movzbl	(%eax), %eax
  286730: 3c 2e                        	cmpb	$46, %al
  286732: 75 0f                        	jne	15 <file_search+0x65>
  286734: 83 7d f8 08                  	cmpl	$8, -8(%ebp)
  286738: 7f 09                        	jg	9 <file_search+0x65>
  28673a: c7 45 f8 08 00 00 00         	movl	$8, -8(%ebp)
  286741: eb 51                        	jmp	81 <file_search+0xb6>
  286743: 8b 55 fc                     	movl	-4(%ebp), %edx
  286746: 8b 45 08                     	movl	8(%ebp), %eax
  286749: 01 d0                        	addl	%edx, %eax
  28674b: 0f b6 00                     	movzbl	(%eax), %eax
  28674e: 8d 4d ec                     	leal	-20(%ebp), %ecx
  286751: 8b 55 f8                     	movl	-8(%ebp), %edx
  286754: 01 ca                        	addl	%ecx, %edx
  286756: 88 02                        	movb	%al, (%edx)
  286758: 8d 55 ec                     	leal	-20(%ebp), %edx
  28675b: 8b 45 f8                     	movl	-8(%ebp), %eax
  28675e: 01 d0                        	addl	%edx, %eax
  286760: 0f b6 00                     	movzbl	(%eax), %eax
  286763: 3c 60                        	cmpb	$96, %al
  286765: 7e 29                        	jle	41 <file_search+0xb2>
  286767: 8d 55 ec                     	leal	-20(%ebp), %edx
  28676a: 8b 45 f8                     	movl	-8(%ebp), %eax
  28676d: 01 d0                        	addl	%edx, %eax
  28676f: 0f b6 00                     	movzbl	(%eax), %eax
  286772: 3c 7a                        	cmpb	$122, %al
  286774: 7f 1a                        	jg	26 <file_search+0xb2>
  286776: 8d 55 ec                     	leal	-20(%ebp), %edx
  286779: 8b 45 f8                     	movl	-8(%ebp), %eax
  28677c: 01 d0                        	addl	%edx, %eax
  28677e: 0f b6 00                     	movzbl	(%eax), %eax
  286781: 83 e8 20                     	subl	$32, %eax
  286784: 89 c1                        	movl	%eax, %ecx
  286786: 8d 55 ec                     	leal	-20(%ebp), %edx
  286789: 8b 45 f8                     	movl	-8(%ebp), %eax
  28678c: 01 d0                        	addl	%edx, %eax
  28678e: 88 08                        	movb	%cl, (%eax)
  286790: 83 45 f8 01                  	addl	$1, -8(%ebp)
  286794: 83 45 fc 01                  	addl	$1, -4(%ebp)
  286798: 8b 55 fc                     	movl	-4(%ebp), %edx
  28679b: 8b 45 08                     	movl	8(%ebp), %eax
  28679e: 01 d0                        	addl	%edx, %eax
  2867a0: 0f b6 00                     	movzbl	(%eax), %eax
  2867a3: 84 c0                        	testb	%al, %al
  2867a5: 0f 85 6a ff ff ff            	jne	-150 <file_search+0x37>
  2867ab: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  2867b2: eb 79                        	jmp	121 <file_search+0x14f>
  2867b4: 8b 45 0c                     	movl	12(%ebp), %eax
  2867b7: 0f b6 00                     	movzbl	(%eax), %eax
  2867ba: 84 c0                        	testb	%al, %al
  2867bc: 74 7d                        	je	125 <file_search+0x15d>
  2867be: 8b 45 fc                     	movl	-4(%ebp), %eax
  2867c1: c1 e0 05                     	shll	$5, %eax
  2867c4: 89 c2                        	movl	%eax, %edx
  2867c6: 8b 45 0c                     	movl	12(%ebp), %eax
  2867c9: 01 d0                        	addl	%edx, %eax
  2867cb: 0f b6 40 0b                  	movzbl	11(%eax), %eax
  2867cf: 0f b6 c0                     	movzbl	%al, %eax
  2867d2: 83 e0 18                     	andl	$24, %eax
  2867d5: 85 c0                        	testl	%eax, %eax
  2867d7: 75 4c                        	jne	76 <file_search+0x147>
  2867d9: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  2867e0: eb 2e                        	jmp	46 <file_search+0x132>
  2867e2: 8b 45 fc                     	movl	-4(%ebp), %eax
  2867e5: c1 e0 05                     	shll	$5, %eax
  2867e8: 89 c2                        	movl	%eax, %edx
  2867ea: 8b 45 0c                     	movl	12(%ebp), %eax
  2867ed: 01 c2                        	addl	%eax, %edx
  2867ef: 8b 45 f8                     	movl	-8(%ebp), %eax
  2867f2: 01 d0                        	addl	%edx, %eax
  2867f4: 0f b6 00                     	movzbl	(%eax), %eax
  2867f7: 0f b6 d0                     	movzbl	%al, %edx
  2867fa: 8d 4d ec                     	leal	-20(%ebp), %ecx
  2867fd: 8b 45 f8                     	movl	-8(%ebp), %eax
  286800: 01 c8                        	addl	%ecx, %eax
  286802: 0f b6 00                     	movzbl	(%eax), %eax
  286805: 0f be c0                     	movsbl	%al, %eax
  286808: 39 c2                        	cmpl	%eax, %edx
  28680a: 75 1c                        	jne	28 <file_search+0x14a>
  28680c: 83 45 f8 01                  	addl	$1, -8(%ebp)
  286810: 83 7d f8 0a                  	cmpl	$10, -8(%ebp)
  286814: 7e cc                        	jle	-52 <file_search+0x104>
  286816: 8b 45 fc                     	movl	-4(%ebp), %eax
  286819: c1 e0 05                     	shll	$5, %eax
  28681c: 89 c2                        	movl	%eax, %edx
  28681e: 8b 45 0c                     	movl	12(%ebp), %eax
  286821: 01 d0                        	addl	%edx, %eax
  286823: eb 1c                        	jmp	28 <file_search+0x163>
  286825: 90                           	nop
  286826: eb 01                        	jmp	1 <file_search+0x14b>
  286828: 90                           	nop
  286829: 83 45 fc 01                  	addl	$1, -4(%ebp)
  28682d: 8b 45 fc                     	movl	-4(%ebp), %eax
  286830: 3b 45 10                     	cmpl	16(%ebp), %eax
  286833: 0f 8c 7b ff ff ff            	jl	-133 <file_search+0xd6>
  286839: eb 01                        	jmp	1 <file_search+0x15e>
  28683b: 90                           	nop
  28683c: b8 00 00 00 00               	movl	$0, %eax
  286841: c9                           	leave
  286842: c3                           	retl

00286843 file_loadfile2:
  286843: 55                           	pushl	%ebp
  286844: 89 e5                        	movl	%esp, %ebp
  286846: 83 ec 28                     	subl	$40, %esp
  286849: 8b 45 0c                     	movl	12(%ebp), %eax
  28684c: 8b 00                        	movl	(%eax), %eax
  28684e: 89 45 f0                     	movl	%eax, -16(%ebp)
  286851: c7 45 ec 00 00 3c 00         	movl	$3932160, -20(%ebp)
  286858: 8b 45 f0                     	movl	-16(%ebp), %eax
  28685b: 83 ec 08                     	subl	$8, %esp
  28685e: 50                           	pushl	%eax
  28685f: ff 75 ec                     	pushl	-20(%ebp)
  286862: e8 f1 bf ff ff               	calll	-16399 <memman_alloc_4k>
  286867: 83 c4 10                     	addl	$16, %esp
  28686a: 89 45 f4                     	movl	%eax, -12(%ebp)
  28686d: 83 ec 0c                     	subl	$12, %esp
  286870: 68 00 3e 10 00               	pushl	$1064448
  286875: ff 75 10                     	pushl	16(%ebp)
  286878: ff 75 f4                     	pushl	-12(%ebp)
  28687b: ff 75 f0                     	pushl	-16(%ebp)
  28687e: ff 75 08                     	pushl	8(%ebp)
  286881: e8 b0 fd ff ff               	calll	-592 <file_loadfile>
  286886: 83 c4 20                     	addl	$32, %esp
  286889: 83 7d f0 10                  	cmpl	$16, -16(%ebp)
  28688d: 7e 64                        	jle	100 <file_loadfile2+0xb0>
  28688f: 83 ec 0c                     	subl	$12, %esp
  286892: ff 75 f4                     	pushl	-12(%ebp)
  286895: e8 a9 00 00 00               	calll	169 <tek_getsize>
  28689a: 83 c4 10                     	addl	$16, %esp
  28689d: 89 45 e8                     	movl	%eax, -24(%ebp)
  2868a0: 83 7d e8 00                  	cmpl	$0, -24(%ebp)
  2868a4: 7e 4d                        	jle	77 <file_loadfile2+0xb0>
  2868a6: 8b 45 e8                     	movl	-24(%ebp), %eax
  2868a9: 83 ec 08                     	subl	$8, %esp
  2868ac: 50                           	pushl	%eax
  2868ad: ff 75 ec                     	pushl	-20(%ebp)
  2868b0: e8 a3 bf ff ff               	calll	-16477 <memman_alloc_4k>
  2868b5: 83 c4 10                     	addl	$16, %esp
  2868b8: 89 45 e4                     	movl	%eax, -28(%ebp)
  2868bb: 83 ec 04                     	subl	$4, %esp
  2868be: ff 75 e8                     	pushl	-24(%ebp)
  2868c1: ff 75 e4                     	pushl	-28(%ebp)
  2868c4: ff 75 f4                     	pushl	-12(%ebp)
  2868c7: e8 df 00 00 00               	calll	223 <tek_decomp>
  2868cc: 83 c4 10                     	addl	$16, %esp
  2868cf: 8b 55 f0                     	movl	-16(%ebp), %edx
  2868d2: 8b 45 f4                     	movl	-12(%ebp), %eax
  2868d5: 83 ec 04                     	subl	$4, %esp
  2868d8: 52                           	pushl	%edx
  2868d9: 50                           	pushl	%eax
  2868da: ff 75 ec                     	pushl	-20(%ebp)
  2868dd: e8 a2 bf ff ff               	calll	-16478 <memman_free_4k>
  2868e2: 83 c4 10                     	addl	$16, %esp
  2868e5: 8b 45 e4                     	movl	-28(%ebp), %eax
  2868e8: 89 45 f4                     	movl	%eax, -12(%ebp)
  2868eb: 8b 45 0c                     	movl	12(%ebp), %eax
  2868ee: 8b 55 e8                     	movl	-24(%ebp), %edx
  2868f1: 89 10                        	movl	%edx, (%eax)
  2868f3: 8b 45 f4                     	movl	-12(%ebp), %eax
  2868f6: c9                           	leave
  2868f7: c3                           	retl

002868f8 tek_getnum_s7s:
  2868f8: 55                           	pushl	%ebp
  2868f9: 89 e5                        	movl	%esp, %ebp
  2868fb: 83 ec 10                     	subl	$16, %esp
  2868fe: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  286905: 8b 45 08                     	movl	8(%ebp), %eax
  286908: 8b 00                        	movl	(%eax), %eax
  28690a: 89 45 f8                     	movl	%eax, -8(%ebp)
  28690d: 8b 45 fc                     	movl	-4(%ebp), %eax
  286910: c1 e0 07                     	shll	$7, %eax
  286913: 89 c1                        	movl	%eax, %ecx
  286915: 8b 45 f8                     	movl	-8(%ebp), %eax
  286918: 8d 50 01                     	leal	1(%eax), %edx
  28691b: 89 55 f8                     	movl	%edx, -8(%ebp)
  28691e: 0f b6 00                     	movzbl	(%eax), %eax
  286921: 0f b6 c0                     	movzbl	%al, %eax
  286924: 09 c8                        	orl	%ecx, %eax
  286926: 89 45 fc                     	movl	%eax, -4(%ebp)
  286929: 8b 45 fc                     	movl	-4(%ebp), %eax
  28692c: 83 e0 01                     	andl	$1, %eax
  28692f: 85 c0                        	testl	%eax, %eax
  286931: 74 da                        	je	-38 <tek_getnum_s7s+0x15>
  286933: d1 6d fc                     	shrl	-4(%ebp)
  286936: 8b 45 08                     	movl	8(%ebp), %eax
  286939: 8b 55 f8                     	movl	-8(%ebp), %edx
  28693c: 89 10                        	movl	%edx, (%eax)
  28693e: 8b 45 fc                     	movl	-4(%ebp), %eax
  286941: c9                           	leave
  286942: c3                           	retl

00286943 tek_getsize:
  286943: 55                           	pushl	%ebp
  286944: 89 e5                        	movl	%esp, %ebp
  286946: 83 ec 18                     	subl	$24, %esp
  286949: c7 45 f4 ff ff ff ff         	movl	$4294967295, -12(%ebp)
  286950: 8b 45 08                     	movl	8(%ebp), %eax
  286953: 83 c0 01                     	addl	$1, %eax
  286956: 83 ec 04                     	subl	$4, %esp
  286959: 6a 0f                        	pushl	$15
  28695b: 68 60 14 31 00               	pushl	$3216480
  286960: 50                           	pushl	%eax
  286961: e8 c0 1b 00 00               	calll	7104 <memcmp>
  286966: 83 c4 10                     	addl	$16, %esp
  286969: 85 c0                        	testl	%eax, %eax
  28696b: 75 39                        	jne	57 <tek_getsize+0x63>
  28696d: 8b 45 08                     	movl	8(%ebp), %eax
  286970: 0f b6 00                     	movzbl	(%eax), %eax
  286973: 3c 83                        	cmpb	$-125, %al
  286975: 74 14                        	je	20 <tek_getsize+0x48>
  286977: 8b 45 08                     	movl	8(%ebp), %eax
  28697a: 0f b6 00                     	movzbl	(%eax), %eax
  28697d: 3c 85                        	cmpb	$-123, %al
  28697f: 74 0a                        	je	10 <tek_getsize+0x48>
  286981: 8b 45 08                     	movl	8(%ebp), %eax
  286984: 0f b6 00                     	movzbl	(%eax), %eax
  286987: 3c 89                        	cmpb	$-119, %al
  286989: 75 1b                        	jne	27 <tek_getsize+0x63>
  28698b: 8b 45 08                     	movl	8(%ebp), %eax
  28698e: 83 c0 10                     	addl	$16, %eax
  286991: 89 45 08                     	movl	%eax, 8(%ebp)
  286994: 83 ec 0c                     	subl	$12, %esp
  286997: 8d 45 08                     	leal	8(%ebp), %eax
  28699a: 50                           	pushl	%eax
  28699b: e8 58 ff ff ff               	calll	-168 <tek_getnum_s7s>
  2869a0: 83 c4 10                     	addl	$16, %esp
  2869a3: 89 45 f4                     	movl	%eax, -12(%ebp)
  2869a6: 8b 45 f4                     	movl	-12(%ebp), %eax
  2869a9: c9                           	leave
  2869aa: c3                           	retl

002869ab tek_decomp:
  2869ab: 55                           	pushl	%ebp
  2869ac: 89 e5                        	movl	%esp, %ebp
  2869ae: 83 ec 18                     	subl	$24, %esp
  2869b1: c7 45 f4 ff ff ff ff         	movl	$4294967295, -12(%ebp)
  2869b8: 8b 45 08                     	movl	8(%ebp), %eax
  2869bb: 0f b6 00                     	movzbl	(%eax), %eax
  2869be: 3c 83                        	cmpb	$-125, %al
  2869c0: 75 19                        	jne	25 <tek_decomp+0x30>
  2869c2: 83 ec 04                     	subl	$4, %esp
  2869c5: ff 75 0c                     	pushl	12(%ebp)
  2869c8: ff 75 08                     	pushl	8(%ebp)
  2869cb: ff 75 10                     	pushl	16(%ebp)
  2869ce: e8 f0 01 00 00               	calll	496 <tek_decode1>
  2869d3: 83 c4 10                     	addl	$16, %esp
  2869d6: 89 45 f4                     	movl	%eax, -12(%ebp)
  2869d9: eb 44                        	jmp	68 <tek_decomp+0x74>
  2869db: 8b 45 08                     	movl	8(%ebp), %eax
  2869de: 0f b6 00                     	movzbl	(%eax), %eax
  2869e1: 3c 85                        	cmpb	$-123, %al
  2869e3: 75 19                        	jne	25 <tek_decomp+0x53>
  2869e5: 83 ec 04                     	subl	$4, %esp
  2869e8: ff 75 0c                     	pushl	12(%ebp)
  2869eb: ff 75 08                     	pushl	8(%ebp)
  2869ee: ff 75 10                     	pushl	16(%ebp)
  2869f1: e8 b4 05 00 00               	calll	1460 <tek_decode2>
  2869f6: 83 c4 10                     	addl	$16, %esp
  2869f9: 89 45 f4                     	movl	%eax, -12(%ebp)
  2869fc: eb 21                        	jmp	33 <tek_decomp+0x74>
  2869fe: 8b 45 08                     	movl	8(%ebp), %eax
  286a01: 0f b6 00                     	movzbl	(%eax), %eax
  286a04: 3c 89                        	cmpb	$-119, %al
  286a06: 75 17                        	jne	23 <tek_decomp+0x74>
  286a08: 83 ec 04                     	subl	$4, %esp
  286a0b: ff 75 0c                     	pushl	12(%ebp)
  286a0e: ff 75 08                     	pushl	8(%ebp)
  286a11: ff 75 10                     	pushl	16(%ebp)
  286a14: e8 f3 19 00 00               	calll	6643 <tek_decode5>
  286a19: 83 c4 10                     	addl	$16, %esp
  286a1c: 89 45 f4                     	movl	%eax, -12(%ebp)
  286a1f: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
  286a23: 74 07                        	je	7 <tek_decomp+0x81>
  286a25: b8 ff ff ff ff               	movl	$4294967295, %eax
  286a2a: eb 05                        	jmp	5 <tek_decomp+0x86>
  286a2c: b8 00 00 00 00               	movl	$0, %eax
  286a31: c9                           	leave
  286a32: c3                           	retl

00286a33 tek_lzrestore_stk1:
  286a33: 55                           	pushl	%ebp
  286a34: 89 e5                        	movl	%esp, %ebp
  286a36: 83 ec 20                     	subl	$32, %esp
  286a39: 8b 55 10                     	movl	16(%ebp), %edx
  286a3c: 8b 45 14                     	movl	20(%ebp), %eax
  286a3f: 01 d0                        	addl	%edx, %eax
  286a41: 89 45 ec                     	movl	%eax, -20(%ebp)
  286a44: 8b 45 0c                     	movl	12(%ebp), %eax
  286a47: 89 45 e4                     	movl	%eax, -28(%ebp)
  286a4a: 8b 45 14                     	movl	20(%ebp), %eax
  286a4d: 89 45 e8                     	movl	%eax, -24(%ebp)
  286a50: 8b 45 e4                     	movl	-28(%ebp), %eax
  286a53: 8d 50 01                     	leal	1(%eax), %edx
  286a56: 89 55 e4                     	movl	%edx, -28(%ebp)
  286a59: 0f b6 00                     	movzbl	(%eax), %eax
  286a5c: 0f b6 c0                     	movzbl	%al, %eax
  286a5f: 89 45 f8                     	movl	%eax, -8(%ebp)
  286a62: 8b 45 f8                     	movl	-8(%ebp), %eax
  286a65: 83 e0 0f                     	andl	$15, %eax
  286a68: 89 45 fc                     	movl	%eax, -4(%ebp)
  286a6b: 83 7d fc 00                  	cmpl	$0, -4(%ebp)
  286a6f: 75 0f                        	jne	15 <tek_lzrestore_stk1+0x4d>
  286a71: 8d 45 e4                     	leal	-28(%ebp), %eax
  286a74: 50                           	pushl	%eax
  286a75: e8 7e fe ff ff               	calll	-386 <tek_getnum_s7s>
  286a7a: 83 c4 04                     	addl	$4, %esp
  286a7d: 89 45 fc                     	movl	%eax, -4(%ebp)
  286a80: c1 7d f8 04                  	sarl	$4, -8(%ebp)
  286a84: 83 7d f8 00                  	cmpl	$0, -8(%ebp)
  286a88: 75 0f                        	jne	15 <tek_lzrestore_stk1+0x66>
  286a8a: 8d 45 e4                     	leal	-28(%ebp), %eax
  286a8d: 50                           	pushl	%eax
  286a8e: e8 65 fe ff ff               	calll	-411 <tek_getnum_s7s>
  286a93: 83 c4 04                     	addl	$4, %esp
  286a96: 89 45 f8                     	movl	%eax, -8(%ebp)
  286a99: 8b 55 e4                     	movl	-28(%ebp), %edx
  286a9c: 8d 42 01                     	leal	1(%edx), %eax
  286a9f: 89 45 e4                     	movl	%eax, -28(%ebp)
  286aa2: 8b 45 14                     	movl	20(%ebp), %eax
  286aa5: 8d 48 01                     	leal	1(%eax), %ecx
  286aa8: 89 4d 14                     	movl	%ecx, 20(%ebp)
  286aab: 0f b6 12                     	movzbl	(%edx), %edx
  286aae: 88 10                        	movb	%dl, (%eax)
  286ab0: 83 6d fc 01                  	subl	$1, -4(%ebp)
  286ab4: 83 7d fc 00                  	cmpl	$0, -4(%ebp)
  286ab8: 75 df                        	jne	-33 <tek_lzrestore_stk1+0x66>
  286aba: 8b 45 14                     	movl	20(%ebp), %eax
  286abd: 3b 45 ec                     	cmpl	-20(%ebp), %eax
  286ac0: 0f 83 ed 00 00 00            	jae	237 <tek_lzrestore_stk1+0x180>
  286ac6: 8b 45 e4                     	movl	-28(%ebp), %eax
  286ac9: 8d 50 01                     	leal	1(%eax), %edx
  286acc: 89 55 e4                     	movl	%edx, -28(%ebp)
  286acf: 0f b6 00                     	movzbl	(%eax), %eax
  286ad2: 0f b6 c0                     	movzbl	%al, %eax
  286ad5: 89 45 f4                     	movl	%eax, -12(%ebp)
  286ad8: 8b 45 f4                     	movl	-12(%ebp), %eax
  286adb: 83 e0 0f                     	andl	$15, %eax
  286ade: 89 45 f0                     	movl	%eax, -16(%ebp)
  286ae1: 8b 45 f0                     	movl	-16(%ebp), %eax
  286ae4: 83 e0 01                     	andl	$1, %eax
  286ae7: 85 c0                        	testl	%eax, %eax
  286ae9: 75 26                        	jne	38 <tek_lzrestore_stk1+0xde>
  286aeb: 8b 45 f0                     	movl	-16(%ebp), %eax
  286aee: c1 e0 07                     	shll	$7, %eax
  286af1: 89 c1                        	movl	%eax, %ecx
  286af3: 8b 45 e4                     	movl	-28(%ebp), %eax
  286af6: 8d 50 01                     	leal	1(%eax), %edx
  286af9: 89 55 e4                     	movl	%edx, -28(%ebp)
  286afc: 0f b6 00                     	movzbl	(%eax), %eax
  286aff: 0f b6 c0                     	movzbl	%al, %eax
  286b02: 09 c8                        	orl	%ecx, %eax
  286b04: 89 45 f0                     	movl	%eax, -16(%ebp)
  286b07: 8b 45 f0                     	movl	-16(%ebp), %eax
  286b0a: 83 e0 01                     	andl	$1, %eax
  286b0d: 85 c0                        	testl	%eax, %eax
  286b0f: 74 da                        	je	-38 <tek_lzrestore_stk1+0xb8>
  286b11: 8b 45 f0                     	movl	-16(%ebp), %eax
  286b14: d1 f8                        	sarl	%eax
  286b16: f7 d0                        	notl	%eax
  286b18: 89 45 f0                     	movl	%eax, -16(%ebp)
  286b1b: c1 7d f4 04                  	sarl	$4, -12(%ebp)
  286b1f: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
  286b23: 75 29                        	jne	41 <tek_lzrestore_stk1+0x11b>
  286b25: 8b 45 f4                     	movl	-12(%ebp), %eax
  286b28: c1 e0 07                     	shll	$7, %eax
  286b2b: 89 c1                        	movl	%eax, %ecx
  286b2d: 8b 45 e4                     	movl	-28(%ebp), %eax
  286b30: 8d 50 01                     	leal	1(%eax), %edx
  286b33: 89 55 e4                     	movl	%edx, -28(%ebp)
  286b36: 0f b6 00                     	movzbl	(%eax), %eax
  286b39: 0f b6 c0                     	movzbl	%al, %eax
  286b3c: 09 c8                        	orl	%ecx, %eax
  286b3e: 89 45 f4                     	movl	%eax, -12(%ebp)
  286b41: 8b 45 f4                     	movl	-12(%ebp), %eax
  286b44: 83 e0 01                     	andl	$1, %eax
  286b47: 85 c0                        	testl	%eax, %eax
  286b49: 74 da                        	je	-38 <tek_lzrestore_stk1+0xf2>
  286b4b: d1 7d f4                     	sarl	-12(%ebp)
  286b4e: 83 45 f4 01                  	addl	$1, -12(%ebp)
  286b52: 8b 55 f0                     	movl	-16(%ebp), %edx
  286b55: 8b 45 14                     	movl	20(%ebp), %eax
  286b58: 01 d0                        	addl	%edx, %eax
  286b5a: 39 45 e8                     	cmpl	%eax, -24(%ebp)
  286b5d: 77 5c                        	ja	92 <tek_lzrestore_stk1+0x188>
  286b5f: 8b 55 f4                     	movl	-12(%ebp), %edx
  286b62: 8b 45 14                     	movl	20(%ebp), %eax
  286b65: 01 d0                        	addl	%edx, %eax
  286b67: 39 45 ec                     	cmpl	%eax, -20(%ebp)
  286b6a: 73 0d                        	jae	13 <tek_lzrestore_stk1+0x146>
  286b6c: 8b 55 ec                     	movl	-20(%ebp), %edx
  286b6f: 8b 45 14                     	movl	20(%ebp), %eax
  286b72: 29 c2                        	subl	%eax, %edx
  286b74: 89 d0                        	movl	%edx, %eax
  286b76: 89 45 f4                     	movl	%eax, -12(%ebp)
  286b79: 8b 55 f0                     	movl	-16(%ebp), %edx
  286b7c: 8b 45 14                     	movl	20(%ebp), %eax
  286b7f: 01 d0                        	addl	%edx, %eax
  286b81: 0f b6 10                     	movzbl	(%eax), %edx
  286b84: 8b 45 14                     	movl	20(%ebp), %eax
  286b87: 88 10                        	movb	%dl, (%eax)
  286b89: 83 45 14 01                  	addl	$1, 20(%ebp)
  286b8d: 83 6d f4 01                  	subl	$1, -12(%ebp)
  286b91: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
  286b95: 75 e2                        	jne	-30 <tek_lzrestore_stk1+0x146>
  286b97: 83 6d f8 01                  	subl	$1, -8(%ebp)
  286b9b: 83 7d f8 00                  	cmpl	$0, -8(%ebp)
  286b9f: 0f 85 21 ff ff ff            	jne	-223 <tek_lzrestore_stk1+0x93>
  286ba5: 8b 45 14                     	movl	20(%ebp), %eax
  286ba8: 3b 45 ec                     	cmpl	-20(%ebp), %eax
  286bab: 0f 82 9f fe ff ff            	jb	-353 <tek_lzrestore_stk1+0x1d>
  286bb1: eb 01                        	jmp	1 <tek_lzrestore_stk1+0x181>
  286bb3: 90                           	nop
  286bb4: b8 00 00 00 00               	movl	$0, %eax
  286bb9: eb 06                        	jmp	6 <tek_lzrestore_stk1+0x18e>
  286bbb: 90                           	nop
  286bbc: b8 01 00 00 00               	movl	$1, %eax
  286bc1: c9                           	leave
  286bc2: c3                           	retl

00286bc3 tek_decode1:
  286bc3: 55                           	pushl	%ebp
  286bc4: 89 e5                        	movl	%esp, %ebp
  286bc6: 83 ec 10                     	subl	$16, %esp
  286bc9: 8b 55 0c                     	movl	12(%ebp), %edx
  286bcc: 8b 45 08                     	movl	8(%ebp), %eax
  286bcf: 01 d0                        	addl	%edx, %eax
  286bd1: 89 45 fc                     	movl	%eax, -4(%ebp)
  286bd4: 8b 45 0c                     	movl	12(%ebp), %eax
  286bd7: 83 c0 10                     	addl	$16, %eax
  286bda: 89 45 0c                     	movl	%eax, 12(%ebp)
  286bdd: 8d 45 0c                     	leal	12(%ebp), %eax
  286be0: 50                           	pushl	%eax
  286be1: e8 12 fd ff ff               	calll	-750 <tek_getnum_s7s>
  286be6: 83 c4 04                     	addl	$4, %esp
  286be9: 89 45 f8                     	movl	%eax, -8(%ebp)
  286bec: 83 7d f8 00                  	cmpl	$0, -8(%ebp)
  286bf0: 0f 8e 8c 00 00 00            	jle	140 <tek_decode1+0xbf>
  286bf6: 8d 45 0c                     	leal	12(%ebp), %eax
  286bf9: 50                           	pushl	%eax
  286bfa: e8 f9 fc ff ff               	calll	-775 <tek_getnum_s7s>
  286bff: 83 c4 04                     	addl	$4, %esp
  286c02: 89 45 f4                     	movl	%eax, -12(%ebp)
  286c05: 8b 45 f4                     	movl	-12(%ebp), %eax
  286c08: d1 f8                        	sarl	%eax
  286c0a: 83 e0 0f                     	andl	$15, %eax
  286c0d: 83 c0 08                     	addl	$8, %eax
  286c10: ba 01 00 00 00               	movl	$1, %edx
  286c15: 89 c1                        	movl	%eax, %ecx
  286c17: d3 e2                        	shll	%cl, %edx
  286c19: 89 d0                        	movl	%edx, %eax
  286c1b: 89 45 f0                     	movl	%eax, -16(%ebp)
  286c1e: 8b 45 f8                     	movl	-8(%ebp), %eax
  286c21: 3b 45 f0                     	cmpl	-16(%ebp), %eax
  286c24: 7f 0b                        	jg	11 <tek_decode1+0x6e>
  286c26: 8b 45 f4                     	movl	-12(%ebp), %eax
  286c29: 83 e0 21                     	andl	$33, %eax
  286c2c: 83 f8 01                     	cmpl	$1, %eax
  286c2f: 74 07                        	je	7 <tek_decode1+0x75>
  286c31: b8 01 00 00 00               	movl	$1, %eax
  286c36: eb 4f                        	jmp	79 <tek_decode1+0xc4>
  286c38: 8b 45 f4                     	movl	-12(%ebp), %eax
  286c3b: 83 e0 40                     	andl	$64, %eax
  286c3e: 85 c0                        	testl	%eax, %eax
  286c40: 74 0c                        	je	12 <tek_decode1+0x8b>
  286c42: 8d 45 0c                     	leal	12(%ebp), %eax
  286c45: 50                           	pushl	%eax
  286c46: e8 ad fc ff ff               	calll	-851 <tek_getnum_s7s>
  286c4b: 83 c4 04                     	addl	$4, %esp
  286c4e: 8d 45 0c                     	leal	12(%ebp), %eax
  286c51: 50                           	pushl	%eax
  286c52: e8 a1 fc ff ff               	calll	-863 <tek_getnum_s7s>
  286c57: 83 c4 04                     	addl	$4, %esp
  286c5a: 85 c0                        	testl	%eax, %eax
  286c5c: 74 07                        	je	7 <tek_decode1+0xa2>
  286c5e: b8 01 00 00 00               	movl	$1, %eax
  286c63: eb 22                        	jmp	34 <tek_decode1+0xc4>
  286c65: 8b 45 0c                     	movl	12(%ebp), %eax
  286c68: 8b 55 fc                     	movl	-4(%ebp), %edx
  286c6b: 8b 4d 0c                     	movl	12(%ebp), %ecx
  286c6e: 29 ca                        	subl	%ecx, %edx
  286c70: ff 75 10                     	pushl	16(%ebp)
  286c73: ff 75 f8                     	pushl	-8(%ebp)
  286c76: 50                           	pushl	%eax
  286c77: 52                           	pushl	%edx
  286c78: e8 b6 fd ff ff               	calll	-586 <tek_lzrestore_stk1>
  286c7d: 83 c4 10                     	addl	$16, %esp
  286c80: eb 05                        	jmp	5 <tek_decode1+0xc4>
  286c82: b8 00 00 00 00               	movl	$0, %eax
  286c87: c9                           	leave
  286c88: c3                           	retl

00286c89 tek_getnum_s7:
  286c89: 55                           	pushl	%ebp
  286c8a: 89 e5                        	movl	%esp, %ebp
  286c8c: 83 ec 10                     	subl	$16, %esp
  286c8f: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  286c96: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  286c9d: c7 45 f4 01 00 00 00         	movl	$1, -12(%ebp)
  286ca4: 8b 45 08                     	movl	8(%ebp), %eax
  286ca7: 8b 00                        	movl	(%eax), %eax
  286ca9: 89 45 f0                     	movl	%eax, -16(%ebp)
  286cac: 8b 45 fc                     	movl	-4(%ebp), %eax
  286caf: c1 e0 07                     	shll	$7, %eax
  286cb2: 89 c1                        	movl	%eax, %ecx
  286cb4: 8b 45 f0                     	movl	-16(%ebp), %eax
  286cb7: 8d 50 01                     	leal	1(%eax), %edx
  286cba: 89 55 f0                     	movl	%edx, -16(%ebp)
  286cbd: 0f b6 00                     	movzbl	(%eax), %eax
  286cc0: 0f b6 c0                     	movzbl	%al, %eax
  286cc3: 09 c8                        	orl	%ecx, %eax
  286cc5: 89 45 fc                     	movl	%eax, -4(%ebp)
  286cc8: 8b 45 fc                     	movl	-4(%ebp), %eax
  286ccb: 83 e0 01                     	andl	$1, %eax
  286cce: 85 c0                        	testl	%eax, %eax
  286cd0: 75 0c                        	jne	12 <tek_getnum_s7+0x55>
  286cd2: c1 65 f4 07                  	shll	$7, -12(%ebp)
  286cd6: 8b 45 f4                     	movl	-12(%ebp), %eax
  286cd9: 01 45 f8                     	addl	%eax, -8(%ebp)
  286cdc: eb ce                        	jmp	-50 <tek_getnum_s7+0x23>
  286cde: 90                           	nop
  286cdf: d1 6d fc                     	shrl	-4(%ebp)
  286ce2: 8b 45 08                     	movl	8(%ebp), %eax
  286ce5: 8b 55 f0                     	movl	-16(%ebp), %edx
  286ce8: 89 10                        	movl	%edx, (%eax)
  286cea: 8b 55 fc                     	movl	-4(%ebp), %edx
  286ced: 8b 45 f8                     	movl	-8(%ebp), %eax
  286cf0: 01 d0                        	addl	%edx, %eax
  286cf2: c9                           	leave
  286cf3: c3                           	retl

00286cf4 tek_lzrestore_stk2:
  286cf4: 55                           	pushl	%ebp
  286cf5: 89 e5                        	movl	%esp, %ebp
  286cf7: 53                           	pushl	%ebx
  286cf8: 83 ec 30                     	subl	$48, %esp
  286cfb: 8b 55 10                     	movl	16(%ebp), %edx
  286cfe: 8b 45 14                     	movl	20(%ebp), %eax
  286d01: 01 d0                        	addl	%edx, %eax
  286d03: 89 45 e4                     	movl	%eax, -28(%ebp)
  286d06: 8b 45 0c                     	movl	12(%ebp), %eax
  286d09: 89 45 cc                     	movl	%eax, -52(%ebp)
  286d0c: 8b 45 14                     	movl	20(%ebp), %eax
  286d0f: 89 45 e0                     	movl	%eax, -32(%ebp)
  286d12: c7 45 ec 00 00 00 00         	movl	$0, -20(%ebp)
  286d19: eb 12                        	jmp	18 <tek_lzrestore_stk2+0x39>
  286d1b: 8b 45 ec                     	movl	-20(%ebp), %eax
  286d1e: f7 d0                        	notl	%eax
  286d20: 89 c2                        	movl	%eax, %edx
  286d22: 8b 45 ec                     	movl	-20(%ebp), %eax
  286d25: 89 54 85 d0                  	movl	%edx, -48(%ebp,%eax,4)
  286d29: 83 45 ec 01                  	addl	$1, -20(%ebp)
  286d2d: 83 7d ec 03                  	cmpl	$3, -20(%ebp)
  286d31: 7e e8                        	jle	-24 <tek_lzrestore_stk2+0x27>
  286d33: c6 45 ea 00                  	movb	$0, -22(%ebp)
  286d37: 0f b6 45 ea                  	movzbl	-22(%ebp), %eax
  286d3b: 88 45 eb                     	movb	%al, -21(%ebp)
  286d3e: 83 7d 10 00                  	cmpl	$0, 16(%ebp)
  286d42: 0f 84 50 02 00 00            	je	592 <tek_lzrestore_stk2+0x2a4>
  286d48: 8d 45 cc                     	leal	-52(%ebp), %eax
  286d4b: 50                           	pushl	%eax
  286d4c: e8 a7 fb ff ff               	calll	-1113 <tek_getnum_s7s>
  286d51: 83 c4 04                     	addl	$4, %esp
  286d54: 85 c0                        	testl	%eax, %eax
  286d56: 74 0a                        	je	10 <tek_lzrestore_stk2+0x6e>
  286d58: b8 01 00 00 00               	movl	$1, %eax
  286d5d: e9 43 02 00 00               	jmp	579 <tek_lzrestore_stk2+0x2b1>
  286d62: c7 45 ec 00 00 00 00         	movl	$0, -20(%ebp)
  286d69: 83 45 ec 01                  	addl	$1, -20(%ebp)
  286d6d: 83 7d ec 10                  	cmpl	$16, -20(%ebp)
  286d71: 7e 18                        	jle	24 <tek_lzrestore_stk2+0x97>
  286d73: 8d 45 cc                     	leal	-52(%ebp), %eax
  286d76: 50                           	pushl	%eax
  286d77: e8 7c fb ff ff               	calll	-1156 <tek_getnum_s7s>
  286d7c: 83 c4 04                     	addl	$4, %esp
  286d7f: 89 c2                        	movl	%eax, %edx
  286d81: 8b 45 ec                     	movl	-20(%ebp), %eax
  286d84: 01 d0                        	addl	%edx, %eax
  286d86: 89 45 ec                     	movl	%eax, -20(%ebp)
  286d89: eb 36                        	jmp	54 <tek_lzrestore_stk2+0xcd>
  286d8b: 80 7d ea 00                  	cmpb	$0, -22(%ebp)
  286d8f: 75 13                        	jne	19 <tek_lzrestore_stk2+0xb0>
  286d91: c6 45 ea 08                  	movb	$8, -22(%ebp)
  286d95: 8b 45 cc                     	movl	-52(%ebp), %eax
  286d98: 8d 50 01                     	leal	1(%eax), %edx
  286d9b: 89 55 cc                     	movl	%edx, -52(%ebp)
  286d9e: 0f b6 00                     	movzbl	(%eax), %eax
  286da1: 88 45 eb                     	movb	%al, -21(%ebp)
  286da4: 0f b6 45 ea                  	movzbl	-22(%ebp), %eax
  286da8: 83 e8 01                     	subl	$1, %eax
  286dab: 88 45 ea                     	movb	%al, -22(%ebp)
  286dae: 0f b6 45 eb                  	movzbl	-21(%ebp), %eax
  286db2: 83 e0 01                     	andl	$1, %eax
  286db5: 89 45 f0                     	movl	%eax, -16(%ebp)
  286db8: d0 6d eb                     	shrb	-21(%ebp)
  286dbb: 83 7d f0 00                  	cmpl	$0, -16(%ebp)
  286dbf: 74 a8                        	je	-88 <tek_lzrestore_stk2+0x75>
  286dc1: 8b 55 cc                     	movl	-52(%ebp), %edx
  286dc4: 8d 42 01                     	leal	1(%edx), %eax
  286dc7: 89 45 cc                     	movl	%eax, -52(%ebp)
  286dca: 8b 45 14                     	movl	20(%ebp), %eax
  286dcd: 8d 48 01                     	leal	1(%eax), %ecx
  286dd0: 89 4d 14                     	movl	%ecx, 20(%ebp)
  286dd3: 0f b6 12                     	movzbl	(%edx), %edx
  286dd6: 88 10                        	movb	%dl, (%eax)
  286dd8: 83 6d ec 01                  	subl	$1, -20(%ebp)
  286ddc: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
  286de0: 75 df                        	jne	-33 <tek_lzrestore_stk2+0xcd>
  286de2: 8b 45 14                     	movl	20(%ebp), %eax
  286de5: 3b 45 e4                     	cmpl	-28(%ebp), %eax
  286de8: 0f 83 a9 01 00 00            	jae	425 <tek_lzrestore_stk2+0x2a3>
  286dee: c7 45 ec 00 00 00 00         	movl	$0, -20(%ebp)
  286df5: 83 45 ec 01                  	addl	$1, -20(%ebp)
  286df9: 83 7d ec 10                  	cmpl	$16, -20(%ebp)
  286dfd: 7e 18                        	jle	24 <tek_lzrestore_stk2+0x123>
  286dff: 8d 45 cc                     	leal	-52(%ebp), %eax
  286e02: 50                           	pushl	%eax
  286e03: e8 f0 fa ff ff               	calll	-1296 <tek_getnum_s7s>
  286e08: 83 c4 04                     	addl	$4, %esp
  286e0b: 89 c2                        	movl	%eax, %edx
  286e0d: 8b 45 ec                     	movl	-20(%ebp), %eax
  286e10: 01 d0                        	addl	%edx, %eax
  286e12: 89 45 ec                     	movl	%eax, -20(%ebp)
  286e15: eb 36                        	jmp	54 <tek_lzrestore_stk2+0x159>
  286e17: 80 7d ea 00                  	cmpb	$0, -22(%ebp)
  286e1b: 75 13                        	jne	19 <tek_lzrestore_stk2+0x13c>
  286e1d: c6 45 ea 08                  	movb	$8, -22(%ebp)
  286e21: 8b 45 cc                     	movl	-52(%ebp), %eax
  286e24: 8d 50 01                     	leal	1(%eax), %edx
  286e27: 89 55 cc                     	movl	%edx, -52(%ebp)
  286e2a: 0f b6 00                     	movzbl	(%eax), %eax
  286e2d: 88 45 eb                     	movb	%al, -21(%ebp)
  286e30: 0f b6 45 ea                  	movzbl	-22(%ebp), %eax
  286e34: 83 e8 01                     	subl	$1, %eax
  286e37: 88 45 ea                     	movb	%al, -22(%ebp)
  286e3a: 0f b6 45 eb                  	movzbl	-21(%ebp), %eax
  286e3e: 83 e0 01                     	andl	$1, %eax
  286e41: 89 45 f0                     	movl	%eax, -16(%ebp)
  286e44: d0 6d eb                     	shrb	-21(%ebp)
  286e47: 83 7d f0 00                  	cmpl	$0, -16(%ebp)
  286e4b: 74 a8                        	je	-88 <tek_lzrestore_stk2+0x101>
  286e4d: 8b 45 cc                     	movl	-52(%ebp), %eax
  286e50: 8d 50 01                     	leal	1(%eax), %edx
  286e53: 89 55 cc                     	movl	%edx, -52(%ebp)
  286e56: 0f b6 00                     	movzbl	(%eax), %eax
  286e59: 0f b6 c0                     	movzbl	%al, %eax
  286e5c: 89 45 f0                     	movl	%eax, -16(%ebp)
  286e5f: 8b 45 f0                     	movl	-16(%ebp), %eax
  286e62: c1 f8 04                     	sarl	$4, %eax
  286e65: 89 45 f8                     	movl	%eax, -8(%ebp)
  286e68: 83 65 f0 0f                  	andl	$15, -16(%ebp)
  286e6c: 8b 45 f0                     	movl	-16(%ebp), %eax
  286e6f: 83 e0 01                     	andl	$1, %eax
  286e72: 85 c0                        	testl	%eax, %eax
  286e74: 75 1c                        	jne	28 <tek_lzrestore_stk2+0x19e>
  286e76: 8d 45 cc                     	leal	-52(%ebp), %eax
  286e79: 50                           	pushl	%eax
  286e7a: e8 0a fe ff ff               	calll	-502 <tek_getnum_s7>
  286e7f: 83 c4 04                     	addl	$4, %esp
  286e82: 83 c0 01                     	addl	$1, %eax
  286e85: c1 e0 04                     	shll	$4, %eax
  286e88: 89 c2                        	movl	%eax, %edx
  286e8a: 8b 45 f0                     	movl	-16(%ebp), %eax
  286e8d: 09 d0                        	orl	%edx, %eax
  286e8f: 89 45 f0                     	movl	%eax, -16(%ebp)
  286e92: d1 7d f0                     	sarl	-16(%ebp)
  286e95: 8b 45 f0                     	movl	-16(%ebp), %eax
  286e98: 83 e8 06                     	subl	$6, %eax
  286e9b: f7 d0                        	notl	%eax
  286e9d: 89 45 f4                     	movl	%eax, -12(%ebp)
  286ea0: 83 7d f0 03                  	cmpl	$3, -16(%ebp)
  286ea4: 7f 0a                        	jg	10 <tek_lzrestore_stk2+0x1bc>
  286ea6: 8b 45 f0                     	movl	-16(%ebp), %eax
  286ea9: 8b 44 85 d0                  	movl	-48(%ebp,%eax,4), %eax
  286ead: 89 45 f4                     	movl	%eax, -12(%ebp)
  286eb0: 83 7d f0 04                  	cmpl	$4, -16(%ebp)
  286eb4: 75 1b                        	jne	27 <tek_lzrestore_stk2+0x1dd>
  286eb6: 8b 45 d0                     	movl	-48(%ebp), %eax
  286eb9: 89 c3                        	movl	%eax, %ebx
  286ebb: 8d 45 cc                     	leal	-52(%ebp), %eax
  286ebe: 50                           	pushl	%eax
  286ebf: e8 c5 fd ff ff               	calll	-571 <tek_getnum_s7>
  286ec4: 83 c4 04                     	addl	$4, %esp
  286ec7: 29 c3                        	subl	%eax, %ebx
  286ec9: 89 d8                        	movl	%ebx, %eax
  286ecb: 83 e8 01                     	subl	$1, %eax
  286ece: 89 45 f4                     	movl	%eax, -12(%ebp)
  286ed1: 83 7d f0 05                  	cmpl	$5, -16(%ebp)
  286ed5: 75 19                        	jne	25 <tek_lzrestore_stk2+0x1fc>
  286ed7: 8b 45 d0                     	movl	-48(%ebp), %eax
  286eda: 89 c3                        	movl	%eax, %ebx
  286edc: 8d 45 cc                     	leal	-52(%ebp), %eax
  286edf: 50                           	pushl	%eax
  286ee0: e8 a4 fd ff ff               	calll	-604 <tek_getnum_s7>
  286ee5: 83 c4 04                     	addl	$4, %esp
  286ee8: 01 d8                        	addl	%ebx, %eax
  286eea: 83 c0 01                     	addl	$1, %eax
  286eed: 89 45 f4                     	movl	%eax, -12(%ebp)
  286ef0: 83 7d f8 00                  	cmpl	$0, -8(%ebp)
  286ef4: 75 12                        	jne	18 <tek_lzrestore_stk2+0x214>
  286ef6: 8d 45 cc                     	leal	-52(%ebp), %eax
  286ef9: 50                           	pushl	%eax
  286efa: e8 8a fd ff ff               	calll	-630 <tek_getnum_s7>
  286eff: 83 c4 04                     	addl	$4, %esp
  286f02: 83 c0 10                     	addl	$16, %eax
  286f05: 89 45 f8                     	movl	%eax, -8(%ebp)
  286f08: 83 45 f8 01                  	addl	$1, -8(%ebp)
  286f0c: 83 7d f0 00                  	cmpl	$0, -16(%ebp)
  286f10: 7e 24                        	jle	36 <tek_lzrestore_stk2+0x242>
  286f12: 83 7d f0 01                  	cmpl	$1, -16(%ebp)
  286f16: 7e 12                        	jle	18 <tek_lzrestore_stk2+0x236>
  286f18: 83 7d f0 02                  	cmpl	$2, -16(%ebp)
  286f1c: 7e 06                        	jle	6 <tek_lzrestore_stk2+0x230>
  286f1e: 8b 45 d8                     	movl	-40(%ebp), %eax
  286f21: 89 45 dc                     	movl	%eax, -36(%ebp)
  286f24: 8b 45 d4                     	movl	-44(%ebp), %eax
  286f27: 89 45 d8                     	movl	%eax, -40(%ebp)
  286f2a: 8b 45 d0                     	movl	-48(%ebp), %eax
  286f2d: 89 45 d4                     	movl	%eax, -44(%ebp)
  286f30: 8b 45 f4                     	movl	-12(%ebp), %eax
  286f33: 89 45 d0                     	movl	%eax, -48(%ebp)
  286f36: 8b 55 f4                     	movl	-12(%ebp), %edx
  286f39: 8b 45 14                     	movl	20(%ebp), %eax
  286f3c: 01 d0                        	addl	%edx, %eax
  286f3e: 39 45 e0                     	cmpl	%eax, -32(%ebp)
  286f41: 77 5c                        	ja	92 <tek_lzrestore_stk2+0x2ab>
  286f43: 8b 55 f8                     	movl	-8(%ebp), %edx
  286f46: 8b 45 14                     	movl	20(%ebp), %eax
  286f49: 01 d0                        	addl	%edx, %eax
  286f4b: 39 45 e4                     	cmpl	%eax, -28(%ebp)
  286f4e: 73 0d                        	jae	13 <tek_lzrestore_stk2+0x269>
  286f50: 8b 55 e4                     	movl	-28(%ebp), %edx
  286f53: 8b 45 14                     	movl	20(%ebp), %eax
  286f56: 29 c2                        	subl	%eax, %edx
  286f58: 89 d0                        	movl	%edx, %eax
  286f5a: 89 45 f8                     	movl	%eax, -8(%ebp)
  286f5d: 8b 55 f4                     	movl	-12(%ebp), %edx
  286f60: 8b 45 14                     	movl	20(%ebp), %eax
  286f63: 01 d0                        	addl	%edx, %eax
  286f65: 0f b6 10                     	movzbl	(%eax), %edx
  286f68: 8b 45 14                     	movl	20(%ebp), %eax
  286f6b: 88 10                        	movb	%dl, (%eax)
  286f6d: 83 45 14 01                  	addl	$1, 20(%ebp)
  286f71: 83 6d f8 01                  	subl	$1, -8(%ebp)
  286f75: 83 7d f8 00                  	cmpl	$0, -8(%ebp)
  286f79: 75 e2                        	jne	-30 <tek_lzrestore_stk2+0x269>
  286f7b: 83 6d ec 01                  	subl	$1, -20(%ebp)
  286f7f: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
  286f83: 0f 85 c4 fe ff ff            	jne	-316 <tek_lzrestore_stk2+0x159>
  286f89: 8b 45 14                     	movl	20(%ebp), %eax
  286f8c: 3b 45 e4                     	cmpl	-28(%ebp), %eax
  286f8f: 0f 82 cd fd ff ff            	jb	-563 <tek_lzrestore_stk2+0x6e>
  286f95: eb 01                        	jmp	1 <tek_lzrestore_stk2+0x2a4>
  286f97: 90                           	nop
  286f98: b8 00 00 00 00               	movl	$0, %eax
  286f9d: eb 06                        	jmp	6 <tek_lzrestore_stk2+0x2b1>
  286f9f: 90                           	nop
  286fa0: b8 01 00 00 00               	movl	$1, %eax
  286fa5: 8b 5d fc                     	movl	-4(%ebp), %ebx
  286fa8: c9                           	leave
  286fa9: c3                           	retl

00286faa tek_decode2:
  286faa: 55                           	pushl	%ebp
  286fab: 89 e5                        	movl	%esp, %ebp
  286fad: 83 ec 20                     	subl	$32, %esp
  286fb0: 8b 55 0c                     	movl	12(%ebp), %edx
  286fb3: 8b 45 08                     	movl	8(%ebp), %eax
  286fb6: 01 d0                        	addl	%edx, %eax
  286fb8: 89 45 f8                     	movl	%eax, -8(%ebp)
  286fbb: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  286fc2: 8b 45 0c                     	movl	12(%ebp), %eax
  286fc5: 83 c0 10                     	addl	$16, %eax
  286fc8: 89 45 0c                     	movl	%eax, 12(%ebp)
  286fcb: 8d 45 0c                     	leal	12(%ebp), %eax
  286fce: 50                           	pushl	%eax
  286fcf: e8 24 f9 ff ff               	calll	-1756 <tek_getnum_s7s>
  286fd4: 83 c4 04                     	addl	$4, %esp
  286fd7: 89 45 f4                     	movl	%eax, -12(%ebp)
  286fda: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
  286fde: 7e 76                        	jle	118 <tek_decode2+0xac>
  286fe0: 8d 45 0c                     	leal	12(%ebp), %eax
  286fe3: 50                           	pushl	%eax
  286fe4: e8 0f f9 ff ff               	calll	-1777 <tek_getnum_s7s>
  286fe9: 83 c4 04                     	addl	$4, %esp
  286fec: 89 45 f0                     	movl	%eax, -16(%ebp)
  286fef: 8b 45 f0                     	movl	-16(%ebp), %eax
  286ff2: d1 f8                        	sarl	%eax
  286ff4: 83 e0 0f                     	andl	$15, %eax
  286ff7: 83 c0 08                     	addl	$8, %eax
  286ffa: ba 01 00 00 00               	movl	$1, %edx
  286fff: 89 c1                        	movl	%eax, %ecx
  287001: d3 e2                        	shll	%cl, %edx
  287003: 89 d0                        	movl	%edx, %eax
  287005: 89 45 ec                     	movl	%eax, -20(%ebp)
  287008: 8b 45 f4                     	movl	-12(%ebp), %eax
  28700b: 3b 45 ec                     	cmpl	-20(%ebp), %eax
  28700e: 7f 0b                        	jg	11 <tek_decode2+0x71>
  287010: 8b 45 f0                     	movl	-16(%ebp), %eax
  287013: 83 e0 21                     	andl	$33, %eax
  287016: 83 f8 01                     	cmpl	$1, %eax
  287019: 74 07                        	je	7 <tek_decode2+0x78>
  28701b: b8 01 00 00 00               	movl	$1, %eax
  287020: eb 37                        	jmp	55 <tek_decode2+0xaf>
  287022: 8b 45 f0                     	movl	-16(%ebp), %eax
  287025: 83 e0 40                     	andl	$64, %eax
  287028: 85 c0                        	testl	%eax, %eax
  28702a: 74 0c                        	je	12 <tek_decode2+0x8e>
  28702c: 8d 45 0c                     	leal	12(%ebp), %eax
  28702f: 50                           	pushl	%eax
  287030: e8 c3 f8 ff ff               	calll	-1853 <tek_getnum_s7s>
  287035: 83 c4 04                     	addl	$4, %esp
  287038: 8b 45 0c                     	movl	12(%ebp), %eax
  28703b: 8b 55 f8                     	movl	-8(%ebp), %edx
  28703e: 8b 4d 0c                     	movl	12(%ebp), %ecx
  287041: 29 ca                        	subl	%ecx, %edx
  287043: ff 75 10                     	pushl	16(%ebp)
  287046: ff 75 f4                     	pushl	-12(%ebp)
  287049: 50                           	pushl	%eax
  28704a: 52                           	pushl	%edx
  28704b: e8 a4 fc ff ff               	calll	-860 <tek_lzrestore_stk2>
  287050: 83 c4 10                     	addl	$16, %esp
  287053: 89 45 fc                     	movl	%eax, -4(%ebp)
  287056: 8b 45 fc                     	movl	-4(%ebp), %eax
  287059: c9                           	leave
  28705a: c3                           	retl

0028705b tek_lzrestore_tek5:
  28705b: 55                           	pushl	%ebp
  28705c: 89 e5                        	movl	%esp, %ebp
  28705e: 83 ec 28                     	subl	$40, %esp
  287061: 8b 45 0c                     	movl	12(%ebp), %eax
  287064: 0f b6 00                     	movzbl	(%eax), %eax
  287067: 0f b6 c0                     	movzbl	%al, %eax
  28706a: 89 45 e8                     	movl	%eax, -24(%ebp)
  28706d: 8b 45 e8                     	movl	-24(%ebp), %eax
  287070: 83 e0 0f                     	andl	$15, %eax
  287073: 89 45 e4                     	movl	%eax, -28(%ebp)
  287076: 83 7d e4 01                  	cmpl	$1, -28(%ebp)
  28707a: 75 09                        	jne	9 <tek_lzrestore_tek5+0x2a>
  28707c: c7 45 ec ff ff ff ff         	movl	$4294967295, -20(%ebp)
  287083: eb 28                        	jmp	40 <tek_lzrestore_tek5+0x52>
  287085: 83 7d e4 05                  	cmpl	$5, -28(%ebp)
  287089: 75 09                        	jne	9 <tek_lzrestore_tek5+0x39>
  28708b: c7 45 ec fe ff ff ff         	movl	$4294967294, -20(%ebp)
  287092: eb 19                        	jmp	25 <tek_lzrestore_tek5+0x52>
  287094: 83 7d e4 09                  	cmpl	$9, -28(%ebp)
  287098: 75 09                        	jne	9 <tek_lzrestore_tek5+0x48>
  28709a: c7 45 ec 00 00 00 00         	movl	$0, -20(%ebp)
  2870a1: eb 0a                        	jmp	10 <tek_lzrestore_tek5+0x52>
  2870a3: b8 01 00 00 00               	movl	$1, %eax
  2870a8: e9 a4 01 00 00               	jmp	420 <tek_lzrestore_tek5+0x1f6>
  2870ad: 83 45 0c 01                  	addl	$1, 12(%ebp)
  2870b1: c1 7d e8 04                  	sarl	$4, -24(%ebp)
  2870b5: 83 7d e8 00                  	cmpl	$0, -24(%ebp)
  2870b9: 75 14                        	jne	20 <tek_lzrestore_tek5+0x74>
  2870bb: 8b 45 0c                     	movl	12(%ebp), %eax
  2870be: 8d 50 01                     	leal	1(%eax), %edx
  2870c1: 89 55 0c                     	movl	%edx, 12(%ebp)
  2870c4: 0f b6 00                     	movzbl	(%eax), %eax
  2870c7: 0f b6 c0                     	movzbl	%al, %eax
  2870ca: 89 45 e8                     	movl	%eax, -24(%ebp)
  2870cd: eb 4e                        	jmp	78 <tek_lzrestore_tek5+0xc2>
  2870cf: 83 7d ec ff                  	cmpl	$-1, -20(%ebp)
  2870d3: 75 25                        	jne	37 <tek_lzrestore_tek5+0x9f>
  2870d5: 83 7d e8 02                  	cmpl	$2, -24(%ebp)
  2870d9: 7e 0a                        	jle	10 <tek_lzrestore_tek5+0x8a>
  2870db: b8 01 00 00 00               	movl	$1, %eax
  2870e0: e9 6c 01 00 00               	jmp	364 <tek_lzrestore_tek5+0x1f6>
  2870e5: 8b 45 e8                     	movl	-24(%ebp), %eax
  2870e8: 83 e8 01                     	subl	$1, %eax
  2870eb: 0f b6 80 6f 14 31 00         	movzbl	3216495(%eax), %eax
  2870f2: 0f b6 c0                     	movzbl	%al, %eax
  2870f5: 89 45 e8                     	movl	%eax, -24(%ebp)
  2870f8: eb 23                        	jmp	35 <tek_lzrestore_tek5+0xc2>
  2870fa: 83 7d e8 01                  	cmpl	$1, -24(%ebp)
  2870fe: 7e 0a                        	jle	10 <tek_lzrestore_tek5+0xaf>
  287100: b8 01 00 00 00               	movl	$1, %eax
  287105: e9 47 01 00 00               	jmp	327 <tek_lzrestore_tek5+0x1f6>
  28710a: 8b 45 e8                     	movl	-24(%ebp), %eax
  28710d: 83 e8 01                     	subl	$1, %eax
  287110: 0f b6 80 d0 14 31 00         	movzbl	3216592(%eax), %eax
  287117: 0f b6 c0                     	movzbl	%al, %eax
  28711a: 89 45 e8                     	movl	%eax, -24(%ebp)
  28711d: 8b 4d e8                     	movl	-24(%ebp), %ecx
  287120: ba b7 60 0b b6               	movl	$3054198967, %edx
  287125: 89 c8                        	movl	%ecx, %eax
  287127: f7 ea                        	imull	%edx
  287129: 8d 04 0a                     	leal	(%edx,%ecx), %eax
  28712c: c1 f8 05                     	sarl	$5, %eax
  28712f: 89 c2                        	movl	%eax, %edx
  287131: 89 c8                        	movl	%ecx, %eax
  287133: c1 f8 1f                     	sarl	$31, %eax
  287136: 29 c2                        	subl	%eax, %edx
  287138: 89 d0                        	movl	%edx, %eax
  28713a: 89 45 f4                     	movl	%eax, -12(%ebp)
  28713d: 8b 4d e8                     	movl	-24(%ebp), %ecx
  287140: ba b7 60 0b b6               	movl	$3054198967, %edx
  287145: 89 c8                        	movl	%ecx, %eax
  287147: f7 ea                        	imull	%edx
  287149: 8d 04 0a                     	leal	(%edx,%ecx), %eax
  28714c: c1 f8 05                     	sarl	$5, %eax
  28714f: 89 c2                        	movl	%eax, %edx
  287151: 89 c8                        	movl	%ecx, %eax
  287153: c1 f8 1f                     	sarl	$31, %eax
  287156: 29 c2                        	subl	%eax, %edx
  287158: 89 d0                        	movl	%edx, %eax
  28715a: 6b c0 2d                     	imull	$45, %eax, %eax
  28715d: 29 c1                        	subl	%eax, %ecx
  28715f: 89 c8                        	movl	%ecx, %eax
  287161: 89 45 e8                     	movl	%eax, -24(%ebp)
  287164: 8b 4d e8                     	movl	-24(%ebp), %ecx
  287167: ba 39 8e e3 38               	movl	$954437177, %edx
  28716c: 89 c8                        	movl	%ecx, %eax
  28716e: f7 ea                        	imull	%edx
  287170: d1 fa                        	sarl	%edx
  287172: 89 c8                        	movl	%ecx, %eax
  287174: c1 f8 1f                     	sarl	$31, %eax
  287177: 29 c2                        	subl	%eax, %edx
  287179: 89 d0                        	movl	%edx, %eax
  28717b: 89 45 f0                     	movl	%eax, -16(%ebp)
  28717e: 8b 4d e8                     	movl	-24(%ebp), %ecx
  287181: ba 39 8e e3 38               	movl	$954437177, %edx
  287186: 89 c8                        	movl	%ecx, %eax
  287188: f7 ea                        	imull	%edx
  28718a: d1 fa                        	sarl	%edx
  28718c: 89 c8                        	movl	%ecx, %eax
  28718e: c1 f8 1f                     	sarl	$31, %eax
  287191: 29 c2                        	subl	%eax, %edx
  287193: 89 d0                        	movl	%edx, %eax
  287195: c1 e0 03                     	shll	$3, %eax
  287198: 01 d0                        	addl	%edx, %eax
  28719a: 29 c1                        	subl	%eax, %ecx
  28719c: 89 c8                        	movl	%ecx, %eax
  28719e: 89 45 e0                     	movl	%eax, -32(%ebp)
  2871a1: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
  2871a5: 75 12                        	jne	18 <tek_lzrestore_tek5+0x15e>
  2871a7: 8b 45 0c                     	movl	12(%ebp), %eax
  2871aa: 8d 50 01                     	leal	1(%eax), %edx
  2871ad: 89 55 0c                     	movl	%edx, 12(%ebp)
  2871b0: 0f b6 00                     	movzbl	(%eax), %eax
  2871b3: 0f b6 c0                     	movzbl	%al, %eax
  2871b6: 89 45 ec                     	movl	%eax, -20(%ebp)
  2871b9: 83 7d ec ff                  	cmpl	$-1, -20(%ebp)
  2871bd: 75 12                        	jne	18 <tek_lzrestore_tek5+0x176>
  2871bf: 8b 45 f4                     	movl	-12(%ebp), %eax
  2871c2: 89 45 dc                     	movl	%eax, -36(%ebp)
  2871c5: 8b 45 f0                     	movl	-16(%ebp), %eax
  2871c8: 89 45 f4                     	movl	%eax, -12(%ebp)
  2871cb: 8b 45 dc                     	movl	-36(%ebp), %eax
  2871ce: 89 45 f0                     	movl	%eax, -16(%ebp)
  2871d1: 8b 55 e0                     	movl	-32(%ebp), %edx
  2871d4: 8b 45 f4                     	movl	-12(%ebp), %eax
  2871d7: 01 d0                        	addl	%edx, %eax
  2871d9: ba 00 03 00 00               	movl	$768, %edx
  2871de: 89 c1                        	movl	%eax, %ecx
  2871e0: d3 e2                        	shll	%cl, %edx
  2871e2: 89 d0                        	movl	%edx, %eax
  2871e4: 05 c0 09 00 00               	addl	$2496, %eax
  2871e9: c1 e0 02                     	shll	$2, %eax
  2871ec: 89 45 dc                     	movl	%eax, -36(%ebp)
  2871ef: 8b 45 dc                     	movl	-36(%ebp), %eax
  2871f2: 83 ec 08                     	subl	$8, %esp
  2871f5: 50                           	pushl	%eax
  2871f6: 68 00 00 3c 00               	pushl	$3932160
  2871fb: e8 58 b6 ff ff               	calll	-18856 <memman_alloc_4k>
  287200: 83 c4 10                     	addl	$16, %esp
  287203: 89 45 d8                     	movl	%eax, -40(%ebp)
  287206: 83 7d d8 00                  	cmpl	$0, -40(%ebp)
  28720a: 75 07                        	jne	7 <tek_lzrestore_tek5+0x1b8>
  28720c: b8 ff ff ff ff               	movl	$4294967295, %eax
  287211: eb 3e                        	jmp	62 <tek_lzrestore_tek5+0x1f6>
  287213: ff 75 ec                     	pushl	-20(%ebp)
  287216: ff 75 f4                     	pushl	-12(%ebp)
  287219: ff 75 f0                     	pushl	-16(%ebp)
  28721c: ff 75 e0                     	pushl	-32(%ebp)
  28721f: ff 75 14                     	pushl	20(%ebp)
  287222: ff 75 10                     	pushl	16(%ebp)
  287225: ff 75 0c                     	pushl	12(%ebp)
  287228: ff 75 d8                     	pushl	-40(%ebp)
  28722b: e8 a3 06 00 00               	calll	1699 <tek_decmain5>
  287230: 83 c4 20                     	addl	$32, %esp
  287233: 89 45 ec                     	movl	%eax, -20(%ebp)
  287236: 8b 55 dc                     	movl	-36(%ebp), %edx
  287239: 8b 45 d8                     	movl	-40(%ebp), %eax
  28723c: 83 ec 04                     	subl	$4, %esp
  28723f: 52                           	pushl	%edx
  287240: 50                           	pushl	%eax
  287241: 68 00 00 3c 00               	pushl	$3932160
  287246: e8 39 b6 ff ff               	calll	-18887 <memman_free_4k>
  28724b: 83 c4 10                     	addl	$16, %esp
  28724e: 8b 45 ec                     	movl	-20(%ebp), %eax
  287251: c9                           	leave
  287252: c3                           	retl

00287253 tek_setbm5:
  287253: 55                           	pushl	%ebp
  287254: 89 e5                        	movl	%esp, %ebp
  287256: 53                           	pushl	%ebx
  287257: 8b 45 0c                     	movl	12(%ebp), %eax
  28725a: 89 c2                        	movl	%eax, %edx
  28725c: 8b 45 08                     	movl	8(%ebp), %eax
  28725f: 88 10                        	movb	%dl, (%eax)
  287261: 8b 45 10                     	movl	16(%ebp), %eax
  287264: 89 c2                        	movl	%eax, %edx
  287266: 8b 45 08                     	movl	8(%ebp), %eax
  287269: 88 50 01                     	movb	%dl, 1(%eax)
  28726c: 8b 55 10                     	movl	16(%ebp), %edx
  28726f: 8b 45 0c                     	movl	12(%ebp), %eax
  287272: 01 d0                        	addl	%edx, %eax
  287274: ba ff ff ff ff               	movl	$4294967295, %edx
  287279: 89 c1                        	movl	%eax, %ecx
  28727b: d3 e2                        	shll	%cl, %edx
  28727d: 89 d0                        	movl	%edx, %eax
  28727f: 89 c2                        	movl	%eax, %edx
  287281: 8b 45 08                     	movl	8(%ebp), %eax
  287284: 89 50 08                     	movl	%edx, 8(%eax)
  287287: 8b 45 08                     	movl	8(%ebp), %eax
  28728a: 8b 40 08                     	movl	8(%eax), %eax
  28728d: f7 d0                        	notl	%eax
  28728f: 89 c2                        	movl	%eax, %edx
  287291: 8b 45 08                     	movl	8(%ebp), %eax
  287294: 89 50 04                     	movl	%edx, 4(%eax)
  287297: 8b 45 08                     	movl	8(%ebp), %eax
  28729a: 8b 50 08                     	movl	8(%eax), %edx
  28729d: 8b 45 0c                     	movl	12(%ebp), %eax
  2872a0: bb 01 00 00 00               	movl	$1, %ebx
  2872a5: 89 c1                        	movl	%eax, %ecx
  2872a7: d3 e3                        	shll	%cl, %ebx
  2872a9: 89 d8                        	movl	%ebx, %eax
  2872ab: 09 c2                        	orl	%eax, %edx
  2872ad: 8b 45 08                     	movl	8(%ebp), %eax
  2872b0: 89 50 08                     	movl	%edx, 8(%eax)
  2872b3: 8b 45 0c                     	movl	12(%ebp), %eax
  2872b6: ba ff ff ff ff               	movl	$4294967295, %edx
  2872bb: 89 c1                        	movl	%eax, %ecx
  2872bd: d3 e2                        	shll	%cl, %edx
  2872bf: 89 d0                        	movl	%edx, %eax
  2872c1: 0f b7 d0                     	movzwl	%ax, %edx
  2872c4: 8b 45 08                     	movl	8(%ebp), %eax
  2872c7: 89 50 0c                     	movl	%edx, 12(%eax)
  2872ca: 8b 45 08                     	movl	8(%ebp), %eax
  2872cd: 8b 50 04                     	movl	4(%eax), %edx
  2872d0: 8b 45 08                     	movl	8(%ebp), %eax
  2872d3: 8b 40 0c                     	movl	12(%eax), %eax
  2872d6: 21 c2                        	andl	%eax, %edx
  2872d8: 8b 45 08                     	movl	8(%ebp), %eax
  2872db: 89 50 04                     	movl	%edx, 4(%eax)
  2872de: 8b 45 08                     	movl	8(%ebp), %eax
  2872e1: 8b 50 08                     	movl	8(%eax), %edx
  2872e4: 8b 45 08                     	movl	8(%ebp), %eax
  2872e7: 8b 40 0c                     	movl	12(%eax), %eax
  2872ea: 21 c2                        	andl	%eax, %edx
  2872ec: 8b 45 08                     	movl	8(%ebp), %eax
  2872ef: 89 50 08                     	movl	%edx, 8(%eax)
  2872f2: 8b 45 08                     	movl	8(%ebp), %eax
  2872f5: 8b 40 0c                     	movl	12(%eax), %eax
  2872f8: f7 d0                        	notl	%eax
  2872fa: 89 c2                        	movl	%eax, %edx
  2872fc: 8b 45 08                     	movl	8(%ebp), %eax
  2872ff: 89 50 10                     	movl	%edx, 16(%eax)
  287302: 90                           	nop
  287303: 5b                           	popl	%ebx
  287304: 5d                           	popl	%ebp
  287305: c3                           	retl

00287306 tek_rdget0:
  287306: 55                           	pushl	%ebp
  287307: 89 e5                        	movl	%esp, %ebp
  287309: 53                           	pushl	%ebx
  28730a: eb 39                        	jmp	57 <tek_rdget0+0x3f>
  28730c: 8b 45 08                     	movl	8(%ebp), %eax
  28730f: 8b 40 04                     	movl	4(%eax), %eax
  287312: c1 e0 08                     	shll	$8, %eax
  287315: 89 c2                        	movl	%eax, %edx
  287317: 8b 45 08                     	movl	8(%ebp), %eax
  28731a: 89 50 04                     	movl	%edx, 4(%eax)
  28731d: 8b 45 08                     	movl	8(%ebp), %eax
  287320: 8b 40 08                     	movl	8(%eax), %eax
  287323: c1 e0 08                     	shll	$8, %eax
  287326: 89 c3                        	movl	%eax, %ebx
  287328: 8b 45 08                     	movl	8(%ebp), %eax
  28732b: 8b 00                        	movl	(%eax), %eax
  28732d: 8d 48 01                     	leal	1(%eax), %ecx
  287330: 8b 55 08                     	movl	8(%ebp), %edx
  287333: 89 0a                        	movl	%ecx, (%edx)
  287335: 0f b6 00                     	movzbl	(%eax), %eax
  287338: 0f b6 c0                     	movzbl	%al, %eax
  28733b: 09 c3                        	orl	%eax, %ebx
  28733d: 89 da                        	movl	%ebx, %edx
  28733f: 8b 45 08                     	movl	8(%ebp), %eax
  287342: 89 50 08                     	movl	%edx, 8(%eax)
  287345: 8b 45 08                     	movl	8(%ebp), %eax
  287348: 8b 40 04                     	movl	4(%eax), %eax
  28734b: 3d ff ff ff 00               	cmpl	$16777215, %eax
  287350: 76 ba                        	jbe	-70 <tek_rdget0+0x6>
  287352: 8b 45 08                     	movl	8(%ebp), %eax
  287355: 8b 40 04                     	movl	4(%eax), %eax
  287358: d1 e8                        	shrl	%eax
  28735a: 89 c2                        	movl	%eax, %edx
  28735c: 8b 45 08                     	movl	8(%ebp), %eax
  28735f: 89 50 04                     	movl	%edx, 4(%eax)
  287362: d1 65 10                     	shll	16(%ebp)
  287365: 8b 45 08                     	movl	8(%ebp), %eax
  287368: 8b 50 08                     	movl	8(%eax), %edx
  28736b: 8b 45 08                     	movl	8(%ebp), %eax
  28736e: 8b 40 04                     	movl	4(%eax), %eax
  287371: 39 c2                        	cmpl	%eax, %edx
  287373: 72 18                        	jb	24 <tek_rdget0+0x87>
  287375: 8b 45 08                     	movl	8(%ebp), %eax
  287378: 8b 50 08                     	movl	8(%eax), %edx
  28737b: 8b 45 08                     	movl	8(%ebp), %eax
  28737e: 8b 40 04                     	movl	4(%eax), %eax
  287381: 29 c2                        	subl	%eax, %edx
  287383: 8b 45 08                     	movl	8(%ebp), %eax
  287386: 89 50 08                     	movl	%edx, 8(%eax)
  287389: 83 4d 10 01                  	orl	$1, 16(%ebp)
  28738d: 83 6d 0c 01                  	subl	$1, 12(%ebp)
  287391: 83 7d 0c 00                  	cmpl	$0, 12(%ebp)
  287395: 75 ae                        	jne	-82 <tek_rdget0+0x3f>
  287397: 8b 45 10                     	movl	16(%ebp), %eax
  28739a: f7 d0                        	notl	%eax
  28739c: 5b                           	popl	%ebx
  28739d: 5d                           	popl	%ebp
  28739e: c3                           	retl

0028739f tek_rdget1:
  28739f: 55                           	pushl	%ebp
  2873a0: 89 e5                        	movl	%esp, %ebp
  2873a2: 57                           	pushl	%edi
  2873a3: 56                           	pushl	%esi
  2873a4: 53                           	pushl	%ebx
  2873a5: 83 ec 2c                     	subl	$44, %esp
  2873a8: 8b 45 10                     	movl	16(%ebp), %eax
  2873ab: c1 f8 04                     	sarl	$4, %eax
  2873ae: 89 45 e0                     	movl	%eax, -32(%ebp)
  2873b1: 83 65 10 0f                  	andl	$15, 16(%ebp)
  2873b5: 8b 45 14                     	movl	20(%ebp), %eax
  2873b8: c1 e0 02                     	shll	$2, %eax
  2873bb: f7 d8                        	negl	%eax
  2873bd: 01 45 0c                     	addl	%eax, 12(%ebp)
  2873c0: 8b 45 14                     	movl	20(%ebp), %eax
  2873c3: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
  2873ca: 8b 45 0c                     	movl	12(%ebp), %eax
  2873cd: 01 d0                        	addl	%edx, %eax
  2873cf: 89 45 dc                     	movl	%eax, -36(%ebp)
  2873d2: 8b 45 dc                     	movl	-36(%ebp), %eax
  2873d5: 8b 00                        	movl	(%eax), %eax
  2873d7: 89 45 e4                     	movl	%eax, -28(%ebp)
  2873da: 8b 45 18                     	movl	24(%ebp), %eax
  2873dd: 8b 40 14                     	movl	20(%eax), %eax
  2873e0: 85 c0                        	testl	%eax, %eax
  2873e2: 0f 84 bc 01 00 00            	je	444 <tek_rdget1+0x205>
  2873e8: 8b 45 18                     	movl	24(%ebp), %eax
  2873eb: 8b 40 14                     	movl	20(%eax), %eax
  2873ee: 8d 50 ff                     	leal	-1(%eax), %edx
  2873f1: 8b 45 18                     	movl	24(%ebp), %eax
  2873f4: 89 50 14                     	movl	%edx, 20(%eax)
  2873f7: 8b 45 18                     	movl	24(%ebp), %eax
  2873fa: 8b 40 14                     	movl	20(%eax), %eax
  2873fd: 85 c0                        	testl	%eax, %eax
  2873ff: 0f 85 1a 01 00 00            	jne	282 <tek_rdget1+0x180>
  287405: 8b 45 08                     	movl	8(%ebp), %eax
  287408: 8d 50 7c                     	leal	124(%eax), %edx
  28740b: 8b 45 08                     	movl	8(%ebp), %eax
  28740e: 05 98 24 00 00               	addl	$9368, %eax
  287413: 83 ec 0c                     	subl	$12, %esp
  287416: 52                           	pushl	%edx
  287417: 6a 00                        	pushl	$0
  287419: 6a 71                        	pushl	$113
  28741b: 50                           	pushl	%eax
  28741c: ff 75 08                     	pushl	8(%ebp)
  28741f: e8 7b ff ff ff               	calll	-133 <tek_rdget1>
  287424: 83 c4 20                     	addl	$32, %esp
  287427: 85 c0                        	testl	%eax, %eax
  287429: 75 14                        	jne	20 <tek_rdget1+0xa0>
  28742b: 90                           	nop
  28742c: eb 01                        	jmp	1 <tek_rdget1+0x90>
  28742e: 90                           	nop
  28742f: 8b 45 08                     	movl	8(%ebp), %eax
  287432: 83 c0 10                     	addl	$16, %eax
  287435: 8b 50 04                     	movl	4(%eax), %edx
  287438: 8b 28                        	movl	(%eax), %ebp
  28743a: 8b 60 08                     	movl	8(%eax), %esp
  28743d: ff e2                        	jmpl	*%edx
  28743f: 8b 45 18                     	movl	24(%ebp), %eax
  287442: 8b 55 08                     	movl	8(%ebp), %edx
  287445: 83 c2 1c                     	addl	$28, %edx
  287448: 29 d0                        	subl	%edx, %eax
  28744a: c1 f8 05                     	sarl	$5, %eax
  28744d: 89 45 d8                     	movl	%eax, -40(%ebp)
  287450: 8b 45 08                     	movl	8(%ebp), %eax
  287453: 8d 50 3c                     	leal	60(%eax), %edx
  287456: 8b 45 d8                     	movl	-40(%ebp), %eax
  287459: 8d 0c 00                     	leal	(%eax,%eax), %ecx
  28745c: 8b 45 18                     	movl	24(%ebp), %eax
  28745f: 0f b6 40 02                  	movzbl	2(%eax), %eax
  287463: 0f b6 c0                     	movzbl	%al, %eax
  287466: 01 c8                        	addl	%ecx, %eax
  287468: 05 c0 08 00 00               	addl	$2240, %eax
  28746d: 8d 0c 85 00 00 00 00         	leal	(,%eax,4), %ecx
  287474: 8b 45 08                     	movl	8(%ebp), %eax
  287477: 01 c8                        	addl	%ecx, %eax
  287479: 83 c0 18                     	addl	$24, %eax
  28747c: 83 ec 0c                     	subl	$12, %esp
  28747f: 52                           	pushl	%edx
  287480: 6a 00                        	pushl	$0
  287482: 6a 71                        	pushl	$113
  287484: 50                           	pushl	%eax
  287485: ff 75 08                     	pushl	8(%ebp)
  287488: e8 12 ff ff ff               	calll	-238 <tek_rdget1>
  28748d: 83 c4 20                     	addl	$32, %esp
  287490: 89 c2                        	movl	%eax, %edx
  287492: 8b 45 18                     	movl	24(%ebp), %eax
  287495: 88 50 02                     	movb	%dl, 2(%eax)
  287498: 8b 45 18                     	movl	24(%ebp), %eax
  28749b: 0f b6 40 02                  	movzbl	2(%eax), %eax
  28749f: 84 c0                        	testb	%al, %al
  2874a1: 75 70                        	jne	112 <tek_rdget1+0x174>
  2874a3: 8b 45 08                     	movl	8(%ebp), %eax
  2874a6: 8d 50 5c                     	leal	92(%eax), %edx
  2874a9: 8b 45 08                     	movl	8(%ebp), %eax
  2874ac: 05 18 24 00 00               	addl	$9240, %eax
  2874b1: 83 ec 0c                     	subl	$12, %esp
  2874b4: 52                           	pushl	%edx
  2874b5: 6a 01                        	pushl	$1
  2874b7: 6a 74                        	pushl	$116
  2874b9: 50                           	pushl	%eax
  2874ba: ff 75 08                     	pushl	8(%ebp)
  2874bd: e8 dd fe ff ff               	calll	-291 <tek_rdget1>
  2874c2: 83 c4 20                     	addl	$32, %esp
  2874c5: 83 e0 0f                     	andl	$15, %eax
  2874c8: 89 45 d8                     	movl	%eax, -40(%ebp)
  2874cb: 83 7d d8 0f                  	cmpl	$15, -40(%ebp)
  2874cf: 0f 84 59 ff ff ff            	je	-167 <tek_rdget1+0x8f>
  2874d5: 8b 45 08                     	movl	8(%ebp), %eax
  2874d8: 8d 50 5c                     	leal	92(%eax), %edx
  2874db: 8b 45 08                     	movl	8(%ebp), %eax
  2874de: 05 58 24 00 00               	addl	$9304, %eax
  2874e3: 83 ec 0c                     	subl	$12, %esp
  2874e6: 52                           	pushl	%edx
  2874e7: 6a 01                        	pushl	$1
  2874e9: 6a 74                        	pushl	$116
  2874eb: 50                           	pushl	%eax
  2874ec: ff 75 08                     	pushl	8(%ebp)
  2874ef: e8 ab fe ff ff               	calll	-341 <tek_rdget1>
  2874f4: 83 c4 20                     	addl	$32, %esp
  2874f7: 83 e8 01                     	subl	$1, %eax
  2874fa: 83 e0 0f                     	andl	$15, %eax
  2874fd: 8d 50 01                     	leal	1(%eax), %edx
  287500: 8b 45 d8                     	movl	-40(%ebp), %eax
  287503: 83 ec 04                     	subl	$4, %esp
  287506: 52                           	pushl	%edx
  287507: 50                           	pushl	%eax
  287508: ff 75 18                     	pushl	24(%ebp)
  28750b: e8 43 fd ff ff               	calll	-701 <tek_setbm5>
  287510: 83 c4 10                     	addl	$16, %esp
  287513: 8b 45 18                     	movl	24(%ebp), %eax
  287516: 8b 50 18                     	movl	24(%eax), %edx
  287519: 8b 45 18                     	movl	24(%ebp), %eax
  28751c: 89 50 14                     	movl	%edx, 20(%eax)
  28751f: 8b 45 18                     	movl	24(%ebp), %eax
  287522: 8b 40 04                     	movl	4(%eax), %eax
  287525: 39 45 e4                     	cmpl	%eax, -28(%ebp)
  287528: 73 0b                        	jae	11 <tek_rdget1+0x196>
  28752a: 8b 45 18                     	movl	24(%ebp), %eax
  28752d: 8b 40 04                     	movl	4(%eax), %eax
  287530: 89 45 e4                     	movl	%eax, -28(%ebp)
  287533: eb 2c                        	jmp	44 <tek_rdget1+0x1c2>
  287535: 8b 45 18                     	movl	24(%ebp), %eax
  287538: 8b 40 08                     	movl	8(%eax), %eax
  28753b: 39 45 e4                     	cmpl	%eax, -28(%ebp)
  28753e: 76 0b                        	jbe	11 <tek_rdget1+0x1ac>
  287540: 8b 45 18                     	movl	24(%ebp), %eax
  287543: 8b 40 08                     	movl	8(%eax), %eax
  287546: 89 45 e4                     	movl	%eax, -28(%ebp)
  287549: eb 16                        	jmp	22 <tek_rdget1+0x1c2>
  28754b: 8b 45 18                     	movl	24(%ebp), %eax
  28754e: 8b 40 10                     	movl	16(%eax), %eax
  287551: 23 45 e4                     	andl	-28(%ebp), %eax
  287554: 85 c0                        	testl	%eax, %eax
  287556: 74 4c                        	je	76 <tek_rdget1+0x205>
  287558: 8b 45 18                     	movl	24(%ebp), %eax
  28755b: 8b 40 0c                     	movl	12(%eax), %eax
  28755e: 21 45 e4                     	andl	%eax, -28(%ebp)
  287561: 8b 45 dc                     	movl	-36(%ebp), %eax
  287564: 8b 55 e4                     	movl	-28(%ebp), %edx
  287567: 89 10                        	movl	%edx, (%eax)
  287569: eb 39                        	jmp	57 <tek_rdget1+0x205>
  28756b: 8b 45 08                     	movl	8(%ebp), %eax
  28756e: 8b 40 04                     	movl	4(%eax), %eax
  287571: c1 e0 08                     	shll	$8, %eax
  287574: 89 c2                        	movl	%eax, %edx
  287576: 8b 45 08                     	movl	8(%ebp), %eax
  287579: 89 50 04                     	movl	%edx, 4(%eax)
  28757c: 8b 45 08                     	movl	8(%ebp), %eax
  28757f: 8b 40 08                     	movl	8(%eax), %eax
  287582: c1 e0 08                     	shll	$8, %eax
  287585: 89 c3                        	movl	%eax, %ebx
  287587: 8b 45 08                     	movl	8(%ebp), %eax
  28758a: 8b 00                        	movl	(%eax), %eax
  28758c: 8d 48 01                     	leal	1(%eax), %ecx
  28758f: 8b 55 08                     	movl	8(%ebp), %edx
  287592: 89 0a                        	movl	%ecx, (%edx)
  287594: 0f b6 00                     	movzbl	(%eax), %eax
  287597: 0f b6 c0                     	movzbl	%al, %eax
  28759a: 09 c3                        	orl	%eax, %ebx
  28759c: 89 da                        	movl	%ebx, %edx
  28759e: 8b 45 08                     	movl	8(%ebp), %eax
  2875a1: 89 50 08                     	movl	%edx, 8(%eax)
  2875a4: 8b 45 08                     	movl	8(%ebp), %eax
  2875a7: 8b 40 04                     	movl	4(%eax), %eax
  2875aa: 3d ff ff ff 00               	cmpl	$16777215, %eax
  2875af: 76 ba                        	jbe	-70 <tek_rdget1+0x1cc>
  2875b1: d1 65 14                     	shll	20(%ebp)
  2875b4: 8b 45 08                     	movl	8(%ebp), %eax
  2875b7: 8b 50 04                     	movl	4(%eax), %edx
  2875ba: 8b 45 08                     	movl	8(%ebp), %eax
  2875bd: 8b 40 0c                     	movl	12(%eax), %eax
  2875c0: 21 d0                        	andl	%edx, %eax
  2875c2: 89 c1                        	movl	%eax, %ecx
  2875c4: bb 00 00 00 00               	movl	$0, %ebx
  2875c9: 8b 45 e4                     	movl	-28(%ebp), %eax
  2875cc: ba 00 00 00 00               	movl	$0, %edx
  2875d1: 89 df                        	movl	%ebx, %edi
  2875d3: 0f af f8                     	imull	%eax, %edi
  2875d6: 89 d6                        	movl	%edx, %esi
  2875d8: 0f af f1                     	imull	%ecx, %esi
  2875db: 01 fe                        	addl	%edi, %esi
  2875dd: f7 e1                        	mull	%ecx
  2875df: 89 45 d0                     	movl	%eax, -48(%ebp)
  2875e2: 89 55 d4                     	movl	%edx, -44(%ebp)
  2875e5: 89 d0                        	movl	%edx, %eax
  2875e7: 8d 0c 06                     	leal	(%esi,%eax), %ecx
  2875ea: 89 4d d4                     	movl	%ecx, -44(%ebp)
  2875ed: 8b 45 d0                     	movl	-48(%ebp), %eax
  2875f0: 8b 55 d4                     	movl	-44(%ebp), %edx
  2875f3: 0f ac d0 10                  	shrdl	$16, %edx, %eax
  2875f7: c1 ea 10                     	shrl	$16, %edx
  2875fa: 89 45 d8                     	movl	%eax, -40(%ebp)
  2875fd: 8b 45 08                     	movl	8(%ebp), %eax
  287600: 8b 40 08                     	movl	8(%eax), %eax
  287603: 39 45 d8                     	cmpl	%eax, -40(%ebp)
  287606: 76 3d                        	jbe	61 <tek_rdget1+0x2a6>
  287608: 83 4d 14 01                  	orl	$1, 20(%ebp)
  28760c: 8b 45 08                     	movl	8(%ebp), %eax
  28760f: 8b 55 d8                     	movl	-40(%ebp), %edx
  287612: 89 50 04                     	movl	%edx, 4(%eax)
  287615: 8b 45 dc                     	movl	-36(%ebp), %eax
  287618: 8b 10                        	movl	(%eax), %edx
  28761a: b8 00 00 01 00               	movl	$65536, %eax
  28761f: 2b 45 e4                     	subl	-28(%ebp), %eax
  287622: 89 c3                        	movl	%eax, %ebx
  287624: 8b 45 18                     	movl	24(%ebp), %eax
  287627: 0f b6 40 01                  	movzbl	1(%eax), %eax
  28762b: 0f b6 c0                     	movzbl	%al, %eax
  28762e: 89 c1                        	movl	%eax, %ecx
  287630: d3 eb                        	shrl	%cl, %ebx
  287632: 89 d9                        	movl	%ebx, %ecx
  287634: 8b 45 18                     	movl	24(%ebp), %eax
  287637: 8b 40 0c                     	movl	12(%eax), %eax
  28763a: 21 c8                        	andl	%ecx, %eax
  28763c: 01 c2                        	addl	%eax, %edx
  28763e: 8b 45 dc                     	movl	-36(%ebp), %eax
  287641: 89 10                        	movl	%edx, (%eax)
  287643: eb 49                        	jmp	73 <tek_rdget1+0x2ef>
  287645: 8b 45 08                     	movl	8(%ebp), %eax
  287648: 8b 40 04                     	movl	4(%eax), %eax
  28764b: 2b 45 d8                     	subl	-40(%ebp), %eax
  28764e: 89 c2                        	movl	%eax, %edx
  287650: 8b 45 08                     	movl	8(%ebp), %eax
  287653: 89 50 04                     	movl	%edx, 4(%eax)
  287656: 8b 45 08                     	movl	8(%ebp), %eax
  287659: 8b 40 08                     	movl	8(%eax), %eax
  28765c: 2b 45 d8                     	subl	-40(%ebp), %eax
  28765f: 89 c2                        	movl	%eax, %edx
  287661: 8b 45 08                     	movl	8(%ebp), %eax
  287664: 89 50 08                     	movl	%edx, 8(%eax)
  287667: 8b 45 dc                     	movl	-36(%ebp), %eax
  28766a: 8b 10                        	movl	(%eax), %edx
  28766c: 8b 45 18                     	movl	24(%ebp), %eax
  28766f: 0f b6 40 01                  	movzbl	1(%eax), %eax
  287673: 0f b6 c0                     	movzbl	%al, %eax
  287676: 8b 5d e4                     	movl	-28(%ebp), %ebx
  287679: 89 c1                        	movl	%eax, %ecx
  28767b: d3 eb                        	shrl	%cl, %ebx
  28767d: 89 d9                        	movl	%ebx, %ecx
  28767f: 8b 45 18                     	movl	24(%ebp), %eax
  287682: 8b 40 0c                     	movl	12(%eax), %eax
  287685: 21 c8                        	andl	%ecx, %eax
  287687: 29 c2                        	subl	%eax, %edx
  287689: 8b 45 dc                     	movl	-36(%ebp), %eax
  28768c: 89 10                        	movl	%edx, (%eax)
  28768e: 83 6d 10 01                  	subl	$1, 16(%ebp)
  287692: 8b 45 10                     	movl	16(%ebp), %eax
  287695: 23 45 e0                     	andl	-32(%ebp), %eax
  287698: 85 c0                        	testl	%eax, %eax
  28769a: 75 04                        	jne	4 <tek_rdget1+0x301>
  28769c: 83 45 18 20                  	addl	$32, 24(%ebp)
  2876a0: 83 7d 10 00                  	cmpl	$0, 16(%ebp)
  2876a4: 0f 85 16 fd ff ff            	jne	-746 <tek_rdget1+0x21>
  2876aa: 8b 45 14                     	movl	20(%ebp), %eax
  2876ad: 8d 65 f4                     	leal	-12(%ebp), %esp
  2876b0: 5b                           	popl	%ebx
  2876b1: 5e                           	popl	%esi
  2876b2: 5f                           	popl	%edi
  2876b3: 5d                           	popl	%ebp
  2876b4: c3                           	retl

002876b5 tek_revbit:
  2876b5: 55                           	pushl	%ebp
  2876b6: 89 e5                        	movl	%esp, %ebp
  2876b8: 83 ec 10                     	subl	$16, %esp
  2876bb: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
  2876c2: 8b 45 08                     	movl	8(%ebp), %eax
  2876c5: 83 e0 01                     	andl	$1, %eax
  2876c8: 89 c2                        	movl	%eax, %edx
  2876ca: 8b 45 fc                     	movl	-4(%ebp), %eax
  2876cd: 01 d0                        	addl	%edx, %eax
  2876cf: 01 45 fc                     	addl	%eax, -4(%ebp)
  2876d2: d1 6d 08                     	shrl	8(%ebp)
  2876d5: 83 6d 0c 01                  	subl	$1, 12(%ebp)
  2876d9: 83 7d 0c 00                  	cmpl	$0, 12(%ebp)
  2876dd: 75 e3                        	jne	-29 <tek_revbit+0xd>
  2876df: 8b 45 fc                     	movl	-4(%ebp), %eax
  2876e2: c9                           	leave
  2876e3: c3                           	retl

002876e4 tek_getlen5:
  2876e4: 55                           	pushl	%ebp
  2876e5: 89 e5                        	movl	%esp, %ebp
  2876e7: 56                           	pushl	%esi
  2876e8: 53                           	pushl	%ebx
  2876e9: 83 ec 10                     	subl	$16, %esp
  2876ec: 8b 45 08                     	movl	8(%ebp), %eax
  2876ef: 8b 80 28 04 00 00            	movl	1064(%eax), %eax
  2876f5: 8b 55 0c                     	movl	12(%ebp), %edx
  2876f8: 81 c2 62 02 00 00            	addl	$610, %edx
  2876fe: 8d 0c d5 00 00 00 00         	leal	(,%edx,8), %ecx
  287705: 8b 55 08                     	movl	8(%ebp), %edx
  287708: 01 ca                        	addl	%ecx, %edx
  28770a: 83 c2 0c                     	addl	$12, %edx
  28770d: 83 ec 0c                     	subl	$12, %esp
  287710: 50                           	pushl	%eax
  287711: 6a 00                        	pushl	$0
  287713: 6a 71                        	pushl	$113
  287715: 52                           	pushl	%edx
  287716: ff 75 08                     	pushl	8(%ebp)
  287719: e8 81 fc ff ff               	calll	-895 <tek_rdget1>
  28771e: 83 c4 20                     	addl	$32, %esp
  287721: 39 45 14                     	cmpl	%eax, 20(%ebp)
  287724: 74 4b                        	je	75 <tek_getlen5+0x8d>
  287726: 8b 45 08                     	movl	8(%ebp), %eax
  287729: 8b 88 2c 04 00 00            	movl	1068(%eax), %ecx
  28772f: 8b 55 10                     	movl	16(%ebp), %edx
  287732: 89 d0                        	movl	%edx, %eax
  287734: c1 e0 03                     	shll	$3, %eax
  287737: 29 d0                        	subl	%edx, %eax
  287739: 8b 55 0c                     	movl	12(%ebp), %edx
  28773c: 01 d0                        	addl	%edx, %eax
  28773e: 83 c0 03                     	addl	$3, %eax
  287741: c1 e0 05                     	shll	$5, %eax
  287744: 8d 90 50 04 00 00            	leal	1104(%eax), %edx
  28774a: 8b 45 08                     	movl	8(%ebp), %eax
  28774d: 01 d0                        	addl	%edx, %eax
  28774f: 83 c0 0c                     	addl	$12, %eax
  287752: 83 ec 0c                     	subl	$12, %esp
  287755: 51                           	pushl	%ecx
  287756: 6a 01                        	pushl	$1
  287758: 6a 73                        	pushl	$115
  28775a: 50                           	pushl	%eax
  28775b: ff 75 08                     	pushl	8(%ebp)
  28775e: e8 3c fc ff ff               	calll	-964 <tek_rdget1>
  287763: 83 c4 20                     	addl	$32, %esp
  287766: 83 e0 07                     	andl	$7, %eax
  287769: 89 45 f4                     	movl	%eax, -12(%ebp)
  28776c: e9 58 01 00 00               	jmp	344 <tek_getlen5+0x1e5>
  287771: 8b 45 08                     	movl	8(%ebp), %eax
  287774: 8b 80 28 04 00 00            	movl	1064(%eax), %eax
  28777a: 8b 55 0c                     	movl	12(%ebp), %edx
  28777d: c1 e2 03                     	shll	$3, %edx
  287780: 8d 8a 14 13 00 00            	leal	4884(%edx), %ecx
  287786: 8b 55 08                     	movl	8(%ebp), %edx
  287789: 01 ca                        	addl	%ecx, %edx
  28778b: 83 c2 0c                     	addl	$12, %edx
  28778e: 83 ec 0c                     	subl	$12, %esp
  287791: 50                           	pushl	%eax
  287792: 6a 00                        	pushl	$0
  287794: 6a 71                        	pushl	$113
  287796: 52                           	pushl	%edx
  287797: ff 75 08                     	pushl	8(%ebp)
  28779a: e8 00 fc ff ff               	calll	-1024 <tek_rdget1>
  28779f: 83 c4 20                     	addl	$32, %esp
  2877a2: 39 45 14                     	cmpl	%eax, 20(%ebp)
  2877a5: 74 48                        	je	72 <tek_getlen5+0x10b>
  2877a7: 8b 45 08                     	movl	8(%ebp), %eax
  2877aa: 8b 88 30 04 00 00            	movl	1072(%eax), %ecx
  2877b0: 8b 55 10                     	movl	16(%ebp), %edx
  2877b3: 89 d0                        	movl	%edx, %eax
  2877b5: c1 e0 03                     	shll	$3, %eax
  2877b8: 29 d0                        	subl	%edx, %eax
  2877ba: 8b 55 0c                     	movl	12(%ebp), %edx
  2877bd: 01 d0                        	addl	%edx, %eax
  2877bf: 83 c0 05                     	addl	$5, %eax
  2877c2: c1 e0 05                     	shll	$5, %eax
  2877c5: 8d 90 50 04 00 00            	leal	1104(%eax), %edx
  2877cb: 8b 45 08                     	movl	8(%ebp), %eax
  2877ce: 01 d0                        	addl	%edx, %eax
  2877d0: 83 c0 0c                     	addl	$12, %eax
  2877d3: 83 ec 0c                     	subl	$12, %esp
  2877d6: 51                           	pushl	%ecx
  2877d7: 6a 01                        	pushl	$1
  2877d9: 6a 73                        	pushl	$115
  2877db: 50                           	pushl	%eax
  2877dc: ff 75 08                     	pushl	8(%ebp)
  2877df: e8 bb fb ff ff               	calll	-1093 <tek_rdget1>
  2877e4: 83 c4 20                     	addl	$32, %esp
  2877e7: 89 45 f4                     	movl	%eax, -12(%ebp)
  2877ea: e9 da 00 00 00               	jmp	218 <tek_getlen5+0x1e5>
  2877ef: 8b 45 08                     	movl	8(%ebp), %eax
  2877f2: 8b 80 34 04 00 00            	movl	1076(%eax), %eax
  2877f8: 8b 55 0c                     	movl	12(%ebp), %edx
  2877fb: c1 e2 0a                     	shll	$10, %edx
  2877fe: 8d 8a 20 13 00 00            	leal	4896(%edx), %ecx
  287804: 8b 55 08                     	movl	8(%ebp), %edx
  287807: 01 ca                        	addl	%ecx, %edx
  287809: 83 c2 0c                     	addl	$12, %edx
  28780c: 83 ec 0c                     	subl	$12, %esp
  28780f: 50                           	pushl	%eax
  287810: 6a 01                        	pushl	$1
  287812: 6a 78                        	pushl	$120
  287814: 52                           	pushl	%edx
  287815: ff 75 08                     	pushl	8(%ebp)
  287818: e8 82 fb ff ff               	calll	-1150 <tek_rdget1>
  28781d: 83 c4 20                     	addl	$32, %esp
  287820: 2d f8 01 00 00               	subl	$504, %eax
  287825: 89 45 f4                     	movl	%eax, -12(%ebp)
  287828: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
  28782c: 0f 8e 90 00 00 00            	jle	144 <tek_getlen5+0x1de>
  287832: 83 7d f4 05                  	cmpl	$5, -12(%ebp)
  287836: 7f 58                        	jg	88 <tek_getlen5+0x1ac>
  287838: 83 7d 14 00                  	cmpl	$0, 20(%ebp)
  28783c: 75 52                        	jne	82 <tek_getlen5+0x1ac>
  28783e: 8b 45 08                     	movl	8(%ebp), %eax
  287841: 8b 80 38 04 00 00            	movl	1080(%eax), %eax
  287847: 8b 55 f4                     	movl	-12(%ebp), %edx
  28784a: 89 d3                        	movl	%edx, %ebx
  28784c: 83 cb 70                     	orl	$112, %ebx
  28784f: 8b 55 f4                     	movl	-12(%ebp), %edx
  287852: be 01 00 00 00               	movl	$1, %esi
  287857: 89 d1                        	movl	%edx, %ecx
  287859: d3 e6                        	shll	%cl, %esi
  28785b: 89 f2                        	movl	%esi, %edx
  28785d: 83 ea 02                     	subl	$2, %edx
  287860: 81 c2 84 08 00 00            	addl	$2180, %edx
  287866: 8d 0c 95 00 00 00 00         	leal	(,%edx,4), %ecx
  28786d: 8b 55 08                     	movl	8(%ebp), %edx
  287870: 01 ca                        	addl	%ecx, %edx
  287872: 83 c2 0c                     	addl	$12, %edx
  287875: 83 ec 0c                     	subl	$12, %esp
  287878: 50                           	pushl	%eax
  287879: 6a 01                        	pushl	$1
  28787b: 53                           	pushl	%ebx
  28787c: 52                           	pushl	%edx
  28787d: ff 75 08                     	pushl	8(%ebp)
  287880: e8 1a fb ff ff               	calll	-1254 <tek_rdget1>
  287885: 83 c4 20                     	addl	$32, %esp
  287888: 83 e8 01                     	subl	$1, %eax
  28788b: 89 45 f4                     	movl	%eax, -12(%ebp)
  28788e: eb 19                        	jmp	25 <tek_getlen5+0x1c5>
  287890: 83 ec 04                     	subl	$4, %esp
  287893: 6a fe                        	pushl	$-2
  287895: ff 75 f4                     	pushl	-12(%ebp)
  287898: ff 75 08                     	pushl	8(%ebp)
  28789b: e8 66 fa ff ff               	calll	-1434 <tek_rdget0>
  2878a0: 83 c4 10                     	addl	$16, %esp
  2878a3: 83 e8 01                     	subl	$1, %eax
  2878a6: 89 45 f4                     	movl	%eax, -12(%ebp)
  2878a9: 83 ec 04                     	subl	$4, %esp
  2878ac: 6a fe                        	pushl	$-2
  2878ae: ff 75 f4                     	pushl	-12(%ebp)
  2878b1: ff 75 08                     	pushl	8(%ebp)
  2878b4: e8 4d fa ff ff               	calll	-1459 <tek_rdget0>
  2878b9: 83 c4 10                     	addl	$16, %esp
  2878bc: 83 e8 01                     	subl	$1, %eax
  2878bf: 89 45 f4                     	movl	%eax, -12(%ebp)
  2878c2: 81 45 f4 08 01 00 00         	addl	$264, -12(%ebp)
  2878c9: 8b 45 f4                     	movl	-12(%ebp), %eax
  2878cc: 8d 65 f8                     	leal	-8(%ebp), %esp
  2878cf: 5b                           	popl	%ebx
  2878d0: 5e                           	popl	%esi
  2878d1: 5d                           	popl	%ebp
  2878d2: c3                           	retl

002878d3 tek_decmain5:
  2878d3: 55                           	pushl	%ebp
  2878d4: 89 e5                        	movl	%esp, %ebp
  2878d6: 57                           	pushl	%edi
  2878d7: 56                           	pushl	%esi
  2878d8: 53                           	pushl	%ebx
  2878d9: 83 ec 6c                     	subl	$108, %esp
  2878dc: 8b 45 1c                     	movl	28(%ebp), %eax
  2878df: ba 01 00 00 00               	movl	$1, %edx
  2878e4: 89 c1                        	movl	%eax, %ecx
  2878e6: d3 e2                        	shll	%cl, %edx
  2878e8: 89 d0                        	movl	%edx, %eax
  2878ea: 83 e8 01                     	subl	$1, %eax
  2878ed: 89 45 c4                     	movl	%eax, -60(%ebp)
  2878f0: 8b 45 20                     	movl	32(%ebp), %eax
  2878f3: ba 01 00 00 00               	movl	$1, %edx
  2878f8: 89 c1                        	movl	%eax, %ecx
  2878fa: d3 e2                        	shll	%cl, %edx
  2878fc: 89 d0                        	movl	%edx, %eax
  2878fe: 83 e8 01                     	subl	$1, %eax
  287901: 89 45 c0                     	movl	%eax, -64(%ebp)
  287904: 83 7d 24 ff                  	cmpl	$-1, 36(%ebp)
  287908: 0f 94 c0                     	sete	%al
  28790b: 0f b6 c0                     	movzbl	%al, %eax
  28790e: 89 45 bc                     	movl	%eax, -68(%ebp)
  287911: b8 08 00 00 00               	movl	$8, %eax
  287916: 2b 45 18                     	subl	24(%ebp), %eax
  287919: 89 45 b8                     	movl	%eax, -72(%ebp)
  28791c: c7 45 cc 78 00 00 00         	movl	$120, -52(%ebp)
  287923: 8b 45 08                     	movl	8(%ebp), %eax
  287926: 89 45 b4                     	movl	%eax, -76(%ebp)
  287929: 8b 45 b4                     	movl	-76(%ebp), %eax
  28792c: 05 5c 04 00 00               	addl	$1116, %eax
  287931: 89 45 b0                     	movl	%eax, -80(%ebp)
  287934: 8b 45 0c                     	movl	12(%ebp), %eax
  287937: 8d 50 04                     	leal	4(%eax), %edx
  28793a: 8b 45 b4                     	movl	-76(%ebp), %eax
  28793d: 89 10                        	movl	%edx, (%eax)
  28793f: 8b 45 b4                     	movl	-76(%ebp), %eax
  287942: c7 40 04 ff ff ff ff         	movl	$4294967295, 4(%eax)
  287949: 8b 45 0c                     	movl	12(%ebp), %eax
  28794c: 0f b6 00                     	movzbl	(%eax), %eax
  28794f: 0f b6 c0                     	movzbl	%al, %eax
  287952: c1 e0 18                     	shll	$24, %eax
  287955: 89 c2                        	movl	%eax, %edx
  287957: 8b 45 0c                     	movl	12(%ebp), %eax
  28795a: 83 c0 01                     	addl	$1, %eax
  28795d: 0f b6 00                     	movzbl	(%eax), %eax
  287960: 0f b6 c0                     	movzbl	%al, %eax
  287963: c1 e0 10                     	shll	$16, %eax
  287966: 09 c2                        	orl	%eax, %edx
  287968: 8b 45 0c                     	movl	12(%ebp), %eax
  28796b: 83 c0 02                     	addl	$2, %eax
  28796e: 0f b6 00                     	movzbl	(%eax), %eax
  287971: 0f b6 c0                     	movzbl	%al, %eax
  287974: c1 e0 08                     	shll	$8, %eax
  287977: 09 c2                        	orl	%eax, %edx
  287979: 8b 45 0c                     	movl	12(%ebp), %eax
  28797c: 83 c0 03                     	addl	$3, %eax
  28797f: 0f b6 00                     	movzbl	(%eax), %eax
  287982: 0f b6 c0                     	movzbl	%al, %eax
  287985: 09 d0                        	orl	%edx, %eax
  287987: 89 c2                        	movl	%eax, %edx
  287989: 8b 45 b4                     	movl	-76(%ebp), %eax
  28798c: 89 50 08                     	movl	%edx, 8(%eax)
  28798f: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
  287996: eb 12                        	jmp	18 <tek_decmain5+0xd7>
  287998: 8b 45 e4                     	movl	-28(%ebp), %eax
  28799b: f7 d0                        	notl	%eax
  28799d: 89 c2                        	movl	%eax, %edx
  28799f: 8b 45 e4                     	movl	-28(%ebp), %eax
  2879a2: 89 54 85 98                  	movl	%edx, -104(%ebp,%eax,4)
  2879a6: 83 45 e4 01                  	addl	$1, -28(%ebp)
  2879aa: 83 7d e4 03                  	cmpl	$3, -28(%ebp)
  2879ae: 7e e8                        	jle	-24 <tek_decmain5+0xc5>
  2879b0: 8b 45 b4                     	movl	-76(%ebp), %eax
  2879b3: 83 c0 10                     	addl	$16, %eax
  2879b6: 8d 75 e8                     	leal	-24(%ebp), %esi
  2879b9: 89 30                        	movl	%esi, (%eax)
  2879bb: ba cd 79 28 00               	movl	$2652621, %edx
  2879c0: 89 50 04                     	movl	%edx, 4(%eax)
  2879c3: 89 60 08                     	movl	%esp, 8(%eax)
  2879c6: b8 00 00 00 00               	movl	$0, %eax
  2879cb: eb 08                        	jmp	8 <tek_decmain5+0x102>
  2879cd: 8d 6d 18                     	leal	24(%ebp), %ebp
  2879d0: b8 01 00 00 00               	movl	$1, %eax
  2879d5: 85 c0                        	testl	%eax, %eax
  2879d7: 0f 85 18 0a 00 00            	jne	2584 <tek_decmain5+0xb22>
  2879dd: 8b 55 18                     	movl	24(%ebp), %edx
  2879e0: 8b 45 20                     	movl	32(%ebp), %eax
  2879e3: 01 d0                        	addl	%edx, %eax
  2879e5: ba 00 03 00 00               	movl	$768, %edx
  2879ea: 89 c1                        	movl	%eax, %ecx
  2879ec: d3 e2                        	shll	%cl, %edx
  2879ee: 89 d0                        	movl	%edx, %eax
  2879f0: 05 0f 08 00 00               	addl	$2063, %eax
  2879f5: 89 45 e4                     	movl	%eax, -28(%ebp)
  2879f8: eb 19                        	jmp	25 <tek_decmain5+0x140>
  2879fa: 8b 45 e4                     	movl	-28(%ebp), %eax
  2879fd: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
  287a04: 8b 45 b0                     	movl	-80(%ebp), %eax
  287a07: 01 d0                        	addl	%edx, %eax
  287a09: c7 00 00 80 00 00            	movl	$32768, (%eax)
  287a0f: 83 6d e4 01                  	subl	$1, -28(%ebp)
  287a13: 83 7d e4 00                  	cmpl	$0, -28(%ebp)
  287a17: 79 e1                        	jns	-31 <tek_decmain5+0x127>
  287a19: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
  287a20: e9 89 00 00 00               	jmp	137 <tek_decmain5+0x1db>
  287a25: 83 7d e4 03                  	cmpl	$3, -28(%ebp)
  287a29: 0f 9f c0                     	setg	%al
  287a2c: 0f b6 c0                     	movzbl	%al, %eax
  287a2f: 8b 55 b4                     	movl	-76(%ebp), %edx
  287a32: 8b 4d e4                     	movl	-28(%ebp), %ecx
  287a35: 83 c1 01                     	addl	$1, %ecx
  287a38: c1 e1 05                     	shll	$5, %ecx
  287a3b: 01 ca                        	addl	%ecx, %edx
  287a3d: 83 c2 10                     	addl	$16, %edx
  287a40: 89 02                        	movl	%eax, (%edx)
  287a42: 83 7d e4 17                  	cmpl	$23, -28(%ebp)
  287a46: 7f 07                        	jg	7 <tek_decmain5+0x17c>
  287a48: b9 00 40 00 00               	movl	$16384, %ecx
  287a4d: eb 05                        	jmp	5 <tek_decmain5+0x181>
  287a4f: b9 00 20 00 00               	movl	$8192, %ecx
  287a54: 8b 45 b4                     	movl	-76(%ebp), %eax
  287a57: 8b 55 e4                     	movl	-28(%ebp), %edx
  287a5a: 83 c2 01                     	addl	$1, %edx
  287a5d: c1 e2 05                     	shll	$5, %edx
  287a60: 01 d0                        	addl	%edx, %eax
  287a62: 83 c0 14                     	addl	$20, %eax
  287a65: 89 08                        	movl	%ecx, (%eax)
  287a67: 8b 45 b4                     	movl	-76(%ebp), %eax
  287a6a: 8b 55 e4                     	movl	-28(%ebp), %edx
  287a6d: c1 e2 05                     	shll	$5, %edx
  287a70: 01 d0                        	addl	%edx, %eax
  287a72: 83 c0 1e                     	addl	$30, %eax
  287a75: c6 00 00                     	movb	$0, (%eax)
  287a78: 8b 45 b4                     	movl	-76(%ebp), %eax
  287a7b: 8b 55 e4                     	movl	-28(%ebp), %edx
  287a7e: c1 e2 05                     	shll	$5, %edx
  287a81: 01 d0                        	addl	%edx, %eax
  287a83: 83 c0 1d                     	addl	$29, %eax
  287a86: c6 00 05                     	movb	$5, (%eax)
  287a89: 8b 45 b4                     	movl	-76(%ebp), %eax
  287a8c: 8b 55 e4                     	movl	-28(%ebp), %edx
  287a8f: c1 e2 05                     	shll	$5, %edx
  287a92: 01 d0                        	addl	%edx, %eax
  287a94: 83 c0 1d                     	addl	$29, %eax
  287a97: 0f b6 00                     	movzbl	(%eax), %eax
  287a9a: 8b 55 b4                     	movl	-76(%ebp), %edx
  287a9d: 8b 4d e4                     	movl	-28(%ebp), %ecx
  287aa0: c1 e1 05                     	shll	$5, %ecx
  287aa3: 01 ca                        	addl	%ecx, %edx
  287aa5: 83 c2 1c                     	addl	$28, %edx
  287aa8: 88 02                        	movb	%al, (%edx)
  287aaa: 83 45 e4 01                  	addl	$1, -28(%ebp)
  287aae: 83 7d e4 1f                  	cmpl	$31, -28(%ebp)
  287ab2: 0f 8e 6d ff ff ff            	jle	-147 <tek_decmain5+0x152>
  287ab8: 8b 45 b0                     	movl	-80(%ebp), %eax
  287abb: 8d 98 40 20 00 00            	leal	8256(%eax), %ebx
  287ac1: 8b 55 18                     	movl	24(%ebp), %edx
  287ac4: 8b 45 20                     	movl	32(%ebp), %eax
  287ac7: 01 d0                        	addl	%edx, %eax
  287ac9: ba 00 01 00 00               	movl	$256, %edx
  287ace: 89 c1                        	movl	%eax, %ecx
  287ad0: d3 e2                        	shll	%cl, %edx
  287ad2: 89 d0                        	movl	%edx, %eax
  287ad4: 05 fe ff ff 3f               	addl	$1073741822, %eax
  287ad9: c1 e0 02                     	shll	$2, %eax
  287adc: 01 d8                        	addl	%ebx, %eax
  287ade: 89 45 ac                     	movl	%eax, -84(%ebp)
  287ae1: 83 7d bc 00                  	cmpl	$0, -68(%ebp)
  287ae5: 74 62                        	je	98 <tek_decmain5+0x276>
  287ae7: 8b 45 b4                     	movl	-76(%ebp), %eax
  287aea: c7 40 0c 00 f8 ff ff         	movl	$4294965248, 12(%eax)
  287af1: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
  287af8: eb 1b                        	jmp	27 <tek_decmain5+0x242>
  287afa: 8b 45 b4                     	movl	-76(%ebp), %eax
  287afd: 8b 55 e4                     	movl	-28(%ebp), %edx
  287b00: 83 c2 01                     	addl	$1, %edx
  287b03: c1 e2 05                     	shll	$5, %edx
  287b06: 01 d0                        	addl	%edx, %eax
  287b08: 83 c0 10                     	addl	$16, %eax
  287b0b: c7 00 00 00 00 00            	movl	$0, (%eax)
  287b11: 83 45 e4 01                  	addl	$1, -28(%ebp)
  287b15: 83 7d e4 1f                  	cmpl	$31, -28(%ebp)
  287b19: 7e df                        	jle	-33 <tek_decmain5+0x227>
  287b1b: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
  287b22: eb 1a                        	jmp	26 <tek_decmain5+0x26b>
  287b24: 8b 45 b4                     	movl	-76(%ebp), %eax
  287b27: 8d 48 1c                     	leal	28(%eax), %ecx
  287b2a: 8b 45 b4                     	movl	-76(%ebp), %eax
  287b2d: 8b 55 e4                     	movl	-28(%ebp), %edx
  287b30: 81 c2 04 01 00 00            	addl	$260, %edx
  287b36: 89 4c 90 0c                  	movl	%ecx, 12(%eax,%edx,4)
  287b3a: 83 45 e4 01                  	addl	$1, -28(%ebp)
  287b3e: 83 7d e4 0d                  	cmpl	$13, -28(%ebp)
  287b42: 7e e0                        	jle	-32 <tek_decmain5+0x251>
  287b44: e9 91 01 00 00               	jmp	401 <tek_decmain5+0x407>
  287b49: 8b 45 b4                     	movl	-76(%ebp), %eax
  287b4c: c7 40 0c ff ff ff ff         	movl	$4294967295, 12(%eax)
  287b53: 8b 45 b4                     	movl	-76(%ebp), %eax
  287b56: c6 40 3c 05                  	movb	$5, 60(%eax)
  287b5a: 8b 45 b4                     	movl	-76(%ebp), %eax
  287b5d: c6 40 3d 03                  	movb	$3, 61(%eax)
  287b61: 8b 45 b4                     	movl	-76(%ebp), %eax
  287b64: c6 40 5c 09                  	movb	$9, 92(%eax)
  287b68: 8b 45 b4                     	movl	-76(%ebp), %eax
  287b6b: c6 40 5d 02                  	movb	$2, 93(%eax)
  287b6f: 8b 45 24                     	movl	36(%ebp), %eax
  287b72: 83 e0 40                     	andl	$64, %eax
  287b75: 85 c0                        	testl	%eax, %eax
  287b77: 74 1b                        	je	27 <tek_decmain5+0x2c1>
  287b79: 8b 45 b4                     	movl	-76(%ebp), %eax
  287b7c: c6 40 7c 00                  	movb	$0, 124(%eax)
  287b80: 8b 45 b4                     	movl	-76(%ebp), %eax
  287b83: c6 40 7d 01                  	movb	$1, 125(%eax)
  287b87: 8b 45 b0                     	movl	-80(%ebp), %eax
  287b8a: c7 80 3c 20 00 00 ff ff 00 00	movl	$65535, 8252(%eax)
  287b94: 8b 45 b4                     	movl	-76(%ebp), %eax
  287b97: c6 80 dc 02 00 00 00         	movb	$0, 732(%eax)
  287b9e: 8b 45 b4                     	movl	-76(%ebp), %eax
  287ba1: c6 80 dd 02 00 00 01         	movb	$1, 733(%eax)
  287ba8: 8b 45 b0                     	movl	-80(%ebp), %eax
  287bab: c7 80 b8 1e 00 00 ff ff 00 00	movl	$65535, 7864(%eax)
  287bb5: 83 7d 24 fe                  	cmpl	$-2, 36(%ebp)
  287bb9: 75 3a                        	jne	58 <tek_decmain5+0x322>
  287bbb: 8b 45 b4                     	movl	-76(%ebp), %eax
  287bbe: c7 80 f0 02 00 00 00 00 00 00	movl	$0, 752(%eax)
  287bc8: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
  287bcf: eb 19                        	jmp	25 <tek_decmain5+0x317>
  287bd1: 8b 45 e4                     	movl	-28(%ebp), %eax
  287bd4: 05 74 14 31 00               	addl	$3216500, %eax
  287bd9: 0f b6 00                     	movzbl	(%eax), %eax
  287bdc: 8d 4d 8a                     	leal	-118(%ebp), %ecx
  287bdf: 8b 55 e4                     	movl	-28(%ebp), %edx
  287be2: 01 ca                        	addl	%ecx, %edx
  287be4: 88 02                        	movb	%al, (%edx)
  287be6: 83 45 e4 01                  	addl	$1, -28(%ebp)
  287bea: 83 7d e4 0d                  	cmpl	$13, -28(%ebp)
  287bee: 7e e1                        	jle	-31 <tek_decmain5+0x2fe>
  287bf0: e9 a6 00 00 00               	jmp	166 <tek_decmain5+0x3c8>
  287bf5: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
  287bfc: eb 19                        	jmp	25 <tek_decmain5+0x344>
  287bfe: 8b 45 e4                     	movl	-28(%ebp), %eax
  287c01: 05 84 14 31 00               	addl	$3216516, %eax
  287c06: 0f b6 00                     	movzbl	(%eax), %eax
  287c09: 8d 4d 8a                     	leal	-118(%ebp), %ecx
  287c0c: 8b 55 e4                     	movl	-28(%ebp), %edx
  287c0f: 01 ca                        	addl	%ecx, %edx
  287c11: 88 02                        	movb	%al, (%edx)
  287c13: 83 45 e4 01                  	addl	$1, -28(%ebp)
  287c17: 83 7d e4 0d                  	cmpl	$13, -28(%ebp)
  287c1b: 7e e1                        	jle	-31 <tek_decmain5+0x32b>
  287c1d: 8b 45 24                     	movl	36(%ebp), %eax
  287c20: 83 e0 03                     	andl	$3, %eax
  287c23: ba 07 00 00 00               	movl	$7, %edx
  287c28: 89 c1                        	movl	%eax, %ecx
  287c2a: d3 fa                        	sarl	%cl, %edx
  287c2c: 89 d0                        	movl	%edx, %eax
  287c2e: c1 e0 04                     	shll	$4, %eax
  287c31: 83 c8 08                     	orl	$8, %eax
  287c34: 89 45 cc                     	movl	%eax, -52(%ebp)
  287c37: 8b 45 24                     	movl	36(%ebp), %eax
  287c3a: 83 e0 04                     	andl	$4, %eax
  287c3d: 85 c0                        	testl	%eax, %eax
  287c3f: 74 07                        	je	7 <tek_decmain5+0x375>
  287c41: b8 09 00 00 00               	movl	$9, %eax
  287c46: eb 05                        	jmp	5 <tek_decmain5+0x37a>
  287c48: b8 08 00 00 00               	movl	$8, %eax
  287c4d: 88 45 8b                     	movb	%al, -117(%ebp)
  287c50: 8b 45 24                     	movl	36(%ebp), %eax
  287c53: 83 e0 08                     	andl	$8, %eax
  287c56: 85 c0                        	testl	%eax, %eax
  287c58: 74 07                        	je	7 <tek_decmain5+0x38e>
  287c5a: b8 0d 00 00 00               	movl	$13, %eax
  287c5f: eb 05                        	jmp	5 <tek_decmain5+0x393>
  287c61: b8 0c 00 00 00               	movl	$12, %eax
  287c66: 88 45 8f                     	movb	%al, -113(%ebp)
  287c69: 8b 45 24                     	movl	36(%ebp), %eax
  287c6c: 83 e0 10                     	andl	$16, %eax
  287c6f: 85 c0                        	testl	%eax, %eax
  287c71: 74 07                        	je	7 <tek_decmain5+0x3a7>
  287c73: b8 11 00 00 00               	movl	$17, %eax
  287c78: eb 05                        	jmp	5 <tek_decmain5+0x3ac>
  287c7a: b8 10 00 00 00               	movl	$16, %eax
  287c7f: 88 45 93                     	movb	%al, -109(%ebp)
  287c82: 8b 45 24                     	movl	36(%ebp), %eax
  287c85: 83 e0 20                     	andl	$32, %eax
  287c88: 85 c0                        	testl	%eax, %eax
  287c8a: 74 07                        	je	7 <tek_decmain5+0x3c0>
  287c8c: b8 13 00 00 00               	movl	$19, %eax
  287c91: eb 05                        	jmp	5 <tek_decmain5+0x3c5>
  287c93: b8 12 00 00 00               	movl	$18, %eax
  287c98: 88 45 95                     	movb	%al, -107(%ebp)
  287c9b: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
  287ca2: eb 30                        	jmp	48 <tek_decmain5+0x401>
  287ca4: 8d 55 8a                     	leal	-118(%ebp), %edx
  287ca7: 8b 45 e4                     	movl	-28(%ebp), %eax
  287caa: 01 d0                        	addl	%edx, %eax
  287cac: 0f b6 00                     	movzbl	(%eax), %eax
  287caf: 0f b6 c0                     	movzbl	%al, %eax
  287cb2: c1 e0 05                     	shll	$5, %eax
  287cb5: 8d 50 10                     	leal	16(%eax), %edx
  287cb8: 8b 45 b4                     	movl	-76(%ebp), %eax
  287cbb: 01 d0                        	addl	%edx, %eax
  287cbd: 8d 48 0c                     	leal	12(%eax), %ecx
  287cc0: 8b 45 b4                     	movl	-76(%ebp), %eax
  287cc3: 8b 55 e4                     	movl	-28(%ebp), %edx
  287cc6: 81 c2 04 01 00 00            	addl	$260, %edx
  287ccc: 89 4c 90 0c                  	movl	%ecx, 12(%eax,%edx,4)
  287cd0: 83 45 e4 01                  	addl	$1, -28(%ebp)
  287cd4: 83 7d e4 0d                  	cmpl	$13, -28(%ebp)
  287cd8: 7e ca                        	jle	-54 <tek_decmain5+0x3d1>
  287cda: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
  287ce1: eb 48                        	jmp	72 <tek_decmain5+0x458>
  287ce3: 8b 45 b4                     	movl	-76(%ebp), %eax
  287ce6: 8b 55 e4                     	movl	-28(%ebp), %edx
  287ce9: c1 e2 05                     	shll	$5, %edx
  287cec: 01 d0                        	addl	%edx, %eax
  287cee: 83 c0 1d                     	addl	$29, %eax
  287cf1: 0f b6 00                     	movzbl	(%eax), %eax
  287cf4: 0f b6 d0                     	movzbl	%al, %edx
  287cf7: 8b 45 b4                     	movl	-76(%ebp), %eax
  287cfa: 8b 4d e4                     	movl	-28(%ebp), %ecx
  287cfd: c1 e1 05                     	shll	$5, %ecx
  287d00: 01 c8                        	addl	%ecx, %eax
  287d02: 83 c0 1c                     	addl	$28, %eax
  287d05: 0f b6 00                     	movzbl	(%eax), %eax
  287d08: 0f b6 c0                     	movzbl	%al, %eax
  287d0b: 8b 4d e4                     	movl	-28(%ebp), %ecx
  287d0e: c1 e1 05                     	shll	$5, %ecx
  287d11: 8d 59 10                     	leal	16(%ecx), %ebx
  287d14: 8b 4d b4                     	movl	-76(%ebp), %ecx
  287d17: 01 d9                        	addl	%ebx, %ecx
  287d19: 83 c1 0c                     	addl	$12, %ecx
  287d1c: 52                           	pushl	%edx
  287d1d: 50                           	pushl	%eax
  287d1e: 51                           	pushl	%ecx
  287d1f: e8 2f f5 ff ff               	calll	-2769 <tek_setbm5>
  287d24: 83 c4 0c                     	addl	$12, %esp
  287d27: 83 45 e4 01                  	addl	$1, -28(%ebp)
  287d2b: 83 7d e4 1f                  	cmpl	$31, -28(%ebp)
  287d2f: 7e b2                        	jle	-78 <tek_decmain5+0x410>
  287d31: 8b 45 b4                     	movl	-76(%ebp), %eax
  287d34: 8b 90 1c 04 00 00            	movl	1052(%eax), %edx
  287d3a: 8b 45 b0                     	movl	-80(%ebp), %eax
  287d3d: 83 ec 0c                     	subl	$12, %esp
  287d40: 52                           	pushl	%edx
  287d41: 6a 00                        	pushl	$0
  287d43: 6a 71                        	pushl	$113
  287d45: 50                           	pushl	%eax
  287d46: ff 75 b4                     	pushl	-76(%ebp)
  287d49: e8 51 f6 ff ff               	calll	-2479 <tek_rdget1>
  287d4e: 83 c4 20                     	addl	$32, %esp
  287d51: 39 45 bc                     	cmpl	%eax, -68(%ebp)
  287d54: 0f 84 9e 06 00 00            	je	1694 <tek_decmain5+0xb25>
  287d5a: 8b 45 b4                     	movl	-76(%ebp), %eax
  287d5d: 8d 90 1c 03 00 00            	leal	796(%eax), %edx
  287d63: 8b 45 b0                     	movl	-80(%ebp), %eax
  287d66: 05 40 20 00 00               	addl	$8256, %eax
  287d6b: 83 ec 0c                     	subl	$12, %esp
  287d6e: 52                           	pushl	%edx
  287d6f: 6a 01                        	pushl	$1
  287d71: ff 75 cc                     	pushl	-52(%ebp)
  287d74: 50                           	pushl	%eax
  287d75: ff 75 b4                     	pushl	-76(%ebp)
  287d78: e8 22 f6 ff ff               	calll	-2526 <tek_rdget1>
  287d7d: 83 c4 20                     	addl	$32, %esp
  287d80: 89 c1                        	movl	%eax, %ecx
  287d82: 8b 45 14                     	movl	20(%ebp), %eax
  287d85: 8d 50 01                     	leal	1(%eax), %edx
  287d88: 89 55 14                     	movl	%edx, 20(%ebp)
  287d8b: 89 ca                        	movl	%ecx, %edx
  287d8d: 88 10                        	movb	%dl, (%eax)
  287d8f: c7 45 d8 00 00 00 00         	movl	$0, -40(%ebp)
  287d96: c7 45 d4 00 00 00 00         	movl	$0, -44(%ebp)
  287d9d: c7 45 d0 01 00 00 00         	movl	$1, -48(%ebp)
  287da4: e9 39 06 00 00               	jmp	1593 <tek_decmain5+0xb0f>
  287da9: 8b 45 d0                     	movl	-48(%ebp), %eax
  287dac: 23 45 c4                     	andl	-60(%ebp), %eax
  287daf: 89 45 a8                     	movl	%eax, -88(%ebp)
  287db2: 83 7d d4 00                  	cmpl	$0, -44(%ebp)
  287db6: 0f 9f c0                     	setg	%al
  287db9: 0f b6 d0                     	movzbl	%al, %edx
  287dbc: 8b 45 b4                     	movl	-76(%ebp), %eax
  287dbf: 81 c2 04 01 00 00            	addl	$260, %edx
  287dc5: 8b 44 90 0c                  	movl	12(%eax,%edx,4), %eax
  287dc9: 8b 55 a8                     	movl	-88(%ebp), %edx
  287dcc: 6b ca 1c                     	imull	$28, %edx, %ecx
  287dcf: 8b 55 d4                     	movl	-44(%ebp), %edx
  287dd2: 01 ca                        	addl	%ecx, %edx
  287dd4: 8d 0c d5 00 00 00 00         	leal	(,%edx,8), %ecx
  287ddb: 8b 55 b0                     	movl	-80(%ebp), %edx
  287dde: 01 ca                        	addl	%ecx, %edx
  287de0: 83 ec 0c                     	subl	$12, %esp
  287de3: 50                           	pushl	%eax
  287de4: 6a 00                        	pushl	$0
  287de6: 6a 71                        	pushl	$113
  287de8: 52                           	pushl	%edx
  287de9: ff 75 b4                     	pushl	-76(%ebp)
  287dec: e8 ae f5 ff ff               	calll	-2642 <tek_rdget1>
  287df1: 83 c4 20                     	addl	$32, %esp
  287df4: 39 45 bc                     	cmpl	%eax, -68(%ebp)
  287df7: 0f 84 88 01 00 00            	je	392 <tek_decmain5+0x6b2>
  287dfd: 8b 45 14                     	movl	20(%ebp), %eax
  287e00: 83 e8 01                     	subl	$1, %eax
  287e03: 0f b6 00                     	movzbl	(%eax), %eax
  287e06: 0f b6 d0                     	movzbl	%al, %edx
  287e09: 8b 45 b8                     	movl	-72(%ebp), %eax
  287e0c: 89 d3                        	movl	%edx, %ebx
  287e0e: 89 c1                        	movl	%eax, %ecx
  287e10: d3 fb                        	sarl	%cl, %ebx
  287e12: 8b 45 d0                     	movl	-48(%ebp), %eax
  287e15: 23 45 c0                     	andl	-64(%ebp), %eax
  287e18: 89 c2                        	movl	%eax, %edx
  287e1a: 8b 45 18                     	movl	24(%ebp), %eax
  287e1d: 89 c1                        	movl	%eax, %ecx
  287e1f: d3 e2                        	shll	%cl, %edx
  287e21: 89 d0                        	movl	%edx, %eax
  287e23: 09 d8                        	orl	%ebx, %eax
  287e25: c1 e0 08                     	shll	$8, %eax
  287e28: 89 45 e4                     	movl	%eax, -28(%ebp)
  287e2b: 8b 45 d4                     	movl	-44(%ebp), %eax
  287e2e: 8b 04 85 a0 14 31 00         	movl	3216544(,%eax,4), %eax
  287e35: 89 45 d4                     	movl	%eax, -44(%ebp)
  287e38: 83 7d d8 00                  	cmpl	$0, -40(%ebp)
  287e3c: 75 3e                        	jne	62 <tek_decmain5+0x5a9>
  287e3e: 8b 45 b4                     	movl	-76(%ebp), %eax
  287e41: 8d 90 1c 03 00 00            	leal	796(%eax), %edx
  287e47: 8b 45 e4                     	movl	-28(%ebp), %eax
  287e4a: 05 10 08 00 00               	addl	$2064, %eax
  287e4f: 8d 0c 85 00 00 00 00         	leal	(,%eax,4), %ecx
  287e56: 8b 45 b0                     	movl	-80(%ebp), %eax
  287e59: 01 c8                        	addl	%ecx, %eax
  287e5b: 83 ec 0c                     	subl	$12, %esp
  287e5e: 52                           	pushl	%edx
  287e5f: 6a 01                        	pushl	$1
  287e61: ff 75 cc                     	pushl	-52(%ebp)
  287e64: 50                           	pushl	%eax
  287e65: ff 75 b4                     	pushl	-76(%ebp)
  287e68: e8 32 f5 ff ff               	calll	-2766 <tek_rdget1>
  287e6d: 83 c4 20                     	addl	$32, %esp
  287e70: 89 c2                        	movl	%eax, %edx
  287e72: 8b 45 14                     	movl	20(%ebp), %eax
  287e75: 88 10                        	movb	%dl, (%eax)
  287e77: e9 fc 00 00 00               	jmp	252 <tek_decmain5+0x6a5>
  287e7c: 8b 45 b4                     	movl	-76(%ebp), %eax
  287e7f: 05 1c 03 00 00               	addl	$796, %eax
  287e84: 89 45 c8                     	movl	%eax, -56(%ebp)
  287e87: c7 45 e0 01 00 00 00         	movl	$1, -32(%ebp)
  287e8e: c7 45 dc 08 00 00 00         	movl	$8, -36(%ebp)
  287e95: 8b 45 98                     	movl	-104(%ebp), %eax
  287e98: 89 c2                        	movl	%eax, %edx
  287e9a: 8b 45 14                     	movl	20(%ebp), %eax
  287e9d: 01 d0                        	addl	%edx, %eax
  287e9f: 0f b6 00                     	movzbl	(%eax), %eax
  287ea2: 0f b6 c0                     	movzbl	%al, %eax
  287ea5: 89 45 d8                     	movl	%eax, -40(%ebp)
  287ea8: 8b 45 b4                     	movl	-76(%ebp), %eax
  287eab: 8b 80 24 04 00 00            	movl	1060(%eax), %eax
  287eb1: 8b 4d e4                     	movl	-28(%ebp), %ecx
  287eb4: 8b 55 e0                     	movl	-32(%ebp), %edx
  287eb7: 01 ca                        	addl	%ecx, %edx
  287eb9: 8d 0c 12                     	leal	(%edx,%edx), %ecx
  287ebc: 8b 55 d8                     	movl	-40(%ebp), %edx
  287ebf: c1 fa 07                     	sarl	$7, %edx
  287ec2: 09 ca                        	orl	%ecx, %edx
  287ec4: 8d 0c 95 00 00 00 00         	leal	(,%edx,4), %ecx
  287ecb: 8b 55 ac                     	movl	-84(%ebp), %edx
  287ece: 01 ca                        	addl	%ecx, %edx
  287ed0: 83 ec 0c                     	subl	$12, %esp
  287ed3: 50                           	pushl	%eax
  287ed4: 6a 00                        	pushl	$0
  287ed6: 6a 71                        	pushl	$113
  287ed8: 52                           	pushl	%edx
  287ed9: ff 75 b4                     	pushl	-76(%ebp)
  287edc: e8 be f4 ff ff               	calll	-2882 <tek_rdget1>
  287ee1: 83 c4 20                     	addl	$32, %esp
  287ee4: 89 c2                        	movl	%eax, %edx
  287ee6: 8b 45 e0                     	movl	-32(%ebp), %eax
  287ee9: 01 d0                        	addl	%edx, %eax
  287eeb: 01 45 e0                     	addl	%eax, -32(%ebp)
  287eee: 83 6d dc 01                  	subl	$1, -36(%ebp)
  287ef2: 8b 45 cc                     	movl	-52(%ebp), %eax
  287ef5: c1 f8 04                     	sarl	$4, %eax
  287ef8: 23 45 dc                     	andl	-36(%ebp), %eax
  287efb: 85 c0                        	testl	%eax, %eax
  287efd: 75 04                        	jne	4 <tek_decmain5+0x630>
  287eff: 83 45 c8 20                  	addl	$32, -56(%ebp)
  287f03: 8b 45 d8                     	movl	-40(%ebp), %eax
  287f06: c1 f8 07                     	sarl	$7, %eax
  287f09: 33 45 e0                     	xorl	-32(%ebp), %eax
  287f0c: 83 e0 01                     	andl	$1, %eax
  287f0f: 85 c0                        	testl	%eax, %eax
  287f11: 74 47                        	je	71 <tek_decmain5+0x687>
  287f13: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
  287f17: 74 41                        	je	65 <tek_decmain5+0x687>
  287f19: 8b 45 cc                     	movl	-52(%ebp), %eax
  287f1c: 83 e0 70                     	andl	$112, %eax
  287f1f: 0b 45 dc                     	orl	-36(%ebp), %eax
  287f22: 8b 4d e4                     	movl	-28(%ebp), %ecx
  287f25: 8b 55 e0                     	movl	-32(%ebp), %edx
  287f28: 01 ca                        	addl	%ecx, %edx
  287f2a: 83 ea 01                     	subl	$1, %edx
  287f2d: 81 c2 10 08 00 00            	addl	$2064, %edx
  287f33: 8d 0c 95 00 00 00 00         	leal	(,%edx,4), %ecx
  287f3a: 8b 55 b0                     	movl	-80(%ebp), %edx
  287f3d: 01 ca                        	addl	%ecx, %edx
  287f3f: 83 ec 0c                     	subl	$12, %esp
  287f42: ff 75 c8                     	pushl	-56(%ebp)
  287f45: ff 75 e0                     	pushl	-32(%ebp)
  287f48: 50                           	pushl	%eax
  287f49: 52                           	pushl	%edx
  287f4a: ff 75 b4                     	pushl	-76(%ebp)
  287f4d: e8 4d f4 ff ff               	calll	-2995 <tek_rdget1>
  287f52: 83 c4 20                     	addl	$32, %esp
  287f55: 89 45 e0                     	movl	%eax, -32(%ebp)
  287f58: eb 0d                        	jmp	13 <tek_decmain5+0x694>
  287f5a: d1 65 d8                     	shll	-40(%ebp)
  287f5d: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
  287f61: 0f 85 41 ff ff ff            	jne	-191 <tek_decmain5+0x5d5>
  287f67: 8b 45 e0                     	movl	-32(%ebp), %eax
  287f6a: 89 c2                        	movl	%eax, %edx
  287f6c: 8b 45 14                     	movl	20(%ebp), %eax
  287f6f: 88 10                        	movb	%dl, (%eax)
  287f71: c7 45 d8 00 00 00 00         	movl	$0, -40(%ebp)
  287f78: 83 45 d0 01                  	addl	$1, -48(%ebp)
  287f7c: 83 45 14 01                  	addl	$1, 20(%ebp)
  287f80: e9 5d 04 00 00               	jmp	1117 <tek_decmain5+0xb0f>
  287f85: 83 4d d8 01                  	orl	$1, -40(%ebp)
  287f89: 8b 45 b4                     	movl	-76(%ebp), %eax
  287f8c: 8b 80 50 04 00 00            	movl	1104(%eax), %eax
  287f92: 8b 55 d4                     	movl	-44(%ebp), %edx
  287f95: 81 c2 e0 00 00 00            	addl	$224, %edx
  287f9b: 89 d1                        	movl	%edx, %ecx
  287f9d: c1 e1 04                     	shll	$4, %ecx
  287fa0: 8b 55 b0                     	movl	-80(%ebp), %edx
  287fa3: 01 ca                        	addl	%ecx, %edx
  287fa5: 83 ec 0c                     	subl	$12, %esp
  287fa8: 50                           	pushl	%eax
  287fa9: 6a 00                        	pushl	$0
  287fab: 6a 71                        	pushl	$113
  287fad: 52                           	pushl	%edx
  287fae: ff 75 b4                     	pushl	-76(%ebp)
  287fb1: e8 e9 f3 ff ff               	calll	-3095 <tek_rdget1>
  287fb6: 83 c4 20                     	addl	$32, %esp
  287fb9: 39 45 bc                     	cmpl	%eax, -68(%ebp)
  287fbc: 0f 84 3d 02 00 00            	je	573 <tek_decmain5+0x92c>
  287fc2: 8b 45 a0                     	movl	-96(%ebp), %eax
  287fc5: 89 45 a4                     	movl	%eax, -92(%ebp)
  287fc8: 8b 45 9c                     	movl	-100(%ebp), %eax
  287fcb: 89 45 a0                     	movl	%eax, -96(%ebp)
  287fce: 8b 45 98                     	movl	-104(%ebp), %eax
  287fd1: 89 45 9c                     	movl	%eax, -100(%ebp)
  287fd4: ff 75 bc                     	pushl	-68(%ebp)
  287fd7: ff 75 a8                     	pushl	-88(%ebp)
  287fda: 6a 00                        	pushl	$0
  287fdc: ff 75 b4                     	pushl	-76(%ebp)
  287fdf: e8 00 f7 ff ff               	calll	-2304 <tek_getlen5>
  287fe4: 83 c4 10                     	addl	$16, %esp
  287fe7: 89 45 e4                     	movl	%eax, -28(%ebp)
  287fea: 8b 45 e4                     	movl	-28(%ebp), %eax
  287fed: 89 45 e0                     	movl	%eax, -32(%ebp)
  287ff0: 83 7d d4 06                  	cmpl	$6, -44(%ebp)
  287ff4: 7f 07                        	jg	7 <tek_decmain5+0x72a>
  287ff6: b8 07 00 00 00               	movl	$7, %eax
  287ffb: eb 05                        	jmp	5 <tek_decmain5+0x72f>
  287ffd: b8 0a 00 00 00               	movl	$10, %eax
  288002: 89 45 d4                     	movl	%eax, -44(%ebp)
  288005: 83 7d e0 03                  	cmpl	$3, -32(%ebp)
  288009: 7e 07                        	jle	7 <tek_decmain5+0x73f>
  28800b: c7 45 e0 03 00 00 00         	movl	$3, -32(%ebp)
  288012: 83 7d e0 03                  	cmpl	$3, -32(%ebp)
  288016: 75 07                        	jne	7 <tek_decmain5+0x74c>
  288018: ba 09 00 00 00               	movl	$9, %edx
  28801d: eb 05                        	jmp	5 <tek_decmain5+0x751>
  28801f: ba 08 00 00 00               	movl	$8, %edx
  288024: 8b 45 b4                     	movl	-76(%ebp), %eax
  288027: 81 c2 04 01 00 00            	addl	$260, %edx
  28802d: 8b 44 90 0c                  	movl	12(%eax,%edx,4), %eax
  288031: 8b 55 e0                     	movl	-32(%ebp), %edx
  288034: c1 e2 08                     	shll	$8, %edx
  288037: 8d 8a d0 16 00 00            	leal	5840(%edx), %ecx
  28803d: 8b 55 b0                     	movl	-80(%ebp), %edx
  288040: 01 ca                        	addl	%ecx, %edx
  288042: 83 ec 0c                     	subl	$12, %esp
  288045: 50                           	pushl	%eax
  288046: 6a 01                        	pushl	$1
  288048: 6a 76                        	pushl	$118
  28804a: 52                           	pushl	%edx
  28804b: ff 75 b4                     	pushl	-76(%ebp)
  28804e: e8 4c f3 ff ff               	calll	-3252 <tek_rdget1>
  288053: 83 c4 20                     	addl	$32, %esp
  288056: 83 e0 3f                     	andl	$63, %eax
  288059: 89 45 e0                     	movl	%eax, -32(%ebp)
  28805c: 8b 45 e0                     	movl	-32(%ebp), %eax
  28805f: 89 45 98                     	movl	%eax, -104(%ebp)
  288062: 83 7d e0 03                  	cmpl	$3, -32(%ebp)
  288066: 0f 8e 86 01 00 00            	jle	390 <tek_decmain5+0x91f>
  28806c: 8b 45 e0                     	movl	-32(%ebp), %eax
  28806f: d1 f8                        	sarl	%eax
  288071: 83 e8 01                     	subl	$1, %eax
  288074: 89 45 dc                     	movl	%eax, -36(%ebp)
  288077: 8b 45 e0                     	movl	-32(%ebp), %eax
  28807a: 83 e0 01                     	andl	$1, %eax
  28807d: 83 c8 02                     	orl	$2, %eax
  288080: 89 c2                        	movl	%eax, %edx
  288082: 8b 45 dc                     	movl	-36(%ebp), %eax
  288085: 89 c1                        	movl	%eax, %ecx
  288087: d3 e2                        	shll	%cl, %edx
  288089: 89 d0                        	movl	%edx, %eax
  28808b: 89 45 98                     	movl	%eax, -104(%ebp)
  28808e: 83 7d e0 0d                  	cmpl	$13, -32(%ebp)
  288092: 0f 8f 88 00 00 00            	jg	136 <tek_decmain5+0x84d>
  288098: 83 7d dc 03                  	cmpl	$3, -36(%ebp)
  28809c: 7e 07                        	jle	7 <tek_decmain5+0x7d2>
  28809e: ba 0b 00 00 00               	movl	$11, %edx
  2880a3: eb 05                        	jmp	5 <tek_decmain5+0x7d7>
  2880a5: ba 0a 00 00 00               	movl	$10, %edx
  2880aa: 8b 45 b4                     	movl	-76(%ebp), %eax
  2880ad: 81 c2 04 01 00 00            	addl	$260, %edx
  2880b3: 8b 44 90 0c                  	movl	12(%eax,%edx,4), %eax
  2880b7: 8b 55 dc                     	movl	-36(%ebp), %edx
  2880ba: 89 d3                        	movl	%edx, %ebx
  2880bc: 83 cb 70                     	orl	$112, %ebx
  2880bf: 8b 55 e0                     	movl	-32(%ebp), %edx
  2880c2: 89 d6                        	movl	%edx, %esi
  2880c4: 83 e6 01                     	andl	$1, %esi
  2880c7: 8b 55 dc                     	movl	-36(%ebp), %edx
  2880ca: bf 01 00 00 00               	movl	$1, %edi
  2880cf: 89 d1                        	movl	%edx, %ecx
  2880d1: d3 e7                        	shll	%cl, %edi
  2880d3: 89 fa                        	movl	%edi, %edx
  2880d5: 8d 4a fe                     	leal	-2(%edx), %ecx
  2880d8: 6b d6 3e                     	imull	$62, %esi, %edx
  2880db: 01 ca                        	addl	%ecx, %edx
  2880dd: 81 c2 f4 06 00 00            	addl	$1780, %edx
  2880e3: 8d 0c 95 00 00 00 00         	leal	(,%edx,4), %ecx
  2880ea: 8b 55 b0                     	movl	-80(%ebp), %edx
  2880ed: 01 ca                        	addl	%ecx, %edx
  2880ef: 83 ec 0c                     	subl	$12, %esp
  2880f2: 50                           	pushl	%eax
  2880f3: 6a 01                        	pushl	$1
  2880f5: 53                           	pushl	%ebx
  2880f6: 52                           	pushl	%edx
  2880f7: ff 75 b4                     	pushl	-76(%ebp)
  2880fa: e8 a0 f2 ff ff               	calll	-3424 <tek_rdget1>
  2880ff: 83 c4 20                     	addl	$32, %esp
  288102: 83 ec 08                     	subl	$8, %esp
  288105: ff 75 dc                     	pushl	-36(%ebp)
  288108: 50                           	pushl	%eax
  288109: e8 a7 f5 ff ff               	calll	-2649 <tek_revbit>
  28810e: 83 c4 10                     	addl	$16, %esp
  288111: 89 c2                        	movl	%eax, %edx
  288113: 8b 45 98                     	movl	-104(%ebp), %eax
  288116: 09 d0                        	orl	%edx, %eax
  288118: 89 45 98                     	movl	%eax, -104(%ebp)
  28811b: e9 d2 00 00 00               	jmp	210 <tek_decmain5+0x91f>
  288120: 83 7d bc 00                  	cmpl	$0, -68(%ebp)
  288124: 75 6a                        	jne	106 <tek_decmain5+0x8bd>
  288126: 83 6d dc 06                  	subl	$6, -36(%ebp)
  28812a: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
  28812e: 74 20                        	je	32 <tek_decmain5+0x87d>
  288130: 83 ec 04                     	subl	$4, %esp
  288133: 6a ff                        	pushl	$-1
  288135: ff 75 dc                     	pushl	-36(%ebp)
  288138: ff 75 b4                     	pushl	-76(%ebp)
  28813b: e8 c6 f1 ff ff               	calll	-3642 <tek_rdget0>
  288140: 83 c4 10                     	addl	$16, %esp
  288143: c1 e0 06                     	shll	$6, %eax
  288146: 89 c2                        	movl	%eax, %edx
  288148: 8b 45 98                     	movl	-104(%ebp), %eax
  28814b: 09 d0                        	orl	%edx, %eax
  28814d: 89 45 98                     	movl	%eax, -104(%ebp)
  288150: 8b 45 b4                     	movl	-76(%ebp), %eax
  288153: 8b 80 4c 04 00 00            	movl	1100(%eax), %eax
  288159: 8b 55 b0                     	movl	-80(%ebp), %edx
  28815c: 81 c2 d0 1a 00 00            	addl	$6864, %edx
  288162: 83 ec 0c                     	subl	$12, %esp
  288165: 50                           	pushl	%eax
  288166: 6a 01                        	pushl	$1
  288168: 6a 76                        	pushl	$118
  28816a: 52                           	pushl	%edx
  28816b: ff 75 b4                     	pushl	-76(%ebp)
  28816e: e8 2c f2 ff ff               	calll	-3540 <tek_rdget1>
  288173: 83 c4 20                     	addl	$32, %esp
  288176: 83 ec 08                     	subl	$8, %esp
  288179: 6a 06                        	pushl	$6
  28817b: 50                           	pushl	%eax
  28817c: e8 34 f5 ff ff               	calll	-2764 <tek_revbit>
  288181: 83 c4 10                     	addl	$16, %esp
  288184: 89 c2                        	movl	%eax, %edx
  288186: 8b 45 98                     	movl	-104(%ebp), %eax
  288189: 09 d0                        	orl	%edx, %eax
  28818b: 89 45 98                     	movl	%eax, -104(%ebp)
  28818e: eb 62                        	jmp	98 <tek_decmain5+0x91f>
  288190: 8b 45 dc                     	movl	-36(%ebp), %eax
  288193: 83 e8 04                     	subl	$4, %eax
  288196: 83 ec 04                     	subl	$4, %esp
  288199: 6a ff                        	pushl	$-1
  28819b: 50                           	pushl	%eax
  28819c: ff 75 b4                     	pushl	-76(%ebp)
  28819f: e8 62 f1 ff ff               	calll	-3742 <tek_rdget0>
  2881a4: 83 c4 10                     	addl	$16, %esp
  2881a7: c1 e0 04                     	shll	$4, %eax
  2881aa: 89 c2                        	movl	%eax, %edx
  2881ac: 8b 45 98                     	movl	-104(%ebp), %eax
  2881af: 09 d0                        	orl	%edx, %eax
  2881b1: 89 45 98                     	movl	%eax, -104(%ebp)
  2881b4: 8b 45 b4                     	movl	-76(%ebp), %eax
  2881b7: 8b 80 4c 04 00 00            	movl	1100(%eax), %eax
  2881bd: 8b 55 b0                     	movl	-80(%ebp), %edx
  2881c0: 81 c2 d0 1a 00 00            	addl	$6864, %edx
  2881c6: 83 ec 0c                     	subl	$12, %esp
  2881c9: 50                           	pushl	%eax
  2881ca: 6a 01                        	pushl	$1
  2881cc: 6a 74                        	pushl	$116
  2881ce: 52                           	pushl	%edx
  2881cf: ff 75 b4                     	pushl	-76(%ebp)
  2881d2: e8 c8 f1 ff ff               	calll	-3640 <tek_rdget1>
  2881d7: 83 c4 20                     	addl	$32, %esp
  2881da: 83 ec 08                     	subl	$8, %esp
  2881dd: 6a 04                        	pushl	$4
  2881df: 50                           	pushl	%eax
  2881e0: e8 d0 f4 ff ff               	calll	-2864 <tek_revbit>
  2881e5: 83 c4 10                     	addl	$16, %esp
  2881e8: 89 c2                        	movl	%eax, %edx
  2881ea: 8b 45 98                     	movl	-104(%ebp), %eax
  2881ed: 09 d0                        	orl	%edx, %eax
  2881ef: 89 45 98                     	movl	%eax, -104(%ebp)
  2881f2: 8b 45 98                     	movl	-104(%ebp), %eax
  2881f5: f7 d0                        	notl	%eax
  2881f7: 89 45 98                     	movl	%eax, -104(%ebp)
  2881fa: e9 97 01 00 00               	jmp	407 <tek_decmain5+0xac3>
  2881ff: 8b 45 b4                     	movl	-76(%ebp), %eax
  288202: 8b 80 50 04 00 00            	movl	1104(%eax), %eax
  288208: 8b 55 d4                     	movl	-44(%ebp), %edx
  28820b: 81 c2 e0 00 00 00            	addl	$224, %edx
  288211: 89 d1                        	movl	%edx, %ecx
  288213: c1 e1 04                     	shll	$4, %ecx
  288216: 8b 55 b0                     	movl	-80(%ebp), %edx
  288219: 01 ca                        	addl	%ecx, %edx
  28821b: 83 c2 04                     	addl	$4, %edx
  28821e: 83 ec 0c                     	subl	$12, %esp
  288221: 50                           	pushl	%eax
  288222: 6a 00                        	pushl	$0
  288224: 6a 71                        	pushl	$113
  288226: 52                           	pushl	%edx
  288227: ff 75 b4                     	pushl	-76(%ebp)
  28822a: e8 70 f1 ff ff               	calll	-3728 <tek_rdget1>
  28822f: 83 c4 20                     	addl	$32, %esp
  288232: 39 45 bc                     	cmpl	%eax, -68(%ebp)
  288235: 74 60                        	je	96 <tek_decmain5+0x9c4>
  288237: c7 45 e4 ff ff ff ff         	movl	$4294967295, -28(%ebp)
  28823e: 8b 45 b4                     	movl	-76(%ebp), %eax
  288241: 8b 80 50 04 00 00            	movl	1104(%eax), %eax
  288247: 8b 55 a8                     	movl	-88(%ebp), %edx
  28824a: 6b ca 1c                     	imull	$28, %edx, %ecx
  28824d: 8b 55 d4                     	movl	-44(%ebp), %edx
  288250: 01 ca                        	addl	%ecx, %edx
  288252: 8d 0c d5 00 00 00 00         	leal	(,%edx,8), %ecx
  288259: 8b 55 b0                     	movl	-80(%ebp), %edx
  28825c: 01 ca                        	addl	%ecx, %edx
  28825e: 83 c2 04                     	addl	$4, %edx
  288261: 83 ec 0c                     	subl	$12, %esp
  288264: 50                           	pushl	%eax
  288265: 6a 00                        	pushl	$0
  288267: 6a 71                        	pushl	$113
  288269: 52                           	pushl	%edx
  28826a: ff 75 b4                     	pushl	-76(%ebp)
  28826d: e8 2d f1 ff ff               	calll	-3795 <tek_rdget1>
  288272: 83 c4 20                     	addl	$32, %esp
  288275: 85 c0                        	testl	%eax, %eax
  288277: 0f 85 ee 00 00 00            	jne	238 <tek_decmain5+0xa98>
  28827d: 83 7d d4 06                  	cmpl	$6, -44(%ebp)
  288281: 7f 07                        	jg	7 <tek_decmain5+0x9b7>
  288283: b8 09 00 00 00               	movl	$9, %eax
  288288: eb 05                        	jmp	5 <tek_decmain5+0x9bc>
  28828a: b8 0b 00 00 00               	movl	$11, %eax
  28828f: 89 45 d4                     	movl	%eax, -44(%ebp)
  288292: e9 ff 00 00 00               	jmp	255 <tek_decmain5+0xac3>
  288297: 8b 45 b4                     	movl	-76(%ebp), %eax
  28829a: 8b 80 50 04 00 00            	movl	1104(%eax), %eax
  2882a0: 8b 55 d4                     	movl	-44(%ebp), %edx
  2882a3: 81 c2 e0 00 00 00            	addl	$224, %edx
  2882a9: 89 d1                        	movl	%edx, %ecx
  2882ab: c1 e1 04                     	shll	$4, %ecx
  2882ae: 8b 55 b0                     	movl	-80(%ebp), %edx
  2882b1: 01 ca                        	addl	%ecx, %edx
  2882b3: 83 c2 08                     	addl	$8, %edx
  2882b6: 83 ec 0c                     	subl	$12, %esp
  2882b9: 50                           	pushl	%eax
  2882ba: 6a 00                        	pushl	$0
  2882bc: 6a 71                        	pushl	$113
  2882be: 52                           	pushl	%edx
  2882bf: ff 75 b4                     	pushl	-76(%ebp)
  2882c2: e8 d8 f0 ff ff               	calll	-3880 <tek_rdget1>
  2882c7: 83 c4 20                     	addl	$32, %esp
  2882ca: 39 45 bc                     	cmpl	%eax, -68(%ebp)
  2882cd: 74 0b                        	je	11 <tek_decmain5+0xa07>
  2882cf: 8b 45 9c                     	movl	-100(%ebp), %eax
  2882d2: 89 45 e4                     	movl	%eax, -28(%ebp)
  2882d5: e9 85 00 00 00               	jmp	133 <tek_decmain5+0xa8c>
  2882da: 8b 45 b4                     	movl	-76(%ebp), %eax
  2882dd: 8b 80 50 04 00 00            	movl	1104(%eax), %eax
  2882e3: 8b 55 d4                     	movl	-44(%ebp), %edx
  2882e6: 81 c2 e0 00 00 00            	addl	$224, %edx
  2882ec: 89 d1                        	movl	%edx, %ecx
  2882ee: c1 e1 04                     	shll	$4, %ecx
  2882f1: 8b 55 b0                     	movl	-80(%ebp), %edx
  2882f4: 01 ca                        	addl	%ecx, %edx
  2882f6: 83 c2 0c                     	addl	$12, %edx
  2882f9: 83 ec 0c                     	subl	$12, %esp
  2882fc: 50                           	pushl	%eax
  2882fd: 6a 00                        	pushl	$0
  2882ff: 6a 71                        	pushl	$113
  288301: 52                           	pushl	%edx
  288302: ff 75 b4                     	pushl	-76(%ebp)
  288305: e8 95 f0 ff ff               	calll	-3947 <tek_rdget1>
  28830a: 83 c4 20                     	addl	$32, %esp
  28830d: 39 45 bc                     	cmpl	%eax, -68(%ebp)
  288310: 74 08                        	je	8 <tek_decmain5+0xa47>
  288312: 8b 45 a0                     	movl	-96(%ebp), %eax
  288315: 89 45 e4                     	movl	%eax, -28(%ebp)
  288318: eb 3f                        	jmp	63 <tek_decmain5+0xa86>
  28831a: 83 7d bc 00                  	cmpl	$0, -68(%ebp)
  28831e: 75 2d                        	jne	45 <tek_decmain5+0xa7a>
  288320: 8b 45 b4                     	movl	-76(%ebp), %eax
  288323: 8d 90 dc 02 00 00            	leal	732(%eax), %edx
  288329: 8b 45 b0                     	movl	-80(%ebp), %eax
  28832c: 05 b8 1e 00 00               	addl	$7864, %eax
  288331: 83 ec 0c                     	subl	$12, %esp
  288334: 52                           	pushl	%edx
  288335: 6a 00                        	pushl	$0
  288337: 6a 71                        	pushl	$113
  288339: 50                           	pushl	%eax
  28833a: ff 75 b4                     	pushl	-76(%ebp)
  28833d: e8 5d f0 ff ff               	calll	-4003 <tek_rdget1>
  288342: 83 c4 20                     	addl	$32, %esp
  288345: 85 c0                        	testl	%eax, %eax
  288347: 0f 84 ae 00 00 00            	je	174 <tek_decmain5+0xb28>
  28834d: 8b 45 a4                     	movl	-92(%ebp), %eax
  288350: 89 45 e4                     	movl	%eax, -28(%ebp)
  288353: 8b 45 a0                     	movl	-96(%ebp), %eax
  288356: 89 45 a4                     	movl	%eax, -92(%ebp)
  288359: 8b 45 9c                     	movl	-100(%ebp), %eax
  28835c: 89 45 a0                     	movl	%eax, -96(%ebp)
  28835f: 8b 45 98                     	movl	-104(%ebp), %eax
  288362: 89 45 9c                     	movl	%eax, -100(%ebp)
  288365: 8b 45 e4                     	movl	-28(%ebp), %eax
  288368: 89 45 98                     	movl	%eax, -104(%ebp)
  28836b: ff 75 bc                     	pushl	-68(%ebp)
  28836e: ff 75 a8                     	pushl	-88(%ebp)
  288371: 6a 01                        	pushl	$1
  288373: ff 75 b4                     	pushl	-76(%ebp)
  288376: e8 69 f3 ff ff               	calll	-3223 <tek_getlen5>
  28837b: 83 c4 10                     	addl	$16, %esp
  28837e: 89 45 e4                     	movl	%eax, -28(%ebp)
  288381: 83 7d d4 06                  	cmpl	$6, -44(%ebp)
  288385: 7f 07                        	jg	7 <tek_decmain5+0xabb>
  288387: b8 08 00 00 00               	movl	$8, %eax
  28838c: eb 05                        	jmp	5 <tek_decmain5+0xac0>
  28838e: b8 0b 00 00 00               	movl	$11, %eax
  288393: 89 45 d4                     	movl	%eax, -44(%ebp)
  288396: 83 45 e4 02                  	addl	$2, -28(%ebp)
  28839a: 8b 55 98                     	movl	-104(%ebp), %edx
  28839d: 8b 45 d0                     	movl	-48(%ebp), %eax
  2883a0: 01 d0                        	addl	%edx, %eax
  2883a2: 85 c0                        	testl	%eax, %eax
  2883a4: 78 58                        	js	88 <tek_decmain5+0xb2b>
  2883a6: 8b 55 d0                     	movl	-48(%ebp), %edx
  2883a9: 8b 45 e4                     	movl	-28(%ebp), %eax
  2883ac: 01 d0                        	addl	%edx, %eax
  2883ae: 39 45 10                     	cmpl	%eax, 16(%ebp)
  2883b1: 7d 09                        	jge	9 <tek_decmain5+0xae9>
  2883b3: 8b 45 10                     	movl	16(%ebp), %eax
  2883b6: 2b 45 d0                     	subl	-48(%ebp), %eax
  2883b9: 89 45 e4                     	movl	%eax, -28(%ebp)
  2883bc: 8b 45 e4                     	movl	-28(%ebp), %eax
  2883bf: 01 45 d0                     	addl	%eax, -48(%ebp)
  2883c2: 8b 45 98                     	movl	-104(%ebp), %eax
  2883c5: 89 c2                        	movl	%eax, %edx
  2883c7: 8b 45 14                     	movl	20(%ebp), %eax
  2883ca: 01 d0                        	addl	%edx, %eax
  2883cc: 0f b6 10                     	movzbl	(%eax), %edx
  2883cf: 8b 45 14                     	movl	20(%ebp), %eax
  2883d2: 88 10                        	movb	%dl, (%eax)
  2883d4: 83 45 14 01                  	addl	$1, 20(%ebp)
  2883d8: 83 6d e4 01                  	subl	$1, -28(%ebp)
  2883dc: 83 7d e4 00                  	cmpl	$0, -28(%ebp)
  2883e0: 75 e0                        	jne	-32 <tek_decmain5+0xaef>
  2883e2: 8b 45 d0                     	movl	-48(%ebp), %eax
  2883e5: 3b 45 10                     	cmpl	16(%ebp), %eax
  2883e8: 0f 8c bb f9 ff ff            	jl	-1605 <tek_decmain5+0x4d6>
  2883ee: b8 00 00 00 00               	movl	$0, %eax
  2883f3: eb 0f                        	jmp	15 <tek_decmain5+0xb31>
  2883f5: 90                           	nop
  2883f6: eb 07                        	jmp	7 <tek_decmain5+0xb2c>
  2883f8: 90                           	nop
  2883f9: eb 04                        	jmp	4 <tek_decmain5+0xb2c>
  2883fb: 90                           	nop
  2883fc: eb 01                        	jmp	1 <tek_decmain5+0xb2c>
  2883fe: 90                           	nop
  2883ff: b8 01 00 00 00               	movl	$1, %eax
  288404: 8d 65 f4                     	leal	-12(%ebp), %esp
  288407: 5b                           	popl	%ebx
  288408: 5e                           	popl	%esi
  288409: 5f                           	popl	%edi
  28840a: 5d                           	popl	%ebp
  28840b: c3                           	retl

0028840c tek_decode5:
  28840c: 55                           	pushl	%ebp
  28840d: 89 e5                        	movl	%esp, %ebp
  28840f: 83 ec 28                     	subl	$40, %esp
  288412: 8b 55 0c                     	movl	12(%ebp), %edx
  288415: 8b 45 08                     	movl	8(%ebp), %eax
  288418: 01 d0                        	addl	%edx, %eax
  28841a: 89 45 f0                     	movl	%eax, -16(%ebp)
  28841d: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
  288424: 8b 45 0c                     	movl	12(%ebp), %eax
  288427: 83 c0 10                     	addl	$16, %eax
  28842a: 89 45 0c                     	movl	%eax, 12(%ebp)
  28842d: 8d 45 0c                     	leal	12(%ebp), %eax
  288430: 50                           	pushl	%eax
  288431: e8 c2 e4 ff ff               	calll	-6974 <tek_getnum_s7s>
  288436: 83 c4 04                     	addl	$4, %esp
  288439: 89 45 ec                     	movl	%eax, -20(%ebp)
  28843c: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
  288440: 0f 8e db 00 00 00            	jle	219 <tek_decode5+0x115>
  288446: 8d 45 0c                     	leal	12(%ebp), %eax
  288449: 50                           	pushl	%eax
  28844a: e8 a9 e4 ff ff               	calll	-6999 <tek_getnum_s7s>
  28844f: 83 c4 04                     	addl	$4, %esp
  288452: 89 45 e8                     	movl	%eax, -24(%ebp)
  288455: 8b 45 e8                     	movl	-24(%ebp), %eax
  288458: 83 e0 01                     	andl	$1, %eax
  28845b: 85 c0                        	testl	%eax, %eax
  28845d: 75 29                        	jne	41 <tek_decode5+0x7c>
  28845f: 8b 45 0c                     	movl	12(%ebp), %eax
  288462: 8d 50 ff                     	leal	-1(%eax), %edx
  288465: 8b 45 f0                     	movl	-16(%ebp), %eax
  288468: 8b 4d 0c                     	movl	12(%ebp), %ecx
  28846b: 29 c8                        	subl	%ecx, %eax
  28846d: 83 c0 01                     	addl	$1, %eax
  288470: ff 75 10                     	pushl	16(%ebp)
  288473: ff 75 ec                     	pushl	-20(%ebp)
  288476: 52                           	pushl	%edx
  288477: 50                           	pushl	%eax
  288478: e8 de eb ff ff               	calll	-5154 <tek_lzrestore_tek5>
  28847d: 83 c4 10                     	addl	$16, %esp
  288480: 89 45 f4                     	movl	%eax, -12(%ebp)
  288483: e9 99 00 00 00               	jmp	153 <tek_decode5+0x115>
  288488: 8b 45 e8                     	movl	-24(%ebp), %eax
  28848b: d1 f8                        	sarl	%eax
  28848d: 83 e0 0f                     	andl	$15, %eax
  288490: 83 c0 08                     	addl	$8, %eax
  288493: ba 01 00 00 00               	movl	$1, %edx
  288498: 89 c1                        	movl	%eax, %ecx
  28849a: d3 e2                        	shll	%cl, %edx
  28849c: 89 d0                        	movl	%edx, %eax
  28849e: 89 45 e4                     	movl	%eax, -28(%ebp)
  2884a1: 8b 45 e8                     	movl	-24(%ebp), %eax
  2884a4: 83 e0 20                     	andl	$32, %eax
  2884a7: 85 c0                        	testl	%eax, %eax
  2884a9: 74 07                        	je	7 <tek_decode5+0xa6>
  2884ab: b8 01 00 00 00               	movl	$1, %eax
  2884b0: eb 72                        	jmp	114 <tek_decode5+0x118>
  2884b2: 81 7d e4 00 01 00 00         	cmpl	$256, -28(%ebp)
  2884b9: 75 20                        	jne	32 <tek_decode5+0xcf>
  2884bb: 8b 45 0c                     	movl	12(%ebp), %eax
  2884be: 8b 55 f0                     	movl	-16(%ebp), %edx
  2884c1: 8b 4d 0c                     	movl	12(%ebp), %ecx
  2884c4: 29 ca                        	subl	%ecx, %edx
  2884c6: ff 75 10                     	pushl	16(%ebp)
  2884c9: ff 75 ec                     	pushl	-20(%ebp)
  2884cc: 50                           	pushl	%eax
  2884cd: 52                           	pushl	%edx
  2884ce: e8 88 eb ff ff               	calll	-5240 <tek_lzrestore_tek5>
  2884d3: 83 c4 10                     	addl	$16, %esp
  2884d6: 89 45 f4                     	movl	%eax, -12(%ebp)
  2884d9: eb 46                        	jmp	70 <tek_decode5+0x115>
  2884db: 8b 45 ec                     	movl	-20(%ebp), %eax
  2884de: 3b 45 e4                     	cmpl	-28(%ebp), %eax
  2884e1: 7e 07                        	jle	7 <tek_decode5+0xde>
  2884e3: b8 01 00 00 00               	movl	$1, %eax
  2884e8: eb 3a                        	jmp	58 <tek_decode5+0x118>
  2884ea: 8b 45 e8                     	movl	-24(%ebp), %eax
  2884ed: 83 e0 40                     	andl	$64, %eax
  2884f0: 85 c0                        	testl	%eax, %eax
  2884f2: 74 0f                        	je	15 <tek_decode5+0xf7>
  2884f4: 83 ec 0c                     	subl	$12, %esp
  2884f7: 8d 45 0c                     	leal	12(%ebp), %eax
  2884fa: 50                           	pushl	%eax
  2884fb: e8 f8 e3 ff ff               	calll	-7176 <tek_getnum_s7s>
  288500: 83 c4 10                     	addl	$16, %esp
  288503: 8b 45 0c                     	movl	12(%ebp), %eax
  288506: 8b 55 f0                     	movl	-16(%ebp), %edx
  288509: 8b 4d 0c                     	movl	12(%ebp), %ecx
  28850c: 29 ca                        	subl	%ecx, %edx
  28850e: ff 75 10                     	pushl	16(%ebp)
  288511: ff 75 ec                     	pushl	-20(%ebp)
  288514: 50                           	pushl	%eax
  288515: 52                           	pushl	%edx
  288516: e8 40 eb ff ff               	calll	-5312 <tek_lzrestore_tek5>
  28851b: 83 c4 10                     	addl	$16, %esp
  28851e: 89 45 f4                     	movl	%eax, -12(%ebp)
  288521: 8b 45 f4                     	movl	-12(%ebp), %eax
  288524: c9                           	leave
  288525: c3                           	retl

00288526 memcmp:
  288526: 55                           	pushl	%ebp
  288527: 89 e5                        	movl	%esp, %ebp
  288529: 83 ec 10                     	subl	$16, %esp
  28852c: 8b 45 08                     	movl	8(%ebp), %eax
  28852f: 89 45 fc                     	movl	%eax, -4(%ebp)
  288532: 8b 45 0c                     	movl	12(%ebp), %eax
  288535: 89 45 f8                     	movl	%eax, -8(%ebp)
  288538: eb 30                        	jmp	48 <memcmp+0x44>
  28853a: 8b 45 fc                     	movl	-4(%ebp), %eax
  28853d: 0f b6 10                     	movzbl	(%eax), %edx
  288540: 8b 45 f8                     	movl	-8(%ebp), %eax
  288543: 0f b6 00                     	movzbl	(%eax), %eax
  288546: 38 c2                        	cmpb	%al, %dl
  288548: 74 18                        	je	24 <memcmp+0x3c>
  28854a: 8b 45 fc                     	movl	-4(%ebp), %eax
  28854d: 0f b6 00                     	movzbl	(%eax), %eax
  288550: 0f be d0                     	movsbl	%al, %edx
  288553: 8b 45 f8                     	movl	-8(%ebp), %eax
  288556: 0f b6 00                     	movzbl	(%eax), %eax
  288559: 0f be c0                     	movsbl	%al, %eax
  28855c: 29 c2                        	subl	%eax, %edx
  28855e: 89 d0                        	movl	%edx, %eax
  288560: eb 1a                        	jmp	26 <memcmp+0x56>
  288562: 83 45 fc 01                  	addl	$1, -4(%ebp)
  288566: 83 45 f8 01                  	addl	$1, -8(%ebp)
  28856a: 8b 45 10                     	movl	16(%ebp), %eax
  28856d: 8d 50 ff                     	leal	-1(%eax), %edx
  288570: 89 55 10                     	movl	%edx, 16(%ebp)
  288573: 85 c0                        	testl	%eax, %eax
  288575: 75 c3                        	jne	-61 <memcmp+0x14>
  288577: b8 00 00 00 00               	movl	$0, %eax
  28857c: c9                           	leave
  28857d: c3                           	retl

0028857e sprintf:
  28857e: 55                           	pushl	%ebp
  28857f: 89 e5                        	movl	%esp, %ebp
  288581: 83 ec 18                     	subl	$24, %esp
  288584: 8d 45 10                     	leal	16(%ebp), %eax
  288587: 89 45 f0                     	movl	%eax, -16(%ebp)
  28858a: 8b 45 f0                     	movl	-16(%ebp), %eax
  28858d: 83 ec 04                     	subl	$4, %esp
  288590: 50                           	pushl	%eax
  288591: ff 75 0c                     	pushl	12(%ebp)
  288594: ff 75 08                     	pushl	8(%ebp)
  288597: e8 02 01 00 00               	calll	258 <vsprintf>
  28859c: 83 c4 10                     	addl	$16, %esp
  28859f: 89 45 f4                     	movl	%eax, -12(%ebp)
  2885a2: 8b 45 f4                     	movl	-12(%ebp), %eax
  2885a5: c9                           	leave
  2885a6: c3                           	retl

002885a7 strcmp:
  2885a7: 55                           	pushl	%ebp
  2885a8: 89 e5                        	movl	%esp, %ebp
  2885aa: eb 30                        	jmp	48 <strcmp+0x35>
  2885ac: 8b 45 08                     	movl	8(%ebp), %eax
  2885af: 0f b6 10                     	movzbl	(%eax), %edx
  2885b2: 8b 45 0c                     	movl	12(%ebp), %eax
  2885b5: 0f b6 00                     	movzbl	(%eax), %eax
  2885b8: 38 c2                        	cmpb	%al, %dl
  2885ba: 74 18                        	je	24 <strcmp+0x2d>
  2885bc: 8b 45 08                     	movl	8(%ebp), %eax
  2885bf: 0f b6 00                     	movzbl	(%eax), %eax
  2885c2: 0f be d0                     	movsbl	%al, %edx
  2885c5: 8b 45 0c                     	movl	12(%ebp), %eax
  2885c8: 0f b6 00                     	movzbl	(%eax), %eax
  2885cb: 0f be c0                     	movsbl	%al, %eax
  2885ce: 29 c2                        	subl	%eax, %edx
  2885d0: 89 d0                        	movl	%edx, %eax
  2885d2: eb 28                        	jmp	40 <strcmp+0x55>
  2885d4: 83 45 08 01                  	addl	$1, 8(%ebp)
  2885d8: 83 45 0c 01                  	addl	$1, 12(%ebp)
  2885dc: 8b 45 08                     	movl	8(%ebp), %eax
  2885df: 0f b6 00                     	movzbl	(%eax), %eax
  2885e2: 84 c0                        	testb	%al, %al
  2885e4: 75 c6                        	jne	-58 <strcmp+0x5>
  2885e6: 8b 45 08                     	movl	8(%ebp), %eax
  2885e9: 0f b6 00                     	movzbl	(%eax), %eax
  2885ec: 0f be d0                     	movsbl	%al, %edx
  2885ef: 8b 45 0c                     	movl	12(%ebp), %eax
  2885f2: 0f b6 00                     	movzbl	(%eax), %eax
  2885f5: 0f be c0                     	movsbl	%al, %eax
  2885f8: 29 c2                        	subl	%eax, %edx
  2885fa: 89 d0                        	movl	%edx, %eax
  2885fc: 5d                           	popl	%ebp
  2885fd: c3                           	retl

002885fe strncmp:
  2885fe: 55                           	pushl	%ebp
  2885ff: 89 e5                        	movl	%esp, %ebp
  288601: eb 3d                        	jmp	61 <strncmp+0x42>
  288603: 8b 45 08                     	movl	8(%ebp), %eax
  288606: 0f b6 00                     	movzbl	(%eax), %eax
  288609: 84 c0                        	testb	%al, %al
  28860b: 74 12                        	je	18 <strncmp+0x21>
  28860d: 8b 45 08                     	movl	8(%ebp), %eax
  288610: 0f b6 10                     	movzbl	(%eax), %edx
  288613: 8b 45 0c                     	movl	12(%ebp), %eax
  288616: 0f b6 00                     	movzbl	(%eax), %eax
  288619: 38 c2                        	cmpb	%al, %dl
  28861b: 74 1b                        	je	27 <strncmp+0x3a>
  28861d: eb 01                        	jmp	1 <strncmp+0x22>
  28861f: 90                           	nop
  288620: 8b 45 08                     	movl	8(%ebp), %eax
  288623: 0f b6 00                     	movzbl	(%eax), %eax
  288626: 0f be d0                     	movsbl	%al, %edx
  288629: 8b 45 0c                     	movl	12(%ebp), %eax
  28862c: 0f b6 00                     	movzbl	(%eax), %eax
  28862f: 0f be c0                     	movsbl	%al, %eax
  288632: 29 c2                        	subl	%eax, %edx
  288634: 89 d0                        	movl	%edx, %eax
  288636: eb 1a                        	jmp	26 <strncmp+0x54>
  288638: 83 45 08 01                  	addl	$1, 8(%ebp)
  28863c: 83 45 0c 01                  	addl	$1, 12(%ebp)
  288640: 8b 45 10                     	movl	16(%ebp), %eax
  288643: 8d 50 ff                     	leal	-1(%eax), %edx
  288646: 89 55 10                     	movl	%edx, 16(%ebp)
  288649: 85 c0                        	testl	%eax, %eax
  28864b: 75 b6                        	jne	-74 <strncmp+0x5>
  28864d: b8 00 00 00 00               	movl	$0, %eax
  288652: 5d                           	popl	%ebp
  288653: c3                           	retl

00288654 setdec:
  288654: 55                           	pushl	%ebp
  288655: 89 e5                        	movl	%esp, %ebp
  288657: 8b 4d 0c                     	movl	12(%ebp), %ecx
  28865a: ba cd cc cc cc               	movl	$3435973837, %edx
  28865f: 89 c8                        	movl	%ecx, %eax
  288661: f7 e2                        	mull	%edx
  288663: c1 ea 03                     	shrl	$3, %edx
  288666: 89 d0                        	movl	%edx, %eax
  288668: c1 e0 02                     	shll	$2, %eax
  28866b: 01 d0                        	addl	%edx, %eax
  28866d: 01 c0                        	addl	%eax, %eax
  28866f: 29 c1                        	subl	%eax, %ecx
  288671: 89 ca                        	movl	%ecx, %edx
  288673: 89 d0                        	movl	%edx, %eax
  288675: 83 6d 08 01                  	subl	$1, 8(%ebp)
  288679: 8d 50 30                     	leal	48(%eax), %edx
  28867c: 8b 45 08                     	movl	8(%ebp), %eax
  28867f: 88 10                        	movb	%dl, (%eax)
  288681: 8b 45 0c                     	movl	12(%ebp), %eax
  288684: ba cd cc cc cc               	movl	$3435973837, %edx
  288689: f7 e2                        	mull	%edx
  28868b: 89 d0                        	movl	%edx, %eax
  28868d: c1 e8 03                     	shrl	$3, %eax
  288690: 89 45 0c                     	movl	%eax, 12(%ebp)
  288693: 83 7d 0c 00                  	cmpl	$0, 12(%ebp)
  288697: 75 be                        	jne	-66 <setdec+0x3>
  288699: 8b 45 08                     	movl	8(%ebp), %eax
  28869c: 5d                           	popl	%ebp
  28869d: c3                           	retl

0028869e vsprintf:
  28869e: 55                           	pushl	%ebp
  28869f: 89 e5                        	movl	%esp, %ebp
  2886a1: 83 ec 58                     	subl	$88, %esp
  2886a4: 8b 45 08                     	movl	8(%ebp), %eax
  2886a7: 89 45 f4                     	movl	%eax, -12(%ebp)
  2886aa: c6 45 da 00                  	movb	$0, -38(%ebp)
  2886ae: 8b 45 0c                     	movl	12(%ebp), %eax
  2886b1: 8d 50 01                     	leal	1(%eax), %edx
  2886b4: 89 55 0c                     	movl	%edx, 12(%ebp)
  2886b7: 0f b6 00                     	movzbl	(%eax), %eax
  2886ba: 88 45 db                     	movb	%al, -37(%ebp)
  2886bd: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2886c1: 3c 25                        	cmpb	$37, %al
  2886c3: 74 31                        	je	49 <vsprintf+0x58>
  2886c5: 90                           	nop
  2886c6: eb 01                        	jmp	1 <vsprintf+0x2b>
  2886c8: 90                           	nop
  2886c9: 8b 45 f4                     	movl	-12(%ebp), %eax
  2886cc: 8d 50 01                     	leal	1(%eax), %edx
  2886cf: 89 55 f4                     	movl	%edx, -12(%ebp)
  2886d2: 0f b6 55 db                  	movzbl	-37(%ebp), %edx
  2886d6: 88 10                        	movb	%dl, (%eax)
  2886d8: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2886dc: 84 c0                        	testb	%al, %al
  2886de: 0f 85 5c 04 00 00            	jne	1116 <vsprintf+0x4a2>
  2886e4: 8b 55 f4                     	movl	-12(%ebp), %edx
  2886e7: 8b 45 08                     	movl	8(%ebp), %eax
  2886ea: 29 c2                        	subl	%eax, %edx
  2886ec: 89 d0                        	movl	%edx, %eax
  2886ee: 83 e8 01                     	subl	$1, %eax
  2886f1: e9 50 04 00 00               	jmp	1104 <vsprintf+0x4a8>
  2886f6: c6 45 ee 00                  	movb	$0, -18(%ebp)
  2886fa: 0f b6 45 ee                  	movzbl	-18(%ebp), %eax
  2886fe: 88 45 ef                     	movb	%al, -17(%ebp)
  288701: 8b 45 0c                     	movl	12(%ebp), %eax
  288704: 8d 50 01                     	leal	1(%eax), %edx
  288707: 89 55 0c                     	movl	%edx, 12(%ebp)
  28870a: 0f b6 00                     	movzbl	(%eax), %eax
  28870d: 88 45 db                     	movb	%al, -37(%ebp)
  288710: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288714: 3c 2d                        	cmpb	$45, %al
  288716: 75 06                        	jne	6 <vsprintf+0x80>
  288718: c6 45 ef 01                  	movb	$1, -17(%ebp)
  28871c: eb 0c                        	jmp	12 <vsprintf+0x8c>
  28871e: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288722: 3c 30                        	cmpb	$48, %al
  288724: 75 15                        	jne	21 <vsprintf+0x9d>
  288726: c6 45 ee 01                  	movb	$1, -18(%ebp)
  28872a: 8b 45 0c                     	movl	12(%ebp), %eax
  28872d: 8d 50 01                     	leal	1(%eax), %edx
  288730: 89 55 0c                     	movl	%edx, 12(%ebp)
  288733: 0f b6 00                     	movzbl	(%eax), %eax
  288736: 88 45 db                     	movb	%al, -37(%ebp)
  288739: eb d5                        	jmp	-43 <vsprintf+0x72>
  28873b: 90                           	nop
  28873c: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
  288743: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288747: 3c 30                        	cmpb	$48, %al
  288749: 76 3a                        	jbe	58 <vsprintf+0xe7>
  28874b: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  28874f: 3c 39                        	cmpb	$57, %al
  288751: 77 32                        	ja	50 <vsprintf+0xe7>
  288753: 8b 45 0c                     	movl	12(%ebp), %eax
  288756: 83 e8 01                     	subl	$1, %eax
  288759: 89 45 0c                     	movl	%eax, 12(%ebp)
  28875c: 83 ec 04                     	subl	$4, %esp
  28875f: 8d 45 db                     	leal	-37(%ebp), %eax
  288762: 50                           	pushl	%eax
  288763: 6a 0a                        	pushl	$10
  288765: 8d 45 0c                     	leal	12(%ebp), %eax
  288768: 50                           	pushl	%eax
  288769: e8 4a 04 00 00               	calll	1098 <strtoul0>
  28876e: 83 c4 10                     	addl	$16, %esp
  288771: 89 45 e4                     	movl	%eax, -28(%ebp)
  288774: 8b 45 0c                     	movl	12(%ebp), %eax
  288777: 8d 50 01                     	leal	1(%eax), %edx
  28877a: 89 55 0c                     	movl	%edx, 12(%ebp)
  28877d: 0f b6 00                     	movzbl	(%eax), %eax
  288780: 88 45 db                     	movb	%al, -37(%ebp)
  288783: eb 25                        	jmp	37 <vsprintf+0x10c>
  288785: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288789: 3c 2a                        	cmpb	$42, %al
  28878b: 75 1d                        	jne	29 <vsprintf+0x10c>
  28878d: 8b 45 10                     	movl	16(%ebp), %eax
  288790: 8d 50 04                     	leal	4(%eax), %edx
  288793: 89 55 10                     	movl	%edx, 16(%ebp)
  288796: 8b 00                        	movl	(%eax), %eax
  288798: 89 45 e4                     	movl	%eax, -28(%ebp)
  28879b: 8b 45 0c                     	movl	12(%ebp), %eax
  28879e: 8d 50 01                     	leal	1(%eax), %edx
  2887a1: 89 55 0c                     	movl	%edx, 12(%ebp)
  2887a4: 0f b6 00                     	movzbl	(%eax), %eax
  2887a7: 88 45 db                     	movb	%al, -37(%ebp)
  2887aa: c7 45 e0 ff ff ff 7f         	movl	$2147483647, -32(%ebp)
  2887b1: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2887b5: 3c 2e                        	cmpb	$46, %al
  2887b7: 75 76                        	jne	118 <vsprintf+0x191>
  2887b9: 8b 45 0c                     	movl	12(%ebp), %eax
  2887bc: 8d 50 01                     	leal	1(%eax), %edx
  2887bf: 89 55 0c                     	movl	%edx, 12(%ebp)
  2887c2: 0f b6 00                     	movzbl	(%eax), %eax
  2887c5: 88 45 db                     	movb	%al, -37(%ebp)
  2887c8: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2887cc: 3c 30                        	cmpb	$48, %al
  2887ce: 76 3a                        	jbe	58 <vsprintf+0x16c>
  2887d0: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2887d4: 3c 39                        	cmpb	$57, %al
  2887d6: 77 32                        	ja	50 <vsprintf+0x16c>
  2887d8: 8b 45 0c                     	movl	12(%ebp), %eax
  2887db: 83 e8 01                     	subl	$1, %eax
  2887de: 89 45 0c                     	movl	%eax, 12(%ebp)
  2887e1: 83 ec 04                     	subl	$4, %esp
  2887e4: 8d 45 db                     	leal	-37(%ebp), %eax
  2887e7: 50                           	pushl	%eax
  2887e8: 6a 0a                        	pushl	$10
  2887ea: 8d 45 0c                     	leal	12(%ebp), %eax
  2887ed: 50                           	pushl	%eax
  2887ee: e8 c5 03 00 00               	calll	965 <strtoul0>
  2887f3: 83 c4 10                     	addl	$16, %esp
  2887f6: 89 45 e4                     	movl	%eax, -28(%ebp)
  2887f9: 8b 45 0c                     	movl	12(%ebp), %eax
  2887fc: 8d 50 01                     	leal	1(%eax), %edx
  2887ff: 89 55 0c                     	movl	%edx, 12(%ebp)
  288802: 0f b6 00                     	movzbl	(%eax), %eax
  288805: 88 45 db                     	movb	%al, -37(%ebp)
  288808: eb 25                        	jmp	37 <vsprintf+0x191>
  28880a: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  28880e: 3c 2a                        	cmpb	$42, %al
  288810: 75 1d                        	jne	29 <vsprintf+0x191>
  288812: 8b 45 10                     	movl	16(%ebp), %eax
  288815: 8d 50 04                     	leal	4(%eax), %edx
  288818: 89 55 10                     	movl	%edx, 16(%ebp)
  28881b: 8b 00                        	movl	(%eax), %eax
  28881d: 89 45 e0                     	movl	%eax, -32(%ebp)
  288820: 8b 45 0c                     	movl	12(%ebp), %eax
  288823: 8d 50 01                     	leal	1(%eax), %edx
  288826: 89 55 0c                     	movl	%edx, 12(%ebp)
  288829: 0f b6 00                     	movzbl	(%eax), %eax
  28882c: 88 45 db                     	movb	%al, -37(%ebp)
  28882f: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288833: 3c 73                        	cmpb	$115, %al
  288835: 0f 85 a0 00 00 00            	jne	160 <vsprintf+0x23d>
  28883b: 81 7d e0 ff ff ff 7f         	cmpl	$2147483647, -32(%ebp)
  288842: 0f 85 ef 02 00 00            	jne	751 <vsprintf+0x499>
  288848: 8b 45 10                     	movl	16(%ebp), %eax
  28884b: 8d 50 04                     	leal	4(%eax), %edx
  28884e: 89 55 10                     	movl	%edx, 16(%ebp)
  288851: 8b 00                        	movl	(%eax), %eax
  288853: 89 45 f0                     	movl	%eax, -16(%ebp)
  288856: 83 ec 0c                     	subl	$12, %esp
  288859: ff 75 f0                     	pushl	-16(%ebp)
  28885c: e8 e7 02 00 00               	calll	743 <strlen>
  288861: 83 c4 10                     	addl	$16, %esp
  288864: 89 45 b4                     	movl	%eax, -76(%ebp)
  288867: 8b 45 f0                     	movl	-16(%ebp), %eax
  28886a: 0f b6 00                     	movzbl	(%eax), %eax
  28886d: 84 c0                        	testb	%al, %al
  28886f: 74 5d                        	je	93 <vsprintf+0x230>
  288871: c6 45 db 20                  	movb	$32, -37(%ebp)
  288875: eb 01                        	jmp	1 <vsprintf+0x1da>
  288877: 90                           	nop
  288878: 80 7d ef 00                  	cmpb	$0, -17(%ebp)
  28887c: 75 1d                        	jne	29 <vsprintf+0x1fd>
  28887e: eb 13                        	jmp	19 <vsprintf+0x1f5>
  288880: 8b 45 f4                     	movl	-12(%ebp), %eax
  288883: 8d 50 01                     	leal	1(%eax), %edx
  288886: 89 55 f4                     	movl	%edx, -12(%ebp)
  288889: 0f b6 55 db                  	movzbl	-37(%ebp), %edx
  28888d: 88 10                        	movb	%dl, (%eax)
  28888f: 83 6d e4 01                  	subl	$1, -28(%ebp)
  288893: 8b 45 b4                     	movl	-76(%ebp), %eax
  288896: 39 45 e4                     	cmpl	%eax, -28(%ebp)
  288899: 7f e5                        	jg	-27 <vsprintf+0x1e2>
  28889b: 8b 55 f0                     	movl	-16(%ebp), %edx
  28889e: 8d 42 01                     	leal	1(%edx), %eax
  2888a1: 89 45 f0                     	movl	%eax, -16(%ebp)
  2888a4: 8b 45 f4                     	movl	-12(%ebp), %eax
  2888a7: 8d 48 01                     	leal	1(%eax), %ecx
  2888aa: 89 4d f4                     	movl	%ecx, -12(%ebp)
  2888ad: 0f b6 12                     	movzbl	(%edx), %edx
  2888b0: 88 10                        	movb	%dl, (%eax)
  2888b2: 8b 45 f0                     	movl	-16(%ebp), %eax
  2888b5: 0f b6 00                     	movzbl	(%eax), %eax
  2888b8: 84 c0                        	testb	%al, %al
  2888ba: 75 df                        	jne	-33 <vsprintf+0x1fd>
  2888bc: eb 10                        	jmp	16 <vsprintf+0x230>
  2888be: 8b 45 f4                     	movl	-12(%ebp), %eax
  2888c1: 8d 50 01                     	leal	1(%eax), %edx
  2888c4: 89 55 f4                     	movl	%edx, -12(%ebp)
  2888c7: c6 00 20                     	movb	$32, (%eax)
  2888ca: 83 6d e4 01                  	subl	$1, -28(%ebp)
  2888ce: 8b 45 b4                     	movl	-76(%ebp), %eax
  2888d1: 39 45 e4                     	cmpl	%eax, -28(%ebp)
  2888d4: 7f e8                        	jg	-24 <vsprintf+0x220>
  2888d6: e9 66 02 00 00               	jmp	614 <vsprintf+0x4a3>
  2888db: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2888df: 3c 6c                        	cmpb	$108, %al
  2888e1: 75 35                        	jne	53 <vsprintf+0x27a>
  2888e3: 8b 45 0c                     	movl	12(%ebp), %eax
  2888e6: 8d 50 01                     	leal	1(%eax), %edx
  2888e9: 89 55 0c                     	movl	%edx, 12(%ebp)
  2888ec: 0f b6 00                     	movzbl	(%eax), %eax
  2888ef: 88 45 db                     	movb	%al, -37(%ebp)
  2888f2: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2888f6: 3c 64                        	cmpb	$100, %al
  2888f8: 74 1e                        	je	30 <vsprintf+0x27a>
  2888fa: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2888fe: 3c 78                        	cmpb	$120, %al
  288900: 74 16                        	je	22 <vsprintf+0x27a>
  288902: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288906: 3c 75                        	cmpb	$117, %al
  288908: 74 0e                        	je	14 <vsprintf+0x27a>
  28890a: 8b 45 0c                     	movl	12(%ebp), %eax
  28890d: 83 e8 01                     	subl	$1, %eax
  288910: 89 45 0c                     	movl	%eax, 12(%ebp)
  288913: e9 26 02 00 00               	jmp	550 <vsprintf+0x4a0>
  288918: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  28891c: 3c 75                        	cmpb	$117, %al
  28891e: 75 10                        	jne	16 <vsprintf+0x292>
  288920: 8b 45 10                     	movl	16(%ebp), %eax
  288923: 8d 50 04                     	leal	4(%eax), %edx
  288926: 89 55 10                     	movl	%edx, 16(%ebp)
  288929: 8b 00                        	movl	(%eax), %eax
  28892b: 89 45 b4                     	movl	%eax, -76(%ebp)
  28892e: eb 40                        	jmp	64 <vsprintf+0x2d2>
  288930: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288934: 3c 64                        	cmpb	$100, %al
  288936: 0f 85 8e 00 00 00            	jne	142 <vsprintf+0x32c>
  28893c: 90                           	nop
  28893d: eb 01                        	jmp	1 <vsprintf+0x2a2>
  28893f: 90                           	nop
  288940: 8b 45 10                     	movl	16(%ebp), %eax
  288943: 8d 50 04                     	leal	4(%eax), %edx
  288946: 89 55 10                     	movl	%edx, 16(%ebp)
  288949: 8b 00                        	movl	(%eax), %eax
  28894b: 89 45 b4                     	movl	%eax, -76(%ebp)
  28894e: 8b 45 b4                     	movl	-76(%ebp), %eax
  288951: 85 c0                        	testl	%eax, %eax
  288953: 79 1a                        	jns	26 <vsprintf+0x2d1>
  288955: 8b 45 f4                     	movl	-12(%ebp), %eax
  288958: 8d 50 01                     	leal	1(%eax), %edx
  28895b: 89 55 f4                     	movl	%edx, -12(%ebp)
  28895e: c6 00 2d                     	movb	$45, (%eax)
  288961: 8b 45 b4                     	movl	-76(%ebp), %eax
  288964: f7 d8                        	negl	%eax
  288966: 89 45 b4                     	movl	%eax, -76(%ebp)
  288969: 83 6d e4 01                  	subl	$1, -28(%ebp)
  28896d: eb 01                        	jmp	1 <vsprintf+0x2d2>
  28896f: 90                           	nop
  288970: 81 7d e0 ff ff ff 7f         	cmpl	$2147483647, -32(%ebp)
  288977: 0f 85 bd 01 00 00            	jne	445 <vsprintf+0x49c>
  28897d: 83 7d e4 00                  	cmpl	$0, -28(%ebp)
  288981: 7f 07                        	jg	7 <vsprintf+0x2ec>
  288983: c7 45 e4 01 00 00 00         	movl	$1, -28(%ebp)
  28898a: 8b 45 b4                     	movl	-76(%ebp), %eax
  28898d: 83 ec 08                     	subl	$8, %esp
  288990: 50                           	pushl	%eax
  288991: 8d 45 bb                     	leal	-69(%ebp), %eax
  288994: 83 c0 1f                     	addl	$31, %eax
  288997: 50                           	pushl	%eax
  288998: e8 b7 fc ff ff               	calll	-841 <setdec>
  28899d: 83 c4 10                     	addl	$16, %esp
  2889a0: 89 45 f0                     	movl	%eax, -16(%ebp)
  2889a3: c6 45 db 20                  	movb	$32, -37(%ebp)
  2889a7: 8d 45 bb                     	leal	-69(%ebp), %eax
  2889aa: 8d 50 1f                     	leal	31(%eax), %edx
  2889ad: 8b 45 f0                     	movl	-16(%ebp), %eax
  2889b0: 29 c2                        	subl	%eax, %edx
  2889b2: 89 d0                        	movl	%edx, %eax
  2889b4: 89 45 b4                     	movl	%eax, -76(%ebp)
  2889b7: 80 7d ee 00                  	cmpb	$0, -18(%ebp)
  2889bb: 0f 84 b6 fe ff ff            	je	-330 <vsprintf+0x1d9>
  2889c1: c6 45 db 30                  	movb	$48, -37(%ebp)
  2889c5: e9 ad fe ff ff               	jmp	-339 <vsprintf+0x1d9>
  2889ca: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2889ce: 3c 69                        	cmpb	$105, %al
  2889d0: 0f 84 69 ff ff ff            	je	-151 <vsprintf+0x2a1>
  2889d6: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2889da: 3c 25                        	cmpb	$37, %al
  2889dc: 0f 84 e6 fc ff ff            	je	-794 <vsprintf+0x2a>
  2889e2: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  2889e6: 3c 78                        	cmpb	$120, %al
  2889e8: 75 4f                        	jne	79 <vsprintf+0x39b>
  2889ea: c7 45 e8 d4 14 31 00         	movl	$3216596, -24(%ebp)
  2889f1: 8b 45 10                     	movl	16(%ebp), %eax
  2889f4: 8d 50 04                     	leal	4(%eax), %edx
  2889f7: 89 55 10                     	movl	%edx, 16(%ebp)
  2889fa: 8b 00                        	movl	(%eax), %eax
  2889fc: 89 45 b4                     	movl	%eax, -76(%ebp)
  2889ff: 8d 45 bb                     	leal	-69(%ebp), %eax
  288a02: 83 c0 1f                     	addl	$31, %eax
  288a05: 89 45 f0                     	movl	%eax, -16(%ebp)
  288a08: 8b 45 b4                     	movl	-76(%ebp), %eax
  288a0b: 83 e0 0f                     	andl	$15, %eax
  288a0e: 89 c2                        	movl	%eax, %edx
  288a10: 8b 45 e8                     	movl	-24(%ebp), %eax
  288a13: 01 d0                        	addl	%edx, %eax
  288a15: 83 6d f0 01                  	subl	$1, -16(%ebp)
  288a19: 0f b6 10                     	movzbl	(%eax), %edx
  288a1c: 8b 45 f0                     	movl	-16(%ebp), %eax
  288a1f: 88 10                        	movb	%dl, (%eax)
  288a21: 8d 45 b4                     	leal	-76(%ebp), %eax
  288a24: 8b 10                        	movl	(%eax), %edx
  288a26: 8d 45 b4                     	leal	-76(%ebp), %eax
  288a29: c1 ea 04                     	shrl	$4, %edx
  288a2c: 89 10                        	movl	%edx, (%eax)
  288a2e: 8b 00                        	movl	(%eax), %eax
  288a30: 85 c0                        	testl	%eax, %eax
  288a32: 75 d4                        	jne	-44 <vsprintf+0x36a>
  288a34: e9 6a ff ff ff               	jmp	-150 <vsprintf+0x305>
  288a39: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288a3d: 3c 58                        	cmpb	$88, %al
  288a3f: 75 09                        	jne	9 <vsprintf+0x3ac>
  288a41: c7 45 e8 e4 14 31 00         	movl	$3216612, -24(%ebp)
  288a48: eb a7                        	jmp	-89 <vsprintf+0x353>
  288a4a: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288a4e: 3c 70                        	cmpb	$112, %al
  288a50: 75 52                        	jne	82 <vsprintf+0x406>
  288a52: 8b 45 10                     	movl	16(%ebp), %eax
  288a55: 8d 50 04                     	leal	4(%eax), %edx
  288a58: 89 55 10                     	movl	%edx, 16(%ebp)
  288a5b: 8b 00                        	movl	(%eax), %eax
  288a5d: 89 45 dc                     	movl	%eax, -36(%ebp)
  288a60: 8d 45 bb                     	leal	-69(%ebp), %eax
  288a63: 83 c0 1f                     	addl	$31, %eax
  288a66: 89 45 f0                     	movl	%eax, -16(%ebp)
  288a69: c7 45 b4 00 00 00 00         	movl	$0, -76(%ebp)
  288a70: eb 25                        	jmp	37 <vsprintf+0x3f9>
  288a72: 8b 45 dc                     	movl	-36(%ebp), %eax
  288a75: 83 e0 0f                     	andl	$15, %eax
  288a78: 0f b6 80 e4 14 31 00         	movzbl	3216612(%eax), %eax
  288a7f: 83 6d f0 01                  	subl	$1, -16(%ebp)
  288a83: 89 c2                        	movl	%eax, %edx
  288a85: 8b 45 f0                     	movl	-16(%ebp), %eax
  288a88: 88 10                        	movb	%dl, (%eax)
  288a8a: c1 7d dc 04                  	sarl	$4, -36(%ebp)
  288a8e: 8b 45 b4                     	movl	-76(%ebp), %eax
  288a91: 83 c0 01                     	addl	$1, %eax
  288a94: 89 45 b4                     	movl	%eax, -76(%ebp)
  288a97: 8b 45 b4                     	movl	-76(%ebp), %eax
  288a9a: 83 f8 07                     	cmpl	$7, %eax
  288a9d: 7e d3                        	jle	-45 <vsprintf+0x3d4>
  288a9f: e9 d4 fd ff ff               	jmp	-556 <vsprintf+0x1da>
  288aa4: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288aa8: 3c 6f                        	cmpb	$111, %al
  288aaa: 75 47                        	jne	71 <vsprintf+0x455>
  288aac: 8b 45 10                     	movl	16(%ebp), %eax
  288aaf: 8d 50 04                     	leal	4(%eax), %edx
  288ab2: 89 55 10                     	movl	%edx, 16(%ebp)
  288ab5: 8b 00                        	movl	(%eax), %eax
  288ab7: 89 45 b4                     	movl	%eax, -76(%ebp)
  288aba: 8d 45 bb                     	leal	-69(%ebp), %eax
  288abd: 83 c0 1f                     	addl	$31, %eax
  288ac0: 89 45 f0                     	movl	%eax, -16(%ebp)
  288ac3: 8b 45 b4                     	movl	-76(%ebp), %eax
  288ac6: 83 e0 07                     	andl	$7, %eax
  288ac9: 0f b6 80 d4 14 31 00         	movzbl	3216596(%eax), %eax
  288ad0: 83 6d f0 01                  	subl	$1, -16(%ebp)
  288ad4: 89 c2                        	movl	%eax, %edx
  288ad6: 8b 45 f0                     	movl	-16(%ebp), %eax
  288ad9: 88 10                        	movb	%dl, (%eax)
  288adb: 8d 45 b4                     	leal	-76(%ebp), %eax
  288ade: 8b 10                        	movl	(%eax), %edx
  288ae0: 8d 45 b4                     	leal	-76(%ebp), %eax
  288ae3: c1 ea 03                     	shrl	$3, %edx
  288ae6: 89 10                        	movl	%edx, (%eax)
  288ae8: 8b 00                        	movl	(%eax), %eax
  288aea: 85 c0                        	testl	%eax, %eax
  288aec: 75 d5                        	jne	-43 <vsprintf+0x425>
  288aee: e9 b0 fe ff ff               	jmp	-336 <vsprintf+0x305>
  288af3: 0f b6 45 db                  	movzbl	-37(%ebp), %eax
  288af7: 3c 66                        	cmpb	$102, %al
  288af9: 75 42                        	jne	66 <vsprintf+0x49f>
  288afb: 81 7d e0 ff ff ff 7f         	cmpl	$2147483647, -32(%ebp)
  288b02: 75 07                        	jne	7 <vsprintf+0x46d>
  288b04: c7 45 e0 06 00 00 00         	movl	$6, -32(%ebp)
  288b0b: 8b 45 e0                     	movl	-32(%ebp), %eax
  288b0e: 83 c0 02                     	addl	$2, %eax
  288b11: 39 45 e4                     	cmpl	%eax, -28(%ebp)
  288b14: 7d 09                        	jge	9 <vsprintf+0x481>
  288b16: 8b 45 e0                     	movl	-32(%ebp), %eax
  288b19: 83 c0 02                     	addl	$2, %eax
  288b1c: 89 45 e4                     	movl	%eax, -28(%ebp)
  288b1f: 8b 45 f4                     	movl	-12(%ebp), %eax
  288b22: 8d 50 01                     	leal	1(%eax), %edx
  288b25: 89 55 f4                     	movl	%edx, -12(%ebp)
  288b28: c6 00 23                     	movb	$35, (%eax)
  288b2b: 83 6d e4 01                  	subl	$1, -28(%ebp)
  288b2f: 83 7d e4 00                  	cmpl	$0, -28(%ebp)
  288b33: 75 ea                        	jne	-22 <vsprintf+0x481>
  288b35: eb 0a                        	jmp	10 <vsprintf+0x4a3>
  288b37: 90                           	nop
  288b38: eb 04                        	jmp	4 <vsprintf+0x4a0>
  288b3a: 90                           	nop
  288b3b: eb 01                        	jmp	1 <vsprintf+0x4a0>
  288b3d: 90                           	nop
  288b3e: eb fe                        	jmp	-2 <vsprintf+0x4a0>
  288b40: 90                           	nop
  288b41: e9 68 fb ff ff               	jmp	-1176 <vsprintf+0x10>
  288b46: c9                           	leave
  288b47: c3                           	retl

00288b48 strlen:
  288b48: 55                           	pushl	%ebp
  288b49: 89 e5                        	movl	%esp, %ebp
  288b4b: 83 ec 10                     	subl	$16, %esp
  288b4e: 8b 45 08                     	movl	8(%ebp), %eax
  288b51: 89 45 fc                     	movl	%eax, -4(%ebp)
  288b54: eb 04                        	jmp	4 <strlen+0x12>
  288b56: 83 45 08 01                  	addl	$1, 8(%ebp)
  288b5a: 8b 45 08                     	movl	8(%ebp), %eax
  288b5d: 0f b6 00                     	movzbl	(%eax), %eax
  288b60: 84 c0                        	testb	%al, %al
  288b62: 75 f2                        	jne	-14 <strlen+0xe>
  288b64: 8b 55 08                     	movl	8(%ebp), %edx
  288b67: 8b 45 fc                     	movl	-4(%ebp), %eax
  288b6a: 29 c2                        	subl	%eax, %edx
  288b6c: 89 d0                        	movl	%edx, %eax
  288b6e: c9                           	leave
  288b6f: c3                           	retl

00288b70 prefix:
  288b70: 55                           	pushl	%ebp
  288b71: 89 e5                        	movl	%esp, %ebp
  288b73: 83 ec 10                     	subl	$16, %esp
  288b76: c6 45 ff 00                  	movb	$0, -1(%ebp)
  288b7a: 83 7d 08 60                  	cmpl	$96, 8(%ebp)
  288b7e: 7e 0a                        	jle	10 <prefix+0x1a>
  288b80: 83 7d 08 7a                  	cmpl	$122, 8(%ebp)
  288b84: 7f 04                        	jg	4 <prefix+0x1a>
  288b86: 83 6d 08 20                  	subl	$32, 8(%ebp)
  288b8a: 83 7d 08 42                  	cmpl	$66, 8(%ebp)
  288b8e: 75 04                        	jne	4 <prefix+0x24>
  288b90: c6 45 ff 02                  	movb	$2, -1(%ebp)
  288b94: 83 7d 08 44                  	cmpl	$68, 8(%ebp)
  288b98: 75 04                        	jne	4 <prefix+0x2e>
  288b9a: c6 45 ff 0a                  	movb	$10, -1(%ebp)
  288b9e: 83 7d 08 4f                  	cmpl	$79, 8(%ebp)
  288ba2: 75 04                        	jne	4 <prefix+0x38>
  288ba4: c6 45 ff 08                  	movb	$8, -1(%ebp)
  288ba8: 83 7d 08 58                  	cmpl	$88, 8(%ebp)
  288bac: 75 04                        	jne	4 <prefix+0x42>
  288bae: c6 45 ff 10                  	movb	$16, -1(%ebp)
  288bb2: 0f be 45 ff                  	movsbl	-1(%ebp), %eax
  288bb6: c9                           	leave
  288bb7: c3                           	retl

00288bb8 strtoul0:
  288bb8: 55                           	pushl	%ebp
  288bb9: 89 e5                        	movl	%esp, %ebp
  288bbb: 83 ec 10                     	subl	$16, %esp
  288bbe: 8b 45 08                     	movl	8(%ebp), %eax
  288bc1: 8b 00                        	movl	(%eax), %eax
  288bc3: 89 45 fc                     	movl	%eax, -4(%ebp)
  288bc6: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
  288bcd: 83 7d 0c 00                  	cmpl	$0, 12(%ebp)
  288bd1: 75 30                        	jne	48 <strtoul0+0x4b>
  288bd3: 83 45 0c 0a                  	addl	$10, 12(%ebp)
  288bd7: 8b 45 fc                     	movl	-4(%ebp), %eax
  288bda: 0f b6 00                     	movzbl	(%eax), %eax
  288bdd: 3c 30                        	cmpb	$48, %al
  288bdf: 75 22                        	jne	34 <strtoul0+0x4b>
  288be1: 8b 45 fc                     	movl	-4(%ebp), %eax
  288be4: 83 c0 01                     	addl	$1, %eax
  288be7: 0f b6 00                     	movzbl	(%eax), %eax
  288bea: 0f b6 c0                     	movzbl	%al, %eax
  288bed: 50                           	pushl	%eax
  288bee: e8 7d ff ff ff               	calll	-131 <prefix>
  288bf3: 83 c4 04                     	addl	$4, %esp
  288bf6: 89 45 0c                     	movl	%eax, 12(%ebp)
  288bf9: 83 7d 0c 00                  	cmpl	$0, 12(%ebp)
  288bfd: 75 04                        	jne	4 <strtoul0+0x4b>
  288bff: 83 45 0c 08                  	addl	$8, 12(%ebp)
  288c03: 8b 45 fc                     	movl	-4(%ebp), %eax
  288c06: 0f b6 00                     	movzbl	(%eax), %eax
  288c09: 3c 30                        	cmpb	$48, %al
  288c0b: 75 1e                        	jne	30 <strtoul0+0x73>
  288c0d: 8b 45 fc                     	movl	-4(%ebp), %eax
  288c10: 83 c0 01                     	addl	$1, %eax
  288c13: 0f b6 00                     	movzbl	(%eax), %eax
  288c16: 0f b6 c0                     	movzbl	%al, %eax
  288c19: 50                           	pushl	%eax
  288c1a: e8 51 ff ff ff               	calll	-175 <prefix>
  288c1f: 83 c4 04                     	addl	$4, %esp
  288c22: 39 45 0c                     	cmpl	%eax, 12(%ebp)
  288c25: 75 04                        	jne	4 <strtoul0+0x73>
  288c27: 83 45 fc 02                  	addl	$2, -4(%ebp)
  288c2b: 8b 4d 0c                     	movl	12(%ebp), %ecx
  288c2e: b8 ff ff ff ff               	movl	$4294967295, %eax
  288c33: ba 00 00 00 00               	movl	$0, %edx
  288c38: f7 f1                        	divl	%ecx
  288c3a: 89 45 f0                     	movl	%eax, -16(%ebp)
  288c3d: 8b 45 10                     	movl	16(%ebp), %eax
  288c40: c6 00 00                     	movb	$0, (%eax)
  288c43: c7 45 f4 63 00 00 00         	movl	$99, -12(%ebp)
  288c4a: 8b 45 fc                     	movl	-4(%ebp), %eax
  288c4d: 0f b6 00                     	movzbl	(%eax), %eax
  288c50: 3c 2f                        	cmpb	$47, %al
  288c52: 76 19                        	jbe	25 <strtoul0+0xb5>
  288c54: 8b 45 fc                     	movl	-4(%ebp), %eax
  288c57: 0f b6 00                     	movzbl	(%eax), %eax
  288c5a: 3c 39                        	cmpb	$57, %al
  288c5c: 77 0f                        	ja	15 <strtoul0+0xb5>
  288c5e: 8b 45 fc                     	movl	-4(%ebp), %eax
  288c61: 0f b6 00                     	movzbl	(%eax), %eax
  288c64: 0f b6 c0                     	movzbl	%al, %eax
  288c67: 83 e8 30                     	subl	$48, %eax
  288c6a: 89 45 f4                     	movl	%eax, -12(%ebp)
  288c6d: 8b 45 fc                     	movl	-4(%ebp), %eax
  288c70: 0f b6 00                     	movzbl	(%eax), %eax
  288c73: 3c 40                        	cmpb	$64, %al
  288c75: 76 19                        	jbe	25 <strtoul0+0xd8>
  288c77: 8b 45 fc                     	movl	-4(%ebp), %eax
  288c7a: 0f b6 00                     	movzbl	(%eax), %eax
  288c7d: 3c 5a                        	cmpb	$90, %al
  288c7f: 77 0f                        	ja	15 <strtoul0+0xd8>
  288c81: 8b 45 fc                     	movl	-4(%ebp), %eax
  288c84: 0f b6 00                     	movzbl	(%eax), %eax
  288c87: 0f b6 c0                     	movzbl	%al, %eax
  288c8a: 83 e8 37                     	subl	$55, %eax
  288c8d: 89 45 f4                     	movl	%eax, -12(%ebp)
  288c90: 8b 45 fc                     	movl	-4(%ebp), %eax
  288c93: 0f b6 00                     	movzbl	(%eax), %eax
  288c96: 3c 60                        	cmpb	$96, %al
  288c98: 76 19                        	jbe	25 <strtoul0+0xfb>
  288c9a: 8b 45 fc                     	movl	-4(%ebp), %eax
  288c9d: 0f b6 00                     	movzbl	(%eax), %eax
  288ca0: 3c 7a                        	cmpb	$122, %al
  288ca2: 77 0f                        	ja	15 <strtoul0+0xfb>
  288ca4: 8b 45 fc                     	movl	-4(%ebp), %eax
  288ca7: 0f b6 00                     	movzbl	(%eax), %eax
  288caa: 0f b6 c0                     	movzbl	%al, %eax
  288cad: 83 e8 57                     	subl	$87, %eax
  288cb0: 89 45 f4                     	movl	%eax, -12(%ebp)
  288cb3: 8b 45 f4                     	movl	-12(%ebp), %eax
  288cb6: 3b 45 0c                     	cmpl	12(%ebp), %eax
  288cb9: 7d 43                        	jge	67 <strtoul0+0x146>
  288cbb: 8b 45 f8                     	movl	-8(%ebp), %eax
  288cbe: 3b 45 f0                     	cmpl	-16(%ebp), %eax
  288cc1: 77 1c                        	ja	28 <strtoul0+0x127>
  288cc3: 8b 45 0c                     	movl	12(%ebp), %eax
  288cc6: 8b 55 f8                     	movl	-8(%ebp), %edx
  288cc9: 0f af c2                     	imull	%edx, %eax
  288ccc: 89 45 f8                     	movl	%eax, -8(%ebp)
  288ccf: 8b 45 f8                     	movl	-8(%ebp), %eax
  288cd2: f7 d0                        	notl	%eax
  288cd4: 89 c2                        	movl	%eax, %edx
  288cd6: 8b 45 f4                     	movl	-12(%ebp), %eax
  288cd9: 39 c2                        	cmpl	%eax, %edx
  288cdb: 73 12                        	jae	18 <strtoul0+0x137>
  288cdd: eb 01                        	jmp	1 <strtoul0+0x128>
  288cdf: 90                           	nop
  288ce0: 8b 45 10                     	movl	16(%ebp), %eax
  288ce3: c6 00 01                     	movb	$1, (%eax)
  288ce6: c7 45 f8 ff ff ff ff         	movl	$4294967295, -8(%ebp)
  288ced: eb 06                        	jmp	6 <strtoul0+0x13d>
  288cef: 8b 45 f4                     	movl	-12(%ebp), %eax
  288cf2: 01 45 f8                     	addl	%eax, -8(%ebp)
  288cf5: 83 45 fc 01                  	addl	$1, -4(%ebp)
  288cf9: e9 45 ff ff ff               	jmp	-187 <strtoul0+0x8b>
  288cfe: 90                           	nop
  288cff: 8b 45 08                     	movl	8(%ebp), %eax
  288d02: 8b 55 fc                     	movl	-4(%ebp), %edx
  288d05: 89 10                        	movl	%edx, (%eax)
  288d07: 8b 45 f8                     	movl	-8(%ebp), %eax
  288d0a: c9                           	leave
  288d0b: c3                           	retl
