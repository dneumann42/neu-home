if exists("b:current_syntax")
  finish
endif

set iskeyword=a-z,A-Z,-,*,_,!,@

syntax keyword stardustTodos TODO XXX FIXME NOTE

syntax keyword stardustKeywords if def fun then else end do case cond of set while and or for when let var
syntax keyword stardustSpecial true false = ~= echo arg
syntax match stardustSpecialChar /[(){}\[\]]/
syntax keyword stardustOperator + / - * % ^ @ ! =
syntax keyword stardustType arg

syntax match stardustInt "\<\d\+\>"
syntax match stardustInt "\<0[xX][[:xdigit:].]\+\%([pP][-+]\=\d\+\)\=\>"
syntax match stardustFloat "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\=\>"
syntax match stardustFloat "\.\d\+\%([eE][-+]\=\d\+\)\=\>"
syntax match stardustFloat "\<\d\+[eE][-+]\=\d\+\>"

syntax region stardustString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region stardustComment start=/;/ end=/$/
syntax keyword stardustNil nil
syntax match stardustFnCall /\k\+\%(\s*(\)\@=/

highlight default link stardustTodos Todo
highlight default link stardustNil Number
highlight default link stardustKeywords Keyword
highlight default link stardustFnCall Function
highlight default link stardustFloat Number
highlight default link stardustInt Number
highlight default link stardustString String
highlight default link stardustComment Comment
highlight default link stardustOperator Operator
highlight default link stardustType Type
highlight default link stardustSpecial Special
highlight default link stardustSpecialChar Label

let b:current_syntax = "stardust"
