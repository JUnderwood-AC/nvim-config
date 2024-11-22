require("config.lazy")

vim.g.mapleader = " "

vim.opt.number = true

vim.api.nvim_create_autocmd("BufWritePre", {
callback = function()
	vim.lsp.buf.format()
end,
})