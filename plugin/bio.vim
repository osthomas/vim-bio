if exists("g:loaded_bio")
    finish
endif

" Set up default colors
let g:bio_default_colors = { "aa": "zappobg", "nt": "ntbg" }


" Check lines (in a list) for specific characters to determine the sequence
" type.
function! BioGetSequenceType(lines)
    let total_len = 0.0
    let non_atgc = 0.0
    for line in a:lines
        " Substitute everything but ATGC and count the characters to determine
        " ATGC fraction
        let total_len = total_len + len(line)
        let non_atgc = non_atgc + len(substitute(line, "[atgc]\\c", "", "g"))
        if non_atgc / total_len > 0.8
            return "aa"
        endif
    endfor
    return "nt"
endfunction
