if exists('b:current_syntax')
  finish
endif

runtime! syntax/bioheader-common.vim

" Find the column at which sequences start.
" This is required to precisely define the extent of the conversation column:
" it is preceded by spaces, but the first character of the conversation column
" makes can also be a space. This makes it impossible (?) to define with a
" regular expression.
for i in range(2, 10)
    let line = getline(i)[:100]
    if line == ""
        continue
    endif
    let pos =  match(line, '\s\S')
    if pos != -1
        " Adjust for zero-indexed result and position of match
        let b:clustal_startcol = pos + 2
        break
    endif
endfor


syn clear
syntax match clustalHeader '^\S\+' contains=bioHeaderDelim nextgroup=clustalSequence
syntax match clustalSequence '\s\@<=\S\+' nextgroup=clustalPosition,clustalHeader,clustalConservation
syntax cluster biosequence add=clustalSequence

" The position at which sequences start is determined when opening the file.
exe "syntax region clustalConservation start='"
    \ .. '\%' .. b:clustal_startcol .. 'c[*:. ]\@=' .. "' end='$'"

syntax match clustalPosition '\d\+' nextgroup=clustalHeader,clustalConservation
syntax region clustalPreamble start='\%^\n*.' end='.$'

syntax match clustalCons1 ' \+' containedin=clustalConservation contained
syntax match clustalCons2 '\.\+' containedin=clustalConservation contained
syntax match clustalCons3 ':\+' containedin=clustalConservation contained
syntax match clustalCons4 '*\+' containedin=clustalConservation contained


hi link clustalPreamble Comment
hi link clustalHeader Comment
hi link clustalPosition Comment
hi clustalCons1 guibg=red
hi link clustalCons2 DiffChange
hi link clustalCons3 DiffChange
hi link clustalCons4 Comment

let b:current_syntax = 'clustal'
