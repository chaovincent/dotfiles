return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            vim.notify("Treesitter is switching branches. Open :Lazy and press 'U' to sync!", vim.log.levels.WARN)
            return
        end

        configs.setup({
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
        })
    end,
}
