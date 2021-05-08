[FORMAT "WCOFF"]			; 生成对象文件的模式
[INSTRSET "i486p"]		; 表示使用486兼容指令集
[BITS 32]							; 生成32位模式机器语言
[FILE "pv.nas"]		; 源文件名信息

    GLOBAL	_api_wait
    GLOBAL	_api_signal

[SECTION .text]

_api_wait:	; void api_wait(int S);
		MOV		EDX,8
		MOV		AL,[ESP+4]		; S
		INT		0x40
		RET

_api_signal:	; void api_signal(int S);
		MOV		EDX,9
		MOV		AL,[ESP+4]		; S
		INT		0x40
		RET
