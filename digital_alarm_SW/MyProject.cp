#line 1 "C:/Users/Mahmoud/Desktop/pic16f84a digital clock/old/MyProject.c"
#line 16 "C:/Users/Mahmoud/Desktop/pic16f84a digital clock/old/MyProject.c"
typedef unsigned char uint8;

void timer0_init();
void external(void);
unsigned char counter=0,val=0;


uint8 Sch_timer=0;
uint8 alarm_mode=0;
uint8 alarmMinutesCounter =0;
uint8 alarmSecondsCounter =0;

uint8 MinutesCounter =0;
uint8 SecondsCounter =0;


uint8 seconds_count = 0;
uint8 minutes_count = 0;
uint8 hours_count = 0;

uint8 seconds_FD_count = 0;
uint8 hours_FD_count = 0;
uint8 minutes_FD_count = 0;

uint8 seconds_SD_count =0;
uint8 hours_SD_count = 0;
uint8 minutes_SD_count = 0;

uint8 mode=0;

uint8 FD_Seconds_counter =0;
uint8 SD_Seconds_counter =0;
uint8 FD_minutes_counter =0;
uint8 SD_minutes_counter =0;

void EDIT_FD_minutes()
{
 FD_minutes_counter=0;
 PORTA = (PORTA & 0xF0) | (FD_minutes_counter);
 if(mode==1)
 {
 while(!(PORTB & (1<<6)))
 {
 delay_ms(100);
 if(!(PORTB & (1<<6)))
 {
 PORTB &=~(1<<3);
 PORTB |=(1<<2)| (1<<4) | (1<<1);
 if( (PORTB & (1<<7)) )
 {
 delay_ms(100);
 if( (PORTB & (1<<7)) )
 {
 FD_minutes_counter++;
 if(FD_minutes_counter==10)
 {
 FD_minutes_counter = 0;
 PORTA = (PORTA & 0xF0) | (FD_minutes_counter);
 delay_ms(2);
 }

 else
 {
 PORTA = (PORTA & 0xF0) | (FD_minutes_counter);
 delay_ms(2);
 }
 }
 }
 }
 while(PORTB & (1<<7));
 }
 while(PORTB & (1<<6));
 }
}
void EDIT_SD_minutes()
{
 SD_minutes_counter=0;
 PORTA = (PORTA & 0xF0) | (SD_minutes_counter);
 if(mode==1)
 {
 while(!(PORTB & (1<<6)))
 {
 delay_ms(100);
 if(!(PORTB & (1<<6)))
 {
 PORTB &=~(1<<4);
 PORTB |=(1<<2)| (1<<1) | (1<<3);
 if( (PORTB & (1<<7)) )
 {
 delay_ms(100);
 if( (PORTB & (1<<7)) )
 {
 SD_minutes_counter++;
 if(SD_minutes_counter==6)
 {
 SD_minutes_counter = 0;
 PORTA = (PORTA & 0xF0) | (SD_minutes_counter);
 delay_ms(2);
 }

 else
 {
 PORTA = (PORTA & 0xF0) | (SD_minutes_counter);
 delay_ms(2);
 }
 }
 }
 }
 while(PORTB & (1<<7));
 }
 while(PORTB & (1<<6));
 }
}
void EDIT_FD_seconds()
{
 FD_Seconds_counter=0;
 PORTA = (PORTA & 0xF0) | (FD_Seconds_counter);
 if(mode==1)
 {
 while(!(PORTB & (1<<6)))
 {
 delay_ms(100);
 if(!(PORTB & (1<<6)))
 {
 PORTB &=~(1<<1);
 PORTB |=(1<<2);
 PORTB |=(1<<3);
 PORTB |=(1<<4);
 if( (PORTB & (1<<7)) )
 {
 delay_ms(100);
 if( (PORTB & (1<<7)) )
 {
 FD_Seconds_counter++;
 if(FD_Seconds_counter==10)
 {
 FD_Seconds_counter = 0;
 PORTA = (PORTA & 0xF0) | (FD_Seconds_counter);
 delay_ms(2);
 }
 else
 {
 PORTA = (PORTA & 0xF0) | (FD_Seconds_counter);
 delay_ms(2);
 }
 }
 }
 }
 while(PORTB & (1<<7));
 }
 while(PORTB & (1<<6));
 }
}
void EDIT_SD_seconds()
{
 SD_Seconds_counter=0;
 PORTA = (PORTA & 0xF0) | (SD_Seconds_counter);
 if(mode==1)
 {
 while(!(PORTB & (1<<6)))
 {
 delay_ms(100);
 if(!(PORTB & (1<<6)))
 {
 PORTB &=~(1<<2);
 PORTB |=(1<<1)| (1<<4) | (1<<3);
 if( (PORTB & (1<<7)) )
 {
 delay_ms(100);
 if( (PORTB & (1<<7)) )
 {
 SD_Seconds_counter++;
 if(SD_Seconds_counter==6)
 {
 SD_Seconds_counter = 0;
 PORTA = (PORTA & 0xF0) | (SD_Seconds_counter);
 delay_ms(2);
 }
 else
 {
 PORTA = (PORTA & 0xF0) | (SD_Seconds_counter);
 delay_ms(2);
 }
 }
 }
 }
 while(PORTB & (1<<7));
 }
 while(PORTB & (1<<6));
 }
}
void EDIT_mode(void)
{
 if(mode==1)
 {
 EDIT_FD_seconds();
 EDIT_SD_seconds();
 EDIT_FD_minutes();
 EDIT_SD_minutes();
 mode=0;
 }
}

edit_alarm_mode()
{
 if(alarm_mode==1)
 {
 EDIT_FD_seconds();
 EDIT_SD_seconds();
 EDIT_FD_minutes();
 EDIT_SD_minutes();
 alarm_mode=0;
 }



}
void interrupt(void)
{

 if((INTCON & (1<<1)))
 {
 INTCON &=~(1<<1);
 mode=1;

 }
#line 248 "C:/Users/Mahmoud/Desktop/pic16f84a digital clock/old/MyProject.c"
 else if((INTCON & (1<<2)))
 {
 INTCON &=~(1<<2);
 counter++;
 Sch_timer++;
 }
}

void main(void)
{

 TRISA &=(~(1<<0)) & (~(1<<1)) & (~(1<<2)) & (~(1<<3));
 TRISA &=~(1<<4);

 PORTA &=(~(1<<0)) & (~(1<<1)) & (~(1<<2)) & (~(1<<3));

 TRISB &=~(1<<1) & (~(1<<2)) & (~(1<<4))& (~(1<<3));
 PORTB |=(1<<0);


 TRISB |=(1<<6) | (1<<7);

 INTCON |=(1<<GIE);
 timer0_init();

 external();


 while(1)
 {
 if(mode==1)
 EDIT_mode();
#line 284 "C:/Users/Mahmoud/Desktop/pic16f84a digital clock/old/MyProject.c"
 if(counter==30)
 {
 FD_Seconds_counter++;
 PORTB ^=(1<<0);
 if( FD_Seconds_counter==10)
 {

 FD_Seconds_counter = 0;
 SD_Seconds_counter++;
 }
 if(SD_Seconds_counter ==6)
 {
 SD_Seconds_counter = 0;
 FD_minutes_counter++;
 }
 if(FD_minutes_counter ==10)
 {
 FD_minutes_counter = 0;
 SD_minutes_counter++;
 }
 if(SD_minutes_counter ==6)
 {
 SD_minutes_counter = 0;
 }
 counter=0;
 MinutesCounter =((SD_Seconds_counter * 10)+ FD_Seconds_counter);
 SecondsCounter =((SD_minutes_counter* 10)+ FD_minutes_counter);
 }
 else
 {



 PORTB |=(1<<2);
 PORTB |=(1<<3);
 PORTB |=(1<<4);
 PORTB &=~(1<<1);
 PORTA = (PORTA & 0xF0) | (FD_Seconds_counter);
 delay_ms(2);
 PORTB |=(1<<1);
 PORTB |=(1<<3);
 PORTB |=(1<<4);
 PORTB &=~(1<<2);
 PORTA = (PORTA & 0xF0) | (SD_Seconds_counter);
 delay_ms(2);


 PORTB |=(1<<1);
 PORTB |=(1<<2);
 PORTB |=(1<<4);
 PORTB &=~(1<<3);
 PORTA = (PORTA & 0xF0) | (FD_minutes_counter);
 delay_ms(2);
 PORTB |=(1<<1);
 PORTB |=(1<<2);
 PORTB |=(1<<3);
 PORTB &=~(1<<4);
 PORTA = (PORTA & 0xF0) | (SD_minutes_counter);
 delay_ms(2);
 }
 }
 return;
}
void external(void)
{

 INTCON |=(1<<4);

 OPTION_REG |=(1<<INTEDG);
 TRISB |=(1<<0);
 TRISA &=~(1<<1);
}
void timer0_init()
{

 OPTION_REG &=~(1<<T0CS) & (~(1<<PSA));

 INTCON |=(1<<T0IE);
 OPTION_REG |=(1<<0)|(1<<1)|(1<<2);
}
