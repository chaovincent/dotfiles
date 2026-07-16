return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        local servers = {
            pyright = {},
            bashls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            },
            starpls = {},
            protols = {},
            yamlls = {},
            taplo = {},
            dockerls = {},
            jsonls = {},
            clangd = {
                -- Prevent clangd from hijacking and throwing fake errors on .proto files
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
            },
        }

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        -- Bind blink autocomplete capabilities to all configurations globally
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        vim.lsp.config("*", { capabilities = capabilities })

        -- Native server registration (Nvim 0.11+)
        for server_name, server_opts in pairs(servers) do
            vim.lsp.config(server_name, server_opts)
            vim.lsp.enable(server_name)
        end

        -- Manual fallback for system-wide Ruff installations
        if vim.fn.executable("ruff") == 1 then
            vim.lsp.config("ruff", {})
            vim.lsp.enable("ruff")
        else
            vim.notify("cant find ruff in whatever dirs it searched", vim.log.levels.WARN)
        end

        -- Inline diagnostic styling
        vim.diagnostic.config({
            virtual_text = true,
            severity_sort = true,
            float = { border = "rounded", source = "always" },
        })

        -- Bind keymaps only when an LSP attaches to a buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                local has_snacks, snacks = pcall(require, "snacks")

                -- Route navigation to Snacks Picker if available, fallback to native LSP if not
                if has_snacks then
                    map("gd", function() snacks.picker.lsp_definitions() end, "Go to Definition")
                    map("gD", function() snacks.picker.lsp_declarations() end, "Go to Declaration")
                    map("gi", function() snacks.picker.lsp_implementations() end, "Go to Implementation")
                    map("gr", function() snacks.picker.lsp_references() end, "Go to References")
                else
                    map("gd", vim.lsp.buf.definition, "Go to Definition")
                    map("gD", vim.lsp.buf.declaration, "Go to Declaration")
                    map("gi", vim.lsp.buf.implementation, "Go to Implementation")
                    map("gr", vim.lsp.buf.references, "Go to References")
                end

                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
                map("<leader>rn", vim.lsp.buf.rename, "Rename Variable")
                map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format File")
            end,
        })
    end,
}
