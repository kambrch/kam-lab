---@type LazySpec
return {
  -- LSP: Pyright for Python.
  {
    "AstroNvim/astrolsp",
    opts = {
      servers = { "pyright" },
      formatting = {
        format_on_save = {
          enabled = true,
          allow_filetypes = { "python" },
        },
      },
    },
  },
  -- Formatter + diagnostics via none-ls.
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.diagnostics.ruff,
      })
    end,
  },
  -- Ensure tools are installed via Mason.
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, {
        "pyright",
        "ruff",
      })
    end,
  },
}
