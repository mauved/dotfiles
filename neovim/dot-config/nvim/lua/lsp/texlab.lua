-- Enable LaTeX LSP

-- Configure LaTeX LSP
---@type vim.lsp.Config
return {
  cmd = { "texlab" }, -- LSP server binary
  filetypes = { "tex", "plaintex", "bib" }, -- Filetypes to attach to
  root_markers = { ".git", ".latexmkrc", "latexmkrc", ".texlabroot", "texlabroot", "Tectonic.toml" }, -- Files marking the project root
  settings = {
    texlab = {
      rootDirectory = nil, -- Auto-detect via root_markers
      build = {
        executable = "latexmk", -- Build tool
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" }, -- Build args
        onSave = false, -- Don't build automatically on save
        forwardSearchAfter = false, -- Don't jump to PDF viewer after building
      },
      forwardSearch = {
        executable = "okular", -- PDF viewer for jump-to-location
        args = {"--unique", "file:%p#src:%l%f"} -- Viewer args
      },
      chktex = {
        onOpenAndSave = true, -- Lint when a file is opened or saved
        onEdit = true, -- Lint while editing
      },
      diagnosticsDelay = 300, -- Milliseconds to wait before publishing diagnostics
      latexFormatter = "latexindent", -- Formatter for .tex files
      latexindent = {
        ["local"] = nil, -- local is a reserved keyword; disables custom local latexindent config
        modifyLineBreaks = false, -- Don't let the formatter change line breaks
      },
      bibtexFormatter = "texlab", -- Formatter for .bib files
      formatterLineLength = 80, -- Max line length when formatting
    },
  },
}
