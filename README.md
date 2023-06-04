# vim-bio

Syntax highlighting for biological sequences/file formats in vim.

vim-bio was heavily inspired by
[bioSyntax](https://github.com/bioSyntax/bioSyntax-vim/).

Contrary to bioSyntax, vim-bio does not change the editor's colorscheme, but
only adds sequence coloring to relevant file types without affecting other
file types. However, supported sequence file types are currently limited to:

* FASTA
* FASTQ
* clustal

vim-bio attempts to detect if a file contains nucleotide or amino acid
sequences and colorizes accordingly, but mixtures of sequence types in one file
are unsupported.


## Installation

Install using your favourite plugin manager.


```
" with vim-plug
call plug#begin()

Plug 'osthomas/vim-bio"

call plug#end()
```

**Note**: Colors are only defined for GUI colors (ie. `:set termguicolors`
needs to be set), cterm colors are not available.


## Configuration and Usage

`:set termguicolors` must be set.

Opening a supported file will trigger autodetection of sequence type content
and set the colors accordingly. The file type is composed of two parts:

1. The actual file type (eg. fasta)
2. The color scheme

**Example:** `fasta.nucleotidefg`
This means that the file is a fasta file that is colorized with the
`nucleotidfg` palette.

Each color scheme comes in to variants:

* ...fg (eg. *nucleotidefg*): Foreground colors
* ...bg (eg. *zappobg*): Background colors

To change the color scheme, use `set filetype=...`:
`set filetype=fasta.zappobg` will colorize the fasta file with the Zappo
foreground palette.

The default color schemes can be chosen for nucleotide and amino acid sequences
by setting a variable in your `vimrc`:

```
let g:bio_default_colors = { "aa": "zappobg", "nt": "nucleotidebg" }
```


## Color Schemes

Color schemes were adopted from other projects:

* *basepair* from [WebLogo](https://weblogo.threeplusone.com/manual.html#intro)
* *buried* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *clustal* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *helix* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *hydrophobicity* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *purine/pyrimidine* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *strand* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *taylor* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *turn* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *zappo* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
