let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:EasyMotion_keys = 'qwertzuiopyxcvbnmasldkghfj'
" press space to go to first mapping
let g:EasyMotion_space_jump_first = 1
" add place before jump to jumping history
let g:EasyMotion_add_search_history = 1
" not printing text in the command zone
let g:EasyMotion_verbose = 0
" disable linter while jumping character are showing
"autocmd User EasyMotionPromptBegin silent! CocDisable
"autocmd User EasyMotionPromptEnd   silent! CocEnable
