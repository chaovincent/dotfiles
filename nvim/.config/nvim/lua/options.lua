local opt = vim.opt

-- UI & Appearance
opt.termguicolors = true       -- True color support
opt.number = true              -- Print line number
opt.relativenumber = true      -- Relative line numbers
opt.signcolumn = "yes"         -- Always show the signcolumn to prevent text shifting
opt.cursorline = false         -- Enable highlighting of the current line
opt.cursorcolumn = false       -- Enable highlighting of the current column
opt.wrap = false               -- Disable line wrap
opt.showmode = false           -- Don't show mode since we have a statusline
opt.laststatus = 0             -- Global statusline setting
opt.conceallevel = 3           -- Hide * markup for bold and italic
opt.list = true                -- Show some invisible characters (tabs, trailing spaces)
opt.winminwidth = 5            -- Minimum window width
opt.pumblend = 10              -- Popup blend (transparency)
opt.pumheight = 10             -- Maximum number of entries in a popup

-- Indentation & Formatting
opt.expandtab = true           -- Use spaces instead of tabs
opt.shiftwidth = 4             -- Size of an indent
opt.tabstop = 4                -- Number of spaces tabs count for
opt.shiftround = true          -- Round indent
opt.smartindent = true         -- Insert indents automatically
opt.formatoptions = "jcroqlnt" -- tcqj formatting rules

-- Search & Replace
opt.ignorecase = true          -- Ignore case when searching
opt.smartcase = true           -- Don't ignore case with capitals
opt.incsearch = true           -- Incremental search
opt.inccommand = "nosplit"     -- Preview incremental substitute
opt.grepformat = "%f:%l:%c:%m" -- Format for grep
opt.grepprg = "rg --vimgrep"   -- Use ripgrep for grep

-- Splits & Scrolling
opt.splitbelow = true          -- Put new windows below current
opt.splitright = true          -- Put new windows right of current
opt.scrolloff = 5              -- Lines of context to keep above/below cursor
opt.sidescrolloff = 8          -- Columns of context to keep left/right of cursor

-- Behavior & System
opt.mouse = ""                 -- Disable mouse mode completely
opt.clipboard = "unnamedplus"  -- Sync with system clipboard
opt.undofile = true            -- Enable persistent undo
opt.undolevels = 10000         -- Maximum number of changes that can be undone
opt.autowrite = false          -- Enable auto write
opt.confirm = true             -- Confirm to save changes before exiting modified buffer
opt.updatetime = 200           -- Save swap file and trigger CursorHold faster
opt.timeoutlen = 150           -- Time in ms to wait for a mapped sequence to complete
opt.completeopt = "menu,menuone,noselect" -- Better completion behavior
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.spelllang = { "en" }       -- Spell check language
opt.shortmess:append({ W = true, I = true, c = true }) -- Shorten various Neovim messages

-- Globals
vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings
