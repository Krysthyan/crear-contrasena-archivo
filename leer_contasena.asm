.MODEL SMALL
.CODE        
.DATA  


DATOS SEGMENT
    CONT DW ?

PROGRAMA: 
   
          
    MOV AX,4552H
    MOV BX,0300H
    MOV [BX],AX
    MOV AX,4947H
    MOV BX,0302H
    MOV [BX],AX
    MOV AX,2E31H
    MOV BX,0304H
    MOV [BX],AX
    MOV AX,5854H
    MOV BX,0306H
    MOV [BX],AX
    MOV AX,0054H
    MOV BX,0308H
    MOV [BX],AX
            
    ;OPEN FILE
    MOV AH,3DH  
    MOV AL,0H
    MOV DX,0300H  
    INT 21H
    
    ;READ FILE
    MOV BX,AX
    MOV AH,3FH
    MOV CX,03E8H
    MOV DX,0400H  
    INT 21H
    
    ;CLOSE FILE
    MOV AH,3EH
    MOV CONT,0400H
    
    INT 21H
                                   


mostar:
    MOV AH,02H
    MOV BX,CONT 
    
    
    XOR [BX],30H    ;DECIFRAR
    MOV DL,[BX] 
    
    CMP BX,0x00
    JE salir
    
   
    INT 21H

    ADD CONT,0DH
    MOV BX,CONT
    
    JNE mostar  
    
salir: 
    RET


.STACK    
    
END PROGRAMA
