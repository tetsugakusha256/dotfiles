require("mason").setup()
require("mason-lspconfig").setup()

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- Diagnostic
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dw", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<leader>dh", vim.diagnostic.hide, opts)
vim.keymap.set("n", "<leader>ds", vim.diagnostic.show, opts)
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
  -- Codelens
  vim.keymap.set("n", "<leader>cc", vim.lsp.codelens.display, bufopts)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  -- List implementation implementation
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  -- Show info
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
  -- Seach for Incoming/Outgoint calls
  vim.keymap.set("n", "<leader>tc", vim.lsp.buf.incoming_calls, bufopts)
  vim.keymap.set("n", "<leader>to", vim.lsp.buf.outgoing_calls, bufopts)
  vim.keymap.set("n", "<leader>th", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>tr", vim.lsp.buf.references, bufopts)
  -- <leader>t action on word under cursor ('take' action)
  vim.keymap.set("n", "<leader>ta", vim.lsp.buf.code_action, bufopts)
  -- Go to definition
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<leader>td", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>ws", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  -- vim.keymap.set("n", "<leader>tt", vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set("n", "<leader>fr", lsp_formatting, bufopts)
end

local lsp_formatting = function()
  vim.lsp.buf.format({
    filter = function(client)
      -- Don't format with tsserver
      -- Instead, because I have prettier in null-ls, it will try to use that
      if client.name == "tsserver" then
        return false
      end
      return true
    end,
    timeout_ms = 2000
  })
end
vim.keymap.set("n", "<leader>fr", lsp_formatting, { noremap = true })

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
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    require("rust-tools").setup(opts)
  end,
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

local opts = {
  tools = { -- rust-tools options

    -- how to execute terminal commands
    -- options right now: termopen / quickfix / toggleterm / vimux
    executor = require("rust-tools.executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,

    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,

    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,

      -- Only show inlay hints for the current line
      only_current_line = false,

      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,

      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<- ",

      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=> ",

      -- whether to align to the length of the longest line in the file
      max_len_align = false,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,

      -- whether to align to the extreme right or not
      right_align = false,

      -- padding from the right if right_align is true
      right_align_padding = 7,

      -- The color of the hints
      highlight = "Comment",
    },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {

      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },

      -- Maximal width of the hover window. Nil means no max.
      max_width = nil,

      -- Maximal height of the hover window. Nil means no max.
      max_height = nil,

      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false,
    },

    -- settings for showing the crate graph based on graphviz and the dot
    -- command
    crate_graph = {
      -- Backend used for displaying the graph
      -- see: https://graphviz.org/docs/outputs/
      -- default: x11
      backend = "x11",
      -- where to store the output, nil for no output stored (relative
      -- path from pwd)
      -- default: nil
      output = nil,
      -- true for all crates.io and external crates, false only the local
      -- crates
      -- default: true
      full = true,

      -- List of backends found on: https://graphviz.org/docs/outputs/
      -- Is used for input validation and autocompletion
      -- Last updated: 2021-08-26
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    -- standalone file support
    -- setting it to false may improve startup time
    standalone = true,
  }, -- rust-analyzer options

  -- debugging stuff
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
}
