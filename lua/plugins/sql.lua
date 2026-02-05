---@type LazySpec
return {
  -- LSP for SQL.
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.servers = require("astrocore").list_insert_unique(opts.servers or {}, { "sqls" })
    end,
  },
  -- Ensure SQL tools are installed via Mason.
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, {
        "sqls",
        "sqlfluff",
      })
    end,
  },
}
