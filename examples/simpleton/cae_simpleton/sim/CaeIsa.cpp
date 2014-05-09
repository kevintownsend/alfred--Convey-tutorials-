#include "CaeSim.h"
#include "CaeIsa.h"
#include <stdio.h>

#define PERSONALITY_NUM   65100LL
#define PERS_SIGN_CAE     (PERSONALITY_NUM << 48) + 0x001000101000LL
#define MAX_AEG_INDEX     128

#define AEUIE 0

void
CCaeIsa::InitPers()
{
	SetAegCnt(MAX_AEG_INDEX);
	WriteAeg(0, 0, 0);
	SetPersSign(PERS_SIGN_CAE);
}


void
CCaeIsa::CaepInst(int aeId, int opcode, int immed, uint32 inst, uint64 scalar) // F7,0,20-3F
{
    switch (opcode) {
	// CAEP00 - Custom AE Instruction #0
	case 0x20: {
	
	    // Increment AEG0
	    uint64 value = ReadAeg(aeId, 0);
	    value++;
	    WriteAeg(aeId, 0, value);
	    
	    break;
	}
	// CAEP01 - Custom AE Instruction #1
	case 0x21: {
	
	    // Increment the memory address from AEG0
	    uint64 address, value;
	    address = ReadAeg(aeId, 0);
		
	    AeMemLoad(aeId, McNum(address), address, 8, false, value);
	    value++;
	    AeMemStore(aeId, McNum(address), address, 8, false, value);
	    
	    break;	    
	}
	// All other Custom AE Instructions
	default:{
	    printf("Default case hit - opcode = %x\n", opcode);
	    for (int aeId = 0; aeId < CAE_AE_CNT; aeId += 1)
	        SetException(aeId, AEUIE);
	}
    }
}

