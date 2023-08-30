---------------------------------------------
--- Debug DAP setup
---------------------------------------------
local dap = require('dap')
local extension_path = '/home/anon/.vscode-oss/extensions/vadimcn.vscode-lldb-1.9.2-universal/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
-- Manual conf
-- dap.adapters.codelldb = {
--   type = 'server',
--   port = "${port}",
--   executable = {
--     command = '/home/anon/.vscode-oss/extensions/vadimcn.vscode-lldb-1.9.2-universal/adapter/codelldb',
--     args = { "--port", "${port}" },
--   }
-- }
-- Using rust-tools adapters
-- Info at :h dap.txt
dap.adapters.codelldb = require('rust-tools.dap').get_codelldb_adapter(
  codelldb_path, liblldb_path)
dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.cpp = dap.configurations.rust
dap.configurations.c = dap.configurations.cpp

---------------------------------------------
--- Debug DAP UI Setup
---------------------------------------------

local dui = require("dapui")
dui.setup(
  {
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = { {
      elements = { {
        id = "scopes",
        size = 0.25
      }, {
        id = "breakpoints",
        size = 0.25
      }, {
        id = "stacks",
        size = 0.25
      }, {
        id = "watches",
        size = 0.25
      } },
      position = "left",
      size = 40
    }, {
      elements = { {
        id = "repl",
        size = 0.5
      }, {
        id = "console",
        size = 0.5
      } },
      position = "bottom",
      size = 10
    } },
    mappings = {
      edit = "c",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
  }
)
-- Automaticaly open and close dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dui.close()
end
