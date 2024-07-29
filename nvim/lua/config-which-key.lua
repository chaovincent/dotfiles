local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    replace = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    win = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    -- triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    -- triggers = {
    --     -- list of mode / prefixes that should never be hooked by WhichKey
    --     -- this is mostly relevant for key maps that start with a native binding
    --     -- most people should not need to change this
    --     i = { "j", "k" },
    --     v = { "j", "k" },
    -- },
}

local opts = {
    mode = "n", -- NORMAL mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", nowait = true, remap = false },
    { "<leader>f", group = "File Search", nowait = true, remap = false },
    { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
    { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files", nowait = true, remap = false },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
    { "<leader>ft", "<cmd>Telescope live_grep <cr>", desc = "Find Text Pattern In All Files", nowait = true, remap = false },
    { "<leader>g", group = "Git", nowait = true, remap = false },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", nowait = true, remap = false },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
    { "<leader>k", "<cmd>bdelete<CR>", desc = "Kill Buffer", nowait = true, remap = false },
    { "<leader>l", group = "LSP", nowait = true, remap = false },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = true, remap = false },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
    { "<leader>m", "<cmd>Mason<cr>", desc = "Mason UI for Lsp", nowait = true, remap = false },
    { "<leader>p", "<cmd>Lazy<CR>", desc = "Plugin Manager", nowait = true, remap = false },
    { "<leader>q", "<cmd>wqall!<CR>", desc = "Quit", nowait = true, remap = false },
    { "<leader>r", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Reformat Code", nowait = true, remap = false },
    { "<leader>s", group = "Search", nowait = true, remap = false },
    { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", nowait = true, remap = false },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
    { "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
}

--     k = { "<cmd>bdelete<CR>", "Kill Buffer" },  -- Close current file
--     p = { "<cmd>Lazy<CR>", "Plugin Manager" }, -- Invoking plugin manager
--     q = { "<cmd>wqall!<CR>", "Quit" }, -- Quit Neovim after saving the file
--     w = { "<cmd>w!<CR>", "Save" }, -- Save current file
--     e = { "<cmd>NvimTreeToggle<cr>", "Explorer" }, -- Toggle the file explorer
-- 
--     -- Telescope
--     f = {
--         name = "File Search",
--         c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
--         f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
--         t = { "<cmd>Telescope live_grep <cr>", "Find Text Pattern In All Files" },
--         r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--     },
--     s = {
--         name = "Search",
--         h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
--         m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--         r = { "<cmd>Telescope registers<cr>", "Registers" },
--         k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
--         c = { "<cmd>Telescope commands<cr>", "Commands" },
--     },
-- 
--     -- LSP
--     ["m"] = { "<cmd>Mason<cr>", "Mason UI for Lsp" },
--     ["r"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Reformat Code" },
-- 
--      l = {
--          name = "LSP",
--          a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--          i = { "<cmd>LspInfo<cr>", "Info" },
--          l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--          r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--          s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--          S = {
--              "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
--              "Workspace Symbols",
--          },
--     },
-- 
--     -- Git
--     g = {
--         name = "Git",
--         j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
--         k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
--         l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
--         p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
--         r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
--         R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
--         s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
--         u = {
--             "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
--             "Undo Stage Hunk",
--         },
--         o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--         b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--         c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--         d = {
--             "<cmd>Gitsigns diffthis HEAD<cr>",
--             "Diff",
--         },
--     },
-- }


which_key.setup(setup)
-- which_key.register(mappings, opts)
which_key.add(mappings, opts)
