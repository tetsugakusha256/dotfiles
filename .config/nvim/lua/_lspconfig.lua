require("mason").setup()
require("mason-lspconfig").setup()

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
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
    })
  end
  -- If client can format create autocmd to format on save
  if client.supports_method("textDocument/formatting") then
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormatting", {}),
      buffer = bufnr,
      callback = function()
        lsp_formatting()
      end,
    })
  end
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- vim.keymap.set("n", "<leader>tt", vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set("n", "<leader>fr", lsp_formatting, bufopts)
end


-- WARN: IF THE SERVER SEEM TO BE INSTALLED BUT DOESNT START CHECK NODE VERSION or server platform version
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- ufo fold support
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
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
  ["rust_analyzer"] = function()
    local rt = require("rust-tools")
    -- Update this path
    local extension_path = '/home/anon/.vscode-oss/extensions/vadimcn.vscode-lldb-1.9.2-universal/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

    local toggle_mem = 1
    local toggle_inlay_hints = function()
      if toggle_mem % 2 == 1 then
        rt.inlay_hints.unset()
      else
        rt.inlay_hints.set()
      end
      toggle_mem = toggle_mem + 1
    end

    rt.setup({
      tools = {
        hover_actions = {
          border = {
            { "",  "FloatBorder" },
            { "",  "FloatBorder" },
            { "",  "FloatBorder" },
            { " ", "FloatBorder" },
            { "",  "FloatBorder" },
            { "",  "FloatBorder" },
            { "",  "FloatBorder" },
            { " ", "FloatBorder" },
          },
          auto_focus = true,
        },
      },
      dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
          codelldb_path, liblldb_path)
      },
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<Leader>rh", rt.hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set("n", "<Leader>rl", toggle_inlay_hints, { buffer = bufnr })
          vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr })
          vim.keymap.set("n", "<Leader>rr", rt.runnables.runnables, { buffer = bufnr })
          vim.keymap.set("n", "<Leader>rc", rt.open_cargo_toml.open_cargo_toml, { buffer = bufnr })
          vim.keymap.set("n", "<Leader>ru", function() rt.move_item.move_item(true) end, { buffer = bufnr })
          vim.keymap.set("n", "<Leader>rd", function() rt.move_item.move_item(false) end, { buffer = bufnr })
          -- vim.keymap.set("v", "<Leader>rh", rt.hover_range.hover_range, { buffer = bufnr })
        end,
      },
    })
  end,
  ["lua_ls"] = function()
    require("lspconfig")["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      -- ... other configs
      settings = {
        Lua = {
          runtime = {
          },
          workspace = {
            library = {
              -- vim.fn.expand("$HOME/.local/share/nvim/lazy"),
              -- vim.fn.expand '~/.luarocks/share/lua/5.3',
              -- '/usr/share/lua/5.3'
            }
          },
          diagnostics = {
            -- Add vim to the global variables to avoid "vim not declared type of warning"
            globals = { "vim" },

          },
        },
      },
    })
  end,
})
