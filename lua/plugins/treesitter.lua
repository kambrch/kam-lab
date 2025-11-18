-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    version = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "latex",
        "lua",
        "markdown",
        "norg",
        "regex",
        "scss",
        "svelte",
        "tsx",
        "typst",
        "vue",
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    },
  },
}
