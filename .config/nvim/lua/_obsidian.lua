local opts = {
  -- Required, the path to your vault directory.
  dir = "~/Documents/myWiki/obs_vault/",
  -- Optional, if you keep notes in a specific subdirectory of your vault.
  -- notes_subdir = "notes",

  -- Optional, set the log level for Obsidian. This is an integer corresponding to one of the log
  -- levels defined by "vim.log.levels.*" or nil, which is equivalent to DEBUG (1).
  log_level = vim.log.levels.DEBUG,

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "diary",
    -- Optional, if you want to change the date format for daily notes.
    date_format = "%Y-%m-%d"
  },

  -- Optional, completion.
  completion = {
    -- If using nvim-cmp, otherwise set to false
    nvim_cmp = true,
    -- Trigger completion at 2 chars
    min_chars = 2,
    -- Where to put new notes created from completion. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = "current_dir",
    -- Whether to add the output of the node_id_func to new notes in autocompletion.
    -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
    prepend_note_id = true
  },

  -- -- Optional, set to true if you don't want Obsidian to manage frontmatter.
  -- disable_frontmatter = false,
  --
  -- -- Optional, alternatively you can customize the frontmatter data.
  -- note_frontmatter_func = function(note)
  --   -- This is equivalent to the default frontmatter function.
  --   local out = { id = note.id, aliases = note.aliases, tags = note.tags }
  --   -- `note.metadata` contains any manually added fields in the frontmatter.
  --   -- So here we just make sure those fields are kept in the frontmatter.
  --   if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
  --     for k, v in pairs(note.metadata) do
  --       out[k] = v
  --     end
  --   end
  --   return out
  -- end,
  --
  --
  -- -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- -- URL it will be ignored but you can customize this behavior here.
  -- follow_url_func = function(url)
  --   -- Open the URL in the default web browser.
  --   -- vim.fn.jobstart({ "open", url }) -- Mac OS
  --   vim.fn.jobstart({ "xdg-open", url }) -- linux
  -- end,
  --
  -- -- Optional, set to true if you use the Obsidian Advanced URI plugin.
  -- -- https://github.com/Vinzent03/obsidian-advanced-uri
  -- use_advanced_uri = false,
  --
  -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
  open_app_foreground = false,

  -- Optional, by default commands like `:ObsidianSearch` will attempt to use
  -- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
  -- first one they find. By setting this option to your preferred
  -- finder you can attempt it first. Note that if the specified finder
  -- is not installed, or if it the command does not support it, the
  -- remaining finders will be attempted in the original order.
  finder = "telescope.nvim",
}
require("obsidian").setup(opts)

-- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
-- see also: 'follow_url_func' config option below.
vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })
vim.keymap.set("n", "<leader>ww", function()
  return "<cmd>ObsidianQuickSwitch<CR>"
end, { noremap = false, expr = true })
