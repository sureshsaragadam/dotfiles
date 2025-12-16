-- lua_ls.lua
return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },

      diagnostics = {
        globals = { "vim" },
      },

      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          vim.fn.stdpath("config"),
        },
      },

      completion = {
        callSnippet = "Replace",
      },

      hint = {
        enable = true,
      },

      format = {
        enable = true,
      },
    },
  },
}

