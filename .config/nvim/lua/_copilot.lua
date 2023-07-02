require('copilot').setup({
  panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<c-k>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    javascript = true,
    typescript = true,
    typescriptreact = true,
    javascriptreact = true,
    css = true,
    scss = true,
    html = true,
    java = true,
    lua = true,
    ["*"] = false,               -- disable for all other filetypes and ignore default `filetypes`
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
-- copilot_cmp integration
-- require("copilot_cmp").setup(
--   {
--     event = { "InsertEnter", "LspAttach" },
--     fix_pairs = true,
--   }
-- )
