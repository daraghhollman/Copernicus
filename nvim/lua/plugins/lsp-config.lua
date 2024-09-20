return {
    {
        "williamboman/mason.nvim",

        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "pyright",
                    "html",
                    "cssls",
                    "markdown_oxide",
                    "texlab",
                    "clangd",
                    "csharp_ls",
                    "denols",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",

        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
            -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
            capabilities.workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true,
                },
            }

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilties = capabilities,
            })
            lspconfig.csharp_ls.setup({
                capabilties = capabilities,
            })
            lspconfig.denols.setup({
                capabilties = capabilities,
            })
            lspconfig.texlab.setup({
                capabilties = capabilities,
            })
            lspconfig.bashls.setup({
                capabilties = capabilities,
            })
            lspconfig.html.setup({
                capabilties = capabilities,
            })
            lspconfig.cssls.setup({
                capabilties = capabilities,
            })
            lspconfig.clangd.setup({
                capabilties = capabilities,
            })
            lspconfig.markdown_oxide.setup({
                capabilties = capabilities,
                on_attach = on_attach,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

            vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {})
        end,
    },
}
