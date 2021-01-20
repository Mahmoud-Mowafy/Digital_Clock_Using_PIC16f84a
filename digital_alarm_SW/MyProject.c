/*
 * File:   main.c
 * Author: Mahmoud saeed muhammed
 *
 * Created on November 8, 2020, 6:59 AM
 */


#define IS_BIT_SET(REG,PIN_NUM)                         (REG & (1<<PIN_NUM))
#define IS_BIT_CLEAR(REG,PIN_NUM)                       (!(REG & (1<<PIN_NUM)))
#define SET_BIT(REG,PIN_NUM)                            (REG |=(1<<PIN_NUM))
#define CLEAR_BIT(REG,PIN_NUM)                          (REG &=(~(1<<PIN_NUM)))
#define SHIFT_IS_PRESSED(REG,PIN_NUM)                   (REG & (1<<PIN_NUM))
#define INCREASE_IS_PRESSED(REG,PIN_NUM)                (REG & (1<<PIN_NUM))
#define SWITCH                                   	    0
typedef unsigned char uint8;

void timer0_init();
void external(void);
unsigned char counter=0,val=0;


uint8 Sch_timer=0;
uint8 alarm_mode=0;
uint8  alarmMinutesCounter =0;
uint8  alarmSecondsCounter =0;

uint8  MinutesCounter =0;
uint8  SecondsCounter =0;

// variables to hold the clock time
uint8 seconds_count = 0;
uint8 minutes_count = 0;
uint8 hours_count = 0;

uint8 seconds_FD_count = 0;
uint8 hours_FD_count = 0;
uint8 minutes_FD_count = 0;

uint8 seconds_SD_count =0;
uint8 hours_SD_count = 0;
uint8 minutes_SD_count = 0;
//state mode,intially it is in clock mode and if this var is set using the external INT , we will go to alarm mode.
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
   if(INCREASE_IS_PRESSED(PORTB,7))
   {
     delay_ms(100);
     if(INCREASE_IS_PRESSED(PORTB,7))
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
   if(INCREASE_IS_PRESSED(PORTB,7))
   {
     delay_ms(100);
     if(INCREASE_IS_PRESSED(PORTB,7))
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
   if(INCREASE_IS_PRESSED(PORTB,7))
   {
     delay_ms(100);
     if(INCREASE_IS_PRESSED(PORTB,7))
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
   if(INCREASE_IS_PRESSED(PORTB,7))
   {
     delay_ms(100);
     if(INCREASE_IS_PRESSED(PORTB,7))
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
  //alarmSecondsCounter = ((SD_Seconds_counter * 10)+ FD_Seconds_counter);
  //alarmMinutesCounter = ((SD_minutes_counter* 10)+ FD_minutes_counter);
 // alarmSecondsCounter = ((SD_Seconds_counter * 10)+ FD_Seconds_counter);
}
void interrupt(void)
{
// if the External INT is fired.
     if((INTCON & (1<<1)))
       {
        INTCON &=~(1<<1);
         mode=1;
        // while( PORTB & (1<<0) );
       }
   /*  else if((INTCON & (1<<0))) //if the PORT_Change_interrupt is fired
       {
         INTCON &=~(1<<0);
         while( ( PORTB & (1<<5) ));
         alarm_mode=1;
       }  */
      else if((INTCON & (1<<2)))
        {
         INTCON &=~(1<<2);
         counter++;
         Sch_timer++;
        }
}

void main(void)
{
//the first four pins in PORTA as o/p to show the data on the 7-Segments.
    TRISA &=(~(1<<0)) & (~(1<<1)) & (~(1<<2)) & (~(1<<3));
    TRISA &=~(1<<4);
// print 0 at the 7-segment first
    PORTA &=(~(1<<0)) & (~(1<<1)) & (~(1<<2)) & (~(1<<3));
//set RB<1:4> as output to control the  four 7-seg.
    TRISB &=~(1<<1) & (~(1<<2)) & (~(1<<4))& (~(1<<3));
    PORTB |=(1<<0);
    //TRISB |=(1<<5);  // set RB5 as input for RB change interrupt.
//Increase switch connected to pin7 at portB, Shift switch connected to pin6 at portB, using pull-down.
    TRISB |=(1<<6) | (1<<7);
//enable globale interrupt bit
    INTCON |=(1<<GIE);
    timer0_init();
// Enable the external interrrupt.
    external();
// Enable the RB interrrupt.
    //INTCON |=(1<<RBIE);
    while(1)
    {
    if(mode==1)
       EDIT_mode();
   /* if(alarm_mode==1)
       edit_alarm_mode();
    if( ( alarmSecondsCounter == SecondsCounter) && ( alarmSecondsCounter == MinutesCounter ) )
        PORTA |=(1<<4); */
     if(counter==30)
      {
      FD_Seconds_counter++;
      PORTB ^=(1<<0);
      if( FD_Seconds_counter==10)
       {
// if overflow occurs
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

            // make small delay to see the changes in the 7-segment
            // 2Miliseconds delay will not effect the minutes count
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
            // make small delay to see the changes in the 7-segment
            // 2Miliseconds delay will not effect the hours count
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
     //Enable the external interrupt.
    INTCON |=(1<<4);
    //rising edge.
    OPTION_REG |=(1<<INTEDG);
    TRISB |=(1<<0);       //set the RB0 as input for external interrupt.
    TRISA &=~(1<<1);      //pin for led.
}
void timer0_init()
{
 //enable timer0 module
    OPTION_REG &=~(1<<T0CS) & (~(1<<PSA));
    // enable intetrrupt
    INTCON |=(1<<T0IE);
    OPTION_REG |=(1<<0)|(1<<1)|(1<<2);
}
