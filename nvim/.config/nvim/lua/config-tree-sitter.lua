local status_ok, treesitter = pcall(require, "nvim-treesitter.config")
if not status_ok then
    return
end

local setup = {
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
}

treesitter.setup(setup)
