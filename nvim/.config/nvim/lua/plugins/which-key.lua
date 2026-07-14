return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = {
            -- Groups
            { "<leader>f", group = "File Search" },
            { "<leader>g", group = "Git" },
            { "<leader>l", group = "LSP" },
            { "<leader>s", group = "Search" },

            -- Editor
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
            { "<leader>k", "<cmd>bdelete<CR>", desc = "Kill Buffer" },
            { "<leader>m", "<cmd>Mason<cr>", desc = "Mason UI for Lsp" },
            { "<leader>p", "<cmd>Lazy<CR>", desc = "Plugin Manager" },
            { "<leader>q", "<cmd>wqall!<CR>", desc = "Quit" },
            { "<leader>w", "<cmd>w!<CR>", desc = "Save" },

            -- LSP
            { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
            { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
            { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
            { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
            { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
            { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
            { "<leader>r", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Reformat Code" },
        },
    },
}
