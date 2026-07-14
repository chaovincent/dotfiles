return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "dockerfile",
            "gitattributes",
            "gitignore",
            "javascript",
            "json",
            "lua",
            "markdown",
            "python",
            "toml",
            "yaml",
        },
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
        },
        indent = {
            enable = true,
            disable = {
                "yaml",
            },
        },
    },
}
