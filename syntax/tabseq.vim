if exists("b:current_syntax")
  finish
endif

" 'tabseq' is not a real file type, but can be used to highlight sequences in
" tab-separated files (eg. for poor man's SAM highlighting or just generic
" tsvs)

syntax match tabSequence '\(^\|\t\)[ABCDEFGHIKLMNPQRSTUVWXYZabcdefghiklmnpqrstuvwxyz]\+\($\|\t\)'
syntax cluster biosequence add=tabSequence

let b:current_syntax = "tabseq"
