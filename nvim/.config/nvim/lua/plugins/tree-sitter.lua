return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local ts = require("nvim-treesitter")
        ts.setup()
        ts.install({
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
            "markdown_inline",
            "python",
            "toml",
            "yaml",
        })

        -- Enable Native Highlighting and Indentation
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start)
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
