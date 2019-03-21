" Vim syntax file
" Language:     Q#
" Maintainer:   Igor Gutorov <igootorov@gmail.com>
" Last Change:  Mar 21, 2019
" Credit: some parts of this file (such as identifiers regexes) are forked from https://github.com/rust-lang/rust.vim syntax file.

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Basic keywords
syn keyword   qsConditional if else
syn keyword   qsRepeat for until fixiup
syn keyword   qsTypedef newtype nextgroup=qsIdentifier skipwhite skipempty

syn keyword   qsKeyword     operation function nextgroup=qsFuncName skipwhite skipempty
syn keyword   qsKeyword     in let set mutable
syn keyword   qsKeyword     return adjoint auto controlled invert fail
syn keyword   qsKeyword     body using borrowing
syn keyword   qsKeyword     open nextgroup=qsModPath skipwhite skipempty
syn keyword   qsKeyword     namespace nextgroup=qsIdentifier skipwhite skipempty
syn keyword   qsFunctor     Controlled Adjoint nextgroup=qsIdentifier skipempty
syn match     qsDefault     /\<default\ze\_s\+\(function\|newtype\|operation\)\>/

syn match     qsIdentifier  contains=qsIdentifierPrime "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match     qsFuncName    "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

" Built-in types
syn keyword   qsType        Int BigInt Double Bool Qubit Pauli Result Range String Unit

" Other syntax
syn keyword   qsBoolean       true false
syn keyword   qsPauli         PauliI PauliX PauliY PauliZ
syn keyword   qsEigenvalues   One Zero

syn match     qsModPath     "\u\(\w\)*\.[^<]"he=e-2,me=e-2
syn match     qsModPathSep  "\."

syn match     qsFuncCall    "\w\(\w\)*("he=e-1,me=e-1

syn match     qsArrow         "=>"

syn region    qsString      start=+"+ end=+"+

" Number literals
syn match     qsDecNumber   display "\<[0-9][0-9_]*"
syn match     qsFloat       display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)"

syn region qsCommentLine    start="//" end="$"   contains=qsTodo,@Spell

syn keyword qsTodo contained TODO FIXME XXX NB NOTE

" Folding
syn region qsFoldBraces start="{" end="}" transparent fold

" Default highlighting
hi def link qsDecNumber       qsNumber
hi def link qsIdentifierPrime qsIdentifier

hi def link qsString        String
hi def link qsNumber        Number
hi def link qsBoolean       Boolean
hi def link qsPauli           Constant
hi def link qsEigenvalues     Constant
hi def link qsFloat         Float
hi def link qsKeyword       Keyword
hi def link qsTypedef       Keyword
hi def link qsRepeat        Conditional
hi def link qsConditional   Conditional
hi def link qsIdentifier    Identifier
hi def link qsFunctor       Identifier
hi def link qsModPath       Include
hi def link qsModPathSep    Delimiter
hi def link qsFuncName      Function
hi def link qsFuncCall      Function
hi def link qsCommentLine   Comment
hi def link qsType          Type
hi def link qsTodo          Todo
hi def link qsDefault       StorageClass
hi def link qsArrow           Operator

syn sync minlines=200
syn sync maxlines=500

let b:current_syntax = "qs"
