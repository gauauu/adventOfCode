.include "global.inc"


.segment "ZEROPAGE"

i:          .res 1
ci:         .res 1
cj:         .res 1
tempA:      .res 1
tempB:      .res 1
tempC:      .res 1
tempD:      .res 1
tempU16:    .res 2
tempU16B:   .res 2
tempU16C:   .res 2
tempU16D:   .res 2
tempS16:    .res 2
tempS16B:   .res 2
tempS16C:   .res 2
tempPtr:    .res 2
tempPtr2:   .res 2
tempPtr3:   .res 2
tempU32A:   .res 4
macroTemp:  .res 8


.segment "CODE"


