local null_ls = require("null-ls")
-- mason-null-ls priority on null-ls
require("mason-null-ls").setup({
  ensure_installed = {
    -- Opt to list sources here, when available in mason.
    "prettierd",
  },
  automatic_installation = false,
  handlers = {},
})
null_ls.setup({
  sources = {
    -- Anything not supported by mason.
    -- null_ls.builtins.formatting.prettierd
  },
})
