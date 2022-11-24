;Assembly Language Step by step, 1992

;-----------------------------|
;	BEGIN STACK SEGMENT	|
;-----------------------------|
MyStack SEGMENT STACK  		;this word ensures loading of SS by DOS

	DB 64 DUP ('STACK!!!')  ;This reserves 512 bytes for the stack

MyStack ENDS
;-----------------------------|
;	END STACK SEGMENT		|
;-----------------------------|


;-----------------------------|
;   BEGIN DATA SEGMENT		|
;-----------------------------|
MyData	SEGMENT

Eat1 DB "Eat at Joe's...",'$'
CRLF DB  0DH,0AH,'$'

MyData	ENDS
;-----------------------------|
;   END DATA SEGMENT		|
;-----------------------------|


;-----------------------------|
;   BEGIN CODE SEGMENT		|
;-----------------------------|
MyPRog SEGMENT
	assume CS:MyProg,DS:MyData
Main PROC

Start:		;This is where program execution begins:

mov AX,MyData 	;Set up our own data segment address in DS
mov DS,AX		;cant load segment reg. directly from memory

lea DX,Eat1		;load offset of eat1 message string into DX
mov AH, 09H		;Select DOS service 09H: Print String
int 21H		;call DOS

lea DX, CRLF	;load offset of CRLF string into DX
mov AH,09H		;select DOS service 09H: Print string
int 21H		;call DOS

mov AH,4CH		;Terminate process DOS service
mov AL,0		;Pass this value back to ERRORLEVEL
int 21H		;control returns to DOS

Main ENDP

MyProg ENDS


;-----------------------------|
;   END CODE SEGMENT		|
;-----------------------------|

End Start
