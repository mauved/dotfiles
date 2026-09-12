-- Install lspconfig plugin
vim.pack.add{
  { src = "https://github.com/neovim/nvim-lspconfig", version = "v2.11.0" }
}

vim.lsp.config("texlab", require("lsp.texlab")) -- Load texlab settings
vim.lsp.enable("texlab") -- Attach texlab to LaTeX buffers

vim.lsp.config("jdtls", require("lsp.jdtls")) -- Load jdtls settings
vim.lsp.enable("jdtls") -- Attach jdtls to Java buffers
