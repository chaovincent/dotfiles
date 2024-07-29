local configs = require("nvim-treesitter.configs")
configs.setup {
    -- Add a language of your choice
    ensure_installed = {
        "bash", 
        "c", 
        "cpp", 
        "dockerfile", 
        "gitattributes", 
        "gitignore", 
        "javascript", 
        "json", 
        -- "latex",
        "lua", 
        "markdown", 
        "python",
        "toml",
        "yaml",
    },
    sync_install = false,
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
}
