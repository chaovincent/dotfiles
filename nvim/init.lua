-- Keymaps
require "keymaps"

-- Package Manager
require "config-lazy"

-- Package Configs
require "config-autopairs"
require "config-alpha"
require "config-bufferline"
require "config-gitsigns"
require "config-hop"
-- require "config-lsp"
require "config-lualine"
require "config-nvim-tree"
require "config-telescope"
require "config-tree-sitter"
require "config-which-key"

-- Misc
require "mason".setup{}  -- Put this here to resolve "Not an editor command" error
require "nvim-tree".setup{}  -- Put this here to resolve "Not an editor command" error

-- Options
require "options"
