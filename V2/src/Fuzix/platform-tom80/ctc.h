#ifndef __CTC_DOT_H__
#define __CTC_DOT_H__

void ctc_init();
void ctc_init_single();
void ctc_init_multi();
void ctc_ei();
void ctc_di();

#define CTC_BASE        0x8
#define CTC_RESET       0x3
#define CTC_SINGLE      0xA5
#define CTC_INT_MASK    0xF8

#endif
