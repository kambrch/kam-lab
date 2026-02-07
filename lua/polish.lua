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
    -- Check if Polish spell file is available, otherwise use only English
    local spell_dir = vim.fn.stdpath("data") .. "/site/spell"
    local pl_spell_available = vim.fn.isdirectory(spell_dir) == 1 and 
                              (vim.fn.glob(spell_dir .. "/pl.*.spl") ~= "")
    
    if pl_spell_available then
      vim.opt_local.spelllang = { "en", "pl" }  -- English and Polish
    else
      vim.opt_local.spelllang = "en"  -- Only English if Polish is not available
      -- Optionally notify user that Polish spell check is not available
      vim.notify("Polish spell check not available. Install Polish spell files to enable.", vim.log.levels.WARN)
    end
  end,
  desc = "Enable English and Polish spell checking for text files",
})
