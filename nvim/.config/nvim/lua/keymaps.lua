local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap "," as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-------------------------------------------------------------------------------
-- Modes
-------------------------------------------------------------------------------
-- c = command_mode
-- i = insert_mode
-- n = normal_mode
-- t = term_mode
-- v = visual_mode
-- x = visual_block_mode
-------------------------------------------------------------------------------

-- Normal Mode
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)  -- Left window
keymap("n", "<C-k>", "<C-w>k", opts)  -- Up window
keymap("n", "<C-j>", "<C-w>j", opts)  -- Down window
keymap("n", "<C-l>", "<C-w>l", opts)  -- Right window

-- Navigate Buffers
keymap("n", "<tab>", ":bnext<cr>", opts)  -- Next tab
keymap("n", "<s-tab>", ":bprevious<cr>", opts)  -- Previous tab
