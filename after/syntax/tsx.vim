"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim syntax file
"
" Language: TSX (JavaScript)
" Maintainer: Ian Ker-Seymer <i.kerseymer@gmail.com>
" Depends: pangloss/vim-typescript
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Prologue; load in XML syntax.
if exists('b:current_syntax')
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif
syn include @XMLSyntax syntax/xml.vim
if exists('s:current_syntax')
  let b:current_syntax=s:current_syntax
endif

syn region tsxRegion contains=@XMLSyntax,tsxRegion,typescriptBlock
  \ start=+\%(<\|\w\)\@<!<\z([a-zA-Z][a-zA-Z0-9:\-.]*\)+
  \ skip=+<!--\_.\{-}-->+
  \ end=+</\z1\_\s\{-}>+
  \ end=+/>+
  \ keepend
  \ extend

" TSX attributes should color as TS.  Note the trivial end pattern; we let
" typescriptBlokc take care of ending the region.
syn region xmlString contained start=+{+ end=++ contains=typescriptBlock

" Add tsxRegion to the lowest-level TS syntax cluster.
syn cluster typescriptExpression add=tsxRegion
