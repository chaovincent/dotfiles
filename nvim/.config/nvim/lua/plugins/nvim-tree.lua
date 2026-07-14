local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local function open_and_stay()
        api.node.open.edit()
        api.tree.focus()
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "l", open_and_stay, opts("Open (Keep Focus)"))
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open (Move Focus)"))
    vim.keymap.set("n", "o", api.node.open.edit, opts("Open (Move Focus)"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Tree" },
    },
    opts = {
        on_attach = my_on_attach,
        filesystem_watchers = { enable = false },
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
        },
        filters = {
            custom = { "^\\.git$", "^node_modules$", "^\\.?venv$", "^\\.?cache$" },
        },
    },
}
