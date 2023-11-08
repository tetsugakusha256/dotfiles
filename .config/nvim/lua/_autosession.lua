require("auto-session").setup {
  -- Close the symbols outline window if it's open so the session
  -- isn't saved with the window and buffer open which causes problem
  pre_save_cmds = { "SymbolsOutlineClose" },
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  _git_branch = false,

  auto_session_enable_last_session = false,

  -- ⚠️ This will only work if Telescope.nvim is installed
  -- The following are already the default values, no need to provide them if these are already the settings you want.
  session_lens = {
    -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to , session-lens.
    load_on_setup = true,
    theme_conf = { border = true },
    previewer = false,
  },
}
