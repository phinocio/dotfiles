local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("phin.config.lsp.mason")
require("phin.config.lsp.handlers").setup()
require("phin.config.lsp.null-ls")
