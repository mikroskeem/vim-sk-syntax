" Language: Skript
" Maintainer: mikroskeem
" License: MIT

if exists("b:current_syntax") && b:current_syntax == 'skript'
  finish
endif

" Identifiers/special variables
syn match skriptIdentifiers "%[a-z].*%"

" Numbers
syn match skriptNumber "\v<\d+>"

" Strings
syn match skriptMcColors "§[a-z0-9]"
syn region skriptString start=/"/ end=/"/ contains=skriptMcColors,skriptIdentifiers

" Comments
syn keyword skriptTodo contained TODO NOTE BUG FIXME
syn match skriptComment "#.*$" contains=skriptTodo

" Basic keywords
syn keyword skriptKeywords if else is to has from
syn keyword skriptKeywords set named
syn keyword skriptKeywords trigger usage description

" Special keywords
syn keyword skriptSpecialKeywords player spawn permission
syn match skriptSpecialKeywords "all players"

" Booleans
syn keyword skriptBoolean true false

" Functions
syn keyword skriptFunctions message teleport give hide

" Events
syn match skriptEventBase "^on " nextgroup=skriptEvent
syn match skriptEvent "[a-z].*" contained nextgroup=skriptEventEnd
syn match skriptEventEnd ":" contained

" Commands
syn match skriptCommandBase "^command " nextgroup=skriptCommandName
syn match skriptCommandName "\/[a-z].* " contained nextgroup=skriptCommandArguments
syn match skriptCommandArguments "<[a-z].*>" contained nextgroup=skriptCommandEnd
syn match skriptCommandEnd ":" contained

hi def link skriptEventBase Statement
hi def link skriptEvent Function
hi def link skriptEventEnd Normal

hi def link skriptCommandBase Statement
hi def link skriptCommandName Function
hi def link skriptCommandArguments Boolean
hi def link skriptCommandEnd Normal


hi def link skriptMcColors Define
hi def link skriptIdentifiers Identifier
hi def link skriptNumber Number
hi def link skriptString String
hi def link skriptComment Comment
hi def link skriptKeywords Statement
hi def link skriptSpecialKeywords Constant
hi def link skriptBoolean Boolean
hi def link skriptFunctions Function
hi def link skriptTodo Todo

if !exists('b:current_syntax')
  let b:current_syntax = 'skript'
endif
