autocmd BufNewFile,BufRead *.fastq,*.fq
    \ set ft=fastq |
    \ let &syntax="fastq." .. g:bio_default_colors["nt"]
