return {
    -- Alpha
    {
        "goolord/alpha-nvim",
        lazy=true,
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs"
    },

    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        dependencies="nvim-tree/nvim-web-devicons",
    },

    -- Colorscheme
    {
        "ellisonleao/gruvbox.nvim",
    },

    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
    },

    -- Hop
    {
        "phaazon/hop.nvim",
        lazy=true,
    },

    -- Indentation Highlighting
    {
        "lukas-reineke/indent-blankline.nvim",
        main="ibl",
    },

    -- Language Support
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},             -- Required
            {"williamboman/mason.nvim"},           -- Optional
            {"williamboman/mason-lspconfig.nvim"}, -- Optional
            {"astral-sh/ruff-lsp"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},         -- Required
            {"hrsh7th/cmp-nvim-lsp"},     -- Required
            {"hrsh7th/cmp-buffer"},       -- Optional
            {"hrsh7th/cmp-path"},         -- Optional
            {"saadparwaiz1/cmp_luasnip"}, -- Optional
            {"hrsh7th/cmp-nvim-lua"},     -- Optional

            -- Snippets
            {"L3MON4D3/LuaSnip"},             -- Required
            {"rafamadriz/friendly-snippets"}, -- Optional
        }
    },

    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies="nvim-tree/nvim-web-devicons",
    },

    -- Mini
    {
        "echasnovski/mini.nvim",
        version = "*",
        lazy=true,
        dependencies="akinsho/bufferline.nvim",
    },

    -- Nvimtree
    {
        "nvim-tree/nvim-tree.lua",
        lazy=true,
        dependencies="nvim-tree/nvim-web-devicons",
    },

    -- Rainbow Highlighting
    {
        "HiPhish/nvim-ts-rainbow2",
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        lazy=true,
        dependencies="nvim-lua/plenary.nvim",
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
    },

    -- Treesitter Context
    {
        "nvim-treesitter/nvim-treesitter-context",
    },

    -- Which-key
    {
        "folke/which-key.nvim",
        lazy=true,
    },
}
