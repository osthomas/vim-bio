if exists("b:current_syntax")
  finish
endif

" Match to end of line or <Tab> - not actually valid FASTA, but occassionally
" useful to put sequence records (including the header) on one line.
syntax match fastaHeaderDelim '[;=]' contained
syntax region fastaSequence start='.' end="\n" nextgroup=fastaHeader
syntax match fastaHeader '^>.\{-}\(\t\|$\)' contains=fastaHeaderDelim nextgroup=fastaSequence
syntax cluster biosequence add=fastaSequence

hi link fastaHeader Comment
hi link fastaHeaderDelim Delimiter

let b:current_syntax = "fasta"
