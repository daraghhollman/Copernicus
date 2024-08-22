return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.biome,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.clang_format,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}