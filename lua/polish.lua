-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Sync all yanks to the system clipboard.
vim.opt.clipboard = "unnamedplus"

-- Enable spell checking for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown", "md", "tex", "latex", "plaintex", "rst", "asciidoc", "org", "mail" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en", "pl" }  -- English and Polish
  end,
  desc = "Enable English and Polish spell checking for text files",
})
