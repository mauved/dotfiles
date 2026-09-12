-- Editor quality of life
vim.opt.number = true -- Enable line numbers

vim.g.mapleader = "\\" -- Set leader key to backslash


-- IDE-type settings
vim.opt.completeopt = "menu,menuone,noselect" -- Don't preselect a completion candidate

-- Enable native completion for any attached LSP client
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})
