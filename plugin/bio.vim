if exists("g:loaded_bio")
    finish
endif

" Set up default colors
let g:bio_default_colors = { "aa": "rzappo", "nt": "nucleotide" }


" Check lines (in a list) for specific characters to determine the sequence
" type.
function! BioGetSequenceType(lines)
    for line in a:lines
        if line !~? '^[-.atgcuryswmkdbvhn]\+$'
            return "aa"
        endif
    endfor
    return "nt"
endfunction
