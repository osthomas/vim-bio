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
and set the colors accordingly. The syntax name is composed of two parts:

1. The actual file type (eg. fasta)
2. The color scheme

**Example:** `fasta.ntfg`
This means that the syntax is fora fasta file that is colorized with the `ntfg`
palette.

Each color scheme comes in to variants:

* ...fg (eg. *ntfg*): Foreground colors
* ...bg (eg. *zappobg*): Background colors

To change the color scheme, use `set syntax=...`:
`set syntax=fasta.zappobg` will colorize the fasta file with the Zappo
foreground palette.

`fa` and `fq` are valid shorthands for `fasta` and `fastq`, respectively:
`set syntax=fasta.ntbg` is equivalent to `set syntax=fa.ntbg`.

The default color schemes can be chosen for nucleotide and amino acid sequences
by setting a variable in your `vimrc`:

```
let g:bio_default_colors = { "aa": "zappobg", "nt": "ntbg" }
```


## Color Schemes

Color schemes were adopted from other projects:

* *basepair* from [WebLogo](https://weblogo.threeplusone.com/manual.html#intro)
* *buried* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *clustal* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *helix* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *hydrophobicity* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *nt* from [bioSyntax](https://github.com/bioSyntax/bioSyntax)
* *purine/pyrimidine* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *strand* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *taylor* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *turn* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
* *zappo* from [Jalview](https://www.jalview.org/help/html/colourSchemes/index.html)
