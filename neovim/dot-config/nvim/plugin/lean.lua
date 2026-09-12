-- Install lean.nvim
--
-- No lua/lsp/leanls.lua and no entry in plugin/lspconfig.lua: lean.nvim ships
-- its own lsp/leanls.lua on the runtimepath and calls vim.lsp.enable('leanls')
-- itself from setup() below. Configuring leanls again via lspconfig would
-- double-configure the server, which lean.nvim's own manual warns against.
vim.pack.add { {src = "https://github.com/Julian/lean.nvim", version = "v2026.4.1" } }

-- Configure Lean LSP and editor features
---@type lean.Config
vim.g.lean_config = {
  mappings = true, -- Install lean.nvim's suggested keymaps
  lsp = {
    enable = true, -- Start leanls (via lake serve, falling back to lean --server)
    enhanced_handlers = {
      hover = true, -- Interactive hover with clickable subexpressions
      diagnostics = true, -- Filter silent diagnostics, render multi-line signs
    },
  },
  infoview = {
    autoopen = true, -- Open the infoview split automatically in Lean buffers
    orientation = "auto", -- Vertical or horizontal split depending on window size
    update_cooldown = 50, -- Milliseconds to throttle cursor-move updates
    view_options = {
      use_widgets = true, -- Render interactive widgets (e.g. tactic state)
      show_types = true, -- Show types of hypotheses
      show_instances = true, -- Show instance-implicit hypotheses
      show_hidden_assumptions = true, -- Show inaccessible hypotheses
      show_let_values = true, -- Show let-bound values
      show_term_goals = true, -- Show term-mode goals
      reverse = false, -- Don't reverse hypothesis order
    },
  },
  abbreviations = {
    leader = "\\", -- Trigger for unicode abbreviations (e.g. \to -> →) in Lean buffers;
    -- unrelated to vim.g.mapleader (also "\\"), set separately in lua/config.lua
  },
  goal_markers = {
    unsolved = " ⚒ ", -- Sign for lines with an unsolved goal
    accomplished = "🎉", -- Sign for a completed proof
  },
  inlay_hint = {
    enabled = true, -- Show inlay hints (e.g. auto-implicit arguments)
  },
  signs = {
    enabled = true, -- Render lean.nvim's own diagnostic signs in the sign column
  },
  graphics = {
    enabled = true, -- Render rich content (e.g. SVGs) via Kitty graphics protocol,
    -- where the terminal supports it; harmless no-op otherwise
  },
  -- ft.nomodifiable left at defaults: protects src/lean/, .elan/, .lake/ paths
}

require("lean").setup {}
