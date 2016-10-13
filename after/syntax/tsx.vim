"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim syntax file
"
" Language: TSX (JavaScript)
" Maintainer: Ian Ker-Seymer <i.kerseymer@gmail.com>
" Depends: leafgarland/typescript-vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('b:current_syntax')
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif

syn include @XMLSyntax syntax/xml.vim

if exists('s:current_syntax')
  let b:current_syntax=s:current_syntax
endif

syn region xmlString
  \ start=+{+
  \ end=+}+
  \ contains=@Spell,@typescriptAll,xmlEntity,tsxRegion
  \ contained
  \ display


syn region tsxRegion
  \ contains=@Spell,@XMLSyntax,tsxRegion,@typescriptAll
  \ start=+\%(<\|\w\)\@<!<\z([a-zA-Z][a-zA-Z0-9:\-.]*\)+
  \ skip=+<!--\_.\{-}-->+
  \ end=+</\z1\_\s\{-}>+
  \ end=+/>+
  \ keepend
  \ extend

hi link xmlString NONE

syn cluster @typescriptAll add=tsxRegion
