autocmd BufNewFile,BufRead *.fastq,*.fq let &ft="fastq." .. g:bio_default_colors["nt"]
