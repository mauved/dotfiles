-- Enable Java LSP
--
-- cmd, filetypes, and root_markers are intentionally omitted here: the
-- lspconfig-shipped default computes cmd as a function that isolates each
-- project into its own `-data` workspace dir under stdpath("cache").
-- Overriding cmd with a plain list would collapse every Java project onto
-- one shared workspace and corrupt the index, so we only extend settings.

-- Configure Java LSP
---@type vim.lsp.Config
return {
  settings = {
    java = {
      configuration = {
        runtimes = { -- Available JDKs; adjust paths for your machine
          { name = "JavaSE-21", path = "/usr/lib64/jvm/java-21-openjdk-21" },
          { name = "JavaSE-26", path = "/usr/lib64/jvm/java-26-openjdk-26", default = true },
        },
        updateBuildConfiguration = "interactive", -- Prompt before re-syncing pom/gradle changes
      },
      format = {
        enabled = true, -- Enable the built-in formatter
        settings = {
          url = nil, -- Path/URL to an Eclipse formatter XML, if any
          profile = nil, -- Profile name within that XML
        },
        onType = { -- Format as you type
          enabled = true,
        },
      },
      signatureHelp = { -- Parameter hints; off by default in jdtls
        enabled = true,
      },
      completion = {
        favoriteStaticMembers = { -- Static imports to offer eagerly
          "org.junit.Assert.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.hamcrest.MatcherAssert.assertThat",
          "org.mockito.Mockito.*",
          "java.util.Objects.requireNonNull",
        },
        filteredTypes = { -- Suppress noisy completion candidates
          "java.awt.*",
          "com.sun.*",
          "sun.*",
          "jdk.*",
          "io.micrometer.shaded.*",
        },
        importOrder = { "java", "javax", "com", "org" }, -- Import grouping order
      },
      sources = {
        organizeImports = {
          starThreshold = 99, -- Imports from one package before collapsing to import x.*
          staticStarThreshold = 99, -- Same, for static imports
        },
      },
      contentProvider = {
        preferred = "fernflower", -- Decompiler for class files without attached sources
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- Show parameter-name hints at call sites
        },
      },
      references = {
        includeDecompiledSources = true, -- Let goto-references reach into decompiled code
      },
      eclipse = {
        downloadSources = true, -- Fetch sources for Eclipse-resolved dependencies
      },
      maven = {
        downloadSources = true, -- Fetch sources for Maven-resolved dependencies
      },
      -- implementationsCodeLens / referencesCodeLens intentionally left
      -- disabled: codelens requires a vim.lsp.codelens.refresh() autocmd
      -- that this config does not set up.
    },
  },
  init_options = {
    bundles = {}, -- Extension point for java-debug / vscode-java-test jars if DAP is added later
  },
}
