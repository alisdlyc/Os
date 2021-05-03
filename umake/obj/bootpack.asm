
bin/bootpack.out:     file format elf32-i386


Disassembly of section .text:

00280000 <HariMain>:
void keywin_on(struct SHEET *key_win);
void close_console(struct SHEET *sht);
void close_constask(struct TASK *task);

void HariMain(void)
{
  280000:	f3 0f 1e fb          	endbr32 
  280004:	55                   	push   %ebp
  280005:	89 e5                	mov    %esp,%ebp
  280007:	81 ec 78 04 00 00    	sub    $0x478,%esp
	struct BOOTINFO *binfo = (struct BOOTINFO *) ADR_BOOTINFO;
  28000d:	c7 45 b4 f0 0f 00 00 	movl   $0xff0,-0x4c(%ebp)
	struct SHTCTL *shtctl;
	char s[40];
	struct FIFO32 fifo, keycmd;
	int fifobuf[128], keycmd_buf[32];
	int mx, my, i, new_mx = -1, new_my = 0, new_wx = 0x7fffffff, new_wy = 0;
  280014:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
  28001b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  280022:	c7 45 e4 ff ff ff 7f 	movl   $0x7fffffff,-0x1c(%ebp)
  280029:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
	unsigned int memtotal;
	struct MOUSE_DEC mdec;
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  280030:	c7 45 b0 00 00 3c 00 	movl   $0x3c0000,-0x50(%ebp)
		0,   0,   0,   0,   0,   0,   0,   '7', '8', '9', '-', '4', '5', '6', '+', '1',
		'2', '3', '0', '.', 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
		0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
		0,   0,   0,   '_', 0,   0,   0,   0,   0,   0,   0,   0,   0,   '|', 0,   0
	};
	int key_shift = 0, key_leds = (binfo->leds >> 4) & 7, keycmd_wait = -1;
  280037:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  28003e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  280041:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  280045:	c0 f8 04             	sar    $0x4,%al
  280048:	0f be c0             	movsbl %al,%eax
  28004b:	83 e0 07             	and    $0x7,%eax
  28004e:	89 45 d8             	mov    %eax,-0x28(%ebp)
  280051:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
	int j, x, y, mmx = -1, mmy = -1, mmx2 = 0;
  280058:	c7 45 cc ff ff ff ff 	movl   $0xffffffff,-0x34(%ebp)
  28005f:	c7 45 c8 ff ff ff ff 	movl   $0xffffffff,-0x38(%ebp)
  280066:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
	struct SHEET *sht = 0, *key_win, *sht2;
  28006d:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
	int *fat;
	unsigned char *nihongo;
	struct FILEINFO *finfo;
	extern char hankaku[4096];

	init_gdtidt();
  280074:	e8 b3 1c 00 00       	call   281d2c <init_gdtidt>
	init_pic();
  280079:	e8 03 1f 00 00       	call   281f81 <init_pic>
	io_sti(); /* IDT/PICÔøΩÃèÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩIÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÃÇÔøΩCPUÔøΩÃäÔøΩÔøΩËçûÔøΩ›ã÷é~ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ */
  28007e:	e8 d1 10 00 00       	call   281154 <io_sti>
	fifo32_init(&fifo, 128, fifobuf, 0);
  280083:	6a 00                	push   $0x0
  280085:	8d 85 20 fd ff ff    	lea    -0x2e0(%ebp),%eax
  28008b:	50                   	push   %eax
  28008c:	68 80 00 00 00       	push   $0x80
  280091:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
  280097:	50                   	push   %eax
  280098:	e8 c3 1f 00 00       	call   282060 <fifo32_init>
  28009d:	83 c4 10             	add    $0x10,%esp
	*((int *) 0x0fec) = (int) &fifo;
  2800a0:	ba ec 0f 00 00       	mov    $0xfec,%edx
  2800a5:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
  2800ab:	89 02                	mov    %eax,(%edx)
	init_pit();
  2800ad:	e8 0c 38 00 00       	call   2838be <init_pit>
	init_keyboard(&fifo, 256);
  2800b2:	83 ec 08             	sub    $0x8,%esp
  2800b5:	68 00 01 00 00       	push   $0x100
  2800ba:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
  2800c0:	50                   	push   %eax
  2800c1:	e8 8f 21 00 00       	call   282255 <init_keyboard>
  2800c6:	83 c4 10             	add    $0x10,%esp
	enable_mouse(&fifo, 512, &mdec);
  2800c9:	83 ec 04             	sub    $0x4,%esp
  2800cc:	8d 85 8c fc ff ff    	lea    -0x374(%ebp),%eax
  2800d2:	50                   	push   %eax
  2800d3:	68 00 02 00 00       	push   $0x200
  2800d8:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
  2800de:	50                   	push   %eax
  2800df:	e8 11 22 00 00       	call   2822f5 <enable_mouse>
  2800e4:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC0_IMR, 0xf8); /* PITÔøΩÔøΩPIC1ÔøΩ∆ÉLÔøΩ[ÔøΩ{ÔøΩ[ÔøΩhÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ(11111000) */
  2800e7:	83 ec 08             	sub    $0x8,%esp
  2800ea:	68 f8 00 00 00       	push   $0xf8
  2800ef:	6a 21                	push   $0x21
  2800f1:	e8 80 10 00 00       	call   281176 <io_out8>
  2800f6:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC1_IMR, 0xef); /* ÔøΩ}ÔøΩEÔøΩXÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ(11101111) */
  2800f9:	83 ec 08             	sub    $0x8,%esp
  2800fc:	68 ef 00 00 00       	push   $0xef
  280101:	68 a1 00 00 00       	push   $0xa1
  280106:	e8 6b 10 00 00       	call   281176 <io_out8>
  28010b:	83 c4 10             	add    $0x10,%esp
	fifo32_init(&keycmd, 32, keycmd_buf, 0);
  28010e:	6a 00                	push   $0x0
  280110:	8d 85 a0 fc ff ff    	lea    -0x360(%ebp),%eax
  280116:	50                   	push   %eax
  280117:	6a 20                	push   $0x20
  280119:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  28011f:	50                   	push   %eax
  280120:	e8 3b 1f 00 00       	call   282060 <fifo32_init>
  280125:	83 c4 10             	add    $0x10,%esp

	memtotal = memtest(0x00400000, 0xbfffffff);
  280128:	83 ec 08             	sub    $0x8,%esp
  28012b:	68 ff ff ff bf       	push   $0xbfffffff
  280130:	68 00 00 40 00       	push   $0x400000
  280135:	e8 50 23 00 00       	call   28248a <memtest>
  28013a:	83 c4 10             	add    $0x10,%esp
  28013d:	89 45 ac             	mov    %eax,-0x54(%ebp)
	memman_init(memman);
  280140:	83 ec 0c             	sub    $0xc,%esp
  280143:	ff 75 b0             	pushl  -0x50(%ebp)
  280146:	e8 fa 23 00 00       	call   282545 <memman_init>
  28014b:	83 c4 10             	add    $0x10,%esp
	memman_free(memman, 0x00001000, 0x0009e000); /* 0x00001000 - 0x0009efff */
  28014e:	83 ec 04             	sub    $0x4,%esp
  280151:	68 00 e0 09 00       	push   $0x9e000
  280156:	68 00 10 00 00       	push   $0x1000
  28015b:	ff 75 b0             	pushl  -0x50(%ebp)
  28015e:	e8 3d 25 00 00       	call   2826a0 <memman_free>
  280163:	83 c4 10             	add    $0x10,%esp
	memman_free(memman, 0x00400000, memtotal - 0x00400000);
  280166:	8b 45 ac             	mov    -0x54(%ebp),%eax
  280169:	2d 00 00 40 00       	sub    $0x400000,%eax
  28016e:	83 ec 04             	sub    $0x4,%esp
  280171:	50                   	push   %eax
  280172:	68 00 00 40 00       	push   $0x400000
  280177:	ff 75 b0             	pushl  -0x50(%ebp)
  28017a:	e8 21 25 00 00       	call   2826a0 <memman_free>
  28017f:	83 c4 10             	add    $0x10,%esp

	init_palette();
  280182:	e8 75 11 00 00       	call   2812fc <init_palette>
	shtctl = shtctl_init(memman, binfo->vram, binfo->scrnx, binfo->scrny);
  280187:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  28018a:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  28018e:	0f bf c8             	movswl %ax,%ecx
  280191:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  280194:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  280198:	0f bf d0             	movswl %ax,%edx
  28019b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  28019e:	8b 40 08             	mov    0x8(%eax),%eax
  2801a1:	51                   	push   %ecx
  2801a2:	52                   	push   %edx
  2801a3:	50                   	push   %eax
  2801a4:	ff 75 b0             	pushl  -0x50(%ebp)
  2801a7:	e8 ab 27 00 00       	call   282957 <shtctl_init>
  2801ac:	83 c4 10             	add    $0x10,%esp
  2801af:	89 45 a8             	mov    %eax,-0x58(%ebp)
	task_a = task_init(memman);
  2801b2:	83 ec 0c             	sub    $0xc,%esp
  2801b5:	ff 75 b0             	pushl  -0x50(%ebp)
  2801b8:	e8 8d 3c 00 00       	call   283e4a <task_init>
  2801bd:	83 c4 10             	add    $0x10,%esp
  2801c0:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	fifo.task = task_a;
  2801c3:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  2801c6:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
	task_run(task_a, 1, 2);
  2801cc:	83 ec 04             	sub    $0x4,%esp
  2801cf:	6a 02                	push   $0x2
  2801d1:	6a 01                	push   $0x1
  2801d3:	ff 75 a4             	pushl  -0x5c(%ebp)
  2801d6:	e8 09 40 00 00       	call   2841e4 <task_run>
  2801db:	83 c4 10             	add    $0x10,%esp
	*((int *) 0x0fe4) = (int) shtctl;
  2801de:	ba e4 0f 00 00       	mov    $0xfe4,%edx
  2801e3:	8b 45 a8             	mov    -0x58(%ebp),%eax
  2801e6:	89 02                	mov    %eax,(%edx)
	task_a->langmode = 0;
  2801e8:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  2801eb:	c6 80 bc 00 00 00 00 	movb   $0x0,0xbc(%eax)

	/* sht_back */
	sht_back  = sheet_alloc(shtctl);
  2801f2:	83 ec 0c             	sub    $0xc,%esp
  2801f5:	ff 75 a8             	pushl  -0x58(%ebp)
  2801f8:	e8 41 28 00 00       	call   282a3e <sheet_alloc>
  2801fd:	83 c4 10             	add    $0x10,%esp
  280200:	89 45 a0             	mov    %eax,-0x60(%ebp)
	buf_back  = (unsigned char *) memman_alloc_4k(memman, binfo->scrnx * binfo->scrny);
  280203:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  280206:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  28020a:	0f bf d0             	movswl %ax,%edx
  28020d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  280210:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  280214:	98                   	cwtl   
  280215:	0f af c2             	imul   %edx,%eax
  280218:	83 ec 08             	sub    $0x8,%esp
  28021b:	50                   	push   %eax
  28021c:	ff 75 b0             	pushl  -0x50(%ebp)
  28021f:	e8 d0 26 00 00       	call   2828f4 <memman_alloc_4k>
  280224:	83 c4 10             	add    $0x10,%esp
  280227:	89 45 9c             	mov    %eax,-0x64(%ebp)
	sheet_setbuf(sht_back, buf_back, binfo->scrnx, binfo->scrny, -1); /* ÔøΩÔøΩÔøΩÔøΩÔøΩFÔøΩ»ÇÔøΩ */
  28022a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  28022d:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  280231:	0f bf d0             	movswl %ax,%edx
  280234:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  280237:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  28023b:	98                   	cwtl   
  28023c:	83 ec 0c             	sub    $0xc,%esp
  28023f:	6a ff                	push   $0xffffffff
  280241:	52                   	push   %edx
  280242:	50                   	push   %eax
  280243:	ff 75 9c             	pushl  -0x64(%ebp)
  280246:	ff 75 a0             	pushl  -0x60(%ebp)
  280249:	e8 75 28 00 00       	call   282ac3 <sheet_setbuf>
  28024e:	83 c4 20             	add    $0x20,%esp
	init_screen8(buf_back, binfo->scrnx, binfo->scrny);
  280251:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  280254:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  280258:	0f bf d0             	movswl %ax,%edx
  28025b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  28025e:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  280262:	98                   	cwtl   
  280263:	83 ec 04             	sub    $0x4,%esp
  280266:	52                   	push   %edx
  280267:	50                   	push   %eax
  280268:	ff 75 9c             	pushl  -0x64(%ebp)
  28026b:	e8 e4 12 00 00       	call   281554 <init_screen8>
  280270:	83 c4 10             	add    $0x10,%esp

	/* sht_cons */
	key_win = open_console(shtctl, memtotal);
  280273:	83 ec 08             	sub    $0x8,%esp
  280276:	ff 75 ac             	pushl  -0x54(%ebp)
  280279:	ff 75 a8             	pushl  -0x58(%ebp)
  28027c:	e8 4c 0d 00 00       	call   280fcd <open_console>
  280281:	83 c4 10             	add    $0x10,%esp
  280284:	89 45 bc             	mov    %eax,-0x44(%ebp)

	/* sht_mouse */
	sht_mouse = sheet_alloc(shtctl);
  280287:	83 ec 0c             	sub    $0xc,%esp
  28028a:	ff 75 a8             	pushl  -0x58(%ebp)
  28028d:	e8 ac 27 00 00       	call   282a3e <sheet_alloc>
  280292:	83 c4 10             	add    $0x10,%esp
  280295:	89 45 98             	mov    %eax,-0x68(%ebp)
	sheet_setbuf(sht_mouse, buf_mouse, 16, 16, 99);
  280298:	83 ec 0c             	sub    $0xc,%esp
  28029b:	6a 63                	push   $0x63
  28029d:	6a 10                	push   $0x10
  28029f:	6a 10                	push   $0x10
  2802a1:	8d 85 8c fb ff ff    	lea    -0x474(%ebp),%eax
  2802a7:	50                   	push   %eax
  2802a8:	ff 75 98             	pushl  -0x68(%ebp)
  2802ab:	e8 13 28 00 00       	call   282ac3 <sheet_setbuf>
  2802b0:	83 c4 20             	add    $0x20,%esp
	init_mouse_cursor8(buf_mouse, 99);
  2802b3:	83 ec 08             	sub    $0x8,%esp
  2802b6:	6a 63                	push   $0x63
  2802b8:	8d 85 8c fb ff ff    	lea    -0x474(%ebp),%eax
  2802be:	50                   	push   %eax
  2802bf:	e8 1b 19 00 00       	call   281bdf <init_mouse_cursor8>
  2802c4:	83 c4 10             	add    $0x10,%esp
	mx = (binfo->scrnx - 16) / 2; /* ÔøΩÔøΩ íÔøΩÔøΩÔøΩÔøΩ…Ç»ÇÔøΩÊÇ§ÔøΩ…çÔøΩÔøΩWÔøΩvÔøΩZ */
  2802c7:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  2802ca:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  2802ce:	98                   	cwtl   
  2802cf:	83 e8 10             	sub    $0x10,%eax
  2802d2:	89 c2                	mov    %eax,%edx
  2802d4:	c1 ea 1f             	shr    $0x1f,%edx
  2802d7:	01 d0                	add    %edx,%eax
  2802d9:	d1 f8                	sar    %eax
  2802db:	89 45 f4             	mov    %eax,-0xc(%ebp)
	my = (binfo->scrny - 28 - 16) / 2;
  2802de:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  2802e1:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  2802e5:	98                   	cwtl   
  2802e6:	83 e8 2c             	sub    $0x2c,%eax
  2802e9:	89 c2                	mov    %eax,%edx
  2802eb:	c1 ea 1f             	shr    $0x1f,%edx
  2802ee:	01 d0                	add    %edx,%eax
  2802f0:	d1 f8                	sar    %eax
  2802f2:	89 45 f0             	mov    %eax,-0x10(%ebp)

	sprintf(s, "(%d, %d)", mx, my);
  2802f5:	ff 75 f0             	pushl  -0x10(%ebp)
  2802f8:	ff 75 f4             	pushl  -0xc(%ebp)
  2802fb:	68 00 11 31 00       	push   $0x311100
  280300:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
  280306:	50                   	push   %eax
  280307:	e8 6d 84 00 00       	call   288779 <sprintf>
  28030c:	83 c4 10             	add    $0x10,%esp

	sheet_slide(sht_back,  0,  0);
  28030f:	83 ec 04             	sub    $0x4,%esp
  280312:	6a 00                	push   $0x0
  280314:	6a 00                	push   $0x0
  280316:	ff 75 a0             	pushl  -0x60(%ebp)
  280319:	e8 5e 34 00 00       	call   28377c <sheet_slide>
  28031e:	83 c4 10             	add    $0x10,%esp
	sheet_slide(key_win,   32, 4);
  280321:	83 ec 04             	sub    $0x4,%esp
  280324:	6a 04                	push   $0x4
  280326:	6a 20                	push   $0x20
  280328:	ff 75 bc             	pushl  -0x44(%ebp)
  28032b:	e8 4c 34 00 00       	call   28377c <sheet_slide>
  280330:	83 c4 10             	add    $0x10,%esp
	sheet_slide(sht_mouse, mx, my);
  280333:	83 ec 04             	sub    $0x4,%esp
  280336:	ff 75 f0             	pushl  -0x10(%ebp)
  280339:	ff 75 f4             	pushl  -0xc(%ebp)
  28033c:	ff 75 98             	pushl  -0x68(%ebp)
  28033f:	e8 38 34 00 00       	call   28377c <sheet_slide>
  280344:	83 c4 10             	add    $0x10,%esp
	sheet_updown(sht_back,  0);
  280347:	83 ec 08             	sub    $0x8,%esp
  28034a:	6a 00                	push   $0x0
  28034c:	ff 75 a0             	pushl  -0x60(%ebp)
  28034f:	e8 38 30 00 00       	call   28338c <sheet_updown>
  280354:	83 c4 10             	add    $0x10,%esp
	sheet_updown(key_win,   1);
  280357:	83 ec 08             	sub    $0x8,%esp
  28035a:	6a 01                	push   $0x1
  28035c:	ff 75 bc             	pushl  -0x44(%ebp)
  28035f:	e8 28 30 00 00       	call   28338c <sheet_updown>
  280364:	83 c4 10             	add    $0x10,%esp
	sheet_updown(sht_mouse, 2);
  280367:	83 ec 08             	sub    $0x8,%esp
  28036a:	6a 02                	push   $0x2
  28036c:	ff 75 98             	pushl  -0x68(%ebp)
  28036f:	e8 18 30 00 00       	call   28338c <sheet_updown>
  280374:	83 c4 10             	add    $0x10,%esp
	keywin_on(key_win);
  280377:	83 ec 0c             	sub    $0xc,%esp
  28037a:	ff 75 bc             	pushl  -0x44(%ebp)
  28037d:	e8 06 0b 00 00       	call   280e88 <keywin_on>
  280382:	83 c4 10             	add    $0x10,%esp

	/* ÔøΩ≈èÔøΩÔøΩ…ÉLÔøΩ[ÔøΩ{ÔøΩ[ÔøΩhÔøΩÔøΩ‘Ç∆ÇÃêHÔøΩÔøΩÔøΩ·Ç¢ÔøΩÔøΩÔøΩ»ÇÔøΩÔøΩÊÇ§ÔøΩ…ÅAÔøΩ›íËÇµÔøΩƒÇÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ∆Ç…ÇÔøΩÔøΩÔøΩ */
	fifo32_put(&keycmd, KEYCMD_LED);
  280385:	83 ec 08             	sub    $0x8,%esp
  280388:	68 ed 00 00 00       	push   $0xed
  28038d:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  280393:	50                   	push   %eax
  280394:	e8 12 1d 00 00       	call   2820ab <fifo32_put>
  280399:	83 c4 10             	add    $0x10,%esp
	fifo32_put(&keycmd, key_leds);
  28039c:	83 ec 08             	sub    $0x8,%esp
  28039f:	ff 75 d8             	pushl  -0x28(%ebp)
  2803a2:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  2803a8:	50                   	push   %eax
  2803a9:	e8 fd 1c 00 00       	call   2820ab <fifo32_put>
  2803ae:	83 c4 10             	add    $0x10,%esp

	/* nihongo.fntÔøΩÃì«Ç›çÔøΩÔøΩÔøΩ */
	fat = (int *) memman_alloc_4k(memman, 4 * 2880);
  2803b1:	83 ec 08             	sub    $0x8,%esp
  2803b4:	68 00 2d 00 00       	push   $0x2d00
  2803b9:	ff 75 b0             	pushl  -0x50(%ebp)
  2803bc:	e8 33 25 00 00       	call   2828f4 <memman_alloc_4k>
  2803c1:	83 c4 10             	add    $0x10,%esp
  2803c4:	89 45 94             	mov    %eax,-0x6c(%ebp)
	file_readfat(fat, (unsigned char *) (ADR_DISKIMG + 0x000200));
  2803c7:	83 ec 08             	sub    $0x8,%esp
  2803ca:	68 00 02 10 00       	push   $0x100200
  2803cf:	ff 75 94             	pushl  -0x6c(%ebp)
  2803d2:	e8 23 63 00 00       	call   2866fa <file_readfat>
  2803d7:	83 c4 10             	add    $0x10,%esp

	finfo = file_search("nihongo.fnt", (struct FILEINFO *) (ADR_DISKIMG + 0x002600), 224);
  2803da:	83 ec 04             	sub    $0x4,%esp
  2803dd:	68 e0 00 00 00       	push   $0xe0
  2803e2:	68 00 26 10 00       	push   $0x102600
  2803e7:	68 09 11 31 00       	push   $0x311109
  2803ec:	e8 69 64 00 00       	call   28685a <file_search>
  2803f1:	83 c4 10             	add    $0x10,%esp
  2803f4:	89 45 90             	mov    %eax,-0x70(%ebp)
	if (finfo != 0) {
  2803f7:	83 7d 90 00          	cmpl   $0x0,-0x70(%ebp)
  2803fb:	74 34                	je     280431 <HariMain+0x431>
		i = finfo->size;
  2803fd:	8b 45 90             	mov    -0x70(%ebp),%eax
  280400:	8b 40 1c             	mov    0x1c(%eax),%eax
  280403:	89 85 9c fc ff ff    	mov    %eax,-0x364(%ebp)
		nihongo = file_loadfile2(finfo->clustno, &i, fat);
  280409:	8b 45 90             	mov    -0x70(%ebp),%eax
  28040c:	0f b7 40 1a          	movzwl 0x1a(%eax),%eax
  280410:	0f b7 c0             	movzwl %ax,%eax
  280413:	83 ec 04             	sub    $0x4,%esp
  280416:	ff 75 94             	pushl  -0x6c(%ebp)
  280419:	8d 95 9c fc ff ff    	lea    -0x364(%ebp),%edx
  28041f:	52                   	push   %edx
  280420:	50                   	push   %eax
  280421:	e8 9d 65 00 00       	call   2869c3 <file_loadfile2>
  280426:	83 c4 10             	add    $0x10,%esp
  280429:	89 45 b8             	mov    %eax,-0x48(%ebp)
  28042c:	e9 92 00 00 00       	jmp    2804c3 <HariMain+0x4c3>
	} else {
		nihongo = (unsigned char *) memman_alloc_4k(memman, 16 * 256 + 32 * 94 * 47);
  280431:	83 ec 08             	sub    $0x8,%esp
  280434:	68 40 38 02 00       	push   $0x23840
  280439:	ff 75 b0             	pushl  -0x50(%ebp)
  28043c:	e8 b3 24 00 00       	call   2828f4 <memman_alloc_4k>
  280441:	83 c4 10             	add    $0x10,%esp
  280444:	89 45 b8             	mov    %eax,-0x48(%ebp)
		for (i = 0; i < 16 * 256; i++) {
  280447:	c7 85 9c fc ff ff 00 	movl   $0x0,-0x364(%ebp)
  28044e:	00 00 00 
  280451:	eb 2b                	jmp    28047e <HariMain+0x47e>
			nihongo[i] = hankaku[i]; /* ÔøΩtÔøΩHÔøΩÔøΩÔøΩgÔøΩÔøΩÔøΩ»ÇÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÃÇ≈îÔøΩÔøΩpÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩRÔøΩsÔøΩ[ */
  280453:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280459:	0f b6 90 00 00 31 00 	movzbl 0x310000(%eax),%edx
  280460:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280466:	89 c1                	mov    %eax,%ecx
  280468:	8b 45 b8             	mov    -0x48(%ebp),%eax
  28046b:	01 c8                	add    %ecx,%eax
  28046d:	88 10                	mov    %dl,(%eax)
		for (i = 0; i < 16 * 256; i++) {
  28046f:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280475:	83 c0 01             	add    $0x1,%eax
  280478:	89 85 9c fc ff ff    	mov    %eax,-0x364(%ebp)
  28047e:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280484:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  280489:	7e c8                	jle    280453 <HariMain+0x453>
		}
		for (i = 16 * 256; i < 16 * 256 + 32 * 94 * 47; i++) {
  28048b:	c7 85 9c fc ff ff 00 	movl   $0x1000,-0x364(%ebp)
  280492:	10 00 00 
  280495:	eb 1f                	jmp    2804b6 <HariMain+0x4b6>
			nihongo[i] = 0xff; /* ÔøΩtÔøΩHÔøΩÔøΩÔøΩgÔøΩÔøΩÔøΩ»ÇÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÃÇ≈ëSÔøΩpÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ0xffÔøΩ≈ñÔøΩÔøΩﬂêsÔøΩÔøΩÔøΩÔøΩ */
  280497:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  28049d:	89 c2                	mov    %eax,%edx
  28049f:	8b 45 b8             	mov    -0x48(%ebp),%eax
  2804a2:	01 d0                	add    %edx,%eax
  2804a4:	c6 00 ff             	movb   $0xff,(%eax)
		for (i = 16 * 256; i < 16 * 256 + 32 * 94 * 47; i++) {
  2804a7:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  2804ad:	83 c0 01             	add    $0x1,%eax
  2804b0:	89 85 9c fc ff ff    	mov    %eax,-0x364(%ebp)
  2804b6:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  2804bc:	3d 3f 38 02 00       	cmp    $0x2383f,%eax
  2804c1:	7e d4                	jle    280497 <HariMain+0x497>
		}
	}
	*((int *) 0x0fe8) = (int) nihongo;
  2804c3:	ba e8 0f 00 00       	mov    $0xfe8,%edx
  2804c8:	8b 45 b8             	mov    -0x48(%ebp),%eax
  2804cb:	89 02                	mov    %eax,(%edx)
	memman_free_4k(memman, (int) fat, 4 * 2880);
  2804cd:	8b 45 94             	mov    -0x6c(%ebp),%eax
  2804d0:	83 ec 04             	sub    $0x4,%esp
  2804d3:	68 00 2d 00 00       	push   $0x2d00
  2804d8:	50                   	push   %eax
  2804d9:	ff 75 b0             	pushl  -0x50(%ebp)
  2804dc:	e8 43 24 00 00       	call   282924 <memman_free_4k>
  2804e1:	83 c4 10             	add    $0x10,%esp

	for (;;) {
		if (fifo32_status(&keycmd) > 0 && keycmd_wait < 0) {
  2804e4:	83 ec 0c             	sub    $0xc,%esp
  2804e7:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  2804ed:	50                   	push   %eax
  2804ee:	e8 dc 1c 00 00       	call   2821cf <fifo32_status>
  2804f3:	83 c4 10             	add    $0x10,%esp
  2804f6:	85 c0                	test   %eax,%eax
  2804f8:	7e 30                	jle    28052a <HariMain+0x52a>
  2804fa:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  2804fe:	79 2a                	jns    28052a <HariMain+0x52a>
			/* ÔøΩLÔøΩ[ÔøΩ{ÔøΩ[ÔøΩhÔøΩRÔøΩÔøΩÔøΩgÔøΩÔøΩÔøΩ[ÔøΩÔøΩÔøΩ…ëÔøΩÔøΩÔøΩfÔøΩ[ÔøΩ^ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩŒÅAÔøΩÔøΩÔøΩÔøΩ */
			keycmd_wait = fifo32_get(&keycmd);
  280500:	83 ec 0c             	sub    $0xc,%esp
  280503:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  280509:	50                   	push   %eax
  28050a:	e8 4d 1c 00 00       	call   28215c <fifo32_get>
  28050f:	83 c4 10             	add    $0x10,%esp
  280512:	89 45 d4             	mov    %eax,-0x2c(%ebp)
			wait_KBC_sendready();
  280515:	e8 17 1d 00 00       	call   282231 <wait_KBC_sendready>
			io_out8(PORT_KEYDAT, keycmd_wait);
  28051a:	83 ec 08             	sub    $0x8,%esp
  28051d:	ff 75 d4             	pushl  -0x2c(%ebp)
  280520:	6a 60                	push   $0x60
  280522:	e8 4f 0c 00 00       	call   281176 <io_out8>
  280527:	83 c4 10             	add    $0x10,%esp
		}
		io_cli();
  28052a:	e8 23 0c 00 00       	call   281152 <io_cli>
		if (fifo32_status(&fifo) == 0) {
  28052f:	83 ec 0c             	sub    $0xc,%esp
  280532:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
  280538:	50                   	push   %eax
  280539:	e8 91 1c 00 00       	call   2821cf <fifo32_status>
  28053e:	83 c4 10             	add    $0x10,%esp
  280541:	85 c0                	test   %eax,%eax
  280543:	75 71                	jne    2805b6 <HariMain+0x5b6>
			/* FIFOÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ€Ç…Ç»ÇÔøΩÔøΩÔøΩÔøΩÃÇ≈ÅAÔøΩ€óÔøΩÔøΩÔøΩÔøΩƒÇÔøΩÔøΩÔøΩ`ÔøΩÊÇ™ÔøΩÔøΩÔøΩÔøΩŒéÔøΩÔøΩsÔøΩÔøΩÔøΩÔøΩ */
			if (new_mx >= 0) {
  280545:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  280549:	78 25                	js     280570 <HariMain+0x570>
				io_sti();
  28054b:	e8 04 0c 00 00       	call   281154 <io_sti>
				sheet_slide(sht_mouse, new_mx, new_my);
  280550:	83 ec 04             	sub    $0x4,%esp
  280553:	ff 75 e8             	pushl  -0x18(%ebp)
  280556:	ff 75 ec             	pushl  -0x14(%ebp)
  280559:	ff 75 98             	pushl  -0x68(%ebp)
  28055c:	e8 1b 32 00 00       	call   28377c <sheet_slide>
  280561:	83 c4 10             	add    $0x10,%esp
				new_mx = -1;
  280564:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
  28056b:	e9 74 ff ff ff       	jmp    2804e4 <HariMain+0x4e4>
			} else if (new_wx != 0x7fffffff) {
  280570:	81 7d e4 ff ff ff 7f 	cmpl   $0x7fffffff,-0x1c(%ebp)
  280577:	74 25                	je     28059e <HariMain+0x59e>
				io_sti();
  280579:	e8 d6 0b 00 00       	call   281154 <io_sti>
				sheet_slide(sht, new_wx, new_wy);
  28057e:	83 ec 04             	sub    $0x4,%esp
  280581:	ff 75 e0             	pushl  -0x20(%ebp)
  280584:	ff 75 e4             	pushl  -0x1c(%ebp)
  280587:	ff 75 c0             	pushl  -0x40(%ebp)
  28058a:	e8 ed 31 00 00       	call   28377c <sheet_slide>
  28058f:	83 c4 10             	add    $0x10,%esp
				new_wx = 0x7fffffff;
  280592:	c7 45 e4 ff ff ff 7f 	movl   $0x7fffffff,-0x1c(%ebp)
  280599:	e9 46 ff ff ff       	jmp    2804e4 <HariMain+0x4e4>
			} else {
				task_sleep(task_a);
  28059e:	83 ec 0c             	sub    $0xc,%esp
  2805a1:	ff 75 a4             	pushl  -0x5c(%ebp)
  2805a4:	e8 ac 3c 00 00       	call   284255 <task_sleep>
  2805a9:	83 c4 10             	add    $0x10,%esp
				io_sti();
  2805ac:	e8 a3 0b 00 00       	call   281154 <io_sti>
  2805b1:	e9 2e ff ff ff       	jmp    2804e4 <HariMain+0x4e4>
			}
		} else {
			i = fifo32_get(&fifo);
  2805b6:	83 ec 0c             	sub    $0xc,%esp
  2805b9:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
  2805bf:	50                   	push   %eax
  2805c0:	e8 97 1b 00 00       	call   28215c <fifo32_get>
  2805c5:	83 c4 10             	add    $0x10,%esp
  2805c8:	89 85 9c fc ff ff    	mov    %eax,-0x364(%ebp)
			io_sti();
  2805ce:	e8 81 0b 00 00       	call   281154 <io_sti>
			if (key_win != 0 && key_win->flags == 0) {	/* ÔøΩEÔøΩBÔøΩÔøΩÔøΩhÔøΩEÔøΩÔøΩÔøΩ¬ÇÔøΩÔøΩÔøΩÍÇΩ */
  2805d3:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
  2805d7:	74 42                	je     28061b <HariMain+0x61b>
  2805d9:	8b 45 bc             	mov    -0x44(%ebp),%eax
  2805dc:	8b 40 1c             	mov    0x1c(%eax),%eax
  2805df:	85 c0                	test   %eax,%eax
  2805e1:	75 38                	jne    28061b <HariMain+0x61b>
				if (shtctl->top == 1) {	/* ÔøΩÔøΩÔøΩÔøΩÔøΩ}ÔøΩEÔøΩXÔøΩ∆îwÔøΩiÔøΩÔøΩÔøΩÔøΩÔøΩ»ÇÔøΩ */
  2805e3:	8b 45 a8             	mov    -0x58(%ebp),%eax
  2805e6:	8b 40 10             	mov    0x10(%eax),%eax
  2805e9:	83 f8 01             	cmp    $0x1,%eax
  2805ec:	75 09                	jne    2805f7 <HariMain+0x5f7>
					key_win = 0;
  2805ee:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
  2805f5:	eb 24                	jmp    28061b <HariMain+0x61b>
				} else {
					key_win = shtctl->sheets[shtctl->top - 1];
  2805f7:	8b 45 a8             	mov    -0x58(%ebp),%eax
  2805fa:	8b 40 10             	mov    0x10(%eax),%eax
  2805fd:	8d 50 ff             	lea    -0x1(%eax),%edx
  280600:	8b 45 a8             	mov    -0x58(%ebp),%eax
  280603:	83 c2 04             	add    $0x4,%edx
  280606:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  28060a:	89 45 bc             	mov    %eax,-0x44(%ebp)
					keywin_on(key_win);
  28060d:	83 ec 0c             	sub    $0xc,%esp
  280610:	ff 75 bc             	pushl  -0x44(%ebp)
  280613:	e8 70 08 00 00       	call   280e88 <keywin_on>
  280618:	83 c4 10             	add    $0x10,%esp
				}
			}
			if (256 <= i && i <= 511) { /* ÔøΩLÔøΩ[ÔøΩ{ÔøΩ[ÔøΩhÔøΩfÔøΩ[ÔøΩ^ */
  28061b:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280621:	3d ff 00 00 00       	cmp    $0xff,%eax
  280626:	0f 8e 8d 03 00 00    	jle    2809b9 <HariMain+0x9b9>
  28062c:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280632:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  280637:	0f 8f 7c 03 00 00    	jg     2809b9 <HariMain+0x9b9>
				if (i < 0x80 + 256) { /* ÔøΩLÔøΩ[ÔøΩRÔøΩ[ÔøΩhÔøΩï∂éÔøΩÔøΩRÔøΩ[ÔøΩhÔøΩ…ïœäÔøΩ */
  28063d:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280643:	3d 7f 01 00 00       	cmp    $0x17f,%eax
  280648:	7f 3a                	jg     280684 <HariMain+0x684>
					if (key_shift == 0) {
  28064a:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  28064e:	75 1a                	jne    28066a <HariMain+0x66a>
						s[0] = keytable0[i - 256];
  280650:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280656:	2d 00 01 00 00       	sub    $0x100,%eax
  28065b:	0f b6 80 00 10 31 00 	movzbl 0x311000(%eax),%eax
  280662:	88 85 58 ff ff ff    	mov    %al,-0xa8(%ebp)
  280668:	eb 21                	jmp    28068b <HariMain+0x68b>
					} else {
						s[0] = keytable1[i - 256];
  28066a:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280670:	2d 00 01 00 00       	sub    $0x100,%eax
  280675:	0f b6 80 80 10 31 00 	movzbl 0x311080(%eax),%eax
  28067c:	88 85 58 ff ff ff    	mov    %al,-0xa8(%ebp)
  280682:	eb 07                	jmp    28068b <HariMain+0x68b>
					}
				} else {
					s[0] = 0;
  280684:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
				}
				if ('A' <= s[0] && s[0] <= 'Z') {	/* ÔøΩÔøΩÔøΩÕïÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩAÔøΩÔøΩÔøΩtÔøΩ@ÔøΩxÔøΩbÔøΩg */
  28068b:	0f b6 85 58 ff ff ff 	movzbl -0xa8(%ebp),%eax
  280692:	3c 40                	cmp    $0x40,%al
  280694:	7e 3b                	jle    2806d1 <HariMain+0x6d1>
  280696:	0f b6 85 58 ff ff ff 	movzbl -0xa8(%ebp),%eax
  28069d:	3c 5a                	cmp    $0x5a,%al
  28069f:	7f 30                	jg     2806d1 <HariMain+0x6d1>
					if (((key_leds & 4) == 0 && key_shift == 0) ||
  2806a1:	8b 45 d8             	mov    -0x28(%ebp),%eax
  2806a4:	83 e0 04             	and    $0x4,%eax
  2806a7:	85 c0                	test   %eax,%eax
  2806a9:	75 06                	jne    2806b1 <HariMain+0x6b1>
  2806ab:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  2806af:	74 10                	je     2806c1 <HariMain+0x6c1>
							((key_leds & 4) != 0 && key_shift != 0)) {
  2806b1:	8b 45 d8             	mov    -0x28(%ebp),%eax
  2806b4:	83 e0 04             	and    $0x4,%eax
					if (((key_leds & 4) == 0 && key_shift == 0) ||
  2806b7:	85 c0                	test   %eax,%eax
  2806b9:	74 16                	je     2806d1 <HariMain+0x6d1>
							((key_leds & 4) != 0 && key_shift != 0)) {
  2806bb:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  2806bf:	74 10                	je     2806d1 <HariMain+0x6d1>
						s[0] += 0x20;	/* ÔøΩÂï∂ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ…ïœäÔøΩ */
  2806c1:	0f b6 85 58 ff ff ff 	movzbl -0xa8(%ebp),%eax
  2806c8:	83 c0 20             	add    $0x20,%eax
  2806cb:	88 85 58 ff ff ff    	mov    %al,-0xa8(%ebp)
					}
				}
				if (s[0] != 0 && key_win != 0) { /* ÔøΩ èÌï∂ÔøΩÔøΩÔøΩAÔøΩoÔøΩbÔøΩNÔøΩXÔøΩyÔøΩ[ÔøΩXÔøΩAEnter */
  2806d1:	0f b6 85 58 ff ff ff 	movzbl -0xa8(%ebp),%eax
  2806d8:	84 c0                	test   %al,%al
  2806da:	74 2c                	je     280708 <HariMain+0x708>
  2806dc:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
  2806e0:	74 26                	je     280708 <HariMain+0x708>
					fifo32_put(&key_win->task->fifo, s[0] + 256);
  2806e2:	0f b6 85 58 ff ff ff 	movzbl -0xa8(%ebp),%eax
  2806e9:	0f be c0             	movsbl %al,%eax
  2806ec:	8d 90 00 01 00 00    	lea    0x100(%eax),%edx
  2806f2:	8b 45 bc             	mov    -0x44(%ebp),%eax
  2806f5:	8b 40 24             	mov    0x24(%eax),%eax
  2806f8:	83 c0 10             	add    $0x10,%eax
  2806fb:	83 ec 08             	sub    $0x8,%esp
  2806fe:	52                   	push   %edx
  2806ff:	50                   	push   %eax
  280700:	e8 a6 19 00 00       	call   2820ab <fifo32_put>
  280705:	83 c4 10             	add    $0x10,%esp
				}
				if (i == 256 + 0x0f && key_win != 0) {	/* Tab */
  280708:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  28070e:	3d 0f 01 00 00       	cmp    $0x10f,%eax
  280713:	75 50                	jne    280765 <HariMain+0x765>
  280715:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
  280719:	74 4a                	je     280765 <HariMain+0x765>
					keywin_off(key_win);
  28071b:	83 ec 0c             	sub    $0xc,%esp
  28071e:	ff 75 bc             	pushl  -0x44(%ebp)
  280721:	e8 20 07 00 00       	call   280e46 <keywin_off>
  280726:	83 c4 10             	add    $0x10,%esp
					j = key_win->height - 1;
  280729:	8b 45 bc             	mov    -0x44(%ebp),%eax
  28072c:	8b 40 18             	mov    0x18(%eax),%eax
  28072f:	83 e8 01             	sub    $0x1,%eax
  280732:	89 45 d0             	mov    %eax,-0x30(%ebp)
					if (j == 0) {
  280735:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  280739:	75 0c                	jne    280747 <HariMain+0x747>
						j = shtctl->top - 1;
  28073b:	8b 45 a8             	mov    -0x58(%ebp),%eax
  28073e:	8b 40 10             	mov    0x10(%eax),%eax
  280741:	83 e8 01             	sub    $0x1,%eax
  280744:	89 45 d0             	mov    %eax,-0x30(%ebp)
					}
					key_win = shtctl->sheets[j];
  280747:	8b 45 a8             	mov    -0x58(%ebp),%eax
  28074a:	8b 55 d0             	mov    -0x30(%ebp),%edx
  28074d:	83 c2 04             	add    $0x4,%edx
  280750:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  280754:	89 45 bc             	mov    %eax,-0x44(%ebp)
					keywin_on(key_win);
  280757:	83 ec 0c             	sub    $0xc,%esp
  28075a:	ff 75 bc             	pushl  -0x44(%ebp)
  28075d:	e8 26 07 00 00       	call   280e88 <keywin_on>
  280762:	83 c4 10             	add    $0x10,%esp
				}
				if (i == 256 + 0x2a) {	/* ÔøΩÔøΩÔøΩVÔøΩtÔøΩg ON */
  280765:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  28076b:	3d 2a 01 00 00       	cmp    $0x12a,%eax
  280770:	75 04                	jne    280776 <HariMain+0x776>
					key_shift |= 1;
  280772:	83 4d dc 01          	orl    $0x1,-0x24(%ebp)
				}
				if (i == 256 + 0x36) {	/* ÔøΩEÔøΩVÔøΩtÔøΩg ON */
  280776:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  28077c:	3d 36 01 00 00       	cmp    $0x136,%eax
  280781:	75 04                	jne    280787 <HariMain+0x787>
					key_shift |= 2;
  280783:	83 4d dc 02          	orl    $0x2,-0x24(%ebp)
				}
				if (i == 256 + 0xaa) {	/* ÔøΩÔøΩÔøΩVÔøΩtÔøΩg OFF */
  280787:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  28078d:	3d aa 01 00 00       	cmp    $0x1aa,%eax
  280792:	75 04                	jne    280798 <HariMain+0x798>
					key_shift &= ~1;
  280794:	83 65 dc fe          	andl   $0xfffffffe,-0x24(%ebp)
				}
				if (i == 256 + 0xb6) {	/* ÔøΩEÔøΩVÔøΩtÔøΩg OFF */
  280798:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  28079e:	3d b6 01 00 00       	cmp    $0x1b6,%eax
  2807a3:	75 04                	jne    2807a9 <HariMain+0x7a9>
					key_shift &= ~2;
  2807a5:	83 65 dc fd          	andl   $0xfffffffd,-0x24(%ebp)
				}
				if (i == 256 + 0x3a) {	/* CapsLock */
  2807a9:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  2807af:	3d 3a 01 00 00       	cmp    $0x13a,%eax
  2807b4:	75 30                	jne    2807e6 <HariMain+0x7e6>
					key_leds ^= 4;
  2807b6:	83 75 d8 04          	xorl   $0x4,-0x28(%ebp)
					fifo32_put(&keycmd, KEYCMD_LED);
  2807ba:	83 ec 08             	sub    $0x8,%esp
  2807bd:	68 ed 00 00 00       	push   $0xed
  2807c2:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  2807c8:	50                   	push   %eax
  2807c9:	e8 dd 18 00 00       	call   2820ab <fifo32_put>
  2807ce:	83 c4 10             	add    $0x10,%esp
					fifo32_put(&keycmd, key_leds);
  2807d1:	83 ec 08             	sub    $0x8,%esp
  2807d4:	ff 75 d8             	pushl  -0x28(%ebp)
  2807d7:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  2807dd:	50                   	push   %eax
  2807de:	e8 c8 18 00 00       	call   2820ab <fifo32_put>
  2807e3:	83 c4 10             	add    $0x10,%esp
				}
				if (i == 256 + 0x45) {	/* NumLock */
  2807e6:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  2807ec:	3d 45 01 00 00       	cmp    $0x145,%eax
  2807f1:	75 30                	jne    280823 <HariMain+0x823>
					key_leds ^= 2;
  2807f3:	83 75 d8 02          	xorl   $0x2,-0x28(%ebp)
					fifo32_put(&keycmd, KEYCMD_LED);
  2807f7:	83 ec 08             	sub    $0x8,%esp
  2807fa:	68 ed 00 00 00       	push   $0xed
  2807ff:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  280805:	50                   	push   %eax
  280806:	e8 a0 18 00 00       	call   2820ab <fifo32_put>
  28080b:	83 c4 10             	add    $0x10,%esp
					fifo32_put(&keycmd, key_leds);
  28080e:	83 ec 08             	sub    $0x8,%esp
  280811:	ff 75 d8             	pushl  -0x28(%ebp)
  280814:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  28081a:	50                   	push   %eax
  28081b:	e8 8b 18 00 00       	call   2820ab <fifo32_put>
  280820:	83 c4 10             	add    $0x10,%esp
				}
				if (i == 256 + 0x46) {	/* ScrollLock */
  280823:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280829:	3d 46 01 00 00       	cmp    $0x146,%eax
  28082e:	75 30                	jne    280860 <HariMain+0x860>
					key_leds ^= 1;
  280830:	83 75 d8 01          	xorl   $0x1,-0x28(%ebp)
					fifo32_put(&keycmd, KEYCMD_LED);
  280834:	83 ec 08             	sub    $0x8,%esp
  280837:	68 ed 00 00 00       	push   $0xed
  28083c:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  280842:	50                   	push   %eax
  280843:	e8 63 18 00 00       	call   2820ab <fifo32_put>
  280848:	83 c4 10             	add    $0x10,%esp
					fifo32_put(&keycmd, key_leds);
  28084b:	83 ec 08             	sub    $0x8,%esp
  28084e:	ff 75 d8             	pushl  -0x28(%ebp)
  280851:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  280857:	50                   	push   %eax
  280858:	e8 4e 18 00 00       	call   2820ab <fifo32_put>
  28085d:	83 c4 10             	add    $0x10,%esp
				}
				if (i == 256 + 0x3b && key_shift != 0 && key_win != 0) {	/* Shift+F1 */
  280860:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280866:	3d 3b 01 00 00       	cmp    $0x13b,%eax
  28086b:	75 74                	jne    2808e1 <HariMain+0x8e1>
  28086d:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  280871:	74 6e                	je     2808e1 <HariMain+0x8e1>
  280873:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
  280877:	74 68                	je     2808e1 <HariMain+0x8e1>
					task = key_win->task;
  280879:	8b 45 bc             	mov    -0x44(%ebp),%eax
  28087c:	8b 40 24             	mov    0x24(%eax),%eax
  28087f:	89 45 8c             	mov    %eax,-0x74(%ebp)
					if (task != 0 && task->tss.ss0 != 0) {
  280882:	83 7d 8c 00          	cmpl   $0x0,-0x74(%ebp)
  280886:	74 59                	je     2808e1 <HariMain+0x8e1>
  280888:	8b 45 8c             	mov    -0x74(%ebp),%eax
  28088b:	8b 40 34             	mov    0x34(%eax),%eax
  28088e:	85 c0                	test   %eax,%eax
  280890:	74 4f                	je     2808e1 <HariMain+0x8e1>
						cons_putstr0(task->cons, "\nBreak(key) :\n");
  280892:	8b 45 8c             	mov    -0x74(%ebp),%eax
  280895:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
  28089b:	83 ec 08             	sub    $0x8,%esp
  28089e:	68 15 11 31 00       	push   $0x311115
  2808a3:	50                   	push   %eax
  2808a4:	e8 e6 47 00 00       	call   28508f <cons_putstr0>
  2808a9:	83 c4 10             	add    $0x10,%esp
						io_cli();	/* ÔøΩÔøΩÔøΩÔøΩÔøΩIÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ…É^ÔøΩXÔøΩNÔøΩÔøΩÔøΩœÇÔøΩÔøΩ∆çÔøΩÔøΩÈÇ©ÔøΩÔøΩ */
  2808ac:	e8 a1 08 00 00       	call   281152 <io_cli>
						task->tss.eax = (int) &(task->tss.esp0);
  2808b1:	8b 45 8c             	mov    -0x74(%ebp),%eax
  2808b4:	83 c0 30             	add    $0x30,%eax
  2808b7:	89 c2                	mov    %eax,%edx
  2808b9:	8b 45 8c             	mov    -0x74(%ebp),%eax
  2808bc:	89 50 54             	mov    %edx,0x54(%eax)
						task->tss.eip = (int) asm_end_app;
  2808bf:	ba c3 12 28 00       	mov    $0x2812c3,%edx
  2808c4:	8b 45 8c             	mov    -0x74(%ebp),%eax
  2808c7:	89 50 4c             	mov    %edx,0x4c(%eax)
						io_sti();
  2808ca:	e8 85 08 00 00       	call   281154 <io_sti>
						task_run(task, -1, 0);	/* ÔøΩIÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩmÔøΩÔøΩÔøΩ…ÇÔøΩÁÇπÔøΩÈÇΩÔøΩﬂÇ…ÅAÔøΩQÔøΩƒÇÔøΩÔøΩÔøΩÔøΩÔøΩNÔøΩÔøΩÔøΩÔøΩ */
  2808cf:	83 ec 04             	sub    $0x4,%esp
  2808d2:	6a 00                	push   $0x0
  2808d4:	6a ff                	push   $0xffffffff
  2808d6:	ff 75 8c             	pushl  -0x74(%ebp)
  2808d9:	e8 06 39 00 00       	call   2841e4 <task_run>
  2808de:	83 c4 10             	add    $0x10,%esp
					}
				}
				if (i == 256 + 0x3c && key_shift != 0) {	/* Shift+F2 */
  2808e1:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  2808e7:	3d 3c 01 00 00       	cmp    $0x13c,%eax
  2808ec:	75 63                	jne    280951 <HariMain+0x951>
  2808ee:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  2808f2:	74 5d                	je     280951 <HariMain+0x951>
					/* ÔøΩVÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩRÔøΩÔøΩÔøΩ\ÔøΩ[ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÕëIÔøΩÔøΩÔøΩÔøΩ‘Ç…ÇÔøΩÔøΩÔøΩiÔøΩÔøΩÔøΩÃÇŸÇÔøΩÔøΩÔøΩÔøΩeÔøΩÿÇÔøΩÔøΩÔøΩÀÅHÔøΩj */
					if (key_win != 0) {
  2808f4:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
  2808f8:	74 0e                	je     280908 <HariMain+0x908>
						keywin_off(key_win);
  2808fa:	83 ec 0c             	sub    $0xc,%esp
  2808fd:	ff 75 bc             	pushl  -0x44(%ebp)
  280900:	e8 41 05 00 00       	call   280e46 <keywin_off>
  280905:	83 c4 10             	add    $0x10,%esp
					}
					key_win = open_console(shtctl, memtotal);
  280908:	83 ec 08             	sub    $0x8,%esp
  28090b:	ff 75 ac             	pushl  -0x54(%ebp)
  28090e:	ff 75 a8             	pushl  -0x58(%ebp)
  280911:	e8 b7 06 00 00       	call   280fcd <open_console>
  280916:	83 c4 10             	add    $0x10,%esp
  280919:	89 45 bc             	mov    %eax,-0x44(%ebp)
					sheet_slide(key_win, 32, 4);
  28091c:	83 ec 04             	sub    $0x4,%esp
  28091f:	6a 04                	push   $0x4
  280921:	6a 20                	push   $0x20
  280923:	ff 75 bc             	pushl  -0x44(%ebp)
  280926:	e8 51 2e 00 00       	call   28377c <sheet_slide>
  28092b:	83 c4 10             	add    $0x10,%esp
					sheet_updown(key_win, shtctl->top);
  28092e:	8b 45 a8             	mov    -0x58(%ebp),%eax
  280931:	8b 40 10             	mov    0x10(%eax),%eax
  280934:	83 ec 08             	sub    $0x8,%esp
  280937:	50                   	push   %eax
  280938:	ff 75 bc             	pushl  -0x44(%ebp)
  28093b:	e8 4c 2a 00 00       	call   28338c <sheet_updown>
  280940:	83 c4 10             	add    $0x10,%esp
					keywin_on(key_win);
  280943:	83 ec 0c             	sub    $0xc,%esp
  280946:	ff 75 bc             	pushl  -0x44(%ebp)
  280949:	e8 3a 05 00 00       	call   280e88 <keywin_on>
  28094e:	83 c4 10             	add    $0x10,%esp
				}
				if (i == 256 + 0x57) {	/* F11 */
  280951:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280957:	3d 57 01 00 00       	cmp    $0x157,%eax
  28095c:	75 1c                	jne    28097a <HariMain+0x97a>
					sheet_updown(shtctl->sheets[1], shtctl->top - 1);
  28095e:	8b 45 a8             	mov    -0x58(%ebp),%eax
  280961:	8b 40 10             	mov    0x10(%eax),%eax
  280964:	8d 50 ff             	lea    -0x1(%eax),%edx
  280967:	8b 45 a8             	mov    -0x58(%ebp),%eax
  28096a:	8b 40 18             	mov    0x18(%eax),%eax
  28096d:	83 ec 08             	sub    $0x8,%esp
  280970:	52                   	push   %edx
  280971:	50                   	push   %eax
  280972:	e8 15 2a 00 00       	call   28338c <sheet_updown>
  280977:	83 c4 10             	add    $0x10,%esp
				}
				if (i == 256 + 0xfa) {	/* ÔøΩLÔøΩ[ÔøΩ{ÔøΩ[ÔøΩhÔøΩÔøΩÔøΩfÔøΩ[ÔøΩ^ÔøΩñ≥éÔøΩÔøΩ…éÛÇØéÔøΩÔøΩÔøΩÔøΩ */
  28097a:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280980:	3d fa 01 00 00       	cmp    $0x1fa,%eax
  280985:	75 07                	jne    28098e <HariMain+0x98e>
					keycmd_wait = -1;
  280987:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
				}
				if (i == 256 + 0xfe) {	/* ÔøΩLÔøΩ[ÔøΩ{ÔøΩ[ÔøΩhÔøΩÔøΩÔøΩfÔøΩ[ÔøΩ^ÔøΩñ≥éÔøΩÔøΩ…éÛÇØéÔøΩÔøΩ»ÇÔøΩÔøΩÔøΩÔøΩÔøΩ */
  28098e:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280994:	3d fe 01 00 00       	cmp    $0x1fe,%eax
  280999:	0f 85 a2 04 00 00    	jne    280e41 <HariMain+0xe41>
					wait_KBC_sendready();
  28099f:	e8 8d 18 00 00       	call   282231 <wait_KBC_sendready>
					io_out8(PORT_KEYDAT, keycmd_wait);
  2809a4:	83 ec 08             	sub    $0x8,%esp
  2809a7:	ff 75 d4             	pushl  -0x2c(%ebp)
  2809aa:	6a 60                	push   $0x60
  2809ac:	e8 c5 07 00 00       	call   281176 <io_out8>
  2809b1:	83 c4 10             	add    $0x10,%esp
				if (i == 256 + 0xfe) {	/* ÔøΩLÔøΩ[ÔøΩ{ÔøΩ[ÔøΩhÔøΩÔøΩÔøΩfÔøΩ[ÔøΩ^ÔøΩñ≥éÔøΩÔøΩ…éÛÇØéÔøΩÔøΩ»ÇÔøΩÔøΩÔøΩÔøΩÔøΩ */
  2809b4:	e9 88 04 00 00       	jmp    280e41 <HariMain+0xe41>
				}
			} else if (512 <= i && i <= 767) { /* ÔøΩ}ÔøΩEÔøΩXÔøΩfÔøΩ[ÔøΩ^ */
  2809b9:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  2809bf:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  2809c4:	0f 8e 6b 03 00 00    	jle    280d35 <HariMain+0xd35>
  2809ca:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  2809d0:	3d ff 02 00 00       	cmp    $0x2ff,%eax
  2809d5:	0f 8f 5a 03 00 00    	jg     280d35 <HariMain+0xd35>
				if (mouse_decode(&mdec, i - 512) != 0) {
  2809db:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  2809e1:	0f b6 c0             	movzbl %al,%eax
  2809e4:	83 ec 08             	sub    $0x8,%esp
  2809e7:	50                   	push   %eax
  2809e8:	8d 85 8c fc ff ff    	lea    -0x374(%ebp),%eax
  2809ee:	50                   	push   %eax
  2809ef:	e8 53 19 00 00       	call   282347 <mouse_decode>
  2809f4:	83 c4 10             	add    $0x10,%esp
  2809f7:	85 c0                	test   %eax,%eax
  2809f9:	0f 84 41 04 00 00    	je     280e40 <HariMain+0xe40>
					/* ÔøΩ}ÔøΩEÔøΩXÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩÔøΩÃà⁄ìÔøΩ */
					mx += mdec.x;
  2809ff:	8b 85 90 fc ff ff    	mov    -0x370(%ebp),%eax
  280a05:	01 45 f4             	add    %eax,-0xc(%ebp)
					my += mdec.y;
  280a08:	8b 85 94 fc ff ff    	mov    -0x36c(%ebp),%eax
  280a0e:	01 45 f0             	add    %eax,-0x10(%ebp)
					if (mx < 0) {
  280a11:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  280a15:	79 07                	jns    280a1e <HariMain+0xa1e>
						mx = 0;
  280a17:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
					}
					if (my < 0) {
  280a1e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  280a22:	79 07                	jns    280a2b <HariMain+0xa2b>
						my = 0;
  280a24:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					}
					if (mx > binfo->scrnx - 1) {
  280a2b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  280a2e:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  280a32:	98                   	cwtl   
  280a33:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  280a36:	7c 0e                	jl     280a46 <HariMain+0xa46>
						mx = binfo->scrnx - 1;
  280a38:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  280a3b:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  280a3f:	98                   	cwtl   
  280a40:	83 e8 01             	sub    $0x1,%eax
  280a43:	89 45 f4             	mov    %eax,-0xc(%ebp)
					}
					if (my > binfo->scrny - 1) {
  280a46:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  280a49:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  280a4d:	98                   	cwtl   
  280a4e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  280a51:	7c 0e                	jl     280a61 <HariMain+0xa61>
						my = binfo->scrny - 1;
  280a53:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  280a56:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  280a5a:	98                   	cwtl   
  280a5b:	83 e8 01             	sub    $0x1,%eax
  280a5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
					}
					new_mx = mx;
  280a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  280a64:	89 45 ec             	mov    %eax,-0x14(%ebp)
					new_my = my;
  280a67:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280a6a:	89 45 e8             	mov    %eax,-0x18(%ebp)
					if ((mdec.btn & 0x01) != 0) {
  280a6d:	8b 85 98 fc ff ff    	mov    -0x368(%ebp),%eax
  280a73:	83 e0 01             	and    $0x1,%eax
  280a76:	85 c0                	test   %eax,%eax
  280a78:	0f 84 7d 02 00 00    	je     280cfb <HariMain+0xcfb>
						/* ÔøΩÔøΩÔøΩ{ÔøΩ^ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩƒÇÔøΩÔøΩÔøΩ */
						if (mmx < 0) {
  280a7e:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  280a82:	0f 89 3f 02 00 00    	jns    280cc7 <HariMain+0xcc7>
							/* ÔøΩ èÌÉÇÔøΩ[ÔøΩhÔøΩÃèÍçá */
							/* ÔøΩÔøΩÃâÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÁèáÔøΩ‘Ç…É}ÔøΩEÔøΩXÔøΩÔøΩÔøΩwÔøΩÔøΩÔøΩƒÇÔøΩÔøΩÈâ∫ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩTÔøΩÔøΩ */
							for (j = shtctl->top - 1; j > 0; j--) {
  280a88:	8b 45 a8             	mov    -0x58(%ebp),%eax
  280a8b:	8b 40 10             	mov    0x10(%eax),%eax
  280a8e:	83 e8 01             	sub    $0x1,%eax
  280a91:	89 45 d0             	mov    %eax,-0x30(%ebp)
  280a94:	e9 1f 02 00 00       	jmp    280cb8 <HariMain+0xcb8>
								sht = shtctl->sheets[j];
  280a99:	8b 45 a8             	mov    -0x58(%ebp),%eax
  280a9c:	8b 55 d0             	mov    -0x30(%ebp),%edx
  280a9f:	83 c2 04             	add    $0x4,%edx
  280aa2:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  280aa6:	89 45 c0             	mov    %eax,-0x40(%ebp)
								x = mx - sht->vx0;
  280aa9:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280aac:	8b 40 0c             	mov    0xc(%eax),%eax
  280aaf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  280ab2:	29 c2                	sub    %eax,%edx
  280ab4:	89 d0                	mov    %edx,%eax
  280ab6:	89 45 88             	mov    %eax,-0x78(%ebp)
								y = my - sht->vy0;
  280ab9:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280abc:	8b 40 10             	mov    0x10(%eax),%eax
  280abf:	8b 55 f0             	mov    -0x10(%ebp),%edx
  280ac2:	29 c2                	sub    %eax,%edx
  280ac4:	89 d0                	mov    %edx,%eax
  280ac6:	89 45 84             	mov    %eax,-0x7c(%ebp)
								if (0 <= x && x < sht->bxsize && 0 <= y && y < sht->bysize) {
  280ac9:	83 7d 88 00          	cmpl   $0x0,-0x78(%ebp)
  280acd:	0f 88 e1 01 00 00    	js     280cb4 <HariMain+0xcb4>
  280ad3:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280ad6:	8b 40 04             	mov    0x4(%eax),%eax
  280ad9:	39 45 88             	cmp    %eax,-0x78(%ebp)
  280adc:	0f 8d d2 01 00 00    	jge    280cb4 <HariMain+0xcb4>
  280ae2:	83 7d 84 00          	cmpl   $0x0,-0x7c(%ebp)
  280ae6:	0f 88 c8 01 00 00    	js     280cb4 <HariMain+0xcb4>
  280aec:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280aef:	8b 40 08             	mov    0x8(%eax),%eax
  280af2:	39 45 84             	cmp    %eax,-0x7c(%ebp)
  280af5:	0f 8d b9 01 00 00    	jge    280cb4 <HariMain+0xcb4>
									if (sht->buf[y * sht->bxsize + x] != sht->col_inv) {
  280afb:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280afe:	8b 10                	mov    (%eax),%edx
  280b00:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280b03:	8b 40 04             	mov    0x4(%eax),%eax
  280b06:	0f af 45 84          	imul   -0x7c(%ebp),%eax
  280b0a:	89 c1                	mov    %eax,%ecx
  280b0c:	8b 45 88             	mov    -0x78(%ebp),%eax
  280b0f:	01 c8                	add    %ecx,%eax
  280b11:	01 d0                	add    %edx,%eax
  280b13:	0f b6 00             	movzbl (%eax),%eax
  280b16:	0f b6 d0             	movzbl %al,%edx
  280b19:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280b1c:	8b 40 14             	mov    0x14(%eax),%eax
  280b1f:	39 c2                	cmp    %eax,%edx
  280b21:	0f 84 8d 01 00 00    	je     280cb4 <HariMain+0xcb4>
										sheet_updown(sht, shtctl->top - 1);
  280b27:	8b 45 a8             	mov    -0x58(%ebp),%eax
  280b2a:	8b 40 10             	mov    0x10(%eax),%eax
  280b2d:	83 e8 01             	sub    $0x1,%eax
  280b30:	83 ec 08             	sub    $0x8,%esp
  280b33:	50                   	push   %eax
  280b34:	ff 75 c0             	pushl  -0x40(%ebp)
  280b37:	e8 50 28 00 00       	call   28338c <sheet_updown>
  280b3c:	83 c4 10             	add    $0x10,%esp
										if (sht != key_win) {
  280b3f:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280b42:	3b 45 bc             	cmp    -0x44(%ebp),%eax
  280b45:	74 22                	je     280b69 <HariMain+0xb69>
											keywin_off(key_win);
  280b47:	83 ec 0c             	sub    $0xc,%esp
  280b4a:	ff 75 bc             	pushl  -0x44(%ebp)
  280b4d:	e8 f4 02 00 00       	call   280e46 <keywin_off>
  280b52:	83 c4 10             	add    $0x10,%esp
											key_win = sht;
  280b55:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280b58:	89 45 bc             	mov    %eax,-0x44(%ebp)
											keywin_on(key_win);
  280b5b:	83 ec 0c             	sub    $0xc,%esp
  280b5e:	ff 75 bc             	pushl  -0x44(%ebp)
  280b61:	e8 22 03 00 00       	call   280e88 <keywin_on>
  280b66:	83 c4 10             	add    $0x10,%esp
										}
										if (3 <= x && x < sht->bxsize - 3 && 3 <= y && y < 21) {
  280b69:	83 7d 88 02          	cmpl   $0x2,-0x78(%ebp)
  280b6d:	7e 38                	jle    280ba7 <HariMain+0xba7>
  280b6f:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280b72:	8b 40 04             	mov    0x4(%eax),%eax
  280b75:	83 e8 03             	sub    $0x3,%eax
  280b78:	39 45 88             	cmp    %eax,-0x78(%ebp)
  280b7b:	7d 2a                	jge    280ba7 <HariMain+0xba7>
  280b7d:	83 7d 84 02          	cmpl   $0x2,-0x7c(%ebp)
  280b81:	7e 24                	jle    280ba7 <HariMain+0xba7>
  280b83:	83 7d 84 14          	cmpl   $0x14,-0x7c(%ebp)
  280b87:	7f 1e                	jg     280ba7 <HariMain+0xba7>
											mmx = mx;	/* ÔøΩEÔøΩBÔøΩÔøΩÔøΩhÔøΩEÔøΩ⁄ìÔøΩÔøΩÔøΩÔøΩ[ÔøΩhÔøΩÔøΩ */
  280b89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  280b8c:	89 45 cc             	mov    %eax,-0x34(%ebp)
											mmy = my;
  280b8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280b92:	89 45 c8             	mov    %eax,-0x38(%ebp)
											mmx2 = sht->vx0;
  280b95:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280b98:	8b 40 0c             	mov    0xc(%eax),%eax
  280b9b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
											new_wy = sht->vy0;
  280b9e:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280ba1:	8b 40 10             	mov    0x10(%eax),%eax
  280ba4:	89 45 e0             	mov    %eax,-0x20(%ebp)
										}
										if (sht->bxsize - 21 <= x && x < sht->bxsize - 5 && 5 <= y && y < 19) {
  280ba7:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280baa:	8b 40 04             	mov    0x4(%eax),%eax
  280bad:	83 e8 15             	sub    $0x15,%eax
  280bb0:	39 45 88             	cmp    %eax,-0x78(%ebp)
  280bb3:	0f 8c 76 01 00 00    	jl     280d2f <HariMain+0xd2f>
  280bb9:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280bbc:	8b 40 04             	mov    0x4(%eax),%eax
  280bbf:	83 e8 05             	sub    $0x5,%eax
  280bc2:	39 45 88             	cmp    %eax,-0x78(%ebp)
  280bc5:	0f 8d 64 01 00 00    	jge    280d2f <HariMain+0xd2f>
  280bcb:	83 7d 84 04          	cmpl   $0x4,-0x7c(%ebp)
  280bcf:	0f 8e 5a 01 00 00    	jle    280d2f <HariMain+0xd2f>
  280bd5:	83 7d 84 12          	cmpl   $0x12,-0x7c(%ebp)
  280bd9:	0f 8f 50 01 00 00    	jg     280d2f <HariMain+0xd2f>
											/* ÔøΩuÔøΩ~ÔøΩvÔøΩ{ÔøΩ^ÔøΩÔøΩÔøΩNÔøΩÔøΩÔøΩbÔøΩN */
											if ((sht->flags & 0x10) != 0) {		/* ÔøΩAÔøΩvÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩEÔøΩBÔøΩÔøΩÔøΩhÔøΩEÔøΩÔøΩÔøΩH */
  280bdf:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280be2:	8b 40 1c             	mov    0x1c(%eax),%eax
  280be5:	83 e0 10             	and    $0x10,%eax
  280be8:	85 c0                	test   %eax,%eax
  280bea:	74 5d                	je     280c49 <HariMain+0xc49>
												task = sht->task;
  280bec:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280bef:	8b 40 24             	mov    0x24(%eax),%eax
  280bf2:	89 45 8c             	mov    %eax,-0x74(%ebp)
												cons_putstr0(task->cons, "\nBreak(mouse) :\n");
  280bf5:	8b 45 8c             	mov    -0x74(%ebp),%eax
  280bf8:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
  280bfe:	83 ec 08             	sub    $0x8,%esp
  280c01:	68 24 11 31 00       	push   $0x311124
  280c06:	50                   	push   %eax
  280c07:	e8 83 44 00 00       	call   28508f <cons_putstr0>
  280c0c:	83 c4 10             	add    $0x10,%esp
												io_cli();	/* ÔøΩÔøΩÔøΩÔøΩÔøΩIÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ…É^ÔøΩXÔøΩNÔøΩÔøΩÔøΩœÇÔøΩÔøΩ∆çÔøΩÔøΩÈÇ©ÔøΩÔøΩ */
  280c0f:	e8 3e 05 00 00       	call   281152 <io_cli>
												task->tss.eax = (int) &(task->tss.esp0);
  280c14:	8b 45 8c             	mov    -0x74(%ebp),%eax
  280c17:	83 c0 30             	add    $0x30,%eax
  280c1a:	89 c2                	mov    %eax,%edx
  280c1c:	8b 45 8c             	mov    -0x74(%ebp),%eax
  280c1f:	89 50 54             	mov    %edx,0x54(%eax)
												task->tss.eip = (int) asm_end_app;
  280c22:	ba c3 12 28 00       	mov    $0x2812c3,%edx
  280c27:	8b 45 8c             	mov    -0x74(%ebp),%eax
  280c2a:	89 50 4c             	mov    %edx,0x4c(%eax)
												io_sti();
  280c2d:	e8 22 05 00 00       	call   281154 <io_sti>
												task_run(task, -1, 0);
  280c32:	83 ec 04             	sub    $0x4,%esp
  280c35:	6a 00                	push   $0x0
  280c37:	6a ff                	push   $0xffffffff
  280c39:	ff 75 8c             	pushl  -0x74(%ebp)
  280c3c:	e8 a3 35 00 00       	call   2841e4 <task_run>
  280c41:	83 c4 10             	add    $0x10,%esp
												io_cli();
												fifo32_put(&task->fifo, 4);
												io_sti();
											}
										}
										break;
  280c44:	e9 e6 00 00 00       	jmp    280d2f <HariMain+0xd2f>
												task = sht->task;
  280c49:	8b 45 c0             	mov    -0x40(%ebp),%eax
  280c4c:	8b 40 24             	mov    0x24(%eax),%eax
  280c4f:	89 45 8c             	mov    %eax,-0x74(%ebp)
												sheet_updown(sht, -1); /* ÔøΩ∆ÇËÇ†ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ\ÔøΩÔøΩÔøΩ…ÇÔøΩÔøΩƒÇÔøΩÔøΩÔøΩ */
  280c52:	83 ec 08             	sub    $0x8,%esp
  280c55:	6a ff                	push   $0xffffffff
  280c57:	ff 75 c0             	pushl  -0x40(%ebp)
  280c5a:	e8 2d 27 00 00       	call   28338c <sheet_updown>
  280c5f:	83 c4 10             	add    $0x10,%esp
												keywin_off(key_win);
  280c62:	83 ec 0c             	sub    $0xc,%esp
  280c65:	ff 75 bc             	pushl  -0x44(%ebp)
  280c68:	e8 d9 01 00 00       	call   280e46 <keywin_off>
  280c6d:	83 c4 10             	add    $0x10,%esp
												key_win = shtctl->sheets[shtctl->top - 1];
  280c70:	8b 45 a8             	mov    -0x58(%ebp),%eax
  280c73:	8b 40 10             	mov    0x10(%eax),%eax
  280c76:	8d 50 ff             	lea    -0x1(%eax),%edx
  280c79:	8b 45 a8             	mov    -0x58(%ebp),%eax
  280c7c:	83 c2 04             	add    $0x4,%edx
  280c7f:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  280c83:	89 45 bc             	mov    %eax,-0x44(%ebp)
												keywin_on(key_win);
  280c86:	83 ec 0c             	sub    $0xc,%esp
  280c89:	ff 75 bc             	pushl  -0x44(%ebp)
  280c8c:	e8 f7 01 00 00       	call   280e88 <keywin_on>
  280c91:	83 c4 10             	add    $0x10,%esp
												io_cli();
  280c94:	e8 b9 04 00 00       	call   281152 <io_cli>
												fifo32_put(&task->fifo, 4);
  280c99:	8b 45 8c             	mov    -0x74(%ebp),%eax
  280c9c:	83 c0 10             	add    $0x10,%eax
  280c9f:	83 ec 08             	sub    $0x8,%esp
  280ca2:	6a 04                	push   $0x4
  280ca4:	50                   	push   %eax
  280ca5:	e8 01 14 00 00       	call   2820ab <fifo32_put>
  280caa:	83 c4 10             	add    $0x10,%esp
												io_sti();
  280cad:	e8 a2 04 00 00       	call   281154 <io_sti>
										break;
  280cb2:	eb 7b                	jmp    280d2f <HariMain+0xd2f>
							for (j = shtctl->top - 1; j > 0; j--) {
  280cb4:	83 6d d0 01          	subl   $0x1,-0x30(%ebp)
  280cb8:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  280cbc:	0f 8f d7 fd ff ff    	jg     280a99 <HariMain+0xa99>
				if (mouse_decode(&mdec, i - 512) != 0) {
  280cc2:	e9 79 01 00 00       	jmp    280e40 <HariMain+0xe40>
									}
								}
							}
						} else {
							/* ÔøΩEÔøΩBÔøΩÔøΩÔøΩhÔøΩEÔøΩ⁄ìÔøΩÔøΩÔøΩÔøΩ[ÔøΩhÔøΩÃèÍçá */
							x = mx - mmx;	/* ÔøΩ}ÔøΩEÔøΩXÔøΩÃà⁄ìÔøΩÔøΩ ÇÔøΩÔøΩvÔøΩZ */
  280cc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  280cca:	2b 45 cc             	sub    -0x34(%ebp),%eax
  280ccd:	89 45 88             	mov    %eax,-0x78(%ebp)
							y = my - mmy;
  280cd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280cd3:	2b 45 c8             	sub    -0x38(%ebp),%eax
  280cd6:	89 45 84             	mov    %eax,-0x7c(%ebp)
							new_wx = (mmx2 + x + 2) & ~3;
  280cd9:	8b 55 c4             	mov    -0x3c(%ebp),%edx
  280cdc:	8b 45 88             	mov    -0x78(%ebp),%eax
  280cdf:	01 d0                	add    %edx,%eax
  280ce1:	83 c0 02             	add    $0x2,%eax
  280ce4:	83 e0 fc             	and    $0xfffffffc,%eax
  280ce7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
							new_wy = new_wy + y;
  280cea:	8b 45 84             	mov    -0x7c(%ebp),%eax
  280ced:	01 45 e0             	add    %eax,-0x20(%ebp)
							mmy = my;	/* ÔøΩ⁄ìÔøΩÔøΩÔøΩÃçÔøΩÔøΩWÔøΩ…çXÔøΩV */
  280cf0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280cf3:	89 45 c8             	mov    %eax,-0x38(%ebp)
				if (mouse_decode(&mdec, i - 512) != 0) {
  280cf6:	e9 45 01 00 00       	jmp    280e40 <HariMain+0xe40>
						}
					} else {
						/* ÔøΩÔøΩÔøΩ{ÔøΩ^ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩƒÇÔøΩÔøΩ»ÇÔøΩ */
						mmx = -1;	/* ÔøΩ èÌÉÇÔøΩ[ÔøΩhÔøΩÔøΩ */
  280cfb:	c7 45 cc ff ff ff ff 	movl   $0xffffffff,-0x34(%ebp)
						if (new_wx != 0x7fffffff) {
  280d02:	81 7d e4 ff ff ff 7f 	cmpl   $0x7fffffff,-0x1c(%ebp)
  280d09:	0f 84 31 01 00 00    	je     280e40 <HariMain+0xe40>
							sheet_slide(sht, new_wx, new_wy);	/* ÔøΩÔøΩxÔøΩmÔøΩËÇ≥ÔøΩÔøΩÔøΩÔøΩ */
  280d0f:	83 ec 04             	sub    $0x4,%esp
  280d12:	ff 75 e0             	pushl  -0x20(%ebp)
  280d15:	ff 75 e4             	pushl  -0x1c(%ebp)
  280d18:	ff 75 c0             	pushl  -0x40(%ebp)
  280d1b:	e8 5c 2a 00 00       	call   28377c <sheet_slide>
  280d20:	83 c4 10             	add    $0x10,%esp
							new_wx = 0x7fffffff;
  280d23:	c7 45 e4 ff ff ff 7f 	movl   $0x7fffffff,-0x1c(%ebp)
				if (mouse_decode(&mdec, i - 512) != 0) {
  280d2a:	e9 11 01 00 00       	jmp    280e40 <HariMain+0xe40>
										break;
  280d2f:	90                   	nop
				if (mouse_decode(&mdec, i - 512) != 0) {
  280d30:	e9 0b 01 00 00       	jmp    280e40 <HariMain+0xe40>
						}
					}
				}
			} else if (768 <= i && i <= 1023) {	/* ÔøΩRÔøΩÔøΩÔøΩ\ÔøΩ[ÔøΩÔøΩÔøΩIÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ */
  280d35:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280d3b:	3d ff 02 00 00       	cmp    $0x2ff,%eax
  280d40:	7e 40                	jle    280d82 <HariMain+0xd82>
  280d42:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280d48:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  280d4d:	7f 33                	jg     280d82 <HariMain+0xd82>
				close_console(shtctl->sheets0 + (i - 768));
  280d4f:	8b 45 a8             	mov    -0x58(%ebp),%eax
  280d52:	8d 88 14 04 00 00    	lea    0x414(%eax),%ecx
  280d58:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280d5e:	89 c2                	mov    %eax,%edx
  280d60:	89 d0                	mov    %edx,%eax
  280d62:	c1 e0 02             	shl    $0x2,%eax
  280d65:	01 d0                	add    %edx,%eax
  280d67:	c1 e0 03             	shl    $0x3,%eax
  280d6a:	2d 00 78 00 00       	sub    $0x7800,%eax
  280d6f:	01 c8                	add    %ecx,%eax
  280d71:	83 ec 0c             	sub    $0xc,%esp
  280d74:	50                   	push   %eax
  280d75:	e8 75 03 00 00       	call   2810ef <close_console>
  280d7a:	83 c4 10             	add    $0x10,%esp
  280d7d:	e9 bf 00 00 00       	jmp    280e41 <HariMain+0xe41>
			} else if (1024 <= i && i <= 2023) {
  280d82:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280d88:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  280d8d:	7e 3e                	jle    280dcd <HariMain+0xdcd>
  280d8f:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280d95:	3d e7 07 00 00       	cmp    $0x7e7,%eax
  280d9a:	7f 31                	jg     280dcd <HariMain+0xdcd>
				close_constask(taskctl->tasks0 + (i - 1024));
  280d9c:	a1 dc 96 32 00       	mov    0x3296dc,%eax
  280da1:	8d 88 f8 0f 00 00    	lea    0xff8(%eax),%ecx
  280da7:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280dad:	89 c2                	mov    %eax,%edx
  280daf:	89 d0                	mov    %edx,%eax
  280db1:	01 c0                	add    %eax,%eax
  280db3:	01 d0                	add    %edx,%eax
  280db5:	c1 e0 06             	shl    $0x6,%eax
  280db8:	2d 00 00 03 00       	sub    $0x30000,%eax
  280dbd:	01 c8                	add    %ecx,%eax
  280dbf:	83 ec 0c             	sub    $0xc,%esp
  280dc2:	50                   	push   %eax
  280dc3:	e8 c4 02 00 00       	call   28108c <close_constask>
  280dc8:	83 c4 10             	add    $0x10,%esp
  280dcb:	eb 74                	jmp    280e41 <HariMain+0xe41>
			} else if (2024 <= i && i <= 2279) {	/* ÔøΩRÔøΩÔøΩÔøΩ\ÔøΩ[ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ¬ÇÔøΩÔøΩÔøΩ */
  280dcd:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280dd3:	3d e7 07 00 00       	cmp    $0x7e7,%eax
  280dd8:	0f 8e 06 f7 ff ff    	jle    2804e4 <HariMain+0x4e4>
  280dde:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280de4:	3d e7 08 00 00       	cmp    $0x8e7,%eax
  280de9:	0f 8f f5 f6 ff ff    	jg     2804e4 <HariMain+0x4e4>
				sht2 = shtctl->sheets0 + (i - 2024);
  280def:	8b 45 a8             	mov    -0x58(%ebp),%eax
  280df2:	8d 88 14 04 00 00    	lea    0x414(%eax),%ecx
  280df8:	8b 85 9c fc ff ff    	mov    -0x364(%ebp),%eax
  280dfe:	89 c2                	mov    %eax,%edx
  280e00:	89 d0                	mov    %edx,%eax
  280e02:	c1 e0 02             	shl    $0x2,%eax
  280e05:	01 d0                	add    %edx,%eax
  280e07:	c1 e0 03             	shl    $0x3,%eax
  280e0a:	2d 40 3c 01 00       	sub    $0x13c40,%eax
  280e0f:	01 c8                	add    %ecx,%eax
  280e11:	89 45 80             	mov    %eax,-0x80(%ebp)
				memman_free_4k(memman, (int) sht2->buf, 256 * 165);
  280e14:	8b 45 80             	mov    -0x80(%ebp),%eax
  280e17:	8b 00                	mov    (%eax),%eax
  280e19:	83 ec 04             	sub    $0x4,%esp
  280e1c:	68 00 a5 00 00       	push   $0xa500
  280e21:	50                   	push   %eax
  280e22:	ff 75 b0             	pushl  -0x50(%ebp)
  280e25:	e8 fa 1a 00 00       	call   282924 <memman_free_4k>
  280e2a:	83 c4 10             	add    $0x10,%esp
				sheet_free(sht2);
  280e2d:	83 ec 0c             	sub    $0xc,%esp
  280e30:	ff 75 80             	pushl  -0x80(%ebp)
  280e33:	e8 5b 2a 00 00       	call   283893 <sheet_free>
  280e38:	83 c4 10             	add    $0x10,%esp
  280e3b:	e9 a4 f6 ff ff       	jmp    2804e4 <HariMain+0x4e4>
				if (mouse_decode(&mdec, i - 512) != 0) {
  280e40:	90                   	nop
		if (fifo32_status(&keycmd) > 0 && keycmd_wait < 0) {
  280e41:	e9 9e f6 ff ff       	jmp    2804e4 <HariMain+0x4e4>

00280e46 <keywin_off>:
		}
	}
}

void keywin_off(struct SHEET *key_win)
{
  280e46:	f3 0f 1e fb          	endbr32 
  280e4a:	55                   	push   %ebp
  280e4b:	89 e5                	mov    %esp,%ebp
  280e4d:	83 ec 08             	sub    $0x8,%esp
	change_wtitle8(key_win, 0);
  280e50:	83 ec 08             	sub    $0x8,%esp
  280e53:	6a 00                	push   $0x0
  280e55:	ff 75 08             	pushl  0x8(%ebp)
  280e58:	e8 b7 3a 00 00       	call   284914 <change_wtitle8>
  280e5d:	83 c4 10             	add    $0x10,%esp
	if ((key_win->flags & 0x20) != 0) {
  280e60:	8b 45 08             	mov    0x8(%ebp),%eax
  280e63:	8b 40 1c             	mov    0x1c(%eax),%eax
  280e66:	83 e0 20             	and    $0x20,%eax
  280e69:	85 c0                	test   %eax,%eax
  280e6b:	74 18                	je     280e85 <keywin_off+0x3f>
		fifo32_put(&key_win->task->fifo, 3); /* ÔøΩRÔøΩÔøΩÔøΩ\ÔøΩ[ÔøΩÔøΩÔøΩÃÉJÔøΩ[ÔøΩ\ÔøΩÔøΩOFF */
  280e6d:	8b 45 08             	mov    0x8(%ebp),%eax
  280e70:	8b 40 24             	mov    0x24(%eax),%eax
  280e73:	83 c0 10             	add    $0x10,%eax
  280e76:	83 ec 08             	sub    $0x8,%esp
  280e79:	6a 03                	push   $0x3
  280e7b:	50                   	push   %eax
  280e7c:	e8 2a 12 00 00       	call   2820ab <fifo32_put>
  280e81:	83 c4 10             	add    $0x10,%esp
	}
	return;
  280e84:	90                   	nop
  280e85:	90                   	nop
}
  280e86:	c9                   	leave  
  280e87:	c3                   	ret    

00280e88 <keywin_on>:

void keywin_on(struct SHEET *key_win)
{
  280e88:	f3 0f 1e fb          	endbr32 
  280e8c:	55                   	push   %ebp
  280e8d:	89 e5                	mov    %esp,%ebp
  280e8f:	83 ec 08             	sub    $0x8,%esp
	change_wtitle8(key_win, 1);
  280e92:	83 ec 08             	sub    $0x8,%esp
  280e95:	6a 01                	push   $0x1
  280e97:	ff 75 08             	pushl  0x8(%ebp)
  280e9a:	e8 75 3a 00 00       	call   284914 <change_wtitle8>
  280e9f:	83 c4 10             	add    $0x10,%esp
	if ((key_win->flags & 0x20) != 0) {
  280ea2:	8b 45 08             	mov    0x8(%ebp),%eax
  280ea5:	8b 40 1c             	mov    0x1c(%eax),%eax
  280ea8:	83 e0 20             	and    $0x20,%eax
  280eab:	85 c0                	test   %eax,%eax
  280ead:	74 18                	je     280ec7 <keywin_on+0x3f>
		fifo32_put(&key_win->task->fifo, 2); /* ÔøΩRÔøΩÔøΩÔøΩ\ÔøΩ[ÔøΩÔøΩÔøΩÃÉJÔøΩ[ÔøΩ\ÔøΩÔøΩON */
  280eaf:	8b 45 08             	mov    0x8(%ebp),%eax
  280eb2:	8b 40 24             	mov    0x24(%eax),%eax
  280eb5:	83 c0 10             	add    $0x10,%eax
  280eb8:	83 ec 08             	sub    $0x8,%esp
  280ebb:	6a 02                	push   $0x2
  280ebd:	50                   	push   %eax
  280ebe:	e8 e8 11 00 00       	call   2820ab <fifo32_put>
  280ec3:	83 c4 10             	add    $0x10,%esp
	}
	return;
  280ec6:	90                   	nop
  280ec7:	90                   	nop
}
  280ec8:	c9                   	leave  
  280ec9:	c3                   	ret    

00280eca <open_constask>:

struct TASK *open_constask(struct SHEET *sht, unsigned int memtotal)
{
  280eca:	f3 0f 1e fb          	endbr32 
  280ece:	55                   	push   %ebp
  280ecf:	89 e5                	mov    %esp,%ebp
  280ed1:	83 ec 18             	sub    $0x18,%esp
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  280ed4:	c7 45 f4 00 00 3c 00 	movl   $0x3c0000,-0xc(%ebp)
	struct TASK *task = task_alloc();
  280edb:	e8 ed 31 00 00       	call   2840cd <task_alloc>
  280ee0:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int *cons_fifo = (int *) memman_alloc_4k(memman, 128 * 4);
  280ee3:	83 ec 08             	sub    $0x8,%esp
  280ee6:	68 00 02 00 00       	push   $0x200
  280eeb:	ff 75 f4             	pushl  -0xc(%ebp)
  280eee:	e8 01 1a 00 00       	call   2828f4 <memman_alloc_4k>
  280ef3:	83 c4 10             	add    $0x10,%esp
  280ef6:	89 45 ec             	mov    %eax,-0x14(%ebp)
	task->cons_stack = memman_alloc_4k(memman, 64 * 1024);
  280ef9:	83 ec 08             	sub    $0x8,%esp
  280efc:	68 00 00 01 00       	push   $0x10000
  280f01:	ff 75 f4             	pushl  -0xc(%ebp)
  280f04:	e8 eb 19 00 00       	call   2828f4 <memman_alloc_4k>
  280f09:	83 c4 10             	add    $0x10,%esp
  280f0c:	89 c2                	mov    %eax,%edx
  280f0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f11:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
	task->tss.esp = task->cons_stack + 64 * 1024 - 12;
  280f17:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f1a:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  280f20:	8d 90 f4 ff 00 00    	lea    0xfff4(%eax),%edx
  280f26:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f29:	89 50 64             	mov    %edx,0x64(%eax)
	task->tss.eip = (int) &console_task;
  280f2c:	ba 09 4a 28 00       	mov    $0x284a09,%edx
  280f31:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f34:	89 50 4c             	mov    %edx,0x4c(%eax)
	task->tss.es = 1 * 8;
  280f37:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f3a:	c7 40 74 08 00 00 00 	movl   $0x8,0x74(%eax)
	task->tss.cs = 2 * 8;
  280f41:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f44:	c7 40 78 10 00 00 00 	movl   $0x10,0x78(%eax)
	task->tss.ss = 1 * 8;
  280f4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f4e:	c7 40 7c 08 00 00 00 	movl   $0x8,0x7c(%eax)
	task->tss.ds = 1 * 8;
  280f55:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f58:	c7 80 80 00 00 00 08 	movl   $0x8,0x80(%eax)
  280f5f:	00 00 00 
	task->tss.fs = 1 * 8;
  280f62:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f65:	c7 80 84 00 00 00 08 	movl   $0x8,0x84(%eax)
  280f6c:	00 00 00 
	task->tss.gs = 1 * 8;
  280f6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f72:	c7 80 88 00 00 00 08 	movl   $0x8,0x88(%eax)
  280f79:	00 00 00 
	*((int *) (task->tss.esp + 4)) = (int) sht;
  280f7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f7f:	8b 40 64             	mov    0x64(%eax),%eax
  280f82:	83 c0 04             	add    $0x4,%eax
  280f85:	89 c2                	mov    %eax,%edx
  280f87:	8b 45 08             	mov    0x8(%ebp),%eax
  280f8a:	89 02                	mov    %eax,(%edx)
	*((int *) (task->tss.esp + 8)) = memtotal;
  280f8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280f8f:	8b 40 64             	mov    0x64(%eax),%eax
  280f92:	83 c0 08             	add    $0x8,%eax
  280f95:	89 c2                	mov    %eax,%edx
  280f97:	8b 45 0c             	mov    0xc(%ebp),%eax
  280f9a:	89 02                	mov    %eax,(%edx)
	task_run(task, 2, 2); /* level=2, priority=2 */
  280f9c:	83 ec 04             	sub    $0x4,%esp
  280f9f:	6a 02                	push   $0x2
  280fa1:	6a 02                	push   $0x2
  280fa3:	ff 75 f0             	pushl  -0x10(%ebp)
  280fa6:	e8 39 32 00 00       	call   2841e4 <task_run>
  280fab:	83 c4 10             	add    $0x10,%esp
	fifo32_init(&task->fifo, 128, cons_fifo, task);
  280fae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  280fb1:	83 c0 10             	add    $0x10,%eax
  280fb4:	ff 75 f0             	pushl  -0x10(%ebp)
  280fb7:	ff 75 ec             	pushl  -0x14(%ebp)
  280fba:	68 80 00 00 00       	push   $0x80
  280fbf:	50                   	push   %eax
  280fc0:	e8 9b 10 00 00       	call   282060 <fifo32_init>
  280fc5:	83 c4 10             	add    $0x10,%esp
	return task;
  280fc8:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  280fcb:	c9                   	leave  
  280fcc:	c3                   	ret    

00280fcd <open_console>:

struct SHEET *open_console(struct SHTCTL *shtctl, unsigned int memtotal)
{
  280fcd:	f3 0f 1e fb          	endbr32 
  280fd1:	55                   	push   %ebp
  280fd2:	89 e5                	mov    %esp,%ebp
  280fd4:	83 ec 18             	sub    $0x18,%esp
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  280fd7:	c7 45 f4 00 00 3c 00 	movl   $0x3c0000,-0xc(%ebp)
	struct SHEET *sht = sheet_alloc(shtctl);
  280fde:	83 ec 0c             	sub    $0xc,%esp
  280fe1:	ff 75 08             	pushl  0x8(%ebp)
  280fe4:	e8 55 1a 00 00       	call   282a3e <sheet_alloc>
  280fe9:	83 c4 10             	add    $0x10,%esp
  280fec:	89 45 f0             	mov    %eax,-0x10(%ebp)
	unsigned char *buf = (unsigned char *) memman_alloc_4k(memman, 256 * 165);
  280fef:	83 ec 08             	sub    $0x8,%esp
  280ff2:	68 00 a5 00 00       	push   $0xa500
  280ff7:	ff 75 f4             	pushl  -0xc(%ebp)
  280ffa:	e8 f5 18 00 00       	call   2828f4 <memman_alloc_4k>
  280fff:	83 c4 10             	add    $0x10,%esp
  281002:	89 45 ec             	mov    %eax,-0x14(%ebp)
	sheet_setbuf(sht, buf, 256, 165, -1); /* ÔøΩÔøΩÔøΩÔøΩÔøΩFÔøΩ»ÇÔøΩ */
  281005:	83 ec 0c             	sub    $0xc,%esp
  281008:	6a ff                	push   $0xffffffff
  28100a:	68 a5 00 00 00       	push   $0xa5
  28100f:	68 00 01 00 00       	push   $0x100
  281014:	ff 75 ec             	pushl  -0x14(%ebp)
  281017:	ff 75 f0             	pushl  -0x10(%ebp)
  28101a:	e8 a4 1a 00 00       	call   282ac3 <sheet_setbuf>
  28101f:	83 c4 20             	add    $0x20,%esp
	make_window8(buf, 256, 165, "console", 0);
  281022:	83 ec 0c             	sub    $0xc,%esp
  281025:	6a 00                	push   $0x0
  281027:	68 35 11 31 00       	push   $0x311135
  28102c:	68 a5 00 00 00       	push   $0xa5
  281031:	68 00 01 00 00       	push   $0x100
  281036:	ff 75 ec             	pushl  -0x14(%ebp)
  281039:	e8 3e 33 00 00       	call   28437c <make_window8>
  28103e:	83 c4 20             	add    $0x20,%esp
	make_textbox8(sht, 8, 28, 240, 128, COL8_000000);
  281041:	83 ec 08             	sub    $0x8,%esp
  281044:	6a 00                	push   $0x0
  281046:	68 80 00 00 00       	push   $0x80
  28104b:	68 f0 00 00 00       	push   $0xf0
  281050:	6a 1c                	push   $0x1c
  281052:	6a 08                	push   $0x8
  281054:	ff 75 f0             	pushl  -0x10(%ebp)
  281057:	e8 b5 36 00 00       	call   284711 <make_textbox8>
  28105c:	83 c4 20             	add    $0x20,%esp
	sht->task = open_constask(sht, memtotal);
  28105f:	83 ec 08             	sub    $0x8,%esp
  281062:	ff 75 0c             	pushl  0xc(%ebp)
  281065:	ff 75 f0             	pushl  -0x10(%ebp)
  281068:	e8 5d fe ff ff       	call   280eca <open_constask>
  28106d:	83 c4 10             	add    $0x10,%esp
  281070:	8b 55 f0             	mov    -0x10(%ebp),%edx
  281073:	89 42 24             	mov    %eax,0x24(%edx)
	sht->flags |= 0x20;	/* ÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ */
  281076:	8b 45 f0             	mov    -0x10(%ebp),%eax
  281079:	8b 40 1c             	mov    0x1c(%eax),%eax
  28107c:	83 c8 20             	or     $0x20,%eax
  28107f:	89 c2                	mov    %eax,%edx
  281081:	8b 45 f0             	mov    -0x10(%ebp),%eax
  281084:	89 50 1c             	mov    %edx,0x1c(%eax)
	return sht;
  281087:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  28108a:	c9                   	leave  
  28108b:	c3                   	ret    

0028108c <close_constask>:

void close_constask(struct TASK *task)
{
  28108c:	f3 0f 1e fb          	endbr32 
  281090:	55                   	push   %ebp
  281091:	89 e5                	mov    %esp,%ebp
  281093:	83 ec 18             	sub    $0x18,%esp
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  281096:	c7 45 f4 00 00 3c 00 	movl   $0x3c0000,-0xc(%ebp)
	task_sleep(task);
  28109d:	83 ec 0c             	sub    $0xc,%esp
  2810a0:	ff 75 08             	pushl  0x8(%ebp)
  2810a3:	e8 ad 31 00 00       	call   284255 <task_sleep>
  2810a8:	83 c4 10             	add    $0x10,%esp
	memman_free_4k(memman, task->cons_stack, 64 * 1024);
  2810ab:	8b 45 08             	mov    0x8(%ebp),%eax
  2810ae:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  2810b4:	83 ec 04             	sub    $0x4,%esp
  2810b7:	68 00 00 01 00       	push   $0x10000
  2810bc:	50                   	push   %eax
  2810bd:	ff 75 f4             	pushl  -0xc(%ebp)
  2810c0:	e8 5f 18 00 00       	call   282924 <memman_free_4k>
  2810c5:	83 c4 10             	add    $0x10,%esp
	memman_free_4k(memman, (int) task->fifo.buf, 128 * 4);
  2810c8:	8b 45 08             	mov    0x8(%ebp),%eax
  2810cb:	8b 40 10             	mov    0x10(%eax),%eax
  2810ce:	83 ec 04             	sub    $0x4,%esp
  2810d1:	68 00 02 00 00       	push   $0x200
  2810d6:	50                   	push   %eax
  2810d7:	ff 75 f4             	pushl  -0xc(%ebp)
  2810da:	e8 45 18 00 00       	call   282924 <memman_free_4k>
  2810df:	83 c4 10             	add    $0x10,%esp
	task->flags = 0; /* task_free(task); ÔøΩÃëÔøΩÔøΩÔøΩ */
  2810e2:	8b 45 08             	mov    0x8(%ebp),%eax
  2810e5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	return;
  2810ec:	90                   	nop
}
  2810ed:	c9                   	leave  
  2810ee:	c3                   	ret    

002810ef <close_console>:

void close_console(struct SHEET *sht)
{
  2810ef:	f3 0f 1e fb          	endbr32 
  2810f3:	55                   	push   %ebp
  2810f4:	89 e5                	mov    %esp,%ebp
  2810f6:	83 ec 18             	sub    $0x18,%esp
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  2810f9:	c7 45 f4 00 00 3c 00 	movl   $0x3c0000,-0xc(%ebp)
	struct TASK *task = sht->task;
  281100:	8b 45 08             	mov    0x8(%ebp),%eax
  281103:	8b 40 24             	mov    0x24(%eax),%eax
  281106:	89 45 f0             	mov    %eax,-0x10(%ebp)
	memman_free_4k(memman, (int) sht->buf, 256 * 165);
  281109:	8b 45 08             	mov    0x8(%ebp),%eax
  28110c:	8b 00                	mov    (%eax),%eax
  28110e:	83 ec 04             	sub    $0x4,%esp
  281111:	68 00 a5 00 00       	push   $0xa500
  281116:	50                   	push   %eax
  281117:	ff 75 f4             	pushl  -0xc(%ebp)
  28111a:	e8 05 18 00 00       	call   282924 <memman_free_4k>
  28111f:	83 c4 10             	add    $0x10,%esp
	sheet_free(sht);
  281122:	83 ec 0c             	sub    $0xc,%esp
  281125:	ff 75 08             	pushl  0x8(%ebp)
  281128:	e8 66 27 00 00       	call   283893 <sheet_free>
  28112d:	83 c4 10             	add    $0x10,%esp
	close_constask(task);
  281130:	83 ec 0c             	sub    $0xc,%esp
  281133:	ff 75 f0             	pushl  -0x10(%ebp)
  281136:	e8 51 ff ff ff       	call   28108c <close_constask>
  28113b:	83 c4 10             	add    $0x10,%esp
	return;
  28113e:	90                   	nop
}
  28113f:	c9                   	leave  
  281140:	c3                   	ret    
  281141:	66 90                	xchg   %ax,%ax
  281143:	66 90                	xchg   %ax,%ax
  281145:	66 90                	xchg   %ax,%ax
  281147:	66 90                	xchg   %ax,%ax
  281149:	66 90                	xchg   %ax,%ax
  28114b:	66 90                	xchg   %ax,%ax
  28114d:	66 90                	xchg   %ax,%ax
  28114f:	90                   	nop

00281150 <io_hlt>:
		EXTERN	hrb_api

[SECTION .text]

io_hlt:	; void io_hlt(void);
		HLT
  281150:	f4                   	hlt    
		RET
  281151:	c3                   	ret    

00281152 <io_cli>:

io_cli:	; void io_cli(void);
		CLI
  281152:	fa                   	cli    
		RET
  281153:	c3                   	ret    

00281154 <io_sti>:

io_sti:	; void io_sti(void);
		STI
  281154:	fb                   	sti    
		RET
  281155:	c3                   	ret    

00281156 <io_stihlt>:

io_stihlt:	; void io_stihlt(void);
		STI
  281156:	fb                   	sti    
		HLT
  281157:	f4                   	hlt    
		RET
  281158:	c3                   	ret    

00281159 <io_in8>:

io_in8:	; int io_in8(int port);
		MOV		EDX,[ESP+4]		; port
  281159:	8b 54 24 04          	mov    0x4(%esp),%edx
		MOV		EAX,0
  28115d:	b8 00 00 00 00       	mov    $0x0,%eax
		IN		AL,DX
  281162:	ec                   	in     (%dx),%al
		RET
  281163:	c3                   	ret    

00281164 <io_in16>:

io_in16:	; int io_in16(int port);
		MOV		EDX,[ESP+4]		; port
  281164:	8b 54 24 04          	mov    0x4(%esp),%edx
		MOV		EAX,0
  281168:	b8 00 00 00 00       	mov    $0x0,%eax
		IN		AX,DX
  28116d:	66 ed                	in     (%dx),%ax
		RET
  28116f:	c3                   	ret    

00281170 <io_in32>:

io_in32:	; int io_in32(int port);
		MOV		EDX,[ESP+4]		; port
  281170:	8b 54 24 04          	mov    0x4(%esp),%edx
		IN		EAX,DX
  281174:	ed                   	in     (%dx),%eax
		RET
  281175:	c3                   	ret    

00281176 <io_out8>:

io_out8:	; void io_out8(int port, int data);
		MOV		EDX,[ESP+4]		; port
  281176:	8b 54 24 04          	mov    0x4(%esp),%edx
		MOV		AL,[ESP+8]		; data
  28117a:	8a 44 24 08          	mov    0x8(%esp),%al
		OUT		DX,AL
  28117e:	ee                   	out    %al,(%dx)
		RET
  28117f:	c3                   	ret    

00281180 <io_out16>:

io_out16:	; void io_out16(int port, int data);
		MOV		EDX,[ESP+4]		; port
  281180:	8b 54 24 04          	mov    0x4(%esp),%edx
		MOV		EAX,[ESP+8]		; data
  281184:	8b 44 24 08          	mov    0x8(%esp),%eax
		OUT		DX,AX
  281188:	66 ef                	out    %ax,(%dx)
		RET
  28118a:	c3                   	ret    

0028118b <io_out32>:

io_out32:	; void io_out32(int port, int data);
		MOV		EDX,[ESP+4]		; port
  28118b:	8b 54 24 04          	mov    0x4(%esp),%edx
		MOV		EAX,[ESP+8]		; data
  28118f:	8b 44 24 08          	mov    0x8(%esp),%eax
		OUT		DX,EAX
  281193:	ef                   	out    %eax,(%dx)
		RET
  281194:	c3                   	ret    

00281195 <io_load_eflags>:

io_load_eflags:	; int io_load_eflags(void);
		PUSHFD		; PUSH EFLAGS Ç∆Ç¢Ç§à”ñ°
  281195:	9c                   	pushf  
		POP		EAX
  281196:	58                   	pop    %eax
		RET
  281197:	c3                   	ret    

00281198 <io_store_eflags>:

io_store_eflags:	; void io_store_eflags(int eflags);
		MOV		EAX,[ESP+4]
  281198:	8b 44 24 04          	mov    0x4(%esp),%eax
		PUSH	EAX
  28119c:	50                   	push   %eax
		POPFD		; POP EFLAGS Ç∆Ç¢Ç§à”ñ°
  28119d:	9d                   	popf   
		RET
  28119e:	c3                   	ret    

0028119f <load_gdtr>:

load_gdtr:		; void load_gdtr(int limit, int addr);
		MOV		AX,[ESP+4]		; limit
  28119f:	66 8b 44 24 04       	mov    0x4(%esp),%ax
		MOV		[ESP+6],AX
  2811a4:	66 89 44 24 06       	mov    %ax,0x6(%esp)
		LGDT	[ESP+6]
  2811a9:	0f 01 54 24 06       	lgdtl  0x6(%esp)
		RET
  2811ae:	c3                   	ret    

002811af <load_idtr>:

load_idtr:		; void load_idtr(int limit, int addr);
		MOV		AX,[ESP+4]		; limit
  2811af:	66 8b 44 24 04       	mov    0x4(%esp),%ax
		MOV		[ESP+6],AX
  2811b4:	66 89 44 24 06       	mov    %ax,0x6(%esp)
		LIDT	[ESP+6]
  2811b9:	0f 01 5c 24 06       	lidtl  0x6(%esp)
		RET
  2811be:	c3                   	ret    

002811bf <load_cr0>:

load_cr0:		; int load_cr0(void);
		MOV		EAX,CR0
  2811bf:	0f 20 c0             	mov    %cr0,%eax
		RET
  2811c2:	c3                   	ret    

002811c3 <store_cr0>:

store_cr0:		; void store_cr0(int cr0);
		MOV		EAX,[ESP+4]
  2811c3:	8b 44 24 04          	mov    0x4(%esp),%eax
		MOV		CR0,EAX
  2811c7:	0f 22 c0             	mov    %eax,%cr0
		RET
  2811ca:	c3                   	ret    

002811cb <load_tr>:

load_tr:		; void load_tr(int tr);
		LTR		[ESP+4]			; tr
  2811cb:	0f 00 5c 24 04       	ltr    0x4(%esp)
		RET
  2811d0:	c3                   	ret    

002811d1 <asm_inthandler20>:

asm_inthandler20:
		PUSH	ES
  2811d1:	06                   	push   %es
		PUSH	DS
  2811d2:	1e                   	push   %ds
		PUSHAD
  2811d3:	60                   	pusha  
		MOV		EAX,ESP
  2811d4:	89 e0                	mov    %esp,%eax
		PUSH	EAX
  2811d6:	50                   	push   %eax
		MOV		AX,SS
  2811d7:	66 8c d0             	mov    %ss,%ax
		MOV		DS,AX
  2811da:	8e d8                	mov    %eax,%ds
		MOV		ES,AX
  2811dc:	8e c0                	mov    %eax,%es
		CALL	inthandler20
  2811de:	e8 df 28 00 00       	call   283ac2 <inthandler20>
		POP		EAX
  2811e3:	58                   	pop    %eax
		POPAD
  2811e4:	61                   	popa   
		POP		DS
  2811e5:	1f                   	pop    %ds
		POP		ES
  2811e6:	07                   	pop    %es
		IRETD
  2811e7:	cf                   	iret   

002811e8 <asm_inthandler21>:

asm_inthandler21:
		PUSH	ES
  2811e8:	06                   	push   %es
		PUSH	DS
  2811e9:	1e                   	push   %ds
		PUSHAD
  2811ea:	60                   	pusha  
		MOV		EAX,ESP
  2811eb:	89 e0                	mov    %esp,%eax
		PUSH	EAX
  2811ed:	50                   	push   %eax
		MOV		AX,SS
  2811ee:	66 8c d0             	mov    %ss,%ax
		MOV		DS,AX
  2811f1:	8e d8                	mov    %eax,%ds
		MOV		ES,AX
  2811f3:	8e c0                	mov    %eax,%es
		CALL	inthandler21
  2811f5:	e8 ee 0f 00 00       	call   2821e8 <inthandler21>
		POP		EAX
  2811fa:	58                   	pop    %eax
		POPAD
  2811fb:	61                   	popa   
		POP		DS
  2811fc:	1f                   	pop    %ds
		POP		ES
  2811fd:	07                   	pop    %es
		IRETD
  2811fe:	cf                   	iret   

002811ff <asm_inthandler2c>:

asm_inthandler2c:
		PUSH	ES
  2811ff:	06                   	push   %es
		PUSH	DS
  281200:	1e                   	push   %ds
		PUSHAD
  281201:	60                   	pusha  
		MOV		EAX,ESP
  281202:	89 e0                	mov    %esp,%eax
		PUSH	EAX
  281204:	50                   	push   %eax
		MOV		AX,SS
  281205:	66 8c d0             	mov    %ss,%ax
		MOV		DS,AX
  281208:	8e d8                	mov    %eax,%ds
		MOV		ES,AX
  28120a:	8e c0                	mov    %eax,%es
		CALL	inthandler2c
  28120c:	e8 89 10 00 00       	call   28229a <inthandler2c>
		POP		EAX
  281211:	58                   	pop    %eax
		POPAD
  281212:	61                   	popa   
		POP		DS
  281213:	1f                   	pop    %ds
		POP		ES
  281214:	07                   	pop    %es
		IRETD
  281215:	cf                   	iret   

00281216 <asm_inthandler0c>:

asm_inthandler0c:
		STI
  281216:	fb                   	sti    
		PUSH	ES
  281217:	06                   	push   %es
		PUSH	DS
  281218:	1e                   	push   %ds
		PUSHAD
  281219:	60                   	pusha  
		MOV		EAX,ESP
  28121a:	89 e0                	mov    %esp,%eax
		PUSH	EAX
  28121c:	50                   	push   %eax
		MOV		AX,SS
  28121d:	66 8c d0             	mov    %ss,%ax
		MOV		DS,AX
  281220:	8e d8                	mov    %eax,%ds
		MOV		ES,AX
  281222:	8e c0                	mov    %eax,%es
		CALL	inthandler0c
  281224:	e8 cc 52 00 00       	call   2864f5 <inthandler0c>
		CMP		EAX,0
  281229:	83 f8 00             	cmp    $0x0,%eax
		JNE		asm_end_app
  28122c:	0f 85 91 00 00 00    	jne    2812c3 <asm_end_app>
		POP		EAX
  281232:	58                   	pop    %eax
		POPAD
  281233:	61                   	popa   
		POP		DS
  281234:	1f                   	pop    %ds
		POP		ES
  281235:	07                   	pop    %es
		ADD		ESP,4			; INT 0x0c Ç≈Ç‡ÅAÇ±ÇÍÇ™ïKóv
  281236:	83 c4 04             	add    $0x4,%esp
		IRETD
  281239:	cf                   	iret   

0028123a <asm_inthandler0d>:

asm_inthandler0d:
		STI
  28123a:	fb                   	sti    
		PUSH	ES
  28123b:	06                   	push   %es
		PUSH	DS
  28123c:	1e                   	push   %ds
		PUSHAD
  28123d:	60                   	pusha  
		MOV		EAX,ESP
  28123e:	89 e0                	mov    %esp,%eax
		PUSH	EAX
  281240:	50                   	push   %eax
		MOV		AX,SS
  281241:	66 8c d0             	mov    %ss,%ax
		MOV		DS,AX
  281244:	8e d8                	mov    %eax,%ds
		MOV		ES,AX
  281246:	8e c0                	mov    %eax,%es
		CALL	inthandler0d
  281248:	e8 10 53 00 00       	call   28655d <inthandler0d>
		CMP		EAX,0			; Ç±Ç±ÇæÇØà·Ç§
  28124d:	83 f8 00             	cmp    $0x0,%eax
		JNE		asm_end_app	; Ç±Ç±ÇæÇØà·Ç§
  281250:	75 71                	jne    2812c3 <asm_end_app>
		POP		EAX
  281252:	58                   	pop    %eax
		POPAD
  281253:	61                   	popa   
		POP		DS
  281254:	1f                   	pop    %ds
		POP		ES
  281255:	07                   	pop    %es
		ADD		ESP,4			; INT 0x0d Ç≈ÇÕÅAÇ±ÇÍÇ™ïKóv
  281256:	83 c4 04             	add    $0x4,%esp
		IRETD
  281259:	cf                   	iret   

0028125a <memtest_sub>:

memtest_sub:	; unsigned int memtest_sub(unsigned int start, unsigned int end)
		PUSH	EDI						; ÅiEBX, ESI, EDI Ç‡égÇ¢ÇΩÇ¢ÇÃÇ≈Åj
  28125a:	57                   	push   %edi
		PUSH	ESI
  28125b:	56                   	push   %esi
		PUSH	EBX
  28125c:	53                   	push   %ebx
		MOV		ESI,0xaa55aa55			; pat0 = 0xaa55aa55;
  28125d:	be 55 aa 55 aa       	mov    $0xaa55aa55,%esi
		MOV		EDI,0x55aa55aa			; pat1 = 0x55aa55aa;
  281262:	bf aa 55 aa 55       	mov    $0x55aa55aa,%edi
		MOV		EAX,[ESP+12+4]			; i = start;
  281267:	8b 44 24 10          	mov    0x10(%esp),%eax

0028126b <mts_loop>:
mts_loop:
		MOV		EBX,EAX
  28126b:	89 c3                	mov    %eax,%ebx
		ADD		EBX,0xffc				; p = i + 0xffc;
  28126d:	81 c3 fc 0f 00 00    	add    $0xffc,%ebx
		MOV		EDX,[EBX]				; old = *p;
  281273:	8b 13                	mov    (%ebx),%edx
		MOV		[EBX],ESI				; *p = pat0;
  281275:	89 33                	mov    %esi,(%ebx)
		XOR		DWORD [EBX],0xffffffff	; *p ^= 0xffffffff;
  281277:	83 33 ff             	xorl   $0xffffffff,(%ebx)
		CMP		EDI,[EBX]				; if (*p != pat1) goto fin;
  28127a:	3b 3b                	cmp    (%ebx),%edi
		JNE		mts_fin
  28127c:	75 18                	jne    281296 <mts_fin>
		XOR		DWORD [EBX],0xffffffff	; *p ^= 0xffffffff;
  28127e:	83 33 ff             	xorl   $0xffffffff,(%ebx)
		CMP		ESI,[EBX]				; if (*p != pat0) goto fin;
  281281:	3b 33                	cmp    (%ebx),%esi
		JNE		mts_fin
  281283:	75 11                	jne    281296 <mts_fin>
		MOV		[EBX],EDX				; *p = old;
  281285:	89 13                	mov    %edx,(%ebx)
		ADD		EAX,0x1000				; i += 0x1000;
  281287:	05 00 10 00 00       	add    $0x1000,%eax
		CMP		EAX,[ESP+12+8]			; if (i <= end) goto mts_loop;
  28128c:	3b 44 24 14          	cmp    0x14(%esp),%eax
		JBE		mts_loop
  281290:	76 d9                	jbe    28126b <mts_loop>
		POP		EBX
  281292:	5b                   	pop    %ebx
		POP		ESI
  281293:	5e                   	pop    %esi
		POP		EDI
  281294:	5f                   	pop    %edi
		RET
  281295:	c3                   	ret    

00281296 <mts_fin>:
mts_fin:
		MOV		[EBX],EDX				; *p = old;
  281296:	89 13                	mov    %edx,(%ebx)
		POP		EBX
  281298:	5b                   	pop    %ebx
		POP		ESI
  281299:	5e                   	pop    %esi
		POP		EDI
  28129a:	5f                   	pop    %edi
		RET
  28129b:	c3                   	ret    

0028129c <farjmp>:

farjmp:		; void farjmp(int eip, int cs);
		JMP		FAR	[ESP+4]				; eip, cs
  28129c:	ff 6c 24 04          	ljmp   *0x4(%esp)
		RET
  2812a0:	c3                   	ret    

002812a1 <farcall>:

farcall:		; void farcall(int eip, int cs);
		CALL	FAR	[ESP+4]				; eip, cs
  2812a1:	ff 5c 24 04          	lcall  *0x4(%esp)
		RET
  2812a5:	c3                   	ret    

002812a6 <asm_hrb_api>:

asm_hrb_api:
		STI
  2812a6:	fb                   	sti    
		PUSH	DS
  2812a7:	1e                   	push   %ds
		PUSH	ES
  2812a8:	06                   	push   %es
		PUSHAD		; ï€ë∂ÇÃÇΩÇﬂÇÃPUSH
  2812a9:	60                   	pusha  
		PUSHAD		; hrb_apiÇ…ÇÌÇΩÇ∑ÇΩÇﬂÇÃPUSH
  2812aa:	60                   	pusha  
		MOV		AX,SS
  2812ab:	66 8c d0             	mov    %ss,%ax
		MOV		DS,AX		; OSópÇÃÉZÉOÉÅÉìÉgÇDSÇ∆ESÇ…Ç‡ì¸ÇÍÇÈ
  2812ae:	8e d8                	mov    %eax,%ds
		MOV		ES,AX
  2812b0:	8e c0                	mov    %eax,%es
		CALL	hrb_api
  2812b2:	e8 2e 48 00 00       	call   285ae5 <hrb_api>
		CMP		EAX,0		; EAXÇ™0Ç≈Ç»ÇØÇÍÇŒÉAÉvÉäèIóπèàóù
  2812b7:	83 f8 00             	cmp    $0x0,%eax
		JNE		asm_end_app
  2812ba:	75 07                	jne    2812c3 <asm_end_app>
		ADD		ESP,32
  2812bc:	83 c4 20             	add    $0x20,%esp
		POPAD
  2812bf:	61                   	popa   
		POP		ES
  2812c0:	07                   	pop    %es
		POP		DS
  2812c1:	1f                   	pop    %ds
		IRETD
  2812c2:	cf                   	iret   

002812c3 <asm_end_app>:
asm_end_app:
;	EAXÇÕtss.esp0ÇÃî‘ín
		MOV		ESP,[EAX]
  2812c3:	8b 20                	mov    (%eax),%esp
		MOV		DWORD [EAX+4],0
  2812c5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
		POPAD
  2812cc:	61                   	popa   
		RET					; cmd_appÇ÷ãAÇÈ
  2812cd:	c3                   	ret    

002812ce <start_app>:

start_app:		; void start_app(int eip, int cs, int esp, int ds, int *tss_esp0);
		PUSHAD		; 32ÉrÉbÉgÉåÉWÉXÉ^ÇëSïîï€ë∂ÇµÇƒÇ®Ç≠
  2812ce:	60                   	pusha  
		MOV		EAX,[ESP+36]	; ÉAÉvÉäópÇÃEIP
  2812cf:	8b 44 24 24          	mov    0x24(%esp),%eax
		MOV		ECX,[ESP+40]	; ÉAÉvÉäópÇÃCS
  2812d3:	8b 4c 24 28          	mov    0x28(%esp),%ecx
		MOV		EDX,[ESP+44]	; ÉAÉvÉäópÇÃESP
  2812d7:	8b 54 24 2c          	mov    0x2c(%esp),%edx
		MOV		EBX,[ESP+48]	; ÉAÉvÉäópÇÃDS/SS
  2812db:	8b 5c 24 30          	mov    0x30(%esp),%ebx
		MOV		EBP,[ESP+52]	; tss.esp0ÇÃî‘ín
  2812df:	8b 6c 24 34          	mov    0x34(%esp),%ebp
		MOV		[EBP  ],ESP		; OSópÇÃESPÇï€ë∂
  2812e3:	89 65 00             	mov    %esp,0x0(%ebp)
		MOV		[EBP+4],SS		; OSópÇÃSSÇï€ë∂
  2812e6:	8c 55 04             	mov    %ss,0x4(%ebp)
		MOV		ES,BX
  2812e9:	8e c3                	mov    %ebx,%es
		MOV		DS,BX
  2812eb:	8e db                	mov    %ebx,%ds
		MOV		FS,BX
  2812ed:	8e e3                	mov    %ebx,%fs
		MOV		GS,BX
  2812ef:	8e eb                	mov    %ebx,%gs
;	à»â∫ÇÕRETFÇ≈ÉAÉvÉäÇ…çsÇ©ÇπÇÈÇΩÇﬂÇÃÉXÉ^ÉbÉNí≤êÆ
		OR		ECX,3			; ÉAÉvÉäópÇÃÉZÉOÉÅÉìÉgî‘çÜÇ…3ÇORÇ∑ÇÈ
  2812f1:	83 c9 03             	or     $0x3,%ecx
		OR		EBX,3			; ÉAÉvÉäópÇÃÉZÉOÉÅÉìÉgî‘çÜÇ…3ÇORÇ∑ÇÈ
  2812f4:	83 cb 03             	or     $0x3,%ebx
		PUSH	EBX				; ÉAÉvÉäÇÃSS
  2812f7:	53                   	push   %ebx
		PUSH	EDX				; ÉAÉvÉäÇÃESP
  2812f8:	52                   	push   %edx
		PUSH	ECX				; ÉAÉvÉäÇÃCS
  2812f9:	51                   	push   %ecx
		PUSH	EAX				; ÉAÉvÉäÇÃEIP
  2812fa:	50                   	push   %eax
		RETF
  2812fb:	cb                   	lret   

002812fc <init_palette>:
/* ÉOÉâÉtÉBÉbÉNèàóùä÷åW */

#include "bootpack.h"

void init_palette(void)
{
  2812fc:	f3 0f 1e fb          	endbr32 
  281300:	55                   	push   %ebp
  281301:	89 e5                	mov    %esp,%ebp
  281303:	53                   	push   %ebx
  281304:	81 ec a4 02 00 00    	sub    $0x2a4,%esp
		0x00, 0x84, 0x84,	/* 14:à√Ç¢êÖêF */
		0x84, 0x84, 0x84	/* 15:à√Ç¢äDêF */
	};
	unsigned char table2[216 * 3];
	int r, g, b;
	set_palette(0, 15, table_rgb);
  28130a:	83 ec 04             	sub    $0x4,%esp
  28130d:	68 40 11 31 00       	push   $0x311140
  281312:	6a 0f                	push   $0xf
  281314:	6a 00                	push   $0x0
  281316:	e8 33 01 00 00       	call   28144e <set_palette>
  28131b:	83 c4 10             	add    $0x10,%esp
	for (b = 0; b < 6; b++) {
  28131e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  281325:	e9 fb 00 00 00       	jmp    281425 <init_palette+0x129>
		for (g = 0; g < 6; g++) {
  28132a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  281331:	e9 e1 00 00 00       	jmp    281417 <init_palette+0x11b>
			for (r = 0; r < 6; r++) {
  281336:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  28133d:	e9 c7 00 00 00       	jmp    281409 <init_palette+0x10d>
				table2[(r + g * 6 + b * 36) * 3 + 0] = r * 51;
  281342:	8b 45 f4             	mov    -0xc(%ebp),%eax
  281345:	89 c3                	mov    %eax,%ebx
  281347:	8b 55 f0             	mov    -0x10(%ebp),%edx
  28134a:	89 d0                	mov    %edx,%eax
  28134c:	01 c0                	add    %eax,%eax
  28134e:	01 d0                	add    %edx,%eax
  281350:	01 c0                	add    %eax,%eax
  281352:	89 c2                	mov    %eax,%edx
  281354:	8b 45 f4             	mov    -0xc(%ebp),%eax
  281357:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  28135a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  28135d:	89 d0                	mov    %edx,%eax
  28135f:	c1 e0 03             	shl    $0x3,%eax
  281362:	01 d0                	add    %edx,%eax
  281364:	c1 e0 02             	shl    $0x2,%eax
  281367:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  28136a:	89 d0                	mov    %edx,%eax
  28136c:	01 c0                	add    %eax,%eax
  28136e:	01 c2                	add    %eax,%edx
  281370:	b9 33 00 00 00       	mov    $0x33,%ecx
  281375:	89 d8                	mov    %ebx,%eax
  281377:	0f af c1             	imul   %ecx,%eax
  28137a:	88 84 15 64 fd ff ff 	mov    %al,-0x29c(%ebp,%edx,1)
				table2[(r + g * 6 + b * 36) * 3 + 1] = g * 51;
  281381:	8b 45 f0             	mov    -0x10(%ebp),%eax
  281384:	89 c3                	mov    %eax,%ebx
  281386:	8b 55 f0             	mov    -0x10(%ebp),%edx
  281389:	89 d0                	mov    %edx,%eax
  28138b:	01 c0                	add    %eax,%eax
  28138d:	01 d0                	add    %edx,%eax
  28138f:	01 c0                	add    %eax,%eax
  281391:	89 c2                	mov    %eax,%edx
  281393:	8b 45 f4             	mov    -0xc(%ebp),%eax
  281396:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  281399:	8b 55 ec             	mov    -0x14(%ebp),%edx
  28139c:	89 d0                	mov    %edx,%eax
  28139e:	c1 e0 03             	shl    $0x3,%eax
  2813a1:	01 d0                	add    %edx,%eax
  2813a3:	c1 e0 02             	shl    $0x2,%eax
  2813a6:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  2813a9:	89 d0                	mov    %edx,%eax
  2813ab:	01 c0                	add    %eax,%eax
  2813ad:	01 d0                	add    %edx,%eax
  2813af:	8d 50 01             	lea    0x1(%eax),%edx
  2813b2:	b9 33 00 00 00       	mov    $0x33,%ecx
  2813b7:	89 d8                	mov    %ebx,%eax
  2813b9:	0f af c1             	imul   %ecx,%eax
  2813bc:	88 84 15 64 fd ff ff 	mov    %al,-0x29c(%ebp,%edx,1)
				table2[(r + g * 6 + b * 36) * 3 + 2] = b * 51;
  2813c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2813c6:	89 c3                	mov    %eax,%ebx
  2813c8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2813cb:	89 d0                	mov    %edx,%eax
  2813cd:	01 c0                	add    %eax,%eax
  2813cf:	01 d0                	add    %edx,%eax
  2813d1:	01 c0                	add    %eax,%eax
  2813d3:	89 c2                	mov    %eax,%edx
  2813d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2813d8:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  2813db:	8b 55 ec             	mov    -0x14(%ebp),%edx
  2813de:	89 d0                	mov    %edx,%eax
  2813e0:	c1 e0 03             	shl    $0x3,%eax
  2813e3:	01 d0                	add    %edx,%eax
  2813e5:	c1 e0 02             	shl    $0x2,%eax
  2813e8:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  2813eb:	89 d0                	mov    %edx,%eax
  2813ed:	01 c0                	add    %eax,%eax
  2813ef:	01 d0                	add    %edx,%eax
  2813f1:	8d 50 02             	lea    0x2(%eax),%edx
  2813f4:	b9 33 00 00 00       	mov    $0x33,%ecx
  2813f9:	89 d8                	mov    %ebx,%eax
  2813fb:	0f af c1             	imul   %ecx,%eax
  2813fe:	88 84 15 64 fd ff ff 	mov    %al,-0x29c(%ebp,%edx,1)
			for (r = 0; r < 6; r++) {
  281405:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  281409:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
  28140d:	0f 8e 2f ff ff ff    	jle    281342 <init_palette+0x46>
		for (g = 0; g < 6; g++) {
  281413:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  281417:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
  28141b:	0f 8e 15 ff ff ff    	jle    281336 <init_palette+0x3a>
	for (b = 0; b < 6; b++) {
  281421:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  281425:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
  281429:	0f 8e fb fe ff ff    	jle    28132a <init_palette+0x2e>
			}
		}
	}
	set_palette(16, 231, table2);
  28142f:	83 ec 04             	sub    $0x4,%esp
  281432:	8d 85 64 fd ff ff    	lea    -0x29c(%ebp),%eax
  281438:	50                   	push   %eax
  281439:	68 e7 00 00 00       	push   $0xe7
  28143e:	6a 10                	push   $0x10
  281440:	e8 09 00 00 00       	call   28144e <set_palette>
  281445:	83 c4 10             	add    $0x10,%esp
	return;
  281448:	90                   	nop
}
  281449:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  28144c:	c9                   	leave  
  28144d:	c3                   	ret    

0028144e <set_palette>:

void set_palette(int start, int end, unsigned char *rgb)
{
  28144e:	f3 0f 1e fb          	endbr32 
  281452:	55                   	push   %ebp
  281453:	89 e5                	mov    %esp,%ebp
  281455:	83 ec 18             	sub    $0x18,%esp
	int i, eflags;
	eflags = io_load_eflags();	/* äÑÇËçûÇ›ãñâ¬ÉtÉâÉOÇÃílÇãLò^Ç∑ÇÈ */
  281458:	e8 38 fd ff ff       	call   281195 <io_load_eflags>
  28145d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	io_cli(); 					/* ãñâ¬ÉtÉâÉOÇ0Ç…ÇµÇƒäÑÇËçûÇ›ã÷é~Ç…Ç∑ÇÈ */
  281460:	e8 ed fc ff ff       	call   281152 <io_cli>
	io_out8(0x03c8, start);
  281465:	83 ec 08             	sub    $0x8,%esp
  281468:	ff 75 08             	pushl  0x8(%ebp)
  28146b:	68 c8 03 00 00       	push   $0x3c8
  281470:	e8 01 fd ff ff       	call   281176 <io_out8>
  281475:	83 c4 10             	add    $0x10,%esp
	for (i = start; i <= end; i++) {
  281478:	8b 45 08             	mov    0x8(%ebp),%eax
  28147b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  28147e:	eb 65                	jmp    2814e5 <set_palette+0x97>
		io_out8(0x03c9, rgb[0] / 4);
  281480:	8b 45 10             	mov    0x10(%ebp),%eax
  281483:	0f b6 00             	movzbl (%eax),%eax
  281486:	c0 e8 02             	shr    $0x2,%al
  281489:	0f b6 c0             	movzbl %al,%eax
  28148c:	83 ec 08             	sub    $0x8,%esp
  28148f:	50                   	push   %eax
  281490:	68 c9 03 00 00       	push   $0x3c9
  281495:	e8 dc fc ff ff       	call   281176 <io_out8>
  28149a:	83 c4 10             	add    $0x10,%esp
		io_out8(0x03c9, rgb[1] / 4);
  28149d:	8b 45 10             	mov    0x10(%ebp),%eax
  2814a0:	83 c0 01             	add    $0x1,%eax
  2814a3:	0f b6 00             	movzbl (%eax),%eax
  2814a6:	c0 e8 02             	shr    $0x2,%al
  2814a9:	0f b6 c0             	movzbl %al,%eax
  2814ac:	83 ec 08             	sub    $0x8,%esp
  2814af:	50                   	push   %eax
  2814b0:	68 c9 03 00 00       	push   $0x3c9
  2814b5:	e8 bc fc ff ff       	call   281176 <io_out8>
  2814ba:	83 c4 10             	add    $0x10,%esp
		io_out8(0x03c9, rgb[2] / 4);
  2814bd:	8b 45 10             	mov    0x10(%ebp),%eax
  2814c0:	83 c0 02             	add    $0x2,%eax
  2814c3:	0f b6 00             	movzbl (%eax),%eax
  2814c6:	c0 e8 02             	shr    $0x2,%al
  2814c9:	0f b6 c0             	movzbl %al,%eax
  2814cc:	83 ec 08             	sub    $0x8,%esp
  2814cf:	50                   	push   %eax
  2814d0:	68 c9 03 00 00       	push   $0x3c9
  2814d5:	e8 9c fc ff ff       	call   281176 <io_out8>
  2814da:	83 c4 10             	add    $0x10,%esp
		rgb += 3;
  2814dd:	83 45 10 03          	addl   $0x3,0x10(%ebp)
	for (i = start; i <= end; i++) {
  2814e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2814e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2814e8:	3b 45 0c             	cmp    0xc(%ebp),%eax
  2814eb:	7e 93                	jle    281480 <set_palette+0x32>
	}
	io_store_eflags(eflags);	/* äÑÇËçûÇ›ãñâ¬ÉtÉâÉOÇå≥Ç…ñﬂÇ∑ */
  2814ed:	83 ec 0c             	sub    $0xc,%esp
  2814f0:	ff 75 f0             	pushl  -0x10(%ebp)
  2814f3:	e8 a0 fc ff ff       	call   281198 <io_store_eflags>
  2814f8:	83 c4 10             	add    $0x10,%esp
	return;
  2814fb:	90                   	nop
}
  2814fc:	c9                   	leave  
  2814fd:	c3                   	ret    

002814fe <boxfill8>:

void boxfill8(unsigned char *vram, int xsize, unsigned char c, int x0, int y0, int x1, int y1)
{
  2814fe:	f3 0f 1e fb          	endbr32 
  281502:	55                   	push   %ebp
  281503:	89 e5                	mov    %esp,%ebp
  281505:	83 ec 14             	sub    $0x14,%esp
  281508:	8b 45 10             	mov    0x10(%ebp),%eax
  28150b:	88 45 ec             	mov    %al,-0x14(%ebp)
	int x, y;
	for (y = y0; y <= y1; y++) {
  28150e:	8b 45 18             	mov    0x18(%ebp),%eax
  281511:	89 45 f8             	mov    %eax,-0x8(%ebp)
  281514:	eb 33                	jmp    281549 <boxfill8+0x4b>
		for (x = x0; x <= x1; x++)
  281516:	8b 45 14             	mov    0x14(%ebp),%eax
  281519:	89 45 fc             	mov    %eax,-0x4(%ebp)
  28151c:	eb 1f                	jmp    28153d <boxfill8+0x3f>
			vram[y * xsize + x] = c;
  28151e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281521:	0f af 45 0c          	imul   0xc(%ebp),%eax
  281525:	89 c2                	mov    %eax,%edx
  281527:	8b 45 fc             	mov    -0x4(%ebp),%eax
  28152a:	01 d0                	add    %edx,%eax
  28152c:	89 c2                	mov    %eax,%edx
  28152e:	8b 45 08             	mov    0x8(%ebp),%eax
  281531:	01 c2                	add    %eax,%edx
  281533:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  281537:	88 02                	mov    %al,(%edx)
		for (x = x0; x <= x1; x++)
  281539:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  28153d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  281540:	3b 45 1c             	cmp    0x1c(%ebp),%eax
  281543:	7e d9                	jle    28151e <boxfill8+0x20>
	for (y = y0; y <= y1; y++) {
  281545:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  281549:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28154c:	3b 45 20             	cmp    0x20(%ebp),%eax
  28154f:	7e c5                	jle    281516 <boxfill8+0x18>
	}
	return;
  281551:	90                   	nop
}
  281552:	c9                   	leave  
  281553:	c3                   	ret    

00281554 <init_screen8>:

void init_screen8(char *vram, int x, int y)
{
  281554:	f3 0f 1e fb          	endbr32 
  281558:	55                   	push   %ebp
  281559:	89 e5                	mov    %esp,%ebp
  28155b:	53                   	push   %ebx
	boxfill8(vram, x, COL8_008484,  0,     0,      x -  1, y - 29);
  28155c:	8b 45 10             	mov    0x10(%ebp),%eax
  28155f:	8d 50 e3             	lea    -0x1d(%eax),%edx
  281562:	8b 45 0c             	mov    0xc(%ebp),%eax
  281565:	83 e8 01             	sub    $0x1,%eax
  281568:	52                   	push   %edx
  281569:	50                   	push   %eax
  28156a:	6a 00                	push   $0x0
  28156c:	6a 00                	push   $0x0
  28156e:	6a 0e                	push   $0xe
  281570:	ff 75 0c             	pushl  0xc(%ebp)
  281573:	ff 75 08             	pushl  0x8(%ebp)
  281576:	e8 83 ff ff ff       	call   2814fe <boxfill8>
  28157b:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_C6C6C6,  0,     y - 28, x -  1, y - 28);
  28157e:	8b 45 10             	mov    0x10(%ebp),%eax
  281581:	8d 48 e4             	lea    -0x1c(%eax),%ecx
  281584:	8b 45 0c             	mov    0xc(%ebp),%eax
  281587:	8d 50 ff             	lea    -0x1(%eax),%edx
  28158a:	8b 45 10             	mov    0x10(%ebp),%eax
  28158d:	83 e8 1c             	sub    $0x1c,%eax
  281590:	51                   	push   %ecx
  281591:	52                   	push   %edx
  281592:	50                   	push   %eax
  281593:	6a 00                	push   $0x0
  281595:	6a 08                	push   $0x8
  281597:	ff 75 0c             	pushl  0xc(%ebp)
  28159a:	ff 75 08             	pushl  0x8(%ebp)
  28159d:	e8 5c ff ff ff       	call   2814fe <boxfill8>
  2815a2:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_FFFFFF,  0,     y - 27, x -  1, y - 27);
  2815a5:	8b 45 10             	mov    0x10(%ebp),%eax
  2815a8:	8d 48 e5             	lea    -0x1b(%eax),%ecx
  2815ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  2815ae:	8d 50 ff             	lea    -0x1(%eax),%edx
  2815b1:	8b 45 10             	mov    0x10(%ebp),%eax
  2815b4:	83 e8 1b             	sub    $0x1b,%eax
  2815b7:	51                   	push   %ecx
  2815b8:	52                   	push   %edx
  2815b9:	50                   	push   %eax
  2815ba:	6a 00                	push   $0x0
  2815bc:	6a 07                	push   $0x7
  2815be:	ff 75 0c             	pushl  0xc(%ebp)
  2815c1:	ff 75 08             	pushl  0x8(%ebp)
  2815c4:	e8 35 ff ff ff       	call   2814fe <boxfill8>
  2815c9:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_C6C6C6,  0,     y - 26, x -  1, y -  1);
  2815cc:	8b 45 10             	mov    0x10(%ebp),%eax
  2815cf:	8d 48 ff             	lea    -0x1(%eax),%ecx
  2815d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  2815d5:	8d 50 ff             	lea    -0x1(%eax),%edx
  2815d8:	8b 45 10             	mov    0x10(%ebp),%eax
  2815db:	83 e8 1a             	sub    $0x1a,%eax
  2815de:	51                   	push   %ecx
  2815df:	52                   	push   %edx
  2815e0:	50                   	push   %eax
  2815e1:	6a 00                	push   $0x0
  2815e3:	6a 08                	push   $0x8
  2815e5:	ff 75 0c             	pushl  0xc(%ebp)
  2815e8:	ff 75 08             	pushl  0x8(%ebp)
  2815eb:	e8 0e ff ff ff       	call   2814fe <boxfill8>
  2815f0:	83 c4 1c             	add    $0x1c,%esp

	boxfill8(vram, x, COL8_FFFFFF,  3,     y - 24, 59,     y - 24);
  2815f3:	8b 45 10             	mov    0x10(%ebp),%eax
  2815f6:	8d 50 e8             	lea    -0x18(%eax),%edx
  2815f9:	8b 45 10             	mov    0x10(%ebp),%eax
  2815fc:	83 e8 18             	sub    $0x18,%eax
  2815ff:	52                   	push   %edx
  281600:	6a 3b                	push   $0x3b
  281602:	50                   	push   %eax
  281603:	6a 03                	push   $0x3
  281605:	6a 07                	push   $0x7
  281607:	ff 75 0c             	pushl  0xc(%ebp)
  28160a:	ff 75 08             	pushl  0x8(%ebp)
  28160d:	e8 ec fe ff ff       	call   2814fe <boxfill8>
  281612:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_FFFFFF,  2,     y - 24,  2,     y -  4);
  281615:	8b 45 10             	mov    0x10(%ebp),%eax
  281618:	8d 50 fc             	lea    -0x4(%eax),%edx
  28161b:	8b 45 10             	mov    0x10(%ebp),%eax
  28161e:	83 e8 18             	sub    $0x18,%eax
  281621:	52                   	push   %edx
  281622:	6a 02                	push   $0x2
  281624:	50                   	push   %eax
  281625:	6a 02                	push   $0x2
  281627:	6a 07                	push   $0x7
  281629:	ff 75 0c             	pushl  0xc(%ebp)
  28162c:	ff 75 08             	pushl  0x8(%ebp)
  28162f:	e8 ca fe ff ff       	call   2814fe <boxfill8>
  281634:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_848484,  3,     y -  4, 59,     y -  4);
  281637:	8b 45 10             	mov    0x10(%ebp),%eax
  28163a:	8d 50 fc             	lea    -0x4(%eax),%edx
  28163d:	8b 45 10             	mov    0x10(%ebp),%eax
  281640:	83 e8 04             	sub    $0x4,%eax
  281643:	52                   	push   %edx
  281644:	6a 3b                	push   $0x3b
  281646:	50                   	push   %eax
  281647:	6a 03                	push   $0x3
  281649:	6a 0f                	push   $0xf
  28164b:	ff 75 0c             	pushl  0xc(%ebp)
  28164e:	ff 75 08             	pushl  0x8(%ebp)
  281651:	e8 a8 fe ff ff       	call   2814fe <boxfill8>
  281656:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_848484, 59,     y - 23, 59,     y -  5);
  281659:	8b 45 10             	mov    0x10(%ebp),%eax
  28165c:	8d 50 fb             	lea    -0x5(%eax),%edx
  28165f:	8b 45 10             	mov    0x10(%ebp),%eax
  281662:	83 e8 17             	sub    $0x17,%eax
  281665:	52                   	push   %edx
  281666:	6a 3b                	push   $0x3b
  281668:	50                   	push   %eax
  281669:	6a 3b                	push   $0x3b
  28166b:	6a 0f                	push   $0xf
  28166d:	ff 75 0c             	pushl  0xc(%ebp)
  281670:	ff 75 08             	pushl  0x8(%ebp)
  281673:	e8 86 fe ff ff       	call   2814fe <boxfill8>
  281678:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_000000,  2,     y -  3, 59,     y -  3);
  28167b:	8b 45 10             	mov    0x10(%ebp),%eax
  28167e:	8d 50 fd             	lea    -0x3(%eax),%edx
  281681:	8b 45 10             	mov    0x10(%ebp),%eax
  281684:	83 e8 03             	sub    $0x3,%eax
  281687:	52                   	push   %edx
  281688:	6a 3b                	push   $0x3b
  28168a:	50                   	push   %eax
  28168b:	6a 02                	push   $0x2
  28168d:	6a 00                	push   $0x0
  28168f:	ff 75 0c             	pushl  0xc(%ebp)
  281692:	ff 75 08             	pushl  0x8(%ebp)
  281695:	e8 64 fe ff ff       	call   2814fe <boxfill8>
  28169a:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_000000, 60,     y - 24, 60,     y -  3);
  28169d:	8b 45 10             	mov    0x10(%ebp),%eax
  2816a0:	8d 50 fd             	lea    -0x3(%eax),%edx
  2816a3:	8b 45 10             	mov    0x10(%ebp),%eax
  2816a6:	83 e8 18             	sub    $0x18,%eax
  2816a9:	52                   	push   %edx
  2816aa:	6a 3c                	push   $0x3c
  2816ac:	50                   	push   %eax
  2816ad:	6a 3c                	push   $0x3c
  2816af:	6a 00                	push   $0x0
  2816b1:	ff 75 0c             	pushl  0xc(%ebp)
  2816b4:	ff 75 08             	pushl  0x8(%ebp)
  2816b7:	e8 42 fe ff ff       	call   2814fe <boxfill8>
  2816bc:	83 c4 1c             	add    $0x1c,%esp

	boxfill8(vram, x, COL8_848484, x - 47, y - 24, x -  4, y - 24);
  2816bf:	8b 45 10             	mov    0x10(%ebp),%eax
  2816c2:	8d 58 e8             	lea    -0x18(%eax),%ebx
  2816c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  2816c8:	8d 48 fc             	lea    -0x4(%eax),%ecx
  2816cb:	8b 45 10             	mov    0x10(%ebp),%eax
  2816ce:	8d 50 e8             	lea    -0x18(%eax),%edx
  2816d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  2816d4:	83 e8 2f             	sub    $0x2f,%eax
  2816d7:	53                   	push   %ebx
  2816d8:	51                   	push   %ecx
  2816d9:	52                   	push   %edx
  2816da:	50                   	push   %eax
  2816db:	6a 0f                	push   $0xf
  2816dd:	ff 75 0c             	pushl  0xc(%ebp)
  2816e0:	ff 75 08             	pushl  0x8(%ebp)
  2816e3:	e8 16 fe ff ff       	call   2814fe <boxfill8>
  2816e8:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_848484, x - 47, y - 23, x - 47, y -  4);
  2816eb:	8b 45 10             	mov    0x10(%ebp),%eax
  2816ee:	8d 58 fc             	lea    -0x4(%eax),%ebx
  2816f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  2816f4:	8d 48 d1             	lea    -0x2f(%eax),%ecx
  2816f7:	8b 45 10             	mov    0x10(%ebp),%eax
  2816fa:	8d 50 e9             	lea    -0x17(%eax),%edx
  2816fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  281700:	83 e8 2f             	sub    $0x2f,%eax
  281703:	53                   	push   %ebx
  281704:	51                   	push   %ecx
  281705:	52                   	push   %edx
  281706:	50                   	push   %eax
  281707:	6a 0f                	push   $0xf
  281709:	ff 75 0c             	pushl  0xc(%ebp)
  28170c:	ff 75 08             	pushl  0x8(%ebp)
  28170f:	e8 ea fd ff ff       	call   2814fe <boxfill8>
  281714:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_FFFFFF, x - 47, y -  3, x -  4, y -  3);
  281717:	8b 45 10             	mov    0x10(%ebp),%eax
  28171a:	8d 58 fd             	lea    -0x3(%eax),%ebx
  28171d:	8b 45 0c             	mov    0xc(%ebp),%eax
  281720:	8d 48 fc             	lea    -0x4(%eax),%ecx
  281723:	8b 45 10             	mov    0x10(%ebp),%eax
  281726:	8d 50 fd             	lea    -0x3(%eax),%edx
  281729:	8b 45 0c             	mov    0xc(%ebp),%eax
  28172c:	83 e8 2f             	sub    $0x2f,%eax
  28172f:	53                   	push   %ebx
  281730:	51                   	push   %ecx
  281731:	52                   	push   %edx
  281732:	50                   	push   %eax
  281733:	6a 07                	push   $0x7
  281735:	ff 75 0c             	pushl  0xc(%ebp)
  281738:	ff 75 08             	pushl  0x8(%ebp)
  28173b:	e8 be fd ff ff       	call   2814fe <boxfill8>
  281740:	83 c4 1c             	add    $0x1c,%esp
	boxfill8(vram, x, COL8_FFFFFF, x -  3, y - 24, x -  3, y -  3);
  281743:	8b 45 10             	mov    0x10(%ebp),%eax
  281746:	8d 58 fd             	lea    -0x3(%eax),%ebx
  281749:	8b 45 0c             	mov    0xc(%ebp),%eax
  28174c:	8d 48 fd             	lea    -0x3(%eax),%ecx
  28174f:	8b 45 10             	mov    0x10(%ebp),%eax
  281752:	8d 50 e8             	lea    -0x18(%eax),%edx
  281755:	8b 45 0c             	mov    0xc(%ebp),%eax
  281758:	83 e8 03             	sub    $0x3,%eax
  28175b:	53                   	push   %ebx
  28175c:	51                   	push   %ecx
  28175d:	52                   	push   %edx
  28175e:	50                   	push   %eax
  28175f:	6a 07                	push   $0x7
  281761:	ff 75 0c             	pushl  0xc(%ebp)
  281764:	ff 75 08             	pushl  0x8(%ebp)
  281767:	e8 92 fd ff ff       	call   2814fe <boxfill8>
  28176c:	83 c4 1c             	add    $0x1c,%esp
	return;
  28176f:	90                   	nop
}
  281770:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  281773:	c9                   	leave  
  281774:	c3                   	ret    

00281775 <putfont8>:

void putfont8(char *vram, int xsize, int x, int y, char c, char *font)
{
  281775:	f3 0f 1e fb          	endbr32 
  281779:	55                   	push   %ebp
  28177a:	89 e5                	mov    %esp,%ebp
  28177c:	83 ec 14             	sub    $0x14,%esp
  28177f:	8b 45 18             	mov    0x18(%ebp),%eax
  281782:	88 45 ec             	mov    %al,-0x14(%ebp)
	int i;
	char *p, d /* data */;
	for (i = 0; i < 16; i++) {
  281785:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  28178c:	e9 dd 00 00 00       	jmp    28186e <putfont8+0xf9>
		p = vram + (y + i) * xsize + x;
  281791:	8b 55 14             	mov    0x14(%ebp),%edx
  281794:	8b 45 fc             	mov    -0x4(%ebp),%eax
  281797:	01 d0                	add    %edx,%eax
  281799:	0f af 45 0c          	imul   0xc(%ebp),%eax
  28179d:	89 c2                	mov    %eax,%edx
  28179f:	8b 45 10             	mov    0x10(%ebp),%eax
  2817a2:	01 c2                	add    %eax,%edx
  2817a4:	8b 45 08             	mov    0x8(%ebp),%eax
  2817a7:	01 d0                	add    %edx,%eax
  2817a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
		d = font[i];
  2817ac:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2817af:	8b 45 1c             	mov    0x1c(%ebp),%eax
  2817b2:	01 d0                	add    %edx,%eax
  2817b4:	0f b6 00             	movzbl (%eax),%eax
  2817b7:	88 45 f7             	mov    %al,-0x9(%ebp)
		if ((d & 0x80) != 0) { p[0] = c; }
  2817ba:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  2817be:	79 09                	jns    2817c9 <putfont8+0x54>
  2817c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2817c3:	0f b6 55 ec          	movzbl -0x14(%ebp),%edx
  2817c7:	88 10                	mov    %dl,(%eax)
		if ((d & 0x40) != 0) { p[1] = c; }
  2817c9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  2817cd:	83 e0 40             	and    $0x40,%eax
  2817d0:	85 c0                	test   %eax,%eax
  2817d2:	74 0c                	je     2817e0 <putfont8+0x6b>
  2817d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2817d7:	8d 50 01             	lea    0x1(%eax),%edx
  2817da:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  2817de:	88 02                	mov    %al,(%edx)
		if ((d & 0x20) != 0) { p[2] = c; }
  2817e0:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  2817e4:	83 e0 20             	and    $0x20,%eax
  2817e7:	85 c0                	test   %eax,%eax
  2817e9:	74 0c                	je     2817f7 <putfont8+0x82>
  2817eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2817ee:	8d 50 02             	lea    0x2(%eax),%edx
  2817f1:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  2817f5:	88 02                	mov    %al,(%edx)
		if ((d & 0x10) != 0) { p[3] = c; }
  2817f7:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  2817fb:	83 e0 10             	and    $0x10,%eax
  2817fe:	85 c0                	test   %eax,%eax
  281800:	74 0c                	je     28180e <putfont8+0x99>
  281802:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281805:	8d 50 03             	lea    0x3(%eax),%edx
  281808:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  28180c:	88 02                	mov    %al,(%edx)
		if ((d & 0x08) != 0) { p[4] = c; }
  28180e:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  281812:	83 e0 08             	and    $0x8,%eax
  281815:	85 c0                	test   %eax,%eax
  281817:	74 0c                	je     281825 <putfont8+0xb0>
  281819:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28181c:	8d 50 04             	lea    0x4(%eax),%edx
  28181f:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  281823:	88 02                	mov    %al,(%edx)
		if ((d & 0x04) != 0) { p[5] = c; }
  281825:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  281829:	83 e0 04             	and    $0x4,%eax
  28182c:	85 c0                	test   %eax,%eax
  28182e:	74 0c                	je     28183c <putfont8+0xc7>
  281830:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281833:	8d 50 05             	lea    0x5(%eax),%edx
  281836:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  28183a:	88 02                	mov    %al,(%edx)
		if ((d & 0x02) != 0) { p[6] = c; }
  28183c:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  281840:	83 e0 02             	and    $0x2,%eax
  281843:	85 c0                	test   %eax,%eax
  281845:	74 0c                	je     281853 <putfont8+0xde>
  281847:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28184a:	8d 50 06             	lea    0x6(%eax),%edx
  28184d:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  281851:	88 02                	mov    %al,(%edx)
		if ((d & 0x01) != 0) { p[7] = c; }
  281853:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  281857:	83 e0 01             	and    $0x1,%eax
  28185a:	85 c0                	test   %eax,%eax
  28185c:	74 0c                	je     28186a <putfont8+0xf5>
  28185e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281861:	8d 50 07             	lea    0x7(%eax),%edx
  281864:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  281868:	88 02                	mov    %al,(%edx)
	for (i = 0; i < 16; i++) {
  28186a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  28186e:	83 7d fc 0f          	cmpl   $0xf,-0x4(%ebp)
  281872:	0f 8e 19 ff ff ff    	jle    281791 <putfont8+0x1c>
	}
	return;
  281878:	90                   	nop
}
  281879:	c9                   	leave  
  28187a:	c3                   	ret    

0028187b <putfonts8_asc>:

void putfonts8_asc(char *vram, int xsize, int x, int y, char c, unsigned char *s)
{
  28187b:	f3 0f 1e fb          	endbr32 
  28187f:	55                   	push   %ebp
  281880:	89 e5                	mov    %esp,%ebp
  281882:	83 ec 38             	sub    $0x38,%esp
  281885:	8b 45 18             	mov    0x18(%ebp),%eax
  281888:	88 45 d4             	mov    %al,-0x2c(%ebp)
	extern char hankaku[4096];
	struct TASK *task = task_now();
  28188b:	e8 17 24 00 00       	call   283ca7 <task_now>
  281890:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *nihongo = (char *) *((int *) 0x0fe8), *font;
  281893:	b8 e8 0f 00 00       	mov    $0xfe8,%eax
  281898:	8b 00                	mov    (%eax),%eax
  28189a:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int k, t;

	if (task->langmode == 0) {
  28189d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2818a0:	0f b6 80 bc 00 00 00 	movzbl 0xbc(%eax),%eax
  2818a7:	84 c0                	test   %al,%al
  2818a9:	75 43                	jne    2818ee <putfonts8_asc+0x73>
		for (; *s != 0x00; s++) {
  2818ab:	eb 37                	jmp    2818e4 <putfonts8_asc+0x69>
			putfont8(vram, xsize, x, y, c, hankaku + *s * 16);
  2818ad:	8b 45 1c             	mov    0x1c(%ebp),%eax
  2818b0:	0f b6 00             	movzbl (%eax),%eax
  2818b3:	0f b6 c0             	movzbl %al,%eax
  2818b6:	c1 e0 04             	shl    $0x4,%eax
  2818b9:	8d 90 00 00 31 00    	lea    0x310000(%eax),%edx
  2818bf:	0f be 45 d4          	movsbl -0x2c(%ebp),%eax
  2818c3:	83 ec 08             	sub    $0x8,%esp
  2818c6:	52                   	push   %edx
  2818c7:	50                   	push   %eax
  2818c8:	ff 75 14             	pushl  0x14(%ebp)
  2818cb:	ff 75 10             	pushl  0x10(%ebp)
  2818ce:	ff 75 0c             	pushl  0xc(%ebp)
  2818d1:	ff 75 08             	pushl  0x8(%ebp)
  2818d4:	e8 9c fe ff ff       	call   281775 <putfont8>
  2818d9:	83 c4 20             	add    $0x20,%esp
			x += 8;
  2818dc:	83 45 10 08          	addl   $0x8,0x10(%ebp)
		for (; *s != 0x00; s++) {
  2818e0:	83 45 1c 01          	addl   $0x1,0x1c(%ebp)
  2818e4:	8b 45 1c             	mov    0x1c(%ebp),%eax
  2818e7:	0f b6 00             	movzbl (%eax),%eax
  2818ea:	84 c0                	test   %al,%al
  2818ec:	75 bf                	jne    2818ad <putfonts8_asc+0x32>
		}
	}
	if (task->langmode == 1) {
  2818ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2818f1:	0f b6 80 bc 00 00 00 	movzbl 0xbc(%eax),%eax
  2818f8:	3c 01                	cmp    $0x1,%al
  2818fa:	0f 85 b1 01 00 00    	jne    281ab1 <putfonts8_asc+0x236>
		for (; *s != 0x00; s++) {
  281900:	e9 9e 01 00 00       	jmp    281aa3 <putfonts8_asc+0x228>
			if (task->langbyte1 == 0) {
  281905:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281908:	0f b6 80 bd 00 00 00 	movzbl 0xbd(%eax),%eax
  28190f:	84 c0                	test   %al,%al
  281911:	75 71                	jne    281984 <putfonts8_asc+0x109>
				if ((0x81 <= *s && *s <= 0x9f) || (0xe0 <= *s && *s <= 0xfc)) {
  281913:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281916:	0f b6 00             	movzbl (%eax),%eax
  281919:	3c 80                	cmp    $0x80,%al
  28191b:	76 0a                	jbe    281927 <putfonts8_asc+0xac>
  28191d:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281920:	0f b6 00             	movzbl (%eax),%eax
  281923:	3c 9f                	cmp    $0x9f,%al
  281925:	76 14                	jbe    28193b <putfonts8_asc+0xc0>
  281927:	8b 45 1c             	mov    0x1c(%ebp),%eax
  28192a:	0f b6 00             	movzbl (%eax),%eax
  28192d:	3c df                	cmp    $0xdf,%al
  28192f:	76 1e                	jbe    28194f <putfonts8_asc+0xd4>
  281931:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281934:	0f b6 00             	movzbl (%eax),%eax
  281937:	3c fc                	cmp    $0xfc,%al
  281939:	77 14                	ja     28194f <putfonts8_asc+0xd4>
					task->langbyte1 = *s;
  28193b:	8b 45 1c             	mov    0x1c(%ebp),%eax
  28193e:	0f b6 10             	movzbl (%eax),%edx
  281941:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281944:	88 90 bd 00 00 00    	mov    %dl,0xbd(%eax)
  28194a:	e9 4c 01 00 00       	jmp    281a9b <putfonts8_asc+0x220>
				} else {
					putfont8(vram, xsize, x, y, c, nihongo + *s * 16);
  28194f:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281952:	0f b6 00             	movzbl (%eax),%eax
  281955:	0f b6 c0             	movzbl %al,%eax
  281958:	c1 e0 04             	shl    $0x4,%eax
  28195b:	89 c2                	mov    %eax,%edx
  28195d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  281960:	01 c2                	add    %eax,%edx
  281962:	0f be 45 d4          	movsbl -0x2c(%ebp),%eax
  281966:	83 ec 08             	sub    $0x8,%esp
  281969:	52                   	push   %edx
  28196a:	50                   	push   %eax
  28196b:	ff 75 14             	pushl  0x14(%ebp)
  28196e:	ff 75 10             	pushl  0x10(%ebp)
  281971:	ff 75 0c             	pushl  0xc(%ebp)
  281974:	ff 75 08             	pushl  0x8(%ebp)
  281977:	e8 f9 fd ff ff       	call   281775 <putfont8>
  28197c:	83 c4 20             	add    $0x20,%esp
  28197f:	e9 17 01 00 00       	jmp    281a9b <putfonts8_asc+0x220>
				}
			} else {
				if (0x81 <= task->langbyte1 && task->langbyte1 <= 0x9f) {
  281984:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281987:	0f b6 80 bd 00 00 00 	movzbl 0xbd(%eax),%eax
  28198e:	3c 80                	cmp    $0x80,%al
  281990:	76 27                	jbe    2819b9 <putfonts8_asc+0x13e>
  281992:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281995:	0f b6 80 bd 00 00 00 	movzbl 0xbd(%eax),%eax
  28199c:	3c 9f                	cmp    $0x9f,%al
  28199e:	77 19                	ja     2819b9 <putfonts8_asc+0x13e>
					k = (task->langbyte1 - 0x81) * 2;
  2819a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2819a3:	0f b6 80 bd 00 00 00 	movzbl 0xbd(%eax),%eax
  2819aa:	0f b6 c0             	movzbl %al,%eax
  2819ad:	2d 81 00 00 00       	sub    $0x81,%eax
  2819b2:	01 c0                	add    %eax,%eax
  2819b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2819b7:	eb 17                	jmp    2819d0 <putfonts8_asc+0x155>
				} else {
					k = (task->langbyte1 - 0xe0) * 2 + 62;
  2819b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2819bc:	0f b6 80 bd 00 00 00 	movzbl 0xbd(%eax),%eax
  2819c3:	0f b6 c0             	movzbl %al,%eax
  2819c6:	2d c1 00 00 00       	sub    $0xc1,%eax
  2819cb:	01 c0                	add    %eax,%eax
  2819cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
				}
				if (0x40 <= *s && *s <= 0x7e) {
  2819d0:	8b 45 1c             	mov    0x1c(%ebp),%eax
  2819d3:	0f b6 00             	movzbl (%eax),%eax
  2819d6:	3c 3f                	cmp    $0x3f,%al
  2819d8:	76 1b                	jbe    2819f5 <putfonts8_asc+0x17a>
  2819da:	8b 45 1c             	mov    0x1c(%ebp),%eax
  2819dd:	0f b6 00             	movzbl (%eax),%eax
  2819e0:	3c 7e                	cmp    $0x7e,%al
  2819e2:	77 11                	ja     2819f5 <putfonts8_asc+0x17a>
					t = *s - 0x40;
  2819e4:	8b 45 1c             	mov    0x1c(%ebp),%eax
  2819e7:	0f b6 00             	movzbl (%eax),%eax
  2819ea:	0f b6 c0             	movzbl %al,%eax
  2819ed:	83 e8 40             	sub    $0x40,%eax
  2819f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2819f3:	eb 3a                	jmp    281a2f <putfonts8_asc+0x1b4>
				} else if (0x80 <= *s && *s <= 0x9e) {
  2819f5:	8b 45 1c             	mov    0x1c(%ebp),%eax
  2819f8:	0f b6 00             	movzbl (%eax),%eax
  2819fb:	84 c0                	test   %al,%al
  2819fd:	79 1b                	jns    281a1a <putfonts8_asc+0x19f>
  2819ff:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281a02:	0f b6 00             	movzbl (%eax),%eax
  281a05:	3c 9e                	cmp    $0x9e,%al
  281a07:	77 11                	ja     281a1a <putfonts8_asc+0x19f>
					t = *s - 0x80 + 63;
  281a09:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281a0c:	0f b6 00             	movzbl (%eax),%eax
  281a0f:	0f b6 c0             	movzbl %al,%eax
  281a12:	83 e8 41             	sub    $0x41,%eax
  281a15:	89 45 f0             	mov    %eax,-0x10(%ebp)
  281a18:	eb 15                	jmp    281a2f <putfonts8_asc+0x1b4>
				} else {
					t = *s - 0x9f;
  281a1a:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281a1d:	0f b6 00             	movzbl (%eax),%eax
  281a20:	0f b6 c0             	movzbl %al,%eax
  281a23:	2d 9f 00 00 00       	sub    $0x9f,%eax
  281a28:	89 45 f0             	mov    %eax,-0x10(%ebp)
					k++;
  281a2b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
				}
				task->langbyte1 = 0;
  281a2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281a32:	c6 80 bd 00 00 00 00 	movb   $0x0,0xbd(%eax)
				font = nihongo + 256 * 16 + (k * 94 + t) * 32;
  281a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  281a3c:	6b d0 5e             	imul   $0x5e,%eax,%edx
  281a3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  281a42:	01 d0                	add    %edx,%eax
  281a44:	c1 e0 05             	shl    $0x5,%eax
  281a47:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  281a4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  281a50:	01 d0                	add    %edx,%eax
  281a52:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				putfont8(vram, xsize, x - 8, y, c, font     );	/* ç∂îºï™ */
  281a55:	0f be 45 d4          	movsbl -0x2c(%ebp),%eax
  281a59:	8b 55 10             	mov    0x10(%ebp),%edx
  281a5c:	83 ea 08             	sub    $0x8,%edx
  281a5f:	83 ec 08             	sub    $0x8,%esp
  281a62:	ff 75 e4             	pushl  -0x1c(%ebp)
  281a65:	50                   	push   %eax
  281a66:	ff 75 14             	pushl  0x14(%ebp)
  281a69:	52                   	push   %edx
  281a6a:	ff 75 0c             	pushl  0xc(%ebp)
  281a6d:	ff 75 08             	pushl  0x8(%ebp)
  281a70:	e8 00 fd ff ff       	call   281775 <putfont8>
  281a75:	83 c4 20             	add    $0x20,%esp
				putfont8(vram, xsize, x    , y, c, font + 16);	/* âEîºï™ */
  281a78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  281a7b:	8d 50 10             	lea    0x10(%eax),%edx
  281a7e:	0f be 45 d4          	movsbl -0x2c(%ebp),%eax
  281a82:	83 ec 08             	sub    $0x8,%esp
  281a85:	52                   	push   %edx
  281a86:	50                   	push   %eax
  281a87:	ff 75 14             	pushl  0x14(%ebp)
  281a8a:	ff 75 10             	pushl  0x10(%ebp)
  281a8d:	ff 75 0c             	pushl  0xc(%ebp)
  281a90:	ff 75 08             	pushl  0x8(%ebp)
  281a93:	e8 dd fc ff ff       	call   281775 <putfont8>
  281a98:	83 c4 20             	add    $0x20,%esp
			}
			x += 8;
  281a9b:	83 45 10 08          	addl   $0x8,0x10(%ebp)
		for (; *s != 0x00; s++) {
  281a9f:	83 45 1c 01          	addl   $0x1,0x1c(%ebp)
  281aa3:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281aa6:	0f b6 00             	movzbl (%eax),%eax
  281aa9:	84 c0                	test   %al,%al
  281aab:	0f 85 54 fe ff ff    	jne    281905 <putfonts8_asc+0x8a>
		}
	}
	if (task->langmode == 2) {
  281ab1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281ab4:	0f b6 80 bc 00 00 00 	movzbl 0xbc(%eax),%eax
  281abb:	3c 02                	cmp    $0x2,%al
  281abd:	0f 85 19 01 00 00    	jne    281bdc <putfonts8_asc+0x361>
		for (; *s != 0x00; s++) {
  281ac3:	e9 05 01 00 00       	jmp    281bcd <putfonts8_asc+0x352>
			if (task->langbyte1 == 0) {
  281ac8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281acb:	0f b6 80 bd 00 00 00 	movzbl 0xbd(%eax),%eax
  281ad2:	84 c0                	test   %al,%al
  281ad4:	75 5d                	jne    281b33 <putfonts8_asc+0x2b8>
				if (0x81 <= *s && *s <= 0xfe) {
  281ad6:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281ad9:	0f b6 00             	movzbl (%eax),%eax
  281adc:	3c 80                	cmp    $0x80,%al
  281ade:	76 1e                	jbe    281afe <putfonts8_asc+0x283>
  281ae0:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281ae3:	0f b6 00             	movzbl (%eax),%eax
  281ae6:	3c ff                	cmp    $0xff,%al
  281ae8:	74 14                	je     281afe <putfonts8_asc+0x283>
					task->langbyte1 = *s;
  281aea:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281aed:	0f b6 10             	movzbl (%eax),%edx
  281af0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281af3:	88 90 bd 00 00 00    	mov    %dl,0xbd(%eax)
  281af9:	e9 c7 00 00 00       	jmp    281bc5 <putfonts8_asc+0x34a>
				} else {
					putfont8(vram, xsize, x, y, c, nihongo + *s * 16);
  281afe:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281b01:	0f b6 00             	movzbl (%eax),%eax
  281b04:	0f b6 c0             	movzbl %al,%eax
  281b07:	c1 e0 04             	shl    $0x4,%eax
  281b0a:	89 c2                	mov    %eax,%edx
  281b0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  281b0f:	01 c2                	add    %eax,%edx
  281b11:	0f be 45 d4          	movsbl -0x2c(%ebp),%eax
  281b15:	83 ec 08             	sub    $0x8,%esp
  281b18:	52                   	push   %edx
  281b19:	50                   	push   %eax
  281b1a:	ff 75 14             	pushl  0x14(%ebp)
  281b1d:	ff 75 10             	pushl  0x10(%ebp)
  281b20:	ff 75 0c             	pushl  0xc(%ebp)
  281b23:	ff 75 08             	pushl  0x8(%ebp)
  281b26:	e8 4a fc ff ff       	call   281775 <putfont8>
  281b2b:	83 c4 20             	add    $0x20,%esp
  281b2e:	e9 92 00 00 00       	jmp    281bc5 <putfonts8_asc+0x34a>
				}
			} else {
				k = task->langbyte1 - 0xa1;
  281b33:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281b36:	0f b6 80 bd 00 00 00 	movzbl 0xbd(%eax),%eax
  281b3d:	0f b6 c0             	movzbl %al,%eax
  281b40:	2d a1 00 00 00       	sub    $0xa1,%eax
  281b45:	89 45 f4             	mov    %eax,-0xc(%ebp)
				t = *s - 0xa1;
  281b48:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281b4b:	0f b6 00             	movzbl (%eax),%eax
  281b4e:	0f b6 c0             	movzbl %al,%eax
  281b51:	2d a1 00 00 00       	sub    $0xa1,%eax
  281b56:	89 45 f0             	mov    %eax,-0x10(%ebp)
				task->langbyte1 = 0;
  281b59:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281b5c:	c6 80 bd 00 00 00 00 	movb   $0x0,0xbd(%eax)
				font = nihongo + 256 * 16 + (k * 94 + t) * 32;
  281b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
  281b66:	6b d0 5e             	imul   $0x5e,%eax,%edx
  281b69:	8b 45 f0             	mov    -0x10(%ebp),%eax
  281b6c:	01 d0                	add    %edx,%eax
  281b6e:	c1 e0 05             	shl    $0x5,%eax
  281b71:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  281b77:	8b 45 e8             	mov    -0x18(%ebp),%eax
  281b7a:	01 d0                	add    %edx,%eax
  281b7c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				putfont8(vram, xsize, x - 8, y, c, font     );	/* ç∂îºï™ */
  281b7f:	0f be 45 d4          	movsbl -0x2c(%ebp),%eax
  281b83:	8b 55 10             	mov    0x10(%ebp),%edx
  281b86:	83 ea 08             	sub    $0x8,%edx
  281b89:	83 ec 08             	sub    $0x8,%esp
  281b8c:	ff 75 e4             	pushl  -0x1c(%ebp)
  281b8f:	50                   	push   %eax
  281b90:	ff 75 14             	pushl  0x14(%ebp)
  281b93:	52                   	push   %edx
  281b94:	ff 75 0c             	pushl  0xc(%ebp)
  281b97:	ff 75 08             	pushl  0x8(%ebp)
  281b9a:	e8 d6 fb ff ff       	call   281775 <putfont8>
  281b9f:	83 c4 20             	add    $0x20,%esp
				putfont8(vram, xsize, x    , y, c, font + 16);	/* âEîºï™ */
  281ba2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  281ba5:	8d 50 10             	lea    0x10(%eax),%edx
  281ba8:	0f be 45 d4          	movsbl -0x2c(%ebp),%eax
  281bac:	83 ec 08             	sub    $0x8,%esp
  281baf:	52                   	push   %edx
  281bb0:	50                   	push   %eax
  281bb1:	ff 75 14             	pushl  0x14(%ebp)
  281bb4:	ff 75 10             	pushl  0x10(%ebp)
  281bb7:	ff 75 0c             	pushl  0xc(%ebp)
  281bba:	ff 75 08             	pushl  0x8(%ebp)
  281bbd:	e8 b3 fb ff ff       	call   281775 <putfont8>
  281bc2:	83 c4 20             	add    $0x20,%esp
			}
			x += 8;
  281bc5:	83 45 10 08          	addl   $0x8,0x10(%ebp)
		for (; *s != 0x00; s++) {
  281bc9:	83 45 1c 01          	addl   $0x1,0x1c(%ebp)
  281bcd:	8b 45 1c             	mov    0x1c(%ebp),%eax
  281bd0:	0f b6 00             	movzbl (%eax),%eax
  281bd3:	84 c0                	test   %al,%al
  281bd5:	0f 85 ed fe ff ff    	jne    281ac8 <putfonts8_asc+0x24d>
		}
	}
	return;
  281bdb:	90                   	nop
  281bdc:	90                   	nop
}
  281bdd:	c9                   	leave  
  281bde:	c3                   	ret    

00281bdf <init_mouse_cursor8>:

void init_mouse_cursor8(char *mouse, char bc)
/* É}ÉEÉXÉJÅ[É\ÉãÇèÄîıÅi16x16Åj */
{
  281bdf:	f3 0f 1e fb          	endbr32 
  281be3:	55                   	push   %ebp
  281be4:	89 e5                	mov    %esp,%ebp
  281be6:	83 ec 14             	sub    $0x14,%esp
  281be9:	8b 45 0c             	mov    0xc(%ebp),%eax
  281bec:	88 45 ec             	mov    %al,-0x14(%ebp)
		"............*OO*",
		".............***"
	};
	int x, y;

	for (y = 0; y < 16; y++) {
  281bef:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  281bf6:	e9 b1 00 00 00       	jmp    281cac <init_mouse_cursor8+0xcd>
		for (x = 0; x < 16; x++) {
  281bfb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  281c02:	e9 97 00 00 00       	jmp    281c9e <init_mouse_cursor8+0xbf>
			if (cursor[y][x] == '*') {
  281c07:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281c0a:	c1 e0 04             	shl    $0x4,%eax
  281c0d:	89 c2                	mov    %eax,%edx
  281c0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  281c12:	01 d0                	add    %edx,%eax
  281c14:	05 80 11 31 00       	add    $0x311180,%eax
  281c19:	0f b6 00             	movzbl (%eax),%eax
  281c1c:	3c 2a                	cmp    $0x2a,%al
  281c1e:	75 17                	jne    281c37 <init_mouse_cursor8+0x58>
				mouse[y * 16 + x] = COL8_000000;
  281c20:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281c23:	c1 e0 04             	shl    $0x4,%eax
  281c26:	89 c2                	mov    %eax,%edx
  281c28:	8b 45 fc             	mov    -0x4(%ebp),%eax
  281c2b:	01 d0                	add    %edx,%eax
  281c2d:	89 c2                	mov    %eax,%edx
  281c2f:	8b 45 08             	mov    0x8(%ebp),%eax
  281c32:	01 d0                	add    %edx,%eax
  281c34:	c6 00 00             	movb   $0x0,(%eax)
			}
			if (cursor[y][x] == 'O') {
  281c37:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281c3a:	c1 e0 04             	shl    $0x4,%eax
  281c3d:	89 c2                	mov    %eax,%edx
  281c3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  281c42:	01 d0                	add    %edx,%eax
  281c44:	05 80 11 31 00       	add    $0x311180,%eax
  281c49:	0f b6 00             	movzbl (%eax),%eax
  281c4c:	3c 4f                	cmp    $0x4f,%al
  281c4e:	75 17                	jne    281c67 <init_mouse_cursor8+0x88>
				mouse[y * 16 + x] = COL8_FFFFFF;
  281c50:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281c53:	c1 e0 04             	shl    $0x4,%eax
  281c56:	89 c2                	mov    %eax,%edx
  281c58:	8b 45 fc             	mov    -0x4(%ebp),%eax
  281c5b:	01 d0                	add    %edx,%eax
  281c5d:	89 c2                	mov    %eax,%edx
  281c5f:	8b 45 08             	mov    0x8(%ebp),%eax
  281c62:	01 d0                	add    %edx,%eax
  281c64:	c6 00 07             	movb   $0x7,(%eax)
			}
			if (cursor[y][x] == '.') {
  281c67:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281c6a:	c1 e0 04             	shl    $0x4,%eax
  281c6d:	89 c2                	mov    %eax,%edx
  281c6f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  281c72:	01 d0                	add    %edx,%eax
  281c74:	05 80 11 31 00       	add    $0x311180,%eax
  281c79:	0f b6 00             	movzbl (%eax),%eax
  281c7c:	3c 2e                	cmp    $0x2e,%al
  281c7e:	75 1a                	jne    281c9a <init_mouse_cursor8+0xbb>
				mouse[y * 16 + x] = bc;
  281c80:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281c83:	c1 e0 04             	shl    $0x4,%eax
  281c86:	89 c2                	mov    %eax,%edx
  281c88:	8b 45 fc             	mov    -0x4(%ebp),%eax
  281c8b:	01 d0                	add    %edx,%eax
  281c8d:	89 c2                	mov    %eax,%edx
  281c8f:	8b 45 08             	mov    0x8(%ebp),%eax
  281c92:	01 c2                	add    %eax,%edx
  281c94:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  281c98:	88 02                	mov    %al,(%edx)
		for (x = 0; x < 16; x++) {
  281c9a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  281c9e:	83 7d fc 0f          	cmpl   $0xf,-0x4(%ebp)
  281ca2:	0f 8e 5f ff ff ff    	jle    281c07 <init_mouse_cursor8+0x28>
	for (y = 0; y < 16; y++) {
  281ca8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  281cac:	83 7d f8 0f          	cmpl   $0xf,-0x8(%ebp)
  281cb0:	0f 8e 45 ff ff ff    	jle    281bfb <init_mouse_cursor8+0x1c>
			}
		}
	}
	return;
  281cb6:	90                   	nop
}
  281cb7:	c9                   	leave  
  281cb8:	c3                   	ret    

00281cb9 <putblock8_8>:

void putblock8_8(char *vram, int vxsize, int pxsize,
	int pysize, int px0, int py0, char *buf, int bxsize)
{
  281cb9:	f3 0f 1e fb          	endbr32 
  281cbd:	55                   	push   %ebp
  281cbe:	89 e5                	mov    %esp,%ebp
  281cc0:	53                   	push   %ebx
  281cc1:	83 ec 10             	sub    $0x10,%esp
	int x, y;
	for (y = 0; y < pysize; y++) {
  281cc4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  281ccb:	eb 50                	jmp    281d1d <putblock8_8+0x64>
		for (x = 0; x < pxsize; x++) {
  281ccd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  281cd4:	eb 3b                	jmp    281d11 <putblock8_8+0x58>
			vram[(py0 + y) * vxsize + (px0 + x)] = buf[y * bxsize + x];
  281cd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  281cd9:	0f af 45 24          	imul   0x24(%ebp),%eax
  281cdd:	89 c2                	mov    %eax,%edx
  281cdf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281ce2:	01 d0                	add    %edx,%eax
  281ce4:	89 c2                	mov    %eax,%edx
  281ce6:	8b 45 20             	mov    0x20(%ebp),%eax
  281ce9:	01 d0                	add    %edx,%eax
  281ceb:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
  281cee:	8b 55 f4             	mov    -0xc(%ebp),%edx
  281cf1:	01 ca                	add    %ecx,%edx
  281cf3:	0f af 55 0c          	imul   0xc(%ebp),%edx
  281cf7:	8b 5d 18             	mov    0x18(%ebp),%ebx
  281cfa:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  281cfd:	01 d9                	add    %ebx,%ecx
  281cff:	01 ca                	add    %ecx,%edx
  281d01:	89 d1                	mov    %edx,%ecx
  281d03:	8b 55 08             	mov    0x8(%ebp),%edx
  281d06:	01 ca                	add    %ecx,%edx
  281d08:	0f b6 00             	movzbl (%eax),%eax
  281d0b:	88 02                	mov    %al,(%edx)
		for (x = 0; x < pxsize; x++) {
  281d0d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  281d11:	8b 45 f8             	mov    -0x8(%ebp),%eax
  281d14:	3b 45 10             	cmp    0x10(%ebp),%eax
  281d17:	7c bd                	jl     281cd6 <putblock8_8+0x1d>
	for (y = 0; y < pysize; y++) {
  281d19:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  281d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  281d20:	3b 45 14             	cmp    0x14(%ebp),%eax
  281d23:	7c a8                	jl     281ccd <putblock8_8+0x14>
		}
	}
	return;
  281d25:	90                   	nop
}
  281d26:	83 c4 10             	add    $0x10,%esp
  281d29:	5b                   	pop    %ebx
  281d2a:	5d                   	pop    %ebp
  281d2b:	c3                   	ret    

00281d2c <init_gdtidt>:
/* GDTÇ‚IDTÇ»Ç«ÇÃÅA descriptor table ä÷åW */

#include "bootpack.h"

void init_gdtidt(void)
{
  281d2c:	f3 0f 1e fb          	endbr32 
  281d30:	55                   	push   %ebp
  281d31:	89 e5                	mov    %esp,%ebp
  281d33:	83 ec 18             	sub    $0x18,%esp
	struct SEGMENT_DESCRIPTOR *gdt = (struct SEGMENT_DESCRIPTOR *) ADR_GDT;
  281d36:	c7 45 f0 00 00 27 00 	movl   $0x270000,-0x10(%ebp)
	struct GATE_DESCRIPTOR    *idt = (struct GATE_DESCRIPTOR    *) ADR_IDT;
  281d3d:	c7 45 ec 00 f8 26 00 	movl   $0x26f800,-0x14(%ebp)
	int i;

	/* GDTÇÃèâä˙âª */
	for (i = 0; i <= LIMIT_GDT / 8; i++) {
  281d44:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  281d4b:	eb 22                	jmp    281d6f <init_gdtidt+0x43>
		set_segmdesc(gdt + i, 0, 0, 0);
  281d4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  281d50:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  281d57:	8b 45 f0             	mov    -0x10(%ebp),%eax
  281d5a:	01 d0                	add    %edx,%eax
  281d5c:	6a 00                	push   $0x0
  281d5e:	6a 00                	push   $0x0
  281d60:	6a 00                	push   $0x0
  281d62:	50                   	push   %eax
  281d63:	e8 51 01 00 00       	call   281eb9 <set_segmdesc>
  281d68:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i <= LIMIT_GDT / 8; i++) {
  281d6b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  281d6f:	81 7d f4 ff 1f 00 00 	cmpl   $0x1fff,-0xc(%ebp)
  281d76:	7e d5                	jle    281d4d <init_gdtidt+0x21>
	}
	set_segmdesc(gdt + 1, 0xffffffff,   0x00000000, AR_DATA32_RW);
  281d78:	8b 45 f0             	mov    -0x10(%ebp),%eax
  281d7b:	83 c0 08             	add    $0x8,%eax
  281d7e:	68 92 40 00 00       	push   $0x4092
  281d83:	6a 00                	push   $0x0
  281d85:	6a ff                	push   $0xffffffff
  281d87:	50                   	push   %eax
  281d88:	e8 2c 01 00 00       	call   281eb9 <set_segmdesc>
  281d8d:	83 c4 10             	add    $0x10,%esp
	//set_segmdesc(gdt + 2, LIMIT_BOTPAK, ADR_BOTPAK, AR_CODE32_ER);
	set_segmdesc(gdt + 2, 0xffffffff, 0x00000000, AR_CODE32_ER);
  281d90:	8b 45 f0             	mov    -0x10(%ebp),%eax
  281d93:	83 c0 10             	add    $0x10,%eax
  281d96:	68 9a 40 00 00       	push   $0x409a
  281d9b:	6a 00                	push   $0x0
  281d9d:	6a ff                	push   $0xffffffff
  281d9f:	50                   	push   %eax
  281da0:	e8 14 01 00 00       	call   281eb9 <set_segmdesc>
  281da5:	83 c4 10             	add    $0x10,%esp
	load_gdtr(LIMIT_GDT, ADR_GDT);
  281da8:	83 ec 08             	sub    $0x8,%esp
  281dab:	68 00 00 27 00       	push   $0x270000
  281db0:	68 ff ff 00 00       	push   $0xffff
  281db5:	e8 e5 f3 ff ff       	call   28119f <load_gdtr>
  281dba:	83 c4 10             	add    $0x10,%esp

	/* IDTÇÃèâä˙âª */
	for (i = 0; i <= LIMIT_IDT / 8; i++) {
  281dbd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  281dc4:	eb 22                	jmp    281de8 <init_gdtidt+0xbc>
		set_gatedesc(idt + i, 0, 0, 0);
  281dc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  281dc9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  281dd0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281dd3:	01 d0                	add    %edx,%eax
  281dd5:	6a 00                	push   $0x0
  281dd7:	6a 00                	push   $0x0
  281dd9:	6a 00                	push   $0x0
  281ddb:	50                   	push   %eax
  281ddc:	e8 57 01 00 00       	call   281f38 <set_gatedesc>
  281de1:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i <= LIMIT_IDT / 8; i++) {
  281de4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  281de8:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
  281def:	7e d5                	jle    281dc6 <init_gdtidt+0x9a>
	}
	load_idtr(LIMIT_IDT, ADR_IDT);
  281df1:	83 ec 08             	sub    $0x8,%esp
  281df4:	68 00 f8 26 00       	push   $0x26f800
  281df9:	68 ff 07 00 00       	push   $0x7ff
  281dfe:	e8 ac f3 ff ff       	call   2811af <load_idtr>
  281e03:	83 c4 10             	add    $0x10,%esp

	/* IDTÇÃê›íË */
	set_gatedesc(idt + 0x0c, (int) asm_inthandler0c, 2 * 8, AR_INTGATE32);
  281e06:	ba 16 12 28 00       	mov    $0x281216,%edx
  281e0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281e0e:	83 c0 60             	add    $0x60,%eax
  281e11:	68 8e 00 00 00       	push   $0x8e
  281e16:	6a 10                	push   $0x10
  281e18:	52                   	push   %edx
  281e19:	50                   	push   %eax
  281e1a:	e8 19 01 00 00       	call   281f38 <set_gatedesc>
  281e1f:	83 c4 10             	add    $0x10,%esp
	set_gatedesc(idt + 0x0d, (int) asm_inthandler0d, 2 * 8, AR_INTGATE32);
  281e22:	ba 3a 12 28 00       	mov    $0x28123a,%edx
  281e27:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281e2a:	83 c0 68             	add    $0x68,%eax
  281e2d:	68 8e 00 00 00       	push   $0x8e
  281e32:	6a 10                	push   $0x10
  281e34:	52                   	push   %edx
  281e35:	50                   	push   %eax
  281e36:	e8 fd 00 00 00       	call   281f38 <set_gatedesc>
  281e3b:	83 c4 10             	add    $0x10,%esp
	set_gatedesc(idt + 0x20, (int) asm_inthandler20, 2 * 8, AR_INTGATE32);
  281e3e:	ba d1 11 28 00       	mov    $0x2811d1,%edx
  281e43:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281e46:	05 00 01 00 00       	add    $0x100,%eax
  281e4b:	68 8e 00 00 00       	push   $0x8e
  281e50:	6a 10                	push   $0x10
  281e52:	52                   	push   %edx
  281e53:	50                   	push   %eax
  281e54:	e8 df 00 00 00       	call   281f38 <set_gatedesc>
  281e59:	83 c4 10             	add    $0x10,%esp
	set_gatedesc(idt + 0x21, (int) asm_inthandler21, 2 * 8, AR_INTGATE32);
  281e5c:	ba e8 11 28 00       	mov    $0x2811e8,%edx
  281e61:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281e64:	05 08 01 00 00       	add    $0x108,%eax
  281e69:	68 8e 00 00 00       	push   $0x8e
  281e6e:	6a 10                	push   $0x10
  281e70:	52                   	push   %edx
  281e71:	50                   	push   %eax
  281e72:	e8 c1 00 00 00       	call   281f38 <set_gatedesc>
  281e77:	83 c4 10             	add    $0x10,%esp
	set_gatedesc(idt + 0x2c, (int) asm_inthandler2c, 2 * 8, AR_INTGATE32);
  281e7a:	ba ff 11 28 00       	mov    $0x2811ff,%edx
  281e7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281e82:	05 60 01 00 00       	add    $0x160,%eax
  281e87:	68 8e 00 00 00       	push   $0x8e
  281e8c:	6a 10                	push   $0x10
  281e8e:	52                   	push   %edx
  281e8f:	50                   	push   %eax
  281e90:	e8 a3 00 00 00       	call   281f38 <set_gatedesc>
  281e95:	83 c4 10             	add    $0x10,%esp
	set_gatedesc(idt + 0x40, (int) asm_hrb_api,      2 * 8, AR_INTGATE32 + 0x60);
  281e98:	ba a6 12 28 00       	mov    $0x2812a6,%edx
  281e9d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  281ea0:	05 00 02 00 00       	add    $0x200,%eax
  281ea5:	68 ee 00 00 00       	push   $0xee
  281eaa:	6a 10                	push   $0x10
  281eac:	52                   	push   %edx
  281ead:	50                   	push   %eax
  281eae:	e8 85 00 00 00       	call   281f38 <set_gatedesc>
  281eb3:	83 c4 10             	add    $0x10,%esp

	return;
  281eb6:	90                   	nop
}
  281eb7:	c9                   	leave  
  281eb8:	c3                   	ret    

00281eb9 <set_segmdesc>:

void set_segmdesc(struct SEGMENT_DESCRIPTOR *sd, unsigned int limit, int base, int ar)
{
  281eb9:	f3 0f 1e fb          	endbr32 
  281ebd:	55                   	push   %ebp
  281ebe:	89 e5                	mov    %esp,%ebp
	if (limit > 0xfffff) {
  281ec0:	81 7d 0c ff ff 0f 00 	cmpl   $0xfffff,0xc(%ebp)
  281ec7:	76 10                	jbe    281ed9 <set_segmdesc+0x20>
		ar |= 0x8000; /* G_bit = 1 */
  281ec9:	81 4d 14 00 80 00 00 	orl    $0x8000,0x14(%ebp)
		limit /= 0x1000;
  281ed0:	8b 45 0c             	mov    0xc(%ebp),%eax
  281ed3:	c1 e8 0c             	shr    $0xc,%eax
  281ed6:	89 45 0c             	mov    %eax,0xc(%ebp)
	}
	sd->limit_low    = limit & 0xffff;
  281ed9:	8b 45 0c             	mov    0xc(%ebp),%eax
  281edc:	89 c2                	mov    %eax,%edx
  281ede:	8b 45 08             	mov    0x8(%ebp),%eax
  281ee1:	66 89 10             	mov    %dx,(%eax)
	sd->base_low     = base & 0xffff;
  281ee4:	8b 45 10             	mov    0x10(%ebp),%eax
  281ee7:	89 c2                	mov    %eax,%edx
  281ee9:	8b 45 08             	mov    0x8(%ebp),%eax
  281eec:	66 89 50 02          	mov    %dx,0x2(%eax)
	sd->base_mid     = (base >> 16) & 0xff;
  281ef0:	8b 45 10             	mov    0x10(%ebp),%eax
  281ef3:	c1 f8 10             	sar    $0x10,%eax
  281ef6:	89 c2                	mov    %eax,%edx
  281ef8:	8b 45 08             	mov    0x8(%ebp),%eax
  281efb:	88 50 04             	mov    %dl,0x4(%eax)
	sd->access_right = ar & 0xff;
  281efe:	8b 45 14             	mov    0x14(%ebp),%eax
  281f01:	89 c2                	mov    %eax,%edx
  281f03:	8b 45 08             	mov    0x8(%ebp),%eax
  281f06:	88 50 05             	mov    %dl,0x5(%eax)
	sd->limit_high   = ((limit >> 16) & 0x0f) | ((ar >> 8) & 0xf0);
  281f09:	8b 45 0c             	mov    0xc(%ebp),%eax
  281f0c:	c1 e8 10             	shr    $0x10,%eax
  281f0f:	83 e0 0f             	and    $0xf,%eax
  281f12:	89 c2                	mov    %eax,%edx
  281f14:	8b 45 14             	mov    0x14(%ebp),%eax
  281f17:	c1 f8 08             	sar    $0x8,%eax
  281f1a:	83 e0 f0             	and    $0xfffffff0,%eax
  281f1d:	09 d0                	or     %edx,%eax
  281f1f:	89 c2                	mov    %eax,%edx
  281f21:	8b 45 08             	mov    0x8(%ebp),%eax
  281f24:	88 50 06             	mov    %dl,0x6(%eax)
	sd->base_high    = (base >> 24) & 0xff;
  281f27:	8b 45 10             	mov    0x10(%ebp),%eax
  281f2a:	c1 e8 18             	shr    $0x18,%eax
  281f2d:	89 c2                	mov    %eax,%edx
  281f2f:	8b 45 08             	mov    0x8(%ebp),%eax
  281f32:	88 50 07             	mov    %dl,0x7(%eax)
	return;
  281f35:	90                   	nop
}
  281f36:	5d                   	pop    %ebp
  281f37:	c3                   	ret    

00281f38 <set_gatedesc>:

void set_gatedesc(struct GATE_DESCRIPTOR *gd, int offset, int selector, int ar)
{
  281f38:	f3 0f 1e fb          	endbr32 
  281f3c:	55                   	push   %ebp
  281f3d:	89 e5                	mov    %esp,%ebp
	gd->offset_low   = offset & 0xffff;
  281f3f:	8b 45 0c             	mov    0xc(%ebp),%eax
  281f42:	89 c2                	mov    %eax,%edx
  281f44:	8b 45 08             	mov    0x8(%ebp),%eax
  281f47:	66 89 10             	mov    %dx,(%eax)
	gd->selector     = selector;
  281f4a:	8b 45 10             	mov    0x10(%ebp),%eax
  281f4d:	89 c2                	mov    %eax,%edx
  281f4f:	8b 45 08             	mov    0x8(%ebp),%eax
  281f52:	66 89 50 02          	mov    %dx,0x2(%eax)
	gd->dw_count     = (ar >> 8) & 0xff;
  281f56:	8b 45 14             	mov    0x14(%ebp),%eax
  281f59:	c1 f8 08             	sar    $0x8,%eax
  281f5c:	89 c2                	mov    %eax,%edx
  281f5e:	8b 45 08             	mov    0x8(%ebp),%eax
  281f61:	88 50 04             	mov    %dl,0x4(%eax)
	gd->access_right = ar & 0xff;
  281f64:	8b 45 14             	mov    0x14(%ebp),%eax
  281f67:	89 c2                	mov    %eax,%edx
  281f69:	8b 45 08             	mov    0x8(%ebp),%eax
  281f6c:	88 50 05             	mov    %dl,0x5(%eax)
	gd->offset_high  = (offset >> 16) & 0xffff;
  281f6f:	8b 45 0c             	mov    0xc(%ebp),%eax
  281f72:	c1 e8 10             	shr    $0x10,%eax
  281f75:	89 c2                	mov    %eax,%edx
  281f77:	8b 45 08             	mov    0x8(%ebp),%eax
  281f7a:	66 89 50 06          	mov    %dx,0x6(%eax)
	return;
  281f7e:	90                   	nop
}
  281f7f:	5d                   	pop    %ebp
  281f80:	c3                   	ret    

00281f81 <init_pic>:
#include "bootpack.h"
#include <stdio.h>

void init_pic(void)
/* PICÇÃèâä˙âª */
{
  281f81:	f3 0f 1e fb          	endbr32 
  281f85:	55                   	push   %ebp
  281f86:	89 e5                	mov    %esp,%ebp
  281f88:	83 ec 08             	sub    $0x8,%esp
	io_out8(PIC0_IMR,  0xff  ); /* ëSÇƒÇÃäÑÇËçûÇ›ÇéÛÇØïtÇØÇ»Ç¢ */
  281f8b:	83 ec 08             	sub    $0x8,%esp
  281f8e:	68 ff 00 00 00       	push   $0xff
  281f93:	6a 21                	push   $0x21
  281f95:	e8 dc f1 ff ff       	call   281176 <io_out8>
  281f9a:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC1_IMR,  0xff  ); /* ëSÇƒÇÃäÑÇËçûÇ›ÇéÛÇØïtÇØÇ»Ç¢ */
  281f9d:	83 ec 08             	sub    $0x8,%esp
  281fa0:	68 ff 00 00 00       	push   $0xff
  281fa5:	68 a1 00 00 00       	push   $0xa1
  281faa:	e8 c7 f1 ff ff       	call   281176 <io_out8>
  281faf:	83 c4 10             	add    $0x10,%esp

	io_out8(PIC0_ICW1, 0x11  ); /* ÉGÉbÉWÉgÉäÉKÉÇÅ[Éh */
  281fb2:	83 ec 08             	sub    $0x8,%esp
  281fb5:	6a 11                	push   $0x11
  281fb7:	6a 20                	push   $0x20
  281fb9:	e8 b8 f1 ff ff       	call   281176 <io_out8>
  281fbe:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC0_ICW2, 0x20  ); /* IRQ0-7ÇÕÅAINT20-27Ç≈éÛÇØÇÈ */
  281fc1:	83 ec 08             	sub    $0x8,%esp
  281fc4:	6a 20                	push   $0x20
  281fc6:	6a 21                	push   $0x21
  281fc8:	e8 a9 f1 ff ff       	call   281176 <io_out8>
  281fcd:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC0_ICW3, 1 << 2); /* PIC1ÇÕIRQ2Ç…Çƒê⁄ë± */
  281fd0:	83 ec 08             	sub    $0x8,%esp
  281fd3:	6a 04                	push   $0x4
  281fd5:	6a 21                	push   $0x21
  281fd7:	e8 9a f1 ff ff       	call   281176 <io_out8>
  281fdc:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC0_ICW4, 0x01  ); /* ÉmÉìÉoÉbÉtÉ@ÉÇÅ[Éh */
  281fdf:	83 ec 08             	sub    $0x8,%esp
  281fe2:	6a 01                	push   $0x1
  281fe4:	6a 21                	push   $0x21
  281fe6:	e8 8b f1 ff ff       	call   281176 <io_out8>
  281feb:	83 c4 10             	add    $0x10,%esp

	io_out8(PIC1_ICW1, 0x11  ); /* ÉGÉbÉWÉgÉäÉKÉÇÅ[Éh */
  281fee:	83 ec 08             	sub    $0x8,%esp
  281ff1:	6a 11                	push   $0x11
  281ff3:	68 a0 00 00 00       	push   $0xa0
  281ff8:	e8 79 f1 ff ff       	call   281176 <io_out8>
  281ffd:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC1_ICW2, 0x28  ); /* IRQ8-15ÇÕÅAINT28-2fÇ≈éÛÇØÇÈ */
  282000:	83 ec 08             	sub    $0x8,%esp
  282003:	6a 28                	push   $0x28
  282005:	68 a1 00 00 00       	push   $0xa1
  28200a:	e8 67 f1 ff ff       	call   281176 <io_out8>
  28200f:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC1_ICW3, 2     ); /* PIC1ÇÕIRQ2Ç…Çƒê⁄ë± */
  282012:	83 ec 08             	sub    $0x8,%esp
  282015:	6a 02                	push   $0x2
  282017:	68 a1 00 00 00       	push   $0xa1
  28201c:	e8 55 f1 ff ff       	call   281176 <io_out8>
  282021:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC1_ICW4, 0x01  ); /* ÉmÉìÉoÉbÉtÉ@ÉÇÅ[Éh */
  282024:	83 ec 08             	sub    $0x8,%esp
  282027:	6a 01                	push   $0x1
  282029:	68 a1 00 00 00       	push   $0xa1
  28202e:	e8 43 f1 ff ff       	call   281176 <io_out8>
  282033:	83 c4 10             	add    $0x10,%esp

	io_out8(PIC0_IMR,  0xfb  ); /* 11111011 PIC1à»äOÇÕëSÇƒã÷é~ */
  282036:	83 ec 08             	sub    $0x8,%esp
  282039:	68 fb 00 00 00       	push   $0xfb
  28203e:	6a 21                	push   $0x21
  282040:	e8 31 f1 ff ff       	call   281176 <io_out8>
  282045:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC1_IMR,  0xff  ); /* 11111111 ëSÇƒÇÃäÑÇËçûÇ›ÇéÛÇØïtÇØÇ»Ç¢ */
  282048:	83 ec 08             	sub    $0x8,%esp
  28204b:	68 ff 00 00 00       	push   $0xff
  282050:	68 a1 00 00 00       	push   $0xa1
  282055:	e8 1c f1 ff ff       	call   281176 <io_out8>
  28205a:	83 c4 10             	add    $0x10,%esp

	return;
  28205d:	90                   	nop
}
  28205e:	c9                   	leave  
  28205f:	c3                   	ret    

00282060 <fifo32_init>:

#define FLAGS_OVERRUN		0x0001

void fifo32_init(struct FIFO32 *fifo, int size, int *buf, struct TASK *task)
/* FIFOÉoÉbÉtÉ@ÇÃèâä˙âª */
{
  282060:	f3 0f 1e fb          	endbr32 
  282064:	55                   	push   %ebp
  282065:	89 e5                	mov    %esp,%ebp
	fifo->size = size;
  282067:	8b 45 08             	mov    0x8(%ebp),%eax
  28206a:	8b 55 0c             	mov    0xc(%ebp),%edx
  28206d:	89 50 0c             	mov    %edx,0xc(%eax)
	fifo->buf = buf;
  282070:	8b 45 08             	mov    0x8(%ebp),%eax
  282073:	8b 55 10             	mov    0x10(%ebp),%edx
  282076:	89 10                	mov    %edx,(%eax)
	fifo->free = size; /* ãÛÇ´ */
  282078:	8b 45 08             	mov    0x8(%ebp),%eax
  28207b:	8b 55 0c             	mov    0xc(%ebp),%edx
  28207e:	89 50 10             	mov    %edx,0x10(%eax)
	fifo->flags = 0;
  282081:	8b 45 08             	mov    0x8(%ebp),%eax
  282084:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	fifo->p = 0; /* èëÇ´çûÇ›à íu */
  28208b:	8b 45 08             	mov    0x8(%ebp),%eax
  28208e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	fifo->q = 0; /* ì«Ç›çûÇ›à íu */
  282095:	8b 45 08             	mov    0x8(%ebp),%eax
  282098:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
	fifo->task = task; /* ÉfÅ[É^Ç™ì¸Ç¡ÇΩÇ∆Ç´Ç…ãNÇ±Ç∑É^ÉXÉN */
  28209f:	8b 45 08             	mov    0x8(%ebp),%eax
  2820a2:	8b 55 14             	mov    0x14(%ebp),%edx
  2820a5:	89 50 18             	mov    %edx,0x18(%eax)
	return;
  2820a8:	90                   	nop
}
  2820a9:	5d                   	pop    %ebp
  2820aa:	c3                   	ret    

002820ab <fifo32_put>:

int fifo32_put(struct FIFO32 *fifo, int data)
/* FIFOÇ÷ÉfÅ[É^ÇëóÇËçûÇÒÇ≈í~Ç¶ÇÈ */
{
  2820ab:	f3 0f 1e fb          	endbr32 
  2820af:	55                   	push   %ebp
  2820b0:	89 e5                	mov    %esp,%ebp
  2820b2:	83 ec 08             	sub    $0x8,%esp
	if (fifo->free == 0) {
  2820b5:	8b 45 08             	mov    0x8(%ebp),%eax
  2820b8:	8b 40 10             	mov    0x10(%eax),%eax
  2820bb:	85 c0                	test   %eax,%eax
  2820bd:	75 1b                	jne    2820da <fifo32_put+0x2f>
		/* ãÛÇ´Ç™Ç»Ç≠ÇƒÇ†Ç”ÇÍÇΩ */
		fifo->flags |= FLAGS_OVERRUN;
  2820bf:	8b 45 08             	mov    0x8(%ebp),%eax
  2820c2:	8b 40 14             	mov    0x14(%eax),%eax
  2820c5:	83 c8 01             	or     $0x1,%eax
  2820c8:	89 c2                	mov    %eax,%edx
  2820ca:	8b 45 08             	mov    0x8(%ebp),%eax
  2820cd:	89 50 14             	mov    %edx,0x14(%eax)
		return -1;
  2820d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  2820d5:	e9 80 00 00 00       	jmp    28215a <fifo32_put+0xaf>
	}
	fifo->buf[fifo->p] = data;
  2820da:	8b 45 08             	mov    0x8(%ebp),%eax
  2820dd:	8b 10                	mov    (%eax),%edx
  2820df:	8b 45 08             	mov    0x8(%ebp),%eax
  2820e2:	8b 40 04             	mov    0x4(%eax),%eax
  2820e5:	c1 e0 02             	shl    $0x2,%eax
  2820e8:	01 c2                	add    %eax,%edx
  2820ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  2820ed:	89 02                	mov    %eax,(%edx)
	fifo->p++;
  2820ef:	8b 45 08             	mov    0x8(%ebp),%eax
  2820f2:	8b 40 04             	mov    0x4(%eax),%eax
  2820f5:	8d 50 01             	lea    0x1(%eax),%edx
  2820f8:	8b 45 08             	mov    0x8(%ebp),%eax
  2820fb:	89 50 04             	mov    %edx,0x4(%eax)
	if (fifo->p == fifo->size) {
  2820fe:	8b 45 08             	mov    0x8(%ebp),%eax
  282101:	8b 50 04             	mov    0x4(%eax),%edx
  282104:	8b 45 08             	mov    0x8(%ebp),%eax
  282107:	8b 40 0c             	mov    0xc(%eax),%eax
  28210a:	39 c2                	cmp    %eax,%edx
  28210c:	75 0a                	jne    282118 <fifo32_put+0x6d>
		fifo->p = 0;
  28210e:	8b 45 08             	mov    0x8(%ebp),%eax
  282111:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	fifo->free--;
  282118:	8b 45 08             	mov    0x8(%ebp),%eax
  28211b:	8b 40 10             	mov    0x10(%eax),%eax
  28211e:	8d 50 ff             	lea    -0x1(%eax),%edx
  282121:	8b 45 08             	mov    0x8(%ebp),%eax
  282124:	89 50 10             	mov    %edx,0x10(%eax)
	if (fifo->task != 0) {
  282127:	8b 45 08             	mov    0x8(%ebp),%eax
  28212a:	8b 40 18             	mov    0x18(%eax),%eax
  28212d:	85 c0                	test   %eax,%eax
  28212f:	74 24                	je     282155 <fifo32_put+0xaa>
		if (fifo->task->flags != 2) { /* É^ÉXÉNÇ™êQÇƒÇ¢ÇΩÇÁ */
  282131:	8b 45 08             	mov    0x8(%ebp),%eax
  282134:	8b 40 18             	mov    0x18(%eax),%eax
  282137:	8b 40 04             	mov    0x4(%eax),%eax
  28213a:	83 f8 02             	cmp    $0x2,%eax
  28213d:	74 16                	je     282155 <fifo32_put+0xaa>
			task_run(fifo->task, -1, 0); /* ãNÇ±ÇµÇƒÇ†Ç∞ÇÈ */
  28213f:	8b 45 08             	mov    0x8(%ebp),%eax
  282142:	8b 40 18             	mov    0x18(%eax),%eax
  282145:	83 ec 04             	sub    $0x4,%esp
  282148:	6a 00                	push   $0x0
  28214a:	6a ff                	push   $0xffffffff
  28214c:	50                   	push   %eax
  28214d:	e8 92 20 00 00       	call   2841e4 <task_run>
  282152:	83 c4 10             	add    $0x10,%esp
		}
	}
	return 0;
  282155:	b8 00 00 00 00       	mov    $0x0,%eax
}
  28215a:	c9                   	leave  
  28215b:	c3                   	ret    

0028215c <fifo32_get>:

int fifo32_get(struct FIFO32 *fifo)
/* FIFOÇ©ÇÁÉfÅ[É^ÇàÍÇ¬Ç∆Ç¡ÇƒÇ≠ÇÈ */
{
  28215c:	f3 0f 1e fb          	endbr32 
  282160:	55                   	push   %ebp
  282161:	89 e5                	mov    %esp,%ebp
  282163:	83 ec 10             	sub    $0x10,%esp
	int data;
	if (fifo->free == fifo->size) {
  282166:	8b 45 08             	mov    0x8(%ebp),%eax
  282169:	8b 50 10             	mov    0x10(%eax),%edx
  28216c:	8b 45 08             	mov    0x8(%ebp),%eax
  28216f:	8b 40 0c             	mov    0xc(%eax),%eax
  282172:	39 c2                	cmp    %eax,%edx
  282174:	75 07                	jne    28217d <fifo32_get+0x21>
		/* ÉoÉbÉtÉ@Ç™ãÛÇ¡Ç€ÇÃÇ∆Ç´ÇÕÅAÇ∆ÇËÇ†Ç¶Ç∏-1Ç™ï‘Ç≥ÇÍÇÈ */
		return -1;
  282176:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  28217b:	eb 50                	jmp    2821cd <fifo32_get+0x71>
	}
	data = fifo->buf[fifo->q];
  28217d:	8b 45 08             	mov    0x8(%ebp),%eax
  282180:	8b 10                	mov    (%eax),%edx
  282182:	8b 45 08             	mov    0x8(%ebp),%eax
  282185:	8b 40 08             	mov    0x8(%eax),%eax
  282188:	c1 e0 02             	shl    $0x2,%eax
  28218b:	01 d0                	add    %edx,%eax
  28218d:	8b 00                	mov    (%eax),%eax
  28218f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	fifo->q++;
  282192:	8b 45 08             	mov    0x8(%ebp),%eax
  282195:	8b 40 08             	mov    0x8(%eax),%eax
  282198:	8d 50 01             	lea    0x1(%eax),%edx
  28219b:	8b 45 08             	mov    0x8(%ebp),%eax
  28219e:	89 50 08             	mov    %edx,0x8(%eax)
	if (fifo->q == fifo->size) {
  2821a1:	8b 45 08             	mov    0x8(%ebp),%eax
  2821a4:	8b 50 08             	mov    0x8(%eax),%edx
  2821a7:	8b 45 08             	mov    0x8(%ebp),%eax
  2821aa:	8b 40 0c             	mov    0xc(%eax),%eax
  2821ad:	39 c2                	cmp    %eax,%edx
  2821af:	75 0a                	jne    2821bb <fifo32_get+0x5f>
		fifo->q = 0;
  2821b1:	8b 45 08             	mov    0x8(%ebp),%eax
  2821b4:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
	}
	fifo->free++;
  2821bb:	8b 45 08             	mov    0x8(%ebp),%eax
  2821be:	8b 40 10             	mov    0x10(%eax),%eax
  2821c1:	8d 50 01             	lea    0x1(%eax),%edx
  2821c4:	8b 45 08             	mov    0x8(%ebp),%eax
  2821c7:	89 50 10             	mov    %edx,0x10(%eax)
	return data;
  2821ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  2821cd:	c9                   	leave  
  2821ce:	c3                   	ret    

002821cf <fifo32_status>:

int fifo32_status(struct FIFO32 *fifo)
/* Ç«ÇÃÇ≠ÇÁÇ¢ÉfÅ[É^Ç™ó≠Ç‹Ç¡ÇƒÇ¢ÇÈÇ©ÇïÒçêÇ∑ÇÈ */
{
  2821cf:	f3 0f 1e fb          	endbr32 
  2821d3:	55                   	push   %ebp
  2821d4:	89 e5                	mov    %esp,%ebp
	return fifo->size - fifo->free;
  2821d6:	8b 45 08             	mov    0x8(%ebp),%eax
  2821d9:	8b 50 0c             	mov    0xc(%eax),%edx
  2821dc:	8b 45 08             	mov    0x8(%ebp),%eax
  2821df:	8b 40 10             	mov    0x10(%eax),%eax
  2821e2:	29 c2                	sub    %eax,%edx
  2821e4:	89 d0                	mov    %edx,%eax
}
  2821e6:	5d                   	pop    %ebp
  2821e7:	c3                   	ret    

002821e8 <inthandler21>:

struct FIFO32 *keyfifo;
int keydata0;

void inthandler21(int *esp)
{
  2821e8:	f3 0f 1e fb          	endbr32 
  2821ec:	55                   	push   %ebp
  2821ed:	89 e5                	mov    %esp,%ebp
  2821ef:	83 ec 18             	sub    $0x18,%esp
	int data;
	io_out8(PIC0_OCW2, 0x61);	/* IRQ-01éÛïtäÆóπÇPICÇ…í ím */
  2821f2:	83 ec 08             	sub    $0x8,%esp
  2821f5:	6a 61                	push   $0x61
  2821f7:	6a 20                	push   $0x20
  2821f9:	e8 78 ef ff ff       	call   281176 <io_out8>
  2821fe:	83 c4 10             	add    $0x10,%esp
	data = io_in8(PORT_KEYDAT);
  282201:	83 ec 0c             	sub    $0xc,%esp
  282204:	6a 60                	push   $0x60
  282206:	e8 4e ef ff ff       	call   281159 <io_in8>
  28220b:	83 c4 10             	add    $0x10,%esp
  28220e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	fifo32_put(keyfifo, data + keydata0);
  282211:	8b 15 a4 6f 32 00    	mov    0x326fa4,%edx
  282217:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28221a:	01 c2                	add    %eax,%edx
  28221c:	a1 a0 6f 32 00       	mov    0x326fa0,%eax
  282221:	83 ec 08             	sub    $0x8,%esp
  282224:	52                   	push   %edx
  282225:	50                   	push   %eax
  282226:	e8 80 fe ff ff       	call   2820ab <fifo32_put>
  28222b:	83 c4 10             	add    $0x10,%esp
	return;
  28222e:	90                   	nop
}
  28222f:	c9                   	leave  
  282230:	c3                   	ret    

00282231 <wait_KBC_sendready>:
#define KEYSTA_SEND_NOTREADY	0x02
#define KEYCMD_WRITE_MODE		0x60
#define KBC_MODE				0x47

void wait_KBC_sendready(void)
{
  282231:	f3 0f 1e fb          	endbr32 
  282235:	55                   	push   %ebp
  282236:	89 e5                	mov    %esp,%ebp
  282238:	83 ec 08             	sub    $0x8,%esp
	/* ÉLÅ[É{Å[ÉhÉRÉìÉgÉçÅ[ÉâÇ™ÉfÅ[É^ëóêMâ¬î\Ç…Ç»ÇÈÇÃÇë“Ç¬ */
	for (;;) {
		if ((io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0) {
  28223b:	83 ec 0c             	sub    $0xc,%esp
  28223e:	6a 64                	push   $0x64
  282240:	e8 14 ef ff ff       	call   281159 <io_in8>
  282245:	83 c4 10             	add    $0x10,%esp
  282248:	83 e0 02             	and    $0x2,%eax
  28224b:	85 c0                	test   %eax,%eax
  28224d:	74 02                	je     282251 <wait_KBC_sendready+0x20>
  28224f:	eb ea                	jmp    28223b <wait_KBC_sendready+0xa>
			break;
  282251:	90                   	nop
		}
	}
	return;
  282252:	90                   	nop
}
  282253:	c9                   	leave  
  282254:	c3                   	ret    

00282255 <init_keyboard>:

void init_keyboard(struct FIFO32 *fifo, int data0)
{
  282255:	f3 0f 1e fb          	endbr32 
  282259:	55                   	push   %ebp
  28225a:	89 e5                	mov    %esp,%ebp
  28225c:	83 ec 08             	sub    $0x8,%esp
	/* èëÇ´çûÇ›êÊÇÃFIFOÉoÉbÉtÉ@ÇãLâØ */
	keyfifo = fifo;
  28225f:	8b 45 08             	mov    0x8(%ebp),%eax
  282262:	a3 a0 6f 32 00       	mov    %eax,0x326fa0
	keydata0 = data0;
  282267:	8b 45 0c             	mov    0xc(%ebp),%eax
  28226a:	a3 a4 6f 32 00       	mov    %eax,0x326fa4
	/* ÉLÅ[É{Å[ÉhÉRÉìÉgÉçÅ[ÉâÇÃèâä˙âª */
	wait_KBC_sendready();
  28226f:	e8 bd ff ff ff       	call   282231 <wait_KBC_sendready>
	io_out8(PORT_KEYCMD, KEYCMD_WRITE_MODE);
  282274:	83 ec 08             	sub    $0x8,%esp
  282277:	6a 60                	push   $0x60
  282279:	6a 64                	push   $0x64
  28227b:	e8 f6 ee ff ff       	call   281176 <io_out8>
  282280:	83 c4 10             	add    $0x10,%esp
	wait_KBC_sendready();
  282283:	e8 a9 ff ff ff       	call   282231 <wait_KBC_sendready>
	io_out8(PORT_KEYDAT, KBC_MODE);
  282288:	83 ec 08             	sub    $0x8,%esp
  28228b:	6a 47                	push   $0x47
  28228d:	6a 60                	push   $0x60
  28228f:	e8 e2 ee ff ff       	call   281176 <io_out8>
  282294:	83 c4 10             	add    $0x10,%esp
	return;
  282297:	90                   	nop
}
  282298:	c9                   	leave  
  282299:	c3                   	ret    

0028229a <inthandler2c>:
struct FIFO32 *mousefifo;
int mousedata0;

void inthandler2c(int *esp)
/* PS/2É}ÉEÉXÇ©ÇÁÇÃäÑÇËçûÇ› */
{
  28229a:	f3 0f 1e fb          	endbr32 
  28229e:	55                   	push   %ebp
  28229f:	89 e5                	mov    %esp,%ebp
  2822a1:	83 ec 18             	sub    $0x18,%esp
	int data;
	io_out8(PIC1_OCW2, 0x64);	/* IRQ-12éÛïtäÆóπÇPIC1Ç…í ím */
  2822a4:	83 ec 08             	sub    $0x8,%esp
  2822a7:	6a 64                	push   $0x64
  2822a9:	68 a0 00 00 00       	push   $0xa0
  2822ae:	e8 c3 ee ff ff       	call   281176 <io_out8>
  2822b3:	83 c4 10             	add    $0x10,%esp
	io_out8(PIC0_OCW2, 0x62);	/* IRQ-02éÛïtäÆóπÇPIC0Ç…í ím */
  2822b6:	83 ec 08             	sub    $0x8,%esp
  2822b9:	6a 62                	push   $0x62
  2822bb:	6a 20                	push   $0x20
  2822bd:	e8 b4 ee ff ff       	call   281176 <io_out8>
  2822c2:	83 c4 10             	add    $0x10,%esp
	data = io_in8(PORT_KEYDAT);
  2822c5:	83 ec 0c             	sub    $0xc,%esp
  2822c8:	6a 60                	push   $0x60
  2822ca:	e8 8a ee ff ff       	call   281159 <io_in8>
  2822cf:	83 c4 10             	add    $0x10,%esp
  2822d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	fifo32_put(mousefifo, data + mousedata0);
  2822d5:	8b 15 a8 6f 32 00    	mov    0x326fa8,%edx
  2822db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2822de:	01 c2                	add    %eax,%edx
  2822e0:	a1 ac 6f 32 00       	mov    0x326fac,%eax
  2822e5:	83 ec 08             	sub    $0x8,%esp
  2822e8:	52                   	push   %edx
  2822e9:	50                   	push   %eax
  2822ea:	e8 bc fd ff ff       	call   2820ab <fifo32_put>
  2822ef:	83 c4 10             	add    $0x10,%esp
	return;
  2822f2:	90                   	nop
}
  2822f3:	c9                   	leave  
  2822f4:	c3                   	ret    

002822f5 <enable_mouse>:

#define KEYCMD_SENDTO_MOUSE		0xd4
#define MOUSECMD_ENABLE			0xf4

void enable_mouse(struct FIFO32 *fifo, int data0, struct MOUSE_DEC *mdec)
{
  2822f5:	f3 0f 1e fb          	endbr32 
  2822f9:	55                   	push   %ebp
  2822fa:	89 e5                	mov    %esp,%ebp
  2822fc:	83 ec 08             	sub    $0x8,%esp
	/* èëÇ´çûÇ›êÊÇÃFIFOÉoÉbÉtÉ@ÇãLâØ */
	mousefifo = fifo;
  2822ff:	8b 45 08             	mov    0x8(%ebp),%eax
  282302:	a3 ac 6f 32 00       	mov    %eax,0x326fac
	mousedata0 = data0;
  282307:	8b 45 0c             	mov    0xc(%ebp),%eax
  28230a:	a3 a8 6f 32 00       	mov    %eax,0x326fa8
	/* É}ÉEÉXóLå¯ */
	wait_KBC_sendready();
  28230f:	e8 1d ff ff ff       	call   282231 <wait_KBC_sendready>
	io_out8(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE);
  282314:	83 ec 08             	sub    $0x8,%esp
  282317:	68 d4 00 00 00       	push   $0xd4
  28231c:	6a 64                	push   $0x64
  28231e:	e8 53 ee ff ff       	call   281176 <io_out8>
  282323:	83 c4 10             	add    $0x10,%esp
	wait_KBC_sendready();
  282326:	e8 06 ff ff ff       	call   282231 <wait_KBC_sendready>
	io_out8(PORT_KEYDAT, MOUSECMD_ENABLE);
  28232b:	83 ec 08             	sub    $0x8,%esp
  28232e:	68 f4 00 00 00       	push   $0xf4
  282333:	6a 60                	push   $0x60
  282335:	e8 3c ee ff ff       	call   281176 <io_out8>
  28233a:	83 c4 10             	add    $0x10,%esp
	/* Ç§Ç‹Ç≠Ç¢Ç≠Ç∆ACK(0xfa)Ç™ëóêMÇ≥ÇÍÇƒÇ≠ÇÈ */
	mdec->phase = 0; /* É}ÉEÉXÇÃ0xfaÇë“Ç¡ÇƒÇ¢ÇÈíiäK */
  28233d:	8b 45 10             	mov    0x10(%ebp),%eax
  282340:	c6 40 03 00          	movb   $0x0,0x3(%eax)
	return;
  282344:	90                   	nop
}
  282345:	c9                   	leave  
  282346:	c3                   	ret    

00282347 <mouse_decode>:

int mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat)
{
  282347:	f3 0f 1e fb          	endbr32 
  28234b:	55                   	push   %ebp
  28234c:	89 e5                	mov    %esp,%ebp
  28234e:	83 ec 04             	sub    $0x4,%esp
  282351:	8b 45 0c             	mov    0xc(%ebp),%eax
  282354:	88 45 fc             	mov    %al,-0x4(%ebp)
	if (mdec->phase == 0) {
  282357:	8b 45 08             	mov    0x8(%ebp),%eax
  28235a:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  28235e:	84 c0                	test   %al,%al
  282360:	75 17                	jne    282379 <mouse_decode+0x32>
		/* É}ÉEÉXÇÃ0xfaÇë“Ç¡ÇƒÇ¢ÇÈíiäK */
		if (dat == 0xfa) {
  282362:	80 7d fc fa          	cmpb   $0xfa,-0x4(%ebp)
  282366:	75 07                	jne    28236f <mouse_decode+0x28>
			mdec->phase = 1;
  282368:	8b 45 08             	mov    0x8(%ebp),%eax
  28236b:	c6 40 03 01          	movb   $0x1,0x3(%eax)
		}
		return 0;
  28236f:	b8 00 00 00 00       	mov    $0x0,%eax
  282374:	e9 0f 01 00 00       	jmp    282488 <mouse_decode+0x141>
	}
	if (mdec->phase == 1) {
  282379:	8b 45 08             	mov    0x8(%ebp),%eax
  28237c:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  282380:	3c 01                	cmp    $0x1,%al
  282382:	75 28                	jne    2823ac <mouse_decode+0x65>
		/* É}ÉEÉXÇÃ1ÉoÉCÉgñ⁄Çë“Ç¡ÇƒÇ¢ÇÈíiäK */
		if ((dat & 0xc8) == 0x08) {
  282384:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  282388:	25 c8 00 00 00       	and    $0xc8,%eax
  28238d:	83 f8 08             	cmp    $0x8,%eax
  282390:	75 10                	jne    2823a2 <mouse_decode+0x5b>
			/* ê≥ÇµÇ¢1ÉoÉCÉgñ⁄ÇæÇ¡ÇΩ */
			mdec->buf[0] = dat;
  282392:	8b 45 08             	mov    0x8(%ebp),%eax
  282395:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
  282399:	88 10                	mov    %dl,(%eax)
			mdec->phase = 2;
  28239b:	8b 45 08             	mov    0x8(%ebp),%eax
  28239e:	c6 40 03 02          	movb   $0x2,0x3(%eax)
		}
		return 0;
  2823a2:	b8 00 00 00 00       	mov    $0x0,%eax
  2823a7:	e9 dc 00 00 00       	jmp    282488 <mouse_decode+0x141>
	}
	if (mdec->phase == 2) {
  2823ac:	8b 45 08             	mov    0x8(%ebp),%eax
  2823af:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  2823b3:	3c 02                	cmp    $0x2,%al
  2823b5:	75 1b                	jne    2823d2 <mouse_decode+0x8b>
		/* É}ÉEÉXÇÃ2ÉoÉCÉgñ⁄Çë“Ç¡ÇƒÇ¢ÇÈíiäK */
		mdec->buf[1] = dat;
  2823b7:	8b 45 08             	mov    0x8(%ebp),%eax
  2823ba:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
  2823be:	88 50 01             	mov    %dl,0x1(%eax)
		mdec->phase = 3;
  2823c1:	8b 45 08             	mov    0x8(%ebp),%eax
  2823c4:	c6 40 03 03          	movb   $0x3,0x3(%eax)
		return 0;
  2823c8:	b8 00 00 00 00       	mov    $0x0,%eax
  2823cd:	e9 b6 00 00 00       	jmp    282488 <mouse_decode+0x141>
	}
	if (mdec->phase == 3) {
  2823d2:	8b 45 08             	mov    0x8(%ebp),%eax
  2823d5:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  2823d9:	3c 03                	cmp    $0x3,%al
  2823db:	0f 85 a2 00 00 00    	jne    282483 <mouse_decode+0x13c>
		/* É}ÉEÉXÇÃ3ÉoÉCÉgñ⁄Çë“Ç¡ÇƒÇ¢ÇÈíiäK */
		mdec->buf[2] = dat;
  2823e1:	8b 45 08             	mov    0x8(%ebp),%eax
  2823e4:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
  2823e8:	88 50 02             	mov    %dl,0x2(%eax)
		mdec->phase = 1;
  2823eb:	8b 45 08             	mov    0x8(%ebp),%eax
  2823ee:	c6 40 03 01          	movb   $0x1,0x3(%eax)
		mdec->btn = mdec->buf[0] & 0x07;
  2823f2:	8b 45 08             	mov    0x8(%ebp),%eax
  2823f5:	0f b6 00             	movzbl (%eax),%eax
  2823f8:	0f b6 c0             	movzbl %al,%eax
  2823fb:	83 e0 07             	and    $0x7,%eax
  2823fe:	89 c2                	mov    %eax,%edx
  282400:	8b 45 08             	mov    0x8(%ebp),%eax
  282403:	89 50 0c             	mov    %edx,0xc(%eax)
		mdec->x = mdec->buf[1];
  282406:	8b 45 08             	mov    0x8(%ebp),%eax
  282409:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  28240d:	0f b6 d0             	movzbl %al,%edx
  282410:	8b 45 08             	mov    0x8(%ebp),%eax
  282413:	89 50 04             	mov    %edx,0x4(%eax)
		mdec->y = mdec->buf[2];
  282416:	8b 45 08             	mov    0x8(%ebp),%eax
  282419:	0f b6 40 02          	movzbl 0x2(%eax),%eax
  28241d:	0f b6 d0             	movzbl %al,%edx
  282420:	8b 45 08             	mov    0x8(%ebp),%eax
  282423:	89 50 08             	mov    %edx,0x8(%eax)
		if ((mdec->buf[0] & 0x10) != 0) {
  282426:	8b 45 08             	mov    0x8(%ebp),%eax
  282429:	0f b6 00             	movzbl (%eax),%eax
  28242c:	0f b6 c0             	movzbl %al,%eax
  28242f:	83 e0 10             	and    $0x10,%eax
  282432:	85 c0                	test   %eax,%eax
  282434:	74 13                	je     282449 <mouse_decode+0x102>
			mdec->x |= 0xffffff00;
  282436:	8b 45 08             	mov    0x8(%ebp),%eax
  282439:	8b 40 04             	mov    0x4(%eax),%eax
  28243c:	0d 00 ff ff ff       	or     $0xffffff00,%eax
  282441:	89 c2                	mov    %eax,%edx
  282443:	8b 45 08             	mov    0x8(%ebp),%eax
  282446:	89 50 04             	mov    %edx,0x4(%eax)
		}
		if ((mdec->buf[0] & 0x20) != 0) {
  282449:	8b 45 08             	mov    0x8(%ebp),%eax
  28244c:	0f b6 00             	movzbl (%eax),%eax
  28244f:	0f b6 c0             	movzbl %al,%eax
  282452:	83 e0 20             	and    $0x20,%eax
  282455:	85 c0                	test   %eax,%eax
  282457:	74 13                	je     28246c <mouse_decode+0x125>
			mdec->y |= 0xffffff00;
  282459:	8b 45 08             	mov    0x8(%ebp),%eax
  28245c:	8b 40 08             	mov    0x8(%eax),%eax
  28245f:	0d 00 ff ff ff       	or     $0xffffff00,%eax
  282464:	89 c2                	mov    %eax,%edx
  282466:	8b 45 08             	mov    0x8(%ebp),%eax
  282469:	89 50 08             	mov    %edx,0x8(%eax)
		}
		mdec->y = - mdec->y; /* É}ÉEÉXÇ≈ÇÕyï˚å¸ÇÃïÑçÜÇ™âÊñ Ç∆îΩëŒ */
  28246c:	8b 45 08             	mov    0x8(%ebp),%eax
  28246f:	8b 40 08             	mov    0x8(%eax),%eax
  282472:	f7 d8                	neg    %eax
  282474:	89 c2                	mov    %eax,%edx
  282476:	8b 45 08             	mov    0x8(%ebp),%eax
  282479:	89 50 08             	mov    %edx,0x8(%eax)
		return 1;
  28247c:	b8 01 00 00 00       	mov    $0x1,%eax
  282481:	eb 05                	jmp    282488 <mouse_decode+0x141>
	}
	return -1; /* Ç±Ç±Ç…óàÇÈÇ±Ç∆ÇÕÇ»Ç¢ÇÕÇ∏ */
  282483:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  282488:	c9                   	leave  
  282489:	c3                   	ret    

0028248a <memtest>:

#define EFLAGS_AC_BIT		0x00040000
#define CR0_CACHE_DISABLE	0x60000000

unsigned int memtest(unsigned int start, unsigned int end)
{
  28248a:	f3 0f 1e fb          	endbr32 
  28248e:	55                   	push   %ebp
  28248f:	89 e5                	mov    %esp,%ebp
  282491:	83 ec 18             	sub    $0x18,%esp
	char flg486 = 0;
  282494:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
	unsigned int eflg, cr0, i;

	/* 386Ç©ÅA486à»ç~Ç»ÇÃÇ©ÇÃämîF */
	eflg = io_load_eflags();
  282498:	e8 f8 ec ff ff       	call   281195 <io_load_eflags>
  28249d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	eflg |= EFLAGS_AC_BIT; /* AC-bit = 1 */
  2824a0:	81 4d f0 00 00 04 00 	orl    $0x40000,-0x10(%ebp)
	io_store_eflags(eflg);
  2824a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2824aa:	83 ec 0c             	sub    $0xc,%esp
  2824ad:	50                   	push   %eax
  2824ae:	e8 e5 ec ff ff       	call   281198 <io_store_eflags>
  2824b3:	83 c4 10             	add    $0x10,%esp
	eflg = io_load_eflags();
  2824b6:	e8 da ec ff ff       	call   281195 <io_load_eflags>
  2824bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if ((eflg & EFLAGS_AC_BIT) != 0) { /* 386Ç≈ÇÕAC=1Ç…ÇµÇƒÇ‡é©ìÆÇ≈0Ç…ñﬂÇ¡ÇƒÇµÇ‹Ç§ */
  2824be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2824c1:	25 00 00 04 00       	and    $0x40000,%eax
  2824c6:	85 c0                	test   %eax,%eax
  2824c8:	74 04                	je     2824ce <memtest+0x44>
		flg486 = 1;
  2824ca:	c6 45 f7 01          	movb   $0x1,-0x9(%ebp)
	}
	eflg &= ~EFLAGS_AC_BIT; /* AC-bit = 0 */
  2824ce:	81 65 f0 ff ff fb ff 	andl   $0xfffbffff,-0x10(%ebp)
	io_store_eflags(eflg);
  2824d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2824d8:	83 ec 0c             	sub    $0xc,%esp
  2824db:	50                   	push   %eax
  2824dc:	e8 b7 ec ff ff       	call   281198 <io_store_eflags>
  2824e1:	83 c4 10             	add    $0x10,%esp

	if (flg486 != 0) {
  2824e4:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  2824e8:	74 1e                	je     282508 <memtest+0x7e>
		cr0 = load_cr0();
  2824ea:	e8 d0 ec ff ff       	call   2811bf <load_cr0>
  2824ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
		cr0 |= CR0_CACHE_DISABLE; /* ÉLÉÉÉbÉVÉÖã÷é~ */
  2824f2:	81 4d ec 00 00 00 60 	orl    $0x60000000,-0x14(%ebp)
		store_cr0(cr0);
  2824f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2824fc:	83 ec 0c             	sub    $0xc,%esp
  2824ff:	50                   	push   %eax
  282500:	e8 be ec ff ff       	call   2811c3 <store_cr0>
  282505:	83 c4 10             	add    $0x10,%esp
	}

	i = memtest_sub(start, end);
  282508:	83 ec 08             	sub    $0x8,%esp
  28250b:	ff 75 0c             	pushl  0xc(%ebp)
  28250e:	ff 75 08             	pushl  0x8(%ebp)
  282511:	e8 44 ed ff ff       	call   28125a <memtest_sub>
  282516:	83 c4 10             	add    $0x10,%esp
  282519:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (flg486 != 0) {
  28251c:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  282520:	74 1e                	je     282540 <memtest+0xb6>
		cr0 = load_cr0();
  282522:	e8 98 ec ff ff       	call   2811bf <load_cr0>
  282527:	89 45 ec             	mov    %eax,-0x14(%ebp)
		cr0 &= ~CR0_CACHE_DISABLE; /* ÉLÉÉÉbÉVÉÖãñâ¬ */
  28252a:	81 65 ec ff ff ff 9f 	andl   $0x9fffffff,-0x14(%ebp)
		store_cr0(cr0);
  282531:	8b 45 ec             	mov    -0x14(%ebp),%eax
  282534:	83 ec 0c             	sub    $0xc,%esp
  282537:	50                   	push   %eax
  282538:	e8 86 ec ff ff       	call   2811c3 <store_cr0>
  28253d:	83 c4 10             	add    $0x10,%esp
	}

	return i;
  282540:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
  282543:	c9                   	leave  
  282544:	c3                   	ret    

00282545 <memman_init>:

void memman_init(struct MEMMAN *man)
{
  282545:	f3 0f 1e fb          	endbr32 
  282549:	55                   	push   %ebp
  28254a:	89 e5                	mov    %esp,%ebp
	man->frees = 0;			/* Ç†Ç´èÓïÒÇÃå¬êî */
  28254c:	8b 45 08             	mov    0x8(%ebp),%eax
  28254f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	man->maxfrees = 0;		/* èÛãµäœé@ópÅFfreesÇÃç≈ëÂíl */
  282555:	8b 45 08             	mov    0x8(%ebp),%eax
  282558:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	man->lostsize = 0;		/* âï˙Ç…é∏îsÇµÇΩçáåvÉTÉCÉY */
  28255f:	8b 45 08             	mov    0x8(%ebp),%eax
  282562:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
	man->losts = 0;			/* âï˙Ç…é∏îsÇµÇΩâÒêî */
  282569:	8b 45 08             	mov    0x8(%ebp),%eax
  28256c:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	return;
  282573:	90                   	nop
}
  282574:	5d                   	pop    %ebp
  282575:	c3                   	ret    

00282576 <memman_total>:

unsigned int memman_total(struct MEMMAN *man)
/* Ç†Ç´ÉTÉCÉYÇÃçáåvÇïÒçê */
{
  282576:	f3 0f 1e fb          	endbr32 
  28257a:	55                   	push   %ebp
  28257b:	89 e5                	mov    %esp,%ebp
  28257d:	83 ec 10             	sub    $0x10,%esp
	unsigned int i, t = 0;
  282580:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
	for (i = 0; i < man->frees; i++) {
  282587:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  28258e:	eb 14                	jmp    2825a4 <memman_total+0x2e>
		t += man->free[i].size;
  282590:	8b 45 08             	mov    0x8(%ebp),%eax
  282593:	8b 55 fc             	mov    -0x4(%ebp),%edx
  282596:	83 c2 02             	add    $0x2,%edx
  282599:	8b 44 d0 04          	mov    0x4(%eax,%edx,8),%eax
  28259d:	01 45 f8             	add    %eax,-0x8(%ebp)
	for (i = 0; i < man->frees; i++) {
  2825a0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  2825a4:	8b 45 08             	mov    0x8(%ebp),%eax
  2825a7:	8b 00                	mov    (%eax),%eax
  2825a9:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  2825ac:	72 e2                	jb     282590 <memman_total+0x1a>
	}
	return t;
  2825ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  2825b1:	c9                   	leave  
  2825b2:	c3                   	ret    

002825b3 <memman_alloc>:

unsigned int memman_alloc(struct MEMMAN *man, unsigned int size)
/* ämï€ */
{
  2825b3:	f3 0f 1e fb          	endbr32 
  2825b7:	55                   	push   %ebp
  2825b8:	89 e5                	mov    %esp,%ebp
  2825ba:	53                   	push   %ebx
  2825bb:	83 ec 10             	sub    $0x10,%esp
	unsigned int i, a;
	for (i = 0; i < man->frees; i++) {
  2825be:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2825c5:	e9 bd 00 00 00       	jmp    282687 <memman_alloc+0xd4>
		if (man->free[i].size >= size) {
  2825ca:	8b 45 08             	mov    0x8(%ebp),%eax
  2825cd:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2825d0:	83 c2 02             	add    $0x2,%edx
  2825d3:	8b 44 d0 04          	mov    0x4(%eax,%edx,8),%eax
  2825d7:	39 45 0c             	cmp    %eax,0xc(%ebp)
  2825da:	0f 87 a3 00 00 00    	ja     282683 <memman_alloc+0xd0>
			/* è\ï™Ç»çLÇ≥ÇÃÇ†Ç´Çî≠å© */
			a = man->free[i].addr;
  2825e0:	8b 45 08             	mov    0x8(%ebp),%eax
  2825e3:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2825e6:	83 c2 02             	add    $0x2,%edx
  2825e9:	8b 04 d0             	mov    (%eax,%edx,8),%eax
  2825ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
			man->free[i].addr += size;
  2825ef:	8b 45 08             	mov    0x8(%ebp),%eax
  2825f2:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2825f5:	83 c2 02             	add    $0x2,%edx
  2825f8:	8b 14 d0             	mov    (%eax,%edx,8),%edx
  2825fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  2825fe:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  282601:	8b 45 08             	mov    0x8(%ebp),%eax
  282604:	8b 55 f8             	mov    -0x8(%ebp),%edx
  282607:	83 c2 02             	add    $0x2,%edx
  28260a:	89 0c d0             	mov    %ecx,(%eax,%edx,8)
			man->free[i].size -= size;
  28260d:	8b 45 08             	mov    0x8(%ebp),%eax
  282610:	8b 55 f8             	mov    -0x8(%ebp),%edx
  282613:	83 c2 02             	add    $0x2,%edx
  282616:	8b 44 d0 04          	mov    0x4(%eax,%edx,8),%eax
  28261a:	2b 45 0c             	sub    0xc(%ebp),%eax
  28261d:	89 c2                	mov    %eax,%edx
  28261f:	8b 45 08             	mov    0x8(%ebp),%eax
  282622:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  282625:	83 c1 02             	add    $0x2,%ecx
  282628:	89 54 c8 04          	mov    %edx,0x4(%eax,%ecx,8)
			if (man->free[i].size == 0) {
  28262c:	8b 45 08             	mov    0x8(%ebp),%eax
  28262f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  282632:	83 c2 02             	add    $0x2,%edx
  282635:	8b 44 d0 04          	mov    0x4(%eax,%edx,8),%eax
  282639:	85 c0                	test   %eax,%eax
  28263b:	75 41                	jne    28267e <memman_alloc+0xcb>
				/* free[i]Ç™Ç»Ç≠Ç»Ç¡ÇΩÇÃÇ≈ëOÇ÷Ç¬ÇﬂÇÈ */
				man->frees--;
  28263d:	8b 45 08             	mov    0x8(%ebp),%eax
  282640:	8b 00                	mov    (%eax),%eax
  282642:	8d 50 ff             	lea    -0x1(%eax),%edx
  282645:	8b 45 08             	mov    0x8(%ebp),%eax
  282648:	89 10                	mov    %edx,(%eax)
				for (; i < man->frees; i++) {
  28264a:	eb 28                	jmp    282674 <memman_alloc+0xc1>
					man->free[i] = man->free[i + 1]; /* ç\ë¢ëÃÇÃë„ì¸ */
  28264c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28264f:	8d 50 01             	lea    0x1(%eax),%edx
  282652:	8b 4d 08             	mov    0x8(%ebp),%ecx
  282655:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282658:	8d 58 02             	lea    0x2(%eax),%ebx
  28265b:	8b 45 08             	mov    0x8(%ebp),%eax
  28265e:	83 c2 02             	add    $0x2,%edx
  282661:	8d 14 d0             	lea    (%eax,%edx,8),%edx
  282664:	8b 02                	mov    (%edx),%eax
  282666:	8b 52 04             	mov    0x4(%edx),%edx
  282669:	89 04 d9             	mov    %eax,(%ecx,%ebx,8)
  28266c:	89 54 d9 04          	mov    %edx,0x4(%ecx,%ebx,8)
				for (; i < man->frees; i++) {
  282670:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  282674:	8b 45 08             	mov    0x8(%ebp),%eax
  282677:	8b 00                	mov    (%eax),%eax
  282679:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  28267c:	72 ce                	jb     28264c <memman_alloc+0x99>
				}
			}
			return a;
  28267e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  282681:	eb 17                	jmp    28269a <memman_alloc+0xe7>
	for (i = 0; i < man->frees; i++) {
  282683:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  282687:	8b 45 08             	mov    0x8(%ebp),%eax
  28268a:	8b 00                	mov    (%eax),%eax
  28268c:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  28268f:	0f 82 35 ff ff ff    	jb     2825ca <memman_alloc+0x17>
		}
	}
	return 0; /* Ç†Ç´Ç™Ç»Ç¢ */
  282695:	b8 00 00 00 00       	mov    $0x0,%eax
}
  28269a:	83 c4 10             	add    $0x10,%esp
  28269d:	5b                   	pop    %ebx
  28269e:	5d                   	pop    %ebp
  28269f:	c3                   	ret    

002826a0 <memman_free>:

int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size)
/* âï˙ */
{
  2826a0:	f3 0f 1e fb          	endbr32 
  2826a4:	55                   	push   %ebp
  2826a5:	89 e5                	mov    %esp,%ebp
  2826a7:	53                   	push   %ebx
  2826a8:	83 ec 10             	sub    $0x10,%esp
	int i, j;
	/* Ç‹Ç∆ÇﬂÇ‚Ç∑Ç≥ÇçlÇ¶ÇÈÇ∆ÅAfree[]Ç™addrèáÇ…ï¿ÇÒÇ≈Ç¢ÇÈÇŸÇ§Ç™Ç¢Ç¢ */
	/* ÇæÇ©ÇÁÇ‹Ç∏ÅAÇ«Ç±Ç…ì¸ÇÍÇÈÇ◊Ç´Ç©ÇåàÇﬂÇÈ */
	for (i = 0; i < man->frees; i++) {
  2826ab:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2826b2:	eb 15                	jmp    2826c9 <memman_free+0x29>
		if (man->free[i].addr > addr) {
  2826b4:	8b 45 08             	mov    0x8(%ebp),%eax
  2826b7:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2826ba:	83 c2 02             	add    $0x2,%edx
  2826bd:	8b 04 d0             	mov    (%eax,%edx,8),%eax
  2826c0:	39 45 0c             	cmp    %eax,0xc(%ebp)
  2826c3:	72 10                	jb     2826d5 <memman_free+0x35>
	for (i = 0; i < man->frees; i++) {
  2826c5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  2826c9:	8b 45 08             	mov    0x8(%ebp),%eax
  2826cc:	8b 00                	mov    (%eax),%eax
  2826ce:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  2826d1:	7c e1                	jl     2826b4 <memman_free+0x14>
  2826d3:	eb 01                	jmp    2826d6 <memman_free+0x36>
			break;
  2826d5:	90                   	nop
		}
	}
	/* free[i - 1].addr < addr < free[i].addr */
	if (i > 0) {
  2826d6:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  2826da:	0f 8e f2 00 00 00    	jle    2827d2 <memman_free+0x132>
		/* ëOÇ™Ç†ÇÈ */
		if (man->free[i - 1].addr + man->free[i - 1].size == addr) {
  2826e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2826e3:	8d 50 ff             	lea    -0x1(%eax),%edx
  2826e6:	8b 45 08             	mov    0x8(%ebp),%eax
  2826e9:	83 c2 02             	add    $0x2,%edx
  2826ec:	8b 14 d0             	mov    (%eax,%edx,8),%edx
  2826ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2826f2:	8d 48 ff             	lea    -0x1(%eax),%ecx
  2826f5:	8b 45 08             	mov    0x8(%ebp),%eax
  2826f8:	83 c1 02             	add    $0x2,%ecx
  2826fb:	8b 44 c8 04          	mov    0x4(%eax,%ecx,8),%eax
  2826ff:	01 d0                	add    %edx,%eax
  282701:	39 45 0c             	cmp    %eax,0xc(%ebp)
  282704:	0f 85 c8 00 00 00    	jne    2827d2 <memman_free+0x132>
			/* ëOÇÃÇ†Ç´óÃàÊÇ…Ç‹Ç∆ÇﬂÇÁÇÍÇÈ */
			man->free[i - 1].size += size;
  28270a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28270d:	8d 50 ff             	lea    -0x1(%eax),%edx
  282710:	8b 45 08             	mov    0x8(%ebp),%eax
  282713:	83 c2 02             	add    $0x2,%edx
  282716:	8b 54 d0 04          	mov    0x4(%eax,%edx,8),%edx
  28271a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28271d:	8d 58 ff             	lea    -0x1(%eax),%ebx
  282720:	8b 45 10             	mov    0x10(%ebp),%eax
  282723:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  282726:	8b 45 08             	mov    0x8(%ebp),%eax
  282729:	8d 53 02             	lea    0x2(%ebx),%edx
  28272c:	89 4c d0 04          	mov    %ecx,0x4(%eax,%edx,8)
			if (i < man->frees) {
  282730:	8b 45 08             	mov    0x8(%ebp),%eax
  282733:	8b 00                	mov    (%eax),%eax
  282735:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  282738:	0f 8d 8a 00 00 00    	jge    2827c8 <memman_free+0x128>
				/* å„ÇÎÇ‡Ç†ÇÈ */
				if (addr + size == man->free[i].addr) {
  28273e:	8b 55 0c             	mov    0xc(%ebp),%edx
  282741:	8b 45 10             	mov    0x10(%ebp),%eax
  282744:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  282747:	8b 45 08             	mov    0x8(%ebp),%eax
  28274a:	8b 55 f8             	mov    -0x8(%ebp),%edx
  28274d:	83 c2 02             	add    $0x2,%edx
  282750:	8b 04 d0             	mov    (%eax,%edx,8),%eax
  282753:	39 c1                	cmp    %eax,%ecx
  282755:	75 71                	jne    2827c8 <memman_free+0x128>
					/* Ç»ÇÒÇ∆å„ÇÎÇ∆Ç‡Ç‹Ç∆ÇﬂÇÁÇÍÇÈ */
					man->free[i - 1].size += man->free[i].size;
  282757:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28275a:	8d 50 ff             	lea    -0x1(%eax),%edx
  28275d:	8b 45 08             	mov    0x8(%ebp),%eax
  282760:	83 c2 02             	add    $0x2,%edx
  282763:	8b 54 d0 04          	mov    0x4(%eax,%edx,8),%edx
  282767:	8b 45 08             	mov    0x8(%ebp),%eax
  28276a:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  28276d:	83 c1 02             	add    $0x2,%ecx
  282770:	8b 44 c8 04          	mov    0x4(%eax,%ecx,8),%eax
  282774:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  282777:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  28277a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  28277d:	8b 45 08             	mov    0x8(%ebp),%eax
  282780:	8d 53 02             	lea    0x2(%ebx),%edx
  282783:	89 4c d0 04          	mov    %ecx,0x4(%eax,%edx,8)
					/* man->free[i]ÇÃçÌèú */
					/* free[i]Ç™Ç»Ç≠Ç»Ç¡ÇΩÇÃÇ≈ëOÇ÷Ç¬ÇﬂÇÈ */
					man->frees--;
  282787:	8b 45 08             	mov    0x8(%ebp),%eax
  28278a:	8b 00                	mov    (%eax),%eax
  28278c:	8d 50 ff             	lea    -0x1(%eax),%edx
  28278f:	8b 45 08             	mov    0x8(%ebp),%eax
  282792:	89 10                	mov    %edx,(%eax)
					for (; i < man->frees; i++) {
  282794:	eb 28                	jmp    2827be <memman_free+0x11e>
						man->free[i] = man->free[i + 1]; /* ç\ë¢ëÃÇÃë„ì¸ */
  282796:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282799:	8d 50 01             	lea    0x1(%eax),%edx
  28279c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  28279f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2827a2:	8d 58 02             	lea    0x2(%eax),%ebx
  2827a5:	8b 45 08             	mov    0x8(%ebp),%eax
  2827a8:	83 c2 02             	add    $0x2,%edx
  2827ab:	8d 14 d0             	lea    (%eax,%edx,8),%edx
  2827ae:	8b 02                	mov    (%edx),%eax
  2827b0:	8b 52 04             	mov    0x4(%edx),%edx
  2827b3:	89 04 d9             	mov    %eax,(%ecx,%ebx,8)
  2827b6:	89 54 d9 04          	mov    %edx,0x4(%ecx,%ebx,8)
					for (; i < man->frees; i++) {
  2827ba:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  2827be:	8b 45 08             	mov    0x8(%ebp),%eax
  2827c1:	8b 00                	mov    (%eax),%eax
  2827c3:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  2827c6:	7c ce                	jl     282796 <memman_free+0xf6>
					}
				}
			}
			return 0; /* ê¨å˜èIóπ */
  2827c8:	b8 00 00 00 00       	mov    $0x0,%eax
  2827cd:	e9 1c 01 00 00       	jmp    2828ee <memman_free+0x24e>
		}
	}
	/* ëOÇ∆ÇÕÇ‹Ç∆ÇﬂÇÁÇÍÇ»Ç©Ç¡ÇΩ */
	if (i < man->frees) {
  2827d2:	8b 45 08             	mov    0x8(%ebp),%eax
  2827d5:	8b 00                	mov    (%eax),%eax
  2827d7:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  2827da:	7d 52                	jge    28282e <memman_free+0x18e>
		/* å„ÇÎÇ™Ç†ÇÈ */
		if (addr + size == man->free[i].addr) {
  2827dc:	8b 55 0c             	mov    0xc(%ebp),%edx
  2827df:	8b 45 10             	mov    0x10(%ebp),%eax
  2827e2:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  2827e5:	8b 45 08             	mov    0x8(%ebp),%eax
  2827e8:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2827eb:	83 c2 02             	add    $0x2,%edx
  2827ee:	8b 04 d0             	mov    (%eax,%edx,8),%eax
  2827f1:	39 c1                	cmp    %eax,%ecx
  2827f3:	75 39                	jne    28282e <memman_free+0x18e>
			/* å„ÇÎÇ∆ÇÕÇ‹Ç∆ÇﬂÇÁÇÍÇÈ */
			man->free[i].addr = addr;
  2827f5:	8b 45 08             	mov    0x8(%ebp),%eax
  2827f8:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2827fb:	8d 4a 02             	lea    0x2(%edx),%ecx
  2827fe:	8b 55 0c             	mov    0xc(%ebp),%edx
  282801:	89 14 c8             	mov    %edx,(%eax,%ecx,8)
			man->free[i].size += size;
  282804:	8b 45 08             	mov    0x8(%ebp),%eax
  282807:	8b 55 f8             	mov    -0x8(%ebp),%edx
  28280a:	83 c2 02             	add    $0x2,%edx
  28280d:	8b 54 d0 04          	mov    0x4(%eax,%edx,8),%edx
  282811:	8b 45 10             	mov    0x10(%ebp),%eax
  282814:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  282817:	8b 45 08             	mov    0x8(%ebp),%eax
  28281a:	8b 55 f8             	mov    -0x8(%ebp),%edx
  28281d:	83 c2 02             	add    $0x2,%edx
  282820:	89 4c d0 04          	mov    %ecx,0x4(%eax,%edx,8)
			return 0; /* ê¨å˜èIóπ */
  282824:	b8 00 00 00 00       	mov    $0x0,%eax
  282829:	e9 c0 00 00 00       	jmp    2828ee <memman_free+0x24e>
		}
	}
	/* ëOÇ…Ç‡å„ÇÎÇ…Ç‡Ç‹Ç∆ÇﬂÇÁÇÍÇ»Ç¢ */
	if (man->frees < MEMMAN_FREES) {
  28282e:	8b 45 08             	mov    0x8(%ebp),%eax
  282831:	8b 00                	mov    (%eax),%eax
  282833:	3d f9 0f 00 00       	cmp    $0xff9,%eax
  282838:	0f 8f 87 00 00 00    	jg     2828c5 <memman_free+0x225>
		/* free[i]ÇÊÇËå„ÇÎÇÅAå„ÇÎÇ÷Ç∏ÇÁÇµÇƒÅAÇ∑Ç´Ç‹ÇçÏÇÈ */
		for (j = man->frees; j > i; j--) {
  28283e:	8b 45 08             	mov    0x8(%ebp),%eax
  282841:	8b 00                	mov    (%eax),%eax
  282843:	89 45 f4             	mov    %eax,-0xc(%ebp)
  282846:	eb 28                	jmp    282870 <memman_free+0x1d0>
			man->free[j] = man->free[j - 1];
  282848:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28284b:	8d 50 ff             	lea    -0x1(%eax),%edx
  28284e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  282851:	8b 45 f4             	mov    -0xc(%ebp),%eax
  282854:	8d 58 02             	lea    0x2(%eax),%ebx
  282857:	8b 45 08             	mov    0x8(%ebp),%eax
  28285a:	83 c2 02             	add    $0x2,%edx
  28285d:	8d 14 d0             	lea    (%eax,%edx,8),%edx
  282860:	8b 02                	mov    (%edx),%eax
  282862:	8b 52 04             	mov    0x4(%edx),%edx
  282865:	89 04 d9             	mov    %eax,(%ecx,%ebx,8)
  282868:	89 54 d9 04          	mov    %edx,0x4(%ecx,%ebx,8)
		for (j = man->frees; j > i; j--) {
  28286c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  282870:	8b 45 f4             	mov    -0xc(%ebp),%eax
  282873:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  282876:	7f d0                	jg     282848 <memman_free+0x1a8>
		}
		man->frees++;
  282878:	8b 45 08             	mov    0x8(%ebp),%eax
  28287b:	8b 00                	mov    (%eax),%eax
  28287d:	8d 50 01             	lea    0x1(%eax),%edx
  282880:	8b 45 08             	mov    0x8(%ebp),%eax
  282883:	89 10                	mov    %edx,(%eax)
		if (man->maxfrees < man->frees) {
  282885:	8b 45 08             	mov    0x8(%ebp),%eax
  282888:	8b 50 04             	mov    0x4(%eax),%edx
  28288b:	8b 45 08             	mov    0x8(%ebp),%eax
  28288e:	8b 00                	mov    (%eax),%eax
  282890:	39 c2                	cmp    %eax,%edx
  282892:	7d 0b                	jge    28289f <memman_free+0x1ff>
			man->maxfrees = man->frees; /* ç≈ëÂílÇçXêV */
  282894:	8b 45 08             	mov    0x8(%ebp),%eax
  282897:	8b 10                	mov    (%eax),%edx
  282899:	8b 45 08             	mov    0x8(%ebp),%eax
  28289c:	89 50 04             	mov    %edx,0x4(%eax)
		}
		man->free[i].addr = addr;
  28289f:	8b 45 08             	mov    0x8(%ebp),%eax
  2828a2:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2828a5:	8d 4a 02             	lea    0x2(%edx),%ecx
  2828a8:	8b 55 0c             	mov    0xc(%ebp),%edx
  2828ab:	89 14 c8             	mov    %edx,(%eax,%ecx,8)
		man->free[i].size = size;
  2828ae:	8b 45 08             	mov    0x8(%ebp),%eax
  2828b1:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2828b4:	8d 4a 02             	lea    0x2(%edx),%ecx
  2828b7:	8b 55 10             	mov    0x10(%ebp),%edx
  2828ba:	89 54 c8 04          	mov    %edx,0x4(%eax,%ecx,8)
		return 0; /* ê¨å˜èIóπ */
  2828be:	b8 00 00 00 00       	mov    $0x0,%eax
  2828c3:	eb 29                	jmp    2828ee <memman_free+0x24e>
	}
	/* å„ÇÎÇ…Ç∏ÇÁÇπÇ»Ç©Ç¡ÇΩ */
	man->losts++;
  2828c5:	8b 45 08             	mov    0x8(%ebp),%eax
  2828c8:	8b 40 0c             	mov    0xc(%eax),%eax
  2828cb:	8d 50 01             	lea    0x1(%eax),%edx
  2828ce:	8b 45 08             	mov    0x8(%ebp),%eax
  2828d1:	89 50 0c             	mov    %edx,0xc(%eax)
	man->lostsize += size;
  2828d4:	8b 45 08             	mov    0x8(%ebp),%eax
  2828d7:	8b 40 08             	mov    0x8(%eax),%eax
  2828da:	89 c2                	mov    %eax,%edx
  2828dc:	8b 45 10             	mov    0x10(%ebp),%eax
  2828df:	01 d0                	add    %edx,%eax
  2828e1:	89 c2                	mov    %eax,%edx
  2828e3:	8b 45 08             	mov    0x8(%ebp),%eax
  2828e6:	89 50 08             	mov    %edx,0x8(%eax)
	return -1; /* é∏îsèIóπ */
  2828e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  2828ee:	83 c4 10             	add    $0x10,%esp
  2828f1:	5b                   	pop    %ebx
  2828f2:	5d                   	pop    %ebp
  2828f3:	c3                   	ret    

002828f4 <memman_alloc_4k>:

unsigned int memman_alloc_4k(struct MEMMAN *man, unsigned int size)
{
  2828f4:	f3 0f 1e fb          	endbr32 
  2828f8:	55                   	push   %ebp
  2828f9:	89 e5                	mov    %esp,%ebp
  2828fb:	83 ec 10             	sub    $0x10,%esp
	unsigned int a;
	size = (size + 0xfff) & 0xfffff000;
  2828fe:	8b 45 0c             	mov    0xc(%ebp),%eax
  282901:	05 ff 0f 00 00       	add    $0xfff,%eax
  282906:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  28290b:	89 45 0c             	mov    %eax,0xc(%ebp)
	a = memman_alloc(man, size);
  28290e:	ff 75 0c             	pushl  0xc(%ebp)
  282911:	ff 75 08             	pushl  0x8(%ebp)
  282914:	e8 9a fc ff ff       	call   2825b3 <memman_alloc>
  282919:	83 c4 08             	add    $0x8,%esp
  28291c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return a;
  28291f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  282922:	c9                   	leave  
  282923:	c3                   	ret    

00282924 <memman_free_4k>:

int memman_free_4k(struct MEMMAN *man, unsigned int addr, unsigned int size)
{
  282924:	f3 0f 1e fb          	endbr32 
  282928:	55                   	push   %ebp
  282929:	89 e5                	mov    %esp,%ebp
  28292b:	83 ec 10             	sub    $0x10,%esp
	int i;
	size = (size + 0xfff) & 0xfffff000;
  28292e:	8b 45 10             	mov    0x10(%ebp),%eax
  282931:	05 ff 0f 00 00       	add    $0xfff,%eax
  282936:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  28293b:	89 45 10             	mov    %eax,0x10(%ebp)
	i = memman_free(man, addr, size);
  28293e:	ff 75 10             	pushl  0x10(%ebp)
  282941:	ff 75 0c             	pushl  0xc(%ebp)
  282944:	ff 75 08             	pushl  0x8(%ebp)
  282947:	e8 54 fd ff ff       	call   2826a0 <memman_free>
  28294c:	83 c4 0c             	add    $0xc,%esp
  28294f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return i;
  282952:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  282955:	c9                   	leave  
  282956:	c3                   	ret    

00282957 <shtctl_init>:
#include "bootpack.h"

#define SHEET_USE		1

struct SHTCTL *shtctl_init(struct MEMMAN *memman, unsigned char *vram, int xsize, int ysize)
{
  282957:	f3 0f 1e fb          	endbr32 
  28295b:	55                   	push   %ebp
  28295c:	89 e5                	mov    %esp,%ebp
  28295e:	83 ec 18             	sub    $0x18,%esp
	struct SHTCTL *ctl;
	int i;
	ctl = (struct SHTCTL *) memman_alloc_4k(memman, sizeof (struct SHTCTL));
  282961:	83 ec 08             	sub    $0x8,%esp
  282964:	68 14 2c 00 00       	push   $0x2c14
  282969:	ff 75 08             	pushl  0x8(%ebp)
  28296c:	e8 83 ff ff ff       	call   2828f4 <memman_alloc_4k>
  282971:	83 c4 10             	add    $0x10,%esp
  282974:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (ctl == 0) {
  282977:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  28297b:	0f 84 b7 00 00 00    	je     282a38 <shtctl_init+0xe1>
		goto err;
	}
	ctl->map = (unsigned char *) memman_alloc_4k(memman, xsize * ysize);
  282981:	8b 45 10             	mov    0x10(%ebp),%eax
  282984:	0f af 45 14          	imul   0x14(%ebp),%eax
  282988:	83 ec 08             	sub    $0x8,%esp
  28298b:	50                   	push   %eax
  28298c:	ff 75 08             	pushl  0x8(%ebp)
  28298f:	e8 60 ff ff ff       	call   2828f4 <memman_alloc_4k>
  282994:	83 c4 10             	add    $0x10,%esp
  282997:	89 c2                	mov    %eax,%edx
  282999:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28299c:	89 50 04             	mov    %edx,0x4(%eax)
	if (ctl->map == 0) {
  28299f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2829a2:	8b 40 04             	mov    0x4(%eax),%eax
  2829a5:	85 c0                	test   %eax,%eax
  2829a7:	75 19                	jne    2829c2 <shtctl_init+0x6b>
		memman_free_4k(memman, (int) ctl, sizeof (struct SHTCTL));
  2829a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2829ac:	83 ec 04             	sub    $0x4,%esp
  2829af:	68 14 2c 00 00       	push   $0x2c14
  2829b4:	50                   	push   %eax
  2829b5:	ff 75 08             	pushl  0x8(%ebp)
  2829b8:	e8 67 ff ff ff       	call   282924 <memman_free_4k>
  2829bd:	83 c4 10             	add    $0x10,%esp
		goto err;
  2829c0:	eb 77                	jmp    282a39 <shtctl_init+0xe2>
	}
	ctl->vram = vram;
  2829c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2829c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  2829c8:	89 10                	mov    %edx,(%eax)
	ctl->xsize = xsize;
  2829ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2829cd:	8b 55 10             	mov    0x10(%ebp),%edx
  2829d0:	89 50 08             	mov    %edx,0x8(%eax)
	ctl->ysize = ysize;
  2829d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2829d6:	8b 55 14             	mov    0x14(%ebp),%edx
  2829d9:	89 50 0c             	mov    %edx,0xc(%eax)
	ctl->top = -1; /* ÉVÅ[ÉgÇÕàÍñáÇ‡Ç»Ç¢ */
  2829dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2829df:	c7 40 10 ff ff ff ff 	movl   $0xffffffff,0x10(%eax)
	for (i = 0; i < MAX_SHEETS; i++) {
  2829e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2829ed:	eb 3e                	jmp    282a2d <shtctl_init+0xd6>
		ctl->sheets0[i].flags = 0; /* ñ¢égópÉ}Å[ÉN */
  2829ef:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2829f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2829f5:	89 d0                	mov    %edx,%eax
  2829f7:	c1 e0 02             	shl    $0x2,%eax
  2829fa:	01 d0                	add    %edx,%eax
  2829fc:	c1 e0 03             	shl    $0x3,%eax
  2829ff:	01 c8                	add    %ecx,%eax
  282a01:	05 30 04 00 00       	add    $0x430,%eax
  282a06:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		ctl->sheets0[i].ctl = ctl; /* èäëÆÇãLò^ */
  282a0c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  282a0f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  282a12:	89 d0                	mov    %edx,%eax
  282a14:	c1 e0 02             	shl    $0x2,%eax
  282a17:	01 d0                	add    %edx,%eax
  282a19:	c1 e0 03             	shl    $0x3,%eax
  282a1c:	01 c8                	add    %ecx,%eax
  282a1e:	8d 90 34 04 00 00    	lea    0x434(%eax),%edx
  282a24:	8b 45 f0             	mov    -0x10(%ebp),%eax
  282a27:	89 02                	mov    %eax,(%edx)
	for (i = 0; i < MAX_SHEETS; i++) {
  282a29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  282a2d:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
  282a34:	7e b9                	jle    2829ef <shtctl_init+0x98>
	}
err:
  282a36:	eb 01                	jmp    282a39 <shtctl_init+0xe2>
		goto err;
  282a38:	90                   	nop
	return ctl;
  282a39:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  282a3c:	c9                   	leave  
  282a3d:	c3                   	ret    

00282a3e <sheet_alloc>:

struct SHEET *sheet_alloc(struct SHTCTL *ctl)
{
  282a3e:	f3 0f 1e fb          	endbr32 
  282a42:	55                   	push   %ebp
  282a43:	89 e5                	mov    %esp,%ebp
  282a45:	83 ec 10             	sub    $0x10,%esp
	struct SHEET *sht;
	int i;
	for (i = 0; i < MAX_SHEETS; i++) {
  282a48:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  282a4f:	eb 62                	jmp    282ab3 <sheet_alloc+0x75>
		if (ctl->sheets0[i].flags == 0) {
  282a51:	8b 4d 08             	mov    0x8(%ebp),%ecx
  282a54:	8b 55 fc             	mov    -0x4(%ebp),%edx
  282a57:	89 d0                	mov    %edx,%eax
  282a59:	c1 e0 02             	shl    $0x2,%eax
  282a5c:	01 d0                	add    %edx,%eax
  282a5e:	c1 e0 03             	shl    $0x3,%eax
  282a61:	01 c8                	add    %ecx,%eax
  282a63:	05 30 04 00 00       	add    $0x430,%eax
  282a68:	8b 00                	mov    (%eax),%eax
  282a6a:	85 c0                	test   %eax,%eax
  282a6c:	75 41                	jne    282aaf <sheet_alloc+0x71>
			sht = &ctl->sheets0[i];
  282a6e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  282a71:	89 d0                	mov    %edx,%eax
  282a73:	c1 e0 02             	shl    $0x2,%eax
  282a76:	01 d0                	add    %edx,%eax
  282a78:	c1 e0 03             	shl    $0x3,%eax
  282a7b:	8d 90 10 04 00 00    	lea    0x410(%eax),%edx
  282a81:	8b 45 08             	mov    0x8(%ebp),%eax
  282a84:	01 d0                	add    %edx,%eax
  282a86:	83 c0 04             	add    $0x4,%eax
  282a89:	89 45 f8             	mov    %eax,-0x8(%ebp)
			sht->flags = SHEET_USE; /* égópíÜÉ}Å[ÉN */
  282a8c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282a8f:	c7 40 1c 01 00 00 00 	movl   $0x1,0x1c(%eax)
			sht->height = -1; /* îÒï\é¶íÜ */
  282a96:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282a99:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%eax)
			sht->task = 0;	/* é©ìÆÇ≈ï¬Ç∂ÇÈã@î\ÇégÇÌÇ»Ç¢ */
  282aa0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282aa3:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
			return sht;
  282aaa:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282aad:	eb 12                	jmp    282ac1 <sheet_alloc+0x83>
	for (i = 0; i < MAX_SHEETS; i++) {
  282aaf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  282ab3:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  282aba:	7e 95                	jle    282a51 <sheet_alloc+0x13>
		}
	}
	return 0;	/* ëSÇƒÇÃÉVÅ[ÉgÇ™égópíÜÇæÇ¡ÇΩ */
  282abc:	b8 00 00 00 00       	mov    $0x0,%eax
}
  282ac1:	c9                   	leave  
  282ac2:	c3                   	ret    

00282ac3 <sheet_setbuf>:

void sheet_setbuf(struct SHEET *sht, unsigned char *buf, int xsize, int ysize, int col_inv)
{
  282ac3:	f3 0f 1e fb          	endbr32 
  282ac7:	55                   	push   %ebp
  282ac8:	89 e5                	mov    %esp,%ebp
	sht->buf = buf;
  282aca:	8b 45 08             	mov    0x8(%ebp),%eax
  282acd:	8b 55 0c             	mov    0xc(%ebp),%edx
  282ad0:	89 10                	mov    %edx,(%eax)
	sht->bxsize = xsize;
  282ad2:	8b 45 08             	mov    0x8(%ebp),%eax
  282ad5:	8b 55 10             	mov    0x10(%ebp),%edx
  282ad8:	89 50 04             	mov    %edx,0x4(%eax)
	sht->bysize = ysize;
  282adb:	8b 45 08             	mov    0x8(%ebp),%eax
  282ade:	8b 55 14             	mov    0x14(%ebp),%edx
  282ae1:	89 50 08             	mov    %edx,0x8(%eax)
	sht->col_inv = col_inv;
  282ae4:	8b 45 08             	mov    0x8(%ebp),%eax
  282ae7:	8b 55 18             	mov    0x18(%ebp),%edx
  282aea:	89 50 14             	mov    %edx,0x14(%eax)
	return;
  282aed:	90                   	nop
}
  282aee:	5d                   	pop    %ebp
  282aef:	c3                   	ret    

00282af0 <sheet_refreshmap>:

void sheet_refreshmap(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1, int h0)
{
  282af0:	f3 0f 1e fb          	endbr32 
  282af4:	55                   	push   %ebp
  282af5:	89 e5                	mov    %esp,%ebp
  282af7:	83 ec 40             	sub    $0x40,%esp
	int h, bx, by, vx, vy, bx0, by0, bx1, by1, sid4, *p;
	unsigned char *buf, sid, *map = ctl->map;
  282afa:	8b 45 08             	mov    0x8(%ebp),%eax
  282afd:	8b 40 04             	mov    0x4(%eax),%eax
  282b00:	89 45 e0             	mov    %eax,-0x20(%ebp)
	struct SHEET *sht;
	if (vx0 < 0) { vx0 = 0; }
  282b03:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  282b07:	79 07                	jns    282b10 <sheet_refreshmap+0x20>
  282b09:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
	if (vy0 < 0) { vy0 = 0; }
  282b10:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  282b14:	79 07                	jns    282b1d <sheet_refreshmap+0x2d>
  282b16:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
	if (vx1 > ctl->xsize) { vx1 = ctl->xsize; }
  282b1d:	8b 45 08             	mov    0x8(%ebp),%eax
  282b20:	8b 40 08             	mov    0x8(%eax),%eax
  282b23:	39 45 14             	cmp    %eax,0x14(%ebp)
  282b26:	7e 09                	jle    282b31 <sheet_refreshmap+0x41>
  282b28:	8b 45 08             	mov    0x8(%ebp),%eax
  282b2b:	8b 40 08             	mov    0x8(%eax),%eax
  282b2e:	89 45 14             	mov    %eax,0x14(%ebp)
	if (vy1 > ctl->ysize) { vy1 = ctl->ysize; }
  282b31:	8b 45 08             	mov    0x8(%ebp),%eax
  282b34:	8b 40 0c             	mov    0xc(%eax),%eax
  282b37:	39 45 18             	cmp    %eax,0x18(%ebp)
  282b3a:	7e 09                	jle    282b45 <sheet_refreshmap+0x55>
  282b3c:	8b 45 08             	mov    0x8(%ebp),%eax
  282b3f:	8b 40 0c             	mov    0xc(%eax),%eax
  282b42:	89 45 18             	mov    %eax,0x18(%ebp)
	for (h = h0; h <= ctl->top; h++) {
  282b45:	8b 45 1c             	mov    0x1c(%ebp),%eax
  282b48:	89 45 fc             	mov    %eax,-0x4(%ebp)
  282b4b:	e9 98 02 00 00       	jmp    282de8 <sheet_refreshmap+0x2f8>
		sht = ctl->sheets[h];
  282b50:	8b 45 08             	mov    0x8(%ebp),%eax
  282b53:	8b 55 fc             	mov    -0x4(%ebp),%edx
  282b56:	83 c2 04             	add    $0x4,%edx
  282b59:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  282b5d:	89 45 dc             	mov    %eax,-0x24(%ebp)
		sid = sht - ctl->sheets0; /* î‘ínÇà¯Ç´éZÇµÇƒÇªÇÍÇâ∫Ç∂Ç´î‘çÜÇ∆ÇµÇƒóòóp */
  282b60:	8b 45 08             	mov    0x8(%ebp),%eax
  282b63:	8d 90 14 04 00 00    	lea    0x414(%eax),%edx
  282b69:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282b6c:	29 d0                	sub    %edx,%eax
  282b6e:	c1 f8 03             	sar    $0x3,%eax
  282b71:	69 c0 cd cc cc cc    	imul   $0xcccccccd,%eax,%eax
  282b77:	88 45 db             	mov    %al,-0x25(%ebp)
		buf = sht->buf;
  282b7a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282b7d:	8b 00                	mov    (%eax),%eax
  282b7f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
		bx0 = vx0 - sht->vx0;
  282b82:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282b85:	8b 40 0c             	mov    0xc(%eax),%eax
  282b88:	8b 55 0c             	mov    0xc(%ebp),%edx
  282b8b:	29 c2                	sub    %eax,%edx
  282b8d:	89 d0                	mov    %edx,%eax
  282b8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
		by0 = vy0 - sht->vy0;
  282b92:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282b95:	8b 40 10             	mov    0x10(%eax),%eax
  282b98:	8b 55 10             	mov    0x10(%ebp),%edx
  282b9b:	29 c2                	sub    %eax,%edx
  282b9d:	89 d0                	mov    %edx,%eax
  282b9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
		bx1 = vx1 - sht->vx0;
  282ba2:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282ba5:	8b 40 0c             	mov    0xc(%eax),%eax
  282ba8:	8b 55 14             	mov    0x14(%ebp),%edx
  282bab:	29 c2                	sub    %eax,%edx
  282bad:	89 d0                	mov    %edx,%eax
  282baf:	89 45 e8             	mov    %eax,-0x18(%ebp)
		by1 = vy1 - sht->vy0;
  282bb2:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282bb5:	8b 40 10             	mov    0x10(%eax),%eax
  282bb8:	8b 55 18             	mov    0x18(%ebp),%edx
  282bbb:	29 c2                	sub    %eax,%edx
  282bbd:	89 d0                	mov    %edx,%eax
  282bbf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		if (bx0 < 0) { bx0 = 0; }
  282bc2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  282bc6:	79 07                	jns    282bcf <sheet_refreshmap+0xdf>
  282bc8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		if (by0 < 0) { by0 = 0; }
  282bcf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  282bd3:	79 07                	jns    282bdc <sheet_refreshmap+0xec>
  282bd5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		if (bx1 > sht->bxsize) { bx1 = sht->bxsize; }
  282bdc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282bdf:	8b 40 04             	mov    0x4(%eax),%eax
  282be2:	39 45 e8             	cmp    %eax,-0x18(%ebp)
  282be5:	7e 09                	jle    282bf0 <sheet_refreshmap+0x100>
  282be7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282bea:	8b 40 04             	mov    0x4(%eax),%eax
  282bed:	89 45 e8             	mov    %eax,-0x18(%ebp)
		if (by1 > sht->bysize) { by1 = sht->bysize; }
  282bf0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282bf3:	8b 40 08             	mov    0x8(%eax),%eax
  282bf6:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
  282bf9:	7e 09                	jle    282c04 <sheet_refreshmap+0x114>
  282bfb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282bfe:	8b 40 08             	mov    0x8(%eax),%eax
  282c01:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		if (sht->col_inv == -1) {
  282c04:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282c07:	8b 40 14             	mov    0x14(%eax),%eax
  282c0a:	83 f8 ff             	cmp    $0xffffffff,%eax
  282c0d:	0f 85 43 01 00 00    	jne    282d56 <sheet_refreshmap+0x266>
			if ((sht->vx0 & 3) == 0 && (bx0 & 3) == 0 && (bx1 & 3) == 0) {
  282c13:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282c16:	8b 40 0c             	mov    0xc(%eax),%eax
  282c19:	83 e0 03             	and    $0x3,%eax
  282c1c:	85 c0                	test   %eax,%eax
  282c1e:	0f 85 cb 00 00 00    	jne    282cef <sheet_refreshmap+0x1ff>
  282c24:	8b 45 f0             	mov    -0x10(%ebp),%eax
  282c27:	83 e0 03             	and    $0x3,%eax
  282c2a:	85 c0                	test   %eax,%eax
  282c2c:	0f 85 bd 00 00 00    	jne    282cef <sheet_refreshmap+0x1ff>
  282c32:	8b 45 e8             	mov    -0x18(%ebp),%eax
  282c35:	83 e0 03             	and    $0x3,%eax
  282c38:	85 c0                	test   %eax,%eax
  282c3a:	0f 85 af 00 00 00    	jne    282cef <sheet_refreshmap+0x1ff>
				/* ìßñæêFÇ»ÇµêÍópÇÃçÇë¨î≈Åi4ÉoÉCÉgå^Åj */
				bx1 = (bx1 - bx0) / 4; /* MOVâÒêî */
  282c40:	8b 45 e8             	mov    -0x18(%ebp),%eax
  282c43:	2b 45 f0             	sub    -0x10(%ebp),%eax
  282c46:	8d 50 03             	lea    0x3(%eax),%edx
  282c49:	85 c0                	test   %eax,%eax
  282c4b:	0f 48 c2             	cmovs  %edx,%eax
  282c4e:	c1 f8 02             	sar    $0x2,%eax
  282c51:	89 45 e8             	mov    %eax,-0x18(%ebp)
				sid4 = sid | sid << 8 | sid << 16 | sid << 24;
  282c54:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  282c58:	0f b6 55 db          	movzbl -0x25(%ebp),%edx
  282c5c:	c1 e2 08             	shl    $0x8,%edx
  282c5f:	09 c2                	or     %eax,%edx
  282c61:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  282c65:	c1 e0 10             	shl    $0x10,%eax
  282c68:	09 c2                	or     %eax,%edx
  282c6a:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  282c6e:	c1 e0 18             	shl    $0x18,%eax
  282c71:	09 d0                	or     %edx,%eax
  282c73:	89 45 c8             	mov    %eax,-0x38(%ebp)
				for (by = by0; by < by1; by++) {
  282c76:	8b 45 ec             	mov    -0x14(%ebp),%eax
  282c79:	89 45 f4             	mov    %eax,-0xc(%ebp)
  282c7c:	eb 64                	jmp    282ce2 <sheet_refreshmap+0x1f2>
					vy = sht->vy0 + by;
  282c7e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282c81:	8b 50 10             	mov    0x10(%eax),%edx
  282c84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  282c87:	01 d0                	add    %edx,%eax
  282c89:	89 45 d0             	mov    %eax,-0x30(%ebp)
					vx = sht->vx0 + bx0;
  282c8c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282c8f:	8b 50 0c             	mov    0xc(%eax),%edx
  282c92:	8b 45 f0             	mov    -0x10(%ebp),%eax
  282c95:	01 d0                	add    %edx,%eax
  282c97:	89 45 cc             	mov    %eax,-0x34(%ebp)
					p = (int *) &map[vy * ctl->xsize + vx];
  282c9a:	8b 45 08             	mov    0x8(%ebp),%eax
  282c9d:	8b 40 08             	mov    0x8(%eax),%eax
  282ca0:	0f af 45 d0          	imul   -0x30(%ebp),%eax
  282ca4:	89 c2                	mov    %eax,%edx
  282ca6:	8b 45 cc             	mov    -0x34(%ebp),%eax
  282ca9:	01 d0                	add    %edx,%eax
  282cab:	89 c2                	mov    %eax,%edx
  282cad:	8b 45 e0             	mov    -0x20(%ebp),%eax
  282cb0:	01 d0                	add    %edx,%eax
  282cb2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
					for (bx = 0; bx < bx1; bx++) {
  282cb5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  282cbc:	eb 18                	jmp    282cd6 <sheet_refreshmap+0x1e6>
						p[bx] = sid4;
  282cbe:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282cc1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  282cc8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  282ccb:	01 c2                	add    %eax,%edx
  282ccd:	8b 45 c8             	mov    -0x38(%ebp),%eax
  282cd0:	89 02                	mov    %eax,(%edx)
					for (bx = 0; bx < bx1; bx++) {
  282cd2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  282cd6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282cd9:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  282cdc:	7c e0                	jl     282cbe <sheet_refreshmap+0x1ce>
				for (by = by0; by < by1; by++) {
  282cde:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  282ce2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  282ce5:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  282ce8:	7c 94                	jl     282c7e <sheet_refreshmap+0x18e>
			if ((sht->vx0 & 3) == 0 && (bx0 & 3) == 0 && (bx1 & 3) == 0) {
  282cea:	e9 f5 00 00 00       	jmp    282de4 <sheet_refreshmap+0x2f4>
					}
				}
			} else {
				/* ìßñæêFÇ»ÇµêÍópÇÃçÇë¨î≈Åi1ÉoÉCÉgå^Åj */
				for (by = by0; by < by1; by++) {
  282cef:	8b 45 ec             	mov    -0x14(%ebp),%eax
  282cf2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  282cf5:	eb 52                	jmp    282d49 <sheet_refreshmap+0x259>
					vy = sht->vy0 + by;
  282cf7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282cfa:	8b 50 10             	mov    0x10(%eax),%edx
  282cfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  282d00:	01 d0                	add    %edx,%eax
  282d02:	89 45 d0             	mov    %eax,-0x30(%ebp)
					for (bx = bx0; bx < bx1; bx++) {
  282d05:	8b 45 f0             	mov    -0x10(%ebp),%eax
  282d08:	89 45 f8             	mov    %eax,-0x8(%ebp)
  282d0b:	eb 30                	jmp    282d3d <sheet_refreshmap+0x24d>
						vx = sht->vx0 + bx;
  282d0d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282d10:	8b 50 0c             	mov    0xc(%eax),%edx
  282d13:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282d16:	01 d0                	add    %edx,%eax
  282d18:	89 45 cc             	mov    %eax,-0x34(%ebp)
						map[vy * ctl->xsize + vx] = sid;
  282d1b:	8b 45 08             	mov    0x8(%ebp),%eax
  282d1e:	8b 40 08             	mov    0x8(%eax),%eax
  282d21:	0f af 45 d0          	imul   -0x30(%ebp),%eax
  282d25:	89 c2                	mov    %eax,%edx
  282d27:	8b 45 cc             	mov    -0x34(%ebp),%eax
  282d2a:	01 d0                	add    %edx,%eax
  282d2c:	89 c2                	mov    %eax,%edx
  282d2e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  282d31:	01 c2                	add    %eax,%edx
  282d33:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  282d37:	88 02                	mov    %al,(%edx)
					for (bx = bx0; bx < bx1; bx++) {
  282d39:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  282d3d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282d40:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  282d43:	7c c8                	jl     282d0d <sheet_refreshmap+0x21d>
				for (by = by0; by < by1; by++) {
  282d45:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  282d49:	8b 45 f4             	mov    -0xc(%ebp),%eax
  282d4c:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  282d4f:	7c a6                	jl     282cf7 <sheet_refreshmap+0x207>
  282d51:	e9 8e 00 00 00       	jmp    282de4 <sheet_refreshmap+0x2f4>
					}
				}
			}
		} else {
			/* ìßñæêFÇ†ÇËÇÃàÍî î≈ */
			for (by = by0; by < by1; by++) {
  282d56:	8b 45 ec             	mov    -0x14(%ebp),%eax
  282d59:	89 45 f4             	mov    %eax,-0xc(%ebp)
  282d5c:	eb 7a                	jmp    282dd8 <sheet_refreshmap+0x2e8>
				vy = sht->vy0 + by;
  282d5e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282d61:	8b 50 10             	mov    0x10(%eax),%edx
  282d64:	8b 45 f4             	mov    -0xc(%ebp),%eax
  282d67:	01 d0                	add    %edx,%eax
  282d69:	89 45 d0             	mov    %eax,-0x30(%ebp)
				for (bx = bx0; bx < bx1; bx++) {
  282d6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  282d6f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  282d72:	eb 58                	jmp    282dcc <sheet_refreshmap+0x2dc>
					vx = sht->vx0 + bx;
  282d74:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282d77:	8b 50 0c             	mov    0xc(%eax),%edx
  282d7a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282d7d:	01 d0                	add    %edx,%eax
  282d7f:	89 45 cc             	mov    %eax,-0x34(%ebp)
					if (buf[by * sht->bxsize + bx] != sht->col_inv) {
  282d82:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282d85:	8b 40 04             	mov    0x4(%eax),%eax
  282d88:	0f af 45 f4          	imul   -0xc(%ebp),%eax
  282d8c:	89 c2                	mov    %eax,%edx
  282d8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282d91:	01 d0                	add    %edx,%eax
  282d93:	89 c2                	mov    %eax,%edx
  282d95:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282d98:	01 d0                	add    %edx,%eax
  282d9a:	0f b6 00             	movzbl (%eax),%eax
  282d9d:	0f b6 d0             	movzbl %al,%edx
  282da0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282da3:	8b 40 14             	mov    0x14(%eax),%eax
  282da6:	39 c2                	cmp    %eax,%edx
  282da8:	74 1e                	je     282dc8 <sheet_refreshmap+0x2d8>
						map[vy * ctl->xsize + vx] = sid;
  282daa:	8b 45 08             	mov    0x8(%ebp),%eax
  282dad:	8b 40 08             	mov    0x8(%eax),%eax
  282db0:	0f af 45 d0          	imul   -0x30(%ebp),%eax
  282db4:	89 c2                	mov    %eax,%edx
  282db6:	8b 45 cc             	mov    -0x34(%ebp),%eax
  282db9:	01 d0                	add    %edx,%eax
  282dbb:	89 c2                	mov    %eax,%edx
  282dbd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  282dc0:	01 c2                	add    %eax,%edx
  282dc2:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  282dc6:	88 02                	mov    %al,(%edx)
				for (bx = bx0; bx < bx1; bx++) {
  282dc8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  282dcc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282dcf:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  282dd2:	7c a0                	jl     282d74 <sheet_refreshmap+0x284>
			for (by = by0; by < by1; by++) {
  282dd4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  282dd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  282ddb:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  282dde:	0f 8c 7a ff ff ff    	jl     282d5e <sheet_refreshmap+0x26e>
	for (h = h0; h <= ctl->top; h++) {
  282de4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  282de8:	8b 45 08             	mov    0x8(%ebp),%eax
  282deb:	8b 40 10             	mov    0x10(%eax),%eax
  282dee:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  282df1:	0f 8e 59 fd ff ff    	jle    282b50 <sheet_refreshmap+0x60>
					}
				}
			}
		}
	}
	return;
  282df7:	90                   	nop
}
  282df8:	c9                   	leave  
  282df9:	c3                   	ret    

00282dfa <sheet_refreshsub>:

void sheet_refreshsub(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1, int h0, int h1)
{
  282dfa:	f3 0f 1e fb          	endbr32 
  282dfe:	55                   	push   %ebp
  282dff:	89 e5                	mov    %esp,%ebp
  282e01:	83 ec 60             	sub    $0x60,%esp
	int h, bx, by, vx, vy, bx0, by0, bx1, by1, bx2, sid4, i, i1, *p, *q, *r;
	unsigned char *buf, *vram = ctl->vram, *map = ctl->map, sid;
  282e04:	8b 45 08             	mov    0x8(%ebp),%eax
  282e07:	8b 00                	mov    (%eax),%eax
  282e09:	89 45 dc             	mov    %eax,-0x24(%ebp)
  282e0c:	8b 45 08             	mov    0x8(%ebp),%eax
  282e0f:	8b 40 04             	mov    0x4(%eax),%eax
  282e12:	89 45 d8             	mov    %eax,-0x28(%ebp)
	struct SHEET *sht;
	/* refreshîÕàÕÇ™âÊñ äOÇ…ÇÕÇ›èoÇµÇƒÇ¢ÇΩÇÁï‚ê≥ */
	if (vx0 < 0) { vx0 = 0; }
  282e15:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  282e19:	79 07                	jns    282e22 <sheet_refreshsub+0x28>
  282e1b:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
	if (vy0 < 0) { vy0 = 0; }
  282e22:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  282e26:	79 07                	jns    282e2f <sheet_refreshsub+0x35>
  282e28:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
	if (vx1 > ctl->xsize) { vx1 = ctl->xsize; }
  282e2f:	8b 45 08             	mov    0x8(%ebp),%eax
  282e32:	8b 40 08             	mov    0x8(%eax),%eax
  282e35:	39 45 14             	cmp    %eax,0x14(%ebp)
  282e38:	7e 09                	jle    282e43 <sheet_refreshsub+0x49>
  282e3a:	8b 45 08             	mov    0x8(%ebp),%eax
  282e3d:	8b 40 08             	mov    0x8(%eax),%eax
  282e40:	89 45 14             	mov    %eax,0x14(%ebp)
	if (vy1 > ctl->ysize) { vy1 = ctl->ysize; }
  282e43:	8b 45 08             	mov    0x8(%ebp),%eax
  282e46:	8b 40 0c             	mov    0xc(%eax),%eax
  282e49:	39 45 18             	cmp    %eax,0x18(%ebp)
  282e4c:	7e 09                	jle    282e57 <sheet_refreshsub+0x5d>
  282e4e:	8b 45 08             	mov    0x8(%ebp),%eax
  282e51:	8b 40 0c             	mov    0xc(%eax),%eax
  282e54:	89 45 18             	mov    %eax,0x18(%ebp)
	for (h = h0; h <= h1; h++) {
  282e57:	8b 45 1c             	mov    0x1c(%ebp),%eax
  282e5a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  282e5d:	e9 1b 05 00 00       	jmp    28337d <sheet_refreshsub+0x583>
		sht = ctl->sheets[h];
  282e62:	8b 45 08             	mov    0x8(%ebp),%eax
  282e65:	8b 55 fc             	mov    -0x4(%ebp),%edx
  282e68:	83 c2 04             	add    $0x4,%edx
  282e6b:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  282e6f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
		buf = sht->buf;
  282e72:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282e75:	8b 00                	mov    (%eax),%eax
  282e77:	89 45 d0             	mov    %eax,-0x30(%ebp)
		sid = sht - ctl->sheets0;
  282e7a:	8b 45 08             	mov    0x8(%ebp),%eax
  282e7d:	8d 90 14 04 00 00    	lea    0x414(%eax),%edx
  282e83:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282e86:	29 d0                	sub    %edx,%eax
  282e88:	c1 f8 03             	sar    $0x3,%eax
  282e8b:	69 c0 cd cc cc cc    	imul   $0xcccccccd,%eax,%eax
  282e91:	88 45 cf             	mov    %al,-0x31(%ebp)
		/* vx0Å`vy1ÇégÇ¡ÇƒÅAbx0Å`by1ÇãtéZÇ∑ÇÈ */
		bx0 = vx0 - sht->vx0;
  282e94:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282e97:	8b 40 0c             	mov    0xc(%eax),%eax
  282e9a:	8b 55 0c             	mov    0xc(%ebp),%edx
  282e9d:	29 c2                	sub    %eax,%edx
  282e9f:	89 d0                	mov    %edx,%eax
  282ea1:	89 45 f0             	mov    %eax,-0x10(%ebp)
		by0 = vy0 - sht->vy0;
  282ea4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282ea7:	8b 40 10             	mov    0x10(%eax),%eax
  282eaa:	8b 55 10             	mov    0x10(%ebp),%edx
  282ead:	29 c2                	sub    %eax,%edx
  282eaf:	89 d0                	mov    %edx,%eax
  282eb1:	89 45 ec             	mov    %eax,-0x14(%ebp)
		bx1 = vx1 - sht->vx0;
  282eb4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282eb7:	8b 40 0c             	mov    0xc(%eax),%eax
  282eba:	8b 55 14             	mov    0x14(%ebp),%edx
  282ebd:	29 c2                	sub    %eax,%edx
  282ebf:	89 d0                	mov    %edx,%eax
  282ec1:	89 45 e8             	mov    %eax,-0x18(%ebp)
		by1 = vy1 - sht->vy0;
  282ec4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282ec7:	8b 40 10             	mov    0x10(%eax),%eax
  282eca:	8b 55 18             	mov    0x18(%ebp),%edx
  282ecd:	29 c2                	sub    %eax,%edx
  282ecf:	89 d0                	mov    %edx,%eax
  282ed1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		if (bx0 < 0) { bx0 = 0; }
  282ed4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  282ed8:	79 07                	jns    282ee1 <sheet_refreshsub+0xe7>
  282eda:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		if (by0 < 0) { by0 = 0; }
  282ee1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  282ee5:	79 07                	jns    282eee <sheet_refreshsub+0xf4>
  282ee7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		if (bx1 > sht->bxsize) { bx1 = sht->bxsize; }
  282eee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282ef1:	8b 40 04             	mov    0x4(%eax),%eax
  282ef4:	39 45 e8             	cmp    %eax,-0x18(%ebp)
  282ef7:	7e 09                	jle    282f02 <sheet_refreshsub+0x108>
  282ef9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282efc:	8b 40 04             	mov    0x4(%eax),%eax
  282eff:	89 45 e8             	mov    %eax,-0x18(%ebp)
		if (by1 > sht->bysize) { by1 = sht->bysize; }
  282f02:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282f05:	8b 40 08             	mov    0x8(%eax),%eax
  282f08:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
  282f0b:	7e 09                	jle    282f16 <sheet_refreshsub+0x11c>
  282f0d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282f10:	8b 40 08             	mov    0x8(%eax),%eax
  282f13:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		if ((sht->vx0 & 3) == 0) {
  282f16:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282f19:	8b 40 0c             	mov    0xc(%eax),%eax
  282f1c:	83 e0 03             	and    $0x3,%eax
  282f1f:	85 c0                	test   %eax,%eax
  282f21:	0f 85 b1 03 00 00    	jne    2832d8 <sheet_refreshsub+0x4de>
			/* 4ÉoÉCÉgå^ */
			i  = (bx0 + 3) / 4; /* bx0Ç4Ç≈äÑÇ¡ÇΩÇ‡ÇÃÅií[êîêÿÇËè„Ç∞Åj */
  282f27:	8b 45 f0             	mov    -0x10(%ebp),%eax
  282f2a:	83 c0 03             	add    $0x3,%eax
  282f2d:	8d 50 03             	lea    0x3(%eax),%edx
  282f30:	85 c0                	test   %eax,%eax
  282f32:	0f 48 c2             	cmovs  %edx,%eax
  282f35:	c1 f8 02             	sar    $0x2,%eax
  282f38:	89 45 e0             	mov    %eax,-0x20(%ebp)
			i1 =  bx1      / 4; /* bx1Ç4Ç≈äÑÇ¡ÇΩÇ‡ÇÃÅií[êîêÿÇËéÃÇƒÅj */
  282f3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  282f3e:	8d 50 03             	lea    0x3(%eax),%edx
  282f41:	85 c0                	test   %eax,%eax
  282f43:	0f 48 c2             	cmovs  %edx,%eax
  282f46:	c1 f8 02             	sar    $0x2,%eax
  282f49:	89 45 c0             	mov    %eax,-0x40(%ebp)
			i1 = i1 - i;
  282f4c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  282f4f:	29 45 c0             	sub    %eax,-0x40(%ebp)
			sid4 = sid | sid << 8 | sid << 16 | sid << 24;
  282f52:	0f b6 45 cf          	movzbl -0x31(%ebp),%eax
  282f56:	0f b6 55 cf          	movzbl -0x31(%ebp),%edx
  282f5a:	c1 e2 08             	shl    $0x8,%edx
  282f5d:	09 c2                	or     %eax,%edx
  282f5f:	0f b6 45 cf          	movzbl -0x31(%ebp),%eax
  282f63:	c1 e0 10             	shl    $0x10,%eax
  282f66:	09 c2                	or     %eax,%edx
  282f68:	0f b6 45 cf          	movzbl -0x31(%ebp),%eax
  282f6c:	c1 e0 18             	shl    $0x18,%eax
  282f6f:	09 d0                	or     %edx,%eax
  282f71:	89 45 bc             	mov    %eax,-0x44(%ebp)
			for (by = by0; by < by1; by++) {
  282f74:	8b 45 ec             	mov    -0x14(%ebp),%eax
  282f77:	89 45 f4             	mov    %eax,-0xc(%ebp)
  282f7a:	e9 48 03 00 00       	jmp    2832c7 <sheet_refreshsub+0x4cd>
				vy = sht->vy0 + by;
  282f7f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282f82:	8b 50 10             	mov    0x10(%eax),%edx
  282f85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  282f88:	01 d0                	add    %edx,%eax
  282f8a:	89 45 c8             	mov    %eax,-0x38(%ebp)
				for (bx = bx0; bx < bx1 && (bx & 3) != 0; bx++) {	/* ëOÇÃí[êîÇ1ÉoÉCÉgÇ∏Ç¬ */
  282f8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  282f90:	89 45 f8             	mov    %eax,-0x8(%ebp)
  282f93:	eb 68                	jmp    282ffd <sheet_refreshsub+0x203>
					vx = sht->vx0 + bx;
  282f95:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282f98:	8b 50 0c             	mov    0xc(%eax),%edx
  282f9b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282f9e:	01 d0                	add    %edx,%eax
  282fa0:	89 45 c4             	mov    %eax,-0x3c(%ebp)
					if (map[vy * ctl->xsize + vx] == sid) {
  282fa3:	8b 45 08             	mov    0x8(%ebp),%eax
  282fa6:	8b 40 08             	mov    0x8(%eax),%eax
  282fa9:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  282fad:	89 c2                	mov    %eax,%edx
  282faf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  282fb2:	01 d0                	add    %edx,%eax
  282fb4:	89 c2                	mov    %eax,%edx
  282fb6:	8b 45 d8             	mov    -0x28(%ebp),%eax
  282fb9:	01 d0                	add    %edx,%eax
  282fbb:	0f b6 00             	movzbl (%eax),%eax
  282fbe:	38 45 cf             	cmp    %al,-0x31(%ebp)
  282fc1:	75 36                	jne    282ff9 <sheet_refreshsub+0x1ff>
						vram[vy * ctl->xsize + vx] = buf[by * sht->bxsize + bx];
  282fc3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  282fc6:	8b 40 04             	mov    0x4(%eax),%eax
  282fc9:	0f af 45 f4          	imul   -0xc(%ebp),%eax
  282fcd:	89 c2                	mov    %eax,%edx
  282fcf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  282fd2:	01 d0                	add    %edx,%eax
  282fd4:	89 c2                	mov    %eax,%edx
  282fd6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  282fd9:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  282fdc:	8b 45 08             	mov    0x8(%ebp),%eax
  282fdf:	8b 40 08             	mov    0x8(%eax),%eax
  282fe2:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  282fe6:	89 c2                	mov    %eax,%edx
  282fe8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  282feb:	01 d0                	add    %edx,%eax
  282fed:	89 c2                	mov    %eax,%edx
  282fef:	8b 45 dc             	mov    -0x24(%ebp),%eax
  282ff2:	01 c2                	add    %eax,%edx
  282ff4:	0f b6 01             	movzbl (%ecx),%eax
  282ff7:	88 02                	mov    %al,(%edx)
				for (bx = bx0; bx < bx1 && (bx & 3) != 0; bx++) {	/* ëOÇÃí[êîÇ1ÉoÉCÉgÇ∏Ç¬ */
  282ff9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  282ffd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283000:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  283003:	7d 0a                	jge    28300f <sheet_refreshsub+0x215>
  283005:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283008:	83 e0 03             	and    $0x3,%eax
  28300b:	85 c0                	test   %eax,%eax
  28300d:	75 86                	jne    282f95 <sheet_refreshsub+0x19b>
					}
				}
				vx = sht->vx0 + bx;
  28300f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  283012:	8b 50 0c             	mov    0xc(%eax),%edx
  283015:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283018:	01 d0                	add    %edx,%eax
  28301a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
				p = (int *) &map[vy * ctl->xsize + vx];
  28301d:	8b 45 08             	mov    0x8(%ebp),%eax
  283020:	8b 40 08             	mov    0x8(%eax),%eax
  283023:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  283027:	89 c2                	mov    %eax,%edx
  283029:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  28302c:	01 d0                	add    %edx,%eax
  28302e:	89 c2                	mov    %eax,%edx
  283030:	8b 45 d8             	mov    -0x28(%ebp),%eax
  283033:	01 d0                	add    %edx,%eax
  283035:	89 45 b8             	mov    %eax,-0x48(%ebp)
				q = (int *) &vram[vy * ctl->xsize + vx];
  283038:	8b 45 08             	mov    0x8(%ebp),%eax
  28303b:	8b 40 08             	mov    0x8(%eax),%eax
  28303e:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  283042:	89 c2                	mov    %eax,%edx
  283044:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  283047:	01 d0                	add    %edx,%eax
  283049:	89 c2                	mov    %eax,%edx
  28304b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  28304e:	01 d0                	add    %edx,%eax
  283050:	89 45 b4             	mov    %eax,-0x4c(%ebp)
				r = (int *) &buf[by * sht->bxsize + bx];
  283053:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  283056:	8b 40 04             	mov    0x4(%eax),%eax
  283059:	0f af 45 f4          	imul   -0xc(%ebp),%eax
  28305d:	89 c2                	mov    %eax,%edx
  28305f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283062:	01 d0                	add    %edx,%eax
  283064:	89 c2                	mov    %eax,%edx
  283066:	8b 45 d0             	mov    -0x30(%ebp),%eax
  283069:	01 d0                	add    %edx,%eax
  28306b:	89 45 b0             	mov    %eax,-0x50(%ebp)
				for (i = 0; i < i1; i++) {							/* 4ÇÃî{êîïîï™ */
  28306e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  283075:	e9 c2 01 00 00       	jmp    28323c <sheet_refreshsub+0x442>
					if (p[i] == sid4) {
  28307a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  28307d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  283084:	8b 45 b8             	mov    -0x48(%ebp),%eax
  283087:	01 d0                	add    %edx,%eax
  283089:	8b 00                	mov    (%eax),%eax
  28308b:	39 45 bc             	cmp    %eax,-0x44(%ebp)
  28308e:	75 27                	jne    2830b7 <sheet_refreshsub+0x2bd>
						q[i] = r[i];
  283090:	8b 45 e0             	mov    -0x20(%ebp),%eax
  283093:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  28309a:	8b 45 b0             	mov    -0x50(%ebp),%eax
  28309d:	01 d0                	add    %edx,%eax
  28309f:	8b 55 e0             	mov    -0x20(%ebp),%edx
  2830a2:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  2830a9:	8b 55 b4             	mov    -0x4c(%ebp),%edx
  2830ac:	01 ca                	add    %ecx,%edx
  2830ae:	8b 00                	mov    (%eax),%eax
  2830b0:	89 02                	mov    %eax,(%edx)
  2830b2:	e9 81 01 00 00       	jmp    283238 <sheet_refreshsub+0x43e>
					} else {
						bx2 = bx + i * 4;
  2830b7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2830ba:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  2830c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2830c4:	01 d0                	add    %edx,%eax
  2830c6:	89 45 ac             	mov    %eax,-0x54(%ebp)
						vx = sht->vx0 + bx2;
  2830c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2830cc:	8b 50 0c             	mov    0xc(%eax),%edx
  2830cf:	8b 45 ac             	mov    -0x54(%ebp),%eax
  2830d2:	01 d0                	add    %edx,%eax
  2830d4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
						if (map[vy * ctl->xsize + vx + 0] == sid) {
  2830d7:	8b 45 08             	mov    0x8(%ebp),%eax
  2830da:	8b 40 08             	mov    0x8(%eax),%eax
  2830dd:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  2830e1:	89 c2                	mov    %eax,%edx
  2830e3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  2830e6:	01 d0                	add    %edx,%eax
  2830e8:	89 c2                	mov    %eax,%edx
  2830ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
  2830ed:	01 d0                	add    %edx,%eax
  2830ef:	0f b6 00             	movzbl (%eax),%eax
  2830f2:	38 45 cf             	cmp    %al,-0x31(%ebp)
  2830f5:	75 36                	jne    28312d <sheet_refreshsub+0x333>
							vram[vy * ctl->xsize + vx + 0] = buf[by * sht->bxsize + bx2 + 0];
  2830f7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2830fa:	8b 40 04             	mov    0x4(%eax),%eax
  2830fd:	0f af 45 f4          	imul   -0xc(%ebp),%eax
  283101:	89 c2                	mov    %eax,%edx
  283103:	8b 45 ac             	mov    -0x54(%ebp),%eax
  283106:	01 d0                	add    %edx,%eax
  283108:	89 c2                	mov    %eax,%edx
  28310a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  28310d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  283110:	8b 45 08             	mov    0x8(%ebp),%eax
  283113:	8b 40 08             	mov    0x8(%eax),%eax
  283116:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  28311a:	89 c2                	mov    %eax,%edx
  28311c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  28311f:	01 d0                	add    %edx,%eax
  283121:	89 c2                	mov    %eax,%edx
  283123:	8b 45 dc             	mov    -0x24(%ebp),%eax
  283126:	01 c2                	add    %eax,%edx
  283128:	0f b6 01             	movzbl (%ecx),%eax
  28312b:	88 02                	mov    %al,(%edx)
						}
						if (map[vy * ctl->xsize + vx + 1] == sid) {
  28312d:	8b 45 08             	mov    0x8(%ebp),%eax
  283130:	8b 40 08             	mov    0x8(%eax),%eax
  283133:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  283137:	89 c2                	mov    %eax,%edx
  283139:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  28313c:	01 d0                	add    %edx,%eax
  28313e:	8d 50 01             	lea    0x1(%eax),%edx
  283141:	8b 45 d8             	mov    -0x28(%ebp),%eax
  283144:	01 d0                	add    %edx,%eax
  283146:	0f b6 00             	movzbl (%eax),%eax
  283149:	38 45 cf             	cmp    %al,-0x31(%ebp)
  28314c:	75 38                	jne    283186 <sheet_refreshsub+0x38c>
							vram[vy * ctl->xsize + vx + 1] = buf[by * sht->bxsize + bx2 + 1];
  28314e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  283151:	8b 40 04             	mov    0x4(%eax),%eax
  283154:	0f af 45 f4          	imul   -0xc(%ebp),%eax
  283158:	89 c2                	mov    %eax,%edx
  28315a:	8b 45 ac             	mov    -0x54(%ebp),%eax
  28315d:	01 d0                	add    %edx,%eax
  28315f:	8d 50 01             	lea    0x1(%eax),%edx
  283162:	8b 45 d0             	mov    -0x30(%ebp),%eax
  283165:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  283168:	8b 45 08             	mov    0x8(%ebp),%eax
  28316b:	8b 40 08             	mov    0x8(%eax),%eax
  28316e:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  283172:	89 c2                	mov    %eax,%edx
  283174:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  283177:	01 d0                	add    %edx,%eax
  283179:	8d 50 01             	lea    0x1(%eax),%edx
  28317c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  28317f:	01 c2                	add    %eax,%edx
  283181:	0f b6 01             	movzbl (%ecx),%eax
  283184:	88 02                	mov    %al,(%edx)
						}
						if (map[vy * ctl->xsize + vx + 2] == sid) {
  283186:	8b 45 08             	mov    0x8(%ebp),%eax
  283189:	8b 40 08             	mov    0x8(%eax),%eax
  28318c:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  283190:	89 c2                	mov    %eax,%edx
  283192:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  283195:	01 d0                	add    %edx,%eax
  283197:	8d 50 02             	lea    0x2(%eax),%edx
  28319a:	8b 45 d8             	mov    -0x28(%ebp),%eax
  28319d:	01 d0                	add    %edx,%eax
  28319f:	0f b6 00             	movzbl (%eax),%eax
  2831a2:	38 45 cf             	cmp    %al,-0x31(%ebp)
  2831a5:	75 38                	jne    2831df <sheet_refreshsub+0x3e5>
							vram[vy * ctl->xsize + vx + 2] = buf[by * sht->bxsize + bx2 + 2];
  2831a7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2831aa:	8b 40 04             	mov    0x4(%eax),%eax
  2831ad:	0f af 45 f4          	imul   -0xc(%ebp),%eax
  2831b1:	89 c2                	mov    %eax,%edx
  2831b3:	8b 45 ac             	mov    -0x54(%ebp),%eax
  2831b6:	01 d0                	add    %edx,%eax
  2831b8:	8d 50 02             	lea    0x2(%eax),%edx
  2831bb:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2831be:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  2831c1:	8b 45 08             	mov    0x8(%ebp),%eax
  2831c4:	8b 40 08             	mov    0x8(%eax),%eax
  2831c7:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  2831cb:	89 c2                	mov    %eax,%edx
  2831cd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  2831d0:	01 d0                	add    %edx,%eax
  2831d2:	8d 50 02             	lea    0x2(%eax),%edx
  2831d5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  2831d8:	01 c2                	add    %eax,%edx
  2831da:	0f b6 01             	movzbl (%ecx),%eax
  2831dd:	88 02                	mov    %al,(%edx)
						}
						if (map[vy * ctl->xsize + vx + 3] == sid) {
  2831df:	8b 45 08             	mov    0x8(%ebp),%eax
  2831e2:	8b 40 08             	mov    0x8(%eax),%eax
  2831e5:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  2831e9:	89 c2                	mov    %eax,%edx
  2831eb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  2831ee:	01 d0                	add    %edx,%eax
  2831f0:	8d 50 03             	lea    0x3(%eax),%edx
  2831f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
  2831f6:	01 d0                	add    %edx,%eax
  2831f8:	0f b6 00             	movzbl (%eax),%eax
  2831fb:	38 45 cf             	cmp    %al,-0x31(%ebp)
  2831fe:	75 38                	jne    283238 <sheet_refreshsub+0x43e>
							vram[vy * ctl->xsize + vx + 3] = buf[by * sht->bxsize + bx2 + 3];
  283200:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  283203:	8b 40 04             	mov    0x4(%eax),%eax
  283206:	0f af 45 f4          	imul   -0xc(%ebp),%eax
  28320a:	89 c2                	mov    %eax,%edx
  28320c:	8b 45 ac             	mov    -0x54(%ebp),%eax
  28320f:	01 d0                	add    %edx,%eax
  283211:	8d 50 03             	lea    0x3(%eax),%edx
  283214:	8b 45 d0             	mov    -0x30(%ebp),%eax
  283217:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  28321a:	8b 45 08             	mov    0x8(%ebp),%eax
  28321d:	8b 40 08             	mov    0x8(%eax),%eax
  283220:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  283224:	89 c2                	mov    %eax,%edx
  283226:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  283229:	01 d0                	add    %edx,%eax
  28322b:	8d 50 03             	lea    0x3(%eax),%edx
  28322e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  283231:	01 c2                	add    %eax,%edx
  283233:	0f b6 01             	movzbl (%ecx),%eax
  283236:	88 02                	mov    %al,(%edx)
				for (i = 0; i < i1; i++) {							/* 4ÇÃî{êîïîï™ */
  283238:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  28323c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  28323f:	3b 45 c0             	cmp    -0x40(%ebp),%eax
  283242:	0f 8c 32 fe ff ff    	jl     28307a <sheet_refreshsub+0x280>
						}
					}
				}
				for (bx += i1 * 4; bx < bx1; bx++) {				/* å„ÇÎÇÃí[êîÇ1ÉoÉCÉgÇ∏Ç¬ */
  283248:	8b 45 c0             	mov    -0x40(%ebp),%eax
  28324b:	c1 e0 02             	shl    $0x2,%eax
  28324e:	01 45 f8             	add    %eax,-0x8(%ebp)
  283251:	eb 68                	jmp    2832bb <sheet_refreshsub+0x4c1>
					vx = sht->vx0 + bx;
  283253:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  283256:	8b 50 0c             	mov    0xc(%eax),%edx
  283259:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28325c:	01 d0                	add    %edx,%eax
  28325e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
					if (map[vy * ctl->xsize + vx] == sid) {
  283261:	8b 45 08             	mov    0x8(%ebp),%eax
  283264:	8b 40 08             	mov    0x8(%eax),%eax
  283267:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  28326b:	89 c2                	mov    %eax,%edx
  28326d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  283270:	01 d0                	add    %edx,%eax
  283272:	89 c2                	mov    %eax,%edx
  283274:	8b 45 d8             	mov    -0x28(%ebp),%eax
  283277:	01 d0                	add    %edx,%eax
  283279:	0f b6 00             	movzbl (%eax),%eax
  28327c:	38 45 cf             	cmp    %al,-0x31(%ebp)
  28327f:	75 36                	jne    2832b7 <sheet_refreshsub+0x4bd>
						vram[vy * ctl->xsize + vx] = buf[by * sht->bxsize + bx];
  283281:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  283284:	8b 40 04             	mov    0x4(%eax),%eax
  283287:	0f af 45 f4          	imul   -0xc(%ebp),%eax
  28328b:	89 c2                	mov    %eax,%edx
  28328d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283290:	01 d0                	add    %edx,%eax
  283292:	89 c2                	mov    %eax,%edx
  283294:	8b 45 d0             	mov    -0x30(%ebp),%eax
  283297:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  28329a:	8b 45 08             	mov    0x8(%ebp),%eax
  28329d:	8b 40 08             	mov    0x8(%eax),%eax
  2832a0:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  2832a4:	89 c2                	mov    %eax,%edx
  2832a6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  2832a9:	01 d0                	add    %edx,%eax
  2832ab:	89 c2                	mov    %eax,%edx
  2832ad:	8b 45 dc             	mov    -0x24(%ebp),%eax
  2832b0:	01 c2                	add    %eax,%edx
  2832b2:	0f b6 01             	movzbl (%ecx),%eax
  2832b5:	88 02                	mov    %al,(%edx)
				for (bx += i1 * 4; bx < bx1; bx++) {				/* å„ÇÎÇÃí[êîÇ1ÉoÉCÉgÇ∏Ç¬ */
  2832b7:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  2832bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2832be:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  2832c1:	7c 90                	jl     283253 <sheet_refreshsub+0x459>
			for (by = by0; by < by1; by++) {
  2832c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2832c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2832ca:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  2832cd:	0f 8c ac fc ff ff    	jl     282f7f <sheet_refreshsub+0x185>
  2832d3:	e9 a1 00 00 00       	jmp    283379 <sheet_refreshsub+0x57f>
					}
				}
			}
		} else {
			/* 1ÉoÉCÉgå^ */
			for (by = by0; by < by1; by++) {
  2832d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2832db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2832de:	e9 8a 00 00 00       	jmp    28336d <sheet_refreshsub+0x573>
				vy = sht->vy0 + by;
  2832e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2832e6:	8b 50 10             	mov    0x10(%eax),%edx
  2832e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2832ec:	01 d0                	add    %edx,%eax
  2832ee:	89 45 c8             	mov    %eax,-0x38(%ebp)
				for (bx = bx0; bx < bx1; bx++) {
  2832f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2832f4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  2832f7:	eb 68                	jmp    283361 <sheet_refreshsub+0x567>
					vx = sht->vx0 + bx;
  2832f9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2832fc:	8b 50 0c             	mov    0xc(%eax),%edx
  2832ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283302:	01 d0                	add    %edx,%eax
  283304:	89 45 c4             	mov    %eax,-0x3c(%ebp)
					if (map[vy * ctl->xsize + vx] == sid) {
  283307:	8b 45 08             	mov    0x8(%ebp),%eax
  28330a:	8b 40 08             	mov    0x8(%eax),%eax
  28330d:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  283311:	89 c2                	mov    %eax,%edx
  283313:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  283316:	01 d0                	add    %edx,%eax
  283318:	89 c2                	mov    %eax,%edx
  28331a:	8b 45 d8             	mov    -0x28(%ebp),%eax
  28331d:	01 d0                	add    %edx,%eax
  28331f:	0f b6 00             	movzbl (%eax),%eax
  283322:	38 45 cf             	cmp    %al,-0x31(%ebp)
  283325:	75 36                	jne    28335d <sheet_refreshsub+0x563>
						vram[vy * ctl->xsize + vx] = buf[by * sht->bxsize + bx];
  283327:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28332a:	8b 40 04             	mov    0x4(%eax),%eax
  28332d:	0f af 45 f4          	imul   -0xc(%ebp),%eax
  283331:	89 c2                	mov    %eax,%edx
  283333:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283336:	01 d0                	add    %edx,%eax
  283338:	89 c2                	mov    %eax,%edx
  28333a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  28333d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  283340:	8b 45 08             	mov    0x8(%ebp),%eax
  283343:	8b 40 08             	mov    0x8(%eax),%eax
  283346:	0f af 45 c8          	imul   -0x38(%ebp),%eax
  28334a:	89 c2                	mov    %eax,%edx
  28334c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  28334f:	01 d0                	add    %edx,%eax
  283351:	89 c2                	mov    %eax,%edx
  283353:	8b 45 dc             	mov    -0x24(%ebp),%eax
  283356:	01 c2                	add    %eax,%edx
  283358:	0f b6 01             	movzbl (%ecx),%eax
  28335b:	88 02                	mov    %al,(%edx)
				for (bx = bx0; bx < bx1; bx++) {
  28335d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  283361:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283364:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  283367:	7c 90                	jl     2832f9 <sheet_refreshsub+0x4ff>
			for (by = by0; by < by1; by++) {
  283369:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  28336d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283370:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  283373:	0f 8c 6a ff ff ff    	jl     2832e3 <sheet_refreshsub+0x4e9>
	for (h = h0; h <= h1; h++) {
  283379:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  28337d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  283380:	3b 45 20             	cmp    0x20(%ebp),%eax
  283383:	0f 8e d9 fa ff ff    	jle    282e62 <sheet_refreshsub+0x68>
					}
				}
			}
		}
	}
	return;
  283389:	90                   	nop
}
  28338a:	c9                   	leave  
  28338b:	c3                   	ret    

0028338c <sheet_updown>:

void sheet_updown(struct SHEET *sht, int height)
{
  28338c:	f3 0f 1e fb          	endbr32 
  283390:	55                   	push   %ebp
  283391:	89 e5                	mov    %esp,%ebp
  283393:	56                   	push   %esi
  283394:	53                   	push   %ebx
  283395:	83 ec 10             	sub    $0x10,%esp
	struct SHTCTL *ctl = sht->ctl;
  283398:	8b 45 08             	mov    0x8(%ebp),%eax
  28339b:	8b 40 20             	mov    0x20(%eax),%eax
  28339e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int h, old = sht->height; /* ê›íËëOÇÃçÇÇ≥ÇãLâØÇ∑ÇÈ */
  2833a1:	8b 45 08             	mov    0x8(%ebp),%eax
  2833a4:	8b 40 18             	mov    0x18(%eax),%eax
  2833a7:	89 45 ec             	mov    %eax,-0x14(%ebp)

	/* éwíËÇ™í·Ç∑Ç¨Ç‚çÇÇ∑Ç¨ÇæÇ¡ÇΩÇÁÅAèCê≥Ç∑ÇÈ */
	if (height > ctl->top + 1) {
  2833aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2833ad:	8b 40 10             	mov    0x10(%eax),%eax
  2833b0:	83 c0 01             	add    $0x1,%eax
  2833b3:	39 45 0c             	cmp    %eax,0xc(%ebp)
  2833b6:	7e 0c                	jle    2833c4 <sheet_updown+0x38>
		height = ctl->top + 1;
  2833b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2833bb:	8b 40 10             	mov    0x10(%eax),%eax
  2833be:	83 c0 01             	add    $0x1,%eax
  2833c1:	89 45 0c             	mov    %eax,0xc(%ebp)
	}
	if (height < -1) {
  2833c4:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
  2833c8:	7d 07                	jge    2833d1 <sheet_updown+0x45>
		height = -1;
  2833ca:	c7 45 0c ff ff ff ff 	movl   $0xffffffff,0xc(%ebp)
	}
	sht->height = height; /* çÇÇ≥Çê›íË */
  2833d1:	8b 45 08             	mov    0x8(%ebp),%eax
  2833d4:	8b 55 0c             	mov    0xc(%ebp),%edx
  2833d7:	89 50 18             	mov    %edx,0x18(%eax)

	/* à»â∫ÇÕéÂÇ…sheets[]ÇÃï¿Ç◊ë÷Ç¶ */
	if (old > height) {	/* à»ëOÇÊÇËÇ‡í·Ç≠Ç»ÇÈ */
  2833da:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2833dd:	3b 45 0c             	cmp    0xc(%ebp),%eax
  2833e0:	0f 8e c9 01 00 00    	jle    2835af <sheet_updown+0x223>
		if (height >= 0) {
  2833e6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  2833ea:	0f 88 dc 00 00 00    	js     2834cc <sheet_updown+0x140>
			/* ä‘ÇÃÇ‡ÇÃÇà¯Ç´è„Ç∞ÇÈ */
			for (h = old; h > height; h--) {
  2833f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2833f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2833f6:	eb 34                	jmp    28342c <sheet_updown+0xa0>
				ctl->sheets[h] = ctl->sheets[h - 1];
  2833f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2833fb:	8d 50 ff             	lea    -0x1(%eax),%edx
  2833fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283401:	83 c2 04             	add    $0x4,%edx
  283404:	8b 54 90 04          	mov    0x4(%eax,%edx,4),%edx
  283408:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28340b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  28340e:	83 c1 04             	add    $0x4,%ecx
  283411:	89 54 88 04          	mov    %edx,0x4(%eax,%ecx,4)
				ctl->sheets[h]->height = h;
  283415:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283418:	8b 55 f4             	mov    -0xc(%ebp),%edx
  28341b:	83 c2 04             	add    $0x4,%edx
  28341e:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  283422:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283425:	89 50 18             	mov    %edx,0x18(%eax)
			for (h = old; h > height; h--) {
  283428:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  28342c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28342f:	3b 45 0c             	cmp    0xc(%ebp),%eax
  283432:	7f c4                	jg     2833f8 <sheet_updown+0x6c>
			}
			ctl->sheets[height] = sht;
  283434:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283437:	8b 55 0c             	mov    0xc(%ebp),%edx
  28343a:	8d 4a 04             	lea    0x4(%edx),%ecx
  28343d:	8b 55 08             	mov    0x8(%ebp),%edx
  283440:	89 54 88 04          	mov    %edx,0x4(%eax,%ecx,4)
			sheet_refreshmap(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, sht->vy0 + sht->bysize, height + 1);
  283444:	8b 45 0c             	mov    0xc(%ebp),%eax
  283447:	8d 70 01             	lea    0x1(%eax),%esi
  28344a:	8b 45 08             	mov    0x8(%ebp),%eax
  28344d:	8b 50 10             	mov    0x10(%eax),%edx
  283450:	8b 45 08             	mov    0x8(%ebp),%eax
  283453:	8b 40 08             	mov    0x8(%eax),%eax
  283456:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  283459:	8b 45 08             	mov    0x8(%ebp),%eax
  28345c:	8b 50 0c             	mov    0xc(%eax),%edx
  28345f:	8b 45 08             	mov    0x8(%ebp),%eax
  283462:	8b 40 04             	mov    0x4(%eax),%eax
  283465:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  283468:	8b 45 08             	mov    0x8(%ebp),%eax
  28346b:	8b 50 10             	mov    0x10(%eax),%edx
  28346e:	8b 45 08             	mov    0x8(%ebp),%eax
  283471:	8b 40 0c             	mov    0xc(%eax),%eax
  283474:	56                   	push   %esi
  283475:	53                   	push   %ebx
  283476:	51                   	push   %ecx
  283477:	52                   	push   %edx
  283478:	50                   	push   %eax
  283479:	ff 75 f0             	pushl  -0x10(%ebp)
  28347c:	e8 6f f6 ff ff       	call   282af0 <sheet_refreshmap>
  283481:	83 c4 18             	add    $0x18,%esp
			sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, sht->vy0 + sht->bysize, height + 1, old);
  283484:	8b 45 0c             	mov    0xc(%ebp),%eax
  283487:	8d 70 01             	lea    0x1(%eax),%esi
  28348a:	8b 45 08             	mov    0x8(%ebp),%eax
  28348d:	8b 50 10             	mov    0x10(%eax),%edx
  283490:	8b 45 08             	mov    0x8(%ebp),%eax
  283493:	8b 40 08             	mov    0x8(%eax),%eax
  283496:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  283499:	8b 45 08             	mov    0x8(%ebp),%eax
  28349c:	8b 50 0c             	mov    0xc(%eax),%edx
  28349f:	8b 45 08             	mov    0x8(%ebp),%eax
  2834a2:	8b 40 04             	mov    0x4(%eax),%eax
  2834a5:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  2834a8:	8b 45 08             	mov    0x8(%ebp),%eax
  2834ab:	8b 50 10             	mov    0x10(%eax),%edx
  2834ae:	8b 45 08             	mov    0x8(%ebp),%eax
  2834b1:	8b 40 0c             	mov    0xc(%eax),%eax
  2834b4:	ff 75 ec             	pushl  -0x14(%ebp)
  2834b7:	56                   	push   %esi
  2834b8:	53                   	push   %ebx
  2834b9:	51                   	push   %ecx
  2834ba:	52                   	push   %edx
  2834bb:	50                   	push   %eax
  2834bc:	ff 75 f0             	pushl  -0x10(%ebp)
  2834bf:	e8 36 f9 ff ff       	call   282dfa <sheet_refreshsub>
  2834c4:	83 c4 1c             	add    $0x1c,%esp
			ctl->top++; /* ï\é¶íÜÇÃâ∫Ç∂Ç´Ç™àÍÇ¬ëùÇ¶ÇÈÇÃÇ≈ÅAàÍî‘è„ÇÃçÇÇ≥Ç™ëùÇ¶ÇÈ */
		}
		sheet_refreshmap(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, sht->vy0 + sht->bysize, height);
		sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, sht->vy0 + sht->bysize, height, height);
	}
	return;
  2834c7:	e9 33 02 00 00       	jmp    2836ff <sheet_updown+0x373>
			if (ctl->top > old) {
  2834cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2834cf:	8b 40 10             	mov    0x10(%eax),%eax
  2834d2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  2834d5:	7d 47                	jge    28351e <sheet_updown+0x192>
				for (h = old; h < ctl->top; h++) {
  2834d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2834da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2834dd:	eb 34                	jmp    283513 <sheet_updown+0x187>
					ctl->sheets[h] = ctl->sheets[h + 1];
  2834df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2834e2:	8d 50 01             	lea    0x1(%eax),%edx
  2834e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2834e8:	83 c2 04             	add    $0x4,%edx
  2834eb:	8b 54 90 04          	mov    0x4(%eax,%edx,4),%edx
  2834ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2834f2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  2834f5:	83 c1 04             	add    $0x4,%ecx
  2834f8:	89 54 88 04          	mov    %edx,0x4(%eax,%ecx,4)
					ctl->sheets[h]->height = h;
  2834fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2834ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283502:	83 c2 04             	add    $0x4,%edx
  283505:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  283509:	8b 55 f4             	mov    -0xc(%ebp),%edx
  28350c:	89 50 18             	mov    %edx,0x18(%eax)
				for (h = old; h < ctl->top; h++) {
  28350f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  283513:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283516:	8b 40 10             	mov    0x10(%eax),%eax
  283519:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  28351c:	7c c1                	jl     2834df <sheet_updown+0x153>
			ctl->top--; /* ï\é¶íÜÇÃâ∫Ç∂Ç´Ç™àÍÇ¬å∏ÇÈÇÃÇ≈ÅAàÍî‘è„ÇÃçÇÇ≥Ç™å∏ÇÈ */
  28351e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283521:	8b 40 10             	mov    0x10(%eax),%eax
  283524:	8d 50 ff             	lea    -0x1(%eax),%edx
  283527:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28352a:	89 50 10             	mov    %edx,0x10(%eax)
			sheet_refreshmap(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, sht->vy0 + sht->bysize, 0);
  28352d:	8b 45 08             	mov    0x8(%ebp),%eax
  283530:	8b 50 10             	mov    0x10(%eax),%edx
  283533:	8b 45 08             	mov    0x8(%ebp),%eax
  283536:	8b 40 08             	mov    0x8(%eax),%eax
  283539:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  28353c:	8b 45 08             	mov    0x8(%ebp),%eax
  28353f:	8b 50 0c             	mov    0xc(%eax),%edx
  283542:	8b 45 08             	mov    0x8(%ebp),%eax
  283545:	8b 40 04             	mov    0x4(%eax),%eax
  283548:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  28354b:	8b 45 08             	mov    0x8(%ebp),%eax
  28354e:	8b 50 10             	mov    0x10(%eax),%edx
  283551:	8b 45 08             	mov    0x8(%ebp),%eax
  283554:	8b 40 0c             	mov    0xc(%eax),%eax
  283557:	6a 00                	push   $0x0
  283559:	53                   	push   %ebx
  28355a:	51                   	push   %ecx
  28355b:	52                   	push   %edx
  28355c:	50                   	push   %eax
  28355d:	ff 75 f0             	pushl  -0x10(%ebp)
  283560:	e8 8b f5 ff ff       	call   282af0 <sheet_refreshmap>
  283565:	83 c4 18             	add    $0x18,%esp
			sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, sht->vy0 + sht->bysize, 0, old - 1);
  283568:	8b 45 ec             	mov    -0x14(%ebp),%eax
  28356b:	8d 70 ff             	lea    -0x1(%eax),%esi
  28356e:	8b 45 08             	mov    0x8(%ebp),%eax
  283571:	8b 50 10             	mov    0x10(%eax),%edx
  283574:	8b 45 08             	mov    0x8(%ebp),%eax
  283577:	8b 40 08             	mov    0x8(%eax),%eax
  28357a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  28357d:	8b 45 08             	mov    0x8(%ebp),%eax
  283580:	8b 50 0c             	mov    0xc(%eax),%edx
  283583:	8b 45 08             	mov    0x8(%ebp),%eax
  283586:	8b 40 04             	mov    0x4(%eax),%eax
  283589:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  28358c:	8b 45 08             	mov    0x8(%ebp),%eax
  28358f:	8b 50 10             	mov    0x10(%eax),%edx
  283592:	8b 45 08             	mov    0x8(%ebp),%eax
  283595:	8b 40 0c             	mov    0xc(%eax),%eax
  283598:	56                   	push   %esi
  283599:	6a 00                	push   $0x0
  28359b:	53                   	push   %ebx
  28359c:	51                   	push   %ecx
  28359d:	52                   	push   %edx
  28359e:	50                   	push   %eax
  28359f:	ff 75 f0             	pushl  -0x10(%ebp)
  2835a2:	e8 53 f8 ff ff       	call   282dfa <sheet_refreshsub>
  2835a7:	83 c4 1c             	add    $0x1c,%esp
	return;
  2835aa:	e9 50 01 00 00       	jmp    2836ff <sheet_updown+0x373>
	} else if (old < height) {	/* à»ëOÇÊÇËÇ‡çÇÇ≠Ç»ÇÈ */
  2835af:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2835b2:	3b 45 0c             	cmp    0xc(%ebp),%eax
  2835b5:	0f 8d 44 01 00 00    	jge    2836ff <sheet_updown+0x373>
		if (old >= 0) {
  2835bb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  2835bf:	78 56                	js     283617 <sheet_updown+0x28b>
			for (h = old; h < height; h++) {
  2835c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2835c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2835c7:	eb 34                	jmp    2835fd <sheet_updown+0x271>
				ctl->sheets[h] = ctl->sheets[h + 1];
  2835c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2835cc:	8d 50 01             	lea    0x1(%eax),%edx
  2835cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2835d2:	83 c2 04             	add    $0x4,%edx
  2835d5:	8b 54 90 04          	mov    0x4(%eax,%edx,4),%edx
  2835d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2835dc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  2835df:	83 c1 04             	add    $0x4,%ecx
  2835e2:	89 54 88 04          	mov    %edx,0x4(%eax,%ecx,4)
				ctl->sheets[h]->height = h;
  2835e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2835e9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2835ec:	83 c2 04             	add    $0x4,%edx
  2835ef:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  2835f3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2835f6:	89 50 18             	mov    %edx,0x18(%eax)
			for (h = old; h < height; h++) {
  2835f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2835fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283600:	3b 45 0c             	cmp    0xc(%ebp),%eax
  283603:	7c c4                	jl     2835c9 <sheet_updown+0x23d>
			ctl->sheets[height] = sht;
  283605:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283608:	8b 55 0c             	mov    0xc(%ebp),%edx
  28360b:	8d 4a 04             	lea    0x4(%edx),%ecx
  28360e:	8b 55 08             	mov    0x8(%ebp),%edx
  283611:	89 54 88 04          	mov    %edx,0x4(%eax,%ecx,4)
  283615:	eb 6c                	jmp    283683 <sheet_updown+0x2f7>
			for (h = ctl->top; h >= height; h--) {
  283617:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28361a:	8b 40 10             	mov    0x10(%eax),%eax
  28361d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  283620:	eb 3a                	jmp    28365c <sheet_updown+0x2d0>
				ctl->sheets[h + 1] = ctl->sheets[h];
  283622:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283625:	8d 48 01             	lea    0x1(%eax),%ecx
  283628:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28362b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  28362e:	83 c2 04             	add    $0x4,%edx
  283631:	8b 54 90 04          	mov    0x4(%eax,%edx,4),%edx
  283635:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283638:	83 c1 04             	add    $0x4,%ecx
  28363b:	89 54 88 04          	mov    %edx,0x4(%eax,%ecx,4)
				ctl->sheets[h + 1]->height = h + 1;
  28363f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283642:	8d 50 01             	lea    0x1(%eax),%edx
  283645:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283648:	83 c2 04             	add    $0x4,%edx
  28364b:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  28364f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283652:	83 c2 01             	add    $0x1,%edx
  283655:	89 50 18             	mov    %edx,0x18(%eax)
			for (h = ctl->top; h >= height; h--) {
  283658:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  28365c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28365f:	3b 45 0c             	cmp    0xc(%ebp),%eax
  283662:	7d be                	jge    283622 <sheet_updown+0x296>
			ctl->sheets[height] = sht;
  283664:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283667:	8b 55 0c             	mov    0xc(%ebp),%edx
  28366a:	8d 4a 04             	lea    0x4(%edx),%ecx
  28366d:	8b 55 08             	mov    0x8(%ebp),%edx
  283670:	89 54 88 04          	mov    %edx,0x4(%eax,%ecx,4)
			ctl->top++; /* ï\é¶íÜÇÃâ∫Ç∂Ç´Ç™àÍÇ¬ëùÇ¶ÇÈÇÃÇ≈ÅAàÍî‘è„ÇÃçÇÇ≥Ç™ëùÇ¶ÇÈ */
  283674:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283677:	8b 40 10             	mov    0x10(%eax),%eax
  28367a:	8d 50 01             	lea    0x1(%eax),%edx
  28367d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283680:	89 50 10             	mov    %edx,0x10(%eax)
		sheet_refreshmap(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, sht->vy0 + sht->bysize, height);
  283683:	8b 45 08             	mov    0x8(%ebp),%eax
  283686:	8b 50 10             	mov    0x10(%eax),%edx
  283689:	8b 45 08             	mov    0x8(%ebp),%eax
  28368c:	8b 40 08             	mov    0x8(%eax),%eax
  28368f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  283692:	8b 45 08             	mov    0x8(%ebp),%eax
  283695:	8b 50 0c             	mov    0xc(%eax),%edx
  283698:	8b 45 08             	mov    0x8(%ebp),%eax
  28369b:	8b 40 04             	mov    0x4(%eax),%eax
  28369e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  2836a1:	8b 45 08             	mov    0x8(%ebp),%eax
  2836a4:	8b 50 10             	mov    0x10(%eax),%edx
  2836a7:	8b 45 08             	mov    0x8(%ebp),%eax
  2836aa:	8b 40 0c             	mov    0xc(%eax),%eax
  2836ad:	ff 75 0c             	pushl  0xc(%ebp)
  2836b0:	53                   	push   %ebx
  2836b1:	51                   	push   %ecx
  2836b2:	52                   	push   %edx
  2836b3:	50                   	push   %eax
  2836b4:	ff 75 f0             	pushl  -0x10(%ebp)
  2836b7:	e8 34 f4 ff ff       	call   282af0 <sheet_refreshmap>
  2836bc:	83 c4 18             	add    $0x18,%esp
		sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, sht->vy0 + sht->bysize, height, height);
  2836bf:	8b 45 08             	mov    0x8(%ebp),%eax
  2836c2:	8b 50 10             	mov    0x10(%eax),%edx
  2836c5:	8b 45 08             	mov    0x8(%ebp),%eax
  2836c8:	8b 40 08             	mov    0x8(%eax),%eax
  2836cb:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  2836ce:	8b 45 08             	mov    0x8(%ebp),%eax
  2836d1:	8b 50 0c             	mov    0xc(%eax),%edx
  2836d4:	8b 45 08             	mov    0x8(%ebp),%eax
  2836d7:	8b 40 04             	mov    0x4(%eax),%eax
  2836da:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  2836dd:	8b 45 08             	mov    0x8(%ebp),%eax
  2836e0:	8b 50 10             	mov    0x10(%eax),%edx
  2836e3:	8b 45 08             	mov    0x8(%ebp),%eax
  2836e6:	8b 40 0c             	mov    0xc(%eax),%eax
  2836e9:	ff 75 0c             	pushl  0xc(%ebp)
  2836ec:	ff 75 0c             	pushl  0xc(%ebp)
  2836ef:	53                   	push   %ebx
  2836f0:	51                   	push   %ecx
  2836f1:	52                   	push   %edx
  2836f2:	50                   	push   %eax
  2836f3:	ff 75 f0             	pushl  -0x10(%ebp)
  2836f6:	e8 ff f6 ff ff       	call   282dfa <sheet_refreshsub>
  2836fb:	83 c4 1c             	add    $0x1c,%esp
	return;
  2836fe:	90                   	nop
  2836ff:	90                   	nop
}
  283700:	8d 65 f8             	lea    -0x8(%ebp),%esp
  283703:	5b                   	pop    %ebx
  283704:	5e                   	pop    %esi
  283705:	5d                   	pop    %ebp
  283706:	c3                   	ret    

00283707 <sheet_refresh>:

void sheet_refresh(struct SHEET *sht, int bx0, int by0, int bx1, int by1)
{
  283707:	f3 0f 1e fb          	endbr32 
  28370b:	55                   	push   %ebp
  28370c:	89 e5                	mov    %esp,%ebp
  28370e:	57                   	push   %edi
  28370f:	56                   	push   %esi
  283710:	53                   	push   %ebx
  283711:	83 ec 04             	sub    $0x4,%esp
	if (sht->height >= 0) { /* Ç‡ÇµÇ‡ï\é¶íÜÇ»ÇÁÅAêVÇµÇ¢â∫Ç∂Ç´ÇÃèÓïÒÇ…âàÇ¡ÇƒâÊñ Çï`Ç´íºÇ∑ */
  283714:	8b 45 08             	mov    0x8(%ebp),%eax
  283717:	8b 40 18             	mov    0x18(%eax),%eax
  28371a:	85 c0                	test   %eax,%eax
  28371c:	78 55                	js     283773 <sheet_refresh+0x6c>
		sheet_refreshsub(sht->ctl, sht->vx0 + bx0, sht->vy0 + by0, sht->vx0 + bx1, sht->vy0 + by1, sht->height, sht->height);
  28371e:	8b 45 08             	mov    0x8(%ebp),%eax
  283721:	8b 58 18             	mov    0x18(%eax),%ebx
  283724:	8b 45 08             	mov    0x8(%ebp),%eax
  283727:	8b 48 18             	mov    0x18(%eax),%ecx
  28372a:	8b 45 08             	mov    0x8(%ebp),%eax
  28372d:	8b 50 10             	mov    0x10(%eax),%edx
  283730:	8b 45 18             	mov    0x18(%ebp),%eax
  283733:	01 d0                	add    %edx,%eax
  283735:	89 45 f0             	mov    %eax,-0x10(%ebp)
  283738:	8b 45 08             	mov    0x8(%ebp),%eax
  28373b:	8b 50 0c             	mov    0xc(%eax),%edx
  28373e:	8b 45 14             	mov    0x14(%ebp),%eax
  283741:	8d 3c 02             	lea    (%edx,%eax,1),%edi
  283744:	8b 45 08             	mov    0x8(%ebp),%eax
  283747:	8b 50 10             	mov    0x10(%eax),%edx
  28374a:	8b 45 10             	mov    0x10(%ebp),%eax
  28374d:	8d 34 02             	lea    (%edx,%eax,1),%esi
  283750:	8b 45 08             	mov    0x8(%ebp),%eax
  283753:	8b 50 0c             	mov    0xc(%eax),%edx
  283756:	8b 45 0c             	mov    0xc(%ebp),%eax
  283759:	01 c2                	add    %eax,%edx
  28375b:	8b 45 08             	mov    0x8(%ebp),%eax
  28375e:	8b 40 20             	mov    0x20(%eax),%eax
  283761:	53                   	push   %ebx
  283762:	51                   	push   %ecx
  283763:	ff 75 f0             	pushl  -0x10(%ebp)
  283766:	57                   	push   %edi
  283767:	56                   	push   %esi
  283768:	52                   	push   %edx
  283769:	50                   	push   %eax
  28376a:	e8 8b f6 ff ff       	call   282dfa <sheet_refreshsub>
  28376f:	83 c4 1c             	add    $0x1c,%esp
	}
	return;
  283772:	90                   	nop
  283773:	90                   	nop
}
  283774:	8d 65 f4             	lea    -0xc(%ebp),%esp
  283777:	5b                   	pop    %ebx
  283778:	5e                   	pop    %esi
  283779:	5f                   	pop    %edi
  28377a:	5d                   	pop    %ebp
  28377b:	c3                   	ret    

0028377c <sheet_slide>:

void sheet_slide(struct SHEET *sht, int vx0, int vy0)
{
  28377c:	f3 0f 1e fb          	endbr32 
  283780:	55                   	push   %ebp
  283781:	89 e5                	mov    %esp,%ebp
  283783:	56                   	push   %esi
  283784:	53                   	push   %ebx
  283785:	83 ec 10             	sub    $0x10,%esp
	struct SHTCTL *ctl = sht->ctl;
  283788:	8b 45 08             	mov    0x8(%ebp),%eax
  28378b:	8b 40 20             	mov    0x20(%eax),%eax
  28378e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int old_vx0 = sht->vx0, old_vy0 = sht->vy0;
  283791:	8b 45 08             	mov    0x8(%ebp),%eax
  283794:	8b 40 0c             	mov    0xc(%eax),%eax
  283797:	89 45 f0             	mov    %eax,-0x10(%ebp)
  28379a:	8b 45 08             	mov    0x8(%ebp),%eax
  28379d:	8b 40 10             	mov    0x10(%eax),%eax
  2837a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
	sht->vx0 = vx0;
  2837a3:	8b 45 08             	mov    0x8(%ebp),%eax
  2837a6:	8b 55 0c             	mov    0xc(%ebp),%edx
  2837a9:	89 50 0c             	mov    %edx,0xc(%eax)
	sht->vy0 = vy0;
  2837ac:	8b 45 08             	mov    0x8(%ebp),%eax
  2837af:	8b 55 10             	mov    0x10(%ebp),%edx
  2837b2:	89 50 10             	mov    %edx,0x10(%eax)
	if (sht->height >= 0) { /* Ç‡ÇµÇ‡ï\é¶íÜÇ»ÇÁÅAêVÇµÇ¢â∫Ç∂Ç´ÇÃèÓïÒÇ…âàÇ¡ÇƒâÊñ Çï`Ç´íºÇ∑ */
  2837b5:	8b 45 08             	mov    0x8(%ebp),%eax
  2837b8:	8b 40 18             	mov    0x18(%eax),%eax
  2837bb:	85 c0                	test   %eax,%eax
  2837bd:	0f 88 c8 00 00 00    	js     28388b <sheet_slide+0x10f>
		sheet_refreshmap(ctl, old_vx0, old_vy0, old_vx0 + sht->bxsize, old_vy0 + sht->bysize, 0);
  2837c3:	8b 45 08             	mov    0x8(%ebp),%eax
  2837c6:	8b 50 08             	mov    0x8(%eax),%edx
  2837c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2837cc:	01 c2                	add    %eax,%edx
  2837ce:	8b 45 08             	mov    0x8(%ebp),%eax
  2837d1:	8b 48 04             	mov    0x4(%eax),%ecx
  2837d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2837d7:	01 c8                	add    %ecx,%eax
  2837d9:	6a 00                	push   $0x0
  2837db:	52                   	push   %edx
  2837dc:	50                   	push   %eax
  2837dd:	ff 75 ec             	pushl  -0x14(%ebp)
  2837e0:	ff 75 f0             	pushl  -0x10(%ebp)
  2837e3:	ff 75 f4             	pushl  -0xc(%ebp)
  2837e6:	e8 05 f3 ff ff       	call   282af0 <sheet_refreshmap>
  2837eb:	83 c4 18             	add    $0x18,%esp
		sheet_refreshmap(ctl, vx0, vy0, vx0 + sht->bxsize, vy0 + sht->bysize, sht->height);
  2837ee:	8b 45 08             	mov    0x8(%ebp),%eax
  2837f1:	8b 40 18             	mov    0x18(%eax),%eax
  2837f4:	8b 55 08             	mov    0x8(%ebp),%edx
  2837f7:	8b 4a 08             	mov    0x8(%edx),%ecx
  2837fa:	8b 55 10             	mov    0x10(%ebp),%edx
  2837fd:	01 d1                	add    %edx,%ecx
  2837ff:	8b 55 08             	mov    0x8(%ebp),%edx
  283802:	8b 5a 04             	mov    0x4(%edx),%ebx
  283805:	8b 55 0c             	mov    0xc(%ebp),%edx
  283808:	01 da                	add    %ebx,%edx
  28380a:	50                   	push   %eax
  28380b:	51                   	push   %ecx
  28380c:	52                   	push   %edx
  28380d:	ff 75 10             	pushl  0x10(%ebp)
  283810:	ff 75 0c             	pushl  0xc(%ebp)
  283813:	ff 75 f4             	pushl  -0xc(%ebp)
  283816:	e8 d5 f2 ff ff       	call   282af0 <sheet_refreshmap>
  28381b:	83 c4 18             	add    $0x18,%esp
		sheet_refreshsub(ctl, old_vx0, old_vy0, old_vx0 + sht->bxsize, old_vy0 + sht->bysize, 0, sht->height - 1);
  28381e:	8b 45 08             	mov    0x8(%ebp),%eax
  283821:	8b 40 18             	mov    0x18(%eax),%eax
  283824:	8d 48 ff             	lea    -0x1(%eax),%ecx
  283827:	8b 45 08             	mov    0x8(%ebp),%eax
  28382a:	8b 50 08             	mov    0x8(%eax),%edx
  28382d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  283830:	01 c2                	add    %eax,%edx
  283832:	8b 45 08             	mov    0x8(%ebp),%eax
  283835:	8b 58 04             	mov    0x4(%eax),%ebx
  283838:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28383b:	01 d8                	add    %ebx,%eax
  28383d:	51                   	push   %ecx
  28383e:	6a 00                	push   $0x0
  283840:	52                   	push   %edx
  283841:	50                   	push   %eax
  283842:	ff 75 ec             	pushl  -0x14(%ebp)
  283845:	ff 75 f0             	pushl  -0x10(%ebp)
  283848:	ff 75 f4             	pushl  -0xc(%ebp)
  28384b:	e8 aa f5 ff ff       	call   282dfa <sheet_refreshsub>
  283850:	83 c4 1c             	add    $0x1c,%esp
		sheet_refreshsub(ctl, vx0, vy0, vx0 + sht->bxsize, vy0 + sht->bysize, sht->height, sht->height);
  283853:	8b 45 08             	mov    0x8(%ebp),%eax
  283856:	8b 50 18             	mov    0x18(%eax),%edx
  283859:	8b 45 08             	mov    0x8(%ebp),%eax
  28385c:	8b 40 18             	mov    0x18(%eax),%eax
  28385f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  283862:	8b 59 08             	mov    0x8(%ecx),%ebx
  283865:	8b 4d 10             	mov    0x10(%ebp),%ecx
  283868:	01 cb                	add    %ecx,%ebx
  28386a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  28386d:	8b 71 04             	mov    0x4(%ecx),%esi
  283870:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  283873:	01 f1                	add    %esi,%ecx
  283875:	52                   	push   %edx
  283876:	50                   	push   %eax
  283877:	53                   	push   %ebx
  283878:	51                   	push   %ecx
  283879:	ff 75 10             	pushl  0x10(%ebp)
  28387c:	ff 75 0c             	pushl  0xc(%ebp)
  28387f:	ff 75 f4             	pushl  -0xc(%ebp)
  283882:	e8 73 f5 ff ff       	call   282dfa <sheet_refreshsub>
  283887:	83 c4 1c             	add    $0x1c,%esp
	}
	return;
  28388a:	90                   	nop
  28388b:	90                   	nop
}
  28388c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  28388f:	5b                   	pop    %ebx
  283890:	5e                   	pop    %esi
  283891:	5d                   	pop    %ebp
  283892:	c3                   	ret    

00283893 <sheet_free>:

void sheet_free(struct SHEET *sht)
{
  283893:	f3 0f 1e fb          	endbr32 
  283897:	55                   	push   %ebp
  283898:	89 e5                	mov    %esp,%ebp
	if (sht->height >= 0) {
  28389a:	8b 45 08             	mov    0x8(%ebp),%eax
  28389d:	8b 40 18             	mov    0x18(%eax),%eax
  2838a0:	85 c0                	test   %eax,%eax
  2838a2:	78 0d                	js     2838b1 <sheet_free+0x1e>
		sheet_updown(sht, -1); /* ï\é¶íÜÇ»ÇÁÇ‹Ç∏îÒï\é¶Ç…Ç∑ÇÈ */
  2838a4:	6a ff                	push   $0xffffffff
  2838a6:	ff 75 08             	pushl  0x8(%ebp)
  2838a9:	e8 de fa ff ff       	call   28338c <sheet_updown>
  2838ae:	83 c4 08             	add    $0x8,%esp
	}
	sht->flags = 0; /* ñ¢égópÉ}Å[ÉN */
  2838b1:	8b 45 08             	mov    0x8(%ebp),%eax
  2838b4:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	return;
  2838bb:	90                   	nop
}
  2838bc:	c9                   	leave  
  2838bd:	c3                   	ret    

002838be <init_pit>:

#define TIMER_FLAGS_ALLOC		1	/* ämï€ÇµÇΩèÛë‘ */
#define TIMER_FLAGS_USING		2	/* É^ÉCÉ}çÏìÆíÜ */

void init_pit(void)
{
  2838be:	f3 0f 1e fb          	endbr32 
  2838c2:	55                   	push   %ebp
  2838c3:	89 e5                	mov    %esp,%ebp
  2838c5:	83 ec 18             	sub    $0x18,%esp
	int i;
	struct TIMER *t;
	io_out8(PIT_CTRL, 0x34);
  2838c8:	83 ec 08             	sub    $0x8,%esp
  2838cb:	6a 34                	push   $0x34
  2838cd:	6a 43                	push   $0x43
  2838cf:	e8 a2 d8 ff ff       	call   281176 <io_out8>
  2838d4:	83 c4 10             	add    $0x10,%esp
	io_out8(PIT_CNT0, 0x9c);
  2838d7:	83 ec 08             	sub    $0x8,%esp
  2838da:	68 9c 00 00 00       	push   $0x9c
  2838df:	6a 40                	push   $0x40
  2838e1:	e8 90 d8 ff ff       	call   281176 <io_out8>
  2838e6:	83 c4 10             	add    $0x10,%esp
	io_out8(PIT_CNT0, 0x2e);
  2838e9:	83 ec 08             	sub    $0x8,%esp
  2838ec:	6a 2e                	push   $0x2e
  2838ee:	6a 40                	push   $0x40
  2838f0:	e8 81 d8 ff ff       	call   281176 <io_out8>
  2838f5:	83 c4 10             	add    $0x10,%esp
	timerctl.count = 0;
  2838f8:	c7 05 c0 6f 32 00 00 	movl   $0x0,0x326fc0
  2838ff:	00 00 00 
	for (i = 0; i < MAX_TIMER; i++) {
  283902:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  283909:	eb 19                	jmp    283924 <init_pit+0x66>
		timerctl.timers0[i].flags = 0; /* ñ¢égóp */
  28390b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  28390e:	89 d0                	mov    %edx,%eax
  283910:	c1 e0 02             	shl    $0x2,%eax
  283913:	01 d0                	add    %edx,%eax
  283915:	c1 e0 02             	shl    $0x2,%eax
  283918:	05 d4 6f 32 00       	add    $0x326fd4,%eax
  28391d:	c6 00 00             	movb   $0x0,(%eax)
	for (i = 0; i < MAX_TIMER; i++) {
  283920:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  283924:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
  28392b:	7e de                	jle    28390b <init_pit+0x4d>
	}
	t = timer_alloc(); /* àÍÇ¬Ç‡ÇÁÇ¡ÇƒÇ≠ÇÈ */
  28392d:	e8 32 00 00 00       	call   283964 <timer_alloc>
  283932:	89 45 f0             	mov    %eax,-0x10(%ebp)
	t->timeout = 0xffffffff;
  283935:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283938:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
	t->flags = TIMER_FLAGS_USING;
  28393f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283942:	c6 40 08 02          	movb   $0x2,0x8(%eax)
	t->next = 0; /* àÍî‘Ç§ÇµÇÎ */
  283946:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283949:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	timerctl.t0 = t; /* ç°ÇÕî‘ï∫ÇµÇ©Ç¢Ç»Ç¢ÇÃÇ≈êÊì™Ç≈Ç‡Ç†ÇÈ */
  28394f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283952:	a3 c8 6f 32 00       	mov    %eax,0x326fc8
	timerctl.next = 0xffffffff; /* î‘ï∫ÇµÇ©Ç¢Ç»Ç¢ÇÃÇ≈î‘ï∫ÇÃéûçè */
  283957:	c7 05 c4 6f 32 00 ff 	movl   $0xffffffff,0x326fc4
  28395e:	ff ff ff 
	return;
  283961:	90                   	nop
}
  283962:	c9                   	leave  
  283963:	c3                   	ret    

00283964 <timer_alloc>:

struct TIMER *timer_alloc(void)
{
  283964:	f3 0f 1e fb          	endbr32 
  283968:	55                   	push   %ebp
  283969:	89 e5                	mov    %esp,%ebp
  28396b:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < MAX_TIMER; i++) {
  28396e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  283975:	eb 5e                	jmp    2839d5 <timer_alloc+0x71>
		if (timerctl.timers0[i].flags == 0) {
  283977:	8b 55 fc             	mov    -0x4(%ebp),%edx
  28397a:	89 d0                	mov    %edx,%eax
  28397c:	c1 e0 02             	shl    $0x2,%eax
  28397f:	01 d0                	add    %edx,%eax
  283981:	c1 e0 02             	shl    $0x2,%eax
  283984:	05 d4 6f 32 00       	add    $0x326fd4,%eax
  283989:	0f b6 00             	movzbl (%eax),%eax
  28398c:	84 c0                	test   %al,%al
  28398e:	75 41                	jne    2839d1 <timer_alloc+0x6d>
			timerctl.timers0[i].flags = TIMER_FLAGS_ALLOC;
  283990:	8b 55 fc             	mov    -0x4(%ebp),%edx
  283993:	89 d0                	mov    %edx,%eax
  283995:	c1 e0 02             	shl    $0x2,%eax
  283998:	01 d0                	add    %edx,%eax
  28399a:	c1 e0 02             	shl    $0x2,%eax
  28399d:	05 d4 6f 32 00       	add    $0x326fd4,%eax
  2839a2:	c6 00 01             	movb   $0x1,(%eax)
			timerctl.timers0[i].flags2 = 0;
  2839a5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2839a8:	89 d0                	mov    %edx,%eax
  2839aa:	c1 e0 02             	shl    $0x2,%eax
  2839ad:	01 d0                	add    %edx,%eax
  2839af:	c1 e0 02             	shl    $0x2,%eax
  2839b2:	05 d5 6f 32 00       	add    $0x326fd5,%eax
  2839b7:	c6 00 00             	movb   $0x0,(%eax)
			return &timerctl.timers0[i];
  2839ba:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2839bd:	89 d0                	mov    %edx,%eax
  2839bf:	c1 e0 02             	shl    $0x2,%eax
  2839c2:	01 d0                	add    %edx,%eax
  2839c4:	c1 e0 02             	shl    $0x2,%eax
  2839c7:	05 c0 6f 32 00       	add    $0x326fc0,%eax
  2839cc:	83 c0 0c             	add    $0xc,%eax
  2839cf:	eb 12                	jmp    2839e3 <timer_alloc+0x7f>
	for (i = 0; i < MAX_TIMER; i++) {
  2839d1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  2839d5:	81 7d fc f3 01 00 00 	cmpl   $0x1f3,-0x4(%ebp)
  2839dc:	7e 99                	jle    283977 <timer_alloc+0x13>
		}
	}
	return 0; /* å©Ç¬Ç©ÇÁÇ»Ç©Ç¡ÇΩ */
  2839de:	b8 00 00 00 00       	mov    $0x0,%eax
}
  2839e3:	c9                   	leave  
  2839e4:	c3                   	ret    

002839e5 <timer_free>:

void timer_free(struct TIMER *timer)
{
  2839e5:	f3 0f 1e fb          	endbr32 
  2839e9:	55                   	push   %ebp
  2839ea:	89 e5                	mov    %esp,%ebp
	timer->flags = 0; /* ñ¢égóp */
  2839ec:	8b 45 08             	mov    0x8(%ebp),%eax
  2839ef:	c6 40 08 00          	movb   $0x0,0x8(%eax)
	return;
  2839f3:	90                   	nop
}
  2839f4:	5d                   	pop    %ebp
  2839f5:	c3                   	ret    

002839f6 <timer_init>:

void timer_init(struct TIMER *timer, struct FIFO32 *fifo, int data)
{
  2839f6:	f3 0f 1e fb          	endbr32 
  2839fa:	55                   	push   %ebp
  2839fb:	89 e5                	mov    %esp,%ebp
	timer->fifo = fifo;
  2839fd:	8b 45 08             	mov    0x8(%ebp),%eax
  283a00:	8b 55 0c             	mov    0xc(%ebp),%edx
  283a03:	89 50 0c             	mov    %edx,0xc(%eax)
	timer->data = data;
  283a06:	8b 45 08             	mov    0x8(%ebp),%eax
  283a09:	8b 55 10             	mov    0x10(%ebp),%edx
  283a0c:	89 50 10             	mov    %edx,0x10(%eax)
	return;
  283a0f:	90                   	nop
}
  283a10:	5d                   	pop    %ebp
  283a11:	c3                   	ret    

00283a12 <timer_settime>:

void timer_settime(struct TIMER *timer, unsigned int timeout)
{
  283a12:	f3 0f 1e fb          	endbr32 
  283a16:	55                   	push   %ebp
  283a17:	89 e5                	mov    %esp,%ebp
  283a19:	83 ec 18             	sub    $0x18,%esp
	int e;
	struct TIMER *t, *s;
	timer->timeout = timeout + timerctl.count;
  283a1c:	8b 15 c0 6f 32 00    	mov    0x326fc0,%edx
  283a22:	8b 45 0c             	mov    0xc(%ebp),%eax
  283a25:	01 c2                	add    %eax,%edx
  283a27:	8b 45 08             	mov    0x8(%ebp),%eax
  283a2a:	89 50 04             	mov    %edx,0x4(%eax)
	timer->flags = TIMER_FLAGS_USING;
  283a2d:	8b 45 08             	mov    0x8(%ebp),%eax
  283a30:	c6 40 08 02          	movb   $0x2,0x8(%eax)
	e = io_load_eflags();
  283a34:	e8 5c d7 ff ff       	call   281195 <io_load_eflags>
  283a39:	89 45 f0             	mov    %eax,-0x10(%ebp)
	io_cli();
  283a3c:	e8 11 d7 ff ff       	call   281152 <io_cli>
	t = timerctl.t0;
  283a41:	a1 c8 6f 32 00       	mov    0x326fc8,%eax
  283a46:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (timer->timeout <= t->timeout) {
  283a49:	8b 45 08             	mov    0x8(%ebp),%eax
  283a4c:	8b 50 04             	mov    0x4(%eax),%edx
  283a4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283a52:	8b 40 04             	mov    0x4(%eax),%eax
  283a55:	39 c2                	cmp    %eax,%edx
  283a57:	77 2b                	ja     283a84 <timer_settime+0x72>
		/* êÊì™Ç…ì¸ÇÍÇÈèÍçá */
		timerctl.t0 = timer;
  283a59:	8b 45 08             	mov    0x8(%ebp),%eax
  283a5c:	a3 c8 6f 32 00       	mov    %eax,0x326fc8
		timer->next = t; /* éüÇÕt */
  283a61:	8b 45 08             	mov    0x8(%ebp),%eax
  283a64:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283a67:	89 10                	mov    %edx,(%eax)
		timerctl.next = timer->timeout;
  283a69:	8b 45 08             	mov    0x8(%ebp),%eax
  283a6c:	8b 40 04             	mov    0x4(%eax),%eax
  283a6f:	a3 c4 6f 32 00       	mov    %eax,0x326fc4
		io_store_eflags(e);
  283a74:	83 ec 0c             	sub    $0xc,%esp
  283a77:	ff 75 f0             	pushl  -0x10(%ebp)
  283a7a:	e8 19 d7 ff ff       	call   281198 <io_store_eflags>
  283a7f:	83 c4 10             	add    $0x10,%esp
		return;
  283a82:	eb 3c                	jmp    283ac0 <timer_settime+0xae>
	}
	/* Ç«Ç±Ç…ì¸ÇÍÇÍÇŒÇ¢Ç¢Ç©ÇíTÇ∑ */
	for (;;) {
		s = t;
  283a84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283a87:	89 45 ec             	mov    %eax,-0x14(%ebp)
		t = t->next;
  283a8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283a8d:	8b 00                	mov    (%eax),%eax
  283a8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if (timer->timeout <= t->timeout) {
  283a92:	8b 45 08             	mov    0x8(%ebp),%eax
  283a95:	8b 50 04             	mov    0x4(%eax),%edx
  283a98:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283a9b:	8b 40 04             	mov    0x4(%eax),%eax
  283a9e:	39 c2                	cmp    %eax,%edx
  283aa0:	77 e2                	ja     283a84 <timer_settime+0x72>
			/* sÇ∆tÇÃä‘Ç…ì¸ÇÍÇÈèÍçá */
			s->next = timer; /* sÇÃéüÇÕtimer */
  283aa2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  283aa5:	8b 55 08             	mov    0x8(%ebp),%edx
  283aa8:	89 10                	mov    %edx,(%eax)
			timer->next = t; /* timerÇÃéüÇÕt */
  283aaa:	8b 45 08             	mov    0x8(%ebp),%eax
  283aad:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283ab0:	89 10                	mov    %edx,(%eax)
			io_store_eflags(e);
  283ab2:	83 ec 0c             	sub    $0xc,%esp
  283ab5:	ff 75 f0             	pushl  -0x10(%ebp)
  283ab8:	e8 db d6 ff ff       	call   281198 <io_store_eflags>
  283abd:	83 c4 10             	add    $0x10,%esp
			return;
		}
	}
}
  283ac0:	c9                   	leave  
  283ac1:	c3                   	ret    

00283ac2 <inthandler20>:

void inthandler20(int *esp)
{
  283ac2:	f3 0f 1e fb          	endbr32 
  283ac6:	55                   	push   %ebp
  283ac7:	89 e5                	mov    %esp,%ebp
  283ac9:	83 ec 18             	sub    $0x18,%esp
	struct TIMER *timer;
	char ts = 0;
  283acc:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
	io_out8(PIC0_OCW2, 0x60);	/* IRQ-00éÛïtäÆóπÇPICÇ…í ím */
  283ad0:	83 ec 08             	sub    $0x8,%esp
  283ad3:	6a 60                	push   $0x60
  283ad5:	6a 20                	push   $0x20
  283ad7:	e8 9a d6 ff ff       	call   281176 <io_out8>
  283adc:	83 c4 10             	add    $0x10,%esp
	timerctl.count++;
  283adf:	a1 c0 6f 32 00       	mov    0x326fc0,%eax
  283ae4:	83 c0 01             	add    $0x1,%eax
  283ae7:	a3 c0 6f 32 00       	mov    %eax,0x326fc0
	if (timerctl.next > timerctl.count) {
  283aec:	8b 15 c4 6f 32 00    	mov    0x326fc4,%edx
  283af2:	a1 c0 6f 32 00       	mov    0x326fc0,%eax
  283af7:	39 c2                	cmp    %eax,%edx
  283af9:	77 72                	ja     283b6d <inthandler20+0xab>
		return;
	}
	timer = timerctl.t0; /* Ç∆ÇËÇ†Ç¶Ç∏êÊì™ÇÃî‘ínÇtimerÇ…ë„ì¸ */
  283afb:	a1 c8 6f 32 00       	mov    0x326fc8,%eax
  283b00:	89 45 f4             	mov    %eax,-0xc(%ebp)
	for (;;) {
		/* timersÇÃÉ^ÉCÉ}ÇÕëSÇƒìÆçÏíÜÇÃÇ‡ÇÃÇ»ÇÃÇ≈ÅAflagsÇämîFÇµÇ»Ç¢ */
		if (timer->timeout > timerctl.count) {
  283b03:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283b06:	8b 50 04             	mov    0x4(%eax),%edx
  283b09:	a1 c0 6f 32 00       	mov    0x326fc0,%eax
  283b0e:	39 c2                	cmp    %eax,%edx
  283b10:	77 3a                	ja     283b4c <inthandler20+0x8a>
			break;
		}
		/* É^ÉCÉÄÉAÉEÉg */
		timer->flags = TIMER_FLAGS_ALLOC;
  283b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283b15:	c6 40 08 01          	movb   $0x1,0x8(%eax)
		if (timer != task_timer) {
  283b19:	a1 e0 96 32 00       	mov    0x3296e0,%eax
  283b1e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  283b21:	74 1b                	je     283b3e <inthandler20+0x7c>
			fifo32_put(timer->fifo, timer->data);
  283b23:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283b26:	8b 50 10             	mov    0x10(%eax),%edx
  283b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283b2c:	8b 40 0c             	mov    0xc(%eax),%eax
  283b2f:	83 ec 08             	sub    $0x8,%esp
  283b32:	52                   	push   %edx
  283b33:	50                   	push   %eax
  283b34:	e8 72 e5 ff ff       	call   2820ab <fifo32_put>
  283b39:	83 c4 10             	add    $0x10,%esp
  283b3c:	eb 04                	jmp    283b42 <inthandler20+0x80>
		} else {
			ts = 1; /* task_timerÇ™É^ÉCÉÄÉAÉEÉgÇµÇΩ */
  283b3e:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
		}
		timer = timer->next; /* éüÇÃÉ^ÉCÉ}ÇÃî‘ínÇtimerÇ…ë„ì¸ */
  283b42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283b45:	8b 00                	mov    (%eax),%eax
  283b47:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if (timer->timeout > timerctl.count) {
  283b4a:	eb b7                	jmp    283b03 <inthandler20+0x41>
			break;
  283b4c:	90                   	nop
	}
	timerctl.t0 = timer;
  283b4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283b50:	a3 c8 6f 32 00       	mov    %eax,0x326fc8
	timerctl.next = timer->timeout;
  283b55:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283b58:	8b 40 04             	mov    0x4(%eax),%eax
  283b5b:	a3 c4 6f 32 00       	mov    %eax,0x326fc4
	if (ts != 0) {
  283b60:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  283b64:	74 0a                	je     283b70 <inthandler20+0xae>
		task_switch();
  283b66:	e8 3e 07 00 00       	call   2842a9 <task_switch>
	}
	return;
  283b6b:	eb 03                	jmp    283b70 <inthandler20+0xae>
		return;
  283b6d:	90                   	nop
  283b6e:	eb 01                	jmp    283b71 <inthandler20+0xaf>
	return;
  283b70:	90                   	nop
}
  283b71:	c9                   	leave  
  283b72:	c3                   	ret    

00283b73 <timer_cancel>:

int timer_cancel(struct TIMER *timer)
{
  283b73:	f3 0f 1e fb          	endbr32 
  283b77:	55                   	push   %ebp
  283b78:	89 e5                	mov    %esp,%ebp
  283b7a:	83 ec 18             	sub    $0x18,%esp
	int e;
	struct TIMER *t;
	e = io_load_eflags();
  283b7d:	e8 13 d6 ff ff       	call   281195 <io_load_eflags>
  283b82:	89 45 f0             	mov    %eax,-0x10(%ebp)
	io_cli();	/* ê›íËíÜÇ…É^ÉCÉ}ÇÃèÛë‘Ç™ïœâªÇµÇ»Ç¢ÇÊÇ§Ç…Ç∑ÇÈÇΩÇﬂ */
  283b85:	e8 c8 d5 ff ff       	call   281152 <io_cli>
	if (timer->flags == TIMER_FLAGS_USING) {	/* éÊÇËè¡ÇµèàóùÇÕïKóvÇ©ÅH */
  283b8a:	8b 45 08             	mov    0x8(%ebp),%eax
  283b8d:	0f b6 40 08          	movzbl 0x8(%eax),%eax
  283b91:	3c 02                	cmp    $0x2,%al
  283b93:	75 6a                	jne    283bff <timer_cancel+0x8c>
		if (timer == timerctl.t0) {
  283b95:	a1 c8 6f 32 00       	mov    0x326fc8,%eax
  283b9a:	39 45 08             	cmp    %eax,0x8(%ebp)
  283b9d:	75 1d                	jne    283bbc <timer_cancel+0x49>
			/* êÊì™ÇæÇ¡ÇΩèÍçáÇÃéÊÇËè¡Çµèàóù */
			t = timer->next;
  283b9f:	8b 45 08             	mov    0x8(%ebp),%eax
  283ba2:	8b 00                	mov    (%eax),%eax
  283ba4:	89 45 f4             	mov    %eax,-0xc(%ebp)
			timerctl.t0 = t;
  283ba7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283baa:	a3 c8 6f 32 00       	mov    %eax,0x326fc8
			timerctl.next = t->timeout;
  283baf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283bb2:	8b 40 04             	mov    0x4(%eax),%eax
  283bb5:	a3 c4 6f 32 00       	mov    %eax,0x326fc4
  283bba:	eb 27                	jmp    283be3 <timer_cancel+0x70>
		} else {
			/* êÊì™à»äOÇÃèÍçáÇÃéÊÇËè¡Çµèàóù */
			/* timerÇÃàÍÇ¬ëOÇíTÇ∑ */
			t = timerctl.t0;
  283bbc:	a1 c8 6f 32 00       	mov    0x326fc8,%eax
  283bc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
			for (;;) {
				if (t->next == timer) {
  283bc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283bc7:	8b 00                	mov    (%eax),%eax
  283bc9:	39 45 08             	cmp    %eax,0x8(%ebp)
  283bcc:	74 0a                	je     283bd8 <timer_cancel+0x65>
					break;
				}
				t = t->next;
  283bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283bd1:	8b 00                	mov    (%eax),%eax
  283bd3:	89 45 f4             	mov    %eax,-0xc(%ebp)
				if (t->next == timer) {
  283bd6:	eb ec                	jmp    283bc4 <timer_cancel+0x51>
					break;
  283bd8:	90                   	nop
			}
			t->next = timer->next; /* ÅutimerÇÃíºëOÅvÇÃéüÇ™ÅAÅutimerÇÃéüÅvÇéwÇ∑ÇÊÇ§Ç…Ç∑ÇÈ */
  283bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  283bdc:	8b 10                	mov    (%eax),%edx
  283bde:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283be1:	89 10                	mov    %edx,(%eax)
		}
		timer->flags = TIMER_FLAGS_ALLOC;
  283be3:	8b 45 08             	mov    0x8(%ebp),%eax
  283be6:	c6 40 08 01          	movb   $0x1,0x8(%eax)
		io_store_eflags(e);
  283bea:	83 ec 0c             	sub    $0xc,%esp
  283bed:	ff 75 f0             	pushl  -0x10(%ebp)
  283bf0:	e8 a3 d5 ff ff       	call   281198 <io_store_eflags>
  283bf5:	83 c4 10             	add    $0x10,%esp
		return 1;	/* ÉLÉÉÉìÉZÉãèàóùê¨å˜ */
  283bf8:	b8 01 00 00 00       	mov    $0x1,%eax
  283bfd:	eb 13                	jmp    283c12 <timer_cancel+0x9f>
	}
	io_store_eflags(e);
  283bff:	83 ec 0c             	sub    $0xc,%esp
  283c02:	ff 75 f0             	pushl  -0x10(%ebp)
  283c05:	e8 8e d5 ff ff       	call   281198 <io_store_eflags>
  283c0a:	83 c4 10             	add    $0x10,%esp
	return 0; /* ÉLÉÉÉìÉZÉãèàóùÇÕïsóvÇæÇ¡ÇΩ */
  283c0d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  283c12:	c9                   	leave  
  283c13:	c3                   	ret    

00283c14 <timer_cancelall>:

void timer_cancelall(struct FIFO32 *fifo)
{
  283c14:	f3 0f 1e fb          	endbr32 
  283c18:	55                   	push   %ebp
  283c19:	89 e5                	mov    %esp,%ebp
  283c1b:	83 ec 18             	sub    $0x18,%esp
	int e, i;
	struct TIMER *t;
	e = io_load_eflags();
  283c1e:	e8 72 d5 ff ff       	call   281195 <io_load_eflags>
  283c23:	89 45 f0             	mov    %eax,-0x10(%ebp)
	io_cli();	/* ê›íËíÜÇ…É^ÉCÉ}ÇÃèÛë‘Ç™ïœâªÇµÇ»Ç¢ÇÊÇ§Ç…Ç∑ÇÈÇΩÇﬂ */
  283c26:	e8 27 d5 ff ff       	call   281152 <io_cli>
	for (i = 0; i < MAX_TIMER; i++) {
  283c2b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  283c32:	eb 59                	jmp    283c8d <timer_cancelall+0x79>
		t = &timerctl.timers0[i];
  283c34:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283c37:	89 d0                	mov    %edx,%eax
  283c39:	c1 e0 02             	shl    $0x2,%eax
  283c3c:	01 d0                	add    %edx,%eax
  283c3e:	c1 e0 02             	shl    $0x2,%eax
  283c41:	05 c0 6f 32 00       	add    $0x326fc0,%eax
  283c46:	83 c0 0c             	add    $0xc,%eax
  283c49:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if (t->flags != 0 && t->flags2 != 0 && t->fifo == fifo) {
  283c4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  283c4f:	0f b6 40 08          	movzbl 0x8(%eax),%eax
  283c53:	84 c0                	test   %al,%al
  283c55:	74 32                	je     283c89 <timer_cancelall+0x75>
  283c57:	8b 45 ec             	mov    -0x14(%ebp),%eax
  283c5a:	0f b6 40 09          	movzbl 0x9(%eax),%eax
  283c5e:	84 c0                	test   %al,%al
  283c60:	74 27                	je     283c89 <timer_cancelall+0x75>
  283c62:	8b 45 ec             	mov    -0x14(%ebp),%eax
  283c65:	8b 40 0c             	mov    0xc(%eax),%eax
  283c68:	39 45 08             	cmp    %eax,0x8(%ebp)
  283c6b:	75 1c                	jne    283c89 <timer_cancelall+0x75>
			timer_cancel(t);
  283c6d:	83 ec 0c             	sub    $0xc,%esp
  283c70:	ff 75 ec             	pushl  -0x14(%ebp)
  283c73:	e8 fb fe ff ff       	call   283b73 <timer_cancel>
  283c78:	83 c4 10             	add    $0x10,%esp
			timer_free(t);
  283c7b:	83 ec 0c             	sub    $0xc,%esp
  283c7e:	ff 75 ec             	pushl  -0x14(%ebp)
  283c81:	e8 5f fd ff ff       	call   2839e5 <timer_free>
  283c86:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < MAX_TIMER; i++) {
  283c89:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  283c8d:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
  283c94:	7e 9e                	jle    283c34 <timer_cancelall+0x20>
		}
	}
	io_store_eflags(e);
  283c96:	83 ec 0c             	sub    $0xc,%esp
  283c99:	ff 75 f0             	pushl  -0x10(%ebp)
  283c9c:	e8 f7 d4 ff ff       	call   281198 <io_store_eflags>
  283ca1:	83 c4 10             	add    $0x10,%esp
	return;
  283ca4:	90                   	nop
}
  283ca5:	c9                   	leave  
  283ca6:	c3                   	ret    

00283ca7 <task_now>:

struct TASKCTL *taskctl;
struct TIMER *task_timer;

struct TASK *task_now(void)
{
  283ca7:	f3 0f 1e fb          	endbr32 
  283cab:	55                   	push   %ebp
  283cac:	89 e5                	mov    %esp,%ebp
  283cae:	83 ec 10             	sub    $0x10,%esp
	struct TASKLEVEL *tl = &taskctl->level[taskctl->now_lv];
  283cb1:	8b 15 dc 96 32 00    	mov    0x3296dc,%edx
  283cb7:	a1 dc 96 32 00       	mov    0x3296dc,%eax
  283cbc:	8b 00                	mov    (%eax),%eax
  283cbe:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
  283cc4:	01 d0                	add    %edx,%eax
  283cc6:	83 c0 08             	add    $0x8,%eax
  283cc9:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return tl->tasks[tl->now];
  283ccc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  283ccf:	8b 50 04             	mov    0x4(%eax),%edx
  283cd2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  283cd5:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
}
  283cd9:	c9                   	leave  
  283cda:	c3                   	ret    

00283cdb <task_add>:

void task_add(struct TASK *task)
{
  283cdb:	f3 0f 1e fb          	endbr32 
  283cdf:	55                   	push   %ebp
  283ce0:	89 e5                	mov    %esp,%ebp
  283ce2:	83 ec 10             	sub    $0x10,%esp
	struct TASKLEVEL *tl = &taskctl->level[task->level];
  283ce5:	8b 15 dc 96 32 00    	mov    0x3296dc,%edx
  283ceb:	8b 45 08             	mov    0x8(%ebp),%eax
  283cee:	8b 40 08             	mov    0x8(%eax),%eax
  283cf1:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
  283cf7:	01 d0                	add    %edx,%eax
  283cf9:	83 c0 08             	add    $0x8,%eax
  283cfc:	89 45 fc             	mov    %eax,-0x4(%ebp)
	tl->tasks[tl->running] = task;
  283cff:	8b 45 fc             	mov    -0x4(%ebp),%eax
  283d02:	8b 10                	mov    (%eax),%edx
  283d04:	8b 45 fc             	mov    -0x4(%ebp),%eax
  283d07:	8b 4d 08             	mov    0x8(%ebp),%ecx
  283d0a:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
	tl->running++;
  283d0e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  283d11:	8b 00                	mov    (%eax),%eax
  283d13:	8d 50 01             	lea    0x1(%eax),%edx
  283d16:	8b 45 fc             	mov    -0x4(%ebp),%eax
  283d19:	89 10                	mov    %edx,(%eax)
	task->flags = 2; /* ìÆçÏíÜ */
  283d1b:	8b 45 08             	mov    0x8(%ebp),%eax
  283d1e:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%eax)
	return;
  283d25:	90                   	nop
}
  283d26:	c9                   	leave  
  283d27:	c3                   	ret    

00283d28 <task_remove>:

void task_remove(struct TASK *task)
{
  283d28:	f3 0f 1e fb          	endbr32 
  283d2c:	55                   	push   %ebp
  283d2d:	89 e5                	mov    %esp,%ebp
  283d2f:	83 ec 10             	sub    $0x10,%esp
	int i;
	struct TASKLEVEL *tl = &taskctl->level[task->level];
  283d32:	8b 15 dc 96 32 00    	mov    0x3296dc,%edx
  283d38:	8b 45 08             	mov    0x8(%ebp),%eax
  283d3b:	8b 40 08             	mov    0x8(%eax),%eax
  283d3e:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
  283d44:	01 d0                	add    %edx,%eax
  283d46:	83 c0 08             	add    $0x8,%eax
  283d49:	89 45 f8             	mov    %eax,-0x8(%ebp)

	/* taskÇ™Ç«Ç±Ç…Ç¢ÇÈÇ©ÇíTÇ∑ */
	for (i = 0; i < tl->running; i++) {
  283d4c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  283d53:	eb 13                	jmp    283d68 <task_remove+0x40>
		if (tl->tasks[i] == task) {
  283d55:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283d58:	8b 55 fc             	mov    -0x4(%ebp),%edx
  283d5b:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  283d5f:	39 45 08             	cmp    %eax,0x8(%ebp)
  283d62:	74 10                	je     283d74 <task_remove+0x4c>
	for (i = 0; i < tl->running; i++) {
  283d64:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  283d68:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283d6b:	8b 00                	mov    (%eax),%eax
  283d6d:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  283d70:	7c e3                	jl     283d55 <task_remove+0x2d>
  283d72:	eb 01                	jmp    283d75 <task_remove+0x4d>
			/* Ç±Ç±Ç…Ç¢ÇΩ */
			break;
  283d74:	90                   	nop
		}
	}

	tl->running--;
  283d75:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283d78:	8b 00                	mov    (%eax),%eax
  283d7a:	8d 50 ff             	lea    -0x1(%eax),%edx
  283d7d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283d80:	89 10                	mov    %edx,(%eax)
	if (i < tl->now) {
  283d82:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283d85:	8b 40 04             	mov    0x4(%eax),%eax
  283d88:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  283d8b:	7d 0f                	jge    283d9c <task_remove+0x74>
		tl->now--; /* Ç∏ÇÍÇÈÇÃÇ≈ÅAÇ±ÇÍÇ‡Ç†ÇÌÇπÇƒÇ®Ç≠ */
  283d8d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283d90:	8b 40 04             	mov    0x4(%eax),%eax
  283d93:	8d 50 ff             	lea    -0x1(%eax),%edx
  283d96:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283d99:	89 50 04             	mov    %edx,0x4(%eax)
	}
	if (tl->now >= tl->running) {
  283d9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283d9f:	8b 50 04             	mov    0x4(%eax),%edx
  283da2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283da5:	8b 00                	mov    (%eax),%eax
  283da7:	39 c2                	cmp    %eax,%edx
  283da9:	7c 0a                	jl     283db5 <task_remove+0x8d>
		/* nowÇ™Ç®Ç©ÇµÇ»ílÇ…Ç»Ç¡ÇƒÇ¢ÇΩÇÁÅAèCê≥Ç∑ÇÈ */
		tl->now = 0;
  283dab:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283dae:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	task->flags = 1; /* ÉXÉäÅ[ÉvíÜ */
  283db5:	8b 45 08             	mov    0x8(%ebp),%eax
  283db8:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)

	/* Ç∏ÇÁÇµ */
	for (; i < tl->running; i++) {
  283dbf:	eb 1b                	jmp    283ddc <task_remove+0xb4>
		tl->tasks[i] = tl->tasks[i + 1];
  283dc1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  283dc4:	8d 50 01             	lea    0x1(%eax),%edx
  283dc7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283dca:	8b 4c 90 08          	mov    0x8(%eax,%edx,4),%ecx
  283dce:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283dd1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  283dd4:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
	for (; i < tl->running; i++) {
  283dd8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  283ddc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  283ddf:	8b 00                	mov    (%eax),%eax
  283de1:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  283de4:	7c db                	jl     283dc1 <task_remove+0x99>
	}

	return;
  283de6:	90                   	nop
}
  283de7:	c9                   	leave  
  283de8:	c3                   	ret    

00283de9 <task_switchsub>:

void task_switchsub(void)
{
  283de9:	f3 0f 1e fb          	endbr32 
  283ded:	55                   	push   %ebp
  283dee:	89 e5                	mov    %esp,%ebp
  283df0:	83 ec 10             	sub    $0x10,%esp
	int i;
	/* àÍî‘è„ÇÃÉåÉxÉãÇíTÇ∑ */
	for (i = 0; i < MAX_TASKLEVELS; i++) {
  283df3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  283dfa:	eb 1e                	jmp    283e1a <task_switchsub+0x31>
		if (taskctl->level[i].running > 0) {
  283dfc:	8b 15 dc 96 32 00    	mov    0x3296dc,%edx
  283e02:	8b 45 fc             	mov    -0x4(%ebp),%eax
  283e05:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
  283e0b:	01 d0                	add    %edx,%eax
  283e0d:	83 c0 08             	add    $0x8,%eax
  283e10:	8b 00                	mov    (%eax),%eax
  283e12:	85 c0                	test   %eax,%eax
  283e14:	7f 0c                	jg     283e22 <task_switchsub+0x39>
	for (i = 0; i < MAX_TASKLEVELS; i++) {
  283e16:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  283e1a:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  283e1e:	7e dc                	jle    283dfc <task_switchsub+0x13>
  283e20:	eb 01                	jmp    283e23 <task_switchsub+0x3a>
			break; /* å©Ç¬Ç©Ç¡ÇΩ */
  283e22:	90                   	nop
		}
	}
	taskctl->now_lv = i;
  283e23:	a1 dc 96 32 00       	mov    0x3296dc,%eax
  283e28:	8b 55 fc             	mov    -0x4(%ebp),%edx
  283e2b:	89 10                	mov    %edx,(%eax)
	taskctl->lv_change = 0;
  283e2d:	a1 dc 96 32 00       	mov    0x3296dc,%eax
  283e32:	c6 40 04 00          	movb   $0x0,0x4(%eax)
	return;
  283e36:	90                   	nop
}
  283e37:	c9                   	leave  
  283e38:	c3                   	ret    

00283e39 <task_idle>:

void task_idle(void)
{
  283e39:	f3 0f 1e fb          	endbr32 
  283e3d:	55                   	push   %ebp
  283e3e:	89 e5                	mov    %esp,%ebp
  283e40:	83 ec 08             	sub    $0x8,%esp
	for (;;) {
		io_hlt();
  283e43:	e8 08 d3 ff ff       	call   281150 <io_hlt>
  283e48:	eb f9                	jmp    283e43 <task_idle+0xa>

00283e4a <task_init>:
	}
}

struct TASK *task_init(struct MEMMAN *memman)
{
  283e4a:	f3 0f 1e fb          	endbr32 
  283e4e:	55                   	push   %ebp
  283e4f:	89 e5                	mov    %esp,%ebp
  283e51:	53                   	push   %ebx
  283e52:	83 ec 14             	sub    $0x14,%esp
	int i;
	struct TASK *task, *idle;
	struct SEGMENT_DESCRIPTOR *gdt = (struct SEGMENT_DESCRIPTOR *) ADR_GDT;
  283e55:	c7 45 f0 00 00 27 00 	movl   $0x270000,-0x10(%ebp)

	taskctl = (struct TASKCTL *) memman_alloc_4k(memman, sizeof (struct TASKCTL));
  283e5c:	83 ec 08             	sub    $0x8,%esp
  283e5f:	68 f8 fd 02 00       	push   $0x2fdf8
  283e64:	ff 75 08             	pushl  0x8(%ebp)
  283e67:	e8 88 ea ff ff       	call   2828f4 <memman_alloc_4k>
  283e6c:	83 c4 10             	add    $0x10,%esp
  283e6f:	a3 dc 96 32 00       	mov    %eax,0x3296dc
	for (i = 0; i < MAX_TASKS; i++) {
  283e74:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  283e7b:	e9 f9 00 00 00       	jmp    283f79 <task_init+0x12f>
		taskctl->tasks0[i].flags = 0;
  283e80:	8b 0d dc 96 32 00    	mov    0x3296dc,%ecx
  283e86:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283e89:	89 d0                	mov    %edx,%eax
  283e8b:	01 c0                	add    %eax,%eax
  283e8d:	01 d0                	add    %edx,%eax
  283e8f:	c1 e0 06             	shl    $0x6,%eax
  283e92:	01 c8                	add    %ecx,%eax
  283e94:	05 fc 0f 00 00       	add    $0xffc,%eax
  283e99:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		taskctl->tasks0[i].sel = (TASK_GDT0 + i) * 8;
  283e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283ea2:	83 c0 03             	add    $0x3,%eax
  283ea5:	8b 1d dc 96 32 00    	mov    0x3296dc,%ebx
  283eab:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  283eb2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283eb5:	89 d0                	mov    %edx,%eax
  283eb7:	01 c0                	add    %eax,%eax
  283eb9:	01 d0                	add    %edx,%eax
  283ebb:	c1 e0 06             	shl    $0x6,%eax
  283ebe:	01 d8                	add    %ebx,%eax
  283ec0:	05 f8 0f 00 00       	add    $0xff8,%eax
  283ec5:	89 08                	mov    %ecx,(%eax)
		taskctl->tasks0[i].tss.ldtr = (TASK_GDT0 + MAX_TASKS + i) * 8;
  283ec7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283eca:	05 eb 03 00 00       	add    $0x3eb,%eax
  283ecf:	8b 1d dc 96 32 00    	mov    0x3296dc,%ebx
  283ed5:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  283edc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283edf:	89 d0                	mov    %edx,%eax
  283ee1:	01 c0                	add    %eax,%eax
  283ee3:	01 d0                	add    %edx,%eax
  283ee5:	c1 e0 06             	shl    $0x6,%eax
  283ee8:	01 d8                	add    %ebx,%eax
  283eea:	05 84 10 00 00       	add    $0x1084,%eax
  283eef:	89 08                	mov    %ecx,(%eax)
		set_segmdesc(gdt + TASK_GDT0 + i, 103, (int) &taskctl->tasks0[i].tss, AR_TSS32);
  283ef1:	8b 0d dc 96 32 00    	mov    0x3296dc,%ecx
  283ef7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283efa:	89 d0                	mov    %edx,%eax
  283efc:	01 c0                	add    %eax,%eax
  283efe:	01 d0                	add    %edx,%eax
  283f00:	c1 e0 06             	shl    $0x6,%eax
  283f03:	05 10 10 00 00       	add    $0x1010,%eax
  283f08:	01 c8                	add    %ecx,%eax
  283f0a:	83 c0 14             	add    $0x14,%eax
  283f0d:	89 c1                	mov    %eax,%ecx
  283f0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283f12:	83 c0 03             	add    $0x3,%eax
  283f15:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  283f1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283f1f:	01 d0                	add    %edx,%eax
  283f21:	68 89 00 00 00       	push   $0x89
  283f26:	51                   	push   %ecx
  283f27:	6a 67                	push   $0x67
  283f29:	50                   	push   %eax
  283f2a:	e8 8a df ff ff       	call   281eb9 <set_segmdesc>
  283f2f:	83 c4 10             	add    $0x10,%esp
		set_segmdesc(gdt + TASK_GDT0 + MAX_TASKS + i, 15, (int) taskctl->tasks0[i].ldt, AR_LDT);
  283f32:	8b 0d dc 96 32 00    	mov    0x3296dc,%ecx
  283f38:	8b 55 f4             	mov    -0xc(%ebp),%edx
  283f3b:	89 d0                	mov    %edx,%eax
  283f3d:	01 c0                	add    %eax,%eax
  283f3f:	01 d0                	add    %edx,%eax
  283f41:	c1 e0 06             	shl    $0x6,%eax
  283f44:	05 80 10 00 00       	add    $0x1080,%eax
  283f49:	01 c8                	add    %ecx,%eax
  283f4b:	83 c0 0c             	add    $0xc,%eax
  283f4e:	89 c1                	mov    %eax,%ecx
  283f50:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283f53:	05 eb 03 00 00       	add    $0x3eb,%eax
  283f58:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  283f5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  283f62:	01 d0                	add    %edx,%eax
  283f64:	68 82 00 00 00       	push   $0x82
  283f69:	51                   	push   %ecx
  283f6a:	6a 0f                	push   $0xf
  283f6c:	50                   	push   %eax
  283f6d:	e8 47 df ff ff       	call   281eb9 <set_segmdesc>
  283f72:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < MAX_TASKS; i++) {
  283f75:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  283f79:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  283f80:	0f 8e fa fe ff ff    	jle    283e80 <task_init+0x36>
	}
	for (i = 0; i < MAX_TASKLEVELS; i++) {
  283f86:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  283f8d:	eb 38                	jmp    283fc7 <task_init+0x17d>
		taskctl->level[i].running = 0;
  283f8f:	8b 15 dc 96 32 00    	mov    0x3296dc,%edx
  283f95:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283f98:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
  283f9e:	01 d0                	add    %edx,%eax
  283fa0:	83 c0 08             	add    $0x8,%eax
  283fa3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		taskctl->level[i].now = 0;
  283fa9:	8b 15 dc 96 32 00    	mov    0x3296dc,%edx
  283faf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  283fb2:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
  283fb8:	01 d0                	add    %edx,%eax
  283fba:	83 c0 0c             	add    $0xc,%eax
  283fbd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	for (i = 0; i < MAX_TASKLEVELS; i++) {
  283fc3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  283fc7:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  283fcb:	7e c2                	jle    283f8f <task_init+0x145>
	}

	task = task_alloc();
  283fcd:	e8 fb 00 00 00       	call   2840cd <task_alloc>
  283fd2:	89 45 ec             	mov    %eax,-0x14(%ebp)
	task->flags = 2;	/* ìÆçÏíÜÉ}Å[ÉN */
  283fd5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  283fd8:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%eax)
	task->priority = 2; /* 0.02ïb */
  283fdf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  283fe2:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
	task->level = 0;	/* ç≈çÇÉåÉxÉã */
  283fe9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  283fec:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
	task_add(task);
  283ff3:	83 ec 0c             	sub    $0xc,%esp
  283ff6:	ff 75 ec             	pushl  -0x14(%ebp)
  283ff9:	e8 dd fc ff ff       	call   283cdb <task_add>
  283ffe:	83 c4 10             	add    $0x10,%esp
	task_switchsub();	/* ÉåÉxÉãê›íË */
  284001:	e8 e3 fd ff ff       	call   283de9 <task_switchsub>
	load_tr(task->sel);
  284006:	8b 45 ec             	mov    -0x14(%ebp),%eax
  284009:	8b 00                	mov    (%eax),%eax
  28400b:	83 ec 0c             	sub    $0xc,%esp
  28400e:	50                   	push   %eax
  28400f:	e8 b7 d1 ff ff       	call   2811cb <load_tr>
  284014:	83 c4 10             	add    $0x10,%esp
	task_timer = timer_alloc();
  284017:	e8 48 f9 ff ff       	call   283964 <timer_alloc>
  28401c:	a3 e0 96 32 00       	mov    %eax,0x3296e0
	timer_settime(task_timer, task->priority);
  284021:	8b 45 ec             	mov    -0x14(%ebp),%eax
  284024:	8b 40 0c             	mov    0xc(%eax),%eax
  284027:	89 c2                	mov    %eax,%edx
  284029:	a1 e0 96 32 00       	mov    0x3296e0,%eax
  28402e:	83 ec 08             	sub    $0x8,%esp
  284031:	52                   	push   %edx
  284032:	50                   	push   %eax
  284033:	e8 da f9 ff ff       	call   283a12 <timer_settime>
  284038:	83 c4 10             	add    $0x10,%esp

	idle = task_alloc();
  28403b:	e8 8d 00 00 00       	call   2840cd <task_alloc>
  284040:	89 45 e8             	mov    %eax,-0x18(%ebp)
	idle->tss.esp = memman_alloc_4k(memman, 64 * 1024) + 64 * 1024;
  284043:	83 ec 08             	sub    $0x8,%esp
  284046:	68 00 00 01 00       	push   $0x10000
  28404b:	ff 75 08             	pushl  0x8(%ebp)
  28404e:	e8 a1 e8 ff ff       	call   2828f4 <memman_alloc_4k>
  284053:	83 c4 10             	add    $0x10,%esp
  284056:	05 00 00 01 00       	add    $0x10000,%eax
  28405b:	89 c2                	mov    %eax,%edx
  28405d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  284060:	89 50 64             	mov    %edx,0x64(%eax)
	idle->tss.eip = (int) &task_idle;
  284063:	ba 39 3e 28 00       	mov    $0x283e39,%edx
  284068:	8b 45 e8             	mov    -0x18(%ebp),%eax
  28406b:	89 50 4c             	mov    %edx,0x4c(%eax)
	idle->tss.es = 1 * 8;
  28406e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  284071:	c7 40 74 08 00 00 00 	movl   $0x8,0x74(%eax)
	idle->tss.cs = 2 * 8;
  284078:	8b 45 e8             	mov    -0x18(%ebp),%eax
  28407b:	c7 40 78 10 00 00 00 	movl   $0x10,0x78(%eax)
	idle->tss.ss = 1 * 8;
  284082:	8b 45 e8             	mov    -0x18(%ebp),%eax
  284085:	c7 40 7c 08 00 00 00 	movl   $0x8,0x7c(%eax)
	idle->tss.ds = 1 * 8;
  28408c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  28408f:	c7 80 80 00 00 00 08 	movl   $0x8,0x80(%eax)
  284096:	00 00 00 
	idle->tss.fs = 1 * 8;
  284099:	8b 45 e8             	mov    -0x18(%ebp),%eax
  28409c:	c7 80 84 00 00 00 08 	movl   $0x8,0x84(%eax)
  2840a3:	00 00 00 
	idle->tss.gs = 1 * 8;
  2840a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2840a9:	c7 80 88 00 00 00 08 	movl   $0x8,0x88(%eax)
  2840b0:	00 00 00 
	task_run(idle, MAX_TASKLEVELS - 1, 1);
  2840b3:	83 ec 04             	sub    $0x4,%esp
  2840b6:	6a 01                	push   $0x1
  2840b8:	6a 09                	push   $0x9
  2840ba:	ff 75 e8             	pushl  -0x18(%ebp)
  2840bd:	e8 22 01 00 00       	call   2841e4 <task_run>
  2840c2:	83 c4 10             	add    $0x10,%esp

	return task;
  2840c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
  2840c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  2840cb:	c9                   	leave  
  2840cc:	c3                   	ret    

002840cd <task_alloc>:

struct TASK *task_alloc(void)
{
  2840cd:	f3 0f 1e fb          	endbr32 
  2840d1:	55                   	push   %ebp
  2840d2:	89 e5                	mov    %esp,%ebp
  2840d4:	83 ec 10             	sub    $0x10,%esp
	int i;
	struct TASK *task;
	for (i = 0; i < MAX_TASKS; i++) {
  2840d7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2840de:	e9 ed 00 00 00       	jmp    2841d0 <task_alloc+0x103>
		if (taskctl->tasks0[i].flags == 0) {
  2840e3:	8b 0d dc 96 32 00    	mov    0x3296dc,%ecx
  2840e9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2840ec:	89 d0                	mov    %edx,%eax
  2840ee:	01 c0                	add    %eax,%eax
  2840f0:	01 d0                	add    %edx,%eax
  2840f2:	c1 e0 06             	shl    $0x6,%eax
  2840f5:	01 c8                	add    %ecx,%eax
  2840f7:	05 fc 0f 00 00       	add    $0xffc,%eax
  2840fc:	8b 00                	mov    (%eax),%eax
  2840fe:	85 c0                	test   %eax,%eax
  284100:	0f 85 c6 00 00 00    	jne    2841cc <task_alloc+0xff>
			task = &taskctl->tasks0[i];
  284106:	8b 0d dc 96 32 00    	mov    0x3296dc,%ecx
  28410c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  28410f:	89 d0                	mov    %edx,%eax
  284111:	01 c0                	add    %eax,%eax
  284113:	01 d0                	add    %edx,%eax
  284115:	c1 e0 06             	shl    $0x6,%eax
  284118:	05 f0 0f 00 00       	add    $0xff0,%eax
  28411d:	01 c8                	add    %ecx,%eax
  28411f:	83 c0 08             	add    $0x8,%eax
  284122:	89 45 f8             	mov    %eax,-0x8(%ebp)
			task->flags = 1; /* égópíÜÉ}Å[ÉN */
  284125:	8b 45 f8             	mov    -0x8(%ebp),%eax
  284128:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
			task->tss.eflags = 0x00000202; /* IF = 1; */
  28412f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  284132:	c7 40 50 02 02 00 00 	movl   $0x202,0x50(%eax)
			task->tss.eax = 0; /* Ç∆ÇËÇ†Ç¶Ç∏0Ç…ÇµÇƒÇ®Ç≠Ç±Ç∆Ç…Ç∑ÇÈ */
  284139:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28413c:	c7 40 54 00 00 00 00 	movl   $0x0,0x54(%eax)
			task->tss.ecx = 0;
  284143:	8b 45 f8             	mov    -0x8(%ebp),%eax
  284146:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
			task->tss.edx = 0;
  28414d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  284150:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
			task->tss.ebx = 0;
  284157:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28415a:	c7 40 60 00 00 00 00 	movl   $0x0,0x60(%eax)
			task->tss.ebp = 0;
  284161:	8b 45 f8             	mov    -0x8(%ebp),%eax
  284164:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)
			task->tss.esi = 0;
  28416b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28416e:	c7 40 6c 00 00 00 00 	movl   $0x0,0x6c(%eax)
			task->tss.edi = 0;
  284175:	8b 45 f8             	mov    -0x8(%ebp),%eax
  284178:	c7 40 70 00 00 00 00 	movl   $0x0,0x70(%eax)
			task->tss.es = 0;
  28417f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  284182:	c7 40 74 00 00 00 00 	movl   $0x0,0x74(%eax)
			task->tss.ds = 0;
  284189:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28418c:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  284193:	00 00 00 
			task->tss.fs = 0;
  284196:	8b 45 f8             	mov    -0x8(%ebp),%eax
  284199:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  2841a0:	00 00 00 
			task->tss.gs = 0;
  2841a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2841a6:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
  2841ad:	00 00 00 
			task->tss.iomap = 0x40000000;
  2841b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2841b3:	c7 80 90 00 00 00 00 	movl   $0x40000000,0x90(%eax)
  2841ba:	00 00 40 
			task->tss.ss0 = 0;
  2841bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2841c0:	c7 40 34 00 00 00 00 	movl   $0x0,0x34(%eax)
			return task;
  2841c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2841ca:	eb 16                	jmp    2841e2 <task_alloc+0x115>
	for (i = 0; i < MAX_TASKS; i++) {
  2841cc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  2841d0:	81 7d fc e7 03 00 00 	cmpl   $0x3e7,-0x4(%ebp)
  2841d7:	0f 8e 06 ff ff ff    	jle    2840e3 <task_alloc+0x16>
		}
	}
	return 0; /* Ç‡Ç§ëSïîégópíÜ */
  2841dd:	b8 00 00 00 00       	mov    $0x0,%eax
}
  2841e2:	c9                   	leave  
  2841e3:	c3                   	ret    

002841e4 <task_run>:

void task_run(struct TASK *task, int level, int priority)
{
  2841e4:	f3 0f 1e fb          	endbr32 
  2841e8:	55                   	push   %ebp
  2841e9:	89 e5                	mov    %esp,%ebp
	if (level < 0) {
  2841eb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  2841ef:	79 09                	jns    2841fa <task_run+0x16>
		level = task->level; /* ÉåÉxÉãÇïœçXÇµÇ»Ç¢ */
  2841f1:	8b 45 08             	mov    0x8(%ebp),%eax
  2841f4:	8b 40 08             	mov    0x8(%eax),%eax
  2841f7:	89 45 0c             	mov    %eax,0xc(%ebp)
	}
	if (priority > 0) {
  2841fa:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  2841fe:	7e 09                	jle    284209 <task_run+0x25>
		task->priority = priority;
  284200:	8b 45 08             	mov    0x8(%ebp),%eax
  284203:	8b 55 10             	mov    0x10(%ebp),%edx
  284206:	89 50 0c             	mov    %edx,0xc(%eax)
	}

	if (task->flags == 2 && task->level != level) { /* ìÆçÏíÜÇÃÉåÉxÉãÇÃïœçX */
  284209:	8b 45 08             	mov    0x8(%ebp),%eax
  28420c:	8b 40 04             	mov    0x4(%eax),%eax
  28420f:	83 f8 02             	cmp    $0x2,%eax
  284212:	75 16                	jne    28422a <task_run+0x46>
  284214:	8b 45 08             	mov    0x8(%ebp),%eax
  284217:	8b 40 08             	mov    0x8(%eax),%eax
  28421a:	39 45 0c             	cmp    %eax,0xc(%ebp)
  28421d:	74 0b                	je     28422a <task_run+0x46>
		task_remove(task); /* Ç±ÇÍÇé¿çsÇ∑ÇÈÇ∆flagsÇÕ1Ç…Ç»ÇÈÇÃÇ≈â∫ÇÃifÇ‡é¿çsÇ≥ÇÍÇÈ */
  28421f:	ff 75 08             	pushl  0x8(%ebp)
  284222:	e8 01 fb ff ff       	call   283d28 <task_remove>
  284227:	83 c4 04             	add    $0x4,%esp
	}
	if (task->flags != 2) {
  28422a:	8b 45 08             	mov    0x8(%ebp),%eax
  28422d:	8b 40 04             	mov    0x4(%eax),%eax
  284230:	83 f8 02             	cmp    $0x2,%eax
  284233:	74 14                	je     284249 <task_run+0x65>
		/* ÉXÉäÅ[ÉvÇ©ÇÁãNÇ±Ç≥ÇÍÇÈèÍçá */
		task->level = level;
  284235:	8b 45 08             	mov    0x8(%ebp),%eax
  284238:	8b 55 0c             	mov    0xc(%ebp),%edx
  28423b:	89 50 08             	mov    %edx,0x8(%eax)
		task_add(task);
  28423e:	ff 75 08             	pushl  0x8(%ebp)
  284241:	e8 95 fa ff ff       	call   283cdb <task_add>
  284246:	83 c4 04             	add    $0x4,%esp
	}

	taskctl->lv_change = 1; /* éüâÒÉ^ÉXÉNÉXÉCÉbÉ`ÇÃÇ∆Ç´Ç…ÉåÉxÉãÇå©íºÇ∑ */
  284249:	a1 dc 96 32 00       	mov    0x3296dc,%eax
  28424e:	c6 40 04 01          	movb   $0x1,0x4(%eax)
	return;
  284252:	90                   	nop
}
  284253:	c9                   	leave  
  284254:	c3                   	ret    

00284255 <task_sleep>:

void task_sleep(struct TASK *task)
{
  284255:	f3 0f 1e fb          	endbr32 
  284259:	55                   	push   %ebp
  28425a:	89 e5                	mov    %esp,%ebp
  28425c:	83 ec 18             	sub    $0x18,%esp
	struct TASK *now_task;
	if (task->flags == 2) {
  28425f:	8b 45 08             	mov    0x8(%ebp),%eax
  284262:	8b 40 04             	mov    0x4(%eax),%eax
  284265:	83 f8 02             	cmp    $0x2,%eax
  284268:	75 3c                	jne    2842a6 <task_sleep+0x51>
		/* ìÆçÏíÜÇæÇ¡ÇΩÇÁ */
		now_task = task_now();
  28426a:	e8 38 fa ff ff       	call   283ca7 <task_now>
  28426f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		task_remove(task); /* Ç±ÇÍÇé¿çsÇ∑ÇÈÇ∆flagsÇÕ1Ç…Ç»ÇÈ */
  284272:	ff 75 08             	pushl  0x8(%ebp)
  284275:	e8 ae fa ff ff       	call   283d28 <task_remove>
  28427a:	83 c4 04             	add    $0x4,%esp
		if (task == now_task) {
  28427d:	8b 45 08             	mov    0x8(%ebp),%eax
  284280:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  284283:	75 21                	jne    2842a6 <task_sleep+0x51>
			/* é©ï™é©êgÇÃÉXÉäÅ[ÉvÇæÇ¡ÇΩÇÃÇ≈ÅAÉ^ÉXÉNÉXÉCÉbÉ`Ç™ïKóv */
			task_switchsub();
  284285:	e8 5f fb ff ff       	call   283de9 <task_switchsub>
			now_task = task_now(); /* ê›íËå„Ç≈ÇÃÅAÅuåªç›ÇÃÉ^ÉXÉNÅvÇã≥Ç¶ÇƒÇ‡ÇÁÇ§ */
  28428a:	e8 18 fa ff ff       	call   283ca7 <task_now>
  28428f:	89 45 f4             	mov    %eax,-0xc(%ebp)
			farjmp(0, now_task->sel);
  284292:	8b 45 f4             	mov    -0xc(%ebp),%eax
  284295:	8b 00                	mov    (%eax),%eax
  284297:	83 ec 08             	sub    $0x8,%esp
  28429a:	50                   	push   %eax
  28429b:	6a 00                	push   $0x0
  28429d:	e8 fa cf ff ff       	call   28129c <farjmp>
  2842a2:	83 c4 10             	add    $0x10,%esp
		}
	}
	return;
  2842a5:	90                   	nop
  2842a6:	90                   	nop
}
  2842a7:	c9                   	leave  
  2842a8:	c3                   	ret    

002842a9 <task_switch>:

void task_switch(void)
{
  2842a9:	f3 0f 1e fb          	endbr32 
  2842ad:	55                   	push   %ebp
  2842ae:	89 e5                	mov    %esp,%ebp
  2842b0:	83 ec 18             	sub    $0x18,%esp
	struct TASKLEVEL *tl = &taskctl->level[taskctl->now_lv];
  2842b3:	8b 15 dc 96 32 00    	mov    0x3296dc,%edx
  2842b9:	a1 dc 96 32 00       	mov    0x3296dc,%eax
  2842be:	8b 00                	mov    (%eax),%eax
  2842c0:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
  2842c6:	01 d0                	add    %edx,%eax
  2842c8:	83 c0 08             	add    $0x8,%eax
  2842cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct TASK *new_task, *now_task = tl->tasks[tl->now];
  2842ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2842d1:	8b 50 04             	mov    0x4(%eax),%edx
  2842d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2842d7:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  2842db:	89 45 f0             	mov    %eax,-0x10(%ebp)
	tl->now++;
  2842de:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2842e1:	8b 40 04             	mov    0x4(%eax),%eax
  2842e4:	8d 50 01             	lea    0x1(%eax),%edx
  2842e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2842ea:	89 50 04             	mov    %edx,0x4(%eax)
	if (tl->now == tl->running) {
  2842ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2842f0:	8b 50 04             	mov    0x4(%eax),%edx
  2842f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2842f6:	8b 00                	mov    (%eax),%eax
  2842f8:	39 c2                	cmp    %eax,%edx
  2842fa:	75 0a                	jne    284306 <task_switch+0x5d>
		tl->now = 0;
  2842fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2842ff:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	if (taskctl->lv_change != 0) {
  284306:	a1 dc 96 32 00       	mov    0x3296dc,%eax
  28430b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  28430f:	84 c0                	test   %al,%al
  284311:	74 20                	je     284333 <task_switch+0x8a>
		task_switchsub();
  284313:	e8 d1 fa ff ff       	call   283de9 <task_switchsub>
		tl = &taskctl->level[taskctl->now_lv];
  284318:	8b 15 dc 96 32 00    	mov    0x3296dc,%edx
  28431e:	a1 dc 96 32 00       	mov    0x3296dc,%eax
  284323:	8b 00                	mov    (%eax),%eax
  284325:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
  28432b:	01 d0                	add    %edx,%eax
  28432d:	83 c0 08             	add    $0x8,%eax
  284330:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	new_task = tl->tasks[tl->now];
  284333:	8b 45 f4             	mov    -0xc(%ebp),%eax
  284336:	8b 50 04             	mov    0x4(%eax),%edx
  284339:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28433c:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  284340:	89 45 ec             	mov    %eax,-0x14(%ebp)
	timer_settime(task_timer, new_task->priority);
  284343:	8b 45 ec             	mov    -0x14(%ebp),%eax
  284346:	8b 40 0c             	mov    0xc(%eax),%eax
  284349:	89 c2                	mov    %eax,%edx
  28434b:	a1 e0 96 32 00       	mov    0x3296e0,%eax
  284350:	83 ec 08             	sub    $0x8,%esp
  284353:	52                   	push   %edx
  284354:	50                   	push   %eax
  284355:	e8 b8 f6 ff ff       	call   283a12 <timer_settime>
  28435a:	83 c4 10             	add    $0x10,%esp
	if (new_task != now_task) {
  28435d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  284360:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  284363:	74 14                	je     284379 <task_switch+0xd0>
		farjmp(0, new_task->sel);
  284365:	8b 45 ec             	mov    -0x14(%ebp),%eax
  284368:	8b 00                	mov    (%eax),%eax
  28436a:	83 ec 08             	sub    $0x8,%esp
  28436d:	50                   	push   %eax
  28436e:	6a 00                	push   $0x0
  284370:	e8 27 cf ff ff       	call   28129c <farjmp>
  284375:	83 c4 10             	add    $0x10,%esp
	}
	return;
  284378:	90                   	nop
  284379:	90                   	nop
}
  28437a:	c9                   	leave  
  28437b:	c3                   	ret    

0028437c <make_window8>:
/* ÉEÉBÉìÉhÉEä÷åW */

#include "bootpack.h"

void make_window8(unsigned char *buf, int xsize, int ysize, char *title, char act)
{
  28437c:	f3 0f 1e fb          	endbr32 
  284380:	55                   	push   %ebp
  284381:	89 e5                	mov    %esp,%ebp
  284383:	83 ec 18             	sub    $0x18,%esp
  284386:	8b 45 18             	mov    0x18(%ebp),%eax
  284389:	88 45 f4             	mov    %al,-0xc(%ebp)
	boxfill8(buf, xsize, COL8_C6C6C6, 0,         0,         xsize - 1, 0        );
  28438c:	8b 45 0c             	mov    0xc(%ebp),%eax
  28438f:	83 e8 01             	sub    $0x1,%eax
  284392:	83 ec 04             	sub    $0x4,%esp
  284395:	6a 00                	push   $0x0
  284397:	50                   	push   %eax
  284398:	6a 00                	push   $0x0
  28439a:	6a 00                	push   $0x0
  28439c:	6a 08                	push   $0x8
  28439e:	ff 75 0c             	pushl  0xc(%ebp)
  2843a1:	ff 75 08             	pushl  0x8(%ebp)
  2843a4:	e8 55 d1 ff ff       	call   2814fe <boxfill8>
  2843a9:	83 c4 20             	add    $0x20,%esp
	boxfill8(buf, xsize, COL8_FFFFFF, 1,         1,         xsize - 2, 1        );
  2843ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  2843af:	83 e8 02             	sub    $0x2,%eax
  2843b2:	83 ec 04             	sub    $0x4,%esp
  2843b5:	6a 01                	push   $0x1
  2843b7:	50                   	push   %eax
  2843b8:	6a 01                	push   $0x1
  2843ba:	6a 01                	push   $0x1
  2843bc:	6a 07                	push   $0x7
  2843be:	ff 75 0c             	pushl  0xc(%ebp)
  2843c1:	ff 75 08             	pushl  0x8(%ebp)
  2843c4:	e8 35 d1 ff ff       	call   2814fe <boxfill8>
  2843c9:	83 c4 20             	add    $0x20,%esp
	boxfill8(buf, xsize, COL8_C6C6C6, 0,         0,         0,         ysize - 1);
  2843cc:	8b 45 10             	mov    0x10(%ebp),%eax
  2843cf:	83 e8 01             	sub    $0x1,%eax
  2843d2:	83 ec 04             	sub    $0x4,%esp
  2843d5:	50                   	push   %eax
  2843d6:	6a 00                	push   $0x0
  2843d8:	6a 00                	push   $0x0
  2843da:	6a 00                	push   $0x0
  2843dc:	6a 08                	push   $0x8
  2843de:	ff 75 0c             	pushl  0xc(%ebp)
  2843e1:	ff 75 08             	pushl  0x8(%ebp)
  2843e4:	e8 15 d1 ff ff       	call   2814fe <boxfill8>
  2843e9:	83 c4 20             	add    $0x20,%esp
	boxfill8(buf, xsize, COL8_FFFFFF, 1,         1,         1,         ysize - 2);
  2843ec:	8b 45 10             	mov    0x10(%ebp),%eax
  2843ef:	83 e8 02             	sub    $0x2,%eax
  2843f2:	83 ec 04             	sub    $0x4,%esp
  2843f5:	50                   	push   %eax
  2843f6:	6a 01                	push   $0x1
  2843f8:	6a 01                	push   $0x1
  2843fa:	6a 01                	push   $0x1
  2843fc:	6a 07                	push   $0x7
  2843fe:	ff 75 0c             	pushl  0xc(%ebp)
  284401:	ff 75 08             	pushl  0x8(%ebp)
  284404:	e8 f5 d0 ff ff       	call   2814fe <boxfill8>
  284409:	83 c4 20             	add    $0x20,%esp
	boxfill8(buf, xsize, COL8_848484, xsize - 2, 1,         xsize - 2, ysize - 2);
  28440c:	8b 45 10             	mov    0x10(%ebp),%eax
  28440f:	8d 48 fe             	lea    -0x2(%eax),%ecx
  284412:	8b 45 0c             	mov    0xc(%ebp),%eax
  284415:	8d 50 fe             	lea    -0x2(%eax),%edx
  284418:	8b 45 0c             	mov    0xc(%ebp),%eax
  28441b:	83 e8 02             	sub    $0x2,%eax
  28441e:	83 ec 04             	sub    $0x4,%esp
  284421:	51                   	push   %ecx
  284422:	52                   	push   %edx
  284423:	6a 01                	push   $0x1
  284425:	50                   	push   %eax
  284426:	6a 0f                	push   $0xf
  284428:	ff 75 0c             	pushl  0xc(%ebp)
  28442b:	ff 75 08             	pushl  0x8(%ebp)
  28442e:	e8 cb d0 ff ff       	call   2814fe <boxfill8>
  284433:	83 c4 20             	add    $0x20,%esp
	boxfill8(buf, xsize, COL8_000000, xsize - 1, 0,         xsize - 1, ysize - 1);
  284436:	8b 45 10             	mov    0x10(%ebp),%eax
  284439:	8d 48 ff             	lea    -0x1(%eax),%ecx
  28443c:	8b 45 0c             	mov    0xc(%ebp),%eax
  28443f:	8d 50 ff             	lea    -0x1(%eax),%edx
  284442:	8b 45 0c             	mov    0xc(%ebp),%eax
  284445:	83 e8 01             	sub    $0x1,%eax
  284448:	83 ec 04             	sub    $0x4,%esp
  28444b:	51                   	push   %ecx
  28444c:	52                   	push   %edx
  28444d:	6a 00                	push   $0x0
  28444f:	50                   	push   %eax
  284450:	6a 00                	push   $0x0
  284452:	ff 75 0c             	pushl  0xc(%ebp)
  284455:	ff 75 08             	pushl  0x8(%ebp)
  284458:	e8 a1 d0 ff ff       	call   2814fe <boxfill8>
  28445d:	83 c4 20             	add    $0x20,%esp
	boxfill8(buf, xsize, COL8_C6C6C6, 2,         2,         xsize - 3, ysize - 3);
  284460:	8b 45 10             	mov    0x10(%ebp),%eax
  284463:	8d 50 fd             	lea    -0x3(%eax),%edx
  284466:	8b 45 0c             	mov    0xc(%ebp),%eax
  284469:	83 e8 03             	sub    $0x3,%eax
  28446c:	83 ec 04             	sub    $0x4,%esp
  28446f:	52                   	push   %edx
  284470:	50                   	push   %eax
  284471:	6a 02                	push   $0x2
  284473:	6a 02                	push   $0x2
  284475:	6a 08                	push   $0x8
  284477:	ff 75 0c             	pushl  0xc(%ebp)
  28447a:	ff 75 08             	pushl  0x8(%ebp)
  28447d:	e8 7c d0 ff ff       	call   2814fe <boxfill8>
  284482:	83 c4 20             	add    $0x20,%esp
	boxfill8(buf, xsize, COL8_848484, 1,         ysize - 2, xsize - 2, ysize - 2);
  284485:	8b 45 10             	mov    0x10(%ebp),%eax
  284488:	8d 48 fe             	lea    -0x2(%eax),%ecx
  28448b:	8b 45 0c             	mov    0xc(%ebp),%eax
  28448e:	8d 50 fe             	lea    -0x2(%eax),%edx
  284491:	8b 45 10             	mov    0x10(%ebp),%eax
  284494:	83 e8 02             	sub    $0x2,%eax
  284497:	83 ec 04             	sub    $0x4,%esp
  28449a:	51                   	push   %ecx
  28449b:	52                   	push   %edx
  28449c:	50                   	push   %eax
  28449d:	6a 01                	push   $0x1
  28449f:	6a 0f                	push   $0xf
  2844a1:	ff 75 0c             	pushl  0xc(%ebp)
  2844a4:	ff 75 08             	pushl  0x8(%ebp)
  2844a7:	e8 52 d0 ff ff       	call   2814fe <boxfill8>
  2844ac:	83 c4 20             	add    $0x20,%esp
	boxfill8(buf, xsize, COL8_000000, 0,         ysize - 1, xsize - 1, ysize - 1);
  2844af:	8b 45 10             	mov    0x10(%ebp),%eax
  2844b2:	8d 48 ff             	lea    -0x1(%eax),%ecx
  2844b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  2844b8:	8d 50 ff             	lea    -0x1(%eax),%edx
  2844bb:	8b 45 10             	mov    0x10(%ebp),%eax
  2844be:	83 e8 01             	sub    $0x1,%eax
  2844c1:	83 ec 04             	sub    $0x4,%esp
  2844c4:	51                   	push   %ecx
  2844c5:	52                   	push   %edx
  2844c6:	50                   	push   %eax
  2844c7:	6a 00                	push   $0x0
  2844c9:	6a 00                	push   $0x0
  2844cb:	ff 75 0c             	pushl  0xc(%ebp)
  2844ce:	ff 75 08             	pushl  0x8(%ebp)
  2844d1:	e8 28 d0 ff ff       	call   2814fe <boxfill8>
  2844d6:	83 c4 20             	add    $0x20,%esp
	make_wtitle8(buf, xsize, title, act);
  2844d9:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  2844dd:	50                   	push   %eax
  2844de:	ff 75 14             	pushl  0x14(%ebp)
  2844e1:	ff 75 0c             	pushl  0xc(%ebp)
  2844e4:	ff 75 08             	pushl  0x8(%ebp)
  2844e7:	e8 06 00 00 00       	call   2844f2 <make_wtitle8>
  2844ec:	83 c4 10             	add    $0x10,%esp
	return;
  2844ef:	90                   	nop
}
  2844f0:	c9                   	leave  
  2844f1:	c3                   	ret    

002844f2 <make_wtitle8>:

void make_wtitle8(unsigned char *buf, int xsize, char *title, char act)
{
  2844f2:	f3 0f 1e fb          	endbr32 
  2844f6:	55                   	push   %ebp
  2844f7:	89 e5                	mov    %esp,%ebp
  2844f9:	83 ec 28             	sub    $0x28,%esp
  2844fc:	8b 45 14             	mov    0x14(%ebp),%eax
  2844ff:	88 45 e4             	mov    %al,-0x1c(%ebp)
		"O$$$$$$$$$$$$$$@",
		"@@@@@@@@@@@@@@@@"
	};
	int x, y;
	char c, tc, tbc;
	if (act != 0) {
  284502:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
  284506:	74 0a                	je     284512 <make_wtitle8+0x20>
		tc = COL8_FFFFFF;
  284508:	c6 45 ee 07          	movb   $0x7,-0x12(%ebp)
		tbc = COL8_000084;
  28450c:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  284510:	eb 08                	jmp    28451a <make_wtitle8+0x28>
	} else {
		tc = COL8_C6C6C6;
  284512:	c6 45 ee 08          	movb   $0x8,-0x12(%ebp)
		tbc = COL8_848484;
  284516:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
	}
	boxfill8(buf, xsize, tbc, 3, 3, xsize - 4, 20);
  28451a:	8b 45 0c             	mov    0xc(%ebp),%eax
  28451d:	8d 50 fc             	lea    -0x4(%eax),%edx
  284520:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  284524:	0f b6 c0             	movzbl %al,%eax
  284527:	83 ec 04             	sub    $0x4,%esp
  28452a:	6a 14                	push   $0x14
  28452c:	52                   	push   %edx
  28452d:	6a 03                	push   $0x3
  28452f:	6a 03                	push   $0x3
  284531:	50                   	push   %eax
  284532:	ff 75 0c             	pushl  0xc(%ebp)
  284535:	ff 75 08             	pushl  0x8(%ebp)
  284538:	e8 c1 cf ff ff       	call   2814fe <boxfill8>
  28453d:	83 c4 20             	add    $0x20,%esp
	putfonts8_asc(buf, xsize, 24, 4, tc, title);
  284540:	0f be 45 ee          	movsbl -0x12(%ebp),%eax
  284544:	83 ec 08             	sub    $0x8,%esp
  284547:	ff 75 10             	pushl  0x10(%ebp)
  28454a:	50                   	push   %eax
  28454b:	6a 04                	push   $0x4
  28454d:	6a 18                	push   $0x18
  28454f:	ff 75 0c             	pushl  0xc(%ebp)
  284552:	ff 75 08             	pushl  0x8(%ebp)
  284555:	e8 21 d3 ff ff       	call   28187b <putfonts8_asc>
  28455a:	83 c4 20             	add    $0x20,%esp
	for (y = 0; y < 14; y++) {
  28455d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  284564:	eb 7b                	jmp    2845e1 <make_wtitle8+0xef>
		for (x = 0; x < 16; x++) {
  284566:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  28456d:	eb 68                	jmp    2845d7 <make_wtitle8+0xe5>
			c = closebtn[y][x];
  28456f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  284572:	c1 e0 04             	shl    $0x4,%eax
  284575:	89 c2                	mov    %eax,%edx
  284577:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28457a:	01 d0                	add    %edx,%eax
  28457c:	05 80 12 31 00       	add    $0x311280,%eax
  284581:	0f b6 00             	movzbl (%eax),%eax
  284584:	88 45 ef             	mov    %al,-0x11(%ebp)
			if (c == '@') {
  284587:	80 7d ef 40          	cmpb   $0x40,-0x11(%ebp)
  28458b:	75 06                	jne    284593 <make_wtitle8+0xa1>
				c = COL8_000000;
  28458d:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  284591:	eb 1c                	jmp    2845af <make_wtitle8+0xbd>
			} else if (c == '$') {
  284593:	80 7d ef 24          	cmpb   $0x24,-0x11(%ebp)
  284597:	75 06                	jne    28459f <make_wtitle8+0xad>
				c = COL8_848484;
  284599:	c6 45 ef 0f          	movb   $0xf,-0x11(%ebp)
  28459d:	eb 10                	jmp    2845af <make_wtitle8+0xbd>
			} else if (c == 'Q') {
  28459f:	80 7d ef 51          	cmpb   $0x51,-0x11(%ebp)
  2845a3:	75 06                	jne    2845ab <make_wtitle8+0xb9>
				c = COL8_C6C6C6;
  2845a5:	c6 45 ef 08          	movb   $0x8,-0x11(%ebp)
  2845a9:	eb 04                	jmp    2845af <make_wtitle8+0xbd>
			} else {
				c = COL8_FFFFFF;
  2845ab:	c6 45 ef 07          	movb   $0x7,-0x11(%ebp)
			}
			buf[(5 + y) * xsize + (xsize - 21 + x)] = c;
  2845af:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2845b2:	83 c0 05             	add    $0x5,%eax
  2845b5:	0f af 45 0c          	imul   0xc(%ebp),%eax
  2845b9:	8b 55 0c             	mov    0xc(%ebp),%edx
  2845bc:	8d 4a eb             	lea    -0x15(%edx),%ecx
  2845bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2845c2:	01 ca                	add    %ecx,%edx
  2845c4:	01 d0                	add    %edx,%eax
  2845c6:	89 c2                	mov    %eax,%edx
  2845c8:	8b 45 08             	mov    0x8(%ebp),%eax
  2845cb:	01 c2                	add    %eax,%edx
  2845cd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  2845d1:	88 02                	mov    %al,(%edx)
		for (x = 0; x < 16; x++) {
  2845d3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2845d7:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  2845db:	7e 92                	jle    28456f <make_wtitle8+0x7d>
	for (y = 0; y < 14; y++) {
  2845dd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  2845e1:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  2845e5:	0f 8e 7b ff ff ff    	jle    284566 <make_wtitle8+0x74>
		}
	}
	return;
  2845eb:	90                   	nop
}
  2845ec:	c9                   	leave  
  2845ed:	c3                   	ret    

002845ee <putfonts8_asc_sht>:

void putfonts8_asc_sht(struct SHEET *sht, int x, int y, int c, int b, char *s, int l)
{
  2845ee:	f3 0f 1e fb          	endbr32 
  2845f2:	55                   	push   %ebp
  2845f3:	89 e5                	mov    %esp,%ebp
  2845f5:	56                   	push   %esi
  2845f6:	53                   	push   %ebx
  2845f7:	83 ec 10             	sub    $0x10,%esp
	struct TASK *task = task_now();
  2845fa:	e8 a8 f6 ff ff       	call   283ca7 <task_now>
  2845ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
	boxfill8(sht->buf, sht->bxsize, b, x, y, x + l * 8 - 1, y + 15);
  284602:	8b 45 10             	mov    0x10(%ebp),%eax
  284605:	8d 70 0f             	lea    0xf(%eax),%esi
  284608:	8b 45 20             	mov    0x20(%ebp),%eax
  28460b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  284612:	8b 45 0c             	mov    0xc(%ebp),%eax
  284615:	01 d0                	add    %edx,%eax
  284617:	8d 58 ff             	lea    -0x1(%eax),%ebx
  28461a:	8b 45 18             	mov    0x18(%ebp),%eax
  28461d:	0f b6 c8             	movzbl %al,%ecx
  284620:	8b 45 08             	mov    0x8(%ebp),%eax
  284623:	8b 50 04             	mov    0x4(%eax),%edx
  284626:	8b 45 08             	mov    0x8(%ebp),%eax
  284629:	8b 00                	mov    (%eax),%eax
  28462b:	83 ec 04             	sub    $0x4,%esp
  28462e:	56                   	push   %esi
  28462f:	53                   	push   %ebx
  284630:	ff 75 10             	pushl  0x10(%ebp)
  284633:	ff 75 0c             	pushl  0xc(%ebp)
  284636:	51                   	push   %ecx
  284637:	52                   	push   %edx
  284638:	50                   	push   %eax
  284639:	e8 c0 ce ff ff       	call   2814fe <boxfill8>
  28463e:	83 c4 20             	add    $0x20,%esp
	if (task->langmode != 0 && task->langbyte1 != 0) {
  284641:	8b 45 f4             	mov    -0xc(%ebp),%eax
  284644:	0f b6 80 bc 00 00 00 	movzbl 0xbc(%eax),%eax
  28464b:	84 c0                	test   %al,%al
  28464d:	74 67                	je     2846b6 <putfonts8_asc_sht+0xc8>
  28464f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  284652:	0f b6 80 bd 00 00 00 	movzbl 0xbd(%eax),%eax
  284659:	84 c0                	test   %al,%al
  28465b:	74 59                	je     2846b6 <putfonts8_asc_sht+0xc8>
		putfonts8_asc(sht->buf, sht->bxsize, x, y, c, s);
  28465d:	8b 45 14             	mov    0x14(%ebp),%eax
  284660:	0f be c8             	movsbl %al,%ecx
  284663:	8b 45 08             	mov    0x8(%ebp),%eax
  284666:	8b 50 04             	mov    0x4(%eax),%edx
  284669:	8b 45 08             	mov    0x8(%ebp),%eax
  28466c:	8b 00                	mov    (%eax),%eax
  28466e:	83 ec 08             	sub    $0x8,%esp
  284671:	ff 75 1c             	pushl  0x1c(%ebp)
  284674:	51                   	push   %ecx
  284675:	ff 75 10             	pushl  0x10(%ebp)
  284678:	ff 75 0c             	pushl  0xc(%ebp)
  28467b:	52                   	push   %edx
  28467c:	50                   	push   %eax
  28467d:	e8 f9 d1 ff ff       	call   28187b <putfonts8_asc>
  284682:	83 c4 20             	add    $0x20,%esp
		sheet_refresh(sht, x - 8, y, x + l * 8, y + 16);
  284685:	8b 45 10             	mov    0x10(%ebp),%eax
  284688:	8d 48 10             	lea    0x10(%eax),%ecx
  28468b:	8b 45 20             	mov    0x20(%ebp),%eax
  28468e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  284695:	8b 45 0c             	mov    0xc(%ebp),%eax
  284698:	01 c2                	add    %eax,%edx
  28469a:	8b 45 0c             	mov    0xc(%ebp),%eax
  28469d:	83 e8 08             	sub    $0x8,%eax
  2846a0:	83 ec 0c             	sub    $0xc,%esp
  2846a3:	51                   	push   %ecx
  2846a4:	52                   	push   %edx
  2846a5:	ff 75 10             	pushl  0x10(%ebp)
  2846a8:	50                   	push   %eax
  2846a9:	ff 75 08             	pushl  0x8(%ebp)
  2846ac:	e8 56 f0 ff ff       	call   283707 <sheet_refresh>
  2846b1:	83 c4 20             	add    $0x20,%esp
  2846b4:	eb 53                	jmp    284709 <putfonts8_asc_sht+0x11b>
	} else {
		putfonts8_asc(sht->buf, sht->bxsize, x, y, c, s);
  2846b6:	8b 45 14             	mov    0x14(%ebp),%eax
  2846b9:	0f be c8             	movsbl %al,%ecx
  2846bc:	8b 45 08             	mov    0x8(%ebp),%eax
  2846bf:	8b 50 04             	mov    0x4(%eax),%edx
  2846c2:	8b 45 08             	mov    0x8(%ebp),%eax
  2846c5:	8b 00                	mov    (%eax),%eax
  2846c7:	83 ec 08             	sub    $0x8,%esp
  2846ca:	ff 75 1c             	pushl  0x1c(%ebp)
  2846cd:	51                   	push   %ecx
  2846ce:	ff 75 10             	pushl  0x10(%ebp)
  2846d1:	ff 75 0c             	pushl  0xc(%ebp)
  2846d4:	52                   	push   %edx
  2846d5:	50                   	push   %eax
  2846d6:	e8 a0 d1 ff ff       	call   28187b <putfonts8_asc>
  2846db:	83 c4 20             	add    $0x20,%esp
		sheet_refresh(sht, x, y, x + l * 8, y + 16);
  2846de:	8b 45 10             	mov    0x10(%ebp),%eax
  2846e1:	8d 50 10             	lea    0x10(%eax),%edx
  2846e4:	8b 45 20             	mov    0x20(%ebp),%eax
  2846e7:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  2846ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  2846f1:	01 c8                	add    %ecx,%eax
  2846f3:	83 ec 0c             	sub    $0xc,%esp
  2846f6:	52                   	push   %edx
  2846f7:	50                   	push   %eax
  2846f8:	ff 75 10             	pushl  0x10(%ebp)
  2846fb:	ff 75 0c             	pushl  0xc(%ebp)
  2846fe:	ff 75 08             	pushl  0x8(%ebp)
  284701:	e8 01 f0 ff ff       	call   283707 <sheet_refresh>
  284706:	83 c4 20             	add    $0x20,%esp
	}
	return;
  284709:	90                   	nop
}
  28470a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  28470d:	5b                   	pop    %ebx
  28470e:	5e                   	pop    %esi
  28470f:	5d                   	pop    %ebp
  284710:	c3                   	ret    

00284711 <make_textbox8>:

void make_textbox8(struct SHEET *sht, int x0, int y0, int sx, int sy, int c)
{
  284711:	f3 0f 1e fb          	endbr32 
  284715:	55                   	push   %ebp
  284716:	89 e5                	mov    %esp,%ebp
  284718:	57                   	push   %edi
  284719:	56                   	push   %esi
  28471a:	53                   	push   %ebx
  28471b:	83 ec 1c             	sub    $0x1c,%esp
	int x1 = x0 + sx, y1 = y0 + sy;
  28471e:	8b 55 0c             	mov    0xc(%ebp),%edx
  284721:	8b 45 14             	mov    0x14(%ebp),%eax
  284724:	01 d0                	add    %edx,%eax
  284726:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  284729:	8b 55 10             	mov    0x10(%ebp),%edx
  28472c:	8b 45 18             	mov    0x18(%ebp),%eax
  28472f:	01 d0                	add    %edx,%eax
  284731:	89 45 e0             	mov    %eax,-0x20(%ebp)
	boxfill8(sht->buf, sht->bxsize, COL8_848484, x0 - 2, y0 - 3, x1 + 1, y0 - 3);
  284734:	8b 45 10             	mov    0x10(%ebp),%eax
  284737:	8d 78 fd             	lea    -0x3(%eax),%edi
  28473a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  28473d:	8d 70 01             	lea    0x1(%eax),%esi
  284740:	8b 45 10             	mov    0x10(%ebp),%eax
  284743:	8d 58 fd             	lea    -0x3(%eax),%ebx
  284746:	8b 45 0c             	mov    0xc(%ebp),%eax
  284749:	8d 48 fe             	lea    -0x2(%eax),%ecx
  28474c:	8b 45 08             	mov    0x8(%ebp),%eax
  28474f:	8b 50 04             	mov    0x4(%eax),%edx
  284752:	8b 45 08             	mov    0x8(%ebp),%eax
  284755:	8b 00                	mov    (%eax),%eax
  284757:	83 ec 04             	sub    $0x4,%esp
  28475a:	57                   	push   %edi
  28475b:	56                   	push   %esi
  28475c:	53                   	push   %ebx
  28475d:	51                   	push   %ecx
  28475e:	6a 0f                	push   $0xf
  284760:	52                   	push   %edx
  284761:	50                   	push   %eax
  284762:	e8 97 cd ff ff       	call   2814fe <boxfill8>
  284767:	83 c4 20             	add    $0x20,%esp
	boxfill8(sht->buf, sht->bxsize, COL8_848484, x0 - 3, y0 - 3, x0 - 3, y1 + 1);
  28476a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  28476d:	8d 78 01             	lea    0x1(%eax),%edi
  284770:	8b 45 0c             	mov    0xc(%ebp),%eax
  284773:	8d 70 fd             	lea    -0x3(%eax),%esi
  284776:	8b 45 10             	mov    0x10(%ebp),%eax
  284779:	8d 58 fd             	lea    -0x3(%eax),%ebx
  28477c:	8b 45 0c             	mov    0xc(%ebp),%eax
  28477f:	8d 48 fd             	lea    -0x3(%eax),%ecx
  284782:	8b 45 08             	mov    0x8(%ebp),%eax
  284785:	8b 50 04             	mov    0x4(%eax),%edx
  284788:	8b 45 08             	mov    0x8(%ebp),%eax
  28478b:	8b 00                	mov    (%eax),%eax
  28478d:	83 ec 04             	sub    $0x4,%esp
  284790:	57                   	push   %edi
  284791:	56                   	push   %esi
  284792:	53                   	push   %ebx
  284793:	51                   	push   %ecx
  284794:	6a 0f                	push   $0xf
  284796:	52                   	push   %edx
  284797:	50                   	push   %eax
  284798:	e8 61 cd ff ff       	call   2814fe <boxfill8>
  28479d:	83 c4 20             	add    $0x20,%esp
	boxfill8(sht->buf, sht->bxsize, COL8_FFFFFF, x0 - 3, y1 + 2, x1 + 1, y1 + 2);
  2847a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2847a3:	8d 78 02             	lea    0x2(%eax),%edi
  2847a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2847a9:	8d 70 01             	lea    0x1(%eax),%esi
  2847ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2847af:	8d 58 02             	lea    0x2(%eax),%ebx
  2847b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  2847b5:	8d 48 fd             	lea    -0x3(%eax),%ecx
  2847b8:	8b 45 08             	mov    0x8(%ebp),%eax
  2847bb:	8b 50 04             	mov    0x4(%eax),%edx
  2847be:	8b 45 08             	mov    0x8(%ebp),%eax
  2847c1:	8b 00                	mov    (%eax),%eax
  2847c3:	83 ec 04             	sub    $0x4,%esp
  2847c6:	57                   	push   %edi
  2847c7:	56                   	push   %esi
  2847c8:	53                   	push   %ebx
  2847c9:	51                   	push   %ecx
  2847ca:	6a 07                	push   $0x7
  2847cc:	52                   	push   %edx
  2847cd:	50                   	push   %eax
  2847ce:	e8 2b cd ff ff       	call   2814fe <boxfill8>
  2847d3:	83 c4 20             	add    $0x20,%esp
	boxfill8(sht->buf, sht->bxsize, COL8_FFFFFF, x1 + 2, y0 - 3, x1 + 2, y1 + 2);
  2847d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2847d9:	8d 78 02             	lea    0x2(%eax),%edi
  2847dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2847df:	8d 70 02             	lea    0x2(%eax),%esi
  2847e2:	8b 45 10             	mov    0x10(%ebp),%eax
  2847e5:	8d 58 fd             	lea    -0x3(%eax),%ebx
  2847e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2847eb:	8d 48 02             	lea    0x2(%eax),%ecx
  2847ee:	8b 45 08             	mov    0x8(%ebp),%eax
  2847f1:	8b 50 04             	mov    0x4(%eax),%edx
  2847f4:	8b 45 08             	mov    0x8(%ebp),%eax
  2847f7:	8b 00                	mov    (%eax),%eax
  2847f9:	83 ec 04             	sub    $0x4,%esp
  2847fc:	57                   	push   %edi
  2847fd:	56                   	push   %esi
  2847fe:	53                   	push   %ebx
  2847ff:	51                   	push   %ecx
  284800:	6a 07                	push   $0x7
  284802:	52                   	push   %edx
  284803:	50                   	push   %eax
  284804:	e8 f5 cc ff ff       	call   2814fe <boxfill8>
  284809:	83 c4 20             	add    $0x20,%esp
	boxfill8(sht->buf, sht->bxsize, COL8_000000, x0 - 1, y0 - 2, x1 + 0, y0 - 2);
  28480c:	8b 45 10             	mov    0x10(%ebp),%eax
  28480f:	8d 70 fe             	lea    -0x2(%eax),%esi
  284812:	8b 45 10             	mov    0x10(%ebp),%eax
  284815:	8d 58 fe             	lea    -0x2(%eax),%ebx
  284818:	8b 45 0c             	mov    0xc(%ebp),%eax
  28481b:	8d 48 ff             	lea    -0x1(%eax),%ecx
  28481e:	8b 45 08             	mov    0x8(%ebp),%eax
  284821:	8b 50 04             	mov    0x4(%eax),%edx
  284824:	8b 45 08             	mov    0x8(%ebp),%eax
  284827:	8b 00                	mov    (%eax),%eax
  284829:	83 ec 04             	sub    $0x4,%esp
  28482c:	56                   	push   %esi
  28482d:	ff 75 e4             	pushl  -0x1c(%ebp)
  284830:	53                   	push   %ebx
  284831:	51                   	push   %ecx
  284832:	6a 00                	push   $0x0
  284834:	52                   	push   %edx
  284835:	50                   	push   %eax
  284836:	e8 c3 cc ff ff       	call   2814fe <boxfill8>
  28483b:	83 c4 20             	add    $0x20,%esp
	boxfill8(sht->buf, sht->bxsize, COL8_000000, x0 - 2, y0 - 2, x0 - 2, y1 + 0);
  28483e:	8b 45 0c             	mov    0xc(%ebp),%eax
  284841:	8d 70 fe             	lea    -0x2(%eax),%esi
  284844:	8b 45 10             	mov    0x10(%ebp),%eax
  284847:	8d 58 fe             	lea    -0x2(%eax),%ebx
  28484a:	8b 45 0c             	mov    0xc(%ebp),%eax
  28484d:	8d 48 fe             	lea    -0x2(%eax),%ecx
  284850:	8b 45 08             	mov    0x8(%ebp),%eax
  284853:	8b 50 04             	mov    0x4(%eax),%edx
  284856:	8b 45 08             	mov    0x8(%ebp),%eax
  284859:	8b 00                	mov    (%eax),%eax
  28485b:	83 ec 04             	sub    $0x4,%esp
  28485e:	ff 75 e0             	pushl  -0x20(%ebp)
  284861:	56                   	push   %esi
  284862:	53                   	push   %ebx
  284863:	51                   	push   %ecx
  284864:	6a 00                	push   $0x0
  284866:	52                   	push   %edx
  284867:	50                   	push   %eax
  284868:	e8 91 cc ff ff       	call   2814fe <boxfill8>
  28486d:	83 c4 20             	add    $0x20,%esp
	boxfill8(sht->buf, sht->bxsize, COL8_C6C6C6, x0 - 2, y1 + 1, x1 + 0, y1 + 1);
  284870:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284873:	8d 70 01             	lea    0x1(%eax),%esi
  284876:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284879:	8d 58 01             	lea    0x1(%eax),%ebx
  28487c:	8b 45 0c             	mov    0xc(%ebp),%eax
  28487f:	8d 48 fe             	lea    -0x2(%eax),%ecx
  284882:	8b 45 08             	mov    0x8(%ebp),%eax
  284885:	8b 50 04             	mov    0x4(%eax),%edx
  284888:	8b 45 08             	mov    0x8(%ebp),%eax
  28488b:	8b 00                	mov    (%eax),%eax
  28488d:	83 ec 04             	sub    $0x4,%esp
  284890:	56                   	push   %esi
  284891:	ff 75 e4             	pushl  -0x1c(%ebp)
  284894:	53                   	push   %ebx
  284895:	51                   	push   %ecx
  284896:	6a 08                	push   $0x8
  284898:	52                   	push   %edx
  284899:	50                   	push   %eax
  28489a:	e8 5f cc ff ff       	call   2814fe <boxfill8>
  28489f:	83 c4 20             	add    $0x20,%esp
	boxfill8(sht->buf, sht->bxsize, COL8_C6C6C6, x1 + 1, y0 - 2, x1 + 1, y1 + 1);
  2848a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2848a5:	8d 78 01             	lea    0x1(%eax),%edi
  2848a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2848ab:	8d 70 01             	lea    0x1(%eax),%esi
  2848ae:	8b 45 10             	mov    0x10(%ebp),%eax
  2848b1:	8d 58 fe             	lea    -0x2(%eax),%ebx
  2848b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2848b7:	8d 48 01             	lea    0x1(%eax),%ecx
  2848ba:	8b 45 08             	mov    0x8(%ebp),%eax
  2848bd:	8b 50 04             	mov    0x4(%eax),%edx
  2848c0:	8b 45 08             	mov    0x8(%ebp),%eax
  2848c3:	8b 00                	mov    (%eax),%eax
  2848c5:	83 ec 04             	sub    $0x4,%esp
  2848c8:	57                   	push   %edi
  2848c9:	56                   	push   %esi
  2848ca:	53                   	push   %ebx
  2848cb:	51                   	push   %ecx
  2848cc:	6a 08                	push   $0x8
  2848ce:	52                   	push   %edx
  2848cf:	50                   	push   %eax
  2848d0:	e8 29 cc ff ff       	call   2814fe <boxfill8>
  2848d5:	83 c4 20             	add    $0x20,%esp
	boxfill8(sht->buf, sht->bxsize, c,           x0 - 1, y0 - 1, x1 + 0, y1 + 0);
  2848d8:	8b 45 10             	mov    0x10(%ebp),%eax
  2848db:	8d 70 ff             	lea    -0x1(%eax),%esi
  2848de:	8b 45 0c             	mov    0xc(%ebp),%eax
  2848e1:	8d 58 ff             	lea    -0x1(%eax),%ebx
  2848e4:	8b 45 1c             	mov    0x1c(%ebp),%eax
  2848e7:	0f b6 c8             	movzbl %al,%ecx
  2848ea:	8b 45 08             	mov    0x8(%ebp),%eax
  2848ed:	8b 50 04             	mov    0x4(%eax),%edx
  2848f0:	8b 45 08             	mov    0x8(%ebp),%eax
  2848f3:	8b 00                	mov    (%eax),%eax
  2848f5:	83 ec 04             	sub    $0x4,%esp
  2848f8:	ff 75 e0             	pushl  -0x20(%ebp)
  2848fb:	ff 75 e4             	pushl  -0x1c(%ebp)
  2848fe:	56                   	push   %esi
  2848ff:	53                   	push   %ebx
  284900:	51                   	push   %ecx
  284901:	52                   	push   %edx
  284902:	50                   	push   %eax
  284903:	e8 f6 cb ff ff       	call   2814fe <boxfill8>
  284908:	83 c4 20             	add    $0x20,%esp
	return;
  28490b:	90                   	nop
}
  28490c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  28490f:	5b                   	pop    %ebx
  284910:	5e                   	pop    %esi
  284911:	5f                   	pop    %edi
  284912:	5d                   	pop    %ebp
  284913:	c3                   	ret    

00284914 <change_wtitle8>:

void change_wtitle8(struct SHEET *sht, char act)
{
  284914:	f3 0f 1e fb          	endbr32 
  284918:	55                   	push   %ebp
  284919:	89 e5                	mov    %esp,%ebp
  28491b:	83 ec 38             	sub    $0x38,%esp
  28491e:	8b 45 0c             	mov    0xc(%ebp),%eax
  284921:	88 45 d4             	mov    %al,-0x2c(%ebp)
	int x, y, xsize = sht->bxsize;
  284924:	8b 45 08             	mov    0x8(%ebp),%eax
  284927:	8b 40 04             	mov    0x4(%eax),%eax
  28492a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	char c, tc_new, tbc_new, tc_old, tbc_old, *buf = sht->buf;
  28492d:	8b 45 08             	mov    0x8(%ebp),%eax
  284930:	8b 00                	mov    (%eax),%eax
  284932:	89 45 e0             	mov    %eax,-0x20(%ebp)
	if (act != 0) {
  284935:	80 7d d4 00          	cmpb   $0x0,-0x2c(%ebp)
  284939:	74 12                	je     28494d <change_wtitle8+0x39>
		tc_new  = COL8_FFFFFF;
  28493b:	c6 45 ee 07          	movb   $0x7,-0x12(%ebp)
		tbc_new = COL8_000084;
  28493f:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
		tc_old  = COL8_C6C6C6;
  284943:	c6 45 ec 08          	movb   $0x8,-0x14(%ebp)
		tbc_old = COL8_848484;
  284947:	c6 45 eb 0f          	movb   $0xf,-0x15(%ebp)
  28494b:	eb 10                	jmp    28495d <change_wtitle8+0x49>
	} else {
		tc_new  = COL8_C6C6C6;
  28494d:	c6 45 ee 08          	movb   $0x8,-0x12(%ebp)
		tbc_new = COL8_848484;
  284951:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
		tc_old  = COL8_FFFFFF;
  284955:	c6 45 ec 07          	movb   $0x7,-0x14(%ebp)
		tbc_old = COL8_000084;
  284959:	c6 45 eb 0c          	movb   $0xc,-0x15(%ebp)
	}
	for (y = 3; y <= 20; y++) {
  28495d:	c7 45 f0 03 00 00 00 	movl   $0x3,-0x10(%ebp)
  284964:	eb 7f                	jmp    2849e5 <change_wtitle8+0xd1>
		for (x = 3; x <= xsize - 4; x++) {
  284966:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
  28496d:	eb 67                	jmp    2849d6 <change_wtitle8+0xc2>
			c = buf[y * xsize + x];
  28496f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  284972:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
  284976:	89 c2                	mov    %eax,%edx
  284978:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28497b:	01 d0                	add    %edx,%eax
  28497d:	89 c2                	mov    %eax,%edx
  28497f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284982:	01 d0                	add    %edx,%eax
  284984:	0f b6 00             	movzbl (%eax),%eax
  284987:	88 45 ef             	mov    %al,-0x11(%ebp)
			if (c == tc_old && x <= xsize - 22) {
  28498a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  28498e:	3a 45 ec             	cmp    -0x14(%ebp),%al
  284991:	75 14                	jne    2849a7 <change_wtitle8+0x93>
  284993:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  284996:	83 e8 15             	sub    $0x15,%eax
  284999:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  28499c:	7d 09                	jge    2849a7 <change_wtitle8+0x93>
				c = tc_new;
  28499e:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
  2849a2:	88 45 ef             	mov    %al,-0x11(%ebp)
  2849a5:	eb 10                	jmp    2849b7 <change_wtitle8+0xa3>
			} else if (c == tbc_old) {
  2849a7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  2849ab:	3a 45 eb             	cmp    -0x15(%ebp),%al
  2849ae:	75 07                	jne    2849b7 <change_wtitle8+0xa3>
				c = tbc_new;
  2849b0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  2849b4:	88 45 ef             	mov    %al,-0x11(%ebp)
			}
			buf[y * xsize + x] = c;
  2849b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2849ba:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
  2849be:	89 c2                	mov    %eax,%edx
  2849c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2849c3:	01 d0                	add    %edx,%eax
  2849c5:	89 c2                	mov    %eax,%edx
  2849c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2849ca:	01 c2                	add    %eax,%edx
  2849cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  2849d0:	88 02                	mov    %al,(%edx)
		for (x = 3; x <= xsize - 4; x++) {
  2849d2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2849d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2849d9:	83 e8 03             	sub    $0x3,%eax
  2849dc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  2849df:	7c 8e                	jl     28496f <change_wtitle8+0x5b>
	for (y = 3; y <= 20; y++) {
  2849e1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  2849e5:	83 7d f0 14          	cmpl   $0x14,-0x10(%ebp)
  2849e9:	0f 8e 77 ff ff ff    	jle    284966 <change_wtitle8+0x52>
		}
	}
	sheet_refresh(sht, 3, 3, xsize, 21);
  2849ef:	83 ec 0c             	sub    $0xc,%esp
  2849f2:	6a 15                	push   $0x15
  2849f4:	ff 75 e4             	pushl  -0x1c(%ebp)
  2849f7:	6a 03                	push   $0x3
  2849f9:	6a 03                	push   $0x3
  2849fb:	ff 75 08             	pushl  0x8(%ebp)
  2849fe:	e8 04 ed ff ff       	call   283707 <sheet_refresh>
  284a03:	83 c4 20             	add    $0x20,%esp
	return;
  284a06:	90                   	nop
}
  284a07:	c9                   	leave  
  284a08:	c3                   	ret    

00284a09 <console_task>:
#include "bootpack.h"
#include <stdio.h>
#include <string.h>

void console_task(struct SHEET *sheet, int memtotal)
{
  284a09:	f3 0f 1e fb          	endbr32 
  284a0d:	55                   	push   %ebp
  284a0e:	89 e5                	mov    %esp,%ebp
  284a10:	57                   	push   %edi
  284a11:	56                   	push   %esi
  284a12:	53                   	push   %ebx
  284a13:	81 ec cc 00 00 00    	sub    $0xcc,%esp
	struct TASK *task = task_now();
  284a19:	e8 89 f2 ff ff       	call   283ca7 <task_now>
  284a1e:	89 45 e0             	mov    %eax,-0x20(%ebp)
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  284a21:	c7 45 dc 00 00 3c 00 	movl   $0x3c0000,-0x24(%ebp)
	int i, *fat = (int *) memman_alloc_4k(memman, 4 * 2880);
  284a28:	83 ec 08             	sub    $0x8,%esp
  284a2b:	68 00 2d 00 00       	push   $0x2d00
  284a30:	ff 75 dc             	pushl  -0x24(%ebp)
  284a33:	e8 bc de ff ff       	call   2828f4 <memman_alloc_4k>
  284a38:	83 c4 10             	add    $0x10,%esp
  284a3b:	89 45 d8             	mov    %eax,-0x28(%ebp)
	struct CONSOLE cons;
	struct FILEHANDLE fhandle[8];
	char cmdline[30];
	unsigned char *nihongo = (char *) *((int *) 0x0fe8);
  284a3e:	b8 e8 0f 00 00       	mov    $0xfe8,%eax
  284a43:	8b 00                	mov    (%eax),%eax
  284a45:	89 45 d4             	mov    %eax,-0x2c(%ebp)

	cons.sht = sheet;
  284a48:	8b 45 08             	mov    0x8(%ebp),%eax
  284a4b:	89 45 c0             	mov    %eax,-0x40(%ebp)
	cons.cur_x =  8;
  284a4e:	c7 45 c4 08 00 00 00 	movl   $0x8,-0x3c(%ebp)
	cons.cur_y = 28;
  284a55:	c7 45 c8 1c 00 00 00 	movl   $0x1c,-0x38(%ebp)
	cons.cur_c = -1;
  284a5c:	c7 45 cc ff ff ff ff 	movl   $0xffffffff,-0x34(%ebp)
	task->cons = &cons;
  284a63:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284a66:	8d 55 c0             	lea    -0x40(%ebp),%edx
  284a69:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
	task->cmdline = cmdline;
  284a6f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284a72:	8d 95 42 ff ff ff    	lea    -0xbe(%ebp),%edx
  284a78:	89 90 b8 00 00 00    	mov    %edx,0xb8(%eax)

	if (cons.sht != 0) {
  284a7e:	8b 45 c0             	mov    -0x40(%ebp),%eax
  284a81:	85 c0                	test   %eax,%eax
  284a83:	74 31                	je     284ab6 <console_task+0xad>
		cons.timer = timer_alloc();
  284a85:	e8 da ee ff ff       	call   283964 <timer_alloc>
  284a8a:	89 45 d0             	mov    %eax,-0x30(%ebp)
		timer_init(cons.timer, &task->fifo, 1);
  284a8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284a90:	8d 50 10             	lea    0x10(%eax),%edx
  284a93:	8b 45 d0             	mov    -0x30(%ebp),%eax
  284a96:	83 ec 04             	sub    $0x4,%esp
  284a99:	6a 01                	push   $0x1
  284a9b:	52                   	push   %edx
  284a9c:	50                   	push   %eax
  284a9d:	e8 54 ef ff ff       	call   2839f6 <timer_init>
  284aa2:	83 c4 10             	add    $0x10,%esp
		timer_settime(cons.timer, 50);
  284aa5:	8b 45 d0             	mov    -0x30(%ebp),%eax
  284aa8:	83 ec 08             	sub    $0x8,%esp
  284aab:	6a 32                	push   $0x32
  284aad:	50                   	push   %eax
  284aae:	e8 5f ef ff ff       	call   283a12 <timer_settime>
  284ab3:	83 c4 10             	add    $0x10,%esp
	}
	file_readfat(fat, (unsigned char *) (ADR_DISKIMG + 0x000200));
  284ab6:	83 ec 08             	sub    $0x8,%esp
  284ab9:	68 00 02 10 00       	push   $0x100200
  284abe:	ff 75 d8             	pushl  -0x28(%ebp)
  284ac1:	e8 34 1c 00 00       	call   2866fa <file_readfat>
  284ac6:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < 8; i++) {
  284ac9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  284ad0:	eb 20                	jmp    284af2 <console_task+0xe9>
		fhandle[i].buf = 0;	/* ÔøΩÔøΩÔøΩgÔøΩpÔøΩ}ÔøΩ[ÔøΩN */
  284ad2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  284ad5:	89 d0                	mov    %edx,%eax
  284ad7:	01 c0                	add    %eax,%eax
  284ad9:	01 d0                	add    %edx,%eax
  284adb:	c1 e0 02             	shl    $0x2,%eax
  284ade:	8d 7d e8             	lea    -0x18(%ebp),%edi
  284ae1:	01 f8                	add    %edi,%eax
  284ae3:	2d 88 00 00 00       	sub    $0x88,%eax
  284ae8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	for (i = 0; i < 8; i++) {
  284aee:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  284af2:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
  284af6:	7e da                	jle    284ad2 <console_task+0xc9>
	}
	task->fhandle = fhandle;
  284af8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284afb:	8d 95 60 ff ff ff    	lea    -0xa0(%ebp),%edx
  284b01:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
	task->fat = fat;
  284b07:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284b0a:	8b 55 d8             	mov    -0x28(%ebp),%edx
  284b0d:	89 90 b4 00 00 00    	mov    %edx,0xb4(%eax)
	if (nihongo[4096] != 0xff) {	/* ÔøΩÔøΩÔøΩ{ÔøΩÔøΩtÔøΩHÔøΩÔøΩÔøΩgÔøΩtÔøΩ@ÔøΩCÔøΩÔøΩÔøΩÔøΩ«Ç›çÔøΩÔøΩﬂÇÔøΩÔøΩÔøΩÔøΩH */
  284b13:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  284b16:	05 00 10 00 00       	add    $0x1000,%eax
  284b1b:	0f b6 00             	movzbl (%eax),%eax
  284b1e:	3c ff                	cmp    $0xff,%al
  284b20:	74 0c                	je     284b2e <console_task+0x125>
		task->langmode = 1;
  284b22:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284b25:	c6 80 bc 00 00 00 01 	movb   $0x1,0xbc(%eax)
  284b2c:	eb 0a                	jmp    284b38 <console_task+0x12f>
	} else {
		task->langmode = 0;
  284b2e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284b31:	c6 80 bc 00 00 00 00 	movb   $0x0,0xbc(%eax)
	}
	task->langbyte1 = 0;
  284b38:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284b3b:	c6 80 bd 00 00 00 00 	movb   $0x0,0xbd(%eax)

	/* ÔøΩvÔøΩÔøΩÔøΩÔøΩÔøΩvÔøΩgÔøΩ\ÔøΩÔøΩ */
	cons_putstr0(&cons, "welcome to myos");
  284b42:	83 ec 08             	sub    $0x8,%esp
  284b45:	68 60 13 31 00       	push   $0x311360
  284b4a:	8d 45 c0             	lea    -0x40(%ebp),%eax
  284b4d:	50                   	push   %eax
  284b4e:	e8 3c 05 00 00       	call   28508f <cons_putstr0>
  284b53:	83 c4 10             	add    $0x10,%esp

	cons_putchar(&cons, '>', 1);
  284b56:	83 ec 04             	sub    $0x4,%esp
  284b59:	6a 01                	push   $0x1
  284b5b:	6a 3e                	push   $0x3e
  284b5d:	8d 45 c0             	lea    -0x40(%ebp),%eax
  284b60:	50                   	push   %eax
  284b61:	e8 c2 02 00 00       	call   284e28 <cons_putchar>
  284b66:	83 c4 10             	add    $0x10,%esp

	for (;;) {
		io_cli();
  284b69:	e8 e4 c5 ff ff       	call   281152 <io_cli>
		if (fifo32_status(&task->fifo) == 0) {
  284b6e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284b71:	83 c0 10             	add    $0x10,%eax
  284b74:	83 ec 0c             	sub    $0xc,%esp
  284b77:	50                   	push   %eax
  284b78:	e8 52 d6 ff ff       	call   2821cf <fifo32_status>
  284b7d:	83 c4 10             	add    $0x10,%esp
  284b80:	85 c0                	test   %eax,%eax
  284b82:	75 15                	jne    284b99 <console_task+0x190>
			task_sleep(task);
  284b84:	83 ec 0c             	sub    $0xc,%esp
  284b87:	ff 75 e0             	pushl  -0x20(%ebp)
  284b8a:	e8 c6 f6 ff ff       	call   284255 <task_sleep>
  284b8f:	83 c4 10             	add    $0x10,%esp
			io_sti();
  284b92:	e8 bd c5 ff ff       	call   281154 <io_sti>
  284b97:	eb d0                	jmp    284b69 <console_task+0x160>
		} else {
			i = fifo32_get(&task->fifo);
  284b99:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284b9c:	83 c0 10             	add    $0x10,%eax
  284b9f:	83 ec 0c             	sub    $0xc,%esp
  284ba2:	50                   	push   %eax
  284ba3:	e8 b4 d5 ff ff       	call   28215c <fifo32_get>
  284ba8:	83 c4 10             	add    $0x10,%esp
  284bab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			io_sti();
  284bae:	e8 a1 c5 ff ff       	call   281154 <io_sti>
			if (i <= 1 && cons.sht != 0) { /* ÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩÔøΩpÔøΩ^ÔøΩCÔøΩ} */
  284bb3:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
  284bb7:	7f 6c                	jg     284c25 <console_task+0x21c>
  284bb9:	8b 45 c0             	mov    -0x40(%ebp),%eax
  284bbc:	85 c0                	test   %eax,%eax
  284bbe:	74 65                	je     284c25 <console_task+0x21c>
				if (i != 0) {
  284bc0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  284bc4:	74 28                	je     284bee <console_task+0x1e5>
					timer_init(cons.timer, &task->fifo, 0); /* ÔøΩÔøΩÔøΩÔøΩ0ÔøΩÔøΩ */
  284bc6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284bc9:	8d 50 10             	lea    0x10(%eax),%edx
  284bcc:	8b 45 d0             	mov    -0x30(%ebp),%eax
  284bcf:	83 ec 04             	sub    $0x4,%esp
  284bd2:	6a 00                	push   $0x0
  284bd4:	52                   	push   %edx
  284bd5:	50                   	push   %eax
  284bd6:	e8 1b ee ff ff       	call   2839f6 <timer_init>
  284bdb:	83 c4 10             	add    $0x10,%esp
					if (cons.cur_c >= 0) {
  284bde:	8b 45 cc             	mov    -0x34(%ebp),%eax
  284be1:	85 c0                	test   %eax,%eax
  284be3:	78 2f                	js     284c14 <console_task+0x20b>
						cons.cur_c = COL8_FFFFFF;
  284be5:	c7 45 cc 07 00 00 00 	movl   $0x7,-0x34(%ebp)
  284bec:	eb 26                	jmp    284c14 <console_task+0x20b>
					}
				} else {
					timer_init(cons.timer, &task->fifo, 1); /* ÔøΩÔøΩÔøΩÔøΩ1ÔøΩÔøΩ */
  284bee:	8b 45 e0             	mov    -0x20(%ebp),%eax
  284bf1:	8d 50 10             	lea    0x10(%eax),%edx
  284bf4:	8b 45 d0             	mov    -0x30(%ebp),%eax
  284bf7:	83 ec 04             	sub    $0x4,%esp
  284bfa:	6a 01                	push   $0x1
  284bfc:	52                   	push   %edx
  284bfd:	50                   	push   %eax
  284bfe:	e8 f3 ed ff ff       	call   2839f6 <timer_init>
  284c03:	83 c4 10             	add    $0x10,%esp
					if (cons.cur_c >= 0) {
  284c06:	8b 45 cc             	mov    -0x34(%ebp),%eax
  284c09:	85 c0                	test   %eax,%eax
  284c0b:	78 07                	js     284c14 <console_task+0x20b>
						cons.cur_c = COL8_000000;
  284c0d:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
					}
				}
				timer_settime(cons.timer, 50);
  284c14:	8b 45 d0             	mov    -0x30(%ebp),%eax
  284c17:	83 ec 08             	sub    $0x8,%esp
  284c1a:	6a 32                	push   $0x32
  284c1c:	50                   	push   %eax
  284c1d:	e8 f0 ed ff ff       	call   283a12 <timer_settime>
  284c22:	83 c4 10             	add    $0x10,%esp
			}
			if (i == 2) {	/* ÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩON */
  284c25:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
  284c29:	75 07                	jne    284c32 <console_task+0x229>
				cons.cur_c = COL8_FFFFFF;
  284c2b:	c7 45 cc 07 00 00 00 	movl   $0x7,-0x34(%ebp)
			}
			if (i == 3) {	/* ÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩOFF */
  284c32:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
  284c36:	75 3e                	jne    284c76 <console_task+0x26d>
				if (cons.sht != 0) {
  284c38:	8b 45 c0             	mov    -0x40(%ebp),%eax
  284c3b:	85 c0                	test   %eax,%eax
  284c3d:	74 30                	je     284c6f <console_task+0x266>
					boxfill8(cons.sht->buf, cons.sht->bxsize, COL8_000000,
						cons.cur_x, cons.cur_y, cons.cur_x + 7, cons.cur_y + 15);
  284c3f:	8b 45 c8             	mov    -0x38(%ebp),%eax
					boxfill8(cons.sht->buf, cons.sht->bxsize, COL8_000000,
  284c42:	8d 78 0f             	lea    0xf(%eax),%edi
						cons.cur_x, cons.cur_y, cons.cur_x + 7, cons.cur_y + 15);
  284c45:	8b 45 c4             	mov    -0x3c(%ebp),%eax
					boxfill8(cons.sht->buf, cons.sht->bxsize, COL8_000000,
  284c48:	8d 70 07             	lea    0x7(%eax),%esi
  284c4b:	8b 5d c8             	mov    -0x38(%ebp),%ebx
  284c4e:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
  284c51:	8b 45 c0             	mov    -0x40(%ebp),%eax
  284c54:	8b 50 04             	mov    0x4(%eax),%edx
  284c57:	8b 45 c0             	mov    -0x40(%ebp),%eax
  284c5a:	8b 00                	mov    (%eax),%eax
  284c5c:	83 ec 04             	sub    $0x4,%esp
  284c5f:	57                   	push   %edi
  284c60:	56                   	push   %esi
  284c61:	53                   	push   %ebx
  284c62:	51                   	push   %ecx
  284c63:	6a 00                	push   $0x0
  284c65:	52                   	push   %edx
  284c66:	50                   	push   %eax
  284c67:	e8 92 c8 ff ff       	call   2814fe <boxfill8>
  284c6c:	83 c4 20             	add    $0x20,%esp
				}
				cons.cur_c = -1;
  284c6f:	c7 45 cc ff ff ff ff 	movl   $0xffffffff,-0x34(%ebp)
			}
			if (i == 4) {	/* ÔøΩRÔøΩÔøΩÔøΩ\ÔøΩ[ÔøΩÔøΩÔøΩÃÅuÔøΩ~ÔøΩvÔøΩ{ÔøΩ^ÔøΩÔøΩÔøΩNÔøΩÔøΩÔøΩbÔøΩN */
  284c76:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
  284c7a:	75 12                	jne    284c8e <console_task+0x285>
				cmd_exit(&cons, fat);
  284c7c:	83 ec 08             	sub    $0x8,%esp
  284c7f:	ff 75 d8             	pushl  -0x28(%ebp)
  284c82:	8d 45 c0             	lea    -0x40(%ebp),%eax
  284c85:	50                   	push   %eax
  284c86:	e8 2c 08 00 00       	call   2854b7 <cmd_exit>
  284c8b:	83 c4 10             	add    $0x10,%esp
			}
			if (256 <= i && i <= 511) { /* ÔøΩLÔøΩ[ÔøΩ{ÔøΩ[ÔøΩhÔøΩfÔøΩ[ÔøΩ^ÔøΩiÔøΩ^ÔøΩXÔøΩNAÔøΩoÔøΩRÔøΩj */
  284c8e:	81 7d e4 ff 00 00 00 	cmpl   $0xff,-0x1c(%ebp)
  284c95:	0f 8e 11 01 00 00    	jle    284dac <console_task+0x3a3>
  284c9b:	81 7d e4 ff 01 00 00 	cmpl   $0x1ff,-0x1c(%ebp)
  284ca2:	0f 8f 04 01 00 00    	jg     284dac <console_task+0x3a3>
				if (i == 8 + 256) {
  284ca8:	81 7d e4 08 01 00 00 	cmpl   $0x108,-0x1c(%ebp)
  284caf:	75 2d                	jne    284cde <console_task+0x2d5>
					/* ÔøΩoÔøΩbÔøΩNÔøΩXÔøΩyÔøΩ[ÔøΩX */
					if (cons.cur_x > 16) {
  284cb1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  284cb4:	83 f8 10             	cmp    $0x10,%eax
  284cb7:	0f 8e ef 00 00 00    	jle    284dac <console_task+0x3a3>
						/* ÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩÔøΩÔøΩÔøΩXÔøΩyÔøΩ[ÔøΩXÔøΩ≈èÔøΩÔøΩÔøΩÔøΩƒÇÔøΩÔøΩÔøΩAÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩÔøΩÔøΩ1ÔøΩ¬ñﬂÇÔøΩ */
						cons_putchar(&cons, ' ', 0);
  284cbd:	83 ec 04             	sub    $0x4,%esp
  284cc0:	6a 00                	push   $0x0
  284cc2:	6a 20                	push   $0x20
  284cc4:	8d 45 c0             	lea    -0x40(%ebp),%eax
  284cc7:	50                   	push   %eax
  284cc8:	e8 5b 01 00 00       	call   284e28 <cons_putchar>
  284ccd:	83 c4 10             	add    $0x10,%esp
						cons.cur_x -= 8;
  284cd0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  284cd3:	83 e8 08             	sub    $0x8,%eax
  284cd6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  284cd9:	e9 ce 00 00 00       	jmp    284dac <console_task+0x3a3>
					}
				} else if (i == 10 + 256) {
  284cde:	81 7d e4 0a 01 00 00 	cmpl   $0x10a,-0x1c(%ebp)
  284ce5:	0f 85 82 00 00 00    	jne    284d6d <console_task+0x364>
					/* Enter */
					/* ÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩÔøΩÔøΩÔøΩXÔøΩyÔøΩ[ÔøΩXÔøΩ≈èÔøΩÔøΩÔøΩÔøΩƒÇÔøΩÔøΩÔøΩÔøΩÔøΩsÔøΩÔøΩÔøΩÔøΩ */
					cons_putchar(&cons, ' ', 0);
  284ceb:	83 ec 04             	sub    $0x4,%esp
  284cee:	6a 00                	push   $0x0
  284cf0:	6a 20                	push   $0x20
  284cf2:	8d 45 c0             	lea    -0x40(%ebp),%eax
  284cf5:	50                   	push   %eax
  284cf6:	e8 2d 01 00 00       	call   284e28 <cons_putchar>
  284cfb:	83 c4 10             	add    $0x10,%esp
					cmdline[cons.cur_x / 8 - 2] = 0;
  284cfe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  284d01:	8d 50 07             	lea    0x7(%eax),%edx
  284d04:	85 c0                	test   %eax,%eax
  284d06:	0f 48 c2             	cmovs  %edx,%eax
  284d09:	c1 f8 03             	sar    $0x3,%eax
  284d0c:	83 e8 02             	sub    $0x2,%eax
  284d0f:	c6 84 05 42 ff ff ff 	movb   $0x0,-0xbe(%ebp,%eax,1)
  284d16:	00 
					cons_newline(&cons);
  284d17:	83 ec 0c             	sub    $0xc,%esp
  284d1a:	8d 45 c0             	lea    -0x40(%ebp),%eax
  284d1d:	50                   	push   %eax
  284d1e:	e8 27 02 00 00       	call   284f4a <cons_newline>
  284d23:	83 c4 10             	add    $0x10,%esp
					cons_runcmd(cmdline, &cons, fat, memtotal);	/* ÔøΩRÔøΩ}ÔøΩÔøΩÔøΩhÔøΩÔøΩÔøΩs */
  284d26:	ff 75 0c             	pushl  0xc(%ebp)
  284d29:	ff 75 d8             	pushl  -0x28(%ebp)
  284d2c:	8d 45 c0             	lea    -0x40(%ebp),%eax
  284d2f:	50                   	push   %eax
  284d30:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
  284d36:	50                   	push   %eax
  284d37:	e8 cb 03 00 00       	call   285107 <cons_runcmd>
  284d3c:	83 c4 10             	add    $0x10,%esp
					if (cons.sht == 0) {
  284d3f:	8b 45 c0             	mov    -0x40(%ebp),%eax
  284d42:	85 c0                	test   %eax,%eax
  284d44:	75 12                	jne    284d58 <console_task+0x34f>
						cmd_exit(&cons, fat);
  284d46:	83 ec 08             	sub    $0x8,%esp
  284d49:	ff 75 d8             	pushl  -0x28(%ebp)
  284d4c:	8d 45 c0             	lea    -0x40(%ebp),%eax
  284d4f:	50                   	push   %eax
  284d50:	e8 62 07 00 00       	call   2854b7 <cmd_exit>
  284d55:	83 c4 10             	add    $0x10,%esp
					}
					/* ÔøΩvÔøΩÔøΩÔøΩÔøΩÔøΩvÔøΩgÔøΩ\ÔøΩÔøΩ */
					cons_putchar(&cons, '>', 1);
  284d58:	83 ec 04             	sub    $0x4,%esp
  284d5b:	6a 01                	push   $0x1
  284d5d:	6a 3e                	push   $0x3e
  284d5f:	8d 45 c0             	lea    -0x40(%ebp),%eax
  284d62:	50                   	push   %eax
  284d63:	e8 c0 00 00 00       	call   284e28 <cons_putchar>
  284d68:	83 c4 10             	add    $0x10,%esp
  284d6b:	eb 3f                	jmp    284dac <console_task+0x3a3>
				} else {
					/* ÔøΩÔøΩ ïÔøΩÔøΩÔøΩ */
					if (cons.cur_x < 240) {
  284d6d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  284d70:	3d ef 00 00 00       	cmp    $0xef,%eax
  284d75:	7f 35                	jg     284dac <console_task+0x3a3>
						/* ÔøΩÍï∂ÔøΩÔøΩÔøΩ\ÔøΩÔøΩÔøΩÔøΩÔøΩƒÇÔøΩÔøΩÔøΩAÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩÔøΩÔøΩ1ÔøΩ¬êiÔøΩﬂÇÔøΩ */
						cmdline[cons.cur_x / 8 - 2] = i - 256;
  284d77:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  284d7a:	8d 50 07             	lea    0x7(%eax),%edx
  284d7d:	85 c0                	test   %eax,%eax
  284d7f:	0f 48 c2             	cmovs  %edx,%eax
  284d82:	c1 f8 03             	sar    $0x3,%eax
  284d85:	83 e8 02             	sub    $0x2,%eax
  284d88:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  284d8b:	88 94 05 42 ff ff ff 	mov    %dl,-0xbe(%ebp,%eax,1)
						cons_putchar(&cons, i - 256, 1);
  284d92:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  284d95:	2d 00 01 00 00       	sub    $0x100,%eax
  284d9a:	83 ec 04             	sub    $0x4,%esp
  284d9d:	6a 01                	push   $0x1
  284d9f:	50                   	push   %eax
  284da0:	8d 45 c0             	lea    -0x40(%ebp),%eax
  284da3:	50                   	push   %eax
  284da4:	e8 7f 00 00 00       	call   284e28 <cons_putchar>
  284da9:	83 c4 10             	add    $0x10,%esp
					}
				}
			}
			/* ÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩÔøΩƒï\ÔøΩÔøΩ */
			if (cons.sht != 0) {
  284dac:	8b 45 c0             	mov    -0x40(%ebp),%eax
  284daf:	85 c0                	test   %eax,%eax
  284db1:	0f 84 b2 fd ff ff    	je     284b69 <console_task+0x160>
				if (cons.cur_c >= 0) {
  284db7:	8b 45 cc             	mov    -0x34(%ebp),%eax
  284dba:	85 c0                	test   %eax,%eax
  284dbc:	78 40                	js     284dfe <console_task+0x3f5>
					boxfill8(cons.sht->buf, cons.sht->bxsize, cons.cur_c, 
						cons.cur_x, cons.cur_y, cons.cur_x + 7, cons.cur_y + 15);
  284dbe:	8b 45 c8             	mov    -0x38(%ebp),%eax
					boxfill8(cons.sht->buf, cons.sht->bxsize, cons.cur_c, 
  284dc1:	83 c0 0f             	add    $0xf,%eax
  284dc4:	89 85 34 ff ff ff    	mov    %eax,-0xcc(%ebp)
						cons.cur_x, cons.cur_y, cons.cur_x + 7, cons.cur_y + 15);
  284dca:	8b 45 c4             	mov    -0x3c(%ebp),%eax
					boxfill8(cons.sht->buf, cons.sht->bxsize, cons.cur_c, 
  284dcd:	8d 78 07             	lea    0x7(%eax),%edi
  284dd0:	8b 75 c8             	mov    -0x38(%ebp),%esi
  284dd3:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
  284dd6:	8b 45 cc             	mov    -0x34(%ebp),%eax
  284dd9:	0f b6 c8             	movzbl %al,%ecx
  284ddc:	8b 45 c0             	mov    -0x40(%ebp),%eax
  284ddf:	8b 50 04             	mov    0x4(%eax),%edx
  284de2:	8b 45 c0             	mov    -0x40(%ebp),%eax
  284de5:	8b 00                	mov    (%eax),%eax
  284de7:	83 ec 04             	sub    $0x4,%esp
  284dea:	ff b5 34 ff ff ff    	pushl  -0xcc(%ebp)
  284df0:	57                   	push   %edi
  284df1:	56                   	push   %esi
  284df2:	53                   	push   %ebx
  284df3:	51                   	push   %ecx
  284df4:	52                   	push   %edx
  284df5:	50                   	push   %eax
  284df6:	e8 03 c7 ff ff       	call   2814fe <boxfill8>
  284dfb:	83 c4 20             	add    $0x20,%esp
				}
				sheet_refresh(cons.sht, cons.cur_x, cons.cur_y, cons.cur_x + 8, cons.cur_y + 16);
  284dfe:	8b 45 c8             	mov    -0x38(%ebp),%eax
  284e01:	8d 70 10             	lea    0x10(%eax),%esi
  284e04:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  284e07:	8d 58 08             	lea    0x8(%eax),%ebx
  284e0a:	8b 4d c8             	mov    -0x38(%ebp),%ecx
  284e0d:	8b 55 c4             	mov    -0x3c(%ebp),%edx
  284e10:	8b 45 c0             	mov    -0x40(%ebp),%eax
  284e13:	83 ec 0c             	sub    $0xc,%esp
  284e16:	56                   	push   %esi
  284e17:	53                   	push   %ebx
  284e18:	51                   	push   %ecx
  284e19:	52                   	push   %edx
  284e1a:	50                   	push   %eax
  284e1b:	e8 e7 e8 ff ff       	call   283707 <sheet_refresh>
  284e20:	83 c4 20             	add    $0x20,%esp
		io_cli();
  284e23:	e9 41 fd ff ff       	jmp    284b69 <console_task+0x160>

00284e28 <cons_putchar>:
		}
	}
}

void cons_putchar(struct CONSOLE *cons, int chr, char move)
{
  284e28:	f3 0f 1e fb          	endbr32 
  284e2c:	55                   	push   %ebp
  284e2d:	89 e5                	mov    %esp,%ebp
  284e2f:	53                   	push   %ebx
  284e30:	83 ec 24             	sub    $0x24,%esp
  284e33:	8b 45 10             	mov    0x10(%ebp),%eax
  284e36:	88 45 e4             	mov    %al,-0x1c(%ebp)
	char s[2];
	s[0] = chr;
  284e39:	8b 45 0c             	mov    0xc(%ebp),%eax
  284e3c:	88 45 f6             	mov    %al,-0xa(%ebp)
	s[1] = 0;
  284e3f:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
	if (s[0] == 0x09) {	/* ÔøΩ^ÔøΩu */
  284e43:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  284e47:	3c 09                	cmp    $0x9,%al
  284e49:	75 73                	jne    284ebe <cons_putchar+0x96>
		for (;;) {
			if (cons->sht != 0) {
  284e4b:	8b 45 08             	mov    0x8(%ebp),%eax
  284e4e:	8b 00                	mov    (%eax),%eax
  284e50:	85 c0                	test   %eax,%eax
  284e52:	74 2a                	je     284e7e <cons_putchar+0x56>
				putfonts8_asc_sht(cons->sht, cons->cur_x, cons->cur_y, COL8_FFFFFF, COL8_000000, " ", 1);
  284e54:	8b 45 08             	mov    0x8(%ebp),%eax
  284e57:	8b 48 08             	mov    0x8(%eax),%ecx
  284e5a:	8b 45 08             	mov    0x8(%ebp),%eax
  284e5d:	8b 50 04             	mov    0x4(%eax),%edx
  284e60:	8b 45 08             	mov    0x8(%ebp),%eax
  284e63:	8b 00                	mov    (%eax),%eax
  284e65:	83 ec 04             	sub    $0x4,%esp
  284e68:	6a 01                	push   $0x1
  284e6a:	68 70 13 31 00       	push   $0x311370
  284e6f:	6a 00                	push   $0x0
  284e71:	6a 07                	push   $0x7
  284e73:	51                   	push   %ecx
  284e74:	52                   	push   %edx
  284e75:	50                   	push   %eax
  284e76:	e8 73 f7 ff ff       	call   2845ee <putfonts8_asc_sht>
  284e7b:	83 c4 20             	add    $0x20,%esp
			}
			cons->cur_x += 8;
  284e7e:	8b 45 08             	mov    0x8(%ebp),%eax
  284e81:	8b 40 04             	mov    0x4(%eax),%eax
  284e84:	8d 50 08             	lea    0x8(%eax),%edx
  284e87:	8b 45 08             	mov    0x8(%ebp),%eax
  284e8a:	89 50 04             	mov    %edx,0x4(%eax)
			if (cons->cur_x == 8 + 240) {
  284e8d:	8b 45 08             	mov    0x8(%ebp),%eax
  284e90:	8b 40 04             	mov    0x4(%eax),%eax
  284e93:	3d f8 00 00 00       	cmp    $0xf8,%eax
  284e98:	75 0e                	jne    284ea8 <cons_putchar+0x80>
				cons_newline(cons);
  284e9a:	83 ec 0c             	sub    $0xc,%esp
  284e9d:	ff 75 08             	pushl  0x8(%ebp)
  284ea0:	e8 a5 00 00 00       	call   284f4a <cons_newline>
  284ea5:	83 c4 10             	add    $0x10,%esp
			}
			if (((cons->cur_x - 8) & 0x1f) == 0) {
  284ea8:	8b 45 08             	mov    0x8(%ebp),%eax
  284eab:	8b 40 04             	mov    0x4(%eax),%eax
  284eae:	83 e8 08             	sub    $0x8,%eax
  284eb1:	83 e0 1f             	and    $0x1f,%eax
  284eb4:	85 c0                	test   %eax,%eax
  284eb6:	0f 84 86 00 00 00    	je     284f42 <cons_putchar+0x11a>
			if (cons->sht != 0) {
  284ebc:	eb 8d                	jmp    284e4b <cons_putchar+0x23>
				break;	/* 32ÔøΩ≈äÔøΩÔøΩÔøΩÿÇÍÇΩÔøΩÔøΩbreak */
			}
		}
	} else if (s[0] == 0x0a) {	/* ÔøΩÔøΩÔøΩs */
  284ebe:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  284ec2:	3c 0a                	cmp    $0xa,%al
  284ec4:	75 10                	jne    284ed6 <cons_putchar+0xae>
		cons_newline(cons);
  284ec6:	83 ec 0c             	sub    $0xc,%esp
  284ec9:	ff 75 08             	pushl  0x8(%ebp)
  284ecc:	e8 79 00 00 00       	call   284f4a <cons_newline>
  284ed1:	83 c4 10             	add    $0x10,%esp
			if (cons->cur_x == 8 + 240) {
				cons_newline(cons);
			}
		}
	}
	return;
  284ed4:	eb 6e                	jmp    284f44 <cons_putchar+0x11c>
	} else if (s[0] == 0x0d) {	/* ÔøΩÔøΩÔøΩA */
  284ed6:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  284eda:	3c 0d                	cmp    $0xd,%al
  284edc:	74 66                	je     284f44 <cons_putchar+0x11c>
		if (cons->sht != 0) {
  284ede:	8b 45 08             	mov    0x8(%ebp),%eax
  284ee1:	8b 00                	mov    (%eax),%eax
  284ee3:	85 c0                	test   %eax,%eax
  284ee5:	74 29                	je     284f10 <cons_putchar+0xe8>
			putfonts8_asc_sht(cons->sht, cons->cur_x, cons->cur_y, COL8_FFFFFF, COL8_000000, s, 1);
  284ee7:	8b 45 08             	mov    0x8(%ebp),%eax
  284eea:	8b 48 08             	mov    0x8(%eax),%ecx
  284eed:	8b 45 08             	mov    0x8(%ebp),%eax
  284ef0:	8b 50 04             	mov    0x4(%eax),%edx
  284ef3:	8b 45 08             	mov    0x8(%ebp),%eax
  284ef6:	8b 00                	mov    (%eax),%eax
  284ef8:	83 ec 04             	sub    $0x4,%esp
  284efb:	6a 01                	push   $0x1
  284efd:	8d 5d f6             	lea    -0xa(%ebp),%ebx
  284f00:	53                   	push   %ebx
  284f01:	6a 00                	push   $0x0
  284f03:	6a 07                	push   $0x7
  284f05:	51                   	push   %ecx
  284f06:	52                   	push   %edx
  284f07:	50                   	push   %eax
  284f08:	e8 e1 f6 ff ff       	call   2845ee <putfonts8_asc_sht>
  284f0d:	83 c4 20             	add    $0x20,%esp
		if (move != 0) {
  284f10:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
  284f14:	74 2e                	je     284f44 <cons_putchar+0x11c>
			cons->cur_x += 8;
  284f16:	8b 45 08             	mov    0x8(%ebp),%eax
  284f19:	8b 40 04             	mov    0x4(%eax),%eax
  284f1c:	8d 50 08             	lea    0x8(%eax),%edx
  284f1f:	8b 45 08             	mov    0x8(%ebp),%eax
  284f22:	89 50 04             	mov    %edx,0x4(%eax)
			if (cons->cur_x == 8 + 240) {
  284f25:	8b 45 08             	mov    0x8(%ebp),%eax
  284f28:	8b 40 04             	mov    0x4(%eax),%eax
  284f2b:	3d f8 00 00 00       	cmp    $0xf8,%eax
  284f30:	75 12                	jne    284f44 <cons_putchar+0x11c>
				cons_newline(cons);
  284f32:	83 ec 0c             	sub    $0xc,%esp
  284f35:	ff 75 08             	pushl  0x8(%ebp)
  284f38:	e8 0d 00 00 00       	call   284f4a <cons_newline>
  284f3d:	83 c4 10             	add    $0x10,%esp
	return;
  284f40:	eb 01                	jmp    284f43 <cons_putchar+0x11b>
				break;	/* 32ÔøΩ≈äÔøΩÔøΩÔøΩÿÇÍÇΩÔøΩÔøΩbreak */
  284f42:	90                   	nop
	return;
  284f43:	90                   	nop
  284f44:	90                   	nop
}
  284f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  284f48:	c9                   	leave  
  284f49:	c3                   	ret    

00284f4a <cons_newline>:

void cons_newline(struct CONSOLE *cons)
{
  284f4a:	f3 0f 1e fb          	endbr32 
  284f4e:	55                   	push   %ebp
  284f4f:	89 e5                	mov    %esp,%ebp
  284f51:	53                   	push   %ebx
  284f52:	83 ec 14             	sub    $0x14,%esp
	int x, y;
	struct SHEET *sheet = cons->sht;
  284f55:	8b 45 08             	mov    0x8(%ebp),%eax
  284f58:	8b 00                	mov    (%eax),%eax
  284f5a:	89 45 ec             	mov    %eax,-0x14(%ebp)
	struct TASK *task = task_now();
  284f5d:	e8 45 ed ff ff       	call   283ca7 <task_now>
  284f62:	89 45 e8             	mov    %eax,-0x18(%ebp)
	if (cons->cur_y < 28 + 112) {
  284f65:	8b 45 08             	mov    0x8(%ebp),%eax
  284f68:	8b 40 08             	mov    0x8(%eax),%eax
  284f6b:	3d 8b 00 00 00       	cmp    $0x8b,%eax
  284f70:	7f 14                	jg     284f86 <cons_newline+0x3c>
		cons->cur_y += 16; /* ÔøΩÔøΩÔøΩÃçsÔøΩÔøΩ */
  284f72:	8b 45 08             	mov    0x8(%ebp),%eax
  284f75:	8b 40 08             	mov    0x8(%eax),%eax
  284f78:	8d 50 10             	lea    0x10(%eax),%edx
  284f7b:	8b 45 08             	mov    0x8(%ebp),%eax
  284f7e:	89 50 08             	mov    %edx,0x8(%eax)
  284f81:	e9 d2 00 00 00       	jmp    285058 <cons_newline+0x10e>
	} else {
		/* ÔøΩXÔøΩNÔøΩÔøΩÔøΩ[ÔøΩÔøΩ */
		if (sheet != 0) {
  284f86:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  284f8a:	0f 84 c8 00 00 00    	je     285058 <cons_newline+0x10e>
			for (y = 28; y < 28 + 112; y++) {
  284f90:	c7 45 f0 1c 00 00 00 	movl   $0x1c,-0x10(%ebp)
  284f97:	eb 53                	jmp    284fec <cons_newline+0xa2>
				for (x = 8; x < 8 + 240; x++) {
  284f99:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
  284fa0:	eb 3d                	jmp    284fdf <cons_newline+0x95>
					sheet->buf[x + y * sheet->bxsize] = sheet->buf[x + (y + 16) * sheet->bxsize];
  284fa2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  284fa5:	8b 10                	mov    (%eax),%edx
  284fa7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  284faa:	8d 48 10             	lea    0x10(%eax),%ecx
  284fad:	8b 45 ec             	mov    -0x14(%ebp),%eax
  284fb0:	8b 40 04             	mov    0x4(%eax),%eax
  284fb3:	0f af c8             	imul   %eax,%ecx
  284fb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  284fb9:	01 c8                	add    %ecx,%eax
  284fbb:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  284fbe:	8b 45 ec             	mov    -0x14(%ebp),%eax
  284fc1:	8b 10                	mov    (%eax),%edx
  284fc3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  284fc6:	8b 40 04             	mov    0x4(%eax),%eax
  284fc9:	0f af 45 f0          	imul   -0x10(%ebp),%eax
  284fcd:	89 c3                	mov    %eax,%ebx
  284fcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  284fd2:	01 d8                	add    %ebx,%eax
  284fd4:	01 c2                	add    %eax,%edx
  284fd6:	0f b6 01             	movzbl (%ecx),%eax
  284fd9:	88 02                	mov    %al,(%edx)
				for (x = 8; x < 8 + 240; x++) {
  284fdb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  284fdf:	81 7d f4 f7 00 00 00 	cmpl   $0xf7,-0xc(%ebp)
  284fe6:	7e ba                	jle    284fa2 <cons_newline+0x58>
			for (y = 28; y < 28 + 112; y++) {
  284fe8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  284fec:	81 7d f0 8b 00 00 00 	cmpl   $0x8b,-0x10(%ebp)
  284ff3:	7e a4                	jle    284f99 <cons_newline+0x4f>
				}
			}
			for (y = 28 + 112; y < 28 + 128; y++) {
  284ff5:	c7 45 f0 8c 00 00 00 	movl   $0x8c,-0x10(%ebp)
  284ffc:	eb 35                	jmp    285033 <cons_newline+0xe9>
				for (x = 8; x < 8 + 240; x++) {
  284ffe:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
  285005:	eb 1f                	jmp    285026 <cons_newline+0xdc>
					sheet->buf[x + y * sheet->bxsize] = COL8_000000;
  285007:	8b 45 ec             	mov    -0x14(%ebp),%eax
  28500a:	8b 10                	mov    (%eax),%edx
  28500c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  28500f:	8b 40 04             	mov    0x4(%eax),%eax
  285012:	0f af 45 f0          	imul   -0x10(%ebp),%eax
  285016:	89 c1                	mov    %eax,%ecx
  285018:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28501b:	01 c8                	add    %ecx,%eax
  28501d:	01 d0                	add    %edx,%eax
  28501f:	c6 00 00             	movb   $0x0,(%eax)
				for (x = 8; x < 8 + 240; x++) {
  285022:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  285026:	81 7d f4 f7 00 00 00 	cmpl   $0xf7,-0xc(%ebp)
  28502d:	7e d8                	jle    285007 <cons_newline+0xbd>
			for (y = 28 + 112; y < 28 + 128; y++) {
  28502f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  285033:	81 7d f0 9b 00 00 00 	cmpl   $0x9b,-0x10(%ebp)
  28503a:	7e c2                	jle    284ffe <cons_newline+0xb4>
				}
			}
			sheet_refresh(sheet, 8, 28, 8 + 240, 28 + 128);
  28503c:	83 ec 0c             	sub    $0xc,%esp
  28503f:	68 9c 00 00 00       	push   $0x9c
  285044:	68 f8 00 00 00       	push   $0xf8
  285049:	6a 1c                	push   $0x1c
  28504b:	6a 08                	push   $0x8
  28504d:	ff 75 ec             	pushl  -0x14(%ebp)
  285050:	e8 b2 e6 ff ff       	call   283707 <sheet_refresh>
  285055:	83 c4 20             	add    $0x20,%esp
		}
	}
	cons->cur_x = 8;
  285058:	8b 45 08             	mov    0x8(%ebp),%eax
  28505b:	c7 40 04 08 00 00 00 	movl   $0x8,0x4(%eax)
	if (task->langmode == 1 && task->langbyte1 != 0) {
  285062:	8b 45 e8             	mov    -0x18(%ebp),%eax
  285065:	0f b6 80 bc 00 00 00 	movzbl 0xbc(%eax),%eax
  28506c:	3c 01                	cmp    $0x1,%al
  28506e:	75 19                	jne    285089 <cons_newline+0x13f>
  285070:	8b 45 e8             	mov    -0x18(%ebp),%eax
  285073:	0f b6 80 bd 00 00 00 	movzbl 0xbd(%eax),%eax
  28507a:	84 c0                	test   %al,%al
  28507c:	74 0b                	je     285089 <cons_newline+0x13f>
		cons->cur_x = 16;
  28507e:	8b 45 08             	mov    0x8(%ebp),%eax
  285081:	c7 40 04 10 00 00 00 	movl   $0x10,0x4(%eax)
	}
	return;
  285088:	90                   	nop
  285089:	90                   	nop
}
  28508a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  28508d:	c9                   	leave  
  28508e:	c3                   	ret    

0028508f <cons_putstr0>:

void cons_putstr0(struct CONSOLE *cons, char *s)
{
  28508f:	f3 0f 1e fb          	endbr32 
  285093:	55                   	push   %ebp
  285094:	89 e5                	mov    %esp,%ebp
  285096:	83 ec 08             	sub    $0x8,%esp
	for (; *s != 0; s++) {
  285099:	eb 1e                	jmp    2850b9 <cons_putstr0+0x2a>
		cons_putchar(cons, *s, 1);
  28509b:	8b 45 0c             	mov    0xc(%ebp),%eax
  28509e:	0f b6 00             	movzbl (%eax),%eax
  2850a1:	0f be c0             	movsbl %al,%eax
  2850a4:	83 ec 04             	sub    $0x4,%esp
  2850a7:	6a 01                	push   $0x1
  2850a9:	50                   	push   %eax
  2850aa:	ff 75 08             	pushl  0x8(%ebp)
  2850ad:	e8 76 fd ff ff       	call   284e28 <cons_putchar>
  2850b2:	83 c4 10             	add    $0x10,%esp
	for (; *s != 0; s++) {
  2850b5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  2850b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  2850bc:	0f b6 00             	movzbl (%eax),%eax
  2850bf:	84 c0                	test   %al,%al
  2850c1:	75 d8                	jne    28509b <cons_putstr0+0xc>
	}
	return;
  2850c3:	90                   	nop
}
  2850c4:	c9                   	leave  
  2850c5:	c3                   	ret    

002850c6 <cons_putstr1>:

void cons_putstr1(struct CONSOLE *cons, char *s, int l)
{
  2850c6:	f3 0f 1e fb          	endbr32 
  2850ca:	55                   	push   %ebp
  2850cb:	89 e5                	mov    %esp,%ebp
  2850cd:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < l; i++) {
  2850d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2850d7:	eb 23                	jmp    2850fc <cons_putstr1+0x36>
		cons_putchar(cons, s[i], 1);
  2850d9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2850dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  2850df:	01 d0                	add    %edx,%eax
  2850e1:	0f b6 00             	movzbl (%eax),%eax
  2850e4:	0f be c0             	movsbl %al,%eax
  2850e7:	83 ec 04             	sub    $0x4,%esp
  2850ea:	6a 01                	push   $0x1
  2850ec:	50                   	push   %eax
  2850ed:	ff 75 08             	pushl  0x8(%ebp)
  2850f0:	e8 33 fd ff ff       	call   284e28 <cons_putchar>
  2850f5:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < l; i++) {
  2850f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2850fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2850ff:	3b 45 10             	cmp    0x10(%ebp),%eax
  285102:	7c d5                	jl     2850d9 <cons_putstr1+0x13>
	}
	return;
  285104:	90                   	nop
}
  285105:	c9                   	leave  
  285106:	c3                   	ret    

00285107 <cons_runcmd>:

void cons_runcmd(char *cmdline, struct CONSOLE *cons, int *fat, int memtotal)
{
  285107:	f3 0f 1e fb          	endbr32 
  28510b:	55                   	push   %ebp
  28510c:	89 e5                	mov    %esp,%ebp
  28510e:	83 ec 08             	sub    $0x8,%esp
	if (strcmp(cmdline, "mem") == 0 && cons->sht != 0) {
  285111:	83 ec 08             	sub    $0x8,%esp
  285114:	68 72 13 31 00       	push   $0x311372
  285119:	ff 75 08             	pushl  0x8(%ebp)
  28511c:	e8 85 36 00 00       	call   2887a6 <strcmp>
  285121:	83 c4 10             	add    $0x10,%esp
  285124:	85 c0                	test   %eax,%eax
  285126:	75 1f                	jne    285147 <cons_runcmd+0x40>
  285128:	8b 45 0c             	mov    0xc(%ebp),%eax
  28512b:	8b 00                	mov    (%eax),%eax
  28512d:	85 c0                	test   %eax,%eax
  28512f:	74 16                	je     285147 <cons_runcmd+0x40>
		cmd_mem(cons, memtotal);
  285131:	83 ec 08             	sub    $0x8,%esp
  285134:	ff 75 14             	pushl  0x14(%ebp)
  285137:	ff 75 0c             	pushl  0xc(%ebp)
  28513a:	e8 61 01 00 00       	call   2852a0 <cmd_mem>
  28513f:	83 c4 10             	add    $0x10,%esp
  285142:	e9 55 01 00 00       	jmp    28529c <cons_runcmd+0x195>
	} else if (strcmp(cmdline, "cls") == 0 && cons->sht != 0) {
  285147:	83 ec 08             	sub    $0x8,%esp
  28514a:	68 76 13 31 00       	push   $0x311376
  28514f:	ff 75 08             	pushl  0x8(%ebp)
  285152:	e8 4f 36 00 00       	call   2887a6 <strcmp>
  285157:	83 c4 10             	add    $0x10,%esp
  28515a:	85 c0                	test   %eax,%eax
  28515c:	75 1c                	jne    28517a <cons_runcmd+0x73>
  28515e:	8b 45 0c             	mov    0xc(%ebp),%eax
  285161:	8b 00                	mov    (%eax),%eax
  285163:	85 c0                	test   %eax,%eax
  285165:	74 13                	je     28517a <cons_runcmd+0x73>
		cmd_cls(cons);
  285167:	83 ec 0c             	sub    $0xc,%esp
  28516a:	ff 75 0c             	pushl  0xc(%ebp)
  28516d:	e8 8b 01 00 00       	call   2852fd <cmd_cls>
  285172:	83 c4 10             	add    $0x10,%esp
  285175:	e9 22 01 00 00       	jmp    28529c <cons_runcmd+0x195>
	} else if (strcmp(cmdline, "dir") == 0 && cons->sht != 0) {
  28517a:	83 ec 08             	sub    $0x8,%esp
  28517d:	68 7a 13 31 00       	push   $0x31137a
  285182:	ff 75 08             	pushl  0x8(%ebp)
  285185:	e8 1c 36 00 00       	call   2887a6 <strcmp>
  28518a:	83 c4 10             	add    $0x10,%esp
  28518d:	85 c0                	test   %eax,%eax
  28518f:	75 1c                	jne    2851ad <cons_runcmd+0xa6>
  285191:	8b 45 0c             	mov    0xc(%ebp),%eax
  285194:	8b 00                	mov    (%eax),%eax
  285196:	85 c0                	test   %eax,%eax
  285198:	74 13                	je     2851ad <cons_runcmd+0xa6>
		cmd_dir(cons);
  28519a:	83 ec 0c             	sub    $0xc,%esp
  28519d:	ff 75 0c             	pushl  0xc(%ebp)
  2851a0:	e8 da 01 00 00       	call   28537f <cmd_dir>
  2851a5:	83 c4 10             	add    $0x10,%esp
  2851a8:	e9 ef 00 00 00       	jmp    28529c <cons_runcmd+0x195>
	} else if (strcmp(cmdline, "exit") == 0) {
  2851ad:	83 ec 08             	sub    $0x8,%esp
  2851b0:	68 7e 13 31 00       	push   $0x31137e
  2851b5:	ff 75 08             	pushl  0x8(%ebp)
  2851b8:	e8 e9 35 00 00       	call   2887a6 <strcmp>
  2851bd:	83 c4 10             	add    $0x10,%esp
  2851c0:	85 c0                	test   %eax,%eax
  2851c2:	75 16                	jne    2851da <cons_runcmd+0xd3>
		cmd_exit(cons, fat);
  2851c4:	83 ec 08             	sub    $0x8,%esp
  2851c7:	ff 75 10             	pushl  0x10(%ebp)
  2851ca:	ff 75 0c             	pushl  0xc(%ebp)
  2851cd:	e8 e5 02 00 00       	call   2854b7 <cmd_exit>
  2851d2:	83 c4 10             	add    $0x10,%esp
		if (cmd_app(cons, fat, cmdline) == 0) {
			/* ÔøΩRÔøΩ}ÔøΩÔøΩÔøΩhÔøΩ≈ÇÕÇ»ÇÔøΩÔøΩAÔøΩAÔøΩvÔøΩÔøΩÔøΩ≈ÇÔøΩÔøΩ»ÇÔøΩÔøΩAÔøΩÔøΩÔøΩÔøΩ…ãÔøΩsÔøΩ≈ÇÔøΩÔøΩ»ÇÔøΩ */
			cons_putstr0(cons, "Bad command.\n\n");
		}
	}
	return;
  2851d5:	e9 c3 00 00 00       	jmp    28529d <cons_runcmd+0x196>
	} else if (strncmp(cmdline, "start ", 6) == 0) {
  2851da:	83 ec 04             	sub    $0x4,%esp
  2851dd:	6a 06                	push   $0x6
  2851df:	68 83 13 31 00       	push   $0x311383
  2851e4:	ff 75 08             	pushl  0x8(%ebp)
  2851e7:	e8 15 36 00 00       	call   288801 <strncmp>
  2851ec:	83 c4 10             	add    $0x10,%esp
  2851ef:	85 c0                	test   %eax,%eax
  2851f1:	75 19                	jne    28520c <cons_runcmd+0x105>
		cmd_start(cons, cmdline, memtotal);
  2851f3:	83 ec 04             	sub    $0x4,%esp
  2851f6:	ff 75 14             	pushl  0x14(%ebp)
  2851f9:	ff 75 08             	pushl  0x8(%ebp)
  2851fc:	ff 75 0c             	pushl  0xc(%ebp)
  2851ff:	e8 91 03 00 00       	call   285595 <cmd_start>
  285204:	83 c4 10             	add    $0x10,%esp
	return;
  285207:	e9 91 00 00 00       	jmp    28529d <cons_runcmd+0x196>
	} else if (strncmp(cmdline, "ncst ", 5) == 0) {
  28520c:	83 ec 04             	sub    $0x4,%esp
  28520f:	6a 05                	push   $0x5
  285211:	68 8a 13 31 00       	push   $0x31138a
  285216:	ff 75 08             	pushl  0x8(%ebp)
  285219:	e8 e3 35 00 00       	call   288801 <strncmp>
  28521e:	83 c4 10             	add    $0x10,%esp
  285221:	85 c0                	test   %eax,%eax
  285223:	75 16                	jne    28523b <cons_runcmd+0x134>
		cmd_ncst(cons, cmdline, memtotal);
  285225:	83 ec 04             	sub    $0x4,%esp
  285228:	ff 75 14             	pushl  0x14(%ebp)
  28522b:	ff 75 08             	pushl  0x8(%ebp)
  28522e:	ff 75 0c             	pushl  0xc(%ebp)
  285231:	e8 1d 04 00 00       	call   285653 <cmd_ncst>
  285236:	83 c4 10             	add    $0x10,%esp
	return;
  285239:	eb 62                	jmp    28529d <cons_runcmd+0x196>
	} else if (strncmp(cmdline, "langmode ", 9) == 0) {
  28523b:	83 ec 04             	sub    $0x4,%esp
  28523e:	6a 09                	push   $0x9
  285240:	68 90 13 31 00       	push   $0x311390
  285245:	ff 75 08             	pushl  0x8(%ebp)
  285248:	e8 b4 35 00 00       	call   288801 <strncmp>
  28524d:	83 c4 10             	add    $0x10,%esp
  285250:	85 c0                	test   %eax,%eax
  285252:	75 13                	jne    285267 <cons_runcmd+0x160>
		cmd_langmode(cons, cmdline);
  285254:	83 ec 08             	sub    $0x8,%esp
  285257:	ff 75 08             	pushl  0x8(%ebp)
  28525a:	ff 75 0c             	pushl  0xc(%ebp)
  28525d:	e8 7a 04 00 00       	call   2856dc <cmd_langmode>
  285262:	83 c4 10             	add    $0x10,%esp
	return;
  285265:	eb 36                	jmp    28529d <cons_runcmd+0x196>
	} else if (cmdline[0] != 0) {
  285267:	8b 45 08             	mov    0x8(%ebp),%eax
  28526a:	0f b6 00             	movzbl (%eax),%eax
  28526d:	84 c0                	test   %al,%al
  28526f:	74 2c                	je     28529d <cons_runcmd+0x196>
		if (cmd_app(cons, fat, cmdline) == 0) {
  285271:	83 ec 04             	sub    $0x4,%esp
  285274:	ff 75 08             	pushl  0x8(%ebp)
  285277:	ff 75 10             	pushl  0x10(%ebp)
  28527a:	ff 75 0c             	pushl  0xc(%ebp)
  28527d:	e8 b4 04 00 00       	call   285736 <cmd_app>
  285282:	83 c4 10             	add    $0x10,%esp
  285285:	85 c0                	test   %eax,%eax
  285287:	75 14                	jne    28529d <cons_runcmd+0x196>
			cons_putstr0(cons, "Bad command.\n\n");
  285289:	83 ec 08             	sub    $0x8,%esp
  28528c:	68 9a 13 31 00       	push   $0x31139a
  285291:	ff 75 0c             	pushl  0xc(%ebp)
  285294:	e8 f6 fd ff ff       	call   28508f <cons_putstr0>
  285299:	83 c4 10             	add    $0x10,%esp
	return;
  28529c:	90                   	nop
  28529d:	90                   	nop
}
  28529e:	c9                   	leave  
  28529f:	c3                   	ret    

002852a0 <cmd_mem>:

void cmd_mem(struct CONSOLE *cons, int memtotal)
{
  2852a0:	f3 0f 1e fb          	endbr32 
  2852a4:	55                   	push   %ebp
  2852a5:	89 e5                	mov    %esp,%ebp
  2852a7:	83 ec 48             	sub    $0x48,%esp
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  2852aa:	c7 45 f4 00 00 3c 00 	movl   $0x3c0000,-0xc(%ebp)
	char s[60];
	sprintf(s, "total   %dMB\nfree %dKB\n\n", memtotal / (1024 * 1024), memman_total(memman) / 1024);
  2852b1:	83 ec 0c             	sub    $0xc,%esp
  2852b4:	ff 75 f4             	pushl  -0xc(%ebp)
  2852b7:	e8 ba d2 ff ff       	call   282576 <memman_total>
  2852bc:	83 c4 10             	add    $0x10,%esp
  2852bf:	c1 e8 0a             	shr    $0xa,%eax
  2852c2:	89 c2                	mov    %eax,%edx
  2852c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  2852c7:	8d 88 ff ff 0f 00    	lea    0xfffff(%eax),%ecx
  2852cd:	85 c0                	test   %eax,%eax
  2852cf:	0f 48 c1             	cmovs  %ecx,%eax
  2852d2:	c1 f8 14             	sar    $0x14,%eax
  2852d5:	52                   	push   %edx
  2852d6:	50                   	push   %eax
  2852d7:	68 a9 13 31 00       	push   $0x3113a9
  2852dc:	8d 45 b8             	lea    -0x48(%ebp),%eax
  2852df:	50                   	push   %eax
  2852e0:	e8 94 34 00 00       	call   288779 <sprintf>
  2852e5:	83 c4 10             	add    $0x10,%esp
	cons_putstr0(cons, s);
  2852e8:	83 ec 08             	sub    $0x8,%esp
  2852eb:	8d 45 b8             	lea    -0x48(%ebp),%eax
  2852ee:	50                   	push   %eax
  2852ef:	ff 75 08             	pushl  0x8(%ebp)
  2852f2:	e8 98 fd ff ff       	call   28508f <cons_putstr0>
  2852f7:	83 c4 10             	add    $0x10,%esp
	return;
  2852fa:	90                   	nop
}
  2852fb:	c9                   	leave  
  2852fc:	c3                   	ret    

002852fd <cmd_cls>:

void cmd_cls(struct CONSOLE *cons)
{
  2852fd:	f3 0f 1e fb          	endbr32 
  285301:	55                   	push   %ebp
  285302:	89 e5                	mov    %esp,%ebp
  285304:	83 ec 18             	sub    $0x18,%esp
	int x, y;
	struct SHEET *sheet = cons->sht;
  285307:	8b 45 08             	mov    0x8(%ebp),%eax
  28530a:	8b 00                	mov    (%eax),%eax
  28530c:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for (y = 28; y < 28 + 128; y++) {
  28530f:	c7 45 f0 1c 00 00 00 	movl   $0x1c,-0x10(%ebp)
  285316:	eb 35                	jmp    28534d <cmd_cls+0x50>
		for (x = 8; x < 8 + 240; x++) {
  285318:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
  28531f:	eb 1f                	jmp    285340 <cmd_cls+0x43>
			sheet->buf[x + y * sheet->bxsize] = COL8_000000;
  285321:	8b 45 ec             	mov    -0x14(%ebp),%eax
  285324:	8b 10                	mov    (%eax),%edx
  285326:	8b 45 ec             	mov    -0x14(%ebp),%eax
  285329:	8b 40 04             	mov    0x4(%eax),%eax
  28532c:	0f af 45 f0          	imul   -0x10(%ebp),%eax
  285330:	89 c1                	mov    %eax,%ecx
  285332:	8b 45 f4             	mov    -0xc(%ebp),%eax
  285335:	01 c8                	add    %ecx,%eax
  285337:	01 d0                	add    %edx,%eax
  285339:	c6 00 00             	movb   $0x0,(%eax)
		for (x = 8; x < 8 + 240; x++) {
  28533c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  285340:	81 7d f4 f7 00 00 00 	cmpl   $0xf7,-0xc(%ebp)
  285347:	7e d8                	jle    285321 <cmd_cls+0x24>
	for (y = 28; y < 28 + 128; y++) {
  285349:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  28534d:	81 7d f0 9b 00 00 00 	cmpl   $0x9b,-0x10(%ebp)
  285354:	7e c2                	jle    285318 <cmd_cls+0x1b>
		}
	}
	sheet_refresh(sheet, 8, 28, 8 + 240, 28 + 128);
  285356:	83 ec 0c             	sub    $0xc,%esp
  285359:	68 9c 00 00 00       	push   $0x9c
  28535e:	68 f8 00 00 00       	push   $0xf8
  285363:	6a 1c                	push   $0x1c
  285365:	6a 08                	push   $0x8
  285367:	ff 75 ec             	pushl  -0x14(%ebp)
  28536a:	e8 98 e3 ff ff       	call   283707 <sheet_refresh>
  28536f:	83 c4 20             	add    $0x20,%esp
	cons->cur_y = 28;
  285372:	8b 45 08             	mov    0x8(%ebp),%eax
  285375:	c7 40 08 1c 00 00 00 	movl   $0x1c,0x8(%eax)
	return;
  28537c:	90                   	nop
}
  28537d:	c9                   	leave  
  28537e:	c3                   	ret    

0028537f <cmd_dir>:

void cmd_dir(struct CONSOLE *cons)
{
  28537f:	f3 0f 1e fb          	endbr32 
  285383:	55                   	push   %ebp
  285384:	89 e5                	mov    %esp,%ebp
  285386:	83 ec 38             	sub    $0x38,%esp
	struct FILEINFO *finfo = (struct FILEINFO *) (ADR_DISKIMG + 0x002600);
  285389:	c7 45 ec 00 26 10 00 	movl   $0x102600,-0x14(%ebp)
	int i, j;
	char s[30];
	for (i = 0; i < 224; i++) {
  285390:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  285397:	e9 fa 00 00 00       	jmp    285496 <cmd_dir+0x117>
		if (finfo[i].name[0] == 0x00) {
  28539c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28539f:	c1 e0 05             	shl    $0x5,%eax
  2853a2:	89 c2                	mov    %eax,%edx
  2853a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2853a7:	01 d0                	add    %edx,%eax
  2853a9:	0f b6 00             	movzbl (%eax),%eax
  2853ac:	84 c0                	test   %al,%al
  2853ae:	0f 84 f1 00 00 00    	je     2854a5 <cmd_dir+0x126>
			break;
		}
		if (finfo[i].name[0] != 0xe5) {
  2853b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2853b7:	c1 e0 05             	shl    $0x5,%eax
  2853ba:	89 c2                	mov    %eax,%edx
  2853bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2853bf:	01 d0                	add    %edx,%eax
  2853c1:	0f b6 00             	movzbl (%eax),%eax
  2853c4:	3c e5                	cmp    $0xe5,%al
  2853c6:	0f 84 c6 00 00 00    	je     285492 <cmd_dir+0x113>
			if ((finfo[i].type & 0x18) == 0) {
  2853cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2853cf:	c1 e0 05             	shl    $0x5,%eax
  2853d2:	89 c2                	mov    %eax,%edx
  2853d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2853d7:	01 d0                	add    %edx,%eax
  2853d9:	0f b6 40 0b          	movzbl 0xb(%eax),%eax
  2853dd:	0f b6 c0             	movzbl %al,%eax
  2853e0:	83 e0 18             	and    $0x18,%eax
  2853e3:	85 c0                	test   %eax,%eax
  2853e5:	0f 85 a7 00 00 00    	jne    285492 <cmd_dir+0x113>
				sprintf(s, "filename.ext   %7d\n", finfo[i].size);
  2853eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2853ee:	c1 e0 05             	shl    $0x5,%eax
  2853f1:	89 c2                	mov    %eax,%edx
  2853f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2853f6:	01 d0                	add    %edx,%eax
  2853f8:	8b 40 1c             	mov    0x1c(%eax),%eax
  2853fb:	83 ec 04             	sub    $0x4,%esp
  2853fe:	50                   	push   %eax
  2853ff:	68 c2 13 31 00       	push   $0x3113c2
  285404:	8d 45 ce             	lea    -0x32(%ebp),%eax
  285407:	50                   	push   %eax
  285408:	e8 6c 33 00 00       	call   288779 <sprintf>
  28540d:	83 c4 10             	add    $0x10,%esp
				for (j = 0; j < 8; j++) {
  285410:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  285417:	eb 25                	jmp    28543e <cmd_dir+0xbf>
					s[j] = finfo[i].name[j];
  285419:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28541c:	c1 e0 05             	shl    $0x5,%eax
  28541f:	89 c2                	mov    %eax,%edx
  285421:	8b 45 ec             	mov    -0x14(%ebp),%eax
  285424:	01 c2                	add    %eax,%edx
  285426:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285429:	01 d0                	add    %edx,%eax
  28542b:	0f b6 00             	movzbl (%eax),%eax
  28542e:	89 c1                	mov    %eax,%ecx
  285430:	8d 55 ce             	lea    -0x32(%ebp),%edx
  285433:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285436:	01 d0                	add    %edx,%eax
  285438:	88 08                	mov    %cl,(%eax)
				for (j = 0; j < 8; j++) {
  28543a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  28543e:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
  285442:	7e d5                	jle    285419 <cmd_dir+0x9a>
				}
				s[ 9] = finfo[i].ext[0];
  285444:	8b 45 f4             	mov    -0xc(%ebp),%eax
  285447:	c1 e0 05             	shl    $0x5,%eax
  28544a:	89 c2                	mov    %eax,%edx
  28544c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  28544f:	01 d0                	add    %edx,%eax
  285451:	0f b6 40 08          	movzbl 0x8(%eax),%eax
  285455:	88 45 d7             	mov    %al,-0x29(%ebp)
				s[10] = finfo[i].ext[1];
  285458:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28545b:	c1 e0 05             	shl    $0x5,%eax
  28545e:	89 c2                	mov    %eax,%edx
  285460:	8b 45 ec             	mov    -0x14(%ebp),%eax
  285463:	01 d0                	add    %edx,%eax
  285465:	0f b6 40 09          	movzbl 0x9(%eax),%eax
  285469:	88 45 d8             	mov    %al,-0x28(%ebp)
				s[11] = finfo[i].ext[2];
  28546c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28546f:	c1 e0 05             	shl    $0x5,%eax
  285472:	89 c2                	mov    %eax,%edx
  285474:	8b 45 ec             	mov    -0x14(%ebp),%eax
  285477:	01 d0                	add    %edx,%eax
  285479:	0f b6 40 0a          	movzbl 0xa(%eax),%eax
  28547d:	88 45 d9             	mov    %al,-0x27(%ebp)
				cons_putstr0(cons, s);
  285480:	83 ec 08             	sub    $0x8,%esp
  285483:	8d 45 ce             	lea    -0x32(%ebp),%eax
  285486:	50                   	push   %eax
  285487:	ff 75 08             	pushl  0x8(%ebp)
  28548a:	e8 00 fc ff ff       	call   28508f <cons_putstr0>
  28548f:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < 224; i++) {
  285492:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  285496:	81 7d f4 df 00 00 00 	cmpl   $0xdf,-0xc(%ebp)
  28549d:	0f 8e f9 fe ff ff    	jle    28539c <cmd_dir+0x1d>
  2854a3:	eb 01                	jmp    2854a6 <cmd_dir+0x127>
			break;
  2854a5:	90                   	nop
			}
		}
	}
	cons_newline(cons);
  2854a6:	83 ec 0c             	sub    $0xc,%esp
  2854a9:	ff 75 08             	pushl  0x8(%ebp)
  2854ac:	e8 99 fa ff ff       	call   284f4a <cons_newline>
  2854b1:	83 c4 10             	add    $0x10,%esp
	return;
  2854b4:	90                   	nop
}
  2854b5:	c9                   	leave  
  2854b6:	c3                   	ret    

002854b7 <cmd_exit>:

void cmd_exit(struct CONSOLE *cons, int *fat)
{
  2854b7:	f3 0f 1e fb          	endbr32 
  2854bb:	55                   	push   %ebp
  2854bc:	89 e5                	mov    %esp,%ebp
  2854be:	83 ec 18             	sub    $0x18,%esp
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  2854c1:	c7 45 f4 00 00 3c 00 	movl   $0x3c0000,-0xc(%ebp)
	struct TASK *task = task_now();
  2854c8:	e8 da e7 ff ff       	call   283ca7 <task_now>
  2854cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
	struct SHTCTL *shtctl = (struct SHTCTL *) *((int *) 0x0fe4);
  2854d0:	b8 e4 0f 00 00       	mov    $0xfe4,%eax
  2854d5:	8b 00                	mov    (%eax),%eax
  2854d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
	struct FIFO32 *fifo = (struct FIFO32 *) *((int *) 0x0fec);
  2854da:	b8 ec 0f 00 00       	mov    $0xfec,%eax
  2854df:	8b 00                	mov    (%eax),%eax
  2854e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
	if (cons->sht != 0) {
  2854e4:	8b 45 08             	mov    0x8(%ebp),%eax
  2854e7:	8b 00                	mov    (%eax),%eax
  2854e9:	85 c0                	test   %eax,%eax
  2854eb:	74 12                	je     2854ff <cmd_exit+0x48>
		timer_cancel(cons->timer);
  2854ed:	8b 45 08             	mov    0x8(%ebp),%eax
  2854f0:	8b 40 10             	mov    0x10(%eax),%eax
  2854f3:	83 ec 0c             	sub    $0xc,%esp
  2854f6:	50                   	push   %eax
  2854f7:	e8 77 e6 ff ff       	call   283b73 <timer_cancel>
  2854fc:	83 c4 10             	add    $0x10,%esp
	}
	memman_free_4k(memman, (int) fat, 4 * 2880);
  2854ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  285502:	83 ec 04             	sub    $0x4,%esp
  285505:	68 00 2d 00 00       	push   $0x2d00
  28550a:	50                   	push   %eax
  28550b:	ff 75 f4             	pushl  -0xc(%ebp)
  28550e:	e8 11 d4 ff ff       	call   282924 <memman_free_4k>
  285513:	83 c4 10             	add    $0x10,%esp
	io_cli();
  285516:	e8 37 bc ff ff       	call   281152 <io_cli>
	if (cons->sht != 0) {
  28551b:	8b 45 08             	mov    0x8(%ebp),%eax
  28551e:	8b 00                	mov    (%eax),%eax
  285520:	85 c0                	test   %eax,%eax
  285522:	74 2f                	je     285553 <cmd_exit+0x9c>
		fifo32_put(fifo, cons->sht - shtctl->sheets0 + 768);	/* 768ÔøΩ`1023 */
  285524:	8b 45 08             	mov    0x8(%ebp),%eax
  285527:	8b 00                	mov    (%eax),%eax
  285529:	8b 55 ec             	mov    -0x14(%ebp),%edx
  28552c:	81 c2 14 04 00 00    	add    $0x414,%edx
  285532:	29 d0                	sub    %edx,%eax
  285534:	c1 f8 03             	sar    $0x3,%eax
  285537:	69 c0 cd cc cc cc    	imul   $0xcccccccd,%eax,%eax
  28553d:	05 00 03 00 00       	add    $0x300,%eax
  285542:	83 ec 08             	sub    $0x8,%esp
  285545:	50                   	push   %eax
  285546:	ff 75 e8             	pushl  -0x18(%ebp)
  285549:	e8 5d cb ff ff       	call   2820ab <fifo32_put>
  28554e:	83 c4 10             	add    $0x10,%esp
  285551:	eb 2d                	jmp    285580 <cmd_exit+0xc9>
	} else {
		fifo32_put(fifo, task - taskctl->tasks0 + 1024);	/* 1024ÔøΩ`2023 */
  285553:	a1 dc 96 32 00       	mov    0x3296dc,%eax
  285558:	8d 90 f8 0f 00 00    	lea    0xff8(%eax),%edx
  28555e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285561:	29 d0                	sub    %edx,%eax
  285563:	c1 f8 06             	sar    $0x6,%eax
  285566:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  28556c:	05 00 04 00 00       	add    $0x400,%eax
  285571:	83 ec 08             	sub    $0x8,%esp
  285574:	50                   	push   %eax
  285575:	ff 75 e8             	pushl  -0x18(%ebp)
  285578:	e8 2e cb ff ff       	call   2820ab <fifo32_put>
  28557d:	83 c4 10             	add    $0x10,%esp
	}
	io_sti();
  285580:	e8 cf bb ff ff       	call   281154 <io_sti>
	for (;;) {
		task_sleep(task);
  285585:	83 ec 0c             	sub    $0xc,%esp
  285588:	ff 75 f0             	pushl  -0x10(%ebp)
  28558b:	e8 c5 ec ff ff       	call   284255 <task_sleep>
  285590:	83 c4 10             	add    $0x10,%esp
  285593:	eb f0                	jmp    285585 <cmd_exit+0xce>

00285595 <cmd_start>:
	}
}

void cmd_start(struct CONSOLE *cons, char *cmdline, int memtotal)
{
  285595:	f3 0f 1e fb          	endbr32 
  285599:	55                   	push   %ebp
  28559a:	89 e5                	mov    %esp,%ebp
  28559c:	83 ec 18             	sub    $0x18,%esp
	struct SHTCTL *shtctl = (struct SHTCTL *) *((int *) 0x0fe4);
  28559f:	b8 e4 0f 00 00       	mov    $0xfe4,%eax
  2855a4:	8b 00                	mov    (%eax),%eax
  2855a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
	struct SHEET *sht = open_console(shtctl, memtotal);
  2855a9:	8b 45 10             	mov    0x10(%ebp),%eax
  2855ac:	83 ec 08             	sub    $0x8,%esp
  2855af:	50                   	push   %eax
  2855b0:	ff 75 f0             	pushl  -0x10(%ebp)
  2855b3:	e8 15 ba ff ff       	call   280fcd <open_console>
  2855b8:	83 c4 10             	add    $0x10,%esp
  2855bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
	struct FIFO32 *fifo = &sht->task->fifo;
  2855be:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2855c1:	8b 40 24             	mov    0x24(%eax),%eax
  2855c4:	83 c0 10             	add    $0x10,%eax
  2855c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int i;
	sheet_slide(sht, 32, 4);
  2855ca:	83 ec 04             	sub    $0x4,%esp
  2855cd:	6a 04                	push   $0x4
  2855cf:	6a 20                	push   $0x20
  2855d1:	ff 75 ec             	pushl  -0x14(%ebp)
  2855d4:	e8 a3 e1 ff ff       	call   28377c <sheet_slide>
  2855d9:	83 c4 10             	add    $0x10,%esp
	sheet_updown(sht, shtctl->top);
  2855dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2855df:	8b 40 10             	mov    0x10(%eax),%eax
  2855e2:	83 ec 08             	sub    $0x8,%esp
  2855e5:	50                   	push   %eax
  2855e6:	ff 75 ec             	pushl  -0x14(%ebp)
  2855e9:	e8 9e dd ff ff       	call   28338c <sheet_updown>
  2855ee:	83 c4 10             	add    $0x10,%esp
	/* ÔøΩRÔøΩ}ÔøΩÔøΩÔøΩhÔøΩÔøΩÔøΩCÔøΩÔøΩÔøΩ…ìÔøΩÔøΩÕÇÔøΩÔøΩÍÇΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩAÔøΩÍï∂ÔøΩÔøΩÔøΩÔøΩÔøΩ¬êVÔøΩÔøΩÔøΩÔøΩÔøΩRÔøΩÔøΩÔøΩ\ÔøΩ[ÔøΩÔøΩÔøΩ…ìÔøΩÔøΩÔøΩ */
	for (i = 6; cmdline[i] != 0; i++) {
  2855f1:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
  2855f8:	eb 26                	jmp    285620 <cmd_start+0x8b>
		fifo32_put(fifo, cmdline[i] + 256);
  2855fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2855fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  285600:	01 d0                	add    %edx,%eax
  285602:	0f b6 00             	movzbl (%eax),%eax
  285605:	0f be c0             	movsbl %al,%eax
  285608:	05 00 01 00 00       	add    $0x100,%eax
  28560d:	83 ec 08             	sub    $0x8,%esp
  285610:	50                   	push   %eax
  285611:	ff 75 e8             	pushl  -0x18(%ebp)
  285614:	e8 92 ca ff ff       	call   2820ab <fifo32_put>
  285619:	83 c4 10             	add    $0x10,%esp
	for (i = 6; cmdline[i] != 0; i++) {
  28561c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  285620:	8b 55 f4             	mov    -0xc(%ebp),%edx
  285623:	8b 45 0c             	mov    0xc(%ebp),%eax
  285626:	01 d0                	add    %edx,%eax
  285628:	0f b6 00             	movzbl (%eax),%eax
  28562b:	84 c0                	test   %al,%al
  28562d:	75 cb                	jne    2855fa <cmd_start+0x65>
	}
	fifo32_put(fifo, 10 + 256);	/* Enter */
  28562f:	83 ec 08             	sub    $0x8,%esp
  285632:	68 0a 01 00 00       	push   $0x10a
  285637:	ff 75 e8             	pushl  -0x18(%ebp)
  28563a:	e8 6c ca ff ff       	call   2820ab <fifo32_put>
  28563f:	83 c4 10             	add    $0x10,%esp
	cons_newline(cons);
  285642:	83 ec 0c             	sub    $0xc,%esp
  285645:	ff 75 08             	pushl  0x8(%ebp)
  285648:	e8 fd f8 ff ff       	call   284f4a <cons_newline>
  28564d:	83 c4 10             	add    $0x10,%esp
	return;
  285650:	90                   	nop
}
  285651:	c9                   	leave  
  285652:	c3                   	ret    

00285653 <cmd_ncst>:

void cmd_ncst(struct CONSOLE *cons, char *cmdline, int memtotal)
{
  285653:	f3 0f 1e fb          	endbr32 
  285657:	55                   	push   %ebp
  285658:	89 e5                	mov    %esp,%ebp
  28565a:	83 ec 18             	sub    $0x18,%esp
	struct TASK *task = open_constask(0, memtotal);
  28565d:	8b 45 10             	mov    0x10(%ebp),%eax
  285660:	83 ec 08             	sub    $0x8,%esp
  285663:	50                   	push   %eax
  285664:	6a 00                	push   $0x0
  285666:	e8 5f b8 ff ff       	call   280eca <open_constask>
  28566b:	83 c4 10             	add    $0x10,%esp
  28566e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	struct FIFO32 *fifo = &task->fifo;
  285671:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285674:	83 c0 10             	add    $0x10,%eax
  285677:	89 45 ec             	mov    %eax,-0x14(%ebp)
	int i;
	/* ÔøΩRÔøΩ}ÔøΩÔøΩÔøΩhÔøΩÔøΩÔøΩCÔøΩÔøΩÔøΩ…ìÔøΩÔøΩÕÇÔøΩÔøΩÍÇΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩAÔøΩÍï∂ÔøΩÔøΩÔøΩÔøΩÔøΩ¬êVÔøΩÔøΩÔøΩÔøΩÔøΩRÔøΩÔøΩÔøΩ\ÔøΩ[ÔøΩÔøΩÔøΩ…ìÔøΩÔøΩÔøΩ */
	for (i = 5; cmdline[i] != 0; i++) {
  28567a:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
  285681:	eb 26                	jmp    2856a9 <cmd_ncst+0x56>
		fifo32_put(fifo, cmdline[i] + 256);
  285683:	8b 55 f4             	mov    -0xc(%ebp),%edx
  285686:	8b 45 0c             	mov    0xc(%ebp),%eax
  285689:	01 d0                	add    %edx,%eax
  28568b:	0f b6 00             	movzbl (%eax),%eax
  28568e:	0f be c0             	movsbl %al,%eax
  285691:	05 00 01 00 00       	add    $0x100,%eax
  285696:	83 ec 08             	sub    $0x8,%esp
  285699:	50                   	push   %eax
  28569a:	ff 75 ec             	pushl  -0x14(%ebp)
  28569d:	e8 09 ca ff ff       	call   2820ab <fifo32_put>
  2856a2:	83 c4 10             	add    $0x10,%esp
	for (i = 5; cmdline[i] != 0; i++) {
  2856a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  2856a9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2856ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  2856af:	01 d0                	add    %edx,%eax
  2856b1:	0f b6 00             	movzbl (%eax),%eax
  2856b4:	84 c0                	test   %al,%al
  2856b6:	75 cb                	jne    285683 <cmd_ncst+0x30>
	}
	fifo32_put(fifo, 10 + 256);	/* Enter */
  2856b8:	83 ec 08             	sub    $0x8,%esp
  2856bb:	68 0a 01 00 00       	push   $0x10a
  2856c0:	ff 75 ec             	pushl  -0x14(%ebp)
  2856c3:	e8 e3 c9 ff ff       	call   2820ab <fifo32_put>
  2856c8:	83 c4 10             	add    $0x10,%esp
	cons_newline(cons);
  2856cb:	83 ec 0c             	sub    $0xc,%esp
  2856ce:	ff 75 08             	pushl  0x8(%ebp)
  2856d1:	e8 74 f8 ff ff       	call   284f4a <cons_newline>
  2856d6:	83 c4 10             	add    $0x10,%esp
	return;
  2856d9:	90                   	nop
}
  2856da:	c9                   	leave  
  2856db:	c3                   	ret    

002856dc <cmd_langmode>:

void cmd_langmode(struct CONSOLE *cons, char *cmdline)
{
  2856dc:	f3 0f 1e fb          	endbr32 
  2856e0:	55                   	push   %ebp
  2856e1:	89 e5                	mov    %esp,%ebp
  2856e3:	83 ec 18             	sub    $0x18,%esp
	struct TASK *task = task_now();
  2856e6:	e8 bc e5 ff ff       	call   283ca7 <task_now>
  2856eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	unsigned char mode = cmdline[9] - '0';
  2856ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  2856f1:	83 c0 09             	add    $0x9,%eax
  2856f4:	0f b6 00             	movzbl (%eax),%eax
  2856f7:	83 e8 30             	sub    $0x30,%eax
  2856fa:	88 45 f3             	mov    %al,-0xd(%ebp)
	if (mode <= 2) {
  2856fd:	80 7d f3 02          	cmpb   $0x2,-0xd(%ebp)
  285701:	77 0f                	ja     285712 <cmd_langmode+0x36>
		task->langmode = mode;
  285703:	8b 45 f4             	mov    -0xc(%ebp),%eax
  285706:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
  28570a:	88 90 bc 00 00 00    	mov    %dl,0xbc(%eax)
  285710:	eb 13                	jmp    285725 <cmd_langmode+0x49>
	} else {
		cons_putstr0(cons, "mode number error.\n");
  285712:	83 ec 08             	sub    $0x8,%esp
  285715:	68 d6 13 31 00       	push   $0x3113d6
  28571a:	ff 75 08             	pushl  0x8(%ebp)
  28571d:	e8 6d f9 ff ff       	call   28508f <cons_putstr0>
  285722:	83 c4 10             	add    $0x10,%esp
	}
	cons_newline(cons);
  285725:	83 ec 0c             	sub    $0xc,%esp
  285728:	ff 75 08             	pushl  0x8(%ebp)
  28572b:	e8 1a f8 ff ff       	call   284f4a <cons_newline>
  285730:	83 c4 10             	add    $0x10,%esp
	return;
  285733:	90                   	nop
}
  285734:	c9                   	leave  
  285735:	c3                   	ret    

00285736 <cmd_app>:

int cmd_app(struct CONSOLE *cons, int *fat, char *cmdline)
{
  285736:	f3 0f 1e fb          	endbr32 
  28573a:	55                   	push   %ebp
  28573b:	89 e5                	mov    %esp,%ebp
  28573d:	53                   	push   %ebx
  28573e:	83 ec 54             	sub    $0x54,%esp
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  285741:	c7 45 ec 00 00 3c 00 	movl   $0x3c0000,-0x14(%ebp)
	struct FILEINFO *finfo;
	char name[18], *p, *q;
	struct TASK *task = task_now();
  285748:	e8 5a e5 ff ff       	call   283ca7 <task_now>
  28574d:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int i, segsiz, datsiz, esp, dathrb, appsiz;
	struct SHTCTL *shtctl;
	struct SHEET *sht;

	/* ÔøΩRÔøΩ}ÔøΩÔøΩÔøΩhÔøΩÔøΩÔøΩCÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩtÔøΩ@ÔøΩCÔøΩÔøΩÔøΩÔøΩÔøΩê∂êÔøΩ */
	for (i = 0; i < 13; i++) {
  285750:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  285757:	eb 28                	jmp    285781 <cmd_app+0x4b>
		if (cmdline[i] <= ' ') {
  285759:	8b 55 f0             	mov    -0x10(%ebp),%edx
  28575c:	8b 45 10             	mov    0x10(%ebp),%eax
  28575f:	01 d0                	add    %edx,%eax
  285761:	0f b6 00             	movzbl (%eax),%eax
  285764:	3c 20                	cmp    $0x20,%al
  285766:	7e 21                	jle    285789 <cmd_app+0x53>
			break;
		}
		name[i] = cmdline[i];
  285768:	8b 55 f0             	mov    -0x10(%ebp),%edx
  28576b:	8b 45 10             	mov    0x10(%ebp),%eax
  28576e:	01 d0                	add    %edx,%eax
  285770:	0f b6 00             	movzbl (%eax),%eax
  285773:	8d 4d b6             	lea    -0x4a(%ebp),%ecx
  285776:	8b 55 f0             	mov    -0x10(%ebp),%edx
  285779:	01 ca                	add    %ecx,%edx
  28577b:	88 02                	mov    %al,(%edx)
	for (i = 0; i < 13; i++) {
  28577d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  285781:	83 7d f0 0c          	cmpl   $0xc,-0x10(%ebp)
  285785:	7e d2                	jle    285759 <cmd_app+0x23>
  285787:	eb 01                	jmp    28578a <cmd_app+0x54>
			break;
  285789:	90                   	nop
	}
	name[i] = 0; /* ÔøΩ∆ÇËÇ†ÔøΩÔøΩÔøΩÔøΩÔøΩtÔøΩ@ÔøΩCÔøΩÔøΩÔøΩÔøΩÔøΩÃåÔøΩÔøΩÔøΩ0ÔøΩ…ÇÔøΩÔøΩÔøΩ */
  28578a:	8d 55 b6             	lea    -0x4a(%ebp),%edx
  28578d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285790:	01 d0                	add    %edx,%eax
  285792:	c6 00 00             	movb   $0x0,(%eax)

	/* ÔøΩtÔøΩ@ÔøΩCÔøΩÔøΩÔøΩÔøΩTÔøΩÔøΩ */
	finfo = file_search(name, (struct FILEINFO *) (ADR_DISKIMG + 0x002600), 224);
  285795:	83 ec 04             	sub    $0x4,%esp
  285798:	68 e0 00 00 00       	push   $0xe0
  28579d:	68 00 26 10 00       	push   $0x102600
  2857a2:	8d 45 b6             	lea    -0x4a(%ebp),%eax
  2857a5:	50                   	push   %eax
  2857a6:	e8 af 10 00 00       	call   28685a <file_search>
  2857ab:	83 c4 10             	add    $0x10,%esp
  2857ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (finfo == 0 && name[i - 1] != '.') {
  2857b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  2857b5:	75 62                	jne    285819 <cmd_app+0xe3>
  2857b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2857ba:	83 e8 01             	sub    $0x1,%eax
  2857bd:	0f b6 44 05 b6       	movzbl -0x4a(%ebp,%eax,1),%eax
  2857c2:	3c 2e                	cmp    $0x2e,%al
  2857c4:	74 53                	je     285819 <cmd_app+0xe3>
		/* ÔøΩÔøΩÔøΩ¬ÇÔøΩÔøΩÔøΩ»ÇÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÃÇ≈åÔøΩÔøΩÔøΩ".HRB"ÔøΩÔøΩÔøΩ¬ÇÔøΩÔøΩƒÇÔøΩÔøΩÔøΩÔøΩÔøΩxÔøΩTÔøΩÔøΩÔøΩƒÇ›ÇÔøΩ */
		name[i    ] = '.';
  2857c6:	8d 55 b6             	lea    -0x4a(%ebp),%edx
  2857c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2857cc:	01 d0                	add    %edx,%eax
  2857ce:	c6 00 2e             	movb   $0x2e,(%eax)
		name[i + 1] = 'H';
  2857d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2857d4:	83 c0 01             	add    $0x1,%eax
  2857d7:	c6 44 05 b6 48       	movb   $0x48,-0x4a(%ebp,%eax,1)
		name[i + 2] = 'R';
  2857dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2857df:	83 c0 02             	add    $0x2,%eax
  2857e2:	c6 44 05 b6 52       	movb   $0x52,-0x4a(%ebp,%eax,1)
		name[i + 3] = 'B';
  2857e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2857ea:	83 c0 03             	add    $0x3,%eax
  2857ed:	c6 44 05 b6 42       	movb   $0x42,-0x4a(%ebp,%eax,1)
		name[i + 4] = 0;
  2857f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2857f5:	83 c0 04             	add    $0x4,%eax
  2857f8:	c6 44 05 b6 00       	movb   $0x0,-0x4a(%ebp,%eax,1)
		finfo = file_search(name, (struct FILEINFO *) (ADR_DISKIMG + 0x002600), 224);
  2857fd:	83 ec 04             	sub    $0x4,%esp
  285800:	68 e0 00 00 00       	push   $0xe0
  285805:	68 00 26 10 00       	push   $0x102600
  28580a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
  28580d:	50                   	push   %eax
  28580e:	e8 47 10 00 00       	call   28685a <file_search>
  285813:	83 c4 10             	add    $0x10,%esp
  285816:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}

	if (finfo != 0) {
  285819:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  28581d:	0f 84 b8 02 00 00    	je     285adb <cmd_app+0x3a5>
		/* ÔøΩtÔøΩ@ÔøΩCÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ¬ÇÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÍçá */
		appsiz = finfo->size;
  285823:	8b 45 f4             	mov    -0xc(%ebp),%eax
  285826:	8b 40 1c             	mov    0x1c(%eax),%eax
  285829:	89 45 b0             	mov    %eax,-0x50(%ebp)
		p = file_loadfile2(finfo->clustno, &appsiz, fat);
  28582c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28582f:	0f b7 40 1a          	movzwl 0x1a(%eax),%eax
  285833:	0f b7 c0             	movzwl %ax,%eax
  285836:	83 ec 04             	sub    $0x4,%esp
  285839:	ff 75 0c             	pushl  0xc(%ebp)
  28583c:	8d 55 b0             	lea    -0x50(%ebp),%edx
  28583f:	52                   	push   %edx
  285840:	50                   	push   %eax
  285841:	e8 7d 11 00 00       	call   2869c3 <file_loadfile2>
  285846:	83 c4 10             	add    $0x10,%esp
  285849:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		if (appsiz >= 36 && strncmp(p + 4, "Hari", 4) == 0 && *p == 0x00) {
  28584c:	8b 45 b0             	mov    -0x50(%ebp),%eax
  28584f:	83 f8 23             	cmp    $0x23,%eax
  285852:	0f 8e 43 02 00 00    	jle    285a9b <cmd_app+0x365>
  285858:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  28585b:	83 c0 04             	add    $0x4,%eax
  28585e:	83 ec 04             	sub    $0x4,%esp
  285861:	6a 04                	push   $0x4
  285863:	68 ea 13 31 00       	push   $0x3113ea
  285868:	50                   	push   %eax
  285869:	e8 93 2f 00 00       	call   288801 <strncmp>
  28586e:	83 c4 10             	add    $0x10,%esp
  285871:	85 c0                	test   %eax,%eax
  285873:	0f 85 22 02 00 00    	jne    285a9b <cmd_app+0x365>
  285879:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  28587c:	0f b6 00             	movzbl (%eax),%eax
  28587f:	84 c0                	test   %al,%al
  285881:	0f 85 14 02 00 00    	jne    285a9b <cmd_app+0x365>
			segsiz = *((int *) (p + 0x0000));
  285887:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  28588a:	8b 00                	mov    (%eax),%eax
  28588c:	89 45 e0             	mov    %eax,-0x20(%ebp)
			esp    = *((int *) (p + 0x000c));
  28588f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  285892:	8b 40 0c             	mov    0xc(%eax),%eax
  285895:	89 45 dc             	mov    %eax,-0x24(%ebp)
			datsiz = *((int *) (p + 0x0010));
  285898:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  28589b:	8b 40 10             	mov    0x10(%eax),%eax
  28589e:	89 45 d8             	mov    %eax,-0x28(%ebp)
			dathrb = *((int *) (p + 0x0014));
  2858a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2858a4:	8b 40 14             	mov    0x14(%eax),%eax
  2858a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
			q = (char *) memman_alloc_4k(memman, segsiz);
  2858aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2858ad:	83 ec 08             	sub    $0x8,%esp
  2858b0:	50                   	push   %eax
  2858b1:	ff 75 ec             	pushl  -0x14(%ebp)
  2858b4:	e8 3b d0 ff ff       	call   2828f4 <memman_alloc_4k>
  2858b9:	83 c4 10             	add    $0x10,%esp
  2858bc:	89 45 d0             	mov    %eax,-0x30(%ebp)
			task->ds_base = (int) q;
  2858bf:	8b 55 d0             	mov    -0x30(%ebp),%edx
  2858c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2858c5:	89 90 a8 00 00 00    	mov    %edx,0xa8(%eax)
			set_segmdesc(task->ldt + 0, appsiz - 1, (int) p, AR_CODE32_ER + 0x60);
  2858cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2858ce:	8b 55 b0             	mov    -0x50(%ebp),%edx
  2858d1:	83 ea 01             	sub    $0x1,%edx
  2858d4:	89 d1                	mov    %edx,%ecx
  2858d6:	8b 55 e8             	mov    -0x18(%ebp),%edx
  2858d9:	81 c2 94 00 00 00    	add    $0x94,%edx
  2858df:	68 fa 40 00 00       	push   $0x40fa
  2858e4:	50                   	push   %eax
  2858e5:	51                   	push   %ecx
  2858e6:	52                   	push   %edx
  2858e7:	e8 cd c5 ff ff       	call   281eb9 <set_segmdesc>
  2858ec:	83 c4 10             	add    $0x10,%esp
			set_segmdesc(task->ldt + 1, segsiz - 1, (int) q, AR_DATA32_RW + 0x60);
  2858ef:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2858f2:	8b 55 e0             	mov    -0x20(%ebp),%edx
  2858f5:	83 ea 01             	sub    $0x1,%edx
  2858f8:	89 d1                	mov    %edx,%ecx
  2858fa:	8b 55 e8             	mov    -0x18(%ebp),%edx
  2858fd:	81 c2 94 00 00 00    	add    $0x94,%edx
  285903:	83 c2 08             	add    $0x8,%edx
  285906:	68 f2 40 00 00       	push   $0x40f2
  28590b:	50                   	push   %eax
  28590c:	51                   	push   %ecx
  28590d:	52                   	push   %edx
  28590e:	e8 a6 c5 ff ff       	call   281eb9 <set_segmdesc>
  285913:	83 c4 10             	add    $0x10,%esp
			for (i = 0; i < datsiz; i++) {
  285916:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  28591d:	eb 27                	jmp    285946 <cmd_app+0x210>
				q[esp + i] = p[dathrb + i];
  28591f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  285922:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285925:	01 d0                	add    %edx,%eax
  285927:	89 c2                	mov    %eax,%edx
  285929:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  28592c:	01 d0                	add    %edx,%eax
  28592e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  285931:	8b 55 f0             	mov    -0x10(%ebp),%edx
  285934:	01 ca                	add    %ecx,%edx
  285936:	89 d1                	mov    %edx,%ecx
  285938:	8b 55 d0             	mov    -0x30(%ebp),%edx
  28593b:	01 ca                	add    %ecx,%edx
  28593d:	0f b6 00             	movzbl (%eax),%eax
  285940:	88 02                	mov    %al,(%edx)
			for (i = 0; i < datsiz; i++) {
  285942:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  285946:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285949:	3b 45 d8             	cmp    -0x28(%ebp),%eax
  28594c:	7c d1                	jl     28591f <cmd_app+0x1e9>
			}
			start_app(0x1b, 0 * 8 + 4, esp, 1 * 8 + 4, &(task->tss.esp0));
  28594e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  285951:	83 c0 30             	add    $0x30,%eax
  285954:	83 ec 0c             	sub    $0xc,%esp
  285957:	50                   	push   %eax
  285958:	6a 0c                	push   $0xc
  28595a:	ff 75 dc             	pushl  -0x24(%ebp)
  28595d:	6a 04                	push   $0x4
  28595f:	6a 1b                	push   $0x1b
  285961:	e8 68 b9 ff ff       	call   2812ce <start_app>
  285966:	83 c4 20             	add    $0x20,%esp
			shtctl = (struct SHTCTL *) *((int *) 0x0fe4);
  285969:	b8 e4 0f 00 00       	mov    $0xfe4,%eax
  28596e:	8b 00                	mov    (%eax),%eax
  285970:	89 45 cc             	mov    %eax,-0x34(%ebp)
			for (i = 0; i < MAX_SHEETS; i++) {
  285973:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  28597a:	eb 49                	jmp    2859c5 <cmd_app+0x28f>
				sht = &(shtctl->sheets0[i]);
  28597c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  28597f:	89 d0                	mov    %edx,%eax
  285981:	c1 e0 02             	shl    $0x2,%eax
  285984:	01 d0                	add    %edx,%eax
  285986:	c1 e0 03             	shl    $0x3,%eax
  285989:	8d 90 10 04 00 00    	lea    0x410(%eax),%edx
  28598f:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285992:	01 d0                	add    %edx,%eax
  285994:	83 c0 04             	add    $0x4,%eax
  285997:	89 45 c8             	mov    %eax,-0x38(%ebp)
				if ((sht->flags & 0x11) == 0x11 && sht->task == task) {
  28599a:	8b 45 c8             	mov    -0x38(%ebp),%eax
  28599d:	8b 40 1c             	mov    0x1c(%eax),%eax
  2859a0:	83 e0 11             	and    $0x11,%eax
  2859a3:	83 f8 11             	cmp    $0x11,%eax
  2859a6:	75 19                	jne    2859c1 <cmd_app+0x28b>
  2859a8:	8b 45 c8             	mov    -0x38(%ebp),%eax
  2859ab:	8b 40 24             	mov    0x24(%eax),%eax
  2859ae:	39 45 e8             	cmp    %eax,-0x18(%ebp)
  2859b1:	75 0e                	jne    2859c1 <cmd_app+0x28b>
					/* ÔøΩAÔøΩvÔøΩÔøΩÔøΩÔøΩÔøΩJÔøΩÔøΩÔøΩÔøΩÔøΩœÇ»ÇÔøΩÔøΩ…ÇÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩî≠åÔøΩ */
					sheet_free(sht);	/* ÔøΩ¬ÇÔøΩÔøΩÔøΩ */
  2859b3:	83 ec 0c             	sub    $0xc,%esp
  2859b6:	ff 75 c8             	pushl  -0x38(%ebp)
  2859b9:	e8 d5 de ff ff       	call   283893 <sheet_free>
  2859be:	83 c4 10             	add    $0x10,%esp
			for (i = 0; i < MAX_SHEETS; i++) {
  2859c1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  2859c5:	81 7d f0 ff 00 00 00 	cmpl   $0xff,-0x10(%ebp)
  2859cc:	7e ae                	jle    28597c <cmd_app+0x246>
				}
			}
			for (i = 0; i < 8; i++) {	/* ÔøΩNÔøΩÔøΩÔøΩ[ÔøΩYÔøΩÔøΩÔøΩƒÇ»ÇÔøΩÔøΩtÔøΩ@ÔøΩCÔøΩÔøΩÔøΩÔøΩÔøΩNÔøΩÔøΩÔøΩ[ÔøΩY */
  2859ce:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2859d5:	e9 83 00 00 00       	jmp    285a5d <cmd_app+0x327>
				if (task->fhandle[i].buf != 0) {
  2859da:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2859dd:	8b 88 b0 00 00 00    	mov    0xb0(%eax),%ecx
  2859e3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2859e6:	89 d0                	mov    %edx,%eax
  2859e8:	01 c0                	add    %eax,%eax
  2859ea:	01 d0                	add    %edx,%eax
  2859ec:	c1 e0 02             	shl    $0x2,%eax
  2859ef:	01 c8                	add    %ecx,%eax
  2859f1:	8b 00                	mov    (%eax),%eax
  2859f3:	85 c0                	test   %eax,%eax
  2859f5:	74 62                	je     285a59 <cmd_app+0x323>
					memman_free_4k(memman, (int) task->fhandle[i].buf, task->fhandle[i].size);
  2859f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2859fa:	8b 88 b0 00 00 00    	mov    0xb0(%eax),%ecx
  285a00:	8b 55 f0             	mov    -0x10(%ebp),%edx
  285a03:	89 d0                	mov    %edx,%eax
  285a05:	01 c0                	add    %eax,%eax
  285a07:	01 d0                	add    %edx,%eax
  285a09:	c1 e0 02             	shl    $0x2,%eax
  285a0c:	01 c8                	add    %ecx,%eax
  285a0e:	8b 40 04             	mov    0x4(%eax),%eax
  285a11:	89 c3                	mov    %eax,%ebx
  285a13:	8b 45 e8             	mov    -0x18(%ebp),%eax
  285a16:	8b 88 b0 00 00 00    	mov    0xb0(%eax),%ecx
  285a1c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  285a1f:	89 d0                	mov    %edx,%eax
  285a21:	01 c0                	add    %eax,%eax
  285a23:	01 d0                	add    %edx,%eax
  285a25:	c1 e0 02             	shl    $0x2,%eax
  285a28:	01 c8                	add    %ecx,%eax
  285a2a:	8b 00                	mov    (%eax),%eax
  285a2c:	83 ec 04             	sub    $0x4,%esp
  285a2f:	53                   	push   %ebx
  285a30:	50                   	push   %eax
  285a31:	ff 75 ec             	pushl  -0x14(%ebp)
  285a34:	e8 eb ce ff ff       	call   282924 <memman_free_4k>
  285a39:	83 c4 10             	add    $0x10,%esp
					task->fhandle[i].buf = 0;
  285a3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  285a3f:	8b 88 b0 00 00 00    	mov    0xb0(%eax),%ecx
  285a45:	8b 55 f0             	mov    -0x10(%ebp),%edx
  285a48:	89 d0                	mov    %edx,%eax
  285a4a:	01 c0                	add    %eax,%eax
  285a4c:	01 d0                	add    %edx,%eax
  285a4e:	c1 e0 02             	shl    $0x2,%eax
  285a51:	01 c8                	add    %ecx,%eax
  285a53:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			for (i = 0; i < 8; i++) {	/* ÔøΩNÔøΩÔøΩÔøΩ[ÔøΩYÔøΩÔøΩÔøΩƒÇ»ÇÔøΩÔøΩtÔøΩ@ÔøΩCÔøΩÔøΩÔøΩÔøΩÔøΩNÔøΩÔøΩÔøΩ[ÔøΩY */
  285a59:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  285a5d:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
  285a61:	0f 8e 73 ff ff ff    	jle    2859da <cmd_app+0x2a4>
				}
			}
			timer_cancelall(&task->fifo);
  285a67:	8b 45 e8             	mov    -0x18(%ebp),%eax
  285a6a:	83 c0 10             	add    $0x10,%eax
  285a6d:	83 ec 0c             	sub    $0xc,%esp
  285a70:	50                   	push   %eax
  285a71:	e8 9e e1 ff ff       	call   283c14 <timer_cancelall>
  285a76:	83 c4 10             	add    $0x10,%esp
			memman_free_4k(memman, (int) q, segsiz);
  285a79:	8b 55 e0             	mov    -0x20(%ebp),%edx
  285a7c:	8b 45 d0             	mov    -0x30(%ebp),%eax
  285a7f:	83 ec 04             	sub    $0x4,%esp
  285a82:	52                   	push   %edx
  285a83:	50                   	push   %eax
  285a84:	ff 75 ec             	pushl  -0x14(%ebp)
  285a87:	e8 98 ce ff ff       	call   282924 <memman_free_4k>
  285a8c:	83 c4 10             	add    $0x10,%esp
			task->langbyte1 = 0;
  285a8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  285a92:	c6 80 bd 00 00 00 00 	movb   $0x0,0xbd(%eax)
  285a99:	eb 13                	jmp    285aae <cmd_app+0x378>
		} else {
			cons_putstr0(cons, ".hrb file format error.\n");
  285a9b:	83 ec 08             	sub    $0x8,%esp
  285a9e:	68 ef 13 31 00       	push   $0x3113ef
  285aa3:	ff 75 08             	pushl  0x8(%ebp)
  285aa6:	e8 e4 f5 ff ff       	call   28508f <cons_putstr0>
  285aab:	83 c4 10             	add    $0x10,%esp
		}
		memman_free_4k(memman, (int) p, appsiz);
  285aae:	8b 45 b0             	mov    -0x50(%ebp),%eax
  285ab1:	89 c2                	mov    %eax,%edx
  285ab3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  285ab6:	83 ec 04             	sub    $0x4,%esp
  285ab9:	52                   	push   %edx
  285aba:	50                   	push   %eax
  285abb:	ff 75 ec             	pushl  -0x14(%ebp)
  285abe:	e8 61 ce ff ff       	call   282924 <memman_free_4k>
  285ac3:	83 c4 10             	add    $0x10,%esp
		cons_newline(cons);
  285ac6:	83 ec 0c             	sub    $0xc,%esp
  285ac9:	ff 75 08             	pushl  0x8(%ebp)
  285acc:	e8 79 f4 ff ff       	call   284f4a <cons_newline>
  285ad1:	83 c4 10             	add    $0x10,%esp
		return 1;
  285ad4:	b8 01 00 00 00       	mov    $0x1,%eax
  285ad9:	eb 05                	jmp    285ae0 <cmd_app+0x3aa>
	}
	/* ÔøΩtÔøΩ@ÔøΩCÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ¬ÇÔøΩÔøΩÔøΩ»ÇÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÍçá */
	return 0;
  285adb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  285ae0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  285ae3:	c9                   	leave  
  285ae4:	c3                   	ret    

00285ae5 <hrb_api>:

int *hrb_api(int edi, int esi, int ebp, int esp, int ebx, int edx, int ecx, int eax)
{
  285ae5:	f3 0f 1e fb          	endbr32 
  285ae9:	55                   	push   %ebp
  285aea:	89 e5                	mov    %esp,%ebp
  285aec:	53                   	push   %ebx
  285aed:	83 ec 34             	sub    $0x34,%esp
	struct TASK *task = task_now();
  285af0:	e8 b2 e1 ff ff       	call   283ca7 <task_now>
  285af5:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int ds_base = task->ds_base;
  285af8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285afb:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
  285b01:	89 45 ec             	mov    %eax,-0x14(%ebp)
	struct CONSOLE *cons = task->cons;
  285b04:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285b07:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
  285b0d:	89 45 e8             	mov    %eax,-0x18(%ebp)
	struct SHTCTL *shtctl = (struct SHTCTL *) *((int *) 0x0fe4);
  285b10:	b8 e4 0f 00 00       	mov    $0xfe4,%eax
  285b15:	8b 00                	mov    (%eax),%eax
  285b17:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	struct SHEET *sht;
	struct FIFO32 *sys_fifo = (struct FIFO32 *) *((int *) 0x0fec);
  285b1a:	b8 ec 0f 00 00       	mov    $0xfec,%eax
  285b1f:	8b 00                	mov    (%eax),%eax
  285b21:	89 45 e0             	mov    %eax,-0x20(%ebp)
	int *reg = &eax + 1;	/* eaxÔøΩÃéÔøΩÔøΩÃî‘ín */
  285b24:	8d 45 24             	lea    0x24(%ebp),%eax
  285b27:	83 c0 04             	add    $0x4,%eax
  285b2a:	89 45 dc             	mov    %eax,-0x24(%ebp)
		/* reg[0] : EDI,   reg[1] : ESI,   reg[2] : EBP,   reg[3] : ESP */
		/* reg[4] : EBX,   reg[5] : EDX,   reg[6] : ECX,   reg[7] : EAX */
	int i;
	struct FILEINFO *finfo;
	struct FILEHANDLE *fh;
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  285b2d:	c7 45 d8 00 00 3c 00 	movl   $0x3c0000,-0x28(%ebp)

	if (edx == 1) {
  285b34:	83 7d 1c 01          	cmpl   $0x1,0x1c(%ebp)
  285b38:	75 1c                	jne    285b56 <hrb_api+0x71>
		cons_putchar(cons, eax & 0xff, 1);
  285b3a:	8b 45 24             	mov    0x24(%ebp),%eax
  285b3d:	0f b6 c0             	movzbl %al,%eax
  285b40:	83 ec 04             	sub    $0x4,%esp
  285b43:	6a 01                	push   $0x1
  285b45:	50                   	push   %eax
  285b46:	ff 75 e8             	pushl  -0x18(%ebp)
  285b49:	e8 da f2 ff ff       	call   284e28 <cons_putchar>
  285b4e:	83 c4 10             	add    $0x10,%esp
  285b51:	e9 95 09 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 2) {
  285b56:	83 7d 1c 02          	cmpl   $0x2,0x1c(%ebp)
  285b5a:	75 1c                	jne    285b78 <hrb_api+0x93>
		cons_putstr0(cons, (char *) ebx + ds_base);
  285b5c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  285b5f:	8b 45 18             	mov    0x18(%ebp),%eax
  285b62:	01 d0                	add    %edx,%eax
  285b64:	83 ec 08             	sub    $0x8,%esp
  285b67:	50                   	push   %eax
  285b68:	ff 75 e8             	pushl  -0x18(%ebp)
  285b6b:	e8 1f f5 ff ff       	call   28508f <cons_putstr0>
  285b70:	83 c4 10             	add    $0x10,%esp
  285b73:	e9 73 09 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 3) {
  285b78:	83 7d 1c 03          	cmpl   $0x3,0x1c(%ebp)
  285b7c:	75 1f                	jne    285b9d <hrb_api+0xb8>
		cons_putstr1(cons, (char *) ebx + ds_base, ecx);
  285b7e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  285b81:	8b 45 18             	mov    0x18(%ebp),%eax
  285b84:	01 d0                	add    %edx,%eax
  285b86:	83 ec 04             	sub    $0x4,%esp
  285b89:	ff 75 20             	pushl  0x20(%ebp)
  285b8c:	50                   	push   %eax
  285b8d:	ff 75 e8             	pushl  -0x18(%ebp)
  285b90:	e8 31 f5 ff ff       	call   2850c6 <cons_putstr1>
  285b95:	83 c4 10             	add    $0x10,%esp
  285b98:	e9 4e 09 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 4) {
  285b9d:	83 7d 1c 04          	cmpl   $0x4,0x1c(%ebp)
  285ba1:	75 0b                	jne    285bae <hrb_api+0xc9>
		return &(task->tss.esp0);
  285ba3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285ba6:	83 c0 30             	add    $0x30,%eax
  285ba9:	e9 42 09 00 00       	jmp    2864f0 <hrb_api+0xa0b>
	} else if (edx == 5) {
  285bae:	83 7d 1c 05          	cmpl   $0x5,0x1c(%ebp)
  285bb2:	0f 85 d1 00 00 00    	jne    285c89 <hrb_api+0x1a4>
		sht = sheet_alloc(shtctl);
  285bb8:	83 ec 0c             	sub    $0xc,%esp
  285bbb:	ff 75 e4             	pushl  -0x1c(%ebp)
  285bbe:	e8 7b ce ff ff       	call   282a3e <sheet_alloc>
  285bc3:	83 c4 10             	add    $0x10,%esp
  285bc6:	89 45 cc             	mov    %eax,-0x34(%ebp)
		sht->task = task;
  285bc9:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285bcc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  285bcf:	89 50 24             	mov    %edx,0x24(%eax)
		sht->flags |= 0x10;
  285bd2:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285bd5:	8b 40 1c             	mov    0x1c(%eax),%eax
  285bd8:	83 c8 10             	or     $0x10,%eax
  285bdb:	89 c2                	mov    %eax,%edx
  285bdd:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285be0:	89 50 1c             	mov    %edx,0x1c(%eax)
		sheet_setbuf(sht, (char *) ebx + ds_base, esi, edi, eax);
  285be3:	8b 45 24             	mov    0x24(%ebp),%eax
  285be6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  285be9:	8b 55 18             	mov    0x18(%ebp),%edx
  285bec:	01 ca                	add    %ecx,%edx
  285bee:	83 ec 0c             	sub    $0xc,%esp
  285bf1:	50                   	push   %eax
  285bf2:	ff 75 08             	pushl  0x8(%ebp)
  285bf5:	ff 75 0c             	pushl  0xc(%ebp)
  285bf8:	52                   	push   %edx
  285bf9:	ff 75 cc             	pushl  -0x34(%ebp)
  285bfc:	e8 c2 ce ff ff       	call   282ac3 <sheet_setbuf>
  285c01:	83 c4 20             	add    $0x20,%esp
		make_window8((char *) ebx + ds_base, esi, edi, (char *) ecx + ds_base, 0);
  285c04:	8b 55 ec             	mov    -0x14(%ebp),%edx
  285c07:	8b 45 20             	mov    0x20(%ebp),%eax
  285c0a:	01 d0                	add    %edx,%eax
  285c0c:	89 c1                	mov    %eax,%ecx
  285c0e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  285c11:	8b 45 18             	mov    0x18(%ebp),%eax
  285c14:	01 d0                	add    %edx,%eax
  285c16:	83 ec 0c             	sub    $0xc,%esp
  285c19:	6a 00                	push   $0x0
  285c1b:	51                   	push   %ecx
  285c1c:	ff 75 08             	pushl  0x8(%ebp)
  285c1f:	ff 75 0c             	pushl  0xc(%ebp)
  285c22:	50                   	push   %eax
  285c23:	e8 54 e7 ff ff       	call   28437c <make_window8>
  285c28:	83 c4 20             	add    $0x20,%esp
		sheet_slide(sht, ((shtctl->xsize - esi) / 2) & ~3, (shtctl->ysize - edi) / 2);
  285c2b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  285c2e:	8b 40 0c             	mov    0xc(%eax),%eax
  285c31:	2b 45 08             	sub    0x8(%ebp),%eax
  285c34:	89 c2                	mov    %eax,%edx
  285c36:	c1 ea 1f             	shr    $0x1f,%edx
  285c39:	01 d0                	add    %edx,%eax
  285c3b:	d1 f8                	sar    %eax
  285c3d:	89 c1                	mov    %eax,%ecx
  285c3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  285c42:	8b 40 08             	mov    0x8(%eax),%eax
  285c45:	2b 45 0c             	sub    0xc(%ebp),%eax
  285c48:	89 c2                	mov    %eax,%edx
  285c4a:	c1 ea 1f             	shr    $0x1f,%edx
  285c4d:	01 d0                	add    %edx,%eax
  285c4f:	d1 f8                	sar    %eax
  285c51:	83 e0 fc             	and    $0xfffffffc,%eax
  285c54:	83 ec 04             	sub    $0x4,%esp
  285c57:	51                   	push   %ecx
  285c58:	50                   	push   %eax
  285c59:	ff 75 cc             	pushl  -0x34(%ebp)
  285c5c:	e8 1b db ff ff       	call   28377c <sheet_slide>
  285c61:	83 c4 10             	add    $0x10,%esp
		sheet_updown(sht, shtctl->top); /* ÔøΩÔøΩÔøΩÃÉ}ÔøΩEÔøΩXÔøΩ∆ìÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ…Ç»ÇÔøΩÊÇ§ÔøΩ…éwÔøΩÔøΩF ÔøΩ}ÔøΩEÔøΩXÔøΩÕÇÔøΩÔøΩÃèÔøΩ…Ç»ÇÔøΩ */
  285c64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  285c67:	8b 40 10             	mov    0x10(%eax),%eax
  285c6a:	83 ec 08             	sub    $0x8,%esp
  285c6d:	50                   	push   %eax
  285c6e:	ff 75 cc             	pushl  -0x34(%ebp)
  285c71:	e8 16 d7 ff ff       	call   28338c <sheet_updown>
  285c76:	83 c4 10             	add    $0x10,%esp
		reg[7] = (int) sht;
  285c79:	8b 45 dc             	mov    -0x24(%ebp),%eax
  285c7c:	8d 50 1c             	lea    0x1c(%eax),%edx
  285c7f:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285c82:	89 02                	mov    %eax,(%edx)
  285c84:	e9 62 08 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 6) {
  285c89:	83 7d 1c 06          	cmpl   $0x6,0x1c(%ebp)
  285c8d:	75 77                	jne    285d06 <hrb_api+0x221>
		sht = (struct SHEET *) (ebx & 0xfffffffe);
  285c8f:	8b 45 18             	mov    0x18(%ebp),%eax
  285c92:	83 e0 fe             	and    $0xfffffffe,%eax
  285c95:	89 45 cc             	mov    %eax,-0x34(%ebp)
		putfonts8_asc(sht->buf, sht->bxsize, esi, edi, eax, (char *) ebp + ds_base);
  285c98:	8b 55 ec             	mov    -0x14(%ebp),%edx
  285c9b:	8b 45 10             	mov    0x10(%ebp),%eax
  285c9e:	01 d0                	add    %edx,%eax
  285ca0:	89 c3                	mov    %eax,%ebx
  285ca2:	8b 45 24             	mov    0x24(%ebp),%eax
  285ca5:	0f be c8             	movsbl %al,%ecx
  285ca8:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285cab:	8b 50 04             	mov    0x4(%eax),%edx
  285cae:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285cb1:	8b 00                	mov    (%eax),%eax
  285cb3:	83 ec 08             	sub    $0x8,%esp
  285cb6:	53                   	push   %ebx
  285cb7:	51                   	push   %ecx
  285cb8:	ff 75 08             	pushl  0x8(%ebp)
  285cbb:	ff 75 0c             	pushl  0xc(%ebp)
  285cbe:	52                   	push   %edx
  285cbf:	50                   	push   %eax
  285cc0:	e8 b6 bb ff ff       	call   28187b <putfonts8_asc>
  285cc5:	83 c4 20             	add    $0x20,%esp
		if ((ebx & 1) == 0) {
  285cc8:	8b 45 18             	mov    0x18(%ebp),%eax
  285ccb:	83 e0 01             	and    $0x1,%eax
  285cce:	85 c0                	test   %eax,%eax
  285cd0:	0f 85 15 08 00 00    	jne    2864eb <hrb_api+0xa06>
			sheet_refresh(sht, esi, edi, esi + ecx * 8, edi + 16);
  285cd6:	8b 45 08             	mov    0x8(%ebp),%eax
  285cd9:	8d 50 10             	lea    0x10(%eax),%edx
  285cdc:	8b 45 20             	mov    0x20(%ebp),%eax
  285cdf:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  285ce6:	8b 45 0c             	mov    0xc(%ebp),%eax
  285ce9:	01 c8                	add    %ecx,%eax
  285ceb:	83 ec 0c             	sub    $0xc,%esp
  285cee:	52                   	push   %edx
  285cef:	50                   	push   %eax
  285cf0:	ff 75 08             	pushl  0x8(%ebp)
  285cf3:	ff 75 0c             	pushl  0xc(%ebp)
  285cf6:	ff 75 cc             	pushl  -0x34(%ebp)
  285cf9:	e8 09 da ff ff       	call   283707 <sheet_refresh>
  285cfe:	83 c4 20             	add    $0x20,%esp
  285d01:	e9 e5 07 00 00       	jmp    2864eb <hrb_api+0xa06>
		}
	} else if (edx == 7) {
  285d06:	83 7d 1c 07          	cmpl   $0x7,0x1c(%ebp)
  285d0a:	75 6b                	jne    285d77 <hrb_api+0x292>
		sht = (struct SHEET *) (ebx & 0xfffffffe);
  285d0c:	8b 45 18             	mov    0x18(%ebp),%eax
  285d0f:	83 e0 fe             	and    $0xfffffffe,%eax
  285d12:	89 45 cc             	mov    %eax,-0x34(%ebp)
		boxfill8(sht->buf, sht->bxsize, ebp, eax, ecx, esi, edi);
  285d15:	8b 5d 24             	mov    0x24(%ebp),%ebx
  285d18:	8b 45 10             	mov    0x10(%ebp),%eax
  285d1b:	0f b6 c8             	movzbl %al,%ecx
  285d1e:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285d21:	8b 50 04             	mov    0x4(%eax),%edx
  285d24:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285d27:	8b 00                	mov    (%eax),%eax
  285d29:	83 ec 04             	sub    $0x4,%esp
  285d2c:	ff 75 08             	pushl  0x8(%ebp)
  285d2f:	ff 75 0c             	pushl  0xc(%ebp)
  285d32:	ff 75 20             	pushl  0x20(%ebp)
  285d35:	53                   	push   %ebx
  285d36:	51                   	push   %ecx
  285d37:	52                   	push   %edx
  285d38:	50                   	push   %eax
  285d39:	e8 c0 b7 ff ff       	call   2814fe <boxfill8>
  285d3e:	83 c4 20             	add    $0x20,%esp
		if ((ebx & 1) == 0) {
  285d41:	8b 45 18             	mov    0x18(%ebp),%eax
  285d44:	83 e0 01             	and    $0x1,%eax
  285d47:	85 c0                	test   %eax,%eax
  285d49:	0f 85 9c 07 00 00    	jne    2864eb <hrb_api+0xa06>
			sheet_refresh(sht, eax, ecx, esi + 1, edi + 1);
  285d4f:	8b 45 08             	mov    0x8(%ebp),%eax
  285d52:	8d 48 01             	lea    0x1(%eax),%ecx
  285d55:	8b 45 0c             	mov    0xc(%ebp),%eax
  285d58:	8d 50 01             	lea    0x1(%eax),%edx
  285d5b:	8b 45 24             	mov    0x24(%ebp),%eax
  285d5e:	83 ec 0c             	sub    $0xc,%esp
  285d61:	51                   	push   %ecx
  285d62:	52                   	push   %edx
  285d63:	ff 75 20             	pushl  0x20(%ebp)
  285d66:	50                   	push   %eax
  285d67:	ff 75 cc             	pushl  -0x34(%ebp)
  285d6a:	e8 98 d9 ff ff       	call   283707 <sheet_refresh>
  285d6f:	83 c4 20             	add    $0x20,%esp
  285d72:	e9 74 07 00 00       	jmp    2864eb <hrb_api+0xa06>
		}
	} else if (edx == 8) {
  285d77:	83 7d 1c 08          	cmpl   $0x8,0x1c(%ebp)
  285d7b:	75 3b                	jne    285db8 <hrb_api+0x2d3>
		memman_init((struct MEMMAN *) (ebx + ds_base));
  285d7d:	8b 55 18             	mov    0x18(%ebp),%edx
  285d80:	8b 45 ec             	mov    -0x14(%ebp),%eax
  285d83:	01 d0                	add    %edx,%eax
  285d85:	83 ec 0c             	sub    $0xc,%esp
  285d88:	50                   	push   %eax
  285d89:	e8 b7 c7 ff ff       	call   282545 <memman_init>
  285d8e:	83 c4 10             	add    $0x10,%esp
		ecx &= 0xfffffff0;	/* 16ÔøΩoÔøΩCÔøΩgÔøΩPÔøΩ ÇÔøΩ */
  285d91:	83 65 20 f0          	andl   $0xfffffff0,0x20(%ebp)
		memman_free((struct MEMMAN *) (ebx + ds_base), eax, ecx);
  285d95:	8b 45 20             	mov    0x20(%ebp),%eax
  285d98:	8b 55 24             	mov    0x24(%ebp),%edx
  285d9b:	89 d3                	mov    %edx,%ebx
  285d9d:	8b 4d 18             	mov    0x18(%ebp),%ecx
  285da0:	8b 55 ec             	mov    -0x14(%ebp),%edx
  285da3:	01 ca                	add    %ecx,%edx
  285da5:	83 ec 04             	sub    $0x4,%esp
  285da8:	50                   	push   %eax
  285da9:	53                   	push   %ebx
  285daa:	52                   	push   %edx
  285dab:	e8 f0 c8 ff ff       	call   2826a0 <memman_free>
  285db0:	83 c4 10             	add    $0x10,%esp
  285db3:	e9 33 07 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 9) {
  285db8:	83 7d 1c 09          	cmpl   $0x9,0x1c(%ebp)
  285dbc:	75 31                	jne    285def <hrb_api+0x30a>
		ecx = (ecx + 0x0f) & 0xfffffff0; /* 16ÔøΩoÔøΩCÔøΩgÔøΩPÔøΩ Ç…êÿÇÔøΩ„Ç∞ */
  285dbe:	8b 45 20             	mov    0x20(%ebp),%eax
  285dc1:	83 c0 0f             	add    $0xf,%eax
  285dc4:	83 e0 f0             	and    $0xfffffff0,%eax
  285dc7:	89 45 20             	mov    %eax,0x20(%ebp)
		reg[7] = memman_alloc((struct MEMMAN *) (ebx + ds_base), ecx);
  285dca:	8b 45 20             	mov    0x20(%ebp),%eax
  285dcd:	8b 4d 18             	mov    0x18(%ebp),%ecx
  285dd0:	8b 55 ec             	mov    -0x14(%ebp),%edx
  285dd3:	01 ca                	add    %ecx,%edx
  285dd5:	83 ec 08             	sub    $0x8,%esp
  285dd8:	50                   	push   %eax
  285dd9:	52                   	push   %edx
  285dda:	e8 d4 c7 ff ff       	call   2825b3 <memman_alloc>
  285ddf:	83 c4 10             	add    $0x10,%esp
  285de2:	8b 55 dc             	mov    -0x24(%ebp),%edx
  285de5:	83 c2 1c             	add    $0x1c,%edx
  285de8:	89 02                	mov    %eax,(%edx)
  285dea:	e9 fc 06 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 10) {
  285def:	83 7d 1c 0a          	cmpl   $0xa,0x1c(%ebp)
  285df3:	75 2f                	jne    285e24 <hrb_api+0x33f>
		ecx = (ecx + 0x0f) & 0xfffffff0; /* 16ÔøΩoÔøΩCÔøΩgÔøΩPÔøΩ Ç…êÿÇÔøΩ„Ç∞ */
  285df5:	8b 45 20             	mov    0x20(%ebp),%eax
  285df8:	83 c0 0f             	add    $0xf,%eax
  285dfb:	83 e0 f0             	and    $0xfffffff0,%eax
  285dfe:	89 45 20             	mov    %eax,0x20(%ebp)
		memman_free((struct MEMMAN *) (ebx + ds_base), eax, ecx);
  285e01:	8b 45 20             	mov    0x20(%ebp),%eax
  285e04:	8b 55 24             	mov    0x24(%ebp),%edx
  285e07:	89 d3                	mov    %edx,%ebx
  285e09:	8b 4d 18             	mov    0x18(%ebp),%ecx
  285e0c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  285e0f:	01 ca                	add    %ecx,%edx
  285e11:	83 ec 04             	sub    $0x4,%esp
  285e14:	50                   	push   %eax
  285e15:	53                   	push   %ebx
  285e16:	52                   	push   %edx
  285e17:	e8 84 c8 ff ff       	call   2826a0 <memman_free>
  285e1c:	83 c4 10             	add    $0x10,%esp
  285e1f:	e9 c7 06 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 11) {
  285e24:	83 7d 1c 0b          	cmpl   $0xb,0x1c(%ebp)
  285e28:	75 5d                	jne    285e87 <hrb_api+0x3a2>
		sht = (struct SHEET *) (ebx & 0xfffffffe);
  285e2a:	8b 45 18             	mov    0x18(%ebp),%eax
  285e2d:	83 e0 fe             	and    $0xfffffffe,%eax
  285e30:	89 45 cc             	mov    %eax,-0x34(%ebp)
		sht->buf[sht->bxsize * edi + esi] = eax;
  285e33:	8b 5d 24             	mov    0x24(%ebp),%ebx
  285e36:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285e39:	8b 10                	mov    (%eax),%edx
  285e3b:	8b 45 cc             	mov    -0x34(%ebp),%eax
  285e3e:	8b 40 04             	mov    0x4(%eax),%eax
  285e41:	0f af 45 08          	imul   0x8(%ebp),%eax
  285e45:	89 c1                	mov    %eax,%ecx
  285e47:	8b 45 0c             	mov    0xc(%ebp),%eax
  285e4a:	01 c8                	add    %ecx,%eax
  285e4c:	01 d0                	add    %edx,%eax
  285e4e:	89 da                	mov    %ebx,%edx
  285e50:	88 10                	mov    %dl,(%eax)
		if ((ebx & 1) == 0) {
  285e52:	8b 45 18             	mov    0x18(%ebp),%eax
  285e55:	83 e0 01             	and    $0x1,%eax
  285e58:	85 c0                	test   %eax,%eax
  285e5a:	0f 85 8b 06 00 00    	jne    2864eb <hrb_api+0xa06>
			sheet_refresh(sht, esi, edi, esi + 1, edi + 1);
  285e60:	8b 45 08             	mov    0x8(%ebp),%eax
  285e63:	8d 50 01             	lea    0x1(%eax),%edx
  285e66:	8b 45 0c             	mov    0xc(%ebp),%eax
  285e69:	83 c0 01             	add    $0x1,%eax
  285e6c:	83 ec 0c             	sub    $0xc,%esp
  285e6f:	52                   	push   %edx
  285e70:	50                   	push   %eax
  285e71:	ff 75 08             	pushl  0x8(%ebp)
  285e74:	ff 75 0c             	pushl  0xc(%ebp)
  285e77:	ff 75 cc             	pushl  -0x34(%ebp)
  285e7a:	e8 88 d8 ff ff       	call   283707 <sheet_refresh>
  285e7f:	83 c4 20             	add    $0x20,%esp
  285e82:	e9 64 06 00 00       	jmp    2864eb <hrb_api+0xa06>
		}
	} else if (edx == 12) {
  285e87:	83 7d 1c 0c          	cmpl   $0xc,0x1c(%ebp)
  285e8b:	75 26                	jne    285eb3 <hrb_api+0x3ce>
		sht = (struct SHEET *) ebx;
  285e8d:	8b 45 18             	mov    0x18(%ebp),%eax
  285e90:	89 45 cc             	mov    %eax,-0x34(%ebp)
		sheet_refresh(sht, eax, ecx, esi, edi);
  285e93:	8b 45 24             	mov    0x24(%ebp),%eax
  285e96:	83 ec 0c             	sub    $0xc,%esp
  285e99:	ff 75 08             	pushl  0x8(%ebp)
  285e9c:	ff 75 0c             	pushl  0xc(%ebp)
  285e9f:	ff 75 20             	pushl  0x20(%ebp)
  285ea2:	50                   	push   %eax
  285ea3:	ff 75 cc             	pushl  -0x34(%ebp)
  285ea6:	e8 5c d8 ff ff       	call   283707 <sheet_refresh>
  285eab:	83 c4 20             	add    $0x20,%esp
  285eae:	e9 38 06 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 13) {
  285eb3:	83 7d 1c 0d          	cmpl   $0xd,0x1c(%ebp)
  285eb7:	0f 85 91 00 00 00    	jne    285f4e <hrb_api+0x469>
		sht = (struct SHEET *) (ebx & 0xfffffffe);
  285ebd:	8b 45 18             	mov    0x18(%ebp),%eax
  285ec0:	83 e0 fe             	and    $0xfffffffe,%eax
  285ec3:	89 45 cc             	mov    %eax,-0x34(%ebp)
		hrb_api_linewin(sht, eax, ecx, esi, edi, ebp);
  285ec6:	8b 45 24             	mov    0x24(%ebp),%eax
  285ec9:	83 ec 08             	sub    $0x8,%esp
  285ecc:	ff 75 10             	pushl  0x10(%ebp)
  285ecf:	ff 75 08             	pushl  0x8(%ebp)
  285ed2:	ff 75 0c             	pushl  0xc(%ebp)
  285ed5:	ff 75 20             	pushl  0x20(%ebp)
  285ed8:	50                   	push   %eax
  285ed9:	ff 75 cc             	pushl  -0x34(%ebp)
  285edc:	e8 e4 06 00 00       	call   2865c5 <hrb_api_linewin>
  285ee1:	83 c4 20             	add    $0x20,%esp
		if ((ebx & 1) == 0) {
  285ee4:	8b 45 18             	mov    0x18(%ebp),%eax
  285ee7:	83 e0 01             	and    $0x1,%eax
  285eea:	85 c0                	test   %eax,%eax
  285eec:	0f 85 f9 05 00 00    	jne    2864eb <hrb_api+0xa06>
			if (eax > esi) {
  285ef2:	8b 45 24             	mov    0x24(%ebp),%eax
  285ef5:	39 45 0c             	cmp    %eax,0xc(%ebp)
  285ef8:	7d 12                	jge    285f0c <hrb_api+0x427>
				i = eax;
  285efa:	8b 45 24             	mov    0x24(%ebp),%eax
  285efd:	89 45 f4             	mov    %eax,-0xc(%ebp)
				eax = esi;
  285f00:	8b 45 0c             	mov    0xc(%ebp),%eax
  285f03:	89 45 24             	mov    %eax,0x24(%ebp)
				esi = i;
  285f06:	8b 45 f4             	mov    -0xc(%ebp),%eax
  285f09:	89 45 0c             	mov    %eax,0xc(%ebp)
			}
			if (ecx > edi) {
  285f0c:	8b 45 20             	mov    0x20(%ebp),%eax
  285f0f:	3b 45 08             	cmp    0x8(%ebp),%eax
  285f12:	7e 12                	jle    285f26 <hrb_api+0x441>
				i = ecx;
  285f14:	8b 45 20             	mov    0x20(%ebp),%eax
  285f17:	89 45 f4             	mov    %eax,-0xc(%ebp)
				ecx = edi;
  285f1a:	8b 45 08             	mov    0x8(%ebp),%eax
  285f1d:	89 45 20             	mov    %eax,0x20(%ebp)
				edi = i;
  285f20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  285f23:	89 45 08             	mov    %eax,0x8(%ebp)
			}
			sheet_refresh(sht, eax, ecx, esi + 1, edi + 1);
  285f26:	8b 45 08             	mov    0x8(%ebp),%eax
  285f29:	8d 48 01             	lea    0x1(%eax),%ecx
  285f2c:	8b 45 0c             	mov    0xc(%ebp),%eax
  285f2f:	8d 50 01             	lea    0x1(%eax),%edx
  285f32:	8b 45 24             	mov    0x24(%ebp),%eax
  285f35:	83 ec 0c             	sub    $0xc,%esp
  285f38:	51                   	push   %ecx
  285f39:	52                   	push   %edx
  285f3a:	ff 75 20             	pushl  0x20(%ebp)
  285f3d:	50                   	push   %eax
  285f3e:	ff 75 cc             	pushl  -0x34(%ebp)
  285f41:	e8 c1 d7 ff ff       	call   283707 <sheet_refresh>
  285f46:	83 c4 20             	add    $0x20,%esp
  285f49:	e9 9d 05 00 00       	jmp    2864eb <hrb_api+0xa06>
		}
	} else if (edx == 14) {
  285f4e:	83 7d 1c 0e          	cmpl   $0xe,0x1c(%ebp)
  285f52:	75 14                	jne    285f68 <hrb_api+0x483>
		sheet_free((struct SHEET *) ebx);
  285f54:	8b 45 18             	mov    0x18(%ebp),%eax
  285f57:	83 ec 0c             	sub    $0xc,%esp
  285f5a:	50                   	push   %eax
  285f5b:	e8 33 d9 ff ff       	call   283893 <sheet_free>
  285f60:	83 c4 10             	add    $0x10,%esp
  285f63:	e9 83 05 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 15) {
  285f68:	83 7d 1c 0f          	cmpl   $0xf,0x1c(%ebp)
  285f6c:	0f 85 45 01 00 00    	jne    2860b7 <hrb_api+0x5d2>
		for (;;) {
			io_cli();
  285f72:	e8 db b1 ff ff       	call   281152 <io_cli>
			if (fifo32_status(&task->fifo) == 0) {
  285f77:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285f7a:	83 c0 10             	add    $0x10,%eax
  285f7d:	83 ec 0c             	sub    $0xc,%esp
  285f80:	50                   	push   %eax
  285f81:	e8 49 c2 ff ff       	call   2821cf <fifo32_status>
  285f86:	83 c4 10             	add    $0x10,%esp
  285f89:	85 c0                	test   %eax,%eax
  285f8b:	75 32                	jne    285fbf <hrb_api+0x4da>
				if (eax != 0) {
  285f8d:	8b 45 24             	mov    0x24(%ebp),%eax
  285f90:	85 c0                	test   %eax,%eax
  285f92:	74 10                	je     285fa4 <hrb_api+0x4bf>
					task_sleep(task);	/* FIFOÔøΩÔøΩÔøΩÔøΩ»ÇÃÇ≈êQÔøΩƒë“ÇÔøΩ */
  285f94:	83 ec 0c             	sub    $0xc,%esp
  285f97:	ff 75 f0             	pushl  -0x10(%ebp)
  285f9a:	e8 b6 e2 ff ff       	call   284255 <task_sleep>
  285f9f:	83 c4 10             	add    $0x10,%esp
  285fa2:	eb 1b                	jmp    285fbf <hrb_api+0x4da>
				} else {
					io_sti();
  285fa4:	e8 ab b1 ff ff       	call   281154 <io_sti>
					reg[7] = -1;
  285fa9:	8b 45 dc             	mov    -0x24(%ebp),%eax
  285fac:	83 c0 1c             	add    $0x1c,%eax
  285faf:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
					return 0;
  285fb5:	b8 00 00 00 00       	mov    $0x0,%eax
  285fba:	e9 31 05 00 00       	jmp    2864f0 <hrb_api+0xa0b>
				}
			}
			i = fifo32_get(&task->fifo);
  285fbf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285fc2:	83 c0 10             	add    $0x10,%eax
  285fc5:	83 ec 0c             	sub    $0xc,%esp
  285fc8:	50                   	push   %eax
  285fc9:	e8 8e c1 ff ff       	call   28215c <fifo32_get>
  285fce:	83 c4 10             	add    $0x10,%esp
  285fd1:	89 45 f4             	mov    %eax,-0xc(%ebp)
			io_sti();
  285fd4:	e8 7b b1 ff ff       	call   281154 <io_sti>
			if (i <= 1 && cons->sht != 0) { /* ÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩÔøΩpÔøΩ^ÔøΩCÔøΩ} */
  285fd9:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  285fdd:	7f 38                	jg     286017 <hrb_api+0x532>
  285fdf:	8b 45 e8             	mov    -0x18(%ebp),%eax
  285fe2:	8b 00                	mov    (%eax),%eax
  285fe4:	85 c0                	test   %eax,%eax
  285fe6:	74 2f                	je     286017 <hrb_api+0x532>
				/* ÔøΩAÔøΩvÔøΩÔøΩÔøΩÔøΩÔøΩsÔøΩÔøΩÔøΩÕÉJÔøΩ[ÔøΩ\ÔøΩÔøΩÔøΩÔøΩÔøΩoÔøΩ»ÇÔøΩÔøΩÃÇ≈ÅAÔøΩÔøΩÔøΩ¬ÇÔøΩÔøΩÔøΩÔøΩÕï\ÔøΩÔøΩÔøΩpÔøΩÔøΩ1ÔøΩíçïÔøΩÔøΩÔøΩÔøΩƒÇÔøΩÔøΩÔøΩ */
				timer_init(cons->timer, &task->fifo, 1); /* ÔøΩÔøΩÔøΩÔøΩ1ÔøΩÔøΩ */
  285fe8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  285feb:	8d 50 10             	lea    0x10(%eax),%edx
  285fee:	8b 45 e8             	mov    -0x18(%ebp),%eax
  285ff1:	8b 40 10             	mov    0x10(%eax),%eax
  285ff4:	83 ec 04             	sub    $0x4,%esp
  285ff7:	6a 01                	push   $0x1
  285ff9:	52                   	push   %edx
  285ffa:	50                   	push   %eax
  285ffb:	e8 f6 d9 ff ff       	call   2839f6 <timer_init>
  286000:	83 c4 10             	add    $0x10,%esp
				timer_settime(cons->timer, 50);
  286003:	8b 45 e8             	mov    -0x18(%ebp),%eax
  286006:	8b 40 10             	mov    0x10(%eax),%eax
  286009:	83 ec 08             	sub    $0x8,%esp
  28600c:	6a 32                	push   $0x32
  28600e:	50                   	push   %eax
  28600f:	e8 fe d9 ff ff       	call   283a12 <timer_settime>
  286014:	83 c4 10             	add    $0x10,%esp
			}
			if (i == 2) {	/* ÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩON */
  286017:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  28601b:	75 0a                	jne    286027 <hrb_api+0x542>
				cons->cur_c = COL8_FFFFFF;
  28601d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  286020:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
			}
			if (i == 3) {	/* ÔøΩJÔøΩ[ÔøΩ\ÔøΩÔøΩOFF */
  286027:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  28602b:	75 0a                	jne    286037 <hrb_api+0x552>
				cons->cur_c = -1;
  28602d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  286030:	c7 40 0c ff ff ff ff 	movl   $0xffffffff,0xc(%eax)
			}
			if (i == 4) {	/* ÔøΩRÔøΩÔøΩÔøΩ\ÔøΩ[ÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ¬ÇÔøΩÔøΩÔøΩ */
  286037:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
  28603b:	75 52                	jne    28608f <hrb_api+0x5aa>
				timer_cancel(cons->timer);
  28603d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  286040:	8b 40 10             	mov    0x10(%eax),%eax
  286043:	83 ec 0c             	sub    $0xc,%esp
  286046:	50                   	push   %eax
  286047:	e8 27 db ff ff       	call   283b73 <timer_cancel>
  28604c:	83 c4 10             	add    $0x10,%esp
				io_cli();
  28604f:	e8 fe b0 ff ff       	call   281152 <io_cli>
				fifo32_put(sys_fifo, cons->sht - shtctl->sheets0 + 2024);	/* 2024ÔøΩ`2279 */
  286054:	8b 45 e8             	mov    -0x18(%ebp),%eax
  286057:	8b 00                	mov    (%eax),%eax
  286059:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  28605c:	81 c2 14 04 00 00    	add    $0x414,%edx
  286062:	29 d0                	sub    %edx,%eax
  286064:	c1 f8 03             	sar    $0x3,%eax
  286067:	69 c0 cd cc cc cc    	imul   $0xcccccccd,%eax,%eax
  28606d:	05 e8 07 00 00       	add    $0x7e8,%eax
  286072:	83 ec 08             	sub    $0x8,%esp
  286075:	50                   	push   %eax
  286076:	ff 75 e0             	pushl  -0x20(%ebp)
  286079:	e8 2d c0 ff ff       	call   2820ab <fifo32_put>
  28607e:	83 c4 10             	add    $0x10,%esp
				cons->sht = 0;
  286081:	8b 45 e8             	mov    -0x18(%ebp),%eax
  286084:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
				io_sti();
  28608a:	e8 c5 b0 ff ff       	call   281154 <io_sti>
			}
			if (i >= 256) { /* ÔøΩLÔøΩ[ÔøΩ{ÔøΩ[ÔøΩhÔøΩfÔøΩ[ÔøΩ^ÔøΩiÔøΩ^ÔøΩXÔøΩNAÔøΩoÔøΩRÔøΩjÔøΩ»ÇÔøΩ */
  28608f:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
  286096:	0f 8e d6 fe ff ff    	jle    285f72 <hrb_api+0x48d>
				reg[7] = i - 256;
  28609c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  28609f:	83 c0 1c             	add    $0x1c,%eax
  2860a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2860a5:	81 ea 00 01 00 00    	sub    $0x100,%edx
  2860ab:	89 10                	mov    %edx,(%eax)
				return 0;
  2860ad:	b8 00 00 00 00       	mov    $0x0,%eax
  2860b2:	e9 39 04 00 00       	jmp    2864f0 <hrb_api+0xa0b>
			}
		}
	} else if (edx == 16) {
  2860b7:	83 7d 1c 10          	cmpl   $0x10,0x1c(%ebp)
  2860bb:	75 1e                	jne    2860db <hrb_api+0x5f6>
		reg[7] = (int) timer_alloc();
  2860bd:	e8 a2 d8 ff ff       	call   283964 <timer_alloc>
  2860c2:	8b 55 dc             	mov    -0x24(%ebp),%edx
  2860c5:	83 c2 1c             	add    $0x1c,%edx
  2860c8:	89 02                	mov    %eax,(%edx)
		((struct TIMER *) reg[7])->flags2 = 1;	/* ÔøΩÔøΩÔøΩÔøΩÔøΩLÔøΩÔøΩÔøΩÔøΩÔøΩZÔøΩÔøΩÔøΩLÔøΩÔøΩ */
  2860ca:	8b 45 dc             	mov    -0x24(%ebp),%eax
  2860cd:	83 c0 1c             	add    $0x1c,%eax
  2860d0:	8b 00                	mov    (%eax),%eax
  2860d2:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  2860d6:	e9 10 04 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 17) {
  2860db:	83 7d 1c 11          	cmpl   $0x11,0x1c(%ebp)
  2860df:	75 25                	jne    286106 <hrb_api+0x621>
		timer_init((struct TIMER *) ebx, &task->fifo, eax + 256);
  2860e1:	8b 45 24             	mov    0x24(%ebp),%eax
  2860e4:	8d 88 00 01 00 00    	lea    0x100(%eax),%ecx
  2860ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2860ed:	8d 50 10             	lea    0x10(%eax),%edx
  2860f0:	8b 45 18             	mov    0x18(%ebp),%eax
  2860f3:	83 ec 04             	sub    $0x4,%esp
  2860f6:	51                   	push   %ecx
  2860f7:	52                   	push   %edx
  2860f8:	50                   	push   %eax
  2860f9:	e8 f8 d8 ff ff       	call   2839f6 <timer_init>
  2860fe:	83 c4 10             	add    $0x10,%esp
  286101:	e9 e5 03 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 18) {
  286106:	83 7d 1c 12          	cmpl   $0x12,0x1c(%ebp)
  28610a:	75 1a                	jne    286126 <hrb_api+0x641>
		timer_settime((struct TIMER *) ebx, eax);
  28610c:	8b 45 24             	mov    0x24(%ebp),%eax
  28610f:	89 c2                	mov    %eax,%edx
  286111:	8b 45 18             	mov    0x18(%ebp),%eax
  286114:	83 ec 08             	sub    $0x8,%esp
  286117:	52                   	push   %edx
  286118:	50                   	push   %eax
  286119:	e8 f4 d8 ff ff       	call   283a12 <timer_settime>
  28611e:	83 c4 10             	add    $0x10,%esp
  286121:	e9 c5 03 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 19) {
  286126:	83 7d 1c 13          	cmpl   $0x13,0x1c(%ebp)
  28612a:	75 14                	jne    286140 <hrb_api+0x65b>
		timer_free((struct TIMER *) ebx);
  28612c:	8b 45 18             	mov    0x18(%ebp),%eax
  28612f:	83 ec 0c             	sub    $0xc,%esp
  286132:	50                   	push   %eax
  286133:	e8 ad d8 ff ff       	call   2839e5 <timer_free>
  286138:	83 c4 10             	add    $0x10,%esp
  28613b:	e9 ab 03 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 20) {
  286140:	83 7d 1c 14          	cmpl   $0x14,0x1c(%ebp)
  286144:	0f 85 a4 00 00 00    	jne    2861ee <hrb_api+0x709>
		if (eax == 0) {
  28614a:	8b 45 24             	mov    0x24(%ebp),%eax
  28614d:	85 c0                	test   %eax,%eax
  28614f:	75 29                	jne    28617a <hrb_api+0x695>
			i = io_in8(0x61);
  286151:	83 ec 0c             	sub    $0xc,%esp
  286154:	6a 61                	push   $0x61
  286156:	e8 fe af ff ff       	call   281159 <io_in8>
  28615b:	83 c4 10             	add    $0x10,%esp
  28615e:	89 45 f4             	mov    %eax,-0xc(%ebp)
			io_out8(0x61, i & 0x0d);
  286161:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286164:	83 e0 0d             	and    $0xd,%eax
  286167:	83 ec 08             	sub    $0x8,%esp
  28616a:	50                   	push   %eax
  28616b:	6a 61                	push   $0x61
  28616d:	e8 04 b0 ff ff       	call   281176 <io_out8>
  286172:	83 c4 10             	add    $0x10,%esp
  286175:	e9 71 03 00 00       	jmp    2864eb <hrb_api+0xa06>
		} else {
			i = 1193180000 / eax;
  28617a:	8b 5d 24             	mov    0x24(%ebp),%ebx
  28617d:	b8 60 7b 1e 47       	mov    $0x471e7b60,%eax
  286182:	99                   	cltd   
  286183:	f7 fb                	idiv   %ebx
  286185:	89 45 f4             	mov    %eax,-0xc(%ebp)
			io_out8(0x43, 0xb6);
  286188:	83 ec 08             	sub    $0x8,%esp
  28618b:	68 b6 00 00 00       	push   $0xb6
  286190:	6a 43                	push   $0x43
  286192:	e8 df af ff ff       	call   281176 <io_out8>
  286197:	83 c4 10             	add    $0x10,%esp
			io_out8(0x42, i & 0xff);
  28619a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28619d:	0f b6 c0             	movzbl %al,%eax
  2861a0:	83 ec 08             	sub    $0x8,%esp
  2861a3:	50                   	push   %eax
  2861a4:	6a 42                	push   $0x42
  2861a6:	e8 cb af ff ff       	call   281176 <io_out8>
  2861ab:	83 c4 10             	add    $0x10,%esp
			io_out8(0x42, i >> 8);
  2861ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2861b1:	c1 f8 08             	sar    $0x8,%eax
  2861b4:	83 ec 08             	sub    $0x8,%esp
  2861b7:	50                   	push   %eax
  2861b8:	6a 42                	push   $0x42
  2861ba:	e8 b7 af ff ff       	call   281176 <io_out8>
  2861bf:	83 c4 10             	add    $0x10,%esp
			i = io_in8(0x61);
  2861c2:	83 ec 0c             	sub    $0xc,%esp
  2861c5:	6a 61                	push   $0x61
  2861c7:	e8 8d af ff ff       	call   281159 <io_in8>
  2861cc:	83 c4 10             	add    $0x10,%esp
  2861cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
			io_out8(0x61, (i | 0x03) & 0x0f);
  2861d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2861d5:	83 e0 0c             	and    $0xc,%eax
  2861d8:	83 c8 03             	or     $0x3,%eax
  2861db:	83 ec 08             	sub    $0x8,%esp
  2861de:	50                   	push   %eax
  2861df:	6a 61                	push   $0x61
  2861e1:	e8 90 af ff ff       	call   281176 <io_out8>
  2861e6:	83 c4 10             	add    $0x10,%esp
  2861e9:	e9 fd 02 00 00       	jmp    2864eb <hrb_api+0xa06>
		}
	} else if (edx == 21) {
  2861ee:	83 7d 1c 15          	cmpl   $0x15,0x1c(%ebp)
  2861f2:	0f 85 e2 00 00 00    	jne    2862da <hrb_api+0x7f5>
		for (i = 0; i < 8; i++) {
  2861f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2861ff:	eb 21                	jmp    286222 <hrb_api+0x73d>
			if (task->fhandle[i].buf == 0) {
  286201:	8b 45 f0             	mov    -0x10(%ebp),%eax
  286204:	8b 88 b0 00 00 00    	mov    0xb0(%eax),%ecx
  28620a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  28620d:	89 d0                	mov    %edx,%eax
  28620f:	01 c0                	add    %eax,%eax
  286211:	01 d0                	add    %edx,%eax
  286213:	c1 e0 02             	shl    $0x2,%eax
  286216:	01 c8                	add    %ecx,%eax
  286218:	8b 00                	mov    (%eax),%eax
  28621a:	85 c0                	test   %eax,%eax
  28621c:	74 0c                	je     28622a <hrb_api+0x745>
		for (i = 0; i < 8; i++) {
  28621e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  286222:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
  286226:	7e d9                	jle    286201 <hrb_api+0x71c>
  286228:	eb 01                	jmp    28622b <hrb_api+0x746>
				break;
  28622a:	90                   	nop
			}
		}
		fh = &task->fhandle[i];
  28622b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28622e:	8b 88 b0 00 00 00    	mov    0xb0(%eax),%ecx
  286234:	8b 55 f4             	mov    -0xc(%ebp),%edx
  286237:	89 d0                	mov    %edx,%eax
  286239:	01 c0                	add    %eax,%eax
  28623b:	01 d0                	add    %edx,%eax
  28623d:	c1 e0 02             	shl    $0x2,%eax
  286240:	01 c8                	add    %ecx,%eax
  286242:	89 45 d4             	mov    %eax,-0x2c(%ebp)
		reg[7] = 0;
  286245:	8b 45 dc             	mov    -0x24(%ebp),%eax
  286248:	83 c0 1c             	add    $0x1c,%eax
  28624b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if (i < 8) {
  286251:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
  286255:	0f 8f 90 02 00 00    	jg     2864eb <hrb_api+0xa06>
			finfo = file_search((char *) ebx + ds_base,
  28625b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  28625e:	8b 45 18             	mov    0x18(%ebp),%eax
  286261:	01 d0                	add    %edx,%eax
  286263:	83 ec 04             	sub    $0x4,%esp
  286266:	68 e0 00 00 00       	push   $0xe0
  28626b:	68 00 26 10 00       	push   $0x102600
  286270:	50                   	push   %eax
  286271:	e8 e4 05 00 00       	call   28685a <file_search>
  286276:	83 c4 10             	add    $0x10,%esp
  286279:	89 45 d0             	mov    %eax,-0x30(%ebp)
					(struct FILEINFO *) (ADR_DISKIMG + 0x002600), 224);
			if (finfo != 0) {
  28627c:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  286280:	0f 84 65 02 00 00    	je     2864eb <hrb_api+0xa06>
				reg[7] = (int) fh;
  286286:	8b 45 dc             	mov    -0x24(%ebp),%eax
  286289:	8d 50 1c             	lea    0x1c(%eax),%edx
  28628c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28628f:	89 02                	mov    %eax,(%edx)
				fh->size = finfo->size;
  286291:	8b 45 d0             	mov    -0x30(%ebp),%eax
  286294:	8b 40 1c             	mov    0x1c(%eax),%eax
  286297:	89 c2                	mov    %eax,%edx
  286299:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28629c:	89 50 04             	mov    %edx,0x4(%eax)
				fh->pos = 0;
  28629f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2862a2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
				fh->buf = file_loadfile2(finfo->clustno, &fh->size, task->fat);
  2862a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2862ac:	8b 90 b4 00 00 00    	mov    0xb4(%eax),%edx
  2862b2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2862b5:	8d 48 04             	lea    0x4(%eax),%ecx
  2862b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2862bb:	0f b7 40 1a          	movzwl 0x1a(%eax),%eax
  2862bf:	0f b7 c0             	movzwl %ax,%eax
  2862c2:	83 ec 04             	sub    $0x4,%esp
  2862c5:	52                   	push   %edx
  2862c6:	51                   	push   %ecx
  2862c7:	50                   	push   %eax
  2862c8:	e8 f6 06 00 00       	call   2869c3 <file_loadfile2>
  2862cd:	83 c4 10             	add    $0x10,%esp
  2862d0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  2862d3:	89 02                	mov    %eax,(%edx)
  2862d5:	e9 11 02 00 00       	jmp    2864eb <hrb_api+0xa06>
			}
		}
	} else if (edx == 22) {
  2862da:	83 7d 1c 16          	cmpl   $0x16,0x1c(%ebp)
  2862de:	75 31                	jne    286311 <hrb_api+0x82c>
		fh = (struct FILEHANDLE *) eax;
  2862e0:	8b 45 24             	mov    0x24(%ebp),%eax
  2862e3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
		memman_free_4k(memman, (int) fh->buf, fh->size);
  2862e6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2862e9:	8b 40 04             	mov    0x4(%eax),%eax
  2862ec:	89 c2                	mov    %eax,%edx
  2862ee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2862f1:	8b 00                	mov    (%eax),%eax
  2862f3:	83 ec 04             	sub    $0x4,%esp
  2862f6:	52                   	push   %edx
  2862f7:	50                   	push   %eax
  2862f8:	ff 75 d8             	pushl  -0x28(%ebp)
  2862fb:	e8 24 c6 ff ff       	call   282924 <memman_free_4k>
  286300:	83 c4 10             	add    $0x10,%esp
		fh->buf = 0;
  286303:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  286306:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  28630c:	e9 da 01 00 00       	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 23) {
  286311:	83 7d 1c 17          	cmpl   $0x17,0x1c(%ebp)
  286315:	0f 85 80 00 00 00    	jne    28639b <hrb_api+0x8b6>
		fh = (struct FILEHANDLE *) eax;
  28631b:	8b 45 24             	mov    0x24(%ebp),%eax
  28631e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
		if (ecx == 0) {
  286321:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
  286325:	75 0b                	jne    286332 <hrb_api+0x84d>
			fh->pos = ebx;
  286327:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28632a:	8b 55 18             	mov    0x18(%ebp),%edx
  28632d:	89 50 08             	mov    %edx,0x8(%eax)
  286330:	eb 30                	jmp    286362 <hrb_api+0x87d>
		} else if (ecx == 1) {
  286332:	83 7d 20 01          	cmpl   $0x1,0x20(%ebp)
  286336:	75 13                	jne    28634b <hrb_api+0x866>
			fh->pos += ebx;
  286338:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28633b:	8b 50 08             	mov    0x8(%eax),%edx
  28633e:	8b 45 18             	mov    0x18(%ebp),%eax
  286341:	01 c2                	add    %eax,%edx
  286343:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  286346:	89 50 08             	mov    %edx,0x8(%eax)
  286349:	eb 17                	jmp    286362 <hrb_api+0x87d>
		} else if (ecx == 2) {
  28634b:	83 7d 20 02          	cmpl   $0x2,0x20(%ebp)
  28634f:	75 11                	jne    286362 <hrb_api+0x87d>
			fh->pos = fh->size + ebx;
  286351:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  286354:	8b 50 04             	mov    0x4(%eax),%edx
  286357:	8b 45 18             	mov    0x18(%ebp),%eax
  28635a:	01 c2                	add    %eax,%edx
  28635c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28635f:	89 50 08             	mov    %edx,0x8(%eax)
		}
		if (fh->pos < 0) {
  286362:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  286365:	8b 40 08             	mov    0x8(%eax),%eax
  286368:	85 c0                	test   %eax,%eax
  28636a:	79 0a                	jns    286376 <hrb_api+0x891>
			fh->pos = 0;
  28636c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28636f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
		}
		if (fh->pos > fh->size) {
  286376:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  286379:	8b 50 08             	mov    0x8(%eax),%edx
  28637c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28637f:	8b 40 04             	mov    0x4(%eax),%eax
  286382:	39 c2                	cmp    %eax,%edx
  286384:	0f 8e 61 01 00 00    	jle    2864eb <hrb_api+0xa06>
			fh->pos = fh->size;
  28638a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28638d:	8b 50 04             	mov    0x4(%eax),%edx
  286390:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  286393:	89 50 08             	mov    %edx,0x8(%eax)
  286396:	e9 50 01 00 00       	jmp    2864eb <hrb_api+0xa06>
		}
	} else if (edx == 24) {
  28639b:	83 7d 1c 18          	cmpl   $0x18,0x1c(%ebp)
  28639f:	75 5f                	jne    286400 <hrb_api+0x91b>
		fh = (struct FILEHANDLE *) eax;
  2863a1:	8b 45 24             	mov    0x24(%ebp),%eax
  2863a4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
		if (ecx == 0) {
  2863a7:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
  2863ab:	75 13                	jne    2863c0 <hrb_api+0x8db>
			reg[7] = fh->size;
  2863ad:	8b 45 dc             	mov    -0x24(%ebp),%eax
  2863b0:	8d 50 1c             	lea    0x1c(%eax),%edx
  2863b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2863b6:	8b 40 04             	mov    0x4(%eax),%eax
  2863b9:	89 02                	mov    %eax,(%edx)
  2863bb:	e9 2b 01 00 00       	jmp    2864eb <hrb_api+0xa06>
		} else if (ecx == 1) {
  2863c0:	83 7d 20 01          	cmpl   $0x1,0x20(%ebp)
  2863c4:	75 13                	jne    2863d9 <hrb_api+0x8f4>
			reg[7] = fh->pos;
  2863c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  2863c9:	8d 50 1c             	lea    0x1c(%eax),%edx
  2863cc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2863cf:	8b 40 08             	mov    0x8(%eax),%eax
  2863d2:	89 02                	mov    %eax,(%edx)
  2863d4:	e9 12 01 00 00       	jmp    2864eb <hrb_api+0xa06>
		} else if (ecx == 2) {
  2863d9:	83 7d 20 02          	cmpl   $0x2,0x20(%ebp)
  2863dd:	0f 85 08 01 00 00    	jne    2864eb <hrb_api+0xa06>
			reg[7] = fh->pos - fh->size;
  2863e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2863e6:	8b 48 08             	mov    0x8(%eax),%ecx
  2863e9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2863ec:	8b 50 04             	mov    0x4(%eax),%edx
  2863ef:	8b 45 dc             	mov    -0x24(%ebp),%eax
  2863f2:	83 c0 1c             	add    $0x1c,%eax
  2863f5:	29 d1                	sub    %edx,%ecx
  2863f7:	89 ca                	mov    %ecx,%edx
  2863f9:	89 10                	mov    %edx,(%eax)
  2863fb:	e9 eb 00 00 00       	jmp    2864eb <hrb_api+0xa06>
		}
	} else if (edx == 25) {
  286400:	83 7d 1c 19          	cmpl   $0x19,0x1c(%ebp)
  286404:	75 69                	jne    28646f <hrb_api+0x98a>
		fh = (struct FILEHANDLE *) eax;
  286406:	8b 45 24             	mov    0x24(%ebp),%eax
  286409:	89 45 d4             	mov    %eax,-0x2c(%ebp)
		for (i = 0; i < ecx; i++) {
  28640c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  286413:	eb 42                	jmp    286457 <hrb_api+0x972>
			if (fh->pos == fh->size) {
  286415:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  286418:	8b 50 08             	mov    0x8(%eax),%edx
  28641b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28641e:	8b 40 04             	mov    0x4(%eax),%eax
  286421:	39 c2                	cmp    %eax,%edx
  286423:	74 3c                	je     286461 <hrb_api+0x97c>
				break;
			}
			*((char *) ebx + ds_base + i) = fh->buf[fh->pos];
  286425:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  286428:	8b 10                	mov    (%eax),%edx
  28642a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  28642d:	8b 40 08             	mov    0x8(%eax),%eax
  286430:	01 d0                	add    %edx,%eax
  286432:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  286435:	8b 55 18             	mov    0x18(%ebp),%edx
  286438:	01 d1                	add    %edx,%ecx
  28643a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  28643d:	01 ca                	add    %ecx,%edx
  28643f:	0f b6 00             	movzbl (%eax),%eax
  286442:	88 02                	mov    %al,(%edx)
			fh->pos++;
  286444:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  286447:	8b 40 08             	mov    0x8(%eax),%eax
  28644a:	8d 50 01             	lea    0x1(%eax),%edx
  28644d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  286450:	89 50 08             	mov    %edx,0x8(%eax)
		for (i = 0; i < ecx; i++) {
  286453:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  286457:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28645a:	3b 45 20             	cmp    0x20(%ebp),%eax
  28645d:	7c b6                	jl     286415 <hrb_api+0x930>
  28645f:	eb 01                	jmp    286462 <hrb_api+0x97d>
				break;
  286461:	90                   	nop
		}
		reg[7] = i;
  286462:	8b 45 dc             	mov    -0x24(%ebp),%eax
  286465:	8d 50 1c             	lea    0x1c(%eax),%edx
  286468:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28646b:	89 02                	mov    %eax,(%edx)
  28646d:	eb 7c                	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 26) {
  28646f:	83 7d 1c 1a          	cmpl   $0x1a,0x1c(%ebp)
  286473:	75 5b                	jne    2864d0 <hrb_api+0x9eb>
		i = 0;
  286475:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
		for (;;) {
			*((char *) ebx + ds_base + i) =  task->cmdline[i];
  28647c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28647f:	8b 90 b8 00 00 00    	mov    0xb8(%eax),%edx
  286485:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286488:	01 d0                	add    %edx,%eax
  28648a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  28648d:	8b 55 18             	mov    0x18(%ebp),%edx
  286490:	01 d1                	add    %edx,%ecx
  286492:	8b 55 f4             	mov    -0xc(%ebp),%edx
  286495:	01 ca                	add    %ecx,%edx
  286497:	0f b6 00             	movzbl (%eax),%eax
  28649a:	88 02                	mov    %al,(%edx)
			if (task->cmdline[i] == 0) {
  28649c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28649f:	8b 90 b8 00 00 00    	mov    0xb8(%eax),%edx
  2864a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2864a8:	01 d0                	add    %edx,%eax
  2864aa:	0f b6 00             	movzbl (%eax),%eax
  2864ad:	84 c0                	test   %al,%al
  2864af:	74 0e                	je     2864bf <hrb_api+0x9da>
				break;
			}
			if (i >= ecx) {
  2864b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2864b4:	3b 45 20             	cmp    0x20(%ebp),%eax
  2864b7:	7d 09                	jge    2864c2 <hrb_api+0x9dd>
				break;
			}
			i++;
  2864b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
			*((char *) ebx + ds_base + i) =  task->cmdline[i];
  2864bd:	eb bd                	jmp    28647c <hrb_api+0x997>
				break;
  2864bf:	90                   	nop
  2864c0:	eb 01                	jmp    2864c3 <hrb_api+0x9de>
				break;
  2864c2:	90                   	nop
		}
		reg[7] = i;
  2864c3:	8b 45 dc             	mov    -0x24(%ebp),%eax
  2864c6:	8d 50 1c             	lea    0x1c(%eax),%edx
  2864c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2864cc:	89 02                	mov    %eax,(%edx)
  2864ce:	eb 1b                	jmp    2864eb <hrb_api+0xa06>
	} else if (edx == 27) {
  2864d0:	83 7d 1c 1b          	cmpl   $0x1b,0x1c(%ebp)
  2864d4:	75 15                	jne    2864eb <hrb_api+0xa06>
		reg[7] = task->langmode;
  2864d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2864d9:	0f b6 80 bc 00 00 00 	movzbl 0xbc(%eax),%eax
  2864e0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  2864e3:	83 c2 1c             	add    $0x1c,%edx
  2864e6:	0f b6 c0             	movzbl %al,%eax
  2864e9:	89 02                	mov    %eax,(%edx)
	}
	return 0;
  2864eb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  2864f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  2864f3:	c9                   	leave  
  2864f4:	c3                   	ret    

002864f5 <inthandler0c>:

int *inthandler0c(int *esp)
{
  2864f5:	f3 0f 1e fb          	endbr32 
  2864f9:	55                   	push   %ebp
  2864fa:	89 e5                	mov    %esp,%ebp
  2864fc:	83 ec 38             	sub    $0x38,%esp
	struct TASK *task = task_now();
  2864ff:	e8 a3 d7 ff ff       	call   283ca7 <task_now>
  286504:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct CONSOLE *cons = task->cons;
  286507:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28650a:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
  286510:	89 45 f0             	mov    %eax,-0x10(%ebp)
	char s[30];
	cons_putstr0(cons, "\nINT 0C :\n Stack Exception.\n");
  286513:	83 ec 08             	sub    $0x8,%esp
  286516:	68 08 14 31 00       	push   $0x311408
  28651b:	ff 75 f0             	pushl  -0x10(%ebp)
  28651e:	e8 6c eb ff ff       	call   28508f <cons_putstr0>
  286523:	83 c4 10             	add    $0x10,%esp
	sprintf(s, "EIP = %08X\n", esp[11]);
  286526:	8b 45 08             	mov    0x8(%ebp),%eax
  286529:	83 c0 2c             	add    $0x2c,%eax
  28652c:	8b 00                	mov    (%eax),%eax
  28652e:	83 ec 04             	sub    $0x4,%esp
  286531:	50                   	push   %eax
  286532:	68 25 14 31 00       	push   $0x311425
  286537:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  28653a:	50                   	push   %eax
  28653b:	e8 39 22 00 00       	call   288779 <sprintf>
  286540:	83 c4 10             	add    $0x10,%esp
	cons_putstr0(cons, s);
  286543:	83 ec 08             	sub    $0x8,%esp
  286546:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  286549:	50                   	push   %eax
  28654a:	ff 75 f0             	pushl  -0x10(%ebp)
  28654d:	e8 3d eb ff ff       	call   28508f <cons_putstr0>
  286552:	83 c4 10             	add    $0x10,%esp
	return &(task->tss.esp0);	/* ÔøΩŸèÔøΩIÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ */
  286555:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286558:	83 c0 30             	add    $0x30,%eax
}
  28655b:	c9                   	leave  
  28655c:	c3                   	ret    

0028655d <inthandler0d>:

int *inthandler0d(int *esp)
{
  28655d:	f3 0f 1e fb          	endbr32 
  286561:	55                   	push   %ebp
  286562:	89 e5                	mov    %esp,%ebp
  286564:	83 ec 38             	sub    $0x38,%esp
	struct TASK *task = task_now();
  286567:	e8 3b d7 ff ff       	call   283ca7 <task_now>
  28656c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct CONSOLE *cons = task->cons;
  28656f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286572:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
  286578:	89 45 f0             	mov    %eax,-0x10(%ebp)
	char s[30];
	cons_putstr0(cons, "\nINT 0D :\n General Protected Exception.\n");
  28657b:	83 ec 08             	sub    $0x8,%esp
  28657e:	68 34 14 31 00       	push   $0x311434
  286583:	ff 75 f0             	pushl  -0x10(%ebp)
  286586:	e8 04 eb ff ff       	call   28508f <cons_putstr0>
  28658b:	83 c4 10             	add    $0x10,%esp
	sprintf(s, "EIP = %08X\n", esp[11]);
  28658e:	8b 45 08             	mov    0x8(%ebp),%eax
  286591:	83 c0 2c             	add    $0x2c,%eax
  286594:	8b 00                	mov    (%eax),%eax
  286596:	83 ec 04             	sub    $0x4,%esp
  286599:	50                   	push   %eax
  28659a:	68 25 14 31 00       	push   $0x311425
  28659f:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  2865a2:	50                   	push   %eax
  2865a3:	e8 d1 21 00 00       	call   288779 <sprintf>
  2865a8:	83 c4 10             	add    $0x10,%esp
	cons_putstr0(cons, s);
  2865ab:	83 ec 08             	sub    $0x8,%esp
  2865ae:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  2865b1:	50                   	push   %eax
  2865b2:	ff 75 f0             	pushl  -0x10(%ebp)
  2865b5:	e8 d5 ea ff ff       	call   28508f <cons_putstr0>
  2865ba:	83 c4 10             	add    $0x10,%esp
	return &(task->tss.esp0);	/* ÔøΩŸèÔøΩIÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩÔøΩ */
  2865bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2865c0:	83 c0 30             	add    $0x30,%eax
}
  2865c3:	c9                   	leave  
  2865c4:	c3                   	ret    

002865c5 <hrb_api_linewin>:

void hrb_api_linewin(struct SHEET *sht, int x0, int y0, int x1, int y1, int col)
{
  2865c5:	f3 0f 1e fb          	endbr32 
  2865c9:	55                   	push   %ebp
  2865ca:	89 e5                	mov    %esp,%ebp
  2865cc:	83 ec 20             	sub    $0x20,%esp
	int i, x, y, len, dx, dy;

	dx = x1 - x0;
  2865cf:	8b 45 14             	mov    0x14(%ebp),%eax
  2865d2:	2b 45 0c             	sub    0xc(%ebp),%eax
  2865d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
	dy = y1 - y0;
  2865d8:	8b 45 18             	mov    0x18(%ebp),%eax
  2865db:	2b 45 10             	sub    0x10(%ebp),%eax
  2865de:	89 45 e8             	mov    %eax,-0x18(%ebp)
	x = x0 << 10;
  2865e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  2865e4:	c1 e0 0a             	shl    $0xa,%eax
  2865e7:	89 45 f8             	mov    %eax,-0x8(%ebp)
	y = y0 << 10;
  2865ea:	8b 45 10             	mov    0x10(%ebp),%eax
  2865ed:	c1 e0 0a             	shl    $0xa,%eax
  2865f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (dx < 0) {
  2865f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  2865f7:	79 03                	jns    2865fc <hrb_api_linewin+0x37>
		dx = - dx;
  2865f9:	f7 5d ec             	negl   -0x14(%ebp)
	}
	if (dy < 0) {
  2865fc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  286600:	79 03                	jns    286605 <hrb_api_linewin+0x40>
		dy = - dy;
  286602:	f7 5d e8             	negl   -0x18(%ebp)
	}
	if (dx >= dy) {
  286605:	8b 45 ec             	mov    -0x14(%ebp),%eax
  286608:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  28660b:	7c 53                	jl     286660 <hrb_api_linewin+0x9b>
		len = dx + 1;
  28660d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  286610:	83 c0 01             	add    $0x1,%eax
  286613:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (x0 > x1) {
  286616:	8b 45 0c             	mov    0xc(%ebp),%eax
  286619:	3b 45 14             	cmp    0x14(%ebp),%eax
  28661c:	7e 09                	jle    286627 <hrb_api_linewin+0x62>
			dx = -1024;
  28661e:	c7 45 ec 00 fc ff ff 	movl   $0xfffffc00,-0x14(%ebp)
  286625:	eb 07                	jmp    28662e <hrb_api_linewin+0x69>
		} else {
			dx =  1024;
  286627:	c7 45 ec 00 04 00 00 	movl   $0x400,-0x14(%ebp)
		}
		if (y0 <= y1) {
  28662e:	8b 45 10             	mov    0x10(%ebp),%eax
  286631:	3b 45 18             	cmp    0x18(%ebp),%eax
  286634:	7f 15                	jg     28664b <hrb_api_linewin+0x86>
			dy = ((y1 - y0 + 1) << 10) / len;
  286636:	8b 45 18             	mov    0x18(%ebp),%eax
  286639:	2b 45 10             	sub    0x10(%ebp),%eax
  28663c:	83 c0 01             	add    $0x1,%eax
  28663f:	c1 e0 0a             	shl    $0xa,%eax
  286642:	99                   	cltd   
  286643:	f7 7d f0             	idivl  -0x10(%ebp)
  286646:	89 45 e8             	mov    %eax,-0x18(%ebp)
  286649:	eb 66                	jmp    2866b1 <hrb_api_linewin+0xec>
		} else {
			dy = ((y1 - y0 - 1) << 10) / len;
  28664b:	8b 45 18             	mov    0x18(%ebp),%eax
  28664e:	2b 45 10             	sub    0x10(%ebp),%eax
  286651:	83 e8 01             	sub    $0x1,%eax
  286654:	c1 e0 0a             	shl    $0xa,%eax
  286657:	99                   	cltd   
  286658:	f7 7d f0             	idivl  -0x10(%ebp)
  28665b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  28665e:	eb 51                	jmp    2866b1 <hrb_api_linewin+0xec>
		}
	} else {
		len = dy + 1;
  286660:	8b 45 e8             	mov    -0x18(%ebp),%eax
  286663:	83 c0 01             	add    $0x1,%eax
  286666:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (y0 > y1) {
  286669:	8b 45 10             	mov    0x10(%ebp),%eax
  28666c:	3b 45 18             	cmp    0x18(%ebp),%eax
  28666f:	7e 09                	jle    28667a <hrb_api_linewin+0xb5>
			dy = -1024;
  286671:	c7 45 e8 00 fc ff ff 	movl   $0xfffffc00,-0x18(%ebp)
  286678:	eb 07                	jmp    286681 <hrb_api_linewin+0xbc>
		} else {
			dy =  1024;
  28667a:	c7 45 e8 00 04 00 00 	movl   $0x400,-0x18(%ebp)
		}
		if (x0 <= x1) {
  286681:	8b 45 0c             	mov    0xc(%ebp),%eax
  286684:	3b 45 14             	cmp    0x14(%ebp),%eax
  286687:	7f 15                	jg     28669e <hrb_api_linewin+0xd9>
			dx = ((x1 - x0 + 1) << 10) / len;
  286689:	8b 45 14             	mov    0x14(%ebp),%eax
  28668c:	2b 45 0c             	sub    0xc(%ebp),%eax
  28668f:	83 c0 01             	add    $0x1,%eax
  286692:	c1 e0 0a             	shl    $0xa,%eax
  286695:	99                   	cltd   
  286696:	f7 7d f0             	idivl  -0x10(%ebp)
  286699:	89 45 ec             	mov    %eax,-0x14(%ebp)
  28669c:	eb 13                	jmp    2866b1 <hrb_api_linewin+0xec>
		} else {
			dx = ((x1 - x0 - 1) << 10) / len;
  28669e:	8b 45 14             	mov    0x14(%ebp),%eax
  2866a1:	2b 45 0c             	sub    0xc(%ebp),%eax
  2866a4:	83 e8 01             	sub    $0x1,%eax
  2866a7:	c1 e0 0a             	shl    $0xa,%eax
  2866aa:	99                   	cltd   
  2866ab:	f7 7d f0             	idivl  -0x10(%ebp)
  2866ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
		}
	}

	for (i = 0; i < len; i++) {
  2866b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2866b8:	eb 35                	jmp    2866ef <hrb_api_linewin+0x12a>
		sht->buf[(y >> 10) * sht->bxsize + (x >> 10)] = col;
  2866ba:	8b 45 08             	mov    0x8(%ebp),%eax
  2866bd:	8b 10                	mov    (%eax),%edx
  2866bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2866c2:	c1 f8 0a             	sar    $0xa,%eax
  2866c5:	89 c1                	mov    %eax,%ecx
  2866c7:	8b 45 08             	mov    0x8(%ebp),%eax
  2866ca:	8b 40 04             	mov    0x4(%eax),%eax
  2866cd:	0f af c1             	imul   %ecx,%eax
  2866d0:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  2866d3:	c1 f9 0a             	sar    $0xa,%ecx
  2866d6:	01 c8                	add    %ecx,%eax
  2866d8:	01 d0                	add    %edx,%eax
  2866da:	8b 55 1c             	mov    0x1c(%ebp),%edx
  2866dd:	88 10                	mov    %dl,(%eax)
		x += dx;
  2866df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2866e2:	01 45 f8             	add    %eax,-0x8(%ebp)
		y += dy;
  2866e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2866e8:	01 45 f4             	add    %eax,-0xc(%ebp)
	for (i = 0; i < len; i++) {
  2866eb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  2866ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2866f2:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  2866f5:	7c c3                	jl     2866ba <hrb_api_linewin+0xf5>
	}

	return;
  2866f7:	90                   	nop
}
  2866f8:	c9                   	leave  
  2866f9:	c3                   	ret    

002866fa <file_readfat>:

#include "bootpack.h"

void file_readfat(int *fat, unsigned char *img)
/* ÉfÉBÉXÉNÉCÉÅÅ[ÉWì‡ÇÃFATÇÃà≥èkÇÇ∆Ç≠ */
{
  2866fa:	f3 0f 1e fb          	endbr32 
  2866fe:	55                   	push   %ebp
  2866ff:	89 e5                	mov    %esp,%ebp
  286701:	83 ec 10             	sub    $0x10,%esp
	int i, j = 0;
  286704:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
	for (i = 0; i < 2880; i += 2) {
  28670b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  286712:	e9 87 00 00 00       	jmp    28679e <file_readfat+0xa4>
		fat[i + 0] = (img[j + 0]      | img[j + 1] << 8) & 0xfff;
  286717:	8b 55 f8             	mov    -0x8(%ebp),%edx
  28671a:	8b 45 0c             	mov    0xc(%ebp),%eax
  28671d:	01 d0                	add    %edx,%eax
  28671f:	0f b6 00             	movzbl (%eax),%eax
  286722:	0f b6 c0             	movzbl %al,%eax
  286725:	8b 55 f8             	mov    -0x8(%ebp),%edx
  286728:	8d 4a 01             	lea    0x1(%edx),%ecx
  28672b:	8b 55 0c             	mov    0xc(%ebp),%edx
  28672e:	01 ca                	add    %ecx,%edx
  286730:	0f b6 12             	movzbl (%edx),%edx
  286733:	0f b6 d2             	movzbl %dl,%edx
  286736:	c1 e2 08             	shl    $0x8,%edx
  286739:	09 c2                	or     %eax,%edx
  28673b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  28673e:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  286745:	8b 45 08             	mov    0x8(%ebp),%eax
  286748:	01 c8                	add    %ecx,%eax
  28674a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  286750:	89 10                	mov    %edx,(%eax)
		fat[i + 1] = (img[j + 1] >> 4 | img[j + 2] << 4) & 0xfff;
  286752:	8b 45 f8             	mov    -0x8(%ebp),%eax
  286755:	8d 50 01             	lea    0x1(%eax),%edx
  286758:	8b 45 0c             	mov    0xc(%ebp),%eax
  28675b:	01 d0                	add    %edx,%eax
  28675d:	0f b6 00             	movzbl (%eax),%eax
  286760:	c0 e8 04             	shr    $0x4,%al
  286763:	0f b6 c0             	movzbl %al,%eax
  286766:	8b 55 f8             	mov    -0x8(%ebp),%edx
  286769:	8d 4a 02             	lea    0x2(%edx),%ecx
  28676c:	8b 55 0c             	mov    0xc(%ebp),%edx
  28676f:	01 ca                	add    %ecx,%edx
  286771:	0f b6 12             	movzbl (%edx),%edx
  286774:	0f b6 d2             	movzbl %dl,%edx
  286777:	c1 e2 04             	shl    $0x4,%edx
  28677a:	09 c2                	or     %eax,%edx
  28677c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  28677f:	83 c0 01             	add    $0x1,%eax
  286782:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  286789:	8b 45 08             	mov    0x8(%ebp),%eax
  28678c:	01 c8                	add    %ecx,%eax
  28678e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  286794:	89 10                	mov    %edx,(%eax)
		j += 3;
  286796:	83 45 f8 03          	addl   $0x3,-0x8(%ebp)
	for (i = 0; i < 2880; i += 2) {
  28679a:	83 45 fc 02          	addl   $0x2,-0x4(%ebp)
  28679e:	81 7d fc 3f 0b 00 00 	cmpl   $0xb3f,-0x4(%ebp)
  2867a5:	0f 8e 6c ff ff ff    	jle    286717 <file_readfat+0x1d>
	}
	return;
  2867ab:	90                   	nop
}
  2867ac:	c9                   	leave  
  2867ad:	c3                   	ret    

002867ae <file_loadfile>:

void file_loadfile(int clustno, int size, char *buf, int *fat, char *img)
{
  2867ae:	f3 0f 1e fb          	endbr32 
  2867b2:	55                   	push   %ebp
  2867b3:	89 e5                	mov    %esp,%ebp
  2867b5:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (;;) {
		if (size <= 512) {
  2867b8:	81 7d 0c 00 02 00 00 	cmpl   $0x200,0xc(%ebp)
  2867bf:	7f 38                	jg     2867f9 <file_loadfile+0x4b>
			for (i = 0; i < size; i++) {
  2867c1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2867c8:	eb 25                	jmp    2867ef <file_loadfile+0x41>
				buf[i] = img[clustno * 512 + i];
  2867ca:	8b 45 08             	mov    0x8(%ebp),%eax
  2867cd:	c1 e0 09             	shl    $0x9,%eax
  2867d0:	89 c2                	mov    %eax,%edx
  2867d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2867d5:	01 d0                	add    %edx,%eax
  2867d7:	89 c2                	mov    %eax,%edx
  2867d9:	8b 45 18             	mov    0x18(%ebp),%eax
  2867dc:	01 d0                	add    %edx,%eax
  2867de:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  2867e1:	8b 55 10             	mov    0x10(%ebp),%edx
  2867e4:	01 ca                	add    %ecx,%edx
  2867e6:	0f b6 00             	movzbl (%eax),%eax
  2867e9:	88 02                	mov    %al,(%edx)
			for (i = 0; i < size; i++) {
  2867eb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  2867ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2867f2:	3b 45 0c             	cmp    0xc(%ebp),%eax
  2867f5:	7c d3                	jl     2867ca <file_loadfile+0x1c>
			}
			break;
  2867f7:	eb 5e                	jmp    286857 <file_loadfile+0xa9>
		}
		for (i = 0; i < 512; i++) {
  2867f9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  286800:	eb 25                	jmp    286827 <file_loadfile+0x79>
			buf[i] = img[clustno * 512 + i];
  286802:	8b 45 08             	mov    0x8(%ebp),%eax
  286805:	c1 e0 09             	shl    $0x9,%eax
  286808:	89 c2                	mov    %eax,%edx
  28680a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  28680d:	01 d0                	add    %edx,%eax
  28680f:	89 c2                	mov    %eax,%edx
  286811:	8b 45 18             	mov    0x18(%ebp),%eax
  286814:	01 d0                	add    %edx,%eax
  286816:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  286819:	8b 55 10             	mov    0x10(%ebp),%edx
  28681c:	01 ca                	add    %ecx,%edx
  28681e:	0f b6 00             	movzbl (%eax),%eax
  286821:	88 02                	mov    %al,(%edx)
		for (i = 0; i < 512; i++) {
  286823:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  286827:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%ebp)
  28682e:	7e d2                	jle    286802 <file_loadfile+0x54>
		}
		size -= 512;
  286830:	81 6d 0c 00 02 00 00 	subl   $0x200,0xc(%ebp)
		buf += 512;
  286837:	81 45 10 00 02 00 00 	addl   $0x200,0x10(%ebp)
		clustno = fat[clustno];
  28683e:	8b 45 08             	mov    0x8(%ebp),%eax
  286841:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  286848:	8b 45 14             	mov    0x14(%ebp),%eax
  28684b:	01 d0                	add    %edx,%eax
  28684d:	8b 00                	mov    (%eax),%eax
  28684f:	89 45 08             	mov    %eax,0x8(%ebp)
		if (size <= 512) {
  286852:	e9 61 ff ff ff       	jmp    2867b8 <file_loadfile+0xa>
	}
	return;
  286857:	90                   	nop
}
  286858:	c9                   	leave  
  286859:	c3                   	ret    

0028685a <file_search>:

struct FILEINFO *file_search(char *name, struct FILEINFO *finfo, int max)
{
  28685a:	f3 0f 1e fb          	endbr32 
  28685e:	55                   	push   %ebp
  28685f:	89 e5                	mov    %esp,%ebp
  286861:	83 ec 20             	sub    $0x20,%esp
	int i, j;
	char s[12];
	for (j = 0; j < 11; j++) {
  286864:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  28686b:	eb 0f                	jmp    28687c <file_search+0x22>
		s[j] = ' ';
  28686d:	8d 55 ec             	lea    -0x14(%ebp),%edx
  286870:	8b 45 f8             	mov    -0x8(%ebp),%eax
  286873:	01 d0                	add    %edx,%eax
  286875:	c6 00 20             	movb   $0x20,(%eax)
	for (j = 0; j < 11; j++) {
  286878:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  28687c:	83 7d f8 0a          	cmpl   $0xa,-0x8(%ebp)
  286880:	7e eb                	jle    28686d <file_search+0x13>
	}
	j = 0;
  286882:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
	for (i = 0; name[i] != 0; i++) {
  286889:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  286890:	e9 83 00 00 00       	jmp    286918 <file_search+0xbe>
		if (j >= 11) { return 0; /* å©Ç¬Ç©ÇÁÇ»Ç©Ç¡ÇΩ */ }
  286895:	83 7d f8 0a          	cmpl   $0xa,-0x8(%ebp)
  286899:	7e 0a                	jle    2868a5 <file_search+0x4b>
  28689b:	b8 00 00 00 00       	mov    $0x0,%eax
  2868a0:	e9 1c 01 00 00       	jmp    2869c1 <file_search+0x167>
		if (name[i] == '.' && j <= 8) {
  2868a5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2868a8:	8b 45 08             	mov    0x8(%ebp),%eax
  2868ab:	01 d0                	add    %edx,%eax
  2868ad:	0f b6 00             	movzbl (%eax),%eax
  2868b0:	3c 2e                	cmp    $0x2e,%al
  2868b2:	75 0f                	jne    2868c3 <file_search+0x69>
  2868b4:	83 7d f8 08          	cmpl   $0x8,-0x8(%ebp)
  2868b8:	7f 09                	jg     2868c3 <file_search+0x69>
			j = 8;
  2868ba:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%ebp)
  2868c1:	eb 51                	jmp    286914 <file_search+0xba>
		} else {
			s[j] = name[i];
  2868c3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2868c6:	8b 45 08             	mov    0x8(%ebp),%eax
  2868c9:	01 d0                	add    %edx,%eax
  2868cb:	0f b6 00             	movzbl (%eax),%eax
  2868ce:	8d 4d ec             	lea    -0x14(%ebp),%ecx
  2868d1:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2868d4:	01 ca                	add    %ecx,%edx
  2868d6:	88 02                	mov    %al,(%edx)
			if ('a' <= s[j] && s[j] <= 'z') {
  2868d8:	8d 55 ec             	lea    -0x14(%ebp),%edx
  2868db:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2868de:	01 d0                	add    %edx,%eax
  2868e0:	0f b6 00             	movzbl (%eax),%eax
  2868e3:	3c 60                	cmp    $0x60,%al
  2868e5:	7e 29                	jle    286910 <file_search+0xb6>
  2868e7:	8d 55 ec             	lea    -0x14(%ebp),%edx
  2868ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2868ed:	01 d0                	add    %edx,%eax
  2868ef:	0f b6 00             	movzbl (%eax),%eax
  2868f2:	3c 7a                	cmp    $0x7a,%al
  2868f4:	7f 1a                	jg     286910 <file_search+0xb6>
				/* è¨ï∂éöÇÕëÂï∂éöÇ…íºÇ∑ */
				s[j] -= 0x20;
  2868f6:	8d 55 ec             	lea    -0x14(%ebp),%edx
  2868f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2868fc:	01 d0                	add    %edx,%eax
  2868fe:	0f b6 00             	movzbl (%eax),%eax
  286901:	83 e8 20             	sub    $0x20,%eax
  286904:	89 c1                	mov    %eax,%ecx
  286906:	8d 55 ec             	lea    -0x14(%ebp),%edx
  286909:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28690c:	01 d0                	add    %edx,%eax
  28690e:	88 08                	mov    %cl,(%eax)
			} 
			j++;
  286910:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
	for (i = 0; name[i] != 0; i++) {
  286914:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  286918:	8b 55 fc             	mov    -0x4(%ebp),%edx
  28691b:	8b 45 08             	mov    0x8(%ebp),%eax
  28691e:	01 d0                	add    %edx,%eax
  286920:	0f b6 00             	movzbl (%eax),%eax
  286923:	84 c0                	test   %al,%al
  286925:	0f 85 6a ff ff ff    	jne    286895 <file_search+0x3b>
		}
	}
	for (i = 0; i < max; ) {
  28692b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  286932:	eb 79                	jmp    2869ad <file_search+0x153>
		if (finfo->name[0] == 0x00) {
  286934:	8b 45 0c             	mov    0xc(%ebp),%eax
  286937:	0f b6 00             	movzbl (%eax),%eax
  28693a:	84 c0                	test   %al,%al
  28693c:	74 7d                	je     2869bb <file_search+0x161>
			break;
		}
		if ((finfo[i].type & 0x18) == 0) {
  28693e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  286941:	c1 e0 05             	shl    $0x5,%eax
  286944:	89 c2                	mov    %eax,%edx
  286946:	8b 45 0c             	mov    0xc(%ebp),%eax
  286949:	01 d0                	add    %edx,%eax
  28694b:	0f b6 40 0b          	movzbl 0xb(%eax),%eax
  28694f:	0f b6 c0             	movzbl %al,%eax
  286952:	83 e0 18             	and    $0x18,%eax
  286955:	85 c0                	test   %eax,%eax
  286957:	75 4c                	jne    2869a5 <file_search+0x14b>
			for (j = 0; j < 11; j++) {
  286959:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  286960:	eb 2e                	jmp    286990 <file_search+0x136>
				if (finfo[i].name[j] != s[j]) {
  286962:	8b 45 fc             	mov    -0x4(%ebp),%eax
  286965:	c1 e0 05             	shl    $0x5,%eax
  286968:	89 c2                	mov    %eax,%edx
  28696a:	8b 45 0c             	mov    0xc(%ebp),%eax
  28696d:	01 c2                	add    %eax,%edx
  28696f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  286972:	01 d0                	add    %edx,%eax
  286974:	0f b6 00             	movzbl (%eax),%eax
  286977:	0f b6 d0             	movzbl %al,%edx
  28697a:	8d 4d ec             	lea    -0x14(%ebp),%ecx
  28697d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  286980:	01 c8                	add    %ecx,%eax
  286982:	0f b6 00             	movzbl (%eax),%eax
  286985:	0f be c0             	movsbl %al,%eax
  286988:	39 c2                	cmp    %eax,%edx
  28698a:	75 1c                	jne    2869a8 <file_search+0x14e>
			for (j = 0; j < 11; j++) {
  28698c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  286990:	83 7d f8 0a          	cmpl   $0xa,-0x8(%ebp)
  286994:	7e cc                	jle    286962 <file_search+0x108>
					goto next;
				}
			}
			return finfo + i; /* ÉtÉ@ÉCÉãÇ™å©Ç¬Ç©Ç¡ÇΩ */
  286996:	8b 45 fc             	mov    -0x4(%ebp),%eax
  286999:	c1 e0 05             	shl    $0x5,%eax
  28699c:	89 c2                	mov    %eax,%edx
  28699e:	8b 45 0c             	mov    0xc(%ebp),%eax
  2869a1:	01 d0                	add    %edx,%eax
  2869a3:	eb 1c                	jmp    2869c1 <file_search+0x167>
		}
next:
  2869a5:	90                   	nop
  2869a6:	eb 01                	jmp    2869a9 <file_search+0x14f>
					goto next;
  2869a8:	90                   	nop
		i++;
  2869a9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	for (i = 0; i < max; ) {
  2869ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2869b0:	3b 45 10             	cmp    0x10(%ebp),%eax
  2869b3:	0f 8c 7b ff ff ff    	jl     286934 <file_search+0xda>
  2869b9:	eb 01                	jmp    2869bc <file_search+0x162>
			break;
  2869bb:	90                   	nop
	}
	return 0; /* å©Ç¬Ç©ÇÁÇ»Ç©Ç¡ÇΩ */
  2869bc:	b8 00 00 00 00       	mov    $0x0,%eax
}
  2869c1:	c9                   	leave  
  2869c2:	c3                   	ret    

002869c3 <file_loadfile2>:

char *file_loadfile2(int clustno, int *psize, int *fat)
{
  2869c3:	f3 0f 1e fb          	endbr32 
  2869c7:	55                   	push   %ebp
  2869c8:	89 e5                	mov    %esp,%ebp
  2869ca:	83 ec 28             	sub    $0x28,%esp
	int size = *psize, size2;
  2869cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  2869d0:	8b 00                	mov    (%eax),%eax
  2869d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
	struct MEMMAN *memman = (struct MEMMAN *) MEMMAN_ADDR;
  2869d5:	c7 45 ec 00 00 3c 00 	movl   $0x3c0000,-0x14(%ebp)
	char *buf, *buf2;
	buf = (char *) memman_alloc_4k(memman, size);
  2869dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2869df:	83 ec 08             	sub    $0x8,%esp
  2869e2:	50                   	push   %eax
  2869e3:	ff 75 ec             	pushl  -0x14(%ebp)
  2869e6:	e8 09 bf ff ff       	call   2828f4 <memman_alloc_4k>
  2869eb:	83 c4 10             	add    $0x10,%esp
  2869ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
	file_loadfile(clustno, size, buf, fat, (char *) (ADR_DISKIMG + 0x003e00));
  2869f1:	83 ec 0c             	sub    $0xc,%esp
  2869f4:	68 00 3e 10 00       	push   $0x103e00
  2869f9:	ff 75 10             	pushl  0x10(%ebp)
  2869fc:	ff 75 f4             	pushl  -0xc(%ebp)
  2869ff:	ff 75 f0             	pushl  -0x10(%ebp)
  286a02:	ff 75 08             	pushl  0x8(%ebp)
  286a05:	e8 a4 fd ff ff       	call   2867ae <file_loadfile>
  286a0a:	83 c4 20             	add    $0x20,%esp
	if (size >= 17) {
  286a0d:	83 7d f0 10          	cmpl   $0x10,-0x10(%ebp)
  286a11:	7e 64                	jle    286a77 <file_loadfile2+0xb4>
		size2 = tek_getsize(buf);
  286a13:	83 ec 0c             	sub    $0xc,%esp
  286a16:	ff 75 f4             	pushl  -0xc(%ebp)
  286a19:	e8 ad 00 00 00       	call   286acb <tek_getsize>
  286a1e:	83 c4 10             	add    $0x10,%esp
  286a21:	89 45 e8             	mov    %eax,-0x18(%ebp)
		if (size2 > 0) {	/* tekà≥èkÇ™Ç©Ç©Ç¡ÇƒÇ¢ÇΩ */
  286a24:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  286a28:	7e 4d                	jle    286a77 <file_loadfile2+0xb4>
			buf2 = (char *) memman_alloc_4k(memman, size2);
  286a2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  286a2d:	83 ec 08             	sub    $0x8,%esp
  286a30:	50                   	push   %eax
  286a31:	ff 75 ec             	pushl  -0x14(%ebp)
  286a34:	e8 bb be ff ff       	call   2828f4 <memman_alloc_4k>
  286a39:	83 c4 10             	add    $0x10,%esp
  286a3c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			tek_decomp(buf, buf2, size2);
  286a3f:	83 ec 04             	sub    $0x4,%esp
  286a42:	ff 75 e8             	pushl  -0x18(%ebp)
  286a45:	ff 75 e4             	pushl  -0x1c(%ebp)
  286a48:	ff 75 f4             	pushl  -0xc(%ebp)
  286a4b:	e8 e7 00 00 00       	call   286b37 <tek_decomp>
  286a50:	83 c4 10             	add    $0x10,%esp
			memman_free_4k(memman, (int) buf, size);
  286a53:	8b 55 f0             	mov    -0x10(%ebp),%edx
  286a56:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286a59:	83 ec 04             	sub    $0x4,%esp
  286a5c:	52                   	push   %edx
  286a5d:	50                   	push   %eax
  286a5e:	ff 75 ec             	pushl  -0x14(%ebp)
  286a61:	e8 be be ff ff       	call   282924 <memman_free_4k>
  286a66:	83 c4 10             	add    $0x10,%esp
			buf = buf2;
  286a69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  286a6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
			*psize = size2;
  286a6f:	8b 45 0c             	mov    0xc(%ebp),%eax
  286a72:	8b 55 e8             	mov    -0x18(%ebp),%edx
  286a75:	89 10                	mov    %edx,(%eax)
		}
	}
	return buf;
  286a77:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  286a7a:	c9                   	leave  
  286a7b:	c3                   	ret    

00286a7c <tek_getnum_s7s>:
static int tek_decode5(int siz, UCHAR *p, UCHAR *q);

static unsigned int tek_getnum_s7s(UCHAR **pp)
/* Ç±ÇÍÇÕïKÇ∏big-endian */
/* â∫ë Ç™Ç»Ç¢ÇÃÇ≈íÜêgÇÇ¢Ç∂ÇËÇ‚Ç∑Ç¢ */
{
  286a7c:	f3 0f 1e fb          	endbr32 
  286a80:	55                   	push   %ebp
  286a81:	89 e5                	mov    %esp,%ebp
  286a83:	83 ec 10             	sub    $0x10,%esp
	unsigned int s = 0;
  286a86:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	UCHAR *p = *pp;
  286a8d:	8b 45 08             	mov    0x8(%ebp),%eax
  286a90:	8b 00                	mov    (%eax),%eax
  286a92:	89 45 f8             	mov    %eax,-0x8(%ebp)
	do {
		s = s << 7 | *p++;
  286a95:	8b 45 fc             	mov    -0x4(%ebp),%eax
  286a98:	c1 e0 07             	shl    $0x7,%eax
  286a9b:	89 c1                	mov    %eax,%ecx
  286a9d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  286aa0:	8d 50 01             	lea    0x1(%eax),%edx
  286aa3:	89 55 f8             	mov    %edx,-0x8(%ebp)
  286aa6:	0f b6 00             	movzbl (%eax),%eax
  286aa9:	0f b6 c0             	movzbl %al,%eax
  286aac:	09 c8                	or     %ecx,%eax
  286aae:	89 45 fc             	mov    %eax,-0x4(%ebp)
	} while ((s & 1) == 0);
  286ab1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  286ab4:	83 e0 01             	and    $0x1,%eax
  286ab7:	85 c0                	test   %eax,%eax
  286ab9:	74 da                	je     286a95 <tek_getnum_s7s+0x19>
	s >>= 1;
  286abb:	d1 6d fc             	shrl   -0x4(%ebp)
	*pp = p;
  286abe:	8b 45 08             	mov    0x8(%ebp),%eax
  286ac1:	8b 55 f8             	mov    -0x8(%ebp),%edx
  286ac4:	89 10                	mov    %edx,(%eax)
	return s;
  286ac6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  286ac9:	c9                   	leave  
  286aca:	c3                   	ret    

00286acb <tek_getsize>:

int tek_getsize(unsigned char *p)
{
  286acb:	f3 0f 1e fb          	endbr32 
  286acf:	55                   	push   %ebp
  286ad0:	89 e5                	mov    %esp,%ebp
  286ad2:	83 ec 18             	sub    $0x18,%esp
	static char header[15] = {
		0xff, 0xff, 0xff, 0x01, 0x00, 0x00, 0x00, 0x4f, 0x53, 0x41, 0x53, 0x4b, 0x43, 0x4d, 0x50
	};
	int size = -1;
  286ad5:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
	if (memcmp(p + 1, header, 15) == 0 && (*p == 0x83 || *p == 0x85 || *p == 0x89)) {
  286adc:	8b 45 08             	mov    0x8(%ebp),%eax
  286adf:	83 c0 01             	add    $0x1,%eax
  286ae2:	83 ec 04             	sub    $0x4,%esp
  286ae5:	6a 0f                	push   $0xf
  286ae7:	68 60 14 31 00       	push   $0x311460
  286aec:	50                   	push   %eax
  286aed:	e8 2b 1c 00 00       	call   28871d <memcmp>
  286af2:	83 c4 10             	add    $0x10,%esp
  286af5:	85 c0                	test   %eax,%eax
  286af7:	75 39                	jne    286b32 <tek_getsize+0x67>
  286af9:	8b 45 08             	mov    0x8(%ebp),%eax
  286afc:	0f b6 00             	movzbl (%eax),%eax
  286aff:	3c 83                	cmp    $0x83,%al
  286b01:	74 14                	je     286b17 <tek_getsize+0x4c>
  286b03:	8b 45 08             	mov    0x8(%ebp),%eax
  286b06:	0f b6 00             	movzbl (%eax),%eax
  286b09:	3c 85                	cmp    $0x85,%al
  286b0b:	74 0a                	je     286b17 <tek_getsize+0x4c>
  286b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  286b10:	0f b6 00             	movzbl (%eax),%eax
  286b13:	3c 89                	cmp    $0x89,%al
  286b15:	75 1b                	jne    286b32 <tek_getsize+0x67>
		p += 16;
  286b17:	8b 45 08             	mov    0x8(%ebp),%eax
  286b1a:	83 c0 10             	add    $0x10,%eax
  286b1d:	89 45 08             	mov    %eax,0x8(%ebp)
		size = tek_getnum_s7s(&p);
  286b20:	83 ec 0c             	sub    $0xc,%esp
  286b23:	8d 45 08             	lea    0x8(%ebp),%eax
  286b26:	50                   	push   %eax
  286b27:	e8 50 ff ff ff       	call   286a7c <tek_getnum_s7s>
  286b2c:	83 c4 10             	add    $0x10,%esp
  286b2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	return size;
  286b32:	8b 45 f4             	mov    -0xc(%ebp),%eax
}	  /* ÅiíêÅjmemcmpÇÕstrncmpÇÃíáä‘Ç≈ÅAï∂éöóÒíÜÇ…0Ç™Ç†Ç¡ÇƒÇ‡éwíËÇ≥ÇÍÇΩ15ï∂éöÇ‹Ç≈î‰ärÇ∑ÇÈä÷êî */
  286b35:	c9                   	leave  
  286b36:	c3                   	ret    

00286b37 <tek_decomp>:

int tek_decomp(unsigned char *p, char *q, int size)
{
  286b37:	f3 0f 1e fb          	endbr32 
  286b3b:	55                   	push   %ebp
  286b3c:	89 e5                	mov    %esp,%ebp
  286b3e:	83 ec 18             	sub    $0x18,%esp
	int err = -1;
  286b41:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
	if (*p == 0x83) {
  286b48:	8b 45 08             	mov    0x8(%ebp),%eax
  286b4b:	0f b6 00             	movzbl (%eax),%eax
  286b4e:	3c 83                	cmp    $0x83,%al
  286b50:	75 19                	jne    286b6b <tek_decomp+0x34>
		err = tek_decode1(size, p, q);
  286b52:	83 ec 04             	sub    $0x4,%esp
  286b55:	ff 75 0c             	pushl  0xc(%ebp)
  286b58:	ff 75 08             	pushl  0x8(%ebp)
  286b5b:	ff 75 10             	pushl  0x10(%ebp)
  286b5e:	e8 f4 01 00 00       	call   286d57 <tek_decode1>
  286b63:	83 c4 10             	add    $0x10,%esp
  286b66:	89 45 f4             	mov    %eax,-0xc(%ebp)
  286b69:	eb 44                	jmp    286baf <tek_decomp+0x78>
	} else if (*p == 0x85) {
  286b6b:	8b 45 08             	mov    0x8(%ebp),%eax
  286b6e:	0f b6 00             	movzbl (%eax),%eax
  286b71:	3c 85                	cmp    $0x85,%al
  286b73:	75 19                	jne    286b8e <tek_decomp+0x57>
		err = tek_decode2(size, p, q);
  286b75:	83 ec 04             	sub    $0x4,%esp
  286b78:	ff 75 0c             	pushl  0xc(%ebp)
  286b7b:	ff 75 08             	pushl  0x8(%ebp)
  286b7e:	ff 75 10             	pushl  0x10(%ebp)
  286b81:	e8 c2 05 00 00       	call   287148 <tek_decode2>
  286b86:	83 c4 10             	add    $0x10,%esp
  286b89:	89 45 f4             	mov    %eax,-0xc(%ebp)
  286b8c:	eb 21                	jmp    286baf <tek_decomp+0x78>
	} else if (*p == 0x89) {
  286b8e:	8b 45 08             	mov    0x8(%ebp),%eax
  286b91:	0f b6 00             	movzbl (%eax),%eax
  286b94:	3c 89                	cmp    $0x89,%al
  286b96:	75 17                	jne    286baf <tek_decomp+0x78>
		err = tek_decode5(size, p, q);
  286b98:	83 ec 04             	sub    $0x4,%esp
  286b9b:	ff 75 0c             	pushl  0xc(%ebp)
  286b9e:	ff 75 08             	pushl  0x8(%ebp)
  286ba1:	ff 75 10             	pushl  0x10(%ebp)
  286ba4:	e8 50 1a 00 00       	call   2885f9 <tek_decode5>
  286ba9:	83 c4 10             	add    $0x10,%esp
  286bac:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
	if (err != 0) {
  286baf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  286bb3:	74 07                	je     286bbc <tek_decomp+0x85>
		return -1;	/* é∏îs */
  286bb5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  286bba:	eb 05                	jmp    286bc1 <tek_decomp+0x8a>
	}
	return 0;	/* ê¨å˜ */
  286bbc:	b8 00 00 00 00       	mov    $0x0,%eax
}
  286bc1:	c9                   	leave  
  286bc2:	c3                   	ret    

00286bc3 <tek_lzrestore_stk1>:

static int tek_lzrestore_stk1(int srcsiz, UCHAR *src, int outsiz, UCHAR *q)
{
  286bc3:	f3 0f 1e fb          	endbr32 
  286bc7:	55                   	push   %ebp
  286bc8:	89 e5                	mov    %esp,%ebp
  286bca:	83 ec 20             	sub    $0x20,%esp
	int by, lz, cp, ds;
	UCHAR *q1 = q + outsiz, *s7ptr = src, *q0 = q;
  286bcd:	8b 55 10             	mov    0x10(%ebp),%edx
  286bd0:	8b 45 14             	mov    0x14(%ebp),%eax
  286bd3:	01 d0                	add    %edx,%eax
  286bd5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  286bd8:	8b 45 0c             	mov    0xc(%ebp),%eax
  286bdb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  286bde:	8b 45 14             	mov    0x14(%ebp),%eax
  286be1:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do {
		if ((by = (lz = *s7ptr++) & 0x0f) == 0)
  286be4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  286be7:	8d 50 01             	lea    0x1(%eax),%edx
  286bea:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  286bed:	0f b6 00             	movzbl (%eax),%eax
  286bf0:	0f b6 c0             	movzbl %al,%eax
  286bf3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  286bf6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  286bf9:	83 e0 0f             	and    $0xf,%eax
  286bfc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  286bff:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  286c03:	75 0f                	jne    286c14 <tek_lzrestore_stk1+0x51>
			by = tek_getnum_s7s(&s7ptr);
  286c05:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  286c08:	50                   	push   %eax
  286c09:	e8 6e fe ff ff       	call   286a7c <tek_getnum_s7s>
  286c0e:	83 c4 04             	add    $0x4,%esp
  286c11:	89 45 fc             	mov    %eax,-0x4(%ebp)
		if ((lz >>= 4) == 0)
  286c14:	c1 7d f8 04          	sarl   $0x4,-0x8(%ebp)
  286c18:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  286c1c:	75 0f                	jne    286c2d <tek_lzrestore_stk1+0x6a>
			lz = tek_getnum_s7s(&s7ptr);
  286c1e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  286c21:	50                   	push   %eax
  286c22:	e8 55 fe ff ff       	call   286a7c <tek_getnum_s7s>
  286c27:	83 c4 04             	add    $0x4,%esp
  286c2a:	89 45 f8             	mov    %eax,-0x8(%ebp)
		do {
			*q++ = *s7ptr++;
  286c2d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  286c30:	8d 42 01             	lea    0x1(%edx),%eax
  286c33:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  286c36:	8b 45 14             	mov    0x14(%ebp),%eax
  286c39:	8d 48 01             	lea    0x1(%eax),%ecx
  286c3c:	89 4d 14             	mov    %ecx,0x14(%ebp)
  286c3f:	0f b6 12             	movzbl (%edx),%edx
  286c42:	88 10                	mov    %dl,(%eax)
		} while (--by);
  286c44:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  286c48:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  286c4c:	75 df                	jne    286c2d <tek_lzrestore_stk1+0x6a>
		if (q >= q1)
  286c4e:	8b 45 14             	mov    0x14(%ebp),%eax
  286c51:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  286c54:	0f 83 e9 00 00 00    	jae    286d43 <tek_lzrestore_stk1+0x180>
			break;
		do {
			ds = (cp = *s7ptr++) & 0x0f;
  286c5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  286c5d:	8d 50 01             	lea    0x1(%eax),%edx
  286c60:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  286c63:	0f b6 00             	movzbl (%eax),%eax
  286c66:	0f b6 c0             	movzbl %al,%eax
  286c69:	89 45 f4             	mov    %eax,-0xc(%ebp)
  286c6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286c6f:	83 e0 0f             	and    $0xf,%eax
  286c72:	89 45 f0             	mov    %eax,-0x10(%ebp)
			if ((ds & 1) == 0) {
  286c75:	8b 45 f0             	mov    -0x10(%ebp),%eax
  286c78:	83 e0 01             	and    $0x1,%eax
  286c7b:	85 c0                	test   %eax,%eax
  286c7d:	75 26                	jne    286ca5 <tek_lzrestore_stk1+0xe2>
				do {
					ds = ds << 7 | *s7ptr++;
  286c7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  286c82:	c1 e0 07             	shl    $0x7,%eax
  286c85:	89 c1                	mov    %eax,%ecx
  286c87:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  286c8a:	8d 50 01             	lea    0x1(%eax),%edx
  286c8d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  286c90:	0f b6 00             	movzbl (%eax),%eax
  286c93:	0f b6 c0             	movzbl %al,%eax
  286c96:	09 c8                	or     %ecx,%eax
  286c98:	89 45 f0             	mov    %eax,-0x10(%ebp)
				} while ((ds & 1) == 0);
  286c9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  286c9e:	83 e0 01             	and    $0x1,%eax
  286ca1:	85 c0                	test   %eax,%eax
  286ca3:	74 da                	je     286c7f <tek_lzrestore_stk1+0xbc>
			}
			ds = ~(ds >> 1);
  286ca5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  286ca8:	d1 f8                	sar    %eax
  286caa:	f7 d0                	not    %eax
  286cac:	89 45 f0             	mov    %eax,-0x10(%ebp)
			if ((cp >>= 4) == 0) {
  286caf:	c1 7d f4 04          	sarl   $0x4,-0xc(%ebp)
  286cb3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  286cb7:	75 29                	jne    286ce2 <tek_lzrestore_stk1+0x11f>
				do {
					cp = cp << 7 | *s7ptr++;
  286cb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286cbc:	c1 e0 07             	shl    $0x7,%eax
  286cbf:	89 c1                	mov    %eax,%ecx
  286cc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  286cc4:	8d 50 01             	lea    0x1(%eax),%edx
  286cc7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  286cca:	0f b6 00             	movzbl (%eax),%eax
  286ccd:	0f b6 c0             	movzbl %al,%eax
  286cd0:	09 c8                	or     %ecx,%eax
  286cd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
				} while ((cp & 1) == 0);
  286cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286cd8:	83 e0 01             	and    $0x1,%eax
  286cdb:	85 c0                	test   %eax,%eax
  286cdd:	74 da                	je     286cb9 <tek_lzrestore_stk1+0xf6>
				cp >>= 1;
  286cdf:	d1 7d f4             	sarl   -0xc(%ebp)
			} /* 0Ç™Ç±Ç»Ç¢Ç±Ç∆ÇÇ†ÇƒÇ…Ç∑ÇÈ */
			cp++;
  286ce2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
			if (q + ds < q0)
  286ce6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  286ce9:	8b 45 14             	mov    0x14(%ebp),%eax
  286cec:	01 d0                	add    %edx,%eax
  286cee:	39 45 e8             	cmp    %eax,-0x18(%ebp)
  286cf1:	77 58                	ja     286d4b <tek_lzrestore_stk1+0x188>
				goto err;
			if (q + cp > q1)
  286cf3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  286cf6:	8b 45 14             	mov    0x14(%ebp),%eax
  286cf9:	01 d0                	add    %edx,%eax
  286cfb:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  286cfe:	73 09                	jae    286d09 <tek_lzrestore_stk1+0x146>
				cp = q1 - q;
  286d00:	8b 45 ec             	mov    -0x14(%ebp),%eax
  286d03:	2b 45 14             	sub    0x14(%ebp),%eax
  286d06:	89 45 f4             	mov    %eax,-0xc(%ebp)
			do {
				*q = *(q + ds);
  286d09:	8b 55 f0             	mov    -0x10(%ebp),%edx
  286d0c:	8b 45 14             	mov    0x14(%ebp),%eax
  286d0f:	01 d0                	add    %edx,%eax
  286d11:	0f b6 10             	movzbl (%eax),%edx
  286d14:	8b 45 14             	mov    0x14(%ebp),%eax
  286d17:	88 10                	mov    %dl,(%eax)
				q++;
  286d19:	83 45 14 01          	addl   $0x1,0x14(%ebp)
			} while (--cp);
  286d1d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  286d21:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  286d25:	75 e2                	jne    286d09 <tek_lzrestore_stk1+0x146>
		} while (--lz);
  286d27:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
  286d2b:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  286d2f:	0f 85 25 ff ff ff    	jne    286c5a <tek_lzrestore_stk1+0x97>
	} while (q < q1);
  286d35:	8b 45 14             	mov    0x14(%ebp),%eax
  286d38:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  286d3b:	0f 82 a3 fe ff ff    	jb     286be4 <tek_lzrestore_stk1+0x21>
  286d41:	eb 01                	jmp    286d44 <tek_lzrestore_stk1+0x181>
			break;
  286d43:	90                   	nop
	return 0;
  286d44:	b8 00 00 00 00       	mov    $0x0,%eax
  286d49:	eb 0a                	jmp    286d55 <tek_lzrestore_stk1+0x192>
				goto err;
  286d4b:	90                   	nop
  286d4c:	f3 0f 1e fb          	endbr32 
err:
	return 1;
  286d50:	b8 01 00 00 00       	mov    $0x1,%eax
}
  286d55:	c9                   	leave  
  286d56:	c3                   	ret    

00286d57 <tek_decode1>:

static int tek_decode1(int siz, UCHAR *p, UCHAR *q)
{
  286d57:	f3 0f 1e fb          	endbr32 
  286d5b:	55                   	push   %ebp
  286d5c:	89 e5                	mov    %esp,%ebp
  286d5e:	83 ec 10             	sub    $0x10,%esp
	int dsiz, hed, bsiz;
	UCHAR *p1 = p + siz;
  286d61:	8b 55 0c             	mov    0xc(%ebp),%edx
  286d64:	8b 45 08             	mov    0x8(%ebp),%eax
  286d67:	01 d0                	add    %edx,%eax
  286d69:	89 45 fc             	mov    %eax,-0x4(%ebp)
	p += 16;
  286d6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  286d6f:	83 c0 10             	add    $0x10,%eax
  286d72:	89 45 0c             	mov    %eax,0xc(%ebp)
	if ((dsiz = tek_getnum_s7s(&p)) > 0) {
  286d75:	8d 45 0c             	lea    0xc(%ebp),%eax
  286d78:	50                   	push   %eax
  286d79:	e8 fe fc ff ff       	call   286a7c <tek_getnum_s7s>
  286d7e:	83 c4 04             	add    $0x4,%esp
  286d81:	89 45 f8             	mov    %eax,-0x8(%ebp)
  286d84:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  286d88:	0f 8e 8e 00 00 00    	jle    286e1c <tek_decode1+0xc5>
		hed = tek_getnum_s7s(&p);
  286d8e:	8d 45 0c             	lea    0xc(%ebp),%eax
  286d91:	50                   	push   %eax
  286d92:	e8 e5 fc ff ff       	call   286a7c <tek_getnum_s7s>
  286d97:	83 c4 04             	add    $0x4,%esp
  286d9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
		bsiz = 1 << (((hed >> 1) & 0x0f) + 8);
  286d9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286da0:	d1 f8                	sar    %eax
  286da2:	83 e0 0f             	and    $0xf,%eax
  286da5:	83 c0 08             	add    $0x8,%eax
  286da8:	ba 01 00 00 00       	mov    $0x1,%edx
  286dad:	89 c1                	mov    %eax,%ecx
  286daf:	d3 e2                	shl    %cl,%edx
  286db1:	89 d0                	mov    %edx,%eax
  286db3:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (dsiz > bsiz || (hed & 0x21) != 0x01)
  286db6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  286db9:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  286dbc:	7f 0b                	jg     286dc9 <tek_decode1+0x72>
  286dbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286dc1:	83 e0 21             	and    $0x21,%eax
  286dc4:	83 f8 01             	cmp    $0x1,%eax
  286dc7:	74 07                	je     286dd0 <tek_decode1+0x79>
			return 1;
  286dc9:	b8 01 00 00 00       	mov    $0x1,%eax
  286dce:	eb 51                	jmp    286e21 <tek_decode1+0xca>
		if (hed & 0x40)
  286dd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286dd3:	83 e0 40             	and    $0x40,%eax
  286dd6:	85 c0                	test   %eax,%eax
  286dd8:	74 0c                	je     286de6 <tek_decode1+0x8f>
			tek_getnum_s7s(&p); /* ÉIÉvÉVÉáÉìèÓïÒÇ÷ÇÃÉ|ÉCÉìÉ^Çì«Ç›îÚÇŒÇ∑ */
  286dda:	8d 45 0c             	lea    0xc(%ebp),%eax
  286ddd:	50                   	push   %eax
  286dde:	e8 99 fc ff ff       	call   286a7c <tek_getnum_s7s>
  286de3:	83 c4 04             	add    $0x4,%esp
		if (tek_getnum_s7s(&p) != 0)
  286de6:	8d 45 0c             	lea    0xc(%ebp),%eax
  286de9:	50                   	push   %eax
  286dea:	e8 8d fc ff ff       	call   286a7c <tek_getnum_s7s>
  286def:	83 c4 04             	add    $0x4,%esp
  286df2:	85 c0                	test   %eax,%eax
  286df4:	74 07                	je     286dfd <tek_decode1+0xa6>
			return 1; /* ï‚èïÉoÉbÉtÉ@égóp */
  286df6:	b8 01 00 00 00       	mov    $0x1,%eax
  286dfb:	eb 24                	jmp    286e21 <tek_decode1+0xca>
		return tek_lzrestore_stk1(p1 - p, p, dsiz, q);
  286dfd:	8b 45 0c             	mov    0xc(%ebp),%eax
  286e00:	8b 55 0c             	mov    0xc(%ebp),%edx
  286e03:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  286e06:	29 d1                	sub    %edx,%ecx
  286e08:	89 ca                	mov    %ecx,%edx
  286e0a:	ff 75 10             	pushl  0x10(%ebp)
  286e0d:	ff 75 f8             	pushl  -0x8(%ebp)
  286e10:	50                   	push   %eax
  286e11:	52                   	push   %edx
  286e12:	e8 ac fd ff ff       	call   286bc3 <tek_lzrestore_stk1>
  286e17:	83 c4 10             	add    $0x10,%esp
  286e1a:	eb 05                	jmp    286e21 <tek_decode1+0xca>
	}
	return 0;
  286e1c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  286e21:	c9                   	leave  
  286e22:	c3                   	ret    

00286e23 <tek_getnum_s7>:

static unsigned int tek_getnum_s7(UCHAR **pp)
/* Ç±ÇÍÇÕïKÇ∏big-endian */
{
  286e23:	f3 0f 1e fb          	endbr32 
  286e27:	55                   	push   %ebp
  286e28:	89 e5                	mov    %esp,%ebp
  286e2a:	83 ec 10             	sub    $0x10,%esp
	unsigned int s = 0, b = 0, a = 1;
  286e2d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  286e34:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  286e3b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
	UCHAR *p = *pp;
  286e42:	8b 45 08             	mov    0x8(%ebp),%eax
  286e45:	8b 00                	mov    (%eax),%eax
  286e47:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (;;) {
		s = s << 7 | *p++;
  286e4a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  286e4d:	c1 e0 07             	shl    $0x7,%eax
  286e50:	89 c1                	mov    %eax,%ecx
  286e52:	8b 45 f0             	mov    -0x10(%ebp),%eax
  286e55:	8d 50 01             	lea    0x1(%eax),%edx
  286e58:	89 55 f0             	mov    %edx,-0x10(%ebp)
  286e5b:	0f b6 00             	movzbl (%eax),%eax
  286e5e:	0f b6 c0             	movzbl %al,%eax
  286e61:	09 c8                	or     %ecx,%eax
  286e63:	89 45 fc             	mov    %eax,-0x4(%ebp)
		if (s & 1)
  286e66:	8b 45 fc             	mov    -0x4(%ebp),%eax
  286e69:	83 e0 01             	and    $0x1,%eax
  286e6c:	85 c0                	test   %eax,%eax
  286e6e:	75 0c                	jne    286e7c <tek_getnum_s7+0x59>
			break;
		a <<= 7;
  286e70:	c1 65 f4 07          	shll   $0x7,-0xc(%ebp)
		b += a;
  286e74:	8b 45 f4             	mov    -0xc(%ebp),%eax
  286e77:	01 45 f8             	add    %eax,-0x8(%ebp)
		s = s << 7 | *p++;
  286e7a:	eb ce                	jmp    286e4a <tek_getnum_s7+0x27>
			break;
  286e7c:	90                   	nop
	}
	s >>= 1;
  286e7d:	d1 6d fc             	shrl   -0x4(%ebp)
	*pp = p;
  286e80:	8b 45 08             	mov    0x8(%ebp),%eax
  286e83:	8b 55 f0             	mov    -0x10(%ebp),%edx
  286e86:	89 10                	mov    %edx,(%eax)
	return s + b;
  286e88:	8b 55 fc             	mov    -0x4(%ebp),%edx
  286e8b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  286e8e:	01 d0                	add    %edx,%eax
}
  286e90:	c9                   	leave  
  286e91:	c3                   	ret    

00286e92 <tek_lzrestore_stk2>:

static int tek_lzrestore_stk2(int srcsiz, UCHAR *src, int outsiz, UCHAR *q)
{
  286e92:	f3 0f 1e fb          	endbr32 
  286e96:	55                   	push   %ebp
  286e97:	89 e5                	mov    %esp,%ebp
  286e99:	53                   	push   %ebx
  286e9a:	83 ec 30             	sub    $0x30,%esp
	int cp, ds, repdis[4], i, j;
	UCHAR *q1 = q + outsiz, *s7ptr = src, *q0 = q, bylz, cbylz;
  286e9d:	8b 55 10             	mov    0x10(%ebp),%edx
  286ea0:	8b 45 14             	mov    0x14(%ebp),%eax
  286ea3:	01 d0                	add    %edx,%eax
  286ea5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  286ea8:	8b 45 0c             	mov    0xc(%ebp),%eax
  286eab:	89 45 cc             	mov    %eax,-0x34(%ebp)
  286eae:	8b 45 14             	mov    0x14(%ebp),%eax
  286eb1:	89 45 e0             	mov    %eax,-0x20(%ebp)
	for (j = 0; j < 4; j++)
  286eb4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  286ebb:	eb 12                	jmp    286ecf <tek_lzrestore_stk2+0x3d>
		repdis[j] = -1 - j;
  286ebd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  286ec0:	f7 d0                	not    %eax
  286ec2:	89 c2                	mov    %eax,%edx
  286ec4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  286ec7:	89 54 85 d0          	mov    %edx,-0x30(%ebp,%eax,4)
	for (j = 0; j < 4; j++)
  286ecb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  286ecf:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
  286ed3:	7e e8                	jle    286ebd <tek_lzrestore_stk2+0x2b>
	bylz = cbylz = 0;
  286ed5:	c6 45 ea 00          	movb   $0x0,-0x16(%ebp)
  286ed9:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  286edd:	88 45 eb             	mov    %al,-0x15(%ebp)
	if (outsiz) {
  286ee0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  286ee4:	0f 84 48 02 00 00    	je     287132 <tek_lzrestore_stk2+0x2a0>
		if (tek_getnum_s7s(&s7ptr))
  286eea:	8d 45 cc             	lea    -0x34(%ebp),%eax
  286eed:	50                   	push   %eax
  286eee:	e8 89 fb ff ff       	call   286a7c <tek_getnum_s7s>
  286ef3:	83 c4 04             	add    $0x4,%esp
  286ef6:	85 c0                	test   %eax,%eax
  286ef8:	74 0a                	je     286f04 <tek_lzrestore_stk2+0x72>
			return 1;
  286efa:	b8 01 00 00 00       	mov    $0x1,%eax
  286eff:	e9 3f 02 00 00       	jmp    287143 <tek_lzrestore_stk2+0x2b1>
		do {
			/* byÉtÉFÅ[ÉY */
			j = 0;
  286f04:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
			do {
				j++;
  286f0b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
				if (j >= 17) {
  286f0f:	83 7d ec 10          	cmpl   $0x10,-0x14(%ebp)
  286f13:	7e 16                	jle    286f2b <tek_lzrestore_stk2+0x99>
					j += tek_getnum_s7s(&s7ptr);
  286f15:	8d 45 cc             	lea    -0x34(%ebp),%eax
  286f18:	50                   	push   %eax
  286f19:	e8 5e fb ff ff       	call   286a7c <tek_getnum_s7s>
  286f1e:	83 c4 04             	add    $0x4,%esp
  286f21:	8b 55 ec             	mov    -0x14(%ebp),%edx
  286f24:	01 d0                	add    %edx,%eax
  286f26:	89 45 ec             	mov    %eax,-0x14(%ebp)
					break;
  286f29:	eb 36                	jmp    286f61 <tek_lzrestore_stk2+0xcf>
				}
				if (cbylz == 0) {
  286f2b:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
  286f2f:	75 13                	jne    286f44 <tek_lzrestore_stk2+0xb2>
					cbylz = 8;
  286f31:	c6 45 ea 08          	movb   $0x8,-0x16(%ebp)
					bylz = *s7ptr++;
  286f35:	8b 45 cc             	mov    -0x34(%ebp),%eax
  286f38:	8d 50 01             	lea    0x1(%eax),%edx
  286f3b:	89 55 cc             	mov    %edx,-0x34(%ebp)
  286f3e:	0f b6 00             	movzbl (%eax),%eax
  286f41:	88 45 eb             	mov    %al,-0x15(%ebp)
				}
				cbylz--;
  286f44:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  286f48:	83 e8 01             	sub    $0x1,%eax
  286f4b:	88 45 ea             	mov    %al,-0x16(%ebp)
				i = bylz & 1;
  286f4e:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  286f52:	83 e0 01             	and    $0x1,%eax
  286f55:	89 45 f0             	mov    %eax,-0x10(%ebp)
				bylz >>= 1;
  286f58:	d0 6d eb             	shrb   -0x15(%ebp)
			} while (i == 0);
  286f5b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  286f5f:	74 aa                	je     286f0b <tek_lzrestore_stk2+0x79>
			do {
				*q++ = *s7ptr++;
  286f61:	8b 55 cc             	mov    -0x34(%ebp),%edx
  286f64:	8d 42 01             	lea    0x1(%edx),%eax
  286f67:	89 45 cc             	mov    %eax,-0x34(%ebp)
  286f6a:	8b 45 14             	mov    0x14(%ebp),%eax
  286f6d:	8d 48 01             	lea    0x1(%eax),%ecx
  286f70:	89 4d 14             	mov    %ecx,0x14(%ebp)
  286f73:	0f b6 12             	movzbl (%edx),%edx
  286f76:	88 10                	mov    %dl,(%eax)
			} while (--j);
  286f78:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
  286f7c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  286f80:	75 df                	jne    286f61 <tek_lzrestore_stk2+0xcf>
			if (q >= q1)
  286f82:	8b 45 14             	mov    0x14(%ebp),%eax
  286f85:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  286f88:	0f 83 a3 01 00 00    	jae    287131 <tek_lzrestore_stk2+0x29f>
				break;

			/* lzÉtÉFÅ[ÉY */
			j = 0;
  286f8e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
			do {
				j++;
  286f95:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
				if (j >= 17) {
  286f99:	83 7d ec 10          	cmpl   $0x10,-0x14(%ebp)
  286f9d:	7e 16                	jle    286fb5 <tek_lzrestore_stk2+0x123>
					j += tek_getnum_s7s(&s7ptr);
  286f9f:	8d 45 cc             	lea    -0x34(%ebp),%eax
  286fa2:	50                   	push   %eax
  286fa3:	e8 d4 fa ff ff       	call   286a7c <tek_getnum_s7s>
  286fa8:	83 c4 04             	add    $0x4,%esp
  286fab:	8b 55 ec             	mov    -0x14(%ebp),%edx
  286fae:	01 d0                	add    %edx,%eax
  286fb0:	89 45 ec             	mov    %eax,-0x14(%ebp)
					break;
  286fb3:	eb 36                	jmp    286feb <tek_lzrestore_stk2+0x159>
				}
				if (cbylz == 0) {
  286fb5:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
  286fb9:	75 13                	jne    286fce <tek_lzrestore_stk2+0x13c>
					cbylz = 8;
  286fbb:	c6 45 ea 08          	movb   $0x8,-0x16(%ebp)
					bylz = *s7ptr++;
  286fbf:	8b 45 cc             	mov    -0x34(%ebp),%eax
  286fc2:	8d 50 01             	lea    0x1(%eax),%edx
  286fc5:	89 55 cc             	mov    %edx,-0x34(%ebp)
  286fc8:	0f b6 00             	movzbl (%eax),%eax
  286fcb:	88 45 eb             	mov    %al,-0x15(%ebp)
				}
				cbylz--;
  286fce:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  286fd2:	83 e8 01             	sub    $0x1,%eax
  286fd5:	88 45 ea             	mov    %al,-0x16(%ebp)
				i = bylz & 1;
  286fd8:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  286fdc:	83 e0 01             	and    $0x1,%eax
  286fdf:	89 45 f0             	mov    %eax,-0x10(%ebp)
				bylz >>= 1;
  286fe2:	d0 6d eb             	shrb   -0x15(%ebp)
			} while (i == 0);
  286fe5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  286fe9:	74 aa                	je     286f95 <tek_lzrestore_stk2+0x103>
			do {
				i = *s7ptr++;
  286feb:	8b 45 cc             	mov    -0x34(%ebp),%eax
  286fee:	8d 50 01             	lea    0x1(%eax),%edx
  286ff1:	89 55 cc             	mov    %edx,-0x34(%ebp)
  286ff4:	0f b6 00             	movzbl (%eax),%eax
  286ff7:	0f b6 c0             	movzbl %al,%eax
  286ffa:	89 45 f0             	mov    %eax,-0x10(%ebp)
				cp = i >> 4;
  286ffd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  287000:	c1 f8 04             	sar    $0x4,%eax
  287003:	89 45 f8             	mov    %eax,-0x8(%ebp)
				i &= 0x0f;
  287006:	83 65 f0 0f          	andl   $0xf,-0x10(%ebp)
				if ((i & 1) == 0)
  28700a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28700d:	83 e0 01             	and    $0x1,%eax
  287010:	85 c0                	test   %eax,%eax
  287012:	75 1c                	jne    287030 <tek_lzrestore_stk2+0x19e>
					i |= (tek_getnum_s7(&s7ptr) + 1) << 4;
  287014:	8d 45 cc             	lea    -0x34(%ebp),%eax
  287017:	50                   	push   %eax
  287018:	e8 06 fe ff ff       	call   286e23 <tek_getnum_s7>
  28701d:	83 c4 04             	add    $0x4,%esp
  287020:	83 c0 01             	add    $0x1,%eax
  287023:	c1 e0 04             	shl    $0x4,%eax
  287026:	89 c2                	mov    %eax,%edx
  287028:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28702b:	09 d0                	or     %edx,%eax
  28702d:	89 45 f0             	mov    %eax,-0x10(%ebp)
				i >>= 1;
  287030:	d1 7d f0             	sarl   -0x10(%ebp)
				ds = ~(i - 6);
  287033:	8b 45 f0             	mov    -0x10(%ebp),%eax
  287036:	83 e8 06             	sub    $0x6,%eax
  287039:	f7 d0                	not    %eax
  28703b:	89 45 f4             	mov    %eax,-0xc(%ebp)
				if (i < 4)
  28703e:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
  287042:	7f 0a                	jg     28704e <tek_lzrestore_stk2+0x1bc>
					ds = repdis[i];
  287044:	8b 45 f0             	mov    -0x10(%ebp),%eax
  287047:	8b 44 85 d0          	mov    -0x30(%ebp,%eax,4),%eax
  28704b:	89 45 f4             	mov    %eax,-0xc(%ebp)
				if (i == 4)
  28704e:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
  287052:	75 1b                	jne    28706f <tek_lzrestore_stk2+0x1dd>
					ds = repdis[0] - tek_getnum_s7(&s7ptr) - 1;
  287054:	8b 45 d0             	mov    -0x30(%ebp),%eax
  287057:	89 c3                	mov    %eax,%ebx
  287059:	8d 45 cc             	lea    -0x34(%ebp),%eax
  28705c:	50                   	push   %eax
  28705d:	e8 c1 fd ff ff       	call   286e23 <tek_getnum_s7>
  287062:	83 c4 04             	add    $0x4,%esp
  287065:	29 c3                	sub    %eax,%ebx
  287067:	89 d8                	mov    %ebx,%eax
  287069:	83 e8 01             	sub    $0x1,%eax
  28706c:	89 45 f4             	mov    %eax,-0xc(%ebp)
				if (i == 5)
  28706f:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
  287073:	75 19                	jne    28708e <tek_lzrestore_stk2+0x1fc>
					ds = repdis[0] + tek_getnum_s7(&s7ptr) + 1;
  287075:	8b 45 d0             	mov    -0x30(%ebp),%eax
  287078:	89 c3                	mov    %eax,%ebx
  28707a:	8d 45 cc             	lea    -0x34(%ebp),%eax
  28707d:	50                   	push   %eax
  28707e:	e8 a0 fd ff ff       	call   286e23 <tek_getnum_s7>
  287083:	83 c4 04             	add    $0x4,%esp
  287086:	01 d8                	add    %ebx,%eax
  287088:	83 c0 01             	add    $0x1,%eax
  28708b:	89 45 f4             	mov    %eax,-0xc(%ebp)
				if (cp == 0)
  28708e:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  287092:	75 12                	jne    2870a6 <tek_lzrestore_stk2+0x214>
					cp = tek_getnum_s7(&s7ptr) + 16;
  287094:	8d 45 cc             	lea    -0x34(%ebp),%eax
  287097:	50                   	push   %eax
  287098:	e8 86 fd ff ff       	call   286e23 <tek_getnum_s7>
  28709d:	83 c4 04             	add    $0x4,%esp
  2870a0:	83 c0 10             	add    $0x10,%eax
  2870a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
				cp++;
  2870a6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
				if (i > 0) {
  2870aa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  2870ae:	7e 24                	jle    2870d4 <tek_lzrestore_stk2+0x242>
					if (i > 1) {
  2870b0:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
  2870b4:	7e 12                	jle    2870c8 <tek_lzrestore_stk2+0x236>
						if (i > 2)
  2870b6:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
  2870ba:	7e 06                	jle    2870c2 <tek_lzrestore_stk2+0x230>
							repdis[3] = repdis[2];
  2870bc:	8b 45 d8             	mov    -0x28(%ebp),%eax
  2870bf:	89 45 dc             	mov    %eax,-0x24(%ebp)
						repdis[2] = repdis[1];
  2870c2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  2870c5:	89 45 d8             	mov    %eax,-0x28(%ebp)
					}
					repdis[1] = repdis[0];
  2870c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2870cb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
					repdis[0] = ds;
  2870ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2870d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
				}
				if (q + ds < q0)
  2870d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2870d7:	8b 45 14             	mov    0x14(%ebp),%eax
  2870da:	01 d0                	add    %edx,%eax
  2870dc:	39 45 e0             	cmp    %eax,-0x20(%ebp)
  2870df:	77 58                	ja     287139 <tek_lzrestore_stk2+0x2a7>
					goto err;
				if (q + cp > q1)
  2870e1:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2870e4:	8b 45 14             	mov    0x14(%ebp),%eax
  2870e7:	01 d0                	add    %edx,%eax
  2870e9:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
  2870ec:	73 09                	jae    2870f7 <tek_lzrestore_stk2+0x265>
					cp = q1 - q;
  2870ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2870f1:	2b 45 14             	sub    0x14(%ebp),%eax
  2870f4:	89 45 f8             	mov    %eax,-0x8(%ebp)
				do {
					*q = *(q + ds);
  2870f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2870fa:	8b 45 14             	mov    0x14(%ebp),%eax
  2870fd:	01 d0                	add    %edx,%eax
  2870ff:	0f b6 10             	movzbl (%eax),%edx
  287102:	8b 45 14             	mov    0x14(%ebp),%eax
  287105:	88 10                	mov    %dl,(%eax)
					q++;
  287107:	83 45 14 01          	addl   $0x1,0x14(%ebp)
				} while (--cp);
  28710b:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
  28710f:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  287113:	75 e2                	jne    2870f7 <tek_lzrestore_stk2+0x265>
			} while (--j);
  287115:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
  287119:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  28711d:	0f 85 c8 fe ff ff    	jne    286feb <tek_lzrestore_stk2+0x159>
		} while (q < q1);
  287123:	8b 45 14             	mov    0x14(%ebp),%eax
  287126:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  287129:	0f 82 d5 fd ff ff    	jb     286f04 <tek_lzrestore_stk2+0x72>
  28712f:	eb 01                	jmp    287132 <tek_lzrestore_stk2+0x2a0>
				break;
  287131:	90                   	nop
	}
	return 0;
  287132:	b8 00 00 00 00       	mov    $0x0,%eax
  287137:	eb 0a                	jmp    287143 <tek_lzrestore_stk2+0x2b1>
					goto err;
  287139:	90                   	nop
  28713a:	f3 0f 1e fb          	endbr32 
err:
	return 1;
  28713e:	b8 01 00 00 00       	mov    $0x1,%eax
}
  287143:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  287146:	c9                   	leave  
  287147:	c3                   	ret    

00287148 <tek_decode2>:

static int tek_decode2(int siz, UCHAR *p, UCHAR *q)
{
  287148:	f3 0f 1e fb          	endbr32 
  28714c:	55                   	push   %ebp
  28714d:	89 e5                	mov    %esp,%ebp
  28714f:	83 ec 20             	sub    $0x20,%esp
	UCHAR *p1 = p + siz;
  287152:	8b 55 0c             	mov    0xc(%ebp),%edx
  287155:	8b 45 08             	mov    0x8(%ebp),%eax
  287158:	01 d0                	add    %edx,%eax
  28715a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	int dsiz, hed, bsiz, st = 0;
  28715d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	p += 16;
  287164:	8b 45 0c             	mov    0xc(%ebp),%eax
  287167:	83 c0 10             	add    $0x10,%eax
  28716a:	89 45 0c             	mov    %eax,0xc(%ebp)
	if ((dsiz = tek_getnum_s7s(&p)) > 0) {
  28716d:	8d 45 0c             	lea    0xc(%ebp),%eax
  287170:	50                   	push   %eax
  287171:	e8 06 f9 ff ff       	call   286a7c <tek_getnum_s7s>
  287176:	83 c4 04             	add    $0x4,%esp
  287179:	89 45 f4             	mov    %eax,-0xc(%ebp)
  28717c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  287180:	7e 78                	jle    2871fa <tek_decode2+0xb2>
		hed = tek_getnum_s7s(&p);
  287182:	8d 45 0c             	lea    0xc(%ebp),%eax
  287185:	50                   	push   %eax
  287186:	e8 f1 f8 ff ff       	call   286a7c <tek_getnum_s7s>
  28718b:	83 c4 04             	add    $0x4,%esp
  28718e:	89 45 f0             	mov    %eax,-0x10(%ebp)
		bsiz = 1 << (((hed >> 1) & 0x0f) + 8);
  287191:	8b 45 f0             	mov    -0x10(%ebp),%eax
  287194:	d1 f8                	sar    %eax
  287196:	83 e0 0f             	and    $0xf,%eax
  287199:	83 c0 08             	add    $0x8,%eax
  28719c:	ba 01 00 00 00       	mov    $0x1,%edx
  2871a1:	89 c1                	mov    %eax,%ecx
  2871a3:	d3 e2                	shl    %cl,%edx
  2871a5:	89 d0                	mov    %edx,%eax
  2871a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if (dsiz > bsiz || (hed & 0x21) != 0x01)
  2871aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2871ad:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  2871b0:	7f 0b                	jg     2871bd <tek_decode2+0x75>
  2871b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2871b5:	83 e0 21             	and    $0x21,%eax
  2871b8:	83 f8 01             	cmp    $0x1,%eax
  2871bb:	74 07                	je     2871c4 <tek_decode2+0x7c>
			return 1;
  2871bd:	b8 01 00 00 00       	mov    $0x1,%eax
  2871c2:	eb 39                	jmp    2871fd <tek_decode2+0xb5>
		if (hed & 0x40)
  2871c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2871c7:	83 e0 40             	and    $0x40,%eax
  2871ca:	85 c0                	test   %eax,%eax
  2871cc:	74 0c                	je     2871da <tek_decode2+0x92>
			tek_getnum_s7s(&p); /* ÉIÉvÉVÉáÉìèÓïÒÇ÷ÇÃÉ|ÉCÉìÉ^Çì«Ç›îÚÇŒÇ∑ */
  2871ce:	8d 45 0c             	lea    0xc(%ebp),%eax
  2871d1:	50                   	push   %eax
  2871d2:	e8 a5 f8 ff ff       	call   286a7c <tek_getnum_s7s>
  2871d7:	83 c4 04             	add    $0x4,%esp
		st = tek_lzrestore_stk2(p1 - p, p, dsiz, q);
  2871da:	8b 45 0c             	mov    0xc(%ebp),%eax
  2871dd:	8b 55 0c             	mov    0xc(%ebp),%edx
  2871e0:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  2871e3:	29 d1                	sub    %edx,%ecx
  2871e5:	89 ca                	mov    %ecx,%edx
  2871e7:	ff 75 10             	pushl  0x10(%ebp)
  2871ea:	ff 75 f4             	pushl  -0xc(%ebp)
  2871ed:	50                   	push   %eax
  2871ee:	52                   	push   %edx
  2871ef:	e8 9e fc ff ff       	call   286e92 <tek_lzrestore_stk2>
  2871f4:	83 c4 10             	add    $0x10,%esp
  2871f7:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	return st;
  2871fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  2871fd:	c9                   	leave  
  2871fe:	c3                   	ret    

002871ff <tek_lzrestore_tek5>:

static int tek_decmain5(int *work, UCHAR *src, int osiz, UCHAR *q, int lc, int pb, int lp, int flags);

static int tek_lzrestore_tek5(int srcsiz, UCHAR *src, int outsiz, UCHAR *outbuf)
{
  2871ff:	f3 0f 1e fb          	endbr32 
  287203:	55                   	push   %ebp
  287204:	89 e5                	mov    %esp,%ebp
  287206:	83 ec 28             	sub    $0x28,%esp
	int wrksiz, lc, lp, pb, flags, *work, prop0, fl;

	if ((fl = (prop0 = *src) & 0x0f) == 0x01) /* 0001 */
  287209:	8b 45 0c             	mov    0xc(%ebp),%eax
  28720c:	0f b6 00             	movzbl (%eax),%eax
  28720f:	0f b6 c0             	movzbl %al,%eax
  287212:	89 45 e8             	mov    %eax,-0x18(%ebp)
  287215:	8b 45 e8             	mov    -0x18(%ebp),%eax
  287218:	83 e0 0f             	and    $0xf,%eax
  28721b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  28721e:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
  287222:	75 09                	jne    28722d <tek_lzrestore_tek5+0x2e>
		flags |= -1;
  287224:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
  28722b:	eb 28                	jmp    287255 <tek_lzrestore_tek5+0x56>
	else if (fl == 0x05)
  28722d:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
  287231:	75 09                	jne    28723c <tek_lzrestore_tek5+0x3d>
		flags = -2;
  287233:	c7 45 ec fe ff ff ff 	movl   $0xfffffffe,-0x14(%ebp)
  28723a:	eb 19                	jmp    287255 <tek_lzrestore_tek5+0x56>
	else if (fl == 0x09)
  28723c:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
  287240:	75 09                	jne    28724b <tek_lzrestore_tek5+0x4c>
		flags &= 0;
  287242:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  287249:	eb 0a                	jmp    287255 <tek_lzrestore_tek5+0x56>
	else
		return 1;
  28724b:	b8 01 00 00 00       	mov    $0x1,%eax
  287250:	e9 a4 01 00 00       	jmp    2873f9 <tek_lzrestore_tek5+0x1fa>
	src++;
  287255:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
	prop0 >>= 4;
  287259:	c1 7d e8 04          	sarl   $0x4,-0x18(%ebp)
	if (prop0 == 0)
  28725d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  287261:	75 14                	jne    287277 <tek_lzrestore_tek5+0x78>
		prop0 = *src++;
  287263:	8b 45 0c             	mov    0xc(%ebp),%eax
  287266:	8d 50 01             	lea    0x1(%eax),%edx
  287269:	89 55 0c             	mov    %edx,0xc(%ebp)
  28726c:	0f b6 00             	movzbl (%eax),%eax
  28726f:	0f b6 c0             	movzbl %al,%eax
  287272:	89 45 e8             	mov    %eax,-0x18(%ebp)
  287275:	eb 4e                	jmp    2872c5 <tek_lzrestore_tek5+0xc6>
	else {
		static UCHAR prop0_table[] = { 0x5d, 0x00 }, prop1_table[] = { 0x00 };
		if (flags == -1) {
  287277:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  28727b:	75 25                	jne    2872a2 <tek_lzrestore_tek5+0xa3>
			if (prop0 >= 3)
  28727d:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
  287281:	7e 0a                	jle    28728d <tek_lzrestore_tek5+0x8e>
				return 1;
  287283:	b8 01 00 00 00       	mov    $0x1,%eax
  287288:	e9 6c 01 00 00       	jmp    2873f9 <tek_lzrestore_tek5+0x1fa>
			prop0 = prop0_table[prop0 - 1];
  28728d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  287290:	83 e8 01             	sub    $0x1,%eax
  287293:	0f b6 80 6f 14 31 00 	movzbl 0x31146f(%eax),%eax
  28729a:	0f b6 c0             	movzbl %al,%eax
  28729d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2872a0:	eb 23                	jmp    2872c5 <tek_lzrestore_tek5+0xc6>
		} else {
			if (prop0 >= 2)
  2872a2:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  2872a6:	7e 0a                	jle    2872b2 <tek_lzrestore_tek5+0xb3>
				return 1;
  2872a8:	b8 01 00 00 00       	mov    $0x1,%eax
  2872ad:	e9 47 01 00 00       	jmp    2873f9 <tek_lzrestore_tek5+0x1fa>
			prop0 = prop1_table[prop0 - 1];
  2872b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2872b5:	83 e8 01             	sub    $0x1,%eax
  2872b8:	0f b6 80 d0 14 31 00 	movzbl 0x3114d0(%eax),%eax
  2872bf:	0f b6 c0             	movzbl %al,%eax
  2872c2:	89 45 e8             	mov    %eax,-0x18(%ebp)
		}
	}
	lp = prop0 / (9 * 5);
  2872c5:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  2872c8:	ba b7 60 0b b6       	mov    $0xb60b60b7,%edx
  2872cd:	89 c8                	mov    %ecx,%eax
  2872cf:	f7 ea                	imul   %edx
  2872d1:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  2872d4:	c1 f8 05             	sar    $0x5,%eax
  2872d7:	89 c2                	mov    %eax,%edx
  2872d9:	89 c8                	mov    %ecx,%eax
  2872db:	c1 f8 1f             	sar    $0x1f,%eax
  2872de:	29 c2                	sub    %eax,%edx
  2872e0:	89 d0                	mov    %edx,%eax
  2872e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	prop0 %= 9 * 5;
  2872e5:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  2872e8:	ba b7 60 0b b6       	mov    $0xb60b60b7,%edx
  2872ed:	89 c8                	mov    %ecx,%eax
  2872ef:	f7 ea                	imul   %edx
  2872f1:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  2872f4:	c1 f8 05             	sar    $0x5,%eax
  2872f7:	89 c2                	mov    %eax,%edx
  2872f9:	89 c8                	mov    %ecx,%eax
  2872fb:	c1 f8 1f             	sar    $0x1f,%eax
  2872fe:	29 c2                	sub    %eax,%edx
  287300:	89 d0                	mov    %edx,%eax
  287302:	6b c0 2d             	imul   $0x2d,%eax,%eax
  287305:	29 c1                	sub    %eax,%ecx
  287307:	89 c8                	mov    %ecx,%eax
  287309:	89 45 e8             	mov    %eax,-0x18(%ebp)
	pb = prop0 / 9;
  28730c:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  28730f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
  287314:	89 c8                	mov    %ecx,%eax
  287316:	f7 ea                	imul   %edx
  287318:	d1 fa                	sar    %edx
  28731a:	89 c8                	mov    %ecx,%eax
  28731c:	c1 f8 1f             	sar    $0x1f,%eax
  28731f:	29 c2                	sub    %eax,%edx
  287321:	89 d0                	mov    %edx,%eax
  287323:	89 45 f0             	mov    %eax,-0x10(%ebp)
	lc = prop0 % 9;
  287326:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  287329:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
  28732e:	89 c8                	mov    %ecx,%eax
  287330:	f7 ea                	imul   %edx
  287332:	d1 fa                	sar    %edx
  287334:	89 c8                	mov    %ecx,%eax
  287336:	c1 f8 1f             	sar    $0x1f,%eax
  287339:	29 c2                	sub    %eax,%edx
  28733b:	89 d0                	mov    %edx,%eax
  28733d:	c1 e0 03             	shl    $0x3,%eax
  287340:	01 d0                	add    %edx,%eax
  287342:	29 c1                	sub    %eax,%ecx
  287344:	89 c8                	mov    %ecx,%eax
  287346:	89 45 e0             	mov    %eax,-0x20(%ebp)
	if (flags == 0) /* tek5:z2 */
  287349:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  28734d:	75 12                	jne    287361 <tek_lzrestore_tek5+0x162>
		flags = *src++;
  28734f:	8b 45 0c             	mov    0xc(%ebp),%eax
  287352:	8d 50 01             	lea    0x1(%eax),%edx
  287355:	89 55 0c             	mov    %edx,0xc(%ebp)
  287358:	0f b6 00             	movzbl (%eax),%eax
  28735b:	0f b6 c0             	movzbl %al,%eax
  28735e:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (flags == -1) { /* stk5 */
  287361:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  287365:	75 12                	jne    287379 <tek_lzrestore_tek5+0x17a>
		wrksiz = lp;
  287367:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28736a:	89 45 dc             	mov    %eax,-0x24(%ebp)
		lp = pb;
  28736d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  287370:	89 45 f4             	mov    %eax,-0xc(%ebp)
		pb = wrksiz;
  287373:	8b 45 dc             	mov    -0x24(%ebp),%eax
  287376:	89 45 f0             	mov    %eax,-0x10(%ebp)
	}
	wrksiz = 0x180 * sizeof (UINT32) + (0x840 + (0x300 << (lc + lp))) * sizeof (tek_TPRB); /* ç≈í·15KB, lc+lp=3Ç»ÇÁÅA36KB */
  287379:	8b 55 e0             	mov    -0x20(%ebp),%edx
  28737c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28737f:	01 d0                	add    %edx,%eax
  287381:	ba 00 03 00 00       	mov    $0x300,%edx
  287386:	89 c1                	mov    %eax,%ecx
  287388:	d3 e2                	shl    %cl,%edx
  28738a:	89 d0                	mov    %edx,%eax
  28738c:	05 c0 09 00 00       	add    $0x9c0,%eax
  287391:	c1 e0 02             	shl    $0x2,%eax
  287394:	89 45 dc             	mov    %eax,-0x24(%ebp)
	work = (int *) memman_alloc_4k((struct MEMMAN *) MEMMAN_ADDR, wrksiz);
  287397:	8b 45 dc             	mov    -0x24(%ebp),%eax
  28739a:	83 ec 08             	sub    $0x8,%esp
  28739d:	50                   	push   %eax
  28739e:	68 00 00 3c 00       	push   $0x3c0000
  2873a3:	e8 4c b5 ff ff       	call   2828f4 <memman_alloc_4k>
  2873a8:	83 c4 10             	add    $0x10,%esp
  2873ab:	89 45 d8             	mov    %eax,-0x28(%ebp)
	if (work == NULL)
  2873ae:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  2873b2:	75 07                	jne    2873bb <tek_lzrestore_tek5+0x1bc>
		return -1;
  2873b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  2873b9:	eb 3e                	jmp    2873f9 <tek_lzrestore_tek5+0x1fa>
	flags = tek_decmain5(work, src, outsiz, outbuf, lc, pb, lp, flags);
  2873bb:	ff 75 ec             	pushl  -0x14(%ebp)
  2873be:	ff 75 f4             	pushl  -0xc(%ebp)
  2873c1:	ff 75 f0             	pushl  -0x10(%ebp)
  2873c4:	ff 75 e0             	pushl  -0x20(%ebp)
  2873c7:	ff 75 14             	pushl  0x14(%ebp)
  2873ca:	ff 75 10             	pushl  0x10(%ebp)
  2873cd:	ff 75 0c             	pushl  0xc(%ebp)
  2873d0:	ff 75 d8             	pushl  -0x28(%ebp)
  2873d3:	e8 df 06 00 00       	call   287ab7 <tek_decmain5>
  2873d8:	83 c4 20             	add    $0x20,%esp
  2873db:	89 45 ec             	mov    %eax,-0x14(%ebp)
	memman_free_4k((struct MEMMAN *) MEMMAN_ADDR, (int) work, wrksiz);
  2873de:	8b 55 dc             	mov    -0x24(%ebp),%edx
  2873e1:	8b 45 d8             	mov    -0x28(%ebp),%eax
  2873e4:	83 ec 04             	sub    $0x4,%esp
  2873e7:	52                   	push   %edx
  2873e8:	50                   	push   %eax
  2873e9:	68 00 00 3c 00       	push   $0x3c0000
  2873ee:	e8 31 b5 ff ff       	call   282924 <memman_free_4k>
  2873f3:	83 c4 10             	add    $0x10,%esp
	return flags;
  2873f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
  2873f9:	c9                   	leave  
  2873fa:	c3                   	ret    

002873fb <tek_setbm5>:
	struct tek_STR_BITMODEL bm[32], *ptbm[16];
	struct tek_STR_PRB probs;
};

static void tek_setbm5(struct tek_STR_BITMODEL *bm, int t, int m)
{
  2873fb:	f3 0f 1e fb          	endbr32 
  2873ff:	55                   	push   %ebp
  287400:	89 e5                	mov    %esp,%ebp
  287402:	53                   	push   %ebx
	bm->t = t;
  287403:	8b 45 0c             	mov    0xc(%ebp),%eax
  287406:	89 c2                	mov    %eax,%edx
  287408:	8b 45 08             	mov    0x8(%ebp),%eax
  28740b:	88 10                	mov    %dl,(%eax)
	bm->m = m;
  28740d:	8b 45 10             	mov    0x10(%ebp),%eax
  287410:	89 c2                	mov    %eax,%edx
  287412:	8b 45 08             	mov    0x8(%ebp),%eax
  287415:	88 50 01             	mov    %dl,0x1(%eax)
	bm->prb1 = -1 << (m + t);
  287418:	8b 55 10             	mov    0x10(%ebp),%edx
  28741b:	8b 45 0c             	mov    0xc(%ebp),%eax
  28741e:	01 d0                	add    %edx,%eax
  287420:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  287425:	89 c1                	mov    %eax,%ecx
  287427:	d3 e2                	shl    %cl,%edx
  287429:	89 d0                	mov    %edx,%eax
  28742b:	89 c2                	mov    %eax,%edx
  28742d:	8b 45 08             	mov    0x8(%ebp),%eax
  287430:	89 50 08             	mov    %edx,0x8(%eax)
	bm->prb0 = ~bm->prb1;
  287433:	8b 45 08             	mov    0x8(%ebp),%eax
  287436:	8b 40 08             	mov    0x8(%eax),%eax
  287439:	f7 d0                	not    %eax
  28743b:	89 c2                	mov    %eax,%edx
  28743d:	8b 45 08             	mov    0x8(%ebp),%eax
  287440:	89 50 04             	mov    %edx,0x4(%eax)
	bm->prb1 |= 1 << t;
  287443:	8b 45 08             	mov    0x8(%ebp),%eax
  287446:	8b 50 08             	mov    0x8(%eax),%edx
  287449:	8b 45 0c             	mov    0xc(%ebp),%eax
  28744c:	bb 01 00 00 00       	mov    $0x1,%ebx
  287451:	89 c1                	mov    %eax,%ecx
  287453:	d3 e3                	shl    %cl,%ebx
  287455:	89 d8                	mov    %ebx,%eax
  287457:	09 c2                	or     %eax,%edx
  287459:	8b 45 08             	mov    0x8(%ebp),%eax
  28745c:	89 50 08             	mov    %edx,0x8(%eax)
	bm->tmsk = (-1 << t) & 0xffff;
  28745f:	8b 45 0c             	mov    0xc(%ebp),%eax
  287462:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  287467:	89 c1                	mov    %eax,%ecx
  287469:	d3 e2                	shl    %cl,%edx
  28746b:	89 d0                	mov    %edx,%eax
  28746d:	0f b7 d0             	movzwl %ax,%edx
  287470:	8b 45 08             	mov    0x8(%ebp),%eax
  287473:	89 50 0c             	mov    %edx,0xc(%eax)
	bm->prb0 &= bm->tmsk;
  287476:	8b 45 08             	mov    0x8(%ebp),%eax
  287479:	8b 50 04             	mov    0x4(%eax),%edx
  28747c:	8b 45 08             	mov    0x8(%ebp),%eax
  28747f:	8b 40 0c             	mov    0xc(%eax),%eax
  287482:	21 c2                	and    %eax,%edx
  287484:	8b 45 08             	mov    0x8(%ebp),%eax
  287487:	89 50 04             	mov    %edx,0x4(%eax)
	bm->prb1 &= bm->tmsk;
  28748a:	8b 45 08             	mov    0x8(%ebp),%eax
  28748d:	8b 50 08             	mov    0x8(%eax),%edx
  287490:	8b 45 08             	mov    0x8(%ebp),%eax
  287493:	8b 40 0c             	mov    0xc(%eax),%eax
  287496:	21 c2                	and    %eax,%edx
  287498:	8b 45 08             	mov    0x8(%ebp),%eax
  28749b:	89 50 08             	mov    %edx,0x8(%eax)
	bm->ntm = ~bm->tmsk;
  28749e:	8b 45 08             	mov    0x8(%ebp),%eax
  2874a1:	8b 40 0c             	mov    0xc(%eax),%eax
  2874a4:	f7 d0                	not    %eax
  2874a6:	89 c2                	mov    %eax,%edx
  2874a8:	8b 45 08             	mov    0x8(%ebp),%eax
  2874ab:	89 50 10             	mov    %edx,0x10(%eax)
	return;
  2874ae:	90                   	nop
}
  2874af:	5b                   	pop    %ebx
  2874b0:	5d                   	pop    %ebp
  2874b1:	c3                   	ret    

002874b2 <tek_rdget0>:

static int tek_rdget0(struct tek_STR_RNGDEC *rd, int n, int i)
{
  2874b2:	f3 0f 1e fb          	endbr32 
  2874b6:	55                   	push   %ebp
  2874b7:	89 e5                	mov    %esp,%ebp
  2874b9:	53                   	push   %ebx
	do {
		while (rd->range < (UINT32) (1 << 24)) {
  2874ba:	eb 39                	jmp    2874f5 <tek_rdget0+0x43>
			rd->range <<= 8;
  2874bc:	8b 45 08             	mov    0x8(%ebp),%eax
  2874bf:	8b 40 04             	mov    0x4(%eax),%eax
  2874c2:	c1 e0 08             	shl    $0x8,%eax
  2874c5:	89 c2                	mov    %eax,%edx
  2874c7:	8b 45 08             	mov    0x8(%ebp),%eax
  2874ca:	89 50 04             	mov    %edx,0x4(%eax)
			rd->code = rd->code << 8 | *rd->p++;
  2874cd:	8b 45 08             	mov    0x8(%ebp),%eax
  2874d0:	8b 40 08             	mov    0x8(%eax),%eax
  2874d3:	c1 e0 08             	shl    $0x8,%eax
  2874d6:	89 c3                	mov    %eax,%ebx
  2874d8:	8b 45 08             	mov    0x8(%ebp),%eax
  2874db:	8b 00                	mov    (%eax),%eax
  2874dd:	8d 48 01             	lea    0x1(%eax),%ecx
  2874e0:	8b 55 08             	mov    0x8(%ebp),%edx
  2874e3:	89 0a                	mov    %ecx,(%edx)
  2874e5:	0f b6 00             	movzbl (%eax),%eax
  2874e8:	0f b6 c0             	movzbl %al,%eax
  2874eb:	09 c3                	or     %eax,%ebx
  2874ed:	89 da                	mov    %ebx,%edx
  2874ef:	8b 45 08             	mov    0x8(%ebp),%eax
  2874f2:	89 50 08             	mov    %edx,0x8(%eax)
		while (rd->range < (UINT32) (1 << 24)) {
  2874f5:	8b 45 08             	mov    0x8(%ebp),%eax
  2874f8:	8b 40 04             	mov    0x4(%eax),%eax
  2874fb:	3d ff ff ff 00       	cmp    $0xffffff,%eax
  287500:	76 ba                	jbe    2874bc <tek_rdget0+0xa>
		}
		rd->range >>= 1;
  287502:	8b 45 08             	mov    0x8(%ebp),%eax
  287505:	8b 40 04             	mov    0x4(%eax),%eax
  287508:	d1 e8                	shr    %eax
  28750a:	89 c2                	mov    %eax,%edx
  28750c:	8b 45 08             	mov    0x8(%ebp),%eax
  28750f:	89 50 04             	mov    %edx,0x4(%eax)
		i += i;
  287512:	d1 65 10             	shll   0x10(%ebp)
		if (rd->code >= rd->range) {
  287515:	8b 45 08             	mov    0x8(%ebp),%eax
  287518:	8b 50 08             	mov    0x8(%eax),%edx
  28751b:	8b 45 08             	mov    0x8(%ebp),%eax
  28751e:	8b 40 04             	mov    0x4(%eax),%eax
  287521:	39 c2                	cmp    %eax,%edx
  287523:	72 18                	jb     28753d <tek_rdget0+0x8b>
			rd->code -= rd->range;
  287525:	8b 45 08             	mov    0x8(%ebp),%eax
  287528:	8b 50 08             	mov    0x8(%eax),%edx
  28752b:	8b 45 08             	mov    0x8(%ebp),%eax
  28752e:	8b 40 04             	mov    0x4(%eax),%eax
  287531:	29 c2                	sub    %eax,%edx
  287533:	8b 45 08             	mov    0x8(%ebp),%eax
  287536:	89 50 08             	mov    %edx,0x8(%eax)
			i |= 1;
  287539:	83 4d 10 01          	orl    $0x1,0x10(%ebp)
		}
	} while (--n);
  28753d:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
  287541:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  287545:	75 ae                	jne    2874f5 <tek_rdget0+0x43>
	return ~i;
  287547:	8b 45 10             	mov    0x10(%ebp),%eax
  28754a:	f7 d0                	not    %eax
}
  28754c:	5b                   	pop    %ebx
  28754d:	5d                   	pop    %ebp
  28754e:	c3                   	ret    

0028754f <tek_rdget1>:

static int tek_rdget1(struct tek_STR_RNGDEC *rd, tek_TPRB *prob0, int n, int j, struct tek_STR_BITMODEL *bm)
{
  28754f:	f3 0f 1e fb          	endbr32 
  287553:	55                   	push   %ebp
  287554:	89 e5                	mov    %esp,%ebp
  287556:	57                   	push   %edi
  287557:	56                   	push   %esi
  287558:	53                   	push   %ebx
  287559:	83 ec 1c             	sub    $0x1c,%esp
	UINT32 p, i, *prob, nm = n >> 4;
  28755c:	8b 45 10             	mov    0x10(%ebp),%eax
  28755f:	c1 f8 04             	sar    $0x4,%eax
  287562:	89 45 e0             	mov    %eax,-0x20(%ebp)
	n &= 0x0f;
  287565:	83 65 10 0f          	andl   $0xf,0x10(%ebp)
	prob0 -= j;
  287569:	8b 45 14             	mov    0x14(%ebp),%eax
  28756c:	c1 e0 02             	shl    $0x2,%eax
  28756f:	f7 d8                	neg    %eax
  287571:	01 45 0c             	add    %eax,0xc(%ebp)
	do {
		p = *(prob = prob0 + j);
  287574:	8b 45 14             	mov    0x14(%ebp),%eax
  287577:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  28757e:	8b 45 0c             	mov    0xc(%ebp),%eax
  287581:	01 d0                	add    %edx,%eax
  287583:	89 45 dc             	mov    %eax,-0x24(%ebp)
  287586:	8b 45 dc             	mov    -0x24(%ebp),%eax
  287589:	8b 00                	mov    (%eax),%eax
  28758b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		if (bm->lt > 0) {
  28758e:	8b 45 18             	mov    0x18(%ebp),%eax
  287591:	8b 40 14             	mov    0x14(%eax),%eax
  287594:	85 c0                	test   %eax,%eax
  287596:	0f 84 f3 01 00 00    	je     28778f <tek_rdget1+0x240>
			if (--bm->lt == 0) {
  28759c:	8b 45 18             	mov    0x18(%ebp),%eax
  28759f:	8b 40 14             	mov    0x14(%eax),%eax
  2875a2:	8d 50 ff             	lea    -0x1(%eax),%edx
  2875a5:	8b 45 18             	mov    0x18(%ebp),%eax
  2875a8:	89 50 14             	mov    %edx,0x14(%eax)
  2875ab:	8b 45 18             	mov    0x18(%ebp),%eax
  2875ae:	8b 40 14             	mov    0x14(%eax),%eax
  2875b1:	85 c0                	test   %eax,%eax
  2875b3:	0f 85 51 01 00 00    	jne    28770a <tek_rdget1+0x1bb>
				/* éıñΩêÿÇÍ */
				if (tek_rdget1(rd, &rd->probs.fchglt, 0x71, 0, &rd->bm[3]) == 0) {
  2875b9:	8b 45 08             	mov    0x8(%ebp),%eax
  2875bc:	8d 50 7c             	lea    0x7c(%eax),%edx
  2875bf:	8b 45 08             	mov    0x8(%ebp),%eax
  2875c2:	05 98 24 00 00       	add    $0x2498,%eax
  2875c7:	83 ec 0c             	sub    $0xc,%esp
  2875ca:	52                   	push   %edx
  2875cb:	6a 00                	push   $0x0
  2875cd:	6a 71                	push   $0x71
  2875cf:	50                   	push   %eax
  2875d0:	ff 75 08             	pushl  0x8(%ebp)
  2875d3:	e8 77 ff ff ff       	call   28754f <tek_rdget1>
  2875d8:	83 c4 20             	add    $0x20,%esp
  2875db:	85 c0                	test   %eax,%eax
  2875dd:	75 4b                	jne    28762a <tek_rdget1+0xdb>
					/* éıñΩïœçXÇÕÇ‹ÇæÉTÉ|Å[ÉgÇµÇƒÇ»Ç¢ */
err:
  2875df:	90                   	nop
  2875e0:	eb 01                	jmp    2875e3 <tek_rdget1+0x94>
				}
				i = bm - rd->bm;
				if ((bm->s = tek_rdget1(rd, &rd->probs.fchgprm[i * 2 + bm->s], 0x71, 0, &rd->bm[1])) == 0) {
					i = tek_rdget1(rd, rd->probs.tbmt, 0x74, 1, &rd->bm[2]) & 15;
					if (i == 15)
						goto err;
  2875e2:	90                   	nop
					longjmp(rd->errjmp, 1);
  2875e3:	8b 45 08             	mov    0x8(%ebp),%eax
  2875e6:	8d 50 10             	lea    0x10(%eax),%edx
  2875e9:	8b 4a 04             	mov    0x4(%edx),%ecx
  2875ec:	8b 1a                	mov    (%edx),%ebx
  2875ee:	b8 00 00 00 00       	mov    $0x0,%eax
  2875f3:	31 c0                	xor    %eax,%eax
  2875f5:	f3 0f 1e c8          	rdsspd %eax
  2875f9:	2b 42 08             	sub    0x8(%edx),%eax
  2875fc:	74 25                	je     287623 <tek_rdget1+0xd4>
  2875fe:	f7 d8                	neg    %eax
  287600:	c1 e8 02             	shr    $0x2,%eax
  287603:	3d ff 00 00 00       	cmp    $0xff,%eax
  287608:	76 15                	jbe    28761f <tek_rdget1+0xd0>
  28760a:	be ff 00 00 00       	mov    $0xff,%esi
  28760f:	f3 0f ae ee          	incsspd %esi
  287613:	2d ff 00 00 00       	sub    $0xff,%eax
  287618:	3d ff 00 00 00       	cmp    $0xff,%eax
  28761d:	77 f0                	ja     28760f <tek_rdget1+0xc0>
  28761f:	f3 0f ae e8          	incsspd %eax
  287623:	8b 62 0c             	mov    0xc(%edx),%esp
  287626:	89 dd                	mov    %ebx,%ebp
  287628:	ff e1                	jmp    *%ecx
				i = bm - rd->bm;
  28762a:	8b 45 08             	mov    0x8(%ebp),%eax
  28762d:	8d 50 1c             	lea    0x1c(%eax),%edx
  287630:	8b 45 18             	mov    0x18(%ebp),%eax
  287633:	29 d0                	sub    %edx,%eax
  287635:	c1 f8 05             	sar    $0x5,%eax
  287638:	89 45 d8             	mov    %eax,-0x28(%ebp)
				if ((bm->s = tek_rdget1(rd, &rd->probs.fchgprm[i * 2 + bm->s], 0x71, 0, &rd->bm[1])) == 0) {
  28763b:	8b 45 08             	mov    0x8(%ebp),%eax
  28763e:	8d 50 3c             	lea    0x3c(%eax),%edx
  287641:	8b 45 d8             	mov    -0x28(%ebp),%eax
  287644:	8d 0c 00             	lea    (%eax,%eax,1),%ecx
  287647:	8b 45 18             	mov    0x18(%ebp),%eax
  28764a:	0f b6 40 02          	movzbl 0x2(%eax),%eax
  28764e:	0f b6 c0             	movzbl %al,%eax
  287651:	01 c8                	add    %ecx,%eax
  287653:	05 c0 08 00 00       	add    $0x8c0,%eax
  287658:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  28765f:	8b 45 08             	mov    0x8(%ebp),%eax
  287662:	01 c8                	add    %ecx,%eax
  287664:	83 c0 18             	add    $0x18,%eax
  287667:	83 ec 0c             	sub    $0xc,%esp
  28766a:	52                   	push   %edx
  28766b:	6a 00                	push   $0x0
  28766d:	6a 71                	push   $0x71
  28766f:	50                   	push   %eax
  287670:	ff 75 08             	pushl  0x8(%ebp)
  287673:	e8 d7 fe ff ff       	call   28754f <tek_rdget1>
  287678:	83 c4 20             	add    $0x20,%esp
  28767b:	89 c2                	mov    %eax,%edx
  28767d:	8b 45 18             	mov    0x18(%ebp),%eax
  287680:	88 50 02             	mov    %dl,0x2(%eax)
  287683:	8b 45 18             	mov    0x18(%ebp),%eax
  287686:	0f b6 40 02          	movzbl 0x2(%eax),%eax
  28768a:	84 c0                	test   %al,%al
  28768c:	75 70                	jne    2876fe <tek_rdget1+0x1af>
					i = tek_rdget1(rd, rd->probs.tbmt, 0x74, 1, &rd->bm[2]) & 15;
  28768e:	8b 45 08             	mov    0x8(%ebp),%eax
  287691:	8d 50 5c             	lea    0x5c(%eax),%edx
  287694:	8b 45 08             	mov    0x8(%ebp),%eax
  287697:	05 18 24 00 00       	add    $0x2418,%eax
  28769c:	83 ec 0c             	sub    $0xc,%esp
  28769f:	52                   	push   %edx
  2876a0:	6a 01                	push   $0x1
  2876a2:	6a 74                	push   $0x74
  2876a4:	50                   	push   %eax
  2876a5:	ff 75 08             	pushl  0x8(%ebp)
  2876a8:	e8 a2 fe ff ff       	call   28754f <tek_rdget1>
  2876ad:	83 c4 20             	add    $0x20,%esp
  2876b0:	83 e0 0f             	and    $0xf,%eax
  2876b3:	89 45 d8             	mov    %eax,-0x28(%ebp)
					if (i == 15)
  2876b6:	83 7d d8 0f          	cmpl   $0xf,-0x28(%ebp)
  2876ba:	0f 84 22 ff ff ff    	je     2875e2 <tek_rdget1+0x93>
					tek_setbm5(bm, i, ((tek_rdget1(rd, rd->probs.tbmm, 0x74, 1, &rd->bm[2]) - 1) & 15) + 1);
  2876c0:	8b 45 08             	mov    0x8(%ebp),%eax
  2876c3:	8d 50 5c             	lea    0x5c(%eax),%edx
  2876c6:	8b 45 08             	mov    0x8(%ebp),%eax
  2876c9:	05 58 24 00 00       	add    $0x2458,%eax
  2876ce:	83 ec 0c             	sub    $0xc,%esp
  2876d1:	52                   	push   %edx
  2876d2:	6a 01                	push   $0x1
  2876d4:	6a 74                	push   $0x74
  2876d6:	50                   	push   %eax
  2876d7:	ff 75 08             	pushl  0x8(%ebp)
  2876da:	e8 70 fe ff ff       	call   28754f <tek_rdget1>
  2876df:	83 c4 20             	add    $0x20,%esp
  2876e2:	83 e8 01             	sub    $0x1,%eax
  2876e5:	83 e0 0f             	and    $0xf,%eax
  2876e8:	8d 50 01             	lea    0x1(%eax),%edx
  2876eb:	8b 45 d8             	mov    -0x28(%ebp),%eax
  2876ee:	83 ec 04             	sub    $0x4,%esp
  2876f1:	52                   	push   %edx
  2876f2:	50                   	push   %eax
  2876f3:	ff 75 18             	pushl  0x18(%ebp)
  2876f6:	e8 00 fd ff ff       	call   2873fb <tek_setbm5>
  2876fb:	83 c4 10             	add    $0x10,%esp
				}
				bm->lt = bm->lt0;
  2876fe:	8b 45 18             	mov    0x18(%ebp),%eax
  287701:	8b 50 18             	mov    0x18(%eax),%edx
  287704:	8b 45 18             	mov    0x18(%ebp),%eax
  287707:	89 50 14             	mov    %edx,0x14(%eax)
			}
			if (p < bm->prb0) {
  28770a:	8b 45 18             	mov    0x18(%ebp),%eax
  28770d:	8b 40 04             	mov    0x4(%eax),%eax
  287710:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
  287713:	73 0b                	jae    287720 <tek_rdget1+0x1d1>
				p = bm->prb0;
  287715:	8b 45 18             	mov    0x18(%ebp),%eax
  287718:	8b 40 04             	mov    0x4(%eax),%eax
  28771b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				goto fixprob;
  28771e:	eb 2c                	jmp    28774c <tek_rdget1+0x1fd>
			}
			if (p > bm->prb1) {
  287720:	8b 45 18             	mov    0x18(%ebp),%eax
  287723:	8b 40 08             	mov    0x8(%eax),%eax
  287726:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
  287729:	76 0b                	jbe    287736 <tek_rdget1+0x1e7>
				p = bm->prb1;
  28772b:	8b 45 18             	mov    0x18(%ebp),%eax
  28772e:	8b 40 08             	mov    0x8(%eax),%eax
  287731:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				goto fixprob;
  287734:	eb 16                	jmp    28774c <tek_rdget1+0x1fd>
			}
			if (p & bm->ntm) {
  287736:	8b 45 18             	mov    0x18(%ebp),%eax
  287739:	8b 40 10             	mov    0x10(%eax),%eax
  28773c:	23 45 e4             	and    -0x1c(%ebp),%eax
  28773f:	85 c0                	test   %eax,%eax
  287741:	74 4c                	je     28778f <tek_rdget1+0x240>
				p &= bm->tmsk;
  287743:	8b 45 18             	mov    0x18(%ebp),%eax
  287746:	8b 40 0c             	mov    0xc(%eax),%eax
  287749:	21 45 e4             	and    %eax,-0x1c(%ebp)
	fixprob:
				*prob = p;
  28774c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  28774f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287752:	89 10                	mov    %edx,(%eax)
			}
		}

		while (rd->range < (UINT32) (1 << 24)) {
  287754:	eb 39                	jmp    28778f <tek_rdget1+0x240>
			rd->range <<= 8;
  287756:	8b 45 08             	mov    0x8(%ebp),%eax
  287759:	8b 40 04             	mov    0x4(%eax),%eax
  28775c:	c1 e0 08             	shl    $0x8,%eax
  28775f:	89 c2                	mov    %eax,%edx
  287761:	8b 45 08             	mov    0x8(%ebp),%eax
  287764:	89 50 04             	mov    %edx,0x4(%eax)
			rd->code = rd->code << 8 | *rd->p++;
  287767:	8b 45 08             	mov    0x8(%ebp),%eax
  28776a:	8b 40 08             	mov    0x8(%eax),%eax
  28776d:	c1 e0 08             	shl    $0x8,%eax
  287770:	89 c3                	mov    %eax,%ebx
  287772:	8b 45 08             	mov    0x8(%ebp),%eax
  287775:	8b 00                	mov    (%eax),%eax
  287777:	8d 48 01             	lea    0x1(%eax),%ecx
  28777a:	8b 55 08             	mov    0x8(%ebp),%edx
  28777d:	89 0a                	mov    %ecx,(%edx)
  28777f:	0f b6 00             	movzbl (%eax),%eax
  287782:	0f b6 c0             	movzbl %al,%eax
  287785:	09 c3                	or     %eax,%ebx
  287787:	89 da                	mov    %ebx,%edx
  287789:	8b 45 08             	mov    0x8(%ebp),%eax
  28778c:	89 50 08             	mov    %edx,0x8(%eax)
		while (rd->range < (UINT32) (1 << 24)) {
  28778f:	8b 45 08             	mov    0x8(%ebp),%eax
  287792:	8b 40 04             	mov    0x4(%eax),%eax
  287795:	3d ff ff ff 00       	cmp    $0xffffff,%eax
  28779a:	76 ba                	jbe    287756 <tek_rdget1+0x207>
		}
		j += j;
  28779c:	d1 65 14             	shll   0x14(%ebp)
		i = ((unsigned long long) (rd->range & rd->rmsk) * p) >> 16;
  28779f:	8b 45 08             	mov    0x8(%ebp),%eax
  2877a2:	8b 50 04             	mov    0x4(%eax),%edx
  2877a5:	8b 45 08             	mov    0x8(%ebp),%eax
  2877a8:	8b 40 0c             	mov    0xc(%eax),%eax
  2877ab:	21 d0                	and    %edx,%eax
  2877ad:	89 c1                	mov    %eax,%ecx
  2877af:	bb 00 00 00 00       	mov    $0x0,%ebx
  2877b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2877b7:	ba 00 00 00 00       	mov    $0x0,%edx
  2877bc:	89 df                	mov    %ebx,%edi
  2877be:	0f af f8             	imul   %eax,%edi
  2877c1:	89 d6                	mov    %edx,%esi
  2877c3:	0f af f1             	imul   %ecx,%esi
  2877c6:	01 fe                	add    %edi,%esi
  2877c8:	f7 e1                	mul    %ecx
  2877ca:	8d 0c 16             	lea    (%esi,%edx,1),%ecx
  2877cd:	89 ca                	mov    %ecx,%edx
  2877cf:	0f ac d0 10          	shrd   $0x10,%edx,%eax
  2877d3:	c1 ea 10             	shr    $0x10,%edx
  2877d6:	89 45 d8             	mov    %eax,-0x28(%ebp)
		if (rd->code < i) {
  2877d9:	8b 45 08             	mov    0x8(%ebp),%eax
  2877dc:	8b 40 08             	mov    0x8(%eax),%eax
  2877df:	39 45 d8             	cmp    %eax,-0x28(%ebp)
  2877e2:	76 3d                	jbe    287821 <tek_rdget1+0x2d2>
			j |= 1;
  2877e4:	83 4d 14 01          	orl    $0x1,0x14(%ebp)
			rd->range = i;
  2877e8:	8b 45 08             	mov    0x8(%ebp),%eax
  2877eb:	8b 55 d8             	mov    -0x28(%ebp),%edx
  2877ee:	89 50 04             	mov    %edx,0x4(%eax)
			*prob += ((0x10000 - p) >> bm->m) & bm->tmsk;
  2877f1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  2877f4:	8b 10                	mov    (%eax),%edx
  2877f6:	b8 00 00 01 00       	mov    $0x10000,%eax
  2877fb:	2b 45 e4             	sub    -0x1c(%ebp),%eax
  2877fe:	89 c3                	mov    %eax,%ebx
  287800:	8b 45 18             	mov    0x18(%ebp),%eax
  287803:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  287807:	0f b6 c0             	movzbl %al,%eax
  28780a:	89 c1                	mov    %eax,%ecx
  28780c:	d3 eb                	shr    %cl,%ebx
  28780e:	89 d9                	mov    %ebx,%ecx
  287810:	8b 45 18             	mov    0x18(%ebp),%eax
  287813:	8b 40 0c             	mov    0xc(%eax),%eax
  287816:	21 c8                	and    %ecx,%eax
  287818:	01 c2                	add    %eax,%edx
  28781a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  28781d:	89 10                	mov    %edx,(%eax)
  28781f:	eb 49                	jmp    28786a <tek_rdget1+0x31b>
		} else {
			rd->range -= i;
  287821:	8b 45 08             	mov    0x8(%ebp),%eax
  287824:	8b 40 04             	mov    0x4(%eax),%eax
  287827:	2b 45 d8             	sub    -0x28(%ebp),%eax
  28782a:	89 c2                	mov    %eax,%edx
  28782c:	8b 45 08             	mov    0x8(%ebp),%eax
  28782f:	89 50 04             	mov    %edx,0x4(%eax)
			rd->code -= i;
  287832:	8b 45 08             	mov    0x8(%ebp),%eax
  287835:	8b 40 08             	mov    0x8(%eax),%eax
  287838:	2b 45 d8             	sub    -0x28(%ebp),%eax
  28783b:	89 c2                	mov    %eax,%edx
  28783d:	8b 45 08             	mov    0x8(%ebp),%eax
  287840:	89 50 08             	mov    %edx,0x8(%eax)
			*prob -= (p >> bm->m) & bm->tmsk;
  287843:	8b 45 dc             	mov    -0x24(%ebp),%eax
  287846:	8b 10                	mov    (%eax),%edx
  287848:	8b 45 18             	mov    0x18(%ebp),%eax
  28784b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  28784f:	0f b6 c0             	movzbl %al,%eax
  287852:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  287855:	89 c1                	mov    %eax,%ecx
  287857:	d3 eb                	shr    %cl,%ebx
  287859:	89 d9                	mov    %ebx,%ecx
  28785b:	8b 45 18             	mov    0x18(%ebp),%eax
  28785e:	8b 40 0c             	mov    0xc(%eax),%eax
  287861:	21 c8                	and    %ecx,%eax
  287863:	29 c2                	sub    %eax,%edx
  287865:	8b 45 dc             	mov    -0x24(%ebp),%eax
  287868:	89 10                	mov    %edx,(%eax)
		}
		--n;
  28786a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
		if ((n & nm) == 0)
  28786e:	8b 45 10             	mov    0x10(%ebp),%eax
  287871:	23 45 e0             	and    -0x20(%ebp),%eax
  287874:	85 c0                	test   %eax,%eax
  287876:	75 04                	jne    28787c <tek_rdget1+0x32d>
			bm++;
  287878:	83 45 18 20          	addl   $0x20,0x18(%ebp)
	} while (n);
  28787c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  287880:	0f 85 ee fc ff ff    	jne    287574 <tek_rdget1+0x25>
	return j;
  287886:	8b 45 14             	mov    0x14(%ebp),%eax
}
  287889:	8d 65 f4             	lea    -0xc(%ebp),%esp
  28788c:	5b                   	pop    %ebx
  28788d:	5e                   	pop    %esi
  28788e:	5f                   	pop    %edi
  28788f:	5d                   	pop    %ebp
  287890:	c3                   	ret    

00287891 <tek_revbit>:

static UINT32 tek_revbit(UINT32 data, int len)
{
  287891:	f3 0f 1e fb          	endbr32 
  287895:	55                   	push   %ebp
  287896:	89 e5                	mov    %esp,%ebp
  287898:	83 ec 10             	sub    $0x10,%esp
	UINT32 rev = 0;
  28789b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	do {
		rev += rev + (data & 1);
  2878a2:	8b 45 08             	mov    0x8(%ebp),%eax
  2878a5:	83 e0 01             	and    $0x1,%eax
  2878a8:	89 c2                	mov    %eax,%edx
  2878aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2878ad:	01 d0                	add    %edx,%eax
  2878af:	01 45 fc             	add    %eax,-0x4(%ebp)
		data >>= 1;
  2878b2:	d1 6d 08             	shrl   0x8(%ebp)
	} while (--len);
  2878b5:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
  2878b9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  2878bd:	75 e3                	jne    2878a2 <tek_revbit+0x11>
	return rev;
  2878bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  2878c2:	c9                   	leave  
  2878c3:	c3                   	ret    

002878c4 <tek_getlen5>:

static int tek_getlen5(struct tek_STR_RNGDEC *rd, int m, int s_pos, int stk)
{
  2878c4:	f3 0f 1e fb          	endbr32 
  2878c8:	55                   	push   %ebp
  2878c9:	89 e5                	mov    %esp,%ebp
  2878cb:	56                   	push   %esi
  2878cc:	53                   	push   %ebx
  2878cd:	83 ec 10             	sub    $0x10,%esp
	int i;
	if (tek_rdget1(rd, &rd->probs.lensel[m][0], 0x71, 0, rd->ptbm[3]) ^ stk) /* low */
  2878d0:	8b 45 08             	mov    0x8(%ebp),%eax
  2878d3:	8b 80 28 04 00 00    	mov    0x428(%eax),%eax
  2878d9:	8b 55 0c             	mov    0xc(%ebp),%edx
  2878dc:	81 c2 62 02 00 00    	add    $0x262,%edx
  2878e2:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
  2878e9:	8b 55 08             	mov    0x8(%ebp),%edx
  2878ec:	01 ca                	add    %ecx,%edx
  2878ee:	83 c2 0c             	add    $0xc,%edx
  2878f1:	83 ec 0c             	sub    $0xc,%esp
  2878f4:	50                   	push   %eax
  2878f5:	6a 00                	push   $0x0
  2878f7:	6a 71                	push   $0x71
  2878f9:	52                   	push   %edx
  2878fa:	ff 75 08             	pushl  0x8(%ebp)
  2878fd:	e8 4d fc ff ff       	call   28754f <tek_rdget1>
  287902:	83 c4 20             	add    $0x20,%esp
  287905:	39 45 14             	cmp    %eax,0x14(%ebp)
  287908:	74 4b                	je     287955 <tek_getlen5+0x91>
		i = tek_rdget1(rd, rd->probs.pb[s_pos].lenlow[m], 0x73, 1, rd->ptbm[4]) & 7;
  28790a:	8b 45 08             	mov    0x8(%ebp),%eax
  28790d:	8b 88 2c 04 00 00    	mov    0x42c(%eax),%ecx
  287913:	8b 55 10             	mov    0x10(%ebp),%edx
  287916:	89 d0                	mov    %edx,%eax
  287918:	c1 e0 03             	shl    $0x3,%eax
  28791b:	29 d0                	sub    %edx,%eax
  28791d:	8b 55 0c             	mov    0xc(%ebp),%edx
  287920:	01 d0                	add    %edx,%eax
  287922:	83 c0 03             	add    $0x3,%eax
  287925:	c1 e0 05             	shl    $0x5,%eax
  287928:	8d 90 50 04 00 00    	lea    0x450(%eax),%edx
  28792e:	8b 45 08             	mov    0x8(%ebp),%eax
  287931:	01 d0                	add    %edx,%eax
  287933:	83 c0 0c             	add    $0xc,%eax
  287936:	83 ec 0c             	sub    $0xc,%esp
  287939:	51                   	push   %ecx
  28793a:	6a 01                	push   $0x1
  28793c:	6a 73                	push   $0x73
  28793e:	50                   	push   %eax
  28793f:	ff 75 08             	pushl  0x8(%ebp)
  287942:	e8 08 fc ff ff       	call   28754f <tek_rdget1>
  287947:	83 c4 20             	add    $0x20,%esp
  28794a:	83 e0 07             	and    $0x7,%eax
  28794d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  287950:	e9 58 01 00 00       	jmp    287aad <tek_getlen5+0x1e9>
	else if (tek_rdget1(rd, &rd->probs.lensel[m][1], 0x71, 0, rd->ptbm[3]) ^ stk) /* mid */
  287955:	8b 45 08             	mov    0x8(%ebp),%eax
  287958:	8b 80 28 04 00 00    	mov    0x428(%eax),%eax
  28795e:	8b 55 0c             	mov    0xc(%ebp),%edx
  287961:	c1 e2 03             	shl    $0x3,%edx
  287964:	8d 8a 14 13 00 00    	lea    0x1314(%edx),%ecx
  28796a:	8b 55 08             	mov    0x8(%ebp),%edx
  28796d:	01 ca                	add    %ecx,%edx
  28796f:	83 c2 0c             	add    $0xc,%edx
  287972:	83 ec 0c             	sub    $0xc,%esp
  287975:	50                   	push   %eax
  287976:	6a 00                	push   $0x0
  287978:	6a 71                	push   $0x71
  28797a:	52                   	push   %edx
  28797b:	ff 75 08             	pushl  0x8(%ebp)
  28797e:	e8 cc fb ff ff       	call   28754f <tek_rdget1>
  287983:	83 c4 20             	add    $0x20,%esp
  287986:	39 45 14             	cmp    %eax,0x14(%ebp)
  287989:	74 48                	je     2879d3 <tek_getlen5+0x10f>
		i = tek_rdget1(rd, rd->probs.pb[s_pos].lenmid[m], 0x73, 1, rd->ptbm[5]);
  28798b:	8b 45 08             	mov    0x8(%ebp),%eax
  28798e:	8b 88 30 04 00 00    	mov    0x430(%eax),%ecx
  287994:	8b 55 10             	mov    0x10(%ebp),%edx
  287997:	89 d0                	mov    %edx,%eax
  287999:	c1 e0 03             	shl    $0x3,%eax
  28799c:	29 d0                	sub    %edx,%eax
  28799e:	8b 55 0c             	mov    0xc(%ebp),%edx
  2879a1:	01 d0                	add    %edx,%eax
  2879a3:	83 c0 05             	add    $0x5,%eax
  2879a6:	c1 e0 05             	shl    $0x5,%eax
  2879a9:	8d 90 50 04 00 00    	lea    0x450(%eax),%edx
  2879af:	8b 45 08             	mov    0x8(%ebp),%eax
  2879b2:	01 d0                	add    %edx,%eax
  2879b4:	83 c0 0c             	add    $0xc,%eax
  2879b7:	83 ec 0c             	sub    $0xc,%esp
  2879ba:	51                   	push   %ecx
  2879bb:	6a 01                	push   $0x1
  2879bd:	6a 73                	push   $0x73
  2879bf:	50                   	push   %eax
  2879c0:	ff 75 08             	pushl  0x8(%ebp)
  2879c3:	e8 87 fb ff ff       	call   28754f <tek_rdget1>
  2879c8:	83 c4 20             	add    $0x20,%esp
  2879cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2879ce:	e9 da 00 00 00       	jmp    287aad <tek_getlen5+0x1e9>
	else {
		/* high */
		i = tek_rdget1(rd, rd->probs.lenhigh[m], 0x78, 1, rd->ptbm[6]) - (256 + 256 - 8);
  2879d3:	8b 45 08             	mov    0x8(%ebp),%eax
  2879d6:	8b 80 34 04 00 00    	mov    0x434(%eax),%eax
  2879dc:	8b 55 0c             	mov    0xc(%ebp),%edx
  2879df:	c1 e2 0a             	shl    $0xa,%edx
  2879e2:	8d 8a 20 13 00 00    	lea    0x1320(%edx),%ecx
  2879e8:	8b 55 08             	mov    0x8(%ebp),%edx
  2879eb:	01 ca                	add    %ecx,%edx
  2879ed:	83 c2 0c             	add    $0xc,%edx
  2879f0:	83 ec 0c             	sub    $0xc,%esp
  2879f3:	50                   	push   %eax
  2879f4:	6a 01                	push   $0x1
  2879f6:	6a 78                	push   $0x78
  2879f8:	52                   	push   %edx
  2879f9:	ff 75 08             	pushl  0x8(%ebp)
  2879fc:	e8 4e fb ff ff       	call   28754f <tek_rdget1>
  287a01:	83 c4 20             	add    $0x20,%esp
  287a04:	2d f8 01 00 00       	sub    $0x1f8,%eax
  287a09:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if (i > 0) {
  287a0c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  287a10:	0f 8e 90 00 00 00    	jle    287aa6 <tek_getlen5+0x1e2>
			if (i < 6 && stk == 0)
  287a16:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
  287a1a:	7f 58                	jg     287a74 <tek_getlen5+0x1b0>
  287a1c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  287a20:	75 52                	jne    287a74 <tek_getlen5+0x1b0>
				i = tek_rdget1(rd, &rd->probs.lenext[(1 << i) - 2], i | 0x70, 1, rd->ptbm[7]) - 1;
  287a22:	8b 45 08             	mov    0x8(%ebp),%eax
  287a25:	8b 80 38 04 00 00    	mov    0x438(%eax),%eax
  287a2b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  287a2e:	89 d3                	mov    %edx,%ebx
  287a30:	83 cb 70             	or     $0x70,%ebx
  287a33:	8b 55 f4             	mov    -0xc(%ebp),%edx
  287a36:	be 01 00 00 00       	mov    $0x1,%esi
  287a3b:	89 d1                	mov    %edx,%ecx
  287a3d:	d3 e6                	shl    %cl,%esi
  287a3f:	89 f2                	mov    %esi,%edx
  287a41:	83 ea 02             	sub    $0x2,%edx
  287a44:	81 c2 84 08 00 00    	add    $0x884,%edx
  287a4a:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  287a51:	8b 55 08             	mov    0x8(%ebp),%edx
  287a54:	01 ca                	add    %ecx,%edx
  287a56:	83 c2 0c             	add    $0xc,%edx
  287a59:	83 ec 0c             	sub    $0xc,%esp
  287a5c:	50                   	push   %eax
  287a5d:	6a 01                	push   $0x1
  287a5f:	53                   	push   %ebx
  287a60:	52                   	push   %edx
  287a61:	ff 75 08             	pushl  0x8(%ebp)
  287a64:	e8 e6 fa ff ff       	call   28754f <tek_rdget1>
  287a69:	83 c4 20             	add    $0x20,%esp
  287a6c:	83 e8 01             	sub    $0x1,%eax
  287a6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  287a72:	eb 19                	jmp    287a8d <tek_getlen5+0x1c9>
			else
				i = tek_rdget0(rd, i, ~1) - 1;
  287a74:	83 ec 04             	sub    $0x4,%esp
  287a77:	6a fe                	push   $0xfffffffe
  287a79:	ff 75 f4             	pushl  -0xc(%ebp)
  287a7c:	ff 75 08             	pushl  0x8(%ebp)
  287a7f:	e8 2e fa ff ff       	call   2874b2 <tek_rdget0>
  287a84:	83 c4 10             	add    $0x10,%esp
  287a87:	83 e8 01             	sub    $0x1,%eax
  287a8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
			i = tek_rdget0(rd, i, ~1) - 1;
  287a8d:	83 ec 04             	sub    $0x4,%esp
  287a90:	6a fe                	push   $0xfffffffe
  287a92:	ff 75 f4             	pushl  -0xc(%ebp)
  287a95:	ff 75 08             	pushl  0x8(%ebp)
  287a98:	e8 15 fa ff ff       	call   2874b2 <tek_rdget0>
  287a9d:	83 c4 10             	add    $0x10,%esp
  287aa0:	83 e8 01             	sub    $0x1,%eax
  287aa3:	89 45 f4             	mov    %eax,-0xc(%ebp)
		}
		i += 256 - 8 + 16;
  287aa6:	81 45 f4 08 01 00 00 	addl   $0x108,-0xc(%ebp)
	}
	return i;
  287aad:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  287ab0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  287ab3:	5b                   	pop    %ebx
  287ab4:	5e                   	pop    %esi
  287ab5:	5d                   	pop    %ebp
  287ab6:	c3                   	ret    

00287ab7 <tek_decmain5>:

static int tek_decmain5(int *work, UCHAR *src, int osiz, UCHAR *q, int lc, int pb, int lp, int flags)
{
  287ab7:	f3 0f 1e fb          	endbr32 
  287abb:	55                   	push   %ebp
  287abc:	89 e5                	mov    %esp,%ebp
  287abe:	57                   	push   %edi
  287abf:	56                   	push   %esi
  287ac0:	53                   	push   %ebx
  287ac1:	83 ec 6c             	sub    $0x6c,%esp
	static int state_table[] = { 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 4, 5 };
	int i, j, k, pmch, rep[4], s, pos, m_pos = (1 << pb) - 1, m_lp = (1 << lp) - 1;
  287ac4:	8b 45 1c             	mov    0x1c(%ebp),%eax
  287ac7:	ba 01 00 00 00       	mov    $0x1,%edx
  287acc:	89 c1                	mov    %eax,%ecx
  287ace:	d3 e2                	shl    %cl,%edx
  287ad0:	89 d0                	mov    %edx,%eax
  287ad2:	83 e8 01             	sub    $0x1,%eax
  287ad5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  287ad8:	8b 45 20             	mov    0x20(%ebp),%eax
  287adb:	ba 01 00 00 00       	mov    $0x1,%edx
  287ae0:	89 c1                	mov    %eax,%ecx
  287ae2:	d3 e2                	shl    %cl,%edx
  287ae4:	89 d0                	mov    %edx,%eax
  287ae6:	83 e8 01             	sub    $0x1,%eax
  287ae9:	89 45 c0             	mov    %eax,-0x40(%ebp)
	int stk = (flags == -1), lcr = 8 - lc, s_pos, lit0cntmsk = 0x78;
  287aec:	83 7d 24 ff          	cmpl   $0xffffffff,0x24(%ebp)
  287af0:	0f 94 c0             	sete   %al
  287af3:	0f b6 c0             	movzbl %al,%eax
  287af6:	89 45 bc             	mov    %eax,-0x44(%ebp)
  287af9:	b8 08 00 00 00       	mov    $0x8,%eax
  287afe:	2b 45 18             	sub    0x18(%ebp),%eax
  287b01:	89 45 b8             	mov    %eax,-0x48(%ebp)
  287b04:	c7 45 cc 78 00 00 00 	movl   $0x78,-0x34(%ebp)
	UINT32 *lit1;
	struct tek_STR_RNGDEC *rd = (struct tek_STR_RNGDEC *) work;
  287b0b:	8b 45 08             	mov    0x8(%ebp),%eax
  287b0e:	89 45 b4             	mov    %eax,-0x4c(%ebp)
	struct tek_STR_PRB *prb = &rd->probs;
  287b11:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287b14:	05 5c 04 00 00       	add    $0x45c,%eax
  287b19:	89 45 b0             	mov    %eax,-0x50(%ebp)

	rd->p = &src[4];
  287b1c:	8b 45 0c             	mov    0xc(%ebp),%eax
  287b1f:	8d 50 04             	lea    0x4(%eax),%edx
  287b22:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287b25:	89 10                	mov    %edx,(%eax)
	rd->range |= -1;
  287b27:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287b2a:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
	rd->code = src[0] << 24 | src[1] << 16 | src[2] << 8 | src[3];
  287b31:	8b 45 0c             	mov    0xc(%ebp),%eax
  287b34:	0f b6 00             	movzbl (%eax),%eax
  287b37:	0f b6 c0             	movzbl %al,%eax
  287b3a:	c1 e0 18             	shl    $0x18,%eax
  287b3d:	89 c2                	mov    %eax,%edx
  287b3f:	8b 45 0c             	mov    0xc(%ebp),%eax
  287b42:	83 c0 01             	add    $0x1,%eax
  287b45:	0f b6 00             	movzbl (%eax),%eax
  287b48:	0f b6 c0             	movzbl %al,%eax
  287b4b:	c1 e0 10             	shl    $0x10,%eax
  287b4e:	09 c2                	or     %eax,%edx
  287b50:	8b 45 0c             	mov    0xc(%ebp),%eax
  287b53:	83 c0 02             	add    $0x2,%eax
  287b56:	0f b6 00             	movzbl (%eax),%eax
  287b59:	0f b6 c0             	movzbl %al,%eax
  287b5c:	c1 e0 08             	shl    $0x8,%eax
  287b5f:	09 c2                	or     %eax,%edx
  287b61:	8b 45 0c             	mov    0xc(%ebp),%eax
  287b64:	83 c0 03             	add    $0x3,%eax
  287b67:	0f b6 00             	movzbl (%eax),%eax
  287b6a:	0f b6 c0             	movzbl %al,%eax
  287b6d:	09 d0                	or     %edx,%eax
  287b6f:	89 c2                	mov    %eax,%edx
  287b71:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287b74:	89 50 08             	mov    %edx,0x8(%eax)
	for (i = 0; i < 4; i++)
  287b77:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  287b7e:	eb 12                	jmp    287b92 <tek_decmain5+0xdb>
		rep[i] = ~i;
  287b80:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  287b83:	f7 d0                	not    %eax
  287b85:	89 c2                	mov    %eax,%edx
  287b87:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  287b8a:	89 54 85 98          	mov    %edx,-0x68(%ebp,%eax,4)
	for (i = 0; i < 4; i++)
  287b8e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  287b92:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
  287b96:	7e e8                	jle    287b80 <tek_decmain5+0xc9>
	if (setjmp(rd->errjmp))
  287b98:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287b9b:	83 c0 10             	add    $0x10,%eax
  287b9e:	8d 75 e8             	lea    -0x18(%ebp),%esi
  287ba1:	89 30                	mov    %esi,(%eax)
  287ba3:	ba be 7b 28 00       	mov    $0x287bbe,%edx
  287ba8:	89 50 04             	mov    %edx,0x4(%eax)
  287bab:	31 d2                	xor    %edx,%edx
  287bad:	f3 0f 1e ca          	rdsspd %edx
  287bb1:	89 50 08             	mov    %edx,0x8(%eax)
  287bb4:	89 60 0c             	mov    %esp,0xc(%eax)
  287bb7:	b8 00 00 00 00       	mov    $0x0,%eax
  287bbc:	eb 0c                	jmp    287bca <tek_decmain5+0x113>
  287bbe:	f3 0f 1e fb          	endbr32 
  287bc2:	8d 6d 18             	lea    0x18(%ebp),%ebp
  287bc5:	b8 01 00 00 00       	mov    $0x1,%eax
  287bca:	85 c0                	test   %eax,%eax
  287bcc:	0f 85 10 0a 00 00    	jne    2885e2 <tek_decmain5+0xb2b>
		goto err;
	for (i = sizeof (struct tek_STR_PRB) / sizeof (tek_TPRB) + (0x300 << (lc + lp)) - 2; i >= 0; i--)
  287bd2:	8b 55 18             	mov    0x18(%ebp),%edx
  287bd5:	8b 45 20             	mov    0x20(%ebp),%eax
  287bd8:	01 d0                	add    %edx,%eax
  287bda:	ba 00 03 00 00       	mov    $0x300,%edx
  287bdf:	89 c1                	mov    %eax,%ecx
  287be1:	d3 e2                	shl    %cl,%edx
  287be3:	89 d0                	mov    %edx,%eax
  287be5:	05 0f 08 00 00       	add    $0x80f,%eax
  287bea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  287bed:	eb 19                	jmp    287c08 <tek_decmain5+0x151>
		((tek_TPRB *) prb)[i] = 1 << 15;
  287bef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  287bf2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  287bf9:	8b 45 b0             	mov    -0x50(%ebp),%eax
  287bfc:	01 d0                	add    %edx,%eax
  287bfe:	c7 00 00 80 00 00    	movl   $0x8000,(%eax)
	for (i = sizeof (struct tek_STR_PRB) / sizeof (tek_TPRB) + (0x300 << (lc + lp)) - 2; i >= 0; i--)
  287c04:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  287c08:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  287c0c:	79 e1                	jns    287bef <tek_decmain5+0x138>
	for (i = 0; i < 32; i++) {
  287c0e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  287c15:	e9 89 00 00 00       	jmp    287ca3 <tek_decmain5+0x1ec>
		rd->bm[i].lt = (i >= 4); /* 0..3ÇÕéıñΩÇ»Çµ */
  287c1a:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
  287c1e:	0f 9f c0             	setg   %al
  287c21:	0f b6 c0             	movzbl %al,%eax
  287c24:	8b 55 b4             	mov    -0x4c(%ebp),%edx
  287c27:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  287c2a:	83 c1 01             	add    $0x1,%ecx
  287c2d:	c1 e1 05             	shl    $0x5,%ecx
  287c30:	01 ca                	add    %ecx,%edx
  287c32:	83 c2 10             	add    $0x10,%edx
  287c35:	89 02                	mov    %eax,(%edx)
		rd->bm[i].lt0 = (i < 24) ? 16 * 1024 : 8 * 1024;
  287c37:	83 7d e4 17          	cmpl   $0x17,-0x1c(%ebp)
  287c3b:	7f 07                	jg     287c44 <tek_decmain5+0x18d>
  287c3d:	b9 00 40 00 00       	mov    $0x4000,%ecx
  287c42:	eb 05                	jmp    287c49 <tek_decmain5+0x192>
  287c44:	b9 00 20 00 00       	mov    $0x2000,%ecx
  287c49:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287c4c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287c4f:	83 c2 01             	add    $0x1,%edx
  287c52:	c1 e2 05             	shl    $0x5,%edx
  287c55:	01 d0                	add    %edx,%eax
  287c57:	83 c0 14             	add    $0x14,%eax
  287c5a:	89 08                	mov    %ecx,(%eax)
		rd->bm[i].s &= 0;
  287c5c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287c5f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287c62:	c1 e2 05             	shl    $0x5,%edx
  287c65:	01 d0                	add    %edx,%eax
  287c67:	83 c0 1e             	add    $0x1e,%eax
  287c6a:	c6 00 00             	movb   $0x0,(%eax)
		rd->bm[i].t = rd->bm[i].m = 5;
  287c6d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287c70:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287c73:	c1 e2 05             	shl    $0x5,%edx
  287c76:	01 d0                	add    %edx,%eax
  287c78:	83 c0 1d             	add    $0x1d,%eax
  287c7b:	c6 00 05             	movb   $0x5,(%eax)
  287c7e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287c81:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287c84:	c1 e2 05             	shl    $0x5,%edx
  287c87:	01 d0                	add    %edx,%eax
  287c89:	83 c0 1d             	add    $0x1d,%eax
  287c8c:	0f b6 00             	movzbl (%eax),%eax
  287c8f:	8b 55 b4             	mov    -0x4c(%ebp),%edx
  287c92:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  287c95:	c1 e1 05             	shl    $0x5,%ecx
  287c98:	01 ca                	add    %ecx,%edx
  287c9a:	83 c2 1c             	add    $0x1c,%edx
  287c9d:	88 02                	mov    %al,(%edx)
	for (i = 0; i < 32; i++) {
  287c9f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  287ca3:	83 7d e4 1f          	cmpl   $0x1f,-0x1c(%ebp)
  287ca7:	0f 8e 6d ff ff ff    	jle    287c1a <tek_decmain5+0x163>
	}
	lit1 = prb->lit + ((256 << (lc + lp)) - 2);
  287cad:	8b 45 b0             	mov    -0x50(%ebp),%eax
  287cb0:	8d 98 40 20 00 00    	lea    0x2040(%eax),%ebx
  287cb6:	8b 55 18             	mov    0x18(%ebp),%edx
  287cb9:	8b 45 20             	mov    0x20(%ebp),%eax
  287cbc:	01 d0                	add    %edx,%eax
  287cbe:	ba 00 01 00 00       	mov    $0x100,%edx
  287cc3:	89 c1                	mov    %eax,%ecx
  287cc5:	d3 e2                	shl    %cl,%edx
  287cc7:	89 d0                	mov    %edx,%eax
  287cc9:	05 fe ff ff 3f       	add    $0x3ffffffe,%eax
  287cce:	c1 e0 02             	shl    $0x2,%eax
  287cd1:	01 d8                	add    %ebx,%eax
  287cd3:	89 45 ac             	mov    %eax,-0x54(%ebp)
	if (stk) {
  287cd6:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
  287cda:	74 62                	je     287d3e <tek_decmain5+0x287>
		rd->rmsk = -1 << 11;
  287cdc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287cdf:	c7 40 0c 00 f8 ff ff 	movl   $0xfffff800,0xc(%eax)
		for (i = 0; i < 32; i++)
  287ce6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  287ced:	eb 1b                	jmp    287d0a <tek_decmain5+0x253>
			rd->bm[i].lt = 0; /* ëSÇƒéıñΩÇ»Çµ */
  287cef:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287cf2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287cf5:	83 c2 01             	add    $0x1,%edx
  287cf8:	c1 e2 05             	shl    $0x5,%edx
  287cfb:	01 d0                	add    %edx,%eax
  287cfd:	83 c0 10             	add    $0x10,%eax
  287d00:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		for (i = 0; i < 32; i++)
  287d06:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  287d0a:	83 7d e4 1f          	cmpl   $0x1f,-0x1c(%ebp)
  287d0e:	7e df                	jle    287cef <tek_decmain5+0x238>
		for (i = 0; i < 14; i++)
  287d10:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  287d17:	eb 1a                	jmp    287d33 <tek_decmain5+0x27c>
			rd->ptbm[i] = &rd->bm[0];
  287d19:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d1c:	8d 48 1c             	lea    0x1c(%eax),%ecx
  287d1f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d22:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287d25:	81 c2 04 01 00 00    	add    $0x104,%edx
  287d2b:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
		for (i = 0; i < 14; i++)
  287d2f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  287d33:	83 7d e4 0d          	cmpl   $0xd,-0x1c(%ebp)
  287d37:	7e e0                	jle    287d19 <tek_decmain5+0x262>
  287d39:	e9 91 01 00 00       	jmp    287ecf <tek_decmain5+0x418>
		};
		/*
			 0- 7:mch, mch, lit1, lensel, lenlow, lenmid, lenhigh, lenext
			 8-15:pslot, pslot, sdis, sdis, align, rep-repg2
		*/
		rd->rmsk |= -1;
  287d3e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d41:	c7 40 0c ff ff ff ff 	movl   $0xffffffff,0xc(%eax)
		rd->bm[1].t = 5; rd->bm[1].m = 3; /* for fchgprm */
  287d48:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d4b:	c6 40 3c 05          	movb   $0x5,0x3c(%eax)
  287d4f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d52:	c6 40 3d 03          	movb   $0x3,0x3d(%eax)
		rd->bm[2].t = 9; rd->bm[2].m = 2; /* for tbmt, tbmm */
  287d56:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d59:	c6 40 5c 09          	movb   $0x9,0x5c(%eax)
  287d5d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d60:	c6 40 5d 02          	movb   $0x2,0x5d(%eax)
		if (flags & 0x40) { /* lt-flag */
  287d64:	8b 45 24             	mov    0x24(%ebp),%eax
  287d67:	83 e0 40             	and    $0x40,%eax
  287d6a:	85 c0                	test   %eax,%eax
  287d6c:	74 1b                	je     287d89 <tek_decmain5+0x2d2>
			rd->bm[3].t = 0; rd->bm[3].m = 1;
  287d6e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d71:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
  287d75:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d78:	c6 40 7d 01          	movb   $0x1,0x7d(%eax)
			prb->fchglt = 0xffff;
  287d7c:	8b 45 b0             	mov    -0x50(%ebp),%eax
  287d7f:	c7 80 3c 20 00 00 ff 	movl   $0xffff,0x203c(%eax)
  287d86:	ff 00 00 
		}
		rd->bm[22].t = 0; rd->bm[22].m = 1;
  287d89:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d8c:	c6 80 dc 02 00 00 00 	movb   $0x0,0x2dc(%eax)
  287d93:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287d96:	c6 80 dd 02 00 00 01 	movb   $0x1,0x2dd(%eax)
		prb->repg3 = 0xffff;
  287d9d:	8b 45 b0             	mov    -0x50(%ebp),%eax
  287da0:	c7 80 b8 1e 00 00 ff 	movl   $0xffff,0x1eb8(%eax)
  287da7:	ff 00 00 
		if (flags == -2) { /* z1 */
  287daa:	83 7d 24 fe          	cmpl   $0xfffffffe,0x24(%ebp)
  287dae:	75 3a                	jne    287dea <tek_decmain5+0x333>
			rd->bm[22].lt = 0; /* repg3ÇÃltÇ0Ç… */
  287db0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287db3:	c7 80 f0 02 00 00 00 	movl   $0x0,0x2f0(%eax)
  287dba:	00 00 00 
			for (i = 0; i < 14; i++)
  287dbd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  287dc4:	eb 19                	jmp    287ddf <tek_decmain5+0x328>
				pt[i] = pt1[i];
  287dc6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  287dc9:	05 74 14 31 00       	add    $0x311474,%eax
  287dce:	0f b6 00             	movzbl (%eax),%eax
  287dd1:	8d 4d 8a             	lea    -0x76(%ebp),%ecx
  287dd4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287dd7:	01 ca                	add    %ecx,%edx
  287dd9:	88 02                	mov    %al,(%edx)
			for (i = 0; i < 14; i++)
  287ddb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  287ddf:	83 7d e4 0d          	cmpl   $0xd,-0x1c(%ebp)
  287de3:	7e e1                	jle    287dc6 <tek_decmain5+0x30f>
  287de5:	e9 a6 00 00 00       	jmp    287e90 <tek_decmain5+0x3d9>
		} else {
			for (i = 0; i < 14; i++)
  287dea:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  287df1:	eb 19                	jmp    287e0c <tek_decmain5+0x355>
				pt[i] = pt2[i];
  287df3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  287df6:	05 84 14 31 00       	add    $0x311484,%eax
  287dfb:	0f b6 00             	movzbl (%eax),%eax
  287dfe:	8d 4d 8a             	lea    -0x76(%ebp),%ecx
  287e01:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287e04:	01 ca                	add    %ecx,%edx
  287e06:	88 02                	mov    %al,(%edx)
			for (i = 0; i < 14; i++)
  287e08:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  287e0c:	83 7d e4 0d          	cmpl   $0xd,-0x1c(%ebp)
  287e10:	7e e1                	jle    287df3 <tek_decmain5+0x33c>
			lit0cntmsk = (7 >> (flags & 3)) << 4 | 8;
  287e12:	8b 45 24             	mov    0x24(%ebp),%eax
  287e15:	83 e0 03             	and    $0x3,%eax
  287e18:	ba 07 00 00 00       	mov    $0x7,%edx
  287e1d:	89 c1                	mov    %eax,%ecx
  287e1f:	d3 fa                	sar    %cl,%edx
  287e21:	89 d0                	mov    %edx,%eax
  287e23:	c1 e0 04             	shl    $0x4,%eax
  287e26:	83 c8 08             	or     $0x8,%eax
  287e29:	89 45 cc             	mov    %eax,-0x34(%ebp)
			pt[ 1] =  8 + ((flags & 0x04) != 0); /* mch */
  287e2c:	8b 45 24             	mov    0x24(%ebp),%eax
  287e2f:	83 e0 04             	and    $0x4,%eax
  287e32:	85 c0                	test   %eax,%eax
  287e34:	74 07                	je     287e3d <tek_decmain5+0x386>
  287e36:	b8 09 00 00 00       	mov    $0x9,%eax
  287e3b:	eb 05                	jmp    287e42 <tek_decmain5+0x38b>
  287e3d:	b8 08 00 00 00       	mov    $0x8,%eax
  287e42:	88 45 8b             	mov    %al,-0x75(%ebp)
			pt[ 5] = 12 + ((flags & 0x08) != 0); /* llm */
  287e45:	8b 45 24             	mov    0x24(%ebp),%eax
  287e48:	83 e0 08             	and    $0x8,%eax
  287e4b:	85 c0                	test   %eax,%eax
  287e4d:	74 07                	je     287e56 <tek_decmain5+0x39f>
  287e4f:	b8 0d 00 00 00       	mov    $0xd,%eax
  287e54:	eb 05                	jmp    287e5b <tek_decmain5+0x3a4>
  287e56:	b8 0c 00 00 00       	mov    $0xc,%eax
  287e5b:	88 45 8f             	mov    %al,-0x71(%ebp)
			pt[ 9] = 16 + ((flags & 0x10) != 0); /* pst */
  287e5e:	8b 45 24             	mov    0x24(%ebp),%eax
  287e61:	83 e0 10             	and    $0x10,%eax
  287e64:	85 c0                	test   %eax,%eax
  287e66:	74 07                	je     287e6f <tek_decmain5+0x3b8>
  287e68:	b8 11 00 00 00       	mov    $0x11,%eax
  287e6d:	eb 05                	jmp    287e74 <tek_decmain5+0x3bd>
  287e6f:	b8 10 00 00 00       	mov    $0x10,%eax
  287e74:	88 45 93             	mov    %al,-0x6d(%ebp)
			pt[11] = 18 + ((flags & 0x20) != 0); /* sds */
  287e77:	8b 45 24             	mov    0x24(%ebp),%eax
  287e7a:	83 e0 20             	and    $0x20,%eax
  287e7d:	85 c0                	test   %eax,%eax
  287e7f:	74 07                	je     287e88 <tek_decmain5+0x3d1>
  287e81:	b8 13 00 00 00       	mov    $0x13,%eax
  287e86:	eb 05                	jmp    287e8d <tek_decmain5+0x3d6>
  287e88:	b8 12 00 00 00       	mov    $0x12,%eax
  287e8d:	88 45 95             	mov    %al,-0x6b(%ebp)
		}
		for (i = 0; i < 14; i++)
  287e90:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  287e97:	eb 30                	jmp    287ec9 <tek_decmain5+0x412>
			rd->ptbm[i] = &rd->bm[pt[i]];
  287e99:	8d 55 8a             	lea    -0x76(%ebp),%edx
  287e9c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  287e9f:	01 d0                	add    %edx,%eax
  287ea1:	0f b6 00             	movzbl (%eax),%eax
  287ea4:	0f b6 c0             	movzbl %al,%eax
  287ea7:	c1 e0 05             	shl    $0x5,%eax
  287eaa:	8d 50 10             	lea    0x10(%eax),%edx
  287ead:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287eb0:	01 d0                	add    %edx,%eax
  287eb2:	8d 48 0c             	lea    0xc(%eax),%ecx
  287eb5:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287eb8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287ebb:	81 c2 04 01 00 00    	add    $0x104,%edx
  287ec1:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
		for (i = 0; i < 14; i++)
  287ec5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  287ec9:	83 7d e4 0d          	cmpl   $0xd,-0x1c(%ebp)
  287ecd:	7e ca                	jle    287e99 <tek_decmain5+0x3e2>
	}
	for (i = 0; i < 32; i++)
  287ecf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  287ed6:	eb 48                	jmp    287f20 <tek_decmain5+0x469>
		tek_setbm5(&rd->bm[i], rd->bm[i].t, rd->bm[i].m);
  287ed8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287edb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  287ede:	c1 e2 05             	shl    $0x5,%edx
  287ee1:	01 d0                	add    %edx,%eax
  287ee3:	83 c0 1d             	add    $0x1d,%eax
  287ee6:	0f b6 00             	movzbl (%eax),%eax
  287ee9:	0f b6 d0             	movzbl %al,%edx
  287eec:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287eef:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  287ef2:	c1 e1 05             	shl    $0x5,%ecx
  287ef5:	01 c8                	add    %ecx,%eax
  287ef7:	83 c0 1c             	add    $0x1c,%eax
  287efa:	0f b6 00             	movzbl (%eax),%eax
  287efd:	0f b6 c0             	movzbl %al,%eax
  287f00:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  287f03:	c1 e1 05             	shl    $0x5,%ecx
  287f06:	8d 59 10             	lea    0x10(%ecx),%ebx
  287f09:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
  287f0c:	01 d9                	add    %ebx,%ecx
  287f0e:	83 c1 0c             	add    $0xc,%ecx
  287f11:	52                   	push   %edx
  287f12:	50                   	push   %eax
  287f13:	51                   	push   %ecx
  287f14:	e8 e2 f4 ff ff       	call   2873fb <tek_setbm5>
  287f19:	83 c4 0c             	add    $0xc,%esp
	for (i = 0; i < 32; i++)
  287f1c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  287f20:	83 7d e4 1f          	cmpl   $0x1f,-0x1c(%ebp)
  287f24:	7e b2                	jle    287ed8 <tek_decmain5+0x421>

	if ((tek_rdget1(rd, &prb->pb[0].st[0].mch, 0x71, 0, rd->ptbm[0]) ^ stk) == 0)
  287f26:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287f29:	8b 90 1c 04 00 00    	mov    0x41c(%eax),%edx
  287f2f:	8b 45 b0             	mov    -0x50(%ebp),%eax
  287f32:	83 ec 0c             	sub    $0xc,%esp
  287f35:	52                   	push   %edx
  287f36:	6a 00                	push   $0x0
  287f38:	6a 71                	push   $0x71
  287f3a:	50                   	push   %eax
  287f3b:	ff 75 b4             	pushl  -0x4c(%ebp)
  287f3e:	e8 0c f6 ff ff       	call   28754f <tek_rdget1>
  287f43:	83 c4 20             	add    $0x20,%esp
  287f46:	39 45 bc             	cmp    %eax,-0x44(%ebp)
  287f49:	0f 84 96 06 00 00    	je     2885e5 <tek_decmain5+0xb2e>
		goto err;
	*q++ = tek_rdget1(rd, prb->lit, lit0cntmsk, 1, &rd->bm[24]) & 0xff;
  287f4f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287f52:	8d 90 1c 03 00 00    	lea    0x31c(%eax),%edx
  287f58:	8b 45 b0             	mov    -0x50(%ebp),%eax
  287f5b:	05 40 20 00 00       	add    $0x2040,%eax
  287f60:	83 ec 0c             	sub    $0xc,%esp
  287f63:	52                   	push   %edx
  287f64:	6a 01                	push   $0x1
  287f66:	ff 75 cc             	pushl  -0x34(%ebp)
  287f69:	50                   	push   %eax
  287f6a:	ff 75 b4             	pushl  -0x4c(%ebp)
  287f6d:	e8 dd f5 ff ff       	call   28754f <tek_rdget1>
  287f72:	83 c4 20             	add    $0x20,%esp
  287f75:	89 c1                	mov    %eax,%ecx
  287f77:	8b 45 14             	mov    0x14(%ebp),%eax
  287f7a:	8d 50 01             	lea    0x1(%eax),%edx
  287f7d:	89 55 14             	mov    %edx,0x14(%ebp)
  287f80:	89 ca                	mov    %ecx,%edx
  287f82:	88 10                	mov    %dl,(%eax)
	pmch &= 0; s &= 0; pos = 1;
  287f84:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  287f8b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  287f92:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%ebp)
	while (pos < osiz) {
  287f99:	e9 31 06 00 00       	jmp    2885cf <tek_decmain5+0xb18>
		s_pos = pos & m_pos;
  287f9e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  287fa1:	23 45 c4             	and    -0x3c(%ebp),%eax
  287fa4:	89 45 a8             	mov    %eax,-0x58(%ebp)
		if (tek_rdget1(rd, &prb->pb[s_pos].st[s].mch, 0x71, 0, rd->ptbm[s > 0]) ^ stk) { /* îÒlz */
  287fa7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  287fab:	0f 9f c0             	setg   %al
  287fae:	0f b6 d0             	movzbl %al,%edx
  287fb1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  287fb4:	81 c2 04 01 00 00    	add    $0x104,%edx
  287fba:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  287fbe:	8b 55 a8             	mov    -0x58(%ebp),%edx
  287fc1:	6b ca 1c             	imul   $0x1c,%edx,%ecx
  287fc4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  287fc7:	01 ca                	add    %ecx,%edx
  287fc9:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
  287fd0:	8b 55 b0             	mov    -0x50(%ebp),%edx
  287fd3:	01 ca                	add    %ecx,%edx
  287fd5:	83 ec 0c             	sub    $0xc,%esp
  287fd8:	50                   	push   %eax
  287fd9:	6a 00                	push   $0x0
  287fdb:	6a 71                	push   $0x71
  287fdd:	52                   	push   %edx
  287fde:	ff 75 b4             	pushl  -0x4c(%ebp)
  287fe1:	e8 69 f5 ff ff       	call   28754f <tek_rdget1>
  287fe6:	83 c4 20             	add    $0x20,%esp
  287fe9:	39 45 bc             	cmp    %eax,-0x44(%ebp)
  287fec:	0f 84 86 01 00 00    	je     288178 <tek_decmain5+0x6c1>
			i = (q[-1] >> lcr | (pos & m_lp) << lc) << 8;
  287ff2:	8b 45 14             	mov    0x14(%ebp),%eax
  287ff5:	83 e8 01             	sub    $0x1,%eax
  287ff8:	0f b6 00             	movzbl (%eax),%eax
  287ffb:	0f b6 d0             	movzbl %al,%edx
  287ffe:	8b 45 b8             	mov    -0x48(%ebp),%eax
  288001:	89 d3                	mov    %edx,%ebx
  288003:	89 c1                	mov    %eax,%ecx
  288005:	d3 fb                	sar    %cl,%ebx
  288007:	8b 45 d0             	mov    -0x30(%ebp),%eax
  28800a:	23 45 c0             	and    -0x40(%ebp),%eax
  28800d:	89 c2                	mov    %eax,%edx
  28800f:	8b 45 18             	mov    0x18(%ebp),%eax
  288012:	89 c1                	mov    %eax,%ecx
  288014:	d3 e2                	shl    %cl,%edx
  288016:	89 d0                	mov    %edx,%eax
  288018:	09 d8                	or     %ebx,%eax
  28801a:	c1 e0 08             	shl    $0x8,%eax
  28801d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			s = state_table[s];
  288020:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  288023:	8b 04 85 a0 14 31 00 	mov    0x3114a0(,%eax,4),%eax
  28802a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
			if (pmch == 0)
  28802d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  288031:	75 3e                	jne    288071 <tek_decmain5+0x5ba>
				*q = tek_rdget1(rd, &prb->lit[i], lit0cntmsk, 1, &rd->bm[24]) & 0xff;
  288033:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288036:	8d 90 1c 03 00 00    	lea    0x31c(%eax),%edx
  28803c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  28803f:	05 10 08 00 00       	add    $0x810,%eax
  288044:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  28804b:	8b 45 b0             	mov    -0x50(%ebp),%eax
  28804e:	01 c8                	add    %ecx,%eax
  288050:	83 ec 0c             	sub    $0xc,%esp
  288053:	52                   	push   %edx
  288054:	6a 01                	push   $0x1
  288056:	ff 75 cc             	pushl  -0x34(%ebp)
  288059:	50                   	push   %eax
  28805a:	ff 75 b4             	pushl  -0x4c(%ebp)
  28805d:	e8 ed f4 ff ff       	call   28754f <tek_rdget1>
  288062:	83 c4 20             	add    $0x20,%esp
  288065:	89 c2                	mov    %eax,%edx
  288067:	8b 45 14             	mov    0x14(%ebp),%eax
  28806a:	88 10                	mov    %dl,(%eax)
  28806c:	e9 fa 00 00 00       	jmp    28816b <tek_decmain5+0x6b4>
			else {
				struct tek_STR_BITMODEL *bm = &rd->bm[24];
  288071:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288074:	05 1c 03 00 00       	add    $0x31c,%eax
  288079:	89 45 c8             	mov    %eax,-0x38(%ebp)
				j = 1; /* lit1ÇÕç≈èâÇ©ÇÁ2Çå∏Ç∂ÇƒÇ†ÇÈ */
  28807c:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
				k = 8;
  288083:	c7 45 dc 08 00 00 00 	movl   $0x8,-0x24(%ebp)
				pmch = q[rep[0]];
  28808a:	8b 45 98             	mov    -0x68(%ebp),%eax
  28808d:	89 c2                	mov    %eax,%edx
  28808f:	8b 45 14             	mov    0x14(%ebp),%eax
  288092:	01 d0                	add    %edx,%eax
  288094:	0f b6 00             	movzbl (%eax),%eax
  288097:	0f b6 c0             	movzbl %al,%eax
  28809a:	89 45 d8             	mov    %eax,-0x28(%ebp)
				do {
					j += j + tek_rdget1(rd, &lit1[(i + j) << 1 | pmch >> 7], 0x71, 0, rd->ptbm[2]);
  28809d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  2880a0:	8b 80 24 04 00 00    	mov    0x424(%eax),%eax
  2880a6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  2880a9:	8b 55 e0             	mov    -0x20(%ebp),%edx
  2880ac:	01 ca                	add    %ecx,%edx
  2880ae:	8d 0c 12             	lea    (%edx,%edx,1),%ecx
  2880b1:	8b 55 d8             	mov    -0x28(%ebp),%edx
  2880b4:	c1 fa 07             	sar    $0x7,%edx
  2880b7:	09 ca                	or     %ecx,%edx
  2880b9:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  2880c0:	8b 55 ac             	mov    -0x54(%ebp),%edx
  2880c3:	01 ca                	add    %ecx,%edx
  2880c5:	83 ec 0c             	sub    $0xc,%esp
  2880c8:	50                   	push   %eax
  2880c9:	6a 00                	push   $0x0
  2880cb:	6a 71                	push   $0x71
  2880cd:	52                   	push   %edx
  2880ce:	ff 75 b4             	pushl  -0x4c(%ebp)
  2880d1:	e8 79 f4 ff ff       	call   28754f <tek_rdget1>
  2880d6:	83 c4 20             	add    $0x20,%esp
  2880d9:	8b 55 e0             	mov    -0x20(%ebp),%edx
  2880dc:	01 d0                	add    %edx,%eax
  2880de:	01 45 e0             	add    %eax,-0x20(%ebp)
					k--;
  2880e1:	83 6d dc 01          	subl   $0x1,-0x24(%ebp)
					if ((k & (lit0cntmsk >> 4)) == 0)
  2880e5:	8b 45 cc             	mov    -0x34(%ebp),%eax
  2880e8:	c1 f8 04             	sar    $0x4,%eax
  2880eb:	23 45 dc             	and    -0x24(%ebp),%eax
  2880ee:	85 c0                	test   %eax,%eax
  2880f0:	75 04                	jne    2880f6 <tek_decmain5+0x63f>
						bm++;
  2880f2:	83 45 c8 20          	addl   $0x20,-0x38(%ebp)
					if ((((pmch >> 7) ^ j) & 1) != 0 && k != 0) {
  2880f6:	8b 45 d8             	mov    -0x28(%ebp),%eax
  2880f9:	c1 f8 07             	sar    $0x7,%eax
  2880fc:	33 45 e0             	xor    -0x20(%ebp),%eax
  2880ff:	83 e0 01             	and    $0x1,%eax
  288102:	85 c0                	test   %eax,%eax
  288104:	74 47                	je     28814d <tek_decmain5+0x696>
  288106:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  28810a:	74 41                	je     28814d <tek_decmain5+0x696>
						j = tek_rdget1(rd, &prb->lit[i + j - 1], k | (lit0cntmsk & 0x70), j, bm);
  28810c:	8b 45 cc             	mov    -0x34(%ebp),%eax
  28810f:	83 e0 70             	and    $0x70,%eax
  288112:	0b 45 dc             	or     -0x24(%ebp),%eax
  288115:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  288118:	8b 55 e0             	mov    -0x20(%ebp),%edx
  28811b:	01 ca                	add    %ecx,%edx
  28811d:	83 ea 01             	sub    $0x1,%edx
  288120:	81 c2 10 08 00 00    	add    $0x810,%edx
  288126:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  28812d:	8b 55 b0             	mov    -0x50(%ebp),%edx
  288130:	01 ca                	add    %ecx,%edx
  288132:	83 ec 0c             	sub    $0xc,%esp
  288135:	ff 75 c8             	pushl  -0x38(%ebp)
  288138:	ff 75 e0             	pushl  -0x20(%ebp)
  28813b:	50                   	push   %eax
  28813c:	52                   	push   %edx
  28813d:	ff 75 b4             	pushl  -0x4c(%ebp)
  288140:	e8 0a f4 ff ff       	call   28754f <tek_rdget1>
  288145:	83 c4 20             	add    $0x20,%esp
  288148:	89 45 e0             	mov    %eax,-0x20(%ebp)
						break;
  28814b:	eb 0d                	jmp    28815a <tek_decmain5+0x6a3>
					}
					pmch <<= 1;
  28814d:	d1 65 d8             	shll   -0x28(%ebp)
				} while (k);
  288150:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  288154:	0f 85 43 ff ff ff    	jne    28809d <tek_decmain5+0x5e6>
				*q = j & 0xff;
  28815a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  28815d:	89 c2                	mov    %eax,%edx
  28815f:	8b 45 14             	mov    0x14(%ebp),%eax
  288162:	88 10                	mov    %dl,(%eax)
				pmch &= 0;
  288164:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
			}
			pos++;
  28816b:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
			q++;
  28816f:	83 45 14 01          	addl   $0x1,0x14(%ebp)
  288173:	e9 57 04 00 00       	jmp    2885cf <tek_decmain5+0xb18>
		} else { /* lz */
			pmch |= 1;
  288178:	83 4d d8 01          	orl    $0x1,-0x28(%ebp)
			if (tek_rdget1(rd, &prb->st[s].rep, 0x71, 0, rd->ptbm[13]) ^ stk) { /* len/dis */
  28817c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  28817f:	8b 80 50 04 00 00    	mov    0x450(%eax),%eax
  288185:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  288188:	81 c2 e0 00 00 00    	add    $0xe0,%edx
  28818e:	89 d1                	mov    %edx,%ecx
  288190:	c1 e1 04             	shl    $0x4,%ecx
  288193:	8b 55 b0             	mov    -0x50(%ebp),%edx
  288196:	01 ca                	add    %ecx,%edx
  288198:	83 ec 0c             	sub    $0xc,%esp
  28819b:	50                   	push   %eax
  28819c:	6a 00                	push   $0x0
  28819e:	6a 71                	push   $0x71
  2881a0:	52                   	push   %edx
  2881a1:	ff 75 b4             	pushl  -0x4c(%ebp)
  2881a4:	e8 a6 f3 ff ff       	call   28754f <tek_rdget1>
  2881a9:	83 c4 20             	add    $0x20,%esp
  2881ac:	39 45 bc             	cmp    %eax,-0x44(%ebp)
  2881af:	0f 84 37 02 00 00    	je     2883ec <tek_decmain5+0x935>
				rep[3] = rep[2];
  2881b5:	8b 45 a0             	mov    -0x60(%ebp),%eax
  2881b8:	89 45 a4             	mov    %eax,-0x5c(%ebp)
				rep[2] = rep[1];
  2881bb:	8b 45 9c             	mov    -0x64(%ebp),%eax
  2881be:	89 45 a0             	mov    %eax,-0x60(%ebp)
				rep[1] = rep[0];
  2881c1:	8b 45 98             	mov    -0x68(%ebp),%eax
  2881c4:	89 45 9c             	mov    %eax,-0x64(%ebp)
				j = i = tek_getlen5(rd, 0, s_pos, stk);
  2881c7:	ff 75 bc             	pushl  -0x44(%ebp)
  2881ca:	ff 75 a8             	pushl  -0x58(%ebp)
  2881cd:	6a 00                	push   $0x0
  2881cf:	ff 75 b4             	pushl  -0x4c(%ebp)
  2881d2:	e8 ed f6 ff ff       	call   2878c4 <tek_getlen5>
  2881d7:	83 c4 10             	add    $0x10,%esp
  2881da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2881dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2881e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
				s = s < 7 ? 7 : 10;
  2881e3:	83 7d d4 06          	cmpl   $0x6,-0x2c(%ebp)
  2881e7:	7f 07                	jg     2881f0 <tek_decmain5+0x739>
  2881e9:	b8 07 00 00 00       	mov    $0x7,%eax
  2881ee:	eb 05                	jmp    2881f5 <tek_decmain5+0x73e>
  2881f0:	b8 0a 00 00 00       	mov    $0xa,%eax
  2881f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
				if (j >= 4)
  2881f8:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
  2881fc:	7e 07                	jle    288205 <tek_decmain5+0x74e>
					j = 3;
  2881fe:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%ebp)
				rep[0] = j = tek_rdget1(rd, prb->pslot[j], 0x76, 1, rd->ptbm[8 + (j == 3)]) & 0x3f;
  288205:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
  288209:	75 07                	jne    288212 <tek_decmain5+0x75b>
  28820b:	ba 09 00 00 00       	mov    $0x9,%edx
  288210:	eb 05                	jmp    288217 <tek_decmain5+0x760>
  288212:	ba 08 00 00 00       	mov    $0x8,%edx
  288217:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  28821a:	81 c2 04 01 00 00    	add    $0x104,%edx
  288220:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  288224:	8b 55 e0             	mov    -0x20(%ebp),%edx
  288227:	c1 e2 08             	shl    $0x8,%edx
  28822a:	8d 8a d0 16 00 00    	lea    0x16d0(%edx),%ecx
  288230:	8b 55 b0             	mov    -0x50(%ebp),%edx
  288233:	01 ca                	add    %ecx,%edx
  288235:	83 ec 0c             	sub    $0xc,%esp
  288238:	50                   	push   %eax
  288239:	6a 01                	push   $0x1
  28823b:	6a 76                	push   $0x76
  28823d:	52                   	push   %edx
  28823e:	ff 75 b4             	pushl  -0x4c(%ebp)
  288241:	e8 09 f3 ff ff       	call   28754f <tek_rdget1>
  288246:	83 c4 20             	add    $0x20,%esp
  288249:	83 e0 3f             	and    $0x3f,%eax
  28824c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  28824f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  288252:	89 45 98             	mov    %eax,-0x68(%ebp)
				if (j >= 4) {
  288255:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
  288259:	0f 8e 80 01 00 00    	jle    2883df <tek_decmain5+0x928>
					k = (j >> 1) - 1; /* k = [1, 30] */
  28825f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  288262:	d1 f8                	sar    %eax
  288264:	83 e8 01             	sub    $0x1,%eax
  288267:	89 45 dc             	mov    %eax,-0x24(%ebp)
					rep[0] = (2 | (j & 1)) << k;
  28826a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  28826d:	83 e0 01             	and    $0x1,%eax
  288270:	83 c8 02             	or     $0x2,%eax
  288273:	89 c2                	mov    %eax,%edx
  288275:	8b 45 dc             	mov    -0x24(%ebp),%eax
  288278:	89 c1                	mov    %eax,%ecx
  28827a:	d3 e2                	shl    %cl,%edx
  28827c:	89 d0                	mov    %edx,%eax
  28827e:	89 45 98             	mov    %eax,-0x68(%ebp)
					if (j < 14) /* k < 6 */
  288281:	83 7d e0 0d          	cmpl   $0xd,-0x20(%ebp)
  288285:	0f 8f 86 00 00 00    	jg     288311 <tek_decmain5+0x85a>
						rep[0] |= tek_revbit(tek_rdget1(rd, &prb->spdis[j & 1][(1 << k) - 2], k | 0x70, 1, rd->ptbm[10 + (k >= 4)]), k);
  28828b:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
  28828f:	7e 07                	jle    288298 <tek_decmain5+0x7e1>
  288291:	ba 0b 00 00 00       	mov    $0xb,%edx
  288296:	eb 05                	jmp    28829d <tek_decmain5+0x7e6>
  288298:	ba 0a 00 00 00       	mov    $0xa,%edx
  28829d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  2882a0:	81 c2 04 01 00 00    	add    $0x104,%edx
  2882a6:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  2882aa:	8b 55 dc             	mov    -0x24(%ebp),%edx
  2882ad:	89 d3                	mov    %edx,%ebx
  2882af:	83 cb 70             	or     $0x70,%ebx
  2882b2:	8b 55 e0             	mov    -0x20(%ebp),%edx
  2882b5:	89 d6                	mov    %edx,%esi
  2882b7:	83 e6 01             	and    $0x1,%esi
  2882ba:	8b 55 dc             	mov    -0x24(%ebp),%edx
  2882bd:	bf 01 00 00 00       	mov    $0x1,%edi
  2882c2:	89 d1                	mov    %edx,%ecx
  2882c4:	d3 e7                	shl    %cl,%edi
  2882c6:	89 fa                	mov    %edi,%edx
  2882c8:	8d 4a fe             	lea    -0x2(%edx),%ecx
  2882cb:	6b d6 3e             	imul   $0x3e,%esi,%edx
  2882ce:	01 ca                	add    %ecx,%edx
  2882d0:	81 c2 f4 06 00 00    	add    $0x6f4,%edx
  2882d6:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  2882dd:	8b 55 b0             	mov    -0x50(%ebp),%edx
  2882e0:	01 ca                	add    %ecx,%edx
  2882e2:	83 ec 0c             	sub    $0xc,%esp
  2882e5:	50                   	push   %eax
  2882e6:	6a 01                	push   $0x1
  2882e8:	53                   	push   %ebx
  2882e9:	52                   	push   %edx
  2882ea:	ff 75 b4             	pushl  -0x4c(%ebp)
  2882ed:	e8 5d f2 ff ff       	call   28754f <tek_rdget1>
  2882f2:	83 c4 20             	add    $0x20,%esp
  2882f5:	83 ec 08             	sub    $0x8,%esp
  2882f8:	ff 75 dc             	pushl  -0x24(%ebp)
  2882fb:	50                   	push   %eax
  2882fc:	e8 90 f5 ff ff       	call   287891 <tek_revbit>
  288301:	83 c4 10             	add    $0x10,%esp
  288304:	8b 55 98             	mov    -0x68(%ebp),%edx
  288307:	09 d0                	or     %edx,%eax
  288309:	89 45 98             	mov    %eax,-0x68(%ebp)
  28830c:	e9 ce 00 00 00       	jmp    2883df <tek_decmain5+0x928>
					else {
						if (stk == 0) {
  288311:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
  288315:	75 68                	jne    28837f <tek_decmain5+0x8c8>
							if (k -= 6)
  288317:	83 6d dc 06          	subl   $0x6,-0x24(%ebp)
  28831b:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  28831f:	74 20                	je     288341 <tek_decmain5+0x88a>
								rep[0] |= tek_rdget0(rd, k, ~0) << 6;
  288321:	83 ec 04             	sub    $0x4,%esp
  288324:	6a ff                	push   $0xffffffff
  288326:	ff 75 dc             	pushl  -0x24(%ebp)
  288329:	ff 75 b4             	pushl  -0x4c(%ebp)
  28832c:	e8 81 f1 ff ff       	call   2874b2 <tek_rdget0>
  288331:	83 c4 10             	add    $0x10,%esp
  288334:	c1 e0 06             	shl    $0x6,%eax
  288337:	89 c2                	mov    %eax,%edx
  288339:	8b 45 98             	mov    -0x68(%ebp),%eax
  28833c:	09 d0                	or     %edx,%eax
  28833e:	89 45 98             	mov    %eax,-0x68(%ebp)
							rep[0] |= tek_revbit(tek_rdget1(rd, prb->algn, 0x76, 1, rd->ptbm[12]), 6);
  288341:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288344:	8b 80 4c 04 00 00    	mov    0x44c(%eax),%eax
  28834a:	8b 55 b0             	mov    -0x50(%ebp),%edx
  28834d:	81 c2 d0 1a 00 00    	add    $0x1ad0,%edx
  288353:	83 ec 0c             	sub    $0xc,%esp
  288356:	50                   	push   %eax
  288357:	6a 01                	push   $0x1
  288359:	6a 76                	push   $0x76
  28835b:	52                   	push   %edx
  28835c:	ff 75 b4             	pushl  -0x4c(%ebp)
  28835f:	e8 eb f1 ff ff       	call   28754f <tek_rdget1>
  288364:	83 c4 20             	add    $0x20,%esp
  288367:	83 ec 08             	sub    $0x8,%esp
  28836a:	6a 06                	push   $0x6
  28836c:	50                   	push   %eax
  28836d:	e8 1f f5 ff ff       	call   287891 <tek_revbit>
  288372:	83 c4 10             	add    $0x10,%esp
  288375:	8b 55 98             	mov    -0x68(%ebp),%edx
  288378:	09 d0                	or     %edx,%eax
  28837a:	89 45 98             	mov    %eax,-0x68(%ebp)
  28837d:	eb 60                	jmp    2883df <tek_decmain5+0x928>
						} else {
							rep[0] |= tek_rdget0(rd, k - 4, ~0) << 4;
  28837f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  288382:	83 e8 04             	sub    $0x4,%eax
  288385:	83 ec 04             	sub    $0x4,%esp
  288388:	6a ff                	push   $0xffffffff
  28838a:	50                   	push   %eax
  28838b:	ff 75 b4             	pushl  -0x4c(%ebp)
  28838e:	e8 1f f1 ff ff       	call   2874b2 <tek_rdget0>
  288393:	83 c4 10             	add    $0x10,%esp
  288396:	c1 e0 04             	shl    $0x4,%eax
  288399:	89 c2                	mov    %eax,%edx
  28839b:	8b 45 98             	mov    -0x68(%ebp),%eax
  28839e:	09 d0                	or     %edx,%eax
  2883a0:	89 45 98             	mov    %eax,-0x68(%ebp)
							rep[0] |= tek_revbit(tek_rdget1(rd, prb->algn, 0x74, 1, rd->ptbm[12]), 4);
  2883a3:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  2883a6:	8b 80 4c 04 00 00    	mov    0x44c(%eax),%eax
  2883ac:	8b 55 b0             	mov    -0x50(%ebp),%edx
  2883af:	81 c2 d0 1a 00 00    	add    $0x1ad0,%edx
  2883b5:	83 ec 0c             	sub    $0xc,%esp
  2883b8:	50                   	push   %eax
  2883b9:	6a 01                	push   $0x1
  2883bb:	6a 74                	push   $0x74
  2883bd:	52                   	push   %edx
  2883be:	ff 75 b4             	pushl  -0x4c(%ebp)
  2883c1:	e8 89 f1 ff ff       	call   28754f <tek_rdget1>
  2883c6:	83 c4 20             	add    $0x20,%esp
  2883c9:	83 ec 08             	sub    $0x8,%esp
  2883cc:	6a 04                	push   $0x4
  2883ce:	50                   	push   %eax
  2883cf:	e8 bd f4 ff ff       	call   287891 <tek_revbit>
  2883d4:	83 c4 10             	add    $0x10,%esp
  2883d7:	8b 55 98             	mov    -0x68(%ebp),%edx
  2883da:	09 d0                	or     %edx,%eax
  2883dc:	89 45 98             	mov    %eax,-0x68(%ebp)
						}
					}
				}
				rep[0] = ~rep[0];
  2883df:	8b 45 98             	mov    -0x68(%ebp),%eax
  2883e2:	f7 d0                	not    %eax
  2883e4:	89 45 98             	mov    %eax,-0x68(%ebp)
  2883e7:	e9 97 01 00 00       	jmp    288583 <tek_decmain5+0xacc>
			} else { /* repeat-dis */
				if (tek_rdget1(rd, &prb->st[s].repg0, 0x71, 0, rd->ptbm[13]) ^ stk) { /* rep0 */
  2883ec:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  2883ef:	8b 80 50 04 00 00    	mov    0x450(%eax),%eax
  2883f5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  2883f8:	81 c2 e0 00 00 00    	add    $0xe0,%edx
  2883fe:	89 d1                	mov    %edx,%ecx
  288400:	c1 e1 04             	shl    $0x4,%ecx
  288403:	8b 55 b0             	mov    -0x50(%ebp),%edx
  288406:	01 ca                	add    %ecx,%edx
  288408:	83 c2 04             	add    $0x4,%edx
  28840b:	83 ec 0c             	sub    $0xc,%esp
  28840e:	50                   	push   %eax
  28840f:	6a 00                	push   $0x0
  288411:	6a 71                	push   $0x71
  288413:	52                   	push   %edx
  288414:	ff 75 b4             	pushl  -0x4c(%ebp)
  288417:	e8 33 f1 ff ff       	call   28754f <tek_rdget1>
  28841c:	83 c4 20             	add    $0x20,%esp
  28841f:	39 45 bc             	cmp    %eax,-0x44(%ebp)
  288422:	74 60                	je     288484 <tek_decmain5+0x9cd>
					i |= -1;
  288424:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
					if (tek_rdget1(rd, &prb->pb[s_pos].st[s].rep0l1, 0x71, 0, rd->ptbm[13]) == 0) {
  28842b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  28842e:	8b 80 50 04 00 00    	mov    0x450(%eax),%eax
  288434:	8b 55 a8             	mov    -0x58(%ebp),%edx
  288437:	6b ca 1c             	imul   $0x1c,%edx,%ecx
  28843a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  28843d:	01 ca                	add    %ecx,%edx
  28843f:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
  288446:	8b 55 b0             	mov    -0x50(%ebp),%edx
  288449:	01 ca                	add    %ecx,%edx
  28844b:	83 c2 04             	add    $0x4,%edx
  28844e:	83 ec 0c             	sub    $0xc,%esp
  288451:	50                   	push   %eax
  288452:	6a 00                	push   $0x0
  288454:	6a 71                	push   $0x71
  288456:	52                   	push   %edx
  288457:	ff 75 b4             	pushl  -0x4c(%ebp)
  28845a:	e8 f0 f0 ff ff       	call   28754f <tek_rdget1>
  28845f:	83 c4 20             	add    $0x20,%esp
  288462:	85 c0                	test   %eax,%eax
  288464:	0f 85 ee 00 00 00    	jne    288558 <tek_decmain5+0xaa1>
						s = s < 7 ? 9 : 11;
  28846a:	83 7d d4 06          	cmpl   $0x6,-0x2c(%ebp)
  28846e:	7f 07                	jg     288477 <tek_decmain5+0x9c0>
  288470:	b8 09 00 00 00       	mov    $0x9,%eax
  288475:	eb 05                	jmp    28847c <tek_decmain5+0x9c5>
  288477:	b8 0b 00 00 00       	mov    $0xb,%eax
  28847c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
						goto skip;
  28847f:	e9 ff 00 00 00       	jmp    288583 <tek_decmain5+0xacc>
					}
				} else {
					if (tek_rdget1(rd, &prb->st[s].repg1, 0x71, 0, rd->ptbm[13]) ^ stk) /* rep1 */
  288484:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288487:	8b 80 50 04 00 00    	mov    0x450(%eax),%eax
  28848d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  288490:	81 c2 e0 00 00 00    	add    $0xe0,%edx
  288496:	89 d1                	mov    %edx,%ecx
  288498:	c1 e1 04             	shl    $0x4,%ecx
  28849b:	8b 55 b0             	mov    -0x50(%ebp),%edx
  28849e:	01 ca                	add    %ecx,%edx
  2884a0:	83 c2 08             	add    $0x8,%edx
  2884a3:	83 ec 0c             	sub    $0xc,%esp
  2884a6:	50                   	push   %eax
  2884a7:	6a 00                	push   $0x0
  2884a9:	6a 71                	push   $0x71
  2884ab:	52                   	push   %edx
  2884ac:	ff 75 b4             	pushl  -0x4c(%ebp)
  2884af:	e8 9b f0 ff ff       	call   28754f <tek_rdget1>
  2884b4:	83 c4 20             	add    $0x20,%esp
  2884b7:	39 45 bc             	cmp    %eax,-0x44(%ebp)
  2884ba:	74 0b                	je     2884c7 <tek_decmain5+0xa10>
						i = rep[1];
  2884bc:	8b 45 9c             	mov    -0x64(%ebp),%eax
  2884bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2884c2:	e9 85 00 00 00       	jmp    28854c <tek_decmain5+0xa95>
					else {
						if (tek_rdget1(rd, &prb->st[s].repg2, 0x71, 0, rd->ptbm[13]) ^ stk) /* rep2 */
  2884c7:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  2884ca:	8b 80 50 04 00 00    	mov    0x450(%eax),%eax
  2884d0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  2884d3:	81 c2 e0 00 00 00    	add    $0xe0,%edx
  2884d9:	89 d1                	mov    %edx,%ecx
  2884db:	c1 e1 04             	shl    $0x4,%ecx
  2884de:	8b 55 b0             	mov    -0x50(%ebp),%edx
  2884e1:	01 ca                	add    %ecx,%edx
  2884e3:	83 c2 0c             	add    $0xc,%edx
  2884e6:	83 ec 0c             	sub    $0xc,%esp
  2884e9:	50                   	push   %eax
  2884ea:	6a 00                	push   $0x0
  2884ec:	6a 71                	push   $0x71
  2884ee:	52                   	push   %edx
  2884ef:	ff 75 b4             	pushl  -0x4c(%ebp)
  2884f2:	e8 58 f0 ff ff       	call   28754f <tek_rdget1>
  2884f7:	83 c4 20             	add    $0x20,%esp
  2884fa:	39 45 bc             	cmp    %eax,-0x44(%ebp)
  2884fd:	74 08                	je     288507 <tek_decmain5+0xa50>
							i = rep[2];
  2884ff:	8b 45 a0             	mov    -0x60(%ebp),%eax
  288502:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  288505:	eb 3f                	jmp    288546 <tek_decmain5+0xa8f>
						else {
							if (stk == 0) {
  288507:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
  28850b:	75 2d                	jne    28853a <tek_decmain5+0xa83>
								if  (tek_rdget1(rd, &prb->repg3, 0x71, 0, &rd->bm[22]) == 0)
  28850d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288510:	8d 90 dc 02 00 00    	lea    0x2dc(%eax),%edx
  288516:	8b 45 b0             	mov    -0x50(%ebp),%eax
  288519:	05 b8 1e 00 00       	add    $0x1eb8,%eax
  28851e:	83 ec 0c             	sub    $0xc,%esp
  288521:	52                   	push   %edx
  288522:	6a 00                	push   $0x0
  288524:	6a 71                	push   $0x71
  288526:	50                   	push   %eax
  288527:	ff 75 b4             	pushl  -0x4c(%ebp)
  28852a:	e8 20 f0 ff ff       	call   28754f <tek_rdget1>
  28852f:	83 c4 20             	add    $0x20,%esp
  288532:	85 c0                	test   %eax,%eax
  288534:	0f 84 ae 00 00 00    	je     2885e8 <tek_decmain5+0xb31>
									goto err;
							}
							i = rep[3]; /* rep3 */
  28853a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  28853d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
							rep[3] = rep[2];
  288540:	8b 45 a0             	mov    -0x60(%ebp),%eax
  288543:	89 45 a4             	mov    %eax,-0x5c(%ebp)
						}
						rep[2] = rep[1];
  288546:	8b 45 9c             	mov    -0x64(%ebp),%eax
  288549:	89 45 a0             	mov    %eax,-0x60(%ebp)
					}
					rep[1] = rep[0];
  28854c:	8b 45 98             	mov    -0x68(%ebp),%eax
  28854f:	89 45 9c             	mov    %eax,-0x64(%ebp)
					rep[0] = i;
  288552:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  288555:	89 45 98             	mov    %eax,-0x68(%ebp)
				}
				i = tek_getlen5(rd, 1, s_pos, stk);
  288558:	ff 75 bc             	pushl  -0x44(%ebp)
  28855b:	ff 75 a8             	pushl  -0x58(%ebp)
  28855e:	6a 01                	push   $0x1
  288560:	ff 75 b4             	pushl  -0x4c(%ebp)
  288563:	e8 5c f3 ff ff       	call   2878c4 <tek_getlen5>
  288568:	83 c4 10             	add    $0x10,%esp
  28856b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				s = s < 7 ? 8 : 11;
  28856e:	83 7d d4 06          	cmpl   $0x6,-0x2c(%ebp)
  288572:	7f 07                	jg     28857b <tek_decmain5+0xac4>
  288574:	b8 08 00 00 00       	mov    $0x8,%eax
  288579:	eb 05                	jmp    288580 <tek_decmain5+0xac9>
  28857b:	b8 0b 00 00 00       	mov    $0xb,%eax
  288580:	89 45 d4             	mov    %eax,-0x2c(%ebp)
			}
skip:
			i += 2;
  288583:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
			if (pos + rep[0] < 0)
  288587:	8b 55 98             	mov    -0x68(%ebp),%edx
  28858a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  28858d:	01 d0                	add    %edx,%eax
  28858f:	85 c0                	test   %eax,%eax
  288591:	78 58                	js     2885eb <tek_decmain5+0xb34>
				goto err;
			if (pos + i > osiz)
  288593:	8b 55 d0             	mov    -0x30(%ebp),%edx
  288596:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  288599:	01 d0                	add    %edx,%eax
  28859b:	39 45 10             	cmp    %eax,0x10(%ebp)
  28859e:	7d 09                	jge    2885a9 <tek_decmain5+0xaf2>
				i = osiz - pos;
  2885a0:	8b 45 10             	mov    0x10(%ebp),%eax
  2885a3:	2b 45 d0             	sub    -0x30(%ebp),%eax
  2885a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			pos += i;
  2885a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2885ac:	01 45 d0             	add    %eax,-0x30(%ebp)
			do {
				*q = q[rep[0]];
  2885af:	8b 45 98             	mov    -0x68(%ebp),%eax
  2885b2:	89 c2                	mov    %eax,%edx
  2885b4:	8b 45 14             	mov    0x14(%ebp),%eax
  2885b7:	01 d0                	add    %edx,%eax
  2885b9:	0f b6 10             	movzbl (%eax),%edx
  2885bc:	8b 45 14             	mov    0x14(%ebp),%eax
  2885bf:	88 10                	mov    %dl,(%eax)
				q++;
  2885c1:	83 45 14 01          	addl   $0x1,0x14(%ebp)
			} while (--i);
  2885c5:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  2885c9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  2885cd:	75 e0                	jne    2885af <tek_decmain5+0xaf8>
	while (pos < osiz) {
  2885cf:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2885d2:	3b 45 10             	cmp    0x10(%ebp),%eax
  2885d5:	0f 8c c3 f9 ff ff    	jl     287f9e <tek_decmain5+0x4e7>
		}
	}
	return 0;
  2885db:	b8 00 00 00 00       	mov    $0x0,%eax
  2885e0:	eb 0f                	jmp    2885f1 <tek_decmain5+0xb3a>
		goto err;
  2885e2:	90                   	nop
  2885e3:	eb 07                	jmp    2885ec <tek_decmain5+0xb35>
		goto err;
  2885e5:	90                   	nop
  2885e6:	eb 04                	jmp    2885ec <tek_decmain5+0xb35>
									goto err;
  2885e8:	90                   	nop
  2885e9:	eb 01                	jmp    2885ec <tek_decmain5+0xb35>
				goto err;
  2885eb:	90                   	nop
err:
	return 1;
  2885ec:	b8 01 00 00 00       	mov    $0x1,%eax
}
  2885f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2885f4:	5b                   	pop    %ebx
  2885f5:	5e                   	pop    %esi
  2885f6:	5f                   	pop    %edi
  2885f7:	5d                   	pop    %ebp
  2885f8:	c3                   	ret    

002885f9 <tek_decode5>:

static int tek_decode5(int siz, UCHAR *p, UCHAR *q)
{
  2885f9:	f3 0f 1e fb          	endbr32 
  2885fd:	55                   	push   %ebp
  2885fe:	89 e5                	mov    %esp,%ebp
  288600:	83 ec 28             	sub    $0x28,%esp
	UCHAR *p1 = p + siz;
  288603:	8b 55 0c             	mov    0xc(%ebp),%edx
  288606:	8b 45 08             	mov    0x8(%ebp),%eax
  288609:	01 d0                	add    %edx,%eax
  28860b:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int dsiz, hed, bsiz, st = 0;
  28860e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	p += 16;
  288615:	8b 45 0c             	mov    0xc(%ebp),%eax
  288618:	83 c0 10             	add    $0x10,%eax
  28861b:	89 45 0c             	mov    %eax,0xc(%ebp)
	if ((dsiz = tek_getnum_s7s(&p)) > 0) {
  28861e:	8d 45 0c             	lea    0xc(%ebp),%eax
  288621:	50                   	push   %eax
  288622:	e8 55 e4 ff ff       	call   286a7c <tek_getnum_s7s>
  288627:	83 c4 04             	add    $0x4,%esp
  28862a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  28862d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  288631:	0f 8e e1 00 00 00    	jle    288718 <tek_decode5+0x11f>
		hed = tek_getnum_s7s(&p);
  288637:	8d 45 0c             	lea    0xc(%ebp),%eax
  28863a:	50                   	push   %eax
  28863b:	e8 3c e4 ff ff       	call   286a7c <tek_getnum_s7s>
  288640:	83 c4 04             	add    $0x4,%esp
  288643:	89 45 e8             	mov    %eax,-0x18(%ebp)
		if ((hed & 1) == 0)
  288646:	8b 45 e8             	mov    -0x18(%ebp),%eax
  288649:	83 e0 01             	and    $0x1,%eax
  28864c:	85 c0                	test   %eax,%eax
  28864e:	75 2b                	jne    28867b <tek_decode5+0x82>
			st = tek_lzrestore_tek5(p1 - p + 1, p - 1, dsiz, q);
  288650:	8b 45 0c             	mov    0xc(%ebp),%eax
  288653:	8d 50 ff             	lea    -0x1(%eax),%edx
  288656:	8b 45 0c             	mov    0xc(%ebp),%eax
  288659:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  28865c:	29 c1                	sub    %eax,%ecx
  28865e:	89 c8                	mov    %ecx,%eax
  288660:	83 c0 01             	add    $0x1,%eax
  288663:	ff 75 10             	pushl  0x10(%ebp)
  288666:	ff 75 ec             	pushl  -0x14(%ebp)
  288669:	52                   	push   %edx
  28866a:	50                   	push   %eax
  28866b:	e8 8f eb ff ff       	call   2871ff <tek_lzrestore_tek5>
  288670:	83 c4 10             	add    $0x10,%esp
  288673:	89 45 f4             	mov    %eax,-0xc(%ebp)
  288676:	e9 9d 00 00 00       	jmp    288718 <tek_decode5+0x11f>
		else {
			bsiz = 1 << (((hed >> 1) & 0x0f) + 8);
  28867b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  28867e:	d1 f8                	sar    %eax
  288680:	83 e0 0f             	and    $0xf,%eax
  288683:	83 c0 08             	add    $0x8,%eax
  288686:	ba 01 00 00 00       	mov    $0x1,%edx
  28868b:	89 c1                	mov    %eax,%ecx
  28868d:	d3 e2                	shl    %cl,%edx
  28868f:	89 d0                	mov    %edx,%eax
  288691:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			if (hed & 0x20)
  288694:	8b 45 e8             	mov    -0x18(%ebp),%eax
  288697:	83 e0 20             	and    $0x20,%eax
  28869a:	85 c0                	test   %eax,%eax
  28869c:	74 07                	je     2886a5 <tek_decode5+0xac>
				return 1;
  28869e:	b8 01 00 00 00       	mov    $0x1,%eax
  2886a3:	eb 76                	jmp    28871b <tek_decode5+0x122>
			if (bsiz == 256)
  2886a5:	81 7d e4 00 01 00 00 	cmpl   $0x100,-0x1c(%ebp)
  2886ac:	75 22                	jne    2886d0 <tek_decode5+0xd7>
				st = tek_lzrestore_tek5(p1 - p, p, dsiz, q);
  2886ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  2886b1:	8b 55 0c             	mov    0xc(%ebp),%edx
  2886b4:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2886b7:	29 d1                	sub    %edx,%ecx
  2886b9:	89 ca                	mov    %ecx,%edx
  2886bb:	ff 75 10             	pushl  0x10(%ebp)
  2886be:	ff 75 ec             	pushl  -0x14(%ebp)
  2886c1:	50                   	push   %eax
  2886c2:	52                   	push   %edx
  2886c3:	e8 37 eb ff ff       	call   2871ff <tek_lzrestore_tek5>
  2886c8:	83 c4 10             	add    $0x10,%esp
  2886cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2886ce:	eb 48                	jmp    288718 <tek_decode5+0x11f>
			else {
				if (dsiz > bsiz)
  2886d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2886d3:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  2886d6:	7e 07                	jle    2886df <tek_decode5+0xe6>
					return 1;
  2886d8:	b8 01 00 00 00       	mov    $0x1,%eax
  2886dd:	eb 3c                	jmp    28871b <tek_decode5+0x122>
				if (hed & 0x40)
  2886df:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2886e2:	83 e0 40             	and    $0x40,%eax
  2886e5:	85 c0                	test   %eax,%eax
  2886e7:	74 0f                	je     2886f8 <tek_decode5+0xff>
					tek_getnum_s7s(&p); /* ÉIÉvÉVÉáÉìèÓïÒÇ÷ÇÃÉ|ÉCÉìÉ^Çì«Ç›îÚÇŒÇ∑ */
  2886e9:	83 ec 0c             	sub    $0xc,%esp
  2886ec:	8d 45 0c             	lea    0xc(%ebp),%eax
  2886ef:	50                   	push   %eax
  2886f0:	e8 87 e3 ff ff       	call   286a7c <tek_getnum_s7s>
  2886f5:	83 c4 10             	add    $0x10,%esp
				st = tek_lzrestore_tek5(p1 - p, p, dsiz, q);
  2886f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  2886fb:	8b 55 0c             	mov    0xc(%ebp),%edx
  2886fe:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  288701:	29 d1                	sub    %edx,%ecx
  288703:	89 ca                	mov    %ecx,%edx
  288705:	ff 75 10             	pushl  0x10(%ebp)
  288708:	ff 75 ec             	pushl  -0x14(%ebp)
  28870b:	50                   	push   %eax
  28870c:	52                   	push   %edx
  28870d:	e8 ed ea ff ff       	call   2871ff <tek_lzrestore_tek5>
  288712:	83 c4 10             	add    $0x10,%esp
  288715:	89 45 f4             	mov    %eax,-0xc(%ebp)
			}
		}
	}
	return st;
  288718:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  28871b:	c9                   	leave  
  28871c:	c3                   	ret    

0028871d <memcmp>:
  28871d:	f3 0f 1e fb          	endbr32 
  288721:	55                   	push   %ebp
  288722:	89 e5                	mov    %esp,%ebp
  288724:	83 ec 10             	sub    $0x10,%esp
  288727:	8b 45 08             	mov    0x8(%ebp),%eax
  28872a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  28872d:	8b 45 0c             	mov    0xc(%ebp),%eax
  288730:	89 45 f8             	mov    %eax,-0x8(%ebp)
  288733:	eb 30                	jmp    288765 <memcmp+0x48>
  288735:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288738:	0f b6 10             	movzbl (%eax),%edx
  28873b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  28873e:	0f b6 00             	movzbl (%eax),%eax
  288741:	38 c2                	cmp    %al,%dl
  288743:	74 18                	je     28875d <memcmp+0x40>
  288745:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288748:	0f b6 00             	movzbl (%eax),%eax
  28874b:	0f be d0             	movsbl %al,%edx
  28874e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  288751:	0f b6 00             	movzbl (%eax),%eax
  288754:	0f be c0             	movsbl %al,%eax
  288757:	29 c2                	sub    %eax,%edx
  288759:	89 d0                	mov    %edx,%eax
  28875b:	eb 1a                	jmp    288777 <memcmp+0x5a>
  28875d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  288761:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  288765:	8b 45 10             	mov    0x10(%ebp),%eax
  288768:	8d 50 ff             	lea    -0x1(%eax),%edx
  28876b:	89 55 10             	mov    %edx,0x10(%ebp)
  28876e:	85 c0                	test   %eax,%eax
  288770:	75 c3                	jne    288735 <memcmp+0x18>
  288772:	b8 00 00 00 00       	mov    $0x0,%eax
  288777:	c9                   	leave  
  288778:	c3                   	ret    

00288779 <sprintf>:
  288779:	f3 0f 1e fb          	endbr32 
  28877d:	55                   	push   %ebp
  28877e:	89 e5                	mov    %esp,%ebp
  288780:	83 ec 18             	sub    $0x18,%esp
  288783:	8d 45 10             	lea    0x10(%ebp),%eax
  288786:	89 45 f0             	mov    %eax,-0x10(%ebp)
  288789:	8b 45 f0             	mov    -0x10(%ebp),%eax
  28878c:	83 ec 04             	sub    $0x4,%esp
  28878f:	50                   	push   %eax
  288790:	ff 75 0c             	pushl  0xc(%ebp)
  288793:	ff 75 08             	pushl  0x8(%ebp)
  288796:	e8 0e 01 00 00       	call   2888a9 <vsprintf>
  28879b:	83 c4 10             	add    $0x10,%esp
  28879e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2887a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2887a4:	c9                   	leave  
  2887a5:	c3                   	ret    

002887a6 <strcmp>:
  2887a6:	f3 0f 1e fb          	endbr32 
  2887aa:	55                   	push   %ebp
  2887ab:	89 e5                	mov    %esp,%ebp
  2887ad:	eb 30                	jmp    2887df <strcmp+0x39>
  2887af:	8b 45 08             	mov    0x8(%ebp),%eax
  2887b2:	0f b6 10             	movzbl (%eax),%edx
  2887b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  2887b8:	0f b6 00             	movzbl (%eax),%eax
  2887bb:	38 c2                	cmp    %al,%dl
  2887bd:	74 18                	je     2887d7 <strcmp+0x31>
  2887bf:	8b 45 08             	mov    0x8(%ebp),%eax
  2887c2:	0f b6 00             	movzbl (%eax),%eax
  2887c5:	0f be d0             	movsbl %al,%edx
  2887c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  2887cb:	0f b6 00             	movzbl (%eax),%eax
  2887ce:	0f be c0             	movsbl %al,%eax
  2887d1:	29 c2                	sub    %eax,%edx
  2887d3:	89 d0                	mov    %edx,%eax
  2887d5:	eb 28                	jmp    2887ff <strcmp+0x59>
  2887d7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  2887db:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  2887df:	8b 45 08             	mov    0x8(%ebp),%eax
  2887e2:	0f b6 00             	movzbl (%eax),%eax
  2887e5:	84 c0                	test   %al,%al
  2887e7:	75 c6                	jne    2887af <strcmp+0x9>
  2887e9:	8b 45 08             	mov    0x8(%ebp),%eax
  2887ec:	0f b6 00             	movzbl (%eax),%eax
  2887ef:	0f be d0             	movsbl %al,%edx
  2887f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  2887f5:	0f b6 00             	movzbl (%eax),%eax
  2887f8:	0f be c0             	movsbl %al,%eax
  2887fb:	29 c2                	sub    %eax,%edx
  2887fd:	89 d0                	mov    %edx,%eax
  2887ff:	5d                   	pop    %ebp
  288800:	c3                   	ret    

00288801 <strncmp>:
  288801:	f3 0f 1e fb          	endbr32 
  288805:	55                   	push   %ebp
  288806:	89 e5                	mov    %esp,%ebp
  288808:	eb 3d                	jmp    288847 <strncmp+0x46>
  28880a:	8b 45 08             	mov    0x8(%ebp),%eax
  28880d:	0f b6 00             	movzbl (%eax),%eax
  288810:	84 c0                	test   %al,%al
  288812:	74 12                	je     288826 <strncmp+0x25>
  288814:	8b 45 08             	mov    0x8(%ebp),%eax
  288817:	0f b6 10             	movzbl (%eax),%edx
  28881a:	8b 45 0c             	mov    0xc(%ebp),%eax
  28881d:	0f b6 00             	movzbl (%eax),%eax
  288820:	38 c2                	cmp    %al,%dl
  288822:	74 1b                	je     28883f <strncmp+0x3e>
  288824:	eb 01                	jmp    288827 <strncmp+0x26>
  288826:	90                   	nop
  288827:	8b 45 08             	mov    0x8(%ebp),%eax
  28882a:	0f b6 00             	movzbl (%eax),%eax
  28882d:	0f be d0             	movsbl %al,%edx
  288830:	8b 45 0c             	mov    0xc(%ebp),%eax
  288833:	0f b6 00             	movzbl (%eax),%eax
  288836:	0f be c0             	movsbl %al,%eax
  288839:	29 c2                	sub    %eax,%edx
  28883b:	89 d0                	mov    %edx,%eax
  28883d:	eb 1a                	jmp    288859 <strncmp+0x58>
  28883f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  288843:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  288847:	8b 45 10             	mov    0x10(%ebp),%eax
  28884a:	8d 50 ff             	lea    -0x1(%eax),%edx
  28884d:	89 55 10             	mov    %edx,0x10(%ebp)
  288850:	85 c0                	test   %eax,%eax
  288852:	75 b6                	jne    28880a <strncmp+0x9>
  288854:	b8 00 00 00 00       	mov    $0x0,%eax
  288859:	5d                   	pop    %ebp
  28885a:	c3                   	ret    

0028885b <setdec>:
  28885b:	f3 0f 1e fb          	endbr32 
  28885f:	55                   	push   %ebp
  288860:	89 e5                	mov    %esp,%ebp
  288862:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  288865:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  28886a:	89 c8                	mov    %ecx,%eax
  28886c:	f7 e2                	mul    %edx
  28886e:	c1 ea 03             	shr    $0x3,%edx
  288871:	89 d0                	mov    %edx,%eax
  288873:	c1 e0 02             	shl    $0x2,%eax
  288876:	01 d0                	add    %edx,%eax
  288878:	01 c0                	add    %eax,%eax
  28887a:	29 c1                	sub    %eax,%ecx
  28887c:	89 ca                	mov    %ecx,%edx
  28887e:	89 d0                	mov    %edx,%eax
  288880:	83 6d 08 01          	subl   $0x1,0x8(%ebp)
  288884:	8d 50 30             	lea    0x30(%eax),%edx
  288887:	8b 45 08             	mov    0x8(%ebp),%eax
  28888a:	88 10                	mov    %dl,(%eax)
  28888c:	8b 45 0c             	mov    0xc(%ebp),%eax
  28888f:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  288894:	f7 e2                	mul    %edx
  288896:	89 d0                	mov    %edx,%eax
  288898:	c1 e8 03             	shr    $0x3,%eax
  28889b:	89 45 0c             	mov    %eax,0xc(%ebp)
  28889e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  2888a2:	75 be                	jne    288862 <setdec+0x7>
  2888a4:	8b 45 08             	mov    0x8(%ebp),%eax
  2888a7:	5d                   	pop    %ebp
  2888a8:	c3                   	ret    

002888a9 <vsprintf>:
  2888a9:	f3 0f 1e fb          	endbr32 
  2888ad:	55                   	push   %ebp
  2888ae:	89 e5                	mov    %esp,%ebp
  2888b0:	83 ec 58             	sub    $0x58,%esp
  2888b3:	8b 45 08             	mov    0x8(%ebp),%eax
  2888b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2888b9:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
  2888bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  2888c0:	8d 50 01             	lea    0x1(%eax),%edx
  2888c3:	89 55 0c             	mov    %edx,0xc(%ebp)
  2888c6:	0f b6 00             	movzbl (%eax),%eax
  2888c9:	88 45 db             	mov    %al,-0x25(%ebp)
  2888cc:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  2888d0:	3c 25                	cmp    $0x25,%al
  2888d2:	74 2d                	je     288901 <vsprintf+0x58>
  2888d4:	90                   	nop
  2888d5:	eb 01                	jmp    2888d8 <vsprintf+0x2f>
  2888d7:	90                   	nop
  2888d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2888db:	8d 50 01             	lea    0x1(%eax),%edx
  2888de:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2888e1:	0f b6 55 db          	movzbl -0x25(%ebp),%edx
  2888e5:	88 10                	mov    %dl,(%eax)
  2888e7:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  2888eb:	84 c0                	test   %al,%al
  2888ed:	0f 85 54 04 00 00    	jne    288d47 <vsprintf+0x49e>
  2888f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2888f6:	2b 45 08             	sub    0x8(%ebp),%eax
  2888f9:	83 e8 01             	sub    $0x1,%eax
  2888fc:	e9 4c 04 00 00       	jmp    288d4d <vsprintf+0x4a4>
  288901:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
  288905:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
  288909:	88 45 ef             	mov    %al,-0x11(%ebp)
  28890c:	8b 45 0c             	mov    0xc(%ebp),%eax
  28890f:	8d 50 01             	lea    0x1(%eax),%edx
  288912:	89 55 0c             	mov    %edx,0xc(%ebp)
  288915:	0f b6 00             	movzbl (%eax),%eax
  288918:	88 45 db             	mov    %al,-0x25(%ebp)
  28891b:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  28891f:	3c 2d                	cmp    $0x2d,%al
  288921:	75 06                	jne    288929 <vsprintf+0x80>
  288923:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
  288927:	eb 0c                	jmp    288935 <vsprintf+0x8c>
  288929:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  28892d:	3c 30                	cmp    $0x30,%al
  28892f:	75 15                	jne    288946 <vsprintf+0x9d>
  288931:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
  288935:	8b 45 0c             	mov    0xc(%ebp),%eax
  288938:	8d 50 01             	lea    0x1(%eax),%edx
  28893b:	89 55 0c             	mov    %edx,0xc(%ebp)
  28893e:	0f b6 00             	movzbl (%eax),%eax
  288941:	88 45 db             	mov    %al,-0x25(%ebp)
  288944:	eb d5                	jmp    28891b <vsprintf+0x72>
  288946:	90                   	nop
  288947:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  28894e:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288952:	3c 30                	cmp    $0x30,%al
  288954:	76 3a                	jbe    288990 <vsprintf+0xe7>
  288956:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  28895a:	3c 39                	cmp    $0x39,%al
  28895c:	77 32                	ja     288990 <vsprintf+0xe7>
  28895e:	8b 45 0c             	mov    0xc(%ebp),%eax
  288961:	83 e8 01             	sub    $0x1,%eax
  288964:	89 45 0c             	mov    %eax,0xc(%ebp)
  288967:	83 ec 04             	sub    $0x4,%esp
  28896a:	8d 45 db             	lea    -0x25(%ebp),%eax
  28896d:	50                   	push   %eax
  28896e:	6a 0a                	push   $0xa
  288970:	8d 45 0c             	lea    0xc(%ebp),%eax
  288973:	50                   	push   %eax
  288974:	e8 4a 04 00 00       	call   288dc3 <strtoul0>
  288979:	83 c4 10             	add    $0x10,%esp
  28897c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  28897f:	8b 45 0c             	mov    0xc(%ebp),%eax
  288982:	8d 50 01             	lea    0x1(%eax),%edx
  288985:	89 55 0c             	mov    %edx,0xc(%ebp)
  288988:	0f b6 00             	movzbl (%eax),%eax
  28898b:	88 45 db             	mov    %al,-0x25(%ebp)
  28898e:	eb 25                	jmp    2889b5 <vsprintf+0x10c>
  288990:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288994:	3c 2a                	cmp    $0x2a,%al
  288996:	75 1d                	jne    2889b5 <vsprintf+0x10c>
  288998:	8b 45 10             	mov    0x10(%ebp),%eax
  28899b:	8d 50 04             	lea    0x4(%eax),%edx
  28899e:	89 55 10             	mov    %edx,0x10(%ebp)
  2889a1:	8b 00                	mov    (%eax),%eax
  2889a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2889a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  2889a9:	8d 50 01             	lea    0x1(%eax),%edx
  2889ac:	89 55 0c             	mov    %edx,0xc(%ebp)
  2889af:	0f b6 00             	movzbl (%eax),%eax
  2889b2:	88 45 db             	mov    %al,-0x25(%ebp)
  2889b5:	c7 45 e0 ff ff ff 7f 	movl   $0x7fffffff,-0x20(%ebp)
  2889bc:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  2889c0:	3c 2e                	cmp    $0x2e,%al
  2889c2:	75 76                	jne    288a3a <vsprintf+0x191>
  2889c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  2889c7:	8d 50 01             	lea    0x1(%eax),%edx
  2889ca:	89 55 0c             	mov    %edx,0xc(%ebp)
  2889cd:	0f b6 00             	movzbl (%eax),%eax
  2889d0:	88 45 db             	mov    %al,-0x25(%ebp)
  2889d3:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  2889d7:	3c 30                	cmp    $0x30,%al
  2889d9:	76 3a                	jbe    288a15 <vsprintf+0x16c>
  2889db:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  2889df:	3c 39                	cmp    $0x39,%al
  2889e1:	77 32                	ja     288a15 <vsprintf+0x16c>
  2889e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  2889e6:	83 e8 01             	sub    $0x1,%eax
  2889e9:	89 45 0c             	mov    %eax,0xc(%ebp)
  2889ec:	83 ec 04             	sub    $0x4,%esp
  2889ef:	8d 45 db             	lea    -0x25(%ebp),%eax
  2889f2:	50                   	push   %eax
  2889f3:	6a 0a                	push   $0xa
  2889f5:	8d 45 0c             	lea    0xc(%ebp),%eax
  2889f8:	50                   	push   %eax
  2889f9:	e8 c5 03 00 00       	call   288dc3 <strtoul0>
  2889fe:	83 c4 10             	add    $0x10,%esp
  288a01:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  288a04:	8b 45 0c             	mov    0xc(%ebp),%eax
  288a07:	8d 50 01             	lea    0x1(%eax),%edx
  288a0a:	89 55 0c             	mov    %edx,0xc(%ebp)
  288a0d:	0f b6 00             	movzbl (%eax),%eax
  288a10:	88 45 db             	mov    %al,-0x25(%ebp)
  288a13:	eb 25                	jmp    288a3a <vsprintf+0x191>
  288a15:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288a19:	3c 2a                	cmp    $0x2a,%al
  288a1b:	75 1d                	jne    288a3a <vsprintf+0x191>
  288a1d:	8b 45 10             	mov    0x10(%ebp),%eax
  288a20:	8d 50 04             	lea    0x4(%eax),%edx
  288a23:	89 55 10             	mov    %edx,0x10(%ebp)
  288a26:	8b 00                	mov    (%eax),%eax
  288a28:	89 45 e0             	mov    %eax,-0x20(%ebp)
  288a2b:	8b 45 0c             	mov    0xc(%ebp),%eax
  288a2e:	8d 50 01             	lea    0x1(%eax),%edx
  288a31:	89 55 0c             	mov    %edx,0xc(%ebp)
  288a34:	0f b6 00             	movzbl (%eax),%eax
  288a37:	88 45 db             	mov    %al,-0x25(%ebp)
  288a3a:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288a3e:	3c 73                	cmp    $0x73,%al
  288a40:	0f 85 a0 00 00 00    	jne    288ae6 <vsprintf+0x23d>
  288a46:	81 7d e0 ff ff ff 7f 	cmpl   $0x7fffffff,-0x20(%ebp)
  288a4d:	0f 85 eb 02 00 00    	jne    288d3e <vsprintf+0x495>
  288a53:	8b 45 10             	mov    0x10(%ebp),%eax
  288a56:	8d 50 04             	lea    0x4(%eax),%edx
  288a59:	89 55 10             	mov    %edx,0x10(%ebp)
  288a5c:	8b 00                	mov    (%eax),%eax
  288a5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  288a61:	83 ec 0c             	sub    $0xc,%esp
  288a64:	ff 75 f0             	pushl  -0x10(%ebp)
  288a67:	e8 e3 02 00 00       	call   288d4f <strlen>
  288a6c:	83 c4 10             	add    $0x10,%esp
  288a6f:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  288a72:	8b 45 f0             	mov    -0x10(%ebp),%eax
  288a75:	0f b6 00             	movzbl (%eax),%eax
  288a78:	84 c0                	test   %al,%al
  288a7a:	74 5d                	je     288ad9 <vsprintf+0x230>
  288a7c:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
  288a80:	eb 01                	jmp    288a83 <vsprintf+0x1da>
  288a82:	90                   	nop
  288a83:	80 7d ef 00          	cmpb   $0x0,-0x11(%ebp)
  288a87:	75 1d                	jne    288aa6 <vsprintf+0x1fd>
  288a89:	eb 13                	jmp    288a9e <vsprintf+0x1f5>
  288a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  288a8e:	8d 50 01             	lea    0x1(%eax),%edx
  288a91:	89 55 f4             	mov    %edx,-0xc(%ebp)
  288a94:	0f b6 55 db          	movzbl -0x25(%ebp),%edx
  288a98:	88 10                	mov    %dl,(%eax)
  288a9a:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  288a9e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288aa1:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
  288aa4:	7f e5                	jg     288a8b <vsprintf+0x1e2>
  288aa6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  288aa9:	8d 42 01             	lea    0x1(%edx),%eax
  288aac:	89 45 f0             	mov    %eax,-0x10(%ebp)
  288aaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  288ab2:	8d 48 01             	lea    0x1(%eax),%ecx
  288ab5:	89 4d f4             	mov    %ecx,-0xc(%ebp)
  288ab8:	0f b6 12             	movzbl (%edx),%edx
  288abb:	88 10                	mov    %dl,(%eax)
  288abd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  288ac0:	0f b6 00             	movzbl (%eax),%eax
  288ac3:	84 c0                	test   %al,%al
  288ac5:	75 df                	jne    288aa6 <vsprintf+0x1fd>
  288ac7:	eb 10                	jmp    288ad9 <vsprintf+0x230>
  288ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  288acc:	8d 50 01             	lea    0x1(%eax),%edx
  288acf:	89 55 f4             	mov    %edx,-0xc(%ebp)
  288ad2:	c6 00 20             	movb   $0x20,(%eax)
  288ad5:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  288ad9:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288adc:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
  288adf:	7f e8                	jg     288ac9 <vsprintf+0x220>
  288ae1:	e9 62 02 00 00       	jmp    288d48 <vsprintf+0x49f>
  288ae6:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288aea:	3c 6c                	cmp    $0x6c,%al
  288aec:	75 35                	jne    288b23 <vsprintf+0x27a>
  288aee:	8b 45 0c             	mov    0xc(%ebp),%eax
  288af1:	8d 50 01             	lea    0x1(%eax),%edx
  288af4:	89 55 0c             	mov    %edx,0xc(%ebp)
  288af7:	0f b6 00             	movzbl (%eax),%eax
  288afa:	88 45 db             	mov    %al,-0x25(%ebp)
  288afd:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288b01:	3c 64                	cmp    $0x64,%al
  288b03:	74 1e                	je     288b23 <vsprintf+0x27a>
  288b05:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288b09:	3c 78                	cmp    $0x78,%al
  288b0b:	74 16                	je     288b23 <vsprintf+0x27a>
  288b0d:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288b11:	3c 75                	cmp    $0x75,%al
  288b13:	74 0e                	je     288b23 <vsprintf+0x27a>
  288b15:	8b 45 0c             	mov    0xc(%ebp),%eax
  288b18:	83 e8 01             	sub    $0x1,%eax
  288b1b:	89 45 0c             	mov    %eax,0xc(%ebp)
  288b1e:	e9 22 02 00 00       	jmp    288d45 <vsprintf+0x49c>
  288b23:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288b27:	3c 75                	cmp    $0x75,%al
  288b29:	75 10                	jne    288b3b <vsprintf+0x292>
  288b2b:	8b 45 10             	mov    0x10(%ebp),%eax
  288b2e:	8d 50 04             	lea    0x4(%eax),%edx
  288b31:	89 55 10             	mov    %edx,0x10(%ebp)
  288b34:	8b 00                	mov    (%eax),%eax
  288b36:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  288b39:	eb 40                	jmp    288b7b <vsprintf+0x2d2>
  288b3b:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288b3f:	3c 64                	cmp    $0x64,%al
  288b41:	0f 85 8a 00 00 00    	jne    288bd1 <vsprintf+0x328>
  288b47:	90                   	nop
  288b48:	eb 01                	jmp    288b4b <vsprintf+0x2a2>
  288b4a:	90                   	nop
  288b4b:	8b 45 10             	mov    0x10(%ebp),%eax
  288b4e:	8d 50 04             	lea    0x4(%eax),%edx
  288b51:	89 55 10             	mov    %edx,0x10(%ebp)
  288b54:	8b 00                	mov    (%eax),%eax
  288b56:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  288b59:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288b5c:	85 c0                	test   %eax,%eax
  288b5e:	79 1a                	jns    288b7a <vsprintf+0x2d1>
  288b60:	8b 45 f4             	mov    -0xc(%ebp),%eax
  288b63:	8d 50 01             	lea    0x1(%eax),%edx
  288b66:	89 55 f4             	mov    %edx,-0xc(%ebp)
  288b69:	c6 00 2d             	movb   $0x2d,(%eax)
  288b6c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288b6f:	f7 d8                	neg    %eax
  288b71:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  288b74:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  288b78:	eb 01                	jmp    288b7b <vsprintf+0x2d2>
  288b7a:	90                   	nop
  288b7b:	81 7d e0 ff ff ff 7f 	cmpl   $0x7fffffff,-0x20(%ebp)
  288b82:	0f 85 b9 01 00 00    	jne    288d41 <vsprintf+0x498>
  288b88:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  288b8c:	7f 07                	jg     288b95 <vsprintf+0x2ec>
  288b8e:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  288b95:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288b98:	83 ec 08             	sub    $0x8,%esp
  288b9b:	50                   	push   %eax
  288b9c:	8d 45 bb             	lea    -0x45(%ebp),%eax
  288b9f:	83 c0 1f             	add    $0x1f,%eax
  288ba2:	50                   	push   %eax
  288ba3:	e8 b3 fc ff ff       	call   28885b <setdec>
  288ba8:	83 c4 10             	add    $0x10,%esp
  288bab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  288bae:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
  288bb2:	8d 45 bb             	lea    -0x45(%ebp),%eax
  288bb5:	83 c0 1f             	add    $0x1f,%eax
  288bb8:	2b 45 f0             	sub    -0x10(%ebp),%eax
  288bbb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  288bbe:	80 7d ee 00          	cmpb   $0x0,-0x12(%ebp)
  288bc2:	0f 84 ba fe ff ff    	je     288a82 <vsprintf+0x1d9>
  288bc8:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
  288bcc:	e9 b1 fe ff ff       	jmp    288a82 <vsprintf+0x1d9>
  288bd1:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288bd5:	3c 69                	cmp    $0x69,%al
  288bd7:	0f 84 6d ff ff ff    	je     288b4a <vsprintf+0x2a1>
  288bdd:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288be1:	3c 25                	cmp    $0x25,%al
  288be3:	0f 84 ee fc ff ff    	je     2888d7 <vsprintf+0x2e>
  288be9:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288bed:	3c 78                	cmp    $0x78,%al
  288bef:	75 4f                	jne    288c40 <vsprintf+0x397>
  288bf1:	c7 45 e8 d4 14 31 00 	movl   $0x3114d4,-0x18(%ebp)
  288bf8:	8b 45 10             	mov    0x10(%ebp),%eax
  288bfb:	8d 50 04             	lea    0x4(%eax),%edx
  288bfe:	89 55 10             	mov    %edx,0x10(%ebp)
  288c01:	8b 00                	mov    (%eax),%eax
  288c03:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  288c06:	8d 45 bb             	lea    -0x45(%ebp),%eax
  288c09:	83 c0 1f             	add    $0x1f,%eax
  288c0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  288c0f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288c12:	83 e0 0f             	and    $0xf,%eax
  288c15:	89 c2                	mov    %eax,%edx
  288c17:	8b 45 e8             	mov    -0x18(%ebp),%eax
  288c1a:	01 d0                	add    %edx,%eax
  288c1c:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
  288c20:	0f b6 10             	movzbl (%eax),%edx
  288c23:	8b 45 f0             	mov    -0x10(%ebp),%eax
  288c26:	88 10                	mov    %dl,(%eax)
  288c28:	8d 45 b4             	lea    -0x4c(%ebp),%eax
  288c2b:	8b 10                	mov    (%eax),%edx
  288c2d:	8d 45 b4             	lea    -0x4c(%ebp),%eax
  288c30:	c1 ea 04             	shr    $0x4,%edx
  288c33:	89 10                	mov    %edx,(%eax)
  288c35:	8b 00                	mov    (%eax),%eax
  288c37:	85 c0                	test   %eax,%eax
  288c39:	75 d4                	jne    288c0f <vsprintf+0x366>
  288c3b:	e9 6e ff ff ff       	jmp    288bae <vsprintf+0x305>
  288c40:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288c44:	3c 58                	cmp    $0x58,%al
  288c46:	75 09                	jne    288c51 <vsprintf+0x3a8>
  288c48:	c7 45 e8 e4 14 31 00 	movl   $0x3114e4,-0x18(%ebp)
  288c4f:	eb a7                	jmp    288bf8 <vsprintf+0x34f>
  288c51:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288c55:	3c 70                	cmp    $0x70,%al
  288c57:	75 52                	jne    288cab <vsprintf+0x402>
  288c59:	8b 45 10             	mov    0x10(%ebp),%eax
  288c5c:	8d 50 04             	lea    0x4(%eax),%edx
  288c5f:	89 55 10             	mov    %edx,0x10(%ebp)
  288c62:	8b 00                	mov    (%eax),%eax
  288c64:	89 45 dc             	mov    %eax,-0x24(%ebp)
  288c67:	8d 45 bb             	lea    -0x45(%ebp),%eax
  288c6a:	83 c0 1f             	add    $0x1f,%eax
  288c6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  288c70:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
  288c77:	eb 25                	jmp    288c9e <vsprintf+0x3f5>
  288c79:	8b 45 dc             	mov    -0x24(%ebp),%eax
  288c7c:	83 e0 0f             	and    $0xf,%eax
  288c7f:	0f b6 80 e4 14 31 00 	movzbl 0x3114e4(%eax),%eax
  288c86:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
  288c8a:	89 c2                	mov    %eax,%edx
  288c8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  288c8f:	88 10                	mov    %dl,(%eax)
  288c91:	c1 7d dc 04          	sarl   $0x4,-0x24(%ebp)
  288c95:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288c98:	83 c0 01             	add    $0x1,%eax
  288c9b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  288c9e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288ca1:	83 f8 07             	cmp    $0x7,%eax
  288ca4:	7e d3                	jle    288c79 <vsprintf+0x3d0>
  288ca6:	e9 d8 fd ff ff       	jmp    288a83 <vsprintf+0x1da>
  288cab:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288caf:	3c 6f                	cmp    $0x6f,%al
  288cb1:	75 47                	jne    288cfa <vsprintf+0x451>
  288cb3:	8b 45 10             	mov    0x10(%ebp),%eax
  288cb6:	8d 50 04             	lea    0x4(%eax),%edx
  288cb9:	89 55 10             	mov    %edx,0x10(%ebp)
  288cbc:	8b 00                	mov    (%eax),%eax
  288cbe:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  288cc1:	8d 45 bb             	lea    -0x45(%ebp),%eax
  288cc4:	83 c0 1f             	add    $0x1f,%eax
  288cc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  288cca:	8b 45 b4             	mov    -0x4c(%ebp),%eax
  288ccd:	83 e0 07             	and    $0x7,%eax
  288cd0:	0f b6 80 d4 14 31 00 	movzbl 0x3114d4(%eax),%eax
  288cd7:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
  288cdb:	89 c2                	mov    %eax,%edx
  288cdd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  288ce0:	88 10                	mov    %dl,(%eax)
  288ce2:	8d 45 b4             	lea    -0x4c(%ebp),%eax
  288ce5:	8b 10                	mov    (%eax),%edx
  288ce7:	8d 45 b4             	lea    -0x4c(%ebp),%eax
  288cea:	c1 ea 03             	shr    $0x3,%edx
  288ced:	89 10                	mov    %edx,(%eax)
  288cef:	8b 00                	mov    (%eax),%eax
  288cf1:	85 c0                	test   %eax,%eax
  288cf3:	75 d5                	jne    288cca <vsprintf+0x421>
  288cf5:	e9 b4 fe ff ff       	jmp    288bae <vsprintf+0x305>
  288cfa:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  288cfe:	3c 66                	cmp    $0x66,%al
  288d00:	75 42                	jne    288d44 <vsprintf+0x49b>
  288d02:	81 7d e0 ff ff ff 7f 	cmpl   $0x7fffffff,-0x20(%ebp)
  288d09:	75 07                	jne    288d12 <vsprintf+0x469>
  288d0b:	c7 45 e0 06 00 00 00 	movl   $0x6,-0x20(%ebp)
  288d12:	8b 45 e0             	mov    -0x20(%ebp),%eax
  288d15:	83 c0 01             	add    $0x1,%eax
  288d18:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
  288d1b:	7f 09                	jg     288d26 <vsprintf+0x47d>
  288d1d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  288d20:	83 c0 02             	add    $0x2,%eax
  288d23:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  288d26:	8b 45 f4             	mov    -0xc(%ebp),%eax
  288d29:	8d 50 01             	lea    0x1(%eax),%edx
  288d2c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  288d2f:	c6 00 23             	movb   $0x23,(%eax)
  288d32:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  288d36:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  288d3a:	75 ea                	jne    288d26 <vsprintf+0x47d>
  288d3c:	eb 0a                	jmp    288d48 <vsprintf+0x49f>
  288d3e:	90                   	nop
  288d3f:	eb 04                	jmp    288d45 <vsprintf+0x49c>
  288d41:	90                   	nop
  288d42:	eb 01                	jmp    288d45 <vsprintf+0x49c>
  288d44:	90                   	nop
  288d45:	eb fe                	jmp    288d45 <vsprintf+0x49c>
  288d47:	90                   	nop
  288d48:	e9 70 fb ff ff       	jmp    2888bd <vsprintf+0x14>
  288d4d:	c9                   	leave  
  288d4e:	c3                   	ret    

00288d4f <strlen>:
  288d4f:	f3 0f 1e fb          	endbr32 
  288d53:	55                   	push   %ebp
  288d54:	89 e5                	mov    %esp,%ebp
  288d56:	83 ec 10             	sub    $0x10,%esp
  288d59:	8b 45 08             	mov    0x8(%ebp),%eax
  288d5c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  288d5f:	eb 04                	jmp    288d65 <strlen+0x16>
  288d61:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  288d65:	8b 45 08             	mov    0x8(%ebp),%eax
  288d68:	0f b6 00             	movzbl (%eax),%eax
  288d6b:	84 c0                	test   %al,%al
  288d6d:	75 f2                	jne    288d61 <strlen+0x12>
  288d6f:	8b 45 08             	mov    0x8(%ebp),%eax
  288d72:	2b 45 fc             	sub    -0x4(%ebp),%eax
  288d75:	c9                   	leave  
  288d76:	c3                   	ret    

00288d77 <prefix>:
  288d77:	f3 0f 1e fb          	endbr32 
  288d7b:	55                   	push   %ebp
  288d7c:	89 e5                	mov    %esp,%ebp
  288d7e:	83 ec 10             	sub    $0x10,%esp
  288d81:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
  288d85:	83 7d 08 60          	cmpl   $0x60,0x8(%ebp)
  288d89:	7e 0a                	jle    288d95 <prefix+0x1e>
  288d8b:	83 7d 08 7a          	cmpl   $0x7a,0x8(%ebp)
  288d8f:	7f 04                	jg     288d95 <prefix+0x1e>
  288d91:	83 6d 08 20          	subl   $0x20,0x8(%ebp)
  288d95:	83 7d 08 42          	cmpl   $0x42,0x8(%ebp)
  288d99:	75 04                	jne    288d9f <prefix+0x28>
  288d9b:	c6 45 ff 02          	movb   $0x2,-0x1(%ebp)
  288d9f:	83 7d 08 44          	cmpl   $0x44,0x8(%ebp)
  288da3:	75 04                	jne    288da9 <prefix+0x32>
  288da5:	c6 45 ff 0a          	movb   $0xa,-0x1(%ebp)
  288da9:	83 7d 08 4f          	cmpl   $0x4f,0x8(%ebp)
  288dad:	75 04                	jne    288db3 <prefix+0x3c>
  288daf:	c6 45 ff 08          	movb   $0x8,-0x1(%ebp)
  288db3:	83 7d 08 58          	cmpl   $0x58,0x8(%ebp)
  288db7:	75 04                	jne    288dbd <prefix+0x46>
  288db9:	c6 45 ff 10          	movb   $0x10,-0x1(%ebp)
  288dbd:	0f be 45 ff          	movsbl -0x1(%ebp),%eax
  288dc1:	c9                   	leave  
  288dc2:	c3                   	ret    

00288dc3 <strtoul0>:
  288dc3:	f3 0f 1e fb          	endbr32 
  288dc7:	55                   	push   %ebp
  288dc8:	89 e5                	mov    %esp,%ebp
  288dca:	83 ec 10             	sub    $0x10,%esp
  288dcd:	8b 45 08             	mov    0x8(%ebp),%eax
  288dd0:	8b 00                	mov    (%eax),%eax
  288dd2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  288dd5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  288ddc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  288de0:	75 30                	jne    288e12 <strtoul0+0x4f>
  288de2:	83 45 0c 0a          	addl   $0xa,0xc(%ebp)
  288de6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288de9:	0f b6 00             	movzbl (%eax),%eax
  288dec:	3c 30                	cmp    $0x30,%al
  288dee:	75 22                	jne    288e12 <strtoul0+0x4f>
  288df0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288df3:	83 c0 01             	add    $0x1,%eax
  288df6:	0f b6 00             	movzbl (%eax),%eax
  288df9:	0f b6 c0             	movzbl %al,%eax
  288dfc:	50                   	push   %eax
  288dfd:	e8 75 ff ff ff       	call   288d77 <prefix>
  288e02:	83 c4 04             	add    $0x4,%esp
  288e05:	89 45 0c             	mov    %eax,0xc(%ebp)
  288e08:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  288e0c:	75 04                	jne    288e12 <strtoul0+0x4f>
  288e0e:	83 45 0c 08          	addl   $0x8,0xc(%ebp)
  288e12:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288e15:	0f b6 00             	movzbl (%eax),%eax
  288e18:	3c 30                	cmp    $0x30,%al
  288e1a:	75 1e                	jne    288e3a <strtoul0+0x77>
  288e1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288e1f:	83 c0 01             	add    $0x1,%eax
  288e22:	0f b6 00             	movzbl (%eax),%eax
  288e25:	0f b6 c0             	movzbl %al,%eax
  288e28:	50                   	push   %eax
  288e29:	e8 49 ff ff ff       	call   288d77 <prefix>
  288e2e:	83 c4 04             	add    $0x4,%esp
  288e31:	39 45 0c             	cmp    %eax,0xc(%ebp)
  288e34:	75 04                	jne    288e3a <strtoul0+0x77>
  288e36:	83 45 fc 02          	addl   $0x2,-0x4(%ebp)
  288e3a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  288e3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  288e42:	ba 00 00 00 00       	mov    $0x0,%edx
  288e47:	f7 f1                	div    %ecx
  288e49:	89 45 f0             	mov    %eax,-0x10(%ebp)
  288e4c:	8b 45 10             	mov    0x10(%ebp),%eax
  288e4f:	c6 00 00             	movb   $0x0,(%eax)
  288e52:	c7 45 f4 63 00 00 00 	movl   $0x63,-0xc(%ebp)
  288e59:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288e5c:	0f b6 00             	movzbl (%eax),%eax
  288e5f:	3c 2f                	cmp    $0x2f,%al
  288e61:	76 19                	jbe    288e7c <strtoul0+0xb9>
  288e63:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288e66:	0f b6 00             	movzbl (%eax),%eax
  288e69:	3c 39                	cmp    $0x39,%al
  288e6b:	77 0f                	ja     288e7c <strtoul0+0xb9>
  288e6d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288e70:	0f b6 00             	movzbl (%eax),%eax
  288e73:	0f b6 c0             	movzbl %al,%eax
  288e76:	83 e8 30             	sub    $0x30,%eax
  288e79:	89 45 f4             	mov    %eax,-0xc(%ebp)
  288e7c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288e7f:	0f b6 00             	movzbl (%eax),%eax
  288e82:	3c 40                	cmp    $0x40,%al
  288e84:	76 19                	jbe    288e9f <strtoul0+0xdc>
  288e86:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288e89:	0f b6 00             	movzbl (%eax),%eax
  288e8c:	3c 5a                	cmp    $0x5a,%al
  288e8e:	77 0f                	ja     288e9f <strtoul0+0xdc>
  288e90:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288e93:	0f b6 00             	movzbl (%eax),%eax
  288e96:	0f b6 c0             	movzbl %al,%eax
  288e99:	83 e8 37             	sub    $0x37,%eax
  288e9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  288e9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288ea2:	0f b6 00             	movzbl (%eax),%eax
  288ea5:	3c 60                	cmp    $0x60,%al
  288ea7:	76 19                	jbe    288ec2 <strtoul0+0xff>
  288ea9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288eac:	0f b6 00             	movzbl (%eax),%eax
  288eaf:	3c 7a                	cmp    $0x7a,%al
  288eb1:	77 0f                	ja     288ec2 <strtoul0+0xff>
  288eb3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  288eb6:	0f b6 00             	movzbl (%eax),%eax
  288eb9:	0f b6 c0             	movzbl %al,%eax
  288ebc:	83 e8 57             	sub    $0x57,%eax
  288ebf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  288ec2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  288ec5:	3b 45 0c             	cmp    0xc(%ebp),%eax
  288ec8:	7d 43                	jge    288f0d <strtoul0+0x14a>
  288eca:	8b 45 f8             	mov    -0x8(%ebp),%eax
  288ecd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  288ed0:	77 1c                	ja     288eee <strtoul0+0x12b>
  288ed2:	8b 45 0c             	mov    0xc(%ebp),%eax
  288ed5:	8b 55 f8             	mov    -0x8(%ebp),%edx
  288ed8:	0f af c2             	imul   %edx,%eax
  288edb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  288ede:	8b 45 f8             	mov    -0x8(%ebp),%eax
  288ee1:	f7 d0                	not    %eax
  288ee3:	89 c2                	mov    %eax,%edx
  288ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  288ee8:	39 c2                	cmp    %eax,%edx
  288eea:	73 12                	jae    288efe <strtoul0+0x13b>
  288eec:	eb 01                	jmp    288eef <strtoul0+0x12c>
  288eee:	90                   	nop
  288eef:	8b 45 10             	mov    0x10(%ebp),%eax
  288ef2:	c6 00 01             	movb   $0x1,(%eax)
  288ef5:	c7 45 f8 ff ff ff ff 	movl   $0xffffffff,-0x8(%ebp)
  288efc:	eb 06                	jmp    288f04 <strtoul0+0x141>
  288efe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  288f01:	01 45 f8             	add    %eax,-0x8(%ebp)
  288f04:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  288f08:	e9 45 ff ff ff       	jmp    288e52 <strtoul0+0x8f>
  288f0d:	90                   	nop
  288f0e:	8b 45 08             	mov    0x8(%ebp),%eax
  288f11:	8b 55 fc             	mov    -0x4(%ebp),%edx
  288f14:	89 10                	mov    %edx,(%eax)
  288f16:	8b 45 f8             	mov    -0x8(%ebp),%eax
  288f19:	c9                   	leave  
  288f1a:	c3                   	ret    
