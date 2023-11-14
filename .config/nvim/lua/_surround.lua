require("nvim-surround").setup({
  -- Configuration here, or leave empty to use defaults
  keymaps = {
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "yss",
    normal_cur = "yS",
    normal_line = "ySS",
    normal_cur_line = "ySSS",
    visual = "S",
    visual_line = "gS",
    delete = "dss",
    change = "css",
    change_line = "cSS",
  },
})
