; palettes for overworlds, title screen, monsters
;gbcnote - add pokemon yellow GBC palettes
GBCBasePalettes:
	RGB 31,29,31 ; PAL_ROUTE
	RGB 21,28,11
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_PALLET
	RGB 25,28,27
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_VIRIDIAN
	RGB 17,26,3
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_PEWTER
	RGB 23,25,16
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_CERULEAN
	RGB 20,26,31
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_LAVENDER
	RGB 27,20,27
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_VERMILION
	RGB 30,18,0
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_CELADON
	RGB 16,30,22
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_FUCHSIA
	RGB 31,15,22
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_CINNABAR
	RGB 26,10,6
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_INDIGO
	RGB 22,14,24
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_SAFFRON
	RGB 27,27,3
	RGB 17,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_TOWNMAP
	RGB 17,20,30
	RGB 17,23,10
	RGB 3,2,2

	; PAL_LOGO1
IF DEF(_BLUE)
	RGB 31, 29, 31	;white bg
	RGB 31, 31,  0	;unused yellow logo text
	RGB 21,  0,  4	;unused on title screen
	RGB  3,  2, 23	;version subtitle text color
ENDC
IF DEF(_RED)
	RGB 31, 29, 31	;white bg
	RGB 31, 31,  0	;unused yellow logo text
	RGB 17, 23, 10	;unused on title screen
	RGB 23,  2,  2	;version subtitle text color
ENDC
IF DEF(_GREEN)
	RGB 31, 29, 31	;white bg
	RGB 31, 31,  0	;unused yellow logo text
	RGB 17, 23, 10	;unused on title screen
	RGB  3, 23,  2	;version subtitle text color
ENDC

	; PAL_LOGO2
IF (DEF(_RED) && DEF(_JPLOGO))
	RGB 31, 29, 31	;white bg
	RGB 31, 31,  0	;unused yellow logo text
	RGB  3,  3, 23	;"pocket monsters" logo text color
	RGB 23,  2,  2	;japanese logo text color
ELIF (DEF(_GREEN) && DEF(_JPLOGO))
	RGB 31, 29, 31	;white bg
	RGB 31, 31,  0	;unused yellow logo text
	RGB  3,  3, 23	;"pocket monsters" logo text color
	RGB  3, 23,  2	;japanese logo text color
ELIF (DEF(_BLUE) && DEF(_JPLOGO))
	RGB 31, 29, 31	;white bg
	RGB 31, 31,  0	;unused yellow logo text
	RGB 31, 15,  0	;"pocket monsters" logo text color
	RGB  3,  2, 23	;japanese logo text color
ELSE
	RGB 31, 29, 31	;white bg
	RGB 31, 31,  0	;yellow logo text
	RGB  7,  7, 25	;blue logo text shadow
	RGB  3,  2, 17	;blue logo text outline
ENDC
	RGB 31,29,31 ; PAL_0F
	RGB 24,20,30
	RGB 11,20,30
	RGB 3,2,2

	RGB 31,29,31 ; PAL_MEWMON
	RGB 30,22,17
	RGB 16,14,19
	RGB 3,2,2

	RGB 31,29,31 ; PAL_BLUEMON
	RGB 18,20,27
	RGB 11,15,23
	RGB 3,2,2

	RGB 31,29,31 ; PAL_REDMON
	RGB 31,20,10
	RGB 26,10,6
	RGB 3,2,2

	RGB 31,29,31 ; PAL_CYANMON
	RGB 21,25,29
	RGB 14,19,25
	RGB 3,2,2

	RGB 31,29,31 ; PAL_PURPLEMON	
	RGB 27,22,24
	RGB 21,15,23
	RGB 3,2,2

	RGB 31,29,31 ; PAL_BROWNMON
	RGB 28,20,15
	RGB 21,14,9
	RGB 3,2,2

	RGB 31,29,31 ; PAL_GREENMON
	RGB 20,26,16
	RGB 9,20,11
	RGB 3,2,2

	RGB 31,29,31 ; PAL_PINKMON
	RGB 30,22,24
	RGB 28,15,21
	RGB 3,2,2

	RGB 31,29,31 ; PAL_YELLOWMON
	RGB 29,26,12
	RGB 24,18,0
	RGB 3,2,2

	RGB 31,29,31 ; PAL_GREYMON
	RGB 25,21,22
	RGB 15,15,18
	RGB 3,2,2

;gbcnote - retouched all the slot palettes to match the red/blue coloring
	; PAL_SLOTS1
IF DEF(_GREEN)
	RGB 31, 29, 31	;reel background
	RGB 21, 12, 15	;reel accents
	RGB 16,  0,  0	;"7" fill color
	RGB  3,  2,  2	;reel outline
ELSE
	RGB 31, 29, 31	;reel background
	RGB 21, 12, 15	;reel accents
	RGB 21, 14,  0	;"7" fill color
	RGB  3,  2,  2	;reel outline
ENDC
	; PAL_SLOTS2
IF DEF(_RED)
	RGB 31, 29, 31	;"3" icon fill
	RGB 31, 31,  0	;"3" icon shape color
	RGB 20,  8, 15	;"3" icon background color
	RGB  3,  2,  2	;"3" icon outline
ENDC
IF DEF(_BLUE)
	RGB 31, 29, 31	;"3" icon fill
	RGB 31, 31,  0	;"3" icon shape color
	RGB  9,  5, 30	;"3" icon background color
	RGB  3,  2,  2	;"3" icon outline
ENDC
IF DEF(_GREEN)
	RGB 31, 29, 31	;"3" icon fill
	RGB 31, 31,  0	;"3" icon shape color
	RGB 12, 21,  7	;"3" icon background color
	RGB  3,  2,  2	;"3" icon outline
ENDC

	; PAL_SLOTS3
IF DEF(_RED)
	RGB 31, 29, 31	;"2" icon fill
	RGB  3, 31,  9	;"2" icon shape color
	RGB 20,  8, 15	;"2" icon background color
	RGB  3,  2,  2	;"2" icon outline
ENDC
IF DEF(_BLUE)
	RGB 31, 29, 31	;"2" icon fill
	RGB  3, 31,  9	;"2" icon shape color
	RGB  9,  5, 30	;"2" icon background color
	RGB  3,  2,  2	;"2" icon outline
ENDC
IF DEF(_GREEN)
	RGB 31, 29, 31	;"2" icon fill
	RGB 20,  8, 15	;"2" icon shape color
	RGB 12, 21,  7	;"2" icon background color
	RGB  3,  2,  2	;"2" icon outline
ENDC

	; PAL_SLOTS4
IF DEF(_RED)
	RGB 31, 29, 31	;"1" icon fill
	RGB  9,  5, 30	;"1" icon shape color
	RGB 20,  8, 15	;"1" icon background color
	RGB  3,  2,  2	;"1" icon outline
ENDC
IF DEF(_BLUE)
	RGB 31, 29, 31	;"1" icon fill
	RGB 20,  8, 15	;"1" icon shape color
	RGB  9,  5, 30	;"1" icon background color
	RGB  3,  2,  2	;"1" icon outline
ENDC
IF DEF(_GREEN)
	RGB 31, 29, 31	;"1" icon fill
	RGB  9,  5, 30	;"1" icon shape color
	RGB 12, 21,  7	;"1" icon background color
	RGB  3,  2,  2	;"1" icon outline
ENDC

	RGB 31,29,31 ; PAL_BLACK
	RGB 7,7,7
	RGB 2,3,3
	RGB 3,2,2

	RGB 31,29,31 ; PAL_GREENBAR
	RGB 30,26,15
	RGB 9,20,11
	RGB 3,2,2

	RGB 31,29,31 ; PAL_YELLOWBAR
	RGB 30,26,15
	RGB 26,20,0
	RGB 3,2,2

	RGB 31,29,31 ; PAL_REDBAR
	RGB 30,26,15
	RGB 26,10,6
	RGB 3,2,2

	RGB 31,29,31 ; PAL_BADGE
	RGB 30,22,17
	RGB 11,15,23
	RGB 3,2,2

	RGB 31,29,31 ; PAL_CAVE
	RGB 21,14,9
	RGB 18,24,22
	RGB 3,2,2

	RGB 31,29,31 ; PAL_GAMEFREAK
	RGB 31,28,14
	RGB 24,20,10
	RGB 3,2,2

	; PAL_25
	RGB 31, 29, 31
	RGB 31, 31,  0
	RGB 11, 23, 31
	RGB  3,  2,  2

	; PAL_26
	RGB 31, 29, 31
	RGB 31, 18,  0
	RGB 19,  7,  1
	RGB  3,  2,  2

	; PAL_27
	RGB 31, 29, 31
	RGB  9,  9,  9
	RGB 31, 21,  0
	RGB  3,  2,  2

	; PAL_BW	;joenote - adding a black & white palette just for GBC
	RGB 31, 29, 31
	RGB 31, 29, 31
	RGB  3,  3,  3
	RGB  3,  2,  2

	; PAL_UBALL	;joenote - adding a pal just for ultra balls on GBC
	RGB 31, 29, 31
	RGB 24, 24, 24
	RGB  8,  8,  8
	RGB  3,  2,  2
	
