require("auto-session").setup {
  {
    log_level = "error",
    session_lens = {
      load_on_setup = true,
      previewer = false,
      theme_conf = {
        border = true
      }
    },
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    use_git_branch = false,
    auto_restore = false,
  }
}
