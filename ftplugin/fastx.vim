" keep sequences centered
setlocal sidescrolloff=999

" FASTX does not have comments. The default string includes '>', which is a
" record delimiter, not a comment.
setlocal comments=

" Disable spell checking
if has("spell")
    setlocal nospell
endif
