
bin/asmhead.out:     file format elf32-i386


Disassembly of section .startup:

0000c200 <scrn320-0x64>:

		;ORG		0xc200			; 去掉?句，在?接的?候指定0xc200
[BITS 16]
; VBE存在確認

		MOV		AX,0x9000
    c200:	b8 00 90 8e c0       	mov    $0xc08e9000,%eax
		MOV		ES,AX
		MOV		DI,0
    c205:	bf 00 00 b8 00       	mov    $0xb80000,%edi
		MOV		AX,0x4f00
    c20a:	4f                   	dec    %edi
		INT		0x10
    c20b:	cd 10                	int    $0x10
		CMP		AX,0x004f
    c20d:	83 f8 4f             	cmp    $0x4f,%eax
		JNE		scrn320
    c210:	75 52                	jne    c264 <scrn320>

; VBEのバージョンチェック

		MOV		AX,[ES:DI+4]
    c212:	26 8b 45 04          	mov    %es:0x4(%ebp),%eax
		CMP		AX,0x0200
    c216:	3d 00 02 72 49       	cmp    $0x49720200,%eax
		JB		scrn320			; if (AX < 0x0200) goto scrn320

; 画面モード情報を得る

		MOV		CX,VBEMODE
    c21b:	b9 05 01 b8 01       	mov    $0x1b80105,%ecx
		MOV		AX,0x4f01
    c220:	4f                   	dec    %edi
		INT		0x10
    c221:	cd 10                	int    $0x10
		CMP		AX,0x004f
    c223:	83 f8 4f             	cmp    $0x4f,%eax
		JNE		scrn320
    c226:	75 3c                	jne    c264 <scrn320>

; 画面モード情報の確認

		CMP		BYTE [ES:DI+0x19],8
    c228:	26 80 7d 19 08       	cmpb   $0x8,%es:0x19(%ebp)
		JNE		scrn320
    c22d:	75 35                	jne    c264 <scrn320>
		CMP		BYTE [ES:DI+0x1b],4
    c22f:	26 80 7d 1b 04       	cmpb   $0x4,%es:0x1b(%ebp)
		JNE		scrn320
    c234:	75 2e                	jne    c264 <scrn320>
		MOV		AX,[ES:DI+0x00]
    c236:	26 8b 05 25 80 00 74 	mov    %es:0x74008025,%eax
		AND		AX,0x0080
		JZ		scrn320			; モード属性のbit7が0だったのであきらめる
    c23d:	26 bb 05 41 b8 02    	es mov $0x2b84105,%ebx

; 画面モードの切り替え

		MOV		BX,VBEMODE+0x4000
		MOV		AX,0x4f02
    c243:	4f                   	dec    %edi
		INT		0x10
    c244:	cd 10                	int    $0x10
		MOV		BYTE [VMODE],8	; 画面モードをメモする（C言語が参照する）
    c246:	c6 06 f2             	movb   $0xf2,(%esi)
    c249:	0f 08                	invd   
		MOV		AX,[ES:DI+0x12]
    c24b:	26 8b 45 12          	mov    %es:0x12(%ebp),%eax
		MOV		[SCRNX],AX
    c24f:	a3 f4 0f 26 8b       	mov    %eax,0x8b260ff4
		MOV		AX,[ES:DI+0x14]
    c254:	45                   	inc    %ebp
    c255:	14 a3                	adc    $0xa3,%al
		MOV		[SCRNY],AX
    c257:	f6 0f 26             	testb  $0x26,(%edi)
		MOV		EAX,[ES:DI+0x28]
    c25a:	66 8b 45 28          	mov    0x28(%ebp),%ax
		MOV		[VRAM],EAX
    c25e:	66 a3 f8 0f eb 20    	mov    %ax,0x20eb0ff8

0000c264 <scrn320>:
		JMP		keystatus

scrn320:
		MOV		AL,0x13			; VGAグラフィックス、320x200x8bitカラー
    c264:	b0 13                	mov    $0x13,%al
		MOV		AH,0x00
    c266:	b4 00                	mov    $0x0,%ah
		INT		0x10
    c268:	cd 10                	int    $0x10
		MOV		BYTE [VMODE],8	; 画面モードをメモする（C言語が参照する）
    c26a:	c6 06 f2             	movb   $0xf2,(%esi)
    c26d:	0f 08                	invd   
		MOV		WORD [SCRNX],320
    c26f:	c7 06 f4 0f 40 01    	movl   $0x1400ff4,(%esi)
		MOV		WORD [SCRNY],200
    c275:	c7 06 f6 0f c8 00    	movl   $0xc80ff6,(%esi)
		MOV		DWORD [VRAM],0x000a0000
    c27b:	66 c7 06 f8 0f       	movw   $0xff8,(%esi)
    c280:	00 00                	add    %al,(%eax)
    c282:	0a 00                	or     (%eax),%al

0000c284 <keystatus>:

; キーボードのLED状態をBIOSに教えてもらう

keystatus:
		MOV		AH,0x02
    c284:	b4 02                	mov    $0x2,%ah
		INT		0x16 			; keyboard BIOS
    c286:	cd 16                	int    $0x16
		MOV		[LEDS],AL
    c288:	a2 f1 0f b0 ff       	mov    %al,0xffb00ff1
;	AT互換機の仕様では、PICの初期化をするなら、
;	こいつをCLI前にやっておかないと、たまにハングアップする
;	PICの初期化はあとでやる

		MOV		AL,0xff
		OUT		0x21,AL
    c28d:	e6 21                	out    %al,$0x21
		NOP						; OUT命令を連続させるとうまくいかない機種があるらしいので
    c28f:	90                   	nop
		OUT		0xa1,AL
    c290:	e6 a1                	out    %al,$0xa1

		CLI						; さらにCPUレベルでも割り込み禁止
    c292:	fa                   	cli    

; CPUから1MB以上のメモリにアクセスできるように、A20GATEを設定

		CALL	waitkbdout
    c293:	e8 56 01 b0 d1       	call   d1b0c3ee <BOTPAK+0xd188c3ee>
		MOV		AL,0xd1
		OUT		0x64,AL
    c298:	e6 64                	out    %al,$0x64
		CALL	waitkbdout
    c29a:	e8 4f 01 b0 df       	call   dfb0c3ee <BOTPAK+0xdf88c3ee>
		MOV		AL,0xdf			; enable A20
		OUT		0x60,AL
    c29f:	e6 60                	out    %al,$0x60
		CALL	waitkbdout
    c2a1:	e8 48 01 0f 01       	call   10fc3ee <BOTPAK+0xe7c3ee>

; プロテクトモード移行

		LGDT	[GDTR0]			; 暫定GDTを設定
    c2a6:	16                   	push   %ss
    c2a7:	32 c4                	xor    %ah,%al
		MOV		EAX,CR0
    c2a9:	0f 20 c0             	mov    %cr0,%eax
		AND		EAX,0x7fffffff	; bit31を0にする（ページング禁止のため）
    c2ac:	66 25 ff ff          	and    $0xffff,%ax
    c2b0:	ff                   	(bad)  
    c2b1:	7f 66                	jg     c319 <pipelineflush+0x58>
		OR		EAX,0x00000001	; bit0を1にする（プロテクトモード移行のため）
    c2b3:	83 c8 01             	or     $0x1,%eax
		MOV		CR0,EAX
    c2b6:	0f 22 c0             	mov    %eax,%cr0
		;JMP		DWORD 3*8:pipelineflush
		JMP		DWORD 2*8:pipelineflush ;修改?里?制重?cs
    c2b9:	66 ea c1 c2 00 00    	ljmpw  $0x0,$0xc2c1
    c2bf:	10 00                	adc    %al,(%eax)

0000c2c1 <pipelineflush>:

[BITS 32]
pipelineflush:
		MOV		AX,1*8			;  読み書き可能セグメント32bit
    c2c1:	66 b8 08 00          	mov    $0x8,%ax
		MOV		DS,AX
    c2c5:	8e d8                	mov    %eax,%ds
		MOV		ES,AX
    c2c7:	8e c0                	mov    %eax,%es
		MOV		FS,AX
    c2c9:	8e e0                	mov    %eax,%fs
		MOV		GS,AX
    c2cb:	8e e8                	mov    %eax,%gs
		MOV		SS,AX
    c2cd:	8e d0                	mov    %eax,%ss

; bootpackの転送

		MOV		ESI,bootpack	; 転送元
    c2cf:	be 40 c4 00 00       	mov    $0xc440,%esi
		MOV		EDI,BOTPAK		; 転送先
    c2d4:	bf 00 00 28 00       	mov    $0x280000,%edi
		MOV		ECX,512*1024/4
    c2d9:	b9 00 00 02 00       	mov    $0x20000,%ecx
		CALL	memcpy
    c2de:	e8 12 01 00 00       	call   c3f5 <memcpy>

; ついでにディスクデータも本来の位置へ転送

; まずはブートセクタから

		MOV		ESI,0x7c00		; 転送元
    c2e3:	be 00 7c 00 00       	mov    $0x7c00,%esi
		MOV		EDI,DSKCAC		; 転送先
    c2e8:	bf 00 00 10 00       	mov    $0x100000,%edi
		MOV		ECX,512/4
    c2ed:	b9 80 00 00 00       	mov    $0x80,%ecx
		CALL	memcpy
    c2f2:	e8 fe 00 00 00       	call   c3f5 <memcpy>

; 残り全部

		MOV		ESI,DSKCAC0+512	; 転送元
    c2f7:	be 00 82 00 00       	mov    $0x8200,%esi
		MOV		EDI,DSKCAC+512	; 転送先
    c2fc:	bf 00 02 10 00       	mov    $0x100200,%edi
		MOV		ECX,0
    c301:	b9 00 00 00 00       	mov    $0x0,%ecx
		MOV		CL,BYTE [CYLS]
    c306:	8a 0d f0 0f 00 00    	mov    0xff0,%cl
		;MOV     CL,0x9
		IMUL	ECX,512*18*2/4	; シリンダ数からバイト数/4に変換
    c30c:	69 c9 00 12 00 00    	imul   $0x1200,%ecx,%ecx
		SUB		ECX,512/4		; IPLの分だけ差し引く
    c312:	81 e9 80 00 00 00    	sub    $0x80,%ecx
		CALL	memcpy
    c318:	e8 d8 00 00 00       	call   c3f5 <memcpy>
		;SHR		ECX,2			; ECX /= 4;
		;JZ		skip			; 転送するべきものがない
		;MOV		ESI,[EBX+20]	; 転送元
		;ADD		ESI,EBX
		;MOV		EDI,[EBX+12]	; 転送先
		CALL		bootmain  ;?里会解析elf并把代??到0x280000，把数据?到0x310000
    c31d:	e8 4c 00 00 00       	call   c36e <bootmain>

0000c322 <skip>:
skip:
		;MOV		ESP,[EBX+12]	; スタック初期値
		;JMP		DWORD 2*8:0x0000001b
		MOV     	ESP,0x310000
    c322:	bc 00 00 31 00       	mov    $0x310000,%esp
		MOV			EBP,0x0
    c327:	bd 00 00 00 00       	mov    $0x0,%ebp
		;JMP		DWORD 2*8:0x0
		JMP			0x280000  ;skip?一段?定好esp，ebp,然后跳?到0x280000?始?行
    c32c:	e9 cf 3c 27 00       	jmp    280000 <BOTPAK>

0000c331 <memcpy2>:
;	ph++;
;	memcpy2((void *)ph->p_va, (void *)ph->p_offset, ph->p_memsz);//数据?入0x310000
;}

memcpy2:
				push   ebp
    c331:	55                   	push   %ebp
                mov    ebp,esp
    c332:	89 e5                	mov    %esp,%ebp
             	sub    esp,0x10
    c334:	83 ec 10             	sub    $0x10,%esp
             	mov    eax,DWORD [ebp+0xc]
    c337:	8b 45 0c             	mov    0xc(%ebp),%eax
             	mov    DWORD [ebp-0x4],eax
    c33a:	89 45 fc             	mov    %eax,-0x4(%ebp)
             	mov    eax,DWORD [ebp+0x8]
    c33d:	8b 45 08             	mov    0x8(%ebp),%eax
             	mov    DWORD [ebp-0x8],eax
    c340:	89 45 f8             	mov    %eax,-0x8(%ebp)
                jmp    lable2b
    c343:	eb 17                	jmp    c35c <lable2b>

0000c345 <lable14>:
  lable14:             	mov    eax,DWORD [ebp-0x8]
    c345:	8b 45 f8             	mov    -0x8(%ebp),%eax
               	lea    edx,[eax+0x1]
    c348:	8d 50 01             	lea    0x1(%eax),%edx
               	mov    DWORD [ebp-0x8],edx
    c34b:	89 55 f8             	mov    %edx,-0x8(%ebp)
               	mov    edx,DWORD [ebp-0x4]
    c34e:	8b 55 fc             	mov    -0x4(%ebp),%edx
               	lea    ecx,[edx+0x1]
    c351:	8d 4a 01             	lea    0x1(%edx),%ecx
               	mov    DWORD [ebp-0x4],ecx
    c354:	89 4d fc             	mov    %ecx,-0x4(%ebp)
               	movzx  edx,BYTE [edx]
    c357:	0f b6 12             	movzbl (%edx),%edx
               	mov    BYTE [eax],dl
    c35a:	88 10                	mov    %dl,(%eax)

0000c35c <lable2b>:
  lable2b:	             	mov    eax,DWORD [ebp+0x10]
    c35c:	8b 45 10             	mov    0x10(%ebp),%eax
              	lea    edx,[eax-0x1]
    c35f:	8d 50 ff             	lea    -0x1(%eax),%edx
              	mov    DWORD [ebp+0x10],edx
    c362:	89 55 10             	mov    %edx,0x10(%ebp)
              	test   eax,eax
    c365:	85 c0                	test   %eax,%eax
              	jne    lable14
    c367:	75 dc                	jne    c345 <lable14>
              	mov    eax,DWORD [ebp+0x8]
    c369:	8b 45 08             	mov    0x8(%ebp),%eax
              	leave  
    c36c:	c9                   	leave  
              	ret    
    c36d:	c3                   	ret    

0000c36e <bootmain>:

bootmain:
         push   ebp
    c36e:	55                   	push   %ebp
         mov    ebp,esp
    c36f:	89 e5                	mov    %esp,%ebp
         sub    esp,0x1c
    c371:	83 ec 1c             	sub    $0x1c,%esp
         mov    eax,bootpack
    c374:	b8 40 c4 00 00       	mov    $0xc440,%eax
         mov    eax,DWORD [eax]
    c379:	8b 00                	mov    (%eax),%eax
         cmp    eax,0x464c457f
    c37b:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
         je     lable53
    c380:	74 02                	je     c384 <lable53>
         jmp    lablec3
    c382:	eb 66                	jmp    c3ea <lablec3>

0000c384 <lable53>:
  lable53:       	mov    eax,bootpack
    c384:	b8 40 c4 00 00       	mov    $0xc440,%eax
       	mov    eax,DWORD [eax+0x1c]
    c389:	8b 40 1c             	mov    0x1c(%eax),%eax
       	add    eax,bootpack
    c38c:	05 40 c4 00 00       	add    $0xc440,%eax
       	mov    DWORD [ebp-0x4],eax
    c391:	89 45 fc             	mov    %eax,-0x4(%ebp)
       	mov    eax,DWORD [ebp-0x4]
    c394:	8b 45 fc             	mov    -0x4(%ebp),%eax
       	mov    ecx,DWORD [eax+0x14]
    c397:	8b 48 14             	mov    0x14(%eax),%ecx
       	mov    eax,DWORD [ebp-0x4]
    c39a:	8b 45 fc             	mov    -0x4(%ebp),%eax
       	mov    eax,DWORD [eax+0x4]
    c39d:	8b 40 04             	mov    0x4(%eax),%eax
       	add    eax,bootpack
    c3a0:	05 40 c4 00 00       	add    $0xc440,%eax
       	mov    edx,eax
    c3a5:	89 c2                	mov    %eax,%edx
       	mov    eax,DWORD [ebp-0x4]
    c3a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
       	mov    eax,DWORD [eax+0x8]
    c3aa:	8b 40 08             	mov    0x8(%eax),%eax
       	;add    eax,0x280000
       	mov    DWORD [esp+0x8],ecx
    c3ad:	89 4c 24 08          	mov    %ecx,0x8(%esp)
       	mov    DWORD [esp+0x4],edx
    c3b1:	89 54 24 04          	mov    %edx,0x4(%esp)
       	mov    DWORD [esp],eax
    c3b5:	89 04 24             	mov    %eax,(%esp)
       	call   memcpy2
    c3b8:	e8 74 ff ff ff       	call   c331 <memcpy2>
       	add    DWORD [ebp-0x4],0x20
    c3bd:	83 45 fc 20          	addl   $0x20,-0x4(%ebp)
       	mov    eax,DWORD [ebp-0x4]
    c3c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
       	mov    ecx,DWORD [eax+0x14]
    c3c4:	8b 48 14             	mov    0x14(%eax),%ecx
       	mov    eax,DWORD [ebp-0x4]
    c3c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
       	mov    eax,DWORD [eax+0x4]
    c3ca:	8b 40 04             	mov    0x4(%eax),%eax
       	add    eax,bootpack
    c3cd:	05 40 c4 00 00       	add    $0xc440,%eax
       	mov    edx,eax
    c3d2:	89 c2                	mov    %eax,%edx
       	mov    eax,DWORD [ebp-0x4]
    c3d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
       	mov    eax,DWORD [eax+0x8]
    c3d7:	8b 40 08             	mov    0x8(%eax),%eax
       	;add    eax,0x310000
       	mov    DWORD [esp+0x8],ecx
    c3da:	89 4c 24 08          	mov    %ecx,0x8(%esp)
       	mov    DWORD [esp+0x4],edx
    c3de:	89 54 24 04          	mov    %edx,0x4(%esp)
       	mov    DWORD [esp],eax
    c3e2:	89 04 24             	mov    %eax,(%esp)
       	call   memcpy2
    c3e5:	e8 47 ff ff ff       	call   c331 <memcpy2>

0000c3ea <lablec3>:
  lablec3:	                   	leave  
    c3ea:	c9                   	leave  
                   	ret    
    c3eb:	c3                   	ret    

0000c3ec <waitkbdout>:



waitkbdout:
		IN		 AL,0x64
    c3ec:	e4 64                	in     $0x64,%al
		AND		 AL,0x02
    c3ee:	24 02                	and    $0x2,%al
		IN		 AL,0x60 		; から読み(受信バッファが悪さをしないように)
    c3f0:	e4 60                	in     $0x60,%al
		JNZ		waitkbdout		; ANDの結果が0でなければwaitkbdoutへ
    c3f2:	75 f8                	jne    c3ec <waitkbdout>
		RET
    c3f4:	c3                   	ret    

0000c3f5 <memcpy>:

memcpy:
		MOV		EAX,[ESI]
    c3f5:	8b 06 83 c6 04 89 07 83 c7 04 83 e9 01 75 f1 c3     .............u..
	...

0000c410 <GDT0>:
	...
; memcpyはアドレスサイズプリフィクスを入れ忘れなければ、ストリング命令でも書ける

		ALIGNB	16
GDT0:
		RESB	8				; ヌルセレクタ
		DW		0xffff,0x0000,0x9200,0x00cf	; 読み書き可能セグメント32bit
    c418:	ff ff 00 00 00 92 cf 00 ff ff 00 00 00 9a cf 00     ................
		DW		0xffff,0x0000,0x9a00,0x00cf	; 実行可能セグメント32bit（bootpack用）
		DW      0xffff,0x0000,0x9a00,0x004f ;???cs用，加?成功后就不用了
    c428:	ff ff 00 00 00 9a 4f 00 00 00                       ......O...

0000c432 <GDTR0>:

		DW		0
GDTR0:
		DW		8*4-1
    c432:	1f 00 10 c4 00 00 00 00 00 00 00 00 00 00           ..............
