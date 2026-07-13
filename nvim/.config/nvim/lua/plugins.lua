return {
    -- Alpha
    -- Startup dashboard with quick links and recent files.
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require("config-alpha")
        end,
    },

    -- Autopairs
    -- Automatically generates closing brackets and quotes.
    -- {
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     config = function() require("config-autopairs") end
    -- },

    -- Bufferline
    -- Browser-like tabs for open files along the top.
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("config-bufferline")
        end,
    },

    -- Gitsigns
    -- Shows git add/change/delete indicators in the left margin.
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("config-gitsigns")
        end,
    },

    -- Hop
    -- Teleport cursor instantly to any word by typing a letter.
    {
        "smoka7/hop.nvim",
        keys = {
            { "s", "<cmd>HopPattern<cr>", desc = "Hop Pattern (Incremental Search)" },
        },
        config = function()
            require("config-hop")
        end,
    },

    -- Indentation Highlighting
    -- Adds visual vertical lines to show code indentation levels.
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
    },

    -- -- Language Support
    -- Zero-boilerplate bundle for LSP, autocomplete, and snippets.
    -- {
    --     "VonHeikemen/lsp-zero.nvim",
    --     branch = "v1.x",
    --     dependencies = {
    --         -- LSP Support
    --         {"neovim/nvim-lspconfig"},             -- Required
    --         {"williamboman/mason.nvim"},           -- Optional
    --         {"williamboman/mason-lspconfig.nvim"}, -- Optional
    --         {"astral-sh/ruff-lsp"},

    --         -- Autocompletion
    --         {"hrsh7th/nvim-cmp"},         -- Required
    --         {"hrsh7th/cmp-nvim-lsp"},     -- Required
    --         {"hrsh7th/cmp-buffer"},       -- Optional
    --         {"hrsh7th/cmp-path"},         -- Optional
    --         {"saadparwaiz1/cmp_luasnip"}, -- Optional
    --         {"hrsh7th/cmp-nvim-lua"},     -- Optional

    --         -- Snippets
    --         {"L3MON4D3/LuaSnip"},             -- Required
    --         {"rafamadriz/friendly-snippets"}, -- Optional
    --     }
    -- },

    -- Lualine
    -- Status bar showing mode, branch, and file info at the bottom.
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("config-lualine")
        end,
    },

    -- Nvimtree
    -- Project file explorer and navigation sidebar.
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        keys = {
            { "e", "NvimTreeToggle", desc = "Toggle Tree" },
        },
        config = function()
            require("config-nvim-tree")
        end,
    },

    -- Rose Pine theme
    -- Transparent, Wezterm-matching color scheme for Neovim.
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("config-rose-pine")
        end,
    },

    -- Rainbow Highlighting
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPost", "BufNewFile" },
    },

    -- Telescope
    -- Fuzzy finder for searching files, text, and buffers project-wide.
    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        keys = {
            { "ff", "Telescope find_files", desc = "Find Files" },
            { "fg", "Telescope live_grep", desc = "Live Grep" },
        },
        config = function()
            require("config-telescope")
        end,
    },

    -- Treesitter
    -- Advanced syntax highlighting using actual language grammar.
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("config-tree-sitter")
        end,
    },

    -- Which-key
    -- Popup cheat sheet that displays available keybindings.
    {
        "folke/which-key.nvim",
        config = function()
            require("config-which-key")
        end,
    },
}
