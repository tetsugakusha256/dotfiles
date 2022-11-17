  local home = os.getenv('HOME')
  local db = require('dashboard')
  -- macos
  -- db.preview_command = 'cat | lolcat -F 0.3'

  db.custom_header = {
    '',
    '',
    ':::.    :::..,::::::     ...    :::      .::.:: :.        :       ',
    "`;;;;,  `;;;;;;;''''  .;;;;;;;. ';;,   ,;;;' ;; ;;;,.    ;;;      ",
    "  [[[[[. '[[ [[cccc  ,[[      [[,[[   .[[/   [[ [[[[[, ,[[[[,     ",
    '  $$$ "Y$c$$ $$""""  $$$,     $$$ Y$c.$$"    $$ $$$$$$$$$"$$$     ',
    '  888    Y88 888oo,__"888,_ _,88P  Y88P      88 8888 Y88" 888o    ',
    '  MMM     YM """"YUMMM "YMMMMMP"    MP       MM MMMM  M"  "MMM    ',
    '',
    '',
    }
  --
  --]]
  
  --
  -- linux
  -- db.preview_command = 'ueberzug'
  --
  db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  db.preview_file_height = 11
  db.preview_file_width = 70
  db.custom_center = {
    {icon = '  ',
      desc = 'Open Personal dotfiles                  ',
      action = 'Telescope find_dotfiles',
    shortcut = 'SPC f d'},
--      {icon = '  ',
--      desc = 'Recently latest session                  ',
--      shortcut = 'SPC s l',
--      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'Telescope oldfiles',
      shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC c f'},
--      {icon = '  ',
--      desc ='File Browser                            ',
--      action =  'Telescope file_browser',
--      shortcut = 'SPC f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f w'},
      {icon = '  ',
      desc = 'Change colorscheme                    ',
      action = 'Telescope colorscheme',
      shortcut = 'SPC f c s'},
    }
