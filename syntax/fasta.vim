if exists("b:current_syntax")
  finish
endif

" Match to end of line or <Tab> - not actually valid FASTA, but occassionally
" useful to put sequence records (including the header) on one line.
syntax match fastaHeader '^>.\{-}\(\t\|$\)' contains=fastaHeaderDelim
syntax match fastaHeaderDelim '[;=]' contained

hi link fastaHeader Comment
hi link fastaHeaderDelim Delimiter

let b:current_syntax = "fasta"
