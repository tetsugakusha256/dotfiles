    " Map space as leader nnoremap <SPACE> <Nop>
    let mapleader = "\<Space>"  

    " Load plugins
    " source ~/.config/nvim/plugin/coc.vim 
    " source ~/.config/nvim/plugins-config/denite.vim 
    " source ~/.config/nvim/plugin/surround.vim 
    " source ~/.config/nvim/plugin/neoscroll.lua
    " source ~/.config/nvim/plugin/lspsaga.lua
    " source ~/.config/nvim/plugin/lspsaga.vim
    "
    "
    source ~/.config/nvim/plugins.lua
    source ~/.config/nvim/plugins-config/bufferline.lua 
    source ~/.config/nvim/plugins-config/lualine.lua 
    source ~/.config/nvim/plugins-config/telescope.lua 
    source ~/.config/nvim/plugins-config/dashboard.lua
    source ~/.config/nvim/plugins-config/hop.lua
    "source ~/.config/nvim/plugin/indent-blankline.vim
    "source ~/.config/nvim/plugin/indent-blankline.lua


    "source ~/.config/nvim/plugin/commenter.vim
    "source ~/.config/nvim/plugin/easymotion.vim
    "source ~/.config/nvim/plugin/nvim-cmp.vim
    "source ~/.config/nvim/plugin/nvim-cmp.lua
    "source ~/.config/nvim/plugin/nvimtree.vim 
    "source ~/.config/nvim/plugin/nvimtree.lua 
    "source ~/.config/nvim/plugin/lsp-installer.lua
    "source ~/.config/nvim/plugin/lspconfig.lua
    "source ~/.config/nvim/plugin/cmp-vsnip.vim

    " COLOR SCHEME
    colorscheme tokyonight

    "}}}

" MAPPING {{{

    " Move the cursor based on physical lines
    nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
    nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

    " Jump to matching pairs easily in normal mode
    " Problem <c-i> seems to act as if it was tab
    nnoremap <c-u> %
    vnoremap <c-u> %

    " Move up and down half a page 
    let g:smoothie_no_default_mappings = v:true
    silent! map <unique> <C-j>      <Plug>(SmoothieDownwards)
    silent! map <unique> <C-k>      <Plug>(SmoothieUpwards)


    " Change text without putting it into the vim register,
    " see https://stackoverflow.com/q/54255/6064933
    nnoremap c "_c
    nnoremap C "_C
    nnoremap cc "_cc
    xnoremap c "_c

    " Split navigation remap Altgr+h,j,k,l
    nnoremap ĸ <C-W><C-K>
    nnoremap ̉  <C-W><C-J>
    nnoremap ł <C-W><C-L>
    nnoremap ħ <C-W><C-H>

    " Search
    nnoremap é /

    " Mark m + [a,z] mark a place with a letter
    " Go to mark ' + [a,z]

    " resizing split
    " <c-w>+_ Max out height of current split
    " <c-w>+| Max out width of current split
    " <c-w>+= All split equal size

    " Move current line up and down
    "nnoremap <silent> <A-k> <Cmd>call utils#SwitchLine(line('.'), 'up')<CR>
    "nnoremap <silent> <A-j> <Cmd>call utils#SwitchLine(line('.'), 'down')<CR>
     
    " bufferline switch buffer
    nnoremap <silent><c-l> :BufferLineCycleNext<CR>
    nnoremap <silent><c-h> :BufferLineCyclePrev<CR> 
    nnoremap <silent><c-c> :bd<CR>
    
    " These commands will move the current buffer backwards or forwards in the bufferline
    "unmap H
    "unmap L
    "nnoremap L :BufferLineMoveNext<CR>
    "nnoremap H :BufferLineMovePrev<CR>
 
    " These commands will sort buffers by directory, language, or a custom criteria
    "nnoremap <silent>be :BufferLineSortByExtension<CR>
    "nnoremap <silent>bd :BufferLineSortByDirectory<CR>

    " Move line up or down
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

    nnoremap <C-q> :wq<cr>
    inoremap <C-q> <Esc>:wq<cr>
    nnoremap <A-q> :update<cr>
    inoremap <A-q> <Esc>:update<cr>gi
    " maps ctrl back to delete last word not working :/
    inoremap <C-BS> <C-W>

    " save on exiting insert mpdate
    " inoremap <Esc> <Esc>:update<CR>
    " autosave if changes every 4sec
    " :au CursorHold <buffer> :update

"}}}
    
" OPTION {{{
    " show line number
    set number
    " Yank and paste with the system clipboard
    " set clipboard=unnamed

    set mouse=a
    " === TAB/Space settings === "
    " Insert spaces when TAB is pressed instead of tabs.
    set expandtab
    " Don't highlight current cursor line
    set nocursorline

    " Change number of spaces that a <Tab> counts for during editing ops
    set softtabstop=2       
    set encoding=utf-8
    set fileencodings=utf-8
    " Indentation amount for < and > commands.
    set shiftwidth=2

    " Don't wrap line
    " set nowrap


    " set the commands to save in history default number is 20.
    set history=1000 

    " Set more natural default split
    set splitbelow
    set splitright
        
    " Remove one line at the bottom
    set cmdheight=1
    " Show mode
    set noshowmode  " to get rid of thing like --INSERT--
    set noshowcmd  " to get rid of display of last command
    set noru    " short for 'ruler'
    set shortmess+=F  " to get rid of the file name displayed in the command line bar

    " makes it that it doesn't start comment on it's own when o from a comment
    " Doesn't work not sure why because it works when direclty typed as a
    " command, maybe it's overridden later in the init process?
    " to see last time it was set use :verb set fo
    " it was set in some config per extension file 
    set formatoptions-=cro

    " line

    "    }}}
    
" Vimscript {{{
    " This will enable code folding.
    " Use the marker method of folding.
    
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END
    " Read-only odt/odp through odt2txt
    autocmd BufReadPre *.odt,*.odp silent set ro
    autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"
"}}}
"
"
