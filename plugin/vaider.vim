" vaider - Aider integration for Vim
" Maintainer: Come Bertrand <come.bertrand@protonmail.com>
" Version: 0.1
" License: MIT

if exists('g:loaded_aider')
  finish
endif
let g:loaded_aider = 1

" Global variable to store the terminal buffer number for aider
let g:aider_term_buf = -1

" Configuration variables with defaults
if !exists('g:aider_autocommit')
  let g:aider_autocommit = 0
endif

if !exists('g:aider_command')
  let g:aider_command = 'aider'
endif

if !exists('g:aider_args')
  let g:aider_args = ''
endif

" Function to start aider in a new terminal
function! s:StartAider()
  " Build the aider command
  let cmd = g:aider_command

  " Add auto-commit flag if needed
  if g:aider_autocommit == 0
    let cmd .= ' --no-auto-commits'
  endif

  " Add any additional arguments
  if g:aider_args != ''
    let cmd .= ' ' . g:aider_args
  endif

  " Start a new vertical terminal with aider
  execute 'vertical terminal ' . cmd

  " Store the buffer number for later use
  let g:aider_term_buf = bufnr('%')

  " Return to normal mode
  normal! i

  echo "Aider started in buffer " . g:aider_term_buf
endfunction

" Function to add current file to aider context
function! s:AddFileToAider()
  " Check if aider is running
  if g:aider_term_buf == -1 || !bufexists(g:aider_term_buf)
    echo "Aider is not running. Start it first with :AiderStart"
    return
  endif

  " Get current file path
  let filepath = expand('%:p')

  " Send command to aider terminal to add file
  call term_sendkeys(g:aider_term_buf, "/add " . filepath . "\<CR>")

  echo "Added " . filepath . " to Aider conversation"
endfunction

" Function to reset aider conversation
function! s:ResetAiderConversation()
  " Check if aider is running
  if g:aider_term_buf == -1 || !bufexists(g:aider_term_buf)
    echo "Aider is not running. Start it first with :AiderStart"
    return
  endif

  " Send reset command to aider
  call term_sendkeys(g:aider_term_buf, "/new\<CR>")

  echo "Reset Aider conversation"
endfunction

" Define commands
command! AiderStart call s:StartAider()
command! AiderAddFile call s:AddFileToAider()
command! AiderReset call s:ResetAiderConversation()
