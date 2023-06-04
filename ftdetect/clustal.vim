function! s:GetClustalFlavour()
    " Check a few sequences for non-nucleotide characters
    " The first line is a header.
    let lines = []
    for i in range(2, 10)
        let line = getline(i)[:100]
        " Sequences are delimited by whitespace
        let line = matchstr(line, '\s\S\+')[1:]
        " Conservation information is not relevant for sequence type inference
        if line !~? '[* .:]\+'
            let lines = lines + [line]
        endif
    endfor
    let seqtype = BioGetSequenceType(lines)
    let &ft='clustal.' .. g:bio_default_colors[seqtype]
endfunction


autocmd BufNewFile,BufRead *.aln call s:GetClustalFlavour()
