if exists("b:current_syntax")
  finish
endif

syntax region fastaHeader start='^>' end='^' contains=fastaHeaderDelim
syntax match fastaHeaderDelim '[;=|]' contained
syntax region fastaSequence start='^[^>]' end='^'
syntax cluster biosequence add=fastaSequence

hi link fastaHeader Comment
hi link fastaHeaderDelim Delimiter

let b:current_syntax = "fasta"
