require("mason").setup()
require("mason-lspconfig").setup()

-- Diagnostic
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>dd", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>dw", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<space>dh", vim.diagnostic.hide, opts)
vim.keymap.set("n", "<space>ds", vim.diagnostic.show, opts)
-- TODO: use c-[ instead but when doing so esc act as goto_prev (maybe problem with keybind in alacritty)
vim.keymap.set("n", "<a-[>", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<a-]>", vim.diagnostic.goto_next, opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Formatting
  local lsp_formatting = function()
    vim.lsp.buf.format({
      filter = function(client)
        -- Don't format with tsserver
        if client.name == "tsserver" then
          return false
        end
        return true
      end,
      bufnr = bufnr,
      async = true
    })
  end
  -- If client can format create autocmd to format on save
  if client.supports_method("textDocument/formatting") then
    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   group = vim.api.nvim_create_augroup("LspFormatting", {}),
    --   buffer = bufnr,
    --   callback = function()
    --     lsp_formatting()
    --   end,
    -- })
  end
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  -- Go to declaration
  vim.keymap.set("n", "<leader>tD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  -- Go to definition
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<leader>td", vim.lsp.buf.definition, bufopts)
  -- List implementation implementation
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set("n", "<leader>ti", vim.lsp.buf.implementation, bufopts)
  -- Show info
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>th", vim.lsp.buf.hover, bufopts)
  -- Seach for Incoming/Outgoint calls
  vim.keymap.set("n", "<space>ti", vim.lsp.buf.incoming_calls, bufopts)
  vim.keymap.set("n", "<space>to", vim.lsp.buf.outgoing_calls, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>tr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>ws", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>tt", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>fr", lsp_formatting, bufopts)
end

-- WARN: IF THE SERVER SEEM TO BE INSTALLED BUT DOESNT START CHECK NODE VERSION or server platform version
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({
      -- Add lsp based completion to cmp_nvim for that server
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --     require("rust-tools").setup {}
  -- end
  ["lua_ls"] = function()
    require("lspconfig")["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      -- ... other configs
      settings = {
        Lua = {
          diagnostics = {
            -- Add vim to the global variables to avoid "vim not declared type of warning"
            globals = { "vim" },
          },
        },
      },
    })
  end,
})
