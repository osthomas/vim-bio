if exists('b:current_syntax')
  finish
endif

runtime! syntax/bioheader-common.vim


" Match start-of-line, not end-of-line, to avoid scanning very long lines. Rely
" on the correct order of record components.
syntax region fastqSequence start='^.' end='^' nextgroup=fastqQuality
syntax region fastqComment  start='^+' end='^' nextgroup=fastqQuality
syntax region fastqQuality  start='^.' end='^' nextgroup=fastqHeader
" Items defined last have priority: define header last for first line match
syntax region fastqHeader   start='^@' end='^' nextgroup=fastqSequence contains=bioHeaderDelim
syntax cluster biosequence add=fastqSequence

syntax match fastqqual1  '[!-$]\+' containedin=fastqQuality contained
syntax match fastqqual2  '[%-(]\+' containedin=fastqQuality contained
syntax match fastqqual3  '[)-,]\+' containedin=fastqQuality contained
syntax match fastqqual4  '[--/]\+' containedin=fastqQuality contained
syntax match fastqqual5  '[0-4]\+' containedin=fastqQuality contained
syntax match fastqqual6  '[5-9]\+' containedin=fastqQuality contained
syntax match fastqqual7  '[:-<]\+' containedin=fastqQuality contained
syntax match fastqqual8  '[=-@]\+' containedin=fastqQuality contained
syntax match fastqqual9  '[A-E]\+' containedin=fastqQuality contained
syntax match fastqqual10 '[F-~]\+' containedin=fastqQuality contained

hi link fastqHeader Comment
hi link fastqComment Comment

highlight   fastqqual1  guibg=NONE  guifg=#4F504B
highlight   fastqqual2  guibg=NONE  guifg=#63635F
highlight   fastqqual3  guibg=NONE  guifg=#767773
highlight   fastqqual4  guibg=NONE  guifg=#8A8A87
highlight   fastqqual5  guibg=NONE  guifg=#9D9E9B
highlight   fastqqual6  guibg=NONE  guifg=#B1B1AF
highlight   fastqqual7  guibg=NONE  guifg=#C4C4C3
highlight   fastqqual8  guibg=NONE  guifg=#D8D8D7
highlight   fastqqual9  guibg=NONE  guifg=#EBEBEB
highlight   fastqqual10 guibg=NONE  guifg=#FFFFFF


let b:current_syntax = 'fastq'
