if exists("b:current_syntax")
  finish
endif

runtime! syntax/bioheader-common.vim


syntax region fastaHeader start='^>' end='^' contains=bioHeaderDelim
syntax region fastaSequence start='^[^>]' end='^'
syntax cluster biosequence add=fastaSequence

hi link fastaHeader Comment

let b:current_syntax = "fasta"
