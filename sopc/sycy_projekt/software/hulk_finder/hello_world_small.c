#include "sys/alt_stdio.h"
#include "system.h"
#include "alt_types.h"
#include "altera_avalon_performance_counter.h"
#include "altera_avalon_pio_regs.h"
#include <stdio.h>

/**
 * Metoda zamieniajace 5 bitowe wartosci input oraz jednobitowy mode na potrzebny znak
 */
char fiveBitToAsciiDecoder(char input, char mode){
	char num;
	num = (mode << 5);
	num = (num|input)&0x3f;
	char asciiTable[] = "abcdefghijklmnopqrstuvwxyz ,.!-?ABCDEFGHIJKLMNOPQRSTUVWXYZ ,!-?";
	return asciiTable[num];
}

/**
 * Metoda wypisuj¹ca znalezione haslo
 */
void printKeyFromData(alt_u32 input){
	char getMode = (input >> 31)&1;

	if(getMode == 0){
		printf("hulk is th");
	}else{
		printf("HULK IS THE");
	}
	char missingChar[6];
	printf("\n");
	//and z 00..011111
	missingChar[0] = (input)&31;
	missingChar[1] = (input >> (5))&31;
	missingChar[2] = (input >> (10))&31;
	missingChar[3] = (input >> (15))&31;
	missingChar[4] = (input >> (20))&31;
	missingChar[5] = (input >> (25))&31;

	int i;
	for(i = 0; i < 6; i++){
		printf("%c", fiveBitToAsciiDecoder(missingChar[5-i], getMode));
	}
	printf("\n");

}

int main(void)
{
	//Tutaj podalisbysmy wartosci 64 pierwszych bitow zaszyfrowanego pdfa
    alt_u32 dataA =  264235;
    alt_u32 dataB =  32411;

    alt_u32 hulkFinderState = 0;
    alt_u64 time = 0;
    alt_u32 status_sw;

    status_sw = IORD_ALTERA_AVALON_PIO_DATA(PIO_0_BASE); // odczyt stanu SW
    //printf("--> SW : %i\n", status_sw);				// jak ustawione SW

    PERF_RESET(PERFORMANCE_COUNTER_0_BASE); 		// reset licznika
    PERF_START_MEASURING(PERFORMANCE_COUNTER_0_BASE); // start licznika

    if(status_sw & 0x01){ 							// jesli przelacznik SW[0]=1
		PERF_BEGIN(PERFORMANCE_COUNTER_0_BASE,1); 	// start liczenia czasu
		hulkFinderState = ALT_CI_HULK_FINDER_V2_0(dataA,dataB);	// wywolanie naszej custom instruction
		PERF_END(PERFORMANCE_COUNTER_0_BASE,1);		// stop liczenia sekcji 1
    }
    printKeyFromData(hulkFinderState);

    PERF_STOP_MEASURING(PERFORMANCE_COUNTER_0_BASE); // stop licznika
    time = perf_get_section_time(PERFORMANCE_COUNTER_0_BASE,1); //
    printf("\nTotal cycles: %ld\n", time);


    while (1){										// zatrzymanie programu
    	status_sw = IORD_ALTERA_AVALON_PIO_DATA(PIO_0_BASE); 	// i wyswietlanie na LEDR
    	IOWR_ALTERA_AVALON_PIO_DATA(PIO_1_BASE, status_sw ); // statusu SW
    }
    return 0;
}
