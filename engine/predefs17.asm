; this function temporarily makes the starters (and Ivysaur) seen
; so that the full Pokedex information gets displayed in Oak's lab
;joenote - the whole pokedex is now preserved on the stack
;	- removed the strange ivysaur mistake
;	- will show the dex entry for any 'mon being viewed (like with random or alternate starters)
StarterDex:
	ld hl, wPokedexOwned
	ld d, (wPokedexOwnedEnd - wPokedexOwned)
.loop
	ld a, [hli]
	ld b, a
	ld a, d
	sub 1
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, d
	sub 1
	ld d, a
	push bc
	jr c, .next
	jr z, .next
	jr .loop
.next
	push hl
;	ld a, [wPokedexOwned]
;	push af
;	ld a, %01001001 ; set starter flags	;joenote - removed ivysaur from the set flags
;	ld [wPokedexOwned], a

	ld a, [wd11e]
	push af
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, FLAG_SET
	ld hl, wPokedexOwned
	predef FlagActionPredef
	pop af
	ld [wd11e], a

	predef ShowPokedexData
	;xor a ; unset starter flags
;	pop af
;	ld [wPokedexOwned], a
	pop hl
	dec hl
	ld d, (wPokedexOwnedEnd - wPokedexOwned)
.loop2
	pop bc
	ld a, c
	ld [hld], a
	ld a, d
	sub 1
	ld d, a
	ld a, b
	ld [hld], a
	ld a, d
	sub 1
	ld d, a
	jr c, .next2
	jr z, .next2
	jr .loop2	
.next2
	ret
