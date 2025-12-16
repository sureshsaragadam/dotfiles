-- blink-cmp.lua
return {
  "saghen/blink.cmp",
  version = "1.*",
  -- event = "VimEnter"
	event = "InsertEnter",

  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "2.*",
      build = "make install_jsregexp",
      opts = {},
    },
    "folke/lazydev.nvim",
  },

  opts = {
    -- Use Neovim-native completion behavior
    keymap = {
      preset = "default",
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    snippets = {
      preset = "luasnip",
    },

    sources = {
      default = { "lsp", "path", "snippets", "lazydev" },
      providers = {
        lazydev = {
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },

    completion = {
      documentation = {
        auto_show = true,
				  auto_show_delay_ms = 400,
      },
    },

    fuzzy = {
      implementation = "lua",
    },

    signature = {
      enabled = true,
    },
  },
}

