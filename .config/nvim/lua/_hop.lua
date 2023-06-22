-- place this in one of your configuration file(s)
require('hop').setup{ keys = 'tnseriaoplfuwyx.c,vmgjdhbk' }
local hop = require('hop')
local directions = require('hop.hint').HintDirection
-- vim.keymap.set('', 'f', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, {remap=true})
-- vim.keymap.set('', 'F', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, {remap=true})
-- vim.keymap.set('', 't', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, {remap=true})
-- vim.keymap.set('', 'T', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, {remap=true})
-- remap s as a move anywhere key
vim.keymap.set('', 's', function()
  hop.hint_char1({})
end, {remap=true})
-- remap é as a move anywhere key but only in operator pending mode
vim.keymap.set('o', '/', function()
  hop.hint_char1({})
end, {remap=true})
