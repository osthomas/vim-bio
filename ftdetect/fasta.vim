function! s:GetFastaFlavor()
    " Check a few lines for non-nucleotide characters
    let lines = []
    for i in range(1, 6)
        let line = getline(i)[:100]
        if line !~? '^>'
            let lines = lines + [line]
        endif
    endfor
    let seqtype = BioGetSequenceType(lines)
    let &ft='fasta.' .. g:bio_default_colors[seqtype]
endfunction

autocmd BufNewFile,BufRead *.fasta,*.fa,*.faa,*.mfa call s:GetFastaFlavor()
