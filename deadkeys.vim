let b:DeadKeysOn=0

function! ToggleDeadKeys()
	if !b:DeadKeysOn
		call DeadKeys()
	else
		call DeadKeysOff()
	endif
endfunction

function! DeadKeys()
	echo "Dead Keys: On"
	let b:DeadKeysOn=1
	"acute accents
	imap <buffer> 'a á
	imap <buffer> 'A Á
	imap <buffer> 'C Ć
	imap <buffer> 'c ć
	imap <buffer> 'e é
	imap <buffer> 'E É
	imap <buffer> 'i í
	imap <buffer> 'I Í
	imap <buffer> 'N Ń
	imap <buffer> 'n ń
	imap <buffer> 'o ó
	imap <buffer> 'R Ŕ
	imap <buffer> 'r ŕ
	imap <buffer> 'S Ś
	imap <buffer> 's ś
	imap <buffer> 'O Ó
	imap <buffer> 'u ú
	imap <buffer> 'U Ú
	imap <buffer> 'l ĺ
	imap <buffer> 'L Ĺ
	imap <buffer> 'y ý
	imap <buffer> 'Y Ý
	imap <buffer> '<space> '

	imap <buffer> [t ť
	imap <buffer> [T Ť
	imap <buffer> [s š
	imap <buffer> [S Š
	imap <buffer> [d ď
	imap <buffer> [D Ď
	imap <buffer> [l ľ
	imap <buffer> [L Ľ
	imap <buffer> [z ž
	imap <buffer> [Z ž
	imap <buffer> [c č
	imap <buffer> [C Č
	imap <buffer> [n ň
	imap <buffer> [N Ň
	imap <buffer> [o ô
	imap <buffer> [a ä
endfunction "deadkeys()

function! DeadKeysOff()
	echo "Dead Keys: Off"
	let b:DeadKeysOn=0

	iunmap <buffer> 'a
	iunmap <buffer> 'A
	iunmap <buffer> 'C
	iunmap <buffer> 'c
	iunmap <buffer> 'e
	iunmap <buffer> 'E
	iunmap <buffer> 'i
	iunmap <buffer> 'I
	iunmap <buffer> 'N
	iunmap <buffer> 'n
	iunmap <buffer> 'o
	iunmap <buffer> 'R
	iunmap <buffer> 'r
	iunmap <buffer> 'S
	iunmap <buffer> 's
	iunmap <buffer> 'O
	iunmap <buffer> 'u
	iunmap <buffer> 'U
	iunmap <buffer> 'l
	iunmap <buffer> 'L
	iunmap <buffer> 'y
	iunmap <buffer> 'Y
	iunmap <buffer> '<space>


	iunmap <buffer> [t
	iunmap <buffer> [T
	iunmap <buffer> [s
	iunmap <buffer> [S
	iunmap <buffer> [d
	iunmap <buffer> [D
	iunmap <buffer> [l
	iunmap <buffer> [L
	iunmap <buffer> [z
	iunmap <buffer> [Z
	iunmap <buffer> [c
	iunmap <buffer> [C
	iunmap <buffer> [n
	iunmap <buffer> [N
	iunmap <buffer> [o
	iunmap <buffer> [a
endfunction

silent! call DeadKeys()
