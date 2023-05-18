" Nucleotide scheme

syntax match nucleotideA "[Aa]" containedin=@biosequence contained
syntax match nucleotideG "[Gg]" containedin=@biosequence contained
syntax match nucleotideC "[Cc]" containedin=@biosequence contained
syntax match nucleotideT "[Tt]" containedin=@biosequence contained
syntax match nucleotideU "[Uu]" containedin=@biosequence contained
syntax match nucleotideR "[Rr]" containedin=@biosequence contained
syntax match nucleotideY "[Yy]" containedin=@biosequence contained
syntax match nucleotideS "[Ss]" containedin=@biosequence contained
syntax match nucleotideW "[Ww]" containedin=@biosequence contained
syntax match nucleotideM "[Mm]" containedin=@biosequence contained
syntax match nucleotideK "[Kk]" containedin=@biosequence contained
syntax match nucleotideD "[Dd]" containedin=@biosequence contained
syntax match nucleotideB "[Bb]" containedin=@biosequence contained
syntax match nucleotideV "[Vv]" containedin=@biosequence contained
syntax match nucleotideH "[Hh]" containedin=@biosequence contained
syntax match nucleotideN "[Nn]" containedin=@biosequence contained
syntax match nucleotideGap '[-.]' containedin=@biosequence contained


hi nucleotideA guibg=#47FF19 guifg=#000000
hi nucleotideT guibg=#4192FF guifg=#000000
hi nucleotideG guibg=#FFAF00 guifg=#000000
hi nucleotideC guibg=#FF4641 guifg=#000000
hi nucleotideU guibg=#8A89FF guifg=#000000
hi nucleotideR guibg=#FFFE80 guifg=#000000
hi nucleotideY guibg=#E180FF guifg=#000000
hi nucleotideS guibg=#FF9B80 guifg=#000000
hi nucleotideW guibg=#80FFF2 guifg=#000000
hi nucleotideM guibg=#CE8834 guifg=#000000
hi nucleotideK guibg=#90B82C guifg=#000000
hi nucleotideD guibg=#C7FFB9 guifg=#000000
hi nucleotideB guibg=#F8C1C0 guifg=#000000
hi nucleotideV guibg=#FFE3B9 guifg=#000000
hi nucleotideH guibg=#BFD8F9 guifg=#000000
hi nucleotideN guibg=#FFFFFF guifg=#000000
hi clear nucleotideGap
