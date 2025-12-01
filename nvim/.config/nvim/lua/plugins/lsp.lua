-- lua/plugins/lsp.lua
local servers = require("plugins.lsp.servers")
local diagnostics = require("plugins.lsp.diagnostics")
local capabilities = require("plugins.lsp.capabilities")
local keymaps = require("plugins.lsp.keymaps")
local luals = require("plugins.lsp.luals")

return {
  -- mason + related tooling
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },

  -- optional UI for LSP progress
  { "j-hui/fidget.nvim", opts = {} },

  -- blink.cmp integration for capabilities
  { "saghen/blink.cmp" },

  -- nvim-lspconfig plugin spec with our config
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "saghen/blink.cmp" },
    config = function()
      -- apply diagnostics config
      vim.diagnostic.config(diagnostics)

      -- attach keymaps on LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("plugins-lsp-attach", { clear = true }),
        callback = keymaps.on_attach,
      })

      -- ensure servers installed via mason-tool-installer
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, { "stylua" })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      -- mason-lspconfig setup and handler
      require("mason-lspconfig").setup({
        ensure_installed = {}, -- handled above
        automatic_installation = false,
        handlers = {
          function(server_name)
            local opts = vim.tbl_deep_extend("force", {}, servers[server_name] or {}, {})
            opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
            require("lspconfig")[server_name].setup(opts)
          end,
        },
      })
    end,
  },
}

