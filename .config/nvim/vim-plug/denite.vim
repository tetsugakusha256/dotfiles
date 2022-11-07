" === Denite shorcuts === "
  "   ;         - Browser currently open buffers
  "   <leader>t - Browse list of files in current directory
  "   <leader>g - Search current directory for occurences of given term and
  "   close window if no results
  "   <leader>j - Search current directory for occurences of word under cursor
  nmap ; :Denite buffer -split=floating -winrow=1<CR>
  nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
  nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
  nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

  " Wrap in try/catch to avoid errors on initial install before plugin is available
  try
  " === Denite setup ==="

  " Remove date from buffer list
  call denite#custom#var('buffer', 'date_format', '')

  " Custom options for Denite
  "   split                       - Use floating window for Denite
  "   start_filter                - Start filtering on default
  "   auto_resize                 - Auto resize the Denite window height automatically.
  "   source_names                - Use short long names if multiple sources
  "   prompt                      - Customize denite prompt
  "   highlight_matched_char      - Matched characters highlight
  "   highlight_matched_range     - matched range highlight
  "   highlight_window_background - Change background group in floating window
  "   highlight_filter_background - Change background group in floating filter window
  "   winrow                      - Set Denite filter window to top
  "   vertical_preview            - Open the preview window vertically

  let s:denite_options = {'default' : {
  \ 'split': 'floating',
  \ 'start_filter': 1,
  \ 'auto_resize': 1,
  \ 'source_names': 'short',
  \ 'prompt': 'λ ',
  \ 'highlight_matched_char': 'QuickFixLine',
  \ 'highlight_matched_range': 'Visual',
  \ 'highlight_window_background': 'Visual',
  \ 'highlight_filter_background': 'DiffAdd',
  \ 'winrow': 1,
  \ 'vertical_preview': 1
  \ }}

  " Loop through denite options and enable them
  function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
  endfunction

  call s:profile(s:denite_options)
  catch
  echo 'Denite not installed. It should work after running :PlugInstall'
  endtry



