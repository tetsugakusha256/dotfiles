nnoremap <silent>géé <cmd>lua require('lspsaga.rename').rename()<CR>
" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" code action
" nnoremap <silent><leader>q <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" vnoremap <silent><leader>q :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" -- show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" -- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" -- scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" -- show signature help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" -- preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" -- show
nnoremap <silent><leader>éé <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
" -- only show diagnostic if cursor is over the area
nnoremap <silent><leader>fc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
" -- jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" -- or use command
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
