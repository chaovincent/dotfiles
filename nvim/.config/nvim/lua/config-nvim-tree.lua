local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- 1. Create the modern on_attach function for your keybindings
local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- 1. Create a custom action that opens the file, then instantly returns focus
  local function open_and_stay()
    api.node.open.edit()
    api.tree.focus() -- This yanks your cursor right back to the sidebar!
  end

  -- Load default mappings first
  api.config.mappings.default_on_attach(bufnr)

  -- 2. Map 'l' to our new custom function
  vim.keymap.set('n', 'l',    open_and_stay,                  opts('Open (Keep Focus)'))
  
  -- Keep the others as they were
  vim.keymap.set('n', '<CR>', api.node.open.edit,             opts('Open (Move Focus)'))
  vim.keymap.set('n', 'o',    api.node.open.edit,             opts('Open (Move Focus)'))
  vim.keymap.set('n', 'h',    api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v',    api.node.open.vertical,         opts('Open: Vertical Split'))
end

-- 2. Setup nvim-tree
nvim_tree.setup {
  on_attach = my_on_attach, -- Attach your custom keys here
  filesystem_watchers = {
      enable = disable,  -- Disable to avoid freezing on NFS mounts
  },
  git = {
      enable = true,  -- Prevent git from scraping large folders recursively
      timeout = 400,
  },
  update_focused_file = {
    enable = true,
    update_root = true, -- Updated from the deprecated update_cwd
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
    -- The broken mappings block is completely removed from here
  },
  filters = {
    custom = {
      "^\\.git$",
      "^node_modules$",
      "^\\.?venv$",
      "^\\.?cache$",
    },
  },
}
