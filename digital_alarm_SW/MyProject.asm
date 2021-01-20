
_EDIT_FD_minutes:

;MyProject.c,51 :: 		void EDIT_FD_minutes()
;MyProject.c,53 :: 		FD_minutes_counter=0;
	CLRF       _FD_minutes_counter+0
;MyProject.c,54 :: 		PORTA = (PORTA & 0xF0) | (FD_minutes_counter);
	MOVLW      240
	ANDWF      PORTA+0, 1
;MyProject.c,55 :: 		if(mode==1)
	MOVF       _mode+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_EDIT_FD_minutes0
;MyProject.c,57 :: 		while(!(PORTB & (1<<6)))
L_EDIT_FD_minutes1:
	BTFSC      PORTB+0, 6
	GOTO       L_EDIT_FD_minutes2
;MyProject.c,59 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_EDIT_FD_minutes3:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_FD_minutes3
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_FD_minutes3
	DECFSZ     R11+0, 1
	GOTO       L_EDIT_FD_minutes3
	NOP
;MyProject.c,60 :: 		if(!(PORTB & (1<<6)))
	BTFSC      PORTB+0, 6
	GOTO       L_EDIT_FD_minutes4
;MyProject.c,62 :: 		PORTB &=~(1<<3);
	BCF        PORTB+0, 3
;MyProject.c,63 :: 		PORTB |=(1<<2)| (1<<4) | (1<<1);
	MOVLW      22
	IORWF      PORTB+0, 1
;MyProject.c,64 :: 		if(INCREASE_IS_PRESSED(PORTB,7))
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_FD_minutes5
;MyProject.c,66 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_EDIT_FD_minutes6:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_FD_minutes6
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_FD_minutes6
	DECFSZ     R11+0, 1
	GOTO       L_EDIT_FD_minutes6
	NOP
;MyProject.c,67 :: 		if(INCREASE_IS_PRESSED(PORTB,7))
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_FD_minutes7
;MyProject.c,69 :: 		FD_minutes_counter++;
	INCF       _FD_minutes_counter+0, 1
;MyProject.c,70 :: 		if(FD_minutes_counter==10)
	MOVF       _FD_minutes_counter+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_EDIT_FD_minutes8
;MyProject.c,72 :: 		FD_minutes_counter = 0;
	CLRF       _FD_minutes_counter+0
;MyProject.c,73 :: 		PORTA = (PORTA & 0xF0) | (FD_minutes_counter);
	MOVLW      240
	ANDWF      PORTA+0, 1
;MyProject.c,74 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_EDIT_FD_minutes9:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_FD_minutes9
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_FD_minutes9
	NOP
;MyProject.c,75 :: 		}
	GOTO       L_EDIT_FD_minutes10
L_EDIT_FD_minutes8:
;MyProject.c,79 :: 		PORTA = (PORTA & 0xF0) | (FD_minutes_counter);
	MOVLW      240
	ANDWF      PORTA+0, 0
	MOVWF      R0+0
	MOVF       _FD_minutes_counter+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTA+0
;MyProject.c,80 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_EDIT_FD_minutes11:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_FD_minutes11
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_FD_minutes11
	NOP
;MyProject.c,81 :: 		}
L_EDIT_FD_minutes10:
;MyProject.c,82 :: 		}
L_EDIT_FD_minutes7:
;MyProject.c,83 :: 		}
L_EDIT_FD_minutes5:
;MyProject.c,84 :: 		}
L_EDIT_FD_minutes4:
;MyProject.c,85 :: 		while(PORTB & (1<<7));
L_EDIT_FD_minutes12:
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_FD_minutes13
	GOTO       L_EDIT_FD_minutes12
L_EDIT_FD_minutes13:
;MyProject.c,86 :: 		}
	GOTO       L_EDIT_FD_minutes1
L_EDIT_FD_minutes2:
;MyProject.c,87 :: 		while(PORTB & (1<<6));
L_EDIT_FD_minutes14:
	BTFSS      PORTB+0, 6
	GOTO       L_EDIT_FD_minutes15
	GOTO       L_EDIT_FD_minutes14
L_EDIT_FD_minutes15:
;MyProject.c,88 :: 		}
L_EDIT_FD_minutes0:
;MyProject.c,89 :: 		}
L_end_EDIT_FD_minutes:
	RETURN
; end of _EDIT_FD_minutes

_EDIT_SD_minutes:

;MyProject.c,90 :: 		void EDIT_SD_minutes()
;MyProject.c,92 :: 		SD_minutes_counter=0;
	CLRF       _SD_minutes_counter+0
;MyProject.c,93 :: 		PORTA = (PORTA & 0xF0) | (SD_minutes_counter);
	MOVLW      240
	ANDWF      PORTA+0, 1
;MyProject.c,94 :: 		if(mode==1)
	MOVF       _mode+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_EDIT_SD_minutes16
;MyProject.c,96 :: 		while(!(PORTB & (1<<6)))
L_EDIT_SD_minutes17:
	BTFSC      PORTB+0, 6
	GOTO       L_EDIT_SD_minutes18
;MyProject.c,98 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_EDIT_SD_minutes19:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_SD_minutes19
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_SD_minutes19
	DECFSZ     R11+0, 1
	GOTO       L_EDIT_SD_minutes19
	NOP
;MyProject.c,99 :: 		if(!(PORTB & (1<<6)))
	BTFSC      PORTB+0, 6
	GOTO       L_EDIT_SD_minutes20
;MyProject.c,101 :: 		PORTB &=~(1<<4);
	BCF        PORTB+0, 4
;MyProject.c,102 :: 		PORTB |=(1<<2)| (1<<1) | (1<<3);
	MOVLW      14
	IORWF      PORTB+0, 1
;MyProject.c,103 :: 		if(INCREASE_IS_PRESSED(PORTB,7))
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_SD_minutes21
;MyProject.c,105 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_EDIT_SD_minutes22:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_SD_minutes22
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_SD_minutes22
	DECFSZ     R11+0, 1
	GOTO       L_EDIT_SD_minutes22
	NOP
;MyProject.c,106 :: 		if(INCREASE_IS_PRESSED(PORTB,7))
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_SD_minutes23
;MyProject.c,108 :: 		SD_minutes_counter++;
	INCF       _SD_minutes_counter+0, 1
;MyProject.c,109 :: 		if(SD_minutes_counter==6)
	MOVF       _SD_minutes_counter+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_EDIT_SD_minutes24
;MyProject.c,111 :: 		SD_minutes_counter = 0;
	CLRF       _SD_minutes_counter+0
;MyProject.c,112 :: 		PORTA = (PORTA & 0xF0) | (SD_minutes_counter);
	MOVLW      240
	ANDWF      PORTA+0, 1
;MyProject.c,113 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_EDIT_SD_minutes25:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_SD_minutes25
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_SD_minutes25
	NOP
;MyProject.c,114 :: 		}
	GOTO       L_EDIT_SD_minutes26
L_EDIT_SD_minutes24:
;MyProject.c,118 :: 		PORTA = (PORTA & 0xF0) | (SD_minutes_counter);
	MOVLW      240
	ANDWF      PORTA+0, 0
	MOVWF      R0+0
	MOVF       _SD_minutes_counter+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTA+0
;MyProject.c,119 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_EDIT_SD_minutes27:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_SD_minutes27
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_SD_minutes27
	NOP
;MyProject.c,120 :: 		}
L_EDIT_SD_minutes26:
;MyProject.c,121 :: 		}
L_EDIT_SD_minutes23:
;MyProject.c,122 :: 		}
L_EDIT_SD_minutes21:
;MyProject.c,123 :: 		}
L_EDIT_SD_minutes20:
;MyProject.c,124 :: 		while(PORTB & (1<<7));
L_EDIT_SD_minutes28:
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_SD_minutes29
	GOTO       L_EDIT_SD_minutes28
L_EDIT_SD_minutes29:
;MyProject.c,125 :: 		}
	GOTO       L_EDIT_SD_minutes17
L_EDIT_SD_minutes18:
;MyProject.c,126 :: 		while(PORTB & (1<<6));
L_EDIT_SD_minutes30:
	BTFSS      PORTB+0, 6
	GOTO       L_EDIT_SD_minutes31
	GOTO       L_EDIT_SD_minutes30
L_EDIT_SD_minutes31:
;MyProject.c,127 :: 		}
L_EDIT_SD_minutes16:
;MyProject.c,128 :: 		}
L_end_EDIT_SD_minutes:
	RETURN
; end of _EDIT_SD_minutes

_EDIT_FD_seconds:

;MyProject.c,129 :: 		void EDIT_FD_seconds()
;MyProject.c,131 :: 		FD_Seconds_counter=0;
	CLRF       _FD_Seconds_counter+0
;MyProject.c,132 :: 		PORTA = (PORTA & 0xF0) | (FD_Seconds_counter);
	MOVLW      240
	ANDWF      PORTA+0, 1
;MyProject.c,133 :: 		if(mode==1)
	MOVF       _mode+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_EDIT_FD_seconds32
;MyProject.c,135 :: 		while(!(PORTB & (1<<6)))
L_EDIT_FD_seconds33:
	BTFSC      PORTB+0, 6
	GOTO       L_EDIT_FD_seconds34
;MyProject.c,137 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_EDIT_FD_seconds35:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_FD_seconds35
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_FD_seconds35
	DECFSZ     R11+0, 1
	GOTO       L_EDIT_FD_seconds35
	NOP
;MyProject.c,138 :: 		if(!(PORTB & (1<<6)))
	BTFSC      PORTB+0, 6
	GOTO       L_EDIT_FD_seconds36
;MyProject.c,140 :: 		PORTB &=~(1<<1);
	BCF        PORTB+0, 1
;MyProject.c,141 :: 		PORTB |=(1<<2);
	BSF        PORTB+0, 2
;MyProject.c,142 :: 		PORTB |=(1<<3);
	BSF        PORTB+0, 3
;MyProject.c,143 :: 		PORTB |=(1<<4);
	BSF        PORTB+0, 4
;MyProject.c,144 :: 		if(INCREASE_IS_PRESSED(PORTB,7))
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_FD_seconds37
;MyProject.c,146 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_EDIT_FD_seconds38:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_FD_seconds38
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_FD_seconds38
	DECFSZ     R11+0, 1
	GOTO       L_EDIT_FD_seconds38
	NOP
;MyProject.c,147 :: 		if(INCREASE_IS_PRESSED(PORTB,7))
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_FD_seconds39
;MyProject.c,149 :: 		FD_Seconds_counter++;
	INCF       _FD_Seconds_counter+0, 1
;MyProject.c,150 :: 		if(FD_Seconds_counter==10)
	MOVF       _FD_Seconds_counter+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_EDIT_FD_seconds40
;MyProject.c,152 :: 		FD_Seconds_counter = 0;
	CLRF       _FD_Seconds_counter+0
;MyProject.c,153 :: 		PORTA = (PORTA & 0xF0) | (FD_Seconds_counter);
	MOVLW      240
	ANDWF      PORTA+0, 1
;MyProject.c,154 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_EDIT_FD_seconds41:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_FD_seconds41
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_FD_seconds41
	NOP
;MyProject.c,155 :: 		}
	GOTO       L_EDIT_FD_seconds42
L_EDIT_FD_seconds40:
;MyProject.c,158 :: 		PORTA = (PORTA & 0xF0) | (FD_Seconds_counter);
	MOVLW      240
	ANDWF      PORTA+0, 0
	MOVWF      R0+0
	MOVF       _FD_Seconds_counter+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTA+0
;MyProject.c,159 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_EDIT_FD_seconds43:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_FD_seconds43
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_FD_seconds43
	NOP
;MyProject.c,160 :: 		}
L_EDIT_FD_seconds42:
;MyProject.c,161 :: 		}
L_EDIT_FD_seconds39:
;MyProject.c,162 :: 		}
L_EDIT_FD_seconds37:
;MyProject.c,163 :: 		}
L_EDIT_FD_seconds36:
;MyProject.c,164 :: 		while(PORTB & (1<<7));
L_EDIT_FD_seconds44:
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_FD_seconds45
	GOTO       L_EDIT_FD_seconds44
L_EDIT_FD_seconds45:
;MyProject.c,165 :: 		}
	GOTO       L_EDIT_FD_seconds33
L_EDIT_FD_seconds34:
;MyProject.c,166 :: 		while(PORTB & (1<<6));
L_EDIT_FD_seconds46:
	BTFSS      PORTB+0, 6
	GOTO       L_EDIT_FD_seconds47
	GOTO       L_EDIT_FD_seconds46
L_EDIT_FD_seconds47:
;MyProject.c,167 :: 		}
L_EDIT_FD_seconds32:
;MyProject.c,168 :: 		}
L_end_EDIT_FD_seconds:
	RETURN
; end of _EDIT_FD_seconds

_EDIT_SD_seconds:

;MyProject.c,169 :: 		void EDIT_SD_seconds()
;MyProject.c,171 :: 		SD_Seconds_counter=0;
	CLRF       _SD_Seconds_counter+0
;MyProject.c,172 :: 		PORTA = (PORTA & 0xF0) | (SD_Seconds_counter);
	MOVLW      240
	ANDWF      PORTA+0, 1
;MyProject.c,173 :: 		if(mode==1)
	MOVF       _mode+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_EDIT_SD_seconds48
;MyProject.c,175 :: 		while(!(PORTB & (1<<6)))
L_EDIT_SD_seconds49:
	BTFSC      PORTB+0, 6
	GOTO       L_EDIT_SD_seconds50
;MyProject.c,177 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_EDIT_SD_seconds51:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_SD_seconds51
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_SD_seconds51
	DECFSZ     R11+0, 1
	GOTO       L_EDIT_SD_seconds51
	NOP
;MyProject.c,178 :: 		if(!(PORTB & (1<<6)))
	BTFSC      PORTB+0, 6
	GOTO       L_EDIT_SD_seconds52
;MyProject.c,180 :: 		PORTB &=~(1<<2);
	BCF        PORTB+0, 2
;MyProject.c,181 :: 		PORTB |=(1<<1)| (1<<4) | (1<<3);
	MOVLW      26
	IORWF      PORTB+0, 1
;MyProject.c,182 :: 		if(INCREASE_IS_PRESSED(PORTB,7))
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_SD_seconds53
;MyProject.c,184 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_EDIT_SD_seconds54:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_SD_seconds54
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_SD_seconds54
	DECFSZ     R11+0, 1
	GOTO       L_EDIT_SD_seconds54
	NOP
;MyProject.c,185 :: 		if(INCREASE_IS_PRESSED(PORTB,7))
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_SD_seconds55
;MyProject.c,187 :: 		SD_Seconds_counter++;
	INCF       _SD_Seconds_counter+0, 1
;MyProject.c,188 :: 		if(SD_Seconds_counter==6)
	MOVF       _SD_Seconds_counter+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_EDIT_SD_seconds56
;MyProject.c,190 :: 		SD_Seconds_counter = 0;
	CLRF       _SD_Seconds_counter+0
;MyProject.c,191 :: 		PORTA = (PORTA & 0xF0) | (SD_Seconds_counter);
	MOVLW      240
	ANDWF      PORTA+0, 1
;MyProject.c,192 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_EDIT_SD_seconds57:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_SD_seconds57
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_SD_seconds57
	NOP
;MyProject.c,193 :: 		}
	GOTO       L_EDIT_SD_seconds58
L_EDIT_SD_seconds56:
;MyProject.c,196 :: 		PORTA = (PORTA & 0xF0) | (SD_Seconds_counter);
	MOVLW      240
	ANDWF      PORTA+0, 0
	MOVWF      R0+0
	MOVF       _SD_Seconds_counter+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTA+0
;MyProject.c,197 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_EDIT_SD_seconds59:
	DECFSZ     R13+0, 1
	GOTO       L_EDIT_SD_seconds59
	DECFSZ     R12+0, 1
	GOTO       L_EDIT_SD_seconds59
	NOP
;MyProject.c,198 :: 		}
L_EDIT_SD_seconds58:
;MyProject.c,199 :: 		}
L_EDIT_SD_seconds55:
;MyProject.c,200 :: 		}
L_EDIT_SD_seconds53:
;MyProject.c,201 :: 		}
L_EDIT_SD_seconds52:
;MyProject.c,202 :: 		while(PORTB & (1<<7));
L_EDIT_SD_seconds60:
	BTFSS      PORTB+0, 7
	GOTO       L_EDIT_SD_seconds61
	GOTO       L_EDIT_SD_seconds60
L_EDIT_SD_seconds61:
;MyProject.c,203 :: 		}
	GOTO       L_EDIT_SD_seconds49
L_EDIT_SD_seconds50:
;MyProject.c,204 :: 		while(PORTB & (1<<6));
L_EDIT_SD_seconds62:
	BTFSS      PORTB+0, 6
	GOTO       L_EDIT_SD_seconds63
	GOTO       L_EDIT_SD_seconds62
L_EDIT_SD_seconds63:
;MyProject.c,205 :: 		}
L_EDIT_SD_seconds48:
;MyProject.c,206 :: 		}
L_end_EDIT_SD_seconds:
	RETURN
; end of _EDIT_SD_seconds

_EDIT_mode:

;MyProject.c,207 :: 		void EDIT_mode(void)
;MyProject.c,209 :: 		if(mode==1)
	MOVF       _mode+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_EDIT_mode64
;MyProject.c,211 :: 		EDIT_FD_seconds();
	CALL       _EDIT_FD_seconds+0
;MyProject.c,212 :: 		EDIT_SD_seconds();
	CALL       _EDIT_SD_seconds+0
;MyProject.c,213 :: 		EDIT_FD_minutes();
	CALL       _EDIT_FD_minutes+0
;MyProject.c,214 :: 		EDIT_SD_minutes();
	CALL       _EDIT_SD_minutes+0
;MyProject.c,215 :: 		mode=0;
	CLRF       _mode+0
;MyProject.c,216 :: 		}
L_EDIT_mode64:
;MyProject.c,217 :: 		}
L_end_EDIT_mode:
	RETURN
; end of _EDIT_mode

_edit_alarm_mode:

;MyProject.c,219 :: 		edit_alarm_mode()
;MyProject.c,221 :: 		if(alarm_mode==1)
	MOVF       _alarm_mode+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_edit_alarm_mode65
;MyProject.c,223 :: 		EDIT_FD_seconds();
	CALL       _EDIT_FD_seconds+0
;MyProject.c,224 :: 		EDIT_SD_seconds();
	CALL       _EDIT_SD_seconds+0
;MyProject.c,225 :: 		EDIT_FD_minutes();
	CALL       _EDIT_FD_minutes+0
;MyProject.c,226 :: 		EDIT_SD_minutes();
	CALL       _EDIT_SD_minutes+0
;MyProject.c,227 :: 		alarm_mode=0;
	CLRF       _alarm_mode+0
;MyProject.c,228 :: 		}
L_edit_alarm_mode65:
;MyProject.c,232 :: 		}
L_end_edit_alarm_mode:
	RETURN
; end of _edit_alarm_mode

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,233 :: 		void interrupt(void)
;MyProject.c,236 :: 		if((INTCON & (1<<1)))
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt66
;MyProject.c,238 :: 		INTCON &=~(1<<1);
	BCF        INTCON+0, 1
;MyProject.c,239 :: 		mode=1;
	MOVLW      1
	MOVWF      _mode+0
;MyProject.c,241 :: 		}
	GOTO       L_interrupt67
L_interrupt66:
;MyProject.c,248 :: 		else if((INTCON & (1<<2)))
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt68
;MyProject.c,250 :: 		INTCON &=~(1<<2);
	BCF        INTCON+0, 2
;MyProject.c,251 :: 		counter++;
	INCF       _counter+0, 1
;MyProject.c,252 :: 		Sch_timer++;
	INCF       _Sch_timer+0, 1
;MyProject.c,253 :: 		}
L_interrupt68:
L_interrupt67:
;MyProject.c,254 :: 		}
L_end_interrupt:
L__interrupt89:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MyProject.c,256 :: 		void main(void)
;MyProject.c,259 :: 		TRISA &=(~(1<<0)) & (~(1<<1)) & (~(1<<2)) & (~(1<<3));
	MOVLW      240
	ANDWF      TRISA+0, 1
;MyProject.c,260 :: 		TRISA &=~(1<<4);
	BCF        TRISA+0, 4
;MyProject.c,262 :: 		PORTA &=(~(1<<0)) & (~(1<<1)) & (~(1<<2)) & (~(1<<3));
	MOVLW      240
	ANDWF      PORTA+0, 1
;MyProject.c,264 :: 		TRISB &=~(1<<1) & (~(1<<2)) & (~(1<<4))& (~(1<<3));
	MOVLW      225
	ANDWF      TRISB+0, 1
;MyProject.c,265 :: 		PORTB |=(1<<0);
	BSF        PORTB+0, 0
;MyProject.c,268 :: 		TRISB |=(1<<6) | (1<<7);
	MOVLW      192
	IORWF      TRISB+0, 1
;MyProject.c,270 :: 		INTCON |=(1<<GIE);
	BSF        INTCON+0, 7
;MyProject.c,271 :: 		timer0_init();
	CALL       _timer0_init+0
;MyProject.c,273 :: 		external();
	CALL       _external+0
;MyProject.c,276 :: 		while(1)
L_main69:
;MyProject.c,278 :: 		if(mode==1)
	MOVF       _mode+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main71
;MyProject.c,279 :: 		EDIT_mode();
	CALL       _EDIT_mode+0
L_main71:
;MyProject.c,284 :: 		if(counter==30)
	MOVF       _counter+0, 0
	XORLW      30
	BTFSS      STATUS+0, 2
	GOTO       L_main72
;MyProject.c,286 :: 		FD_Seconds_counter++;
	INCF       _FD_Seconds_counter+0, 1
;MyProject.c,287 :: 		PORTB ^=(1<<0);
	MOVLW      1
	XORWF      PORTB+0, 1
;MyProject.c,288 :: 		if( FD_Seconds_counter==10)
	MOVF       _FD_Seconds_counter+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main73
;MyProject.c,291 :: 		FD_Seconds_counter = 0;
	CLRF       _FD_Seconds_counter+0
;MyProject.c,292 :: 		SD_Seconds_counter++;
	INCF       _SD_Seconds_counter+0, 1
;MyProject.c,293 :: 		}
L_main73:
;MyProject.c,294 :: 		if(SD_Seconds_counter ==6)
	MOVF       _SD_Seconds_counter+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main74
;MyProject.c,296 :: 		SD_Seconds_counter = 0;
	CLRF       _SD_Seconds_counter+0
;MyProject.c,297 :: 		FD_minutes_counter++;
	INCF       _FD_minutes_counter+0, 1
;MyProject.c,298 :: 		}
L_main74:
;MyProject.c,299 :: 		if(FD_minutes_counter ==10)
	MOVF       _FD_minutes_counter+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main75
;MyProject.c,301 :: 		FD_minutes_counter = 0;
	CLRF       _FD_minutes_counter+0
;MyProject.c,302 :: 		SD_minutes_counter++;
	INCF       _SD_minutes_counter+0, 1
;MyProject.c,303 :: 		}
L_main75:
;MyProject.c,304 :: 		if(SD_minutes_counter ==6)
	MOVF       _SD_minutes_counter+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main76
;MyProject.c,306 :: 		SD_minutes_counter = 0;
	CLRF       _SD_minutes_counter+0
;MyProject.c,307 :: 		}
L_main76:
;MyProject.c,308 :: 		counter=0;
	CLRF       _counter+0
;MyProject.c,309 :: 		MinutesCounter =((SD_Seconds_counter * 10)+ FD_Seconds_counter);
	MOVF       _SD_Seconds_counter+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       _FD_Seconds_counter+0, 0
	ADDWF      R0+0, 0
	MOVWF      _MinutesCounter+0
;MyProject.c,310 :: 		SecondsCounter =((SD_minutes_counter* 10)+ FD_minutes_counter);
	MOVF       _SD_minutes_counter+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       _FD_minutes_counter+0, 0
	ADDWF      R0+0, 0
	MOVWF      _SecondsCounter+0
;MyProject.c,311 :: 		}
	GOTO       L_main77
L_main72:
;MyProject.c,317 :: 		PORTB |=(1<<2);
	BSF        PORTB+0, 2
;MyProject.c,318 :: 		PORTB |=(1<<3);
	BSF        PORTB+0, 3
;MyProject.c,319 :: 		PORTB |=(1<<4);
	BSF        PORTB+0, 4
;MyProject.c,320 :: 		PORTB &=~(1<<1);
	BCF        PORTB+0, 1
;MyProject.c,321 :: 		PORTA = (PORTA & 0xF0) | (FD_Seconds_counter);
	MOVLW      240
	ANDWF      PORTA+0, 0
	MOVWF      R0+0
	MOVF       _FD_Seconds_counter+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTA+0
;MyProject.c,322 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main78:
	DECFSZ     R13+0, 1
	GOTO       L_main78
	DECFSZ     R12+0, 1
	GOTO       L_main78
	NOP
;MyProject.c,323 :: 		PORTB |=(1<<1);
	BSF        PORTB+0, 1
;MyProject.c,324 :: 		PORTB |=(1<<3);
	BSF        PORTB+0, 3
;MyProject.c,325 :: 		PORTB |=(1<<4);
	BSF        PORTB+0, 4
;MyProject.c,326 :: 		PORTB &=~(1<<2);
	BCF        PORTB+0, 2
;MyProject.c,327 :: 		PORTA = (PORTA & 0xF0) | (SD_Seconds_counter);
	MOVLW      240
	ANDWF      PORTA+0, 0
	MOVWF      R0+0
	MOVF       _SD_Seconds_counter+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTA+0
;MyProject.c,328 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main79:
	DECFSZ     R13+0, 1
	GOTO       L_main79
	DECFSZ     R12+0, 1
	GOTO       L_main79
	NOP
;MyProject.c,331 :: 		PORTB |=(1<<1);
	BSF        PORTB+0, 1
;MyProject.c,332 :: 		PORTB |=(1<<2);
	BSF        PORTB+0, 2
;MyProject.c,333 :: 		PORTB |=(1<<4);
	BSF        PORTB+0, 4
;MyProject.c,334 :: 		PORTB &=~(1<<3);
	BCF        PORTB+0, 3
;MyProject.c,335 :: 		PORTA = (PORTA & 0xF0) | (FD_minutes_counter);
	MOVLW      240
	ANDWF      PORTA+0, 0
	MOVWF      R0+0
	MOVF       _FD_minutes_counter+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTA+0
;MyProject.c,336 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main80:
	DECFSZ     R13+0, 1
	GOTO       L_main80
	DECFSZ     R12+0, 1
	GOTO       L_main80
	NOP
;MyProject.c,337 :: 		PORTB |=(1<<1);
	BSF        PORTB+0, 1
;MyProject.c,338 :: 		PORTB |=(1<<2);
	BSF        PORTB+0, 2
;MyProject.c,339 :: 		PORTB |=(1<<3);
	BSF        PORTB+0, 3
;MyProject.c,340 :: 		PORTB &=~(1<<4);
	BCF        PORTB+0, 4
;MyProject.c,341 :: 		PORTA = (PORTA & 0xF0) | (SD_minutes_counter);
	MOVLW      240
	ANDWF      PORTA+0, 0
	MOVWF      R0+0
	MOVF       _SD_minutes_counter+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTA+0
;MyProject.c,342 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main81:
	DECFSZ     R13+0, 1
	GOTO       L_main81
	DECFSZ     R12+0, 1
	GOTO       L_main81
	NOP
;MyProject.c,343 :: 		}
L_main77:
;MyProject.c,344 :: 		}
	GOTO       L_main69
;MyProject.c,346 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_external:

;MyProject.c,347 :: 		void external(void)
;MyProject.c,350 :: 		INTCON |=(1<<4);
	BSF        INTCON+0, 4
;MyProject.c,352 :: 		OPTION_REG |=(1<<INTEDG);
	BSF        OPTION_REG+0, 6
;MyProject.c,353 :: 		TRISB |=(1<<0);       //set the RB0 as input for external interrupt.
	BSF        TRISB+0, 0
;MyProject.c,354 :: 		TRISA &=~(1<<1);      //pin for led.
	BCF        TRISA+0, 1
;MyProject.c,355 :: 		}
L_end_external:
	RETURN
; end of _external

_timer0_init:

;MyProject.c,356 :: 		void timer0_init()
;MyProject.c,359 :: 		OPTION_REG &=~(1<<T0CS) & (~(1<<PSA));
	MOVLW      215
	ANDWF      OPTION_REG+0, 1
;MyProject.c,361 :: 		INTCON |=(1<<T0IE);
	BSF        INTCON+0, 5
;MyProject.c,362 :: 		OPTION_REG |=(1<<0)|(1<<1)|(1<<2);
	MOVLW      7
	IORWF      OPTION_REG+0, 1
;MyProject.c,363 :: 		}
L_end_timer0_init:
	RETURN
; end of _timer0_init
