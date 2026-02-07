-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "      ___           ___           ___                         ___                   ",
            "     /__/|         /  /\\         /__/\\                       /  /\\         _____    ",
            "    |  |:|        /  /::\\       |  |::\\                     /  /::\\       /  /::\\   ",
            "    |  |:|       /  /:/\\:\\      |  |:|:\\    ___     ___    /  /:/\\:\\     /  /:/\\:\\  ",
            "  __|  |:|      /  /:/~/::\\   __|__|:|\\:\\  /__/\\   /  /\\  /  /:/~/::\\   /  /:/~/::\\ ",
            " /__/\\_|:|____ /__/:/ /:/\\:\\ /__/::::| \\:\\ \\  \\:\\ /  /:/ /__/:/ /:/\\:\\ /__/:/ /:/\\:\\",
            " \\  \\:\\/:::::/ \\  \\:\\/:/__/\\ \\  \\:\\~~\\__\\/  \\  \\:\\  /:/  \\  \\:\\/:/__/\\ \\  \\:\\/:/~/:/",
            "  \\  \\::/~~~~   \\  \\::/       \\  \\:\\         \\  \\:\\/:/    \\  \\::/       \\  \\::/ /:/ ",
            "   \\  \\:\\        \\  \\:\\        \\  \\:\\         \\  \\::/      \\  \\:\\        \\  \\:\\/:/  ",
            "    \\  \\:\\        \\  \\:\\        \\  \\:\\         \\__\\/        \\  \\:\\        \\  \\::/   ",
            "     \\__\\/         \\__\\/         \\__\\/                       \\__\\/         \\__\\/    ",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  -- Python-specific configurations
  {
    "linux-cultist/venv-selector.nvim",
    enabled = vim.fn.executable("python") == 1 or vim.fn.executable("python3") == 1,
    event = "VeryLazy",
    opts = {
      -- Options for venv-selector
      settings = {
        -- Search for virtual environments in these directories
        lookup = { ".venv", "venv", "env", ".direnv" },
        -- Max depth to search for virtual environments
        max_depth = 5,
      },
    },
    keys = {
      { "<leader>lv", "<cmd>VenvSelect<cr>", desc = "Select Virtual Environment" },
    },
  },

  -- Python debugging support
  {
    "mfussenegger/nvim-dap-python",
    -- Makes sure DAP and Python pack are loaded before this
    dependencies = {
      "mfussenegger/nvim-dap",
      "AstroNvim/astrocore",
    },
    ft = "python",
    config = function()
      local mason_registry = require("mason-registry")
      local available, debugpy = pcall(function()
        return mason_registry.get_package("debugpy")
      end)

      if available and debugpy and debugpy:is_installed() then
        local mason_root = vim.fn.expand("$MASON")
        if mason_root == "" or mason_root == "$MASON" then
          mason_root = vim.fn.stdpath("data") .. "/mason"
        end

        local pkg_path = mason_root .. "/packages/debugpy"
        -- Try different possible Python executable paths
        local python_paths = {
          pkg_path .. "/venv/bin/python",
          pkg_path .. "/bin/python",
          pkg_path .. "/Scripts/python.exe", -- Windows path
        }

        for _, python_path in ipairs(python_paths) do
          local stat = vim.uv.fs_stat(python_path)
          if stat then
            require("dap-python").setup(python_path)
            return
          end
        end
      end

      local fallback = vim.fn.exepath "python3" or vim.fn.exepath "python"
      if fallback and fallback ~= "" then require("dap-python").setup(fallback) end
    end,
  },

  -- Error lens configuration to handle out-of-range errors
  {
    "https://code.bduncavage.com/bduncavage/error-lens.nvim",
    enabled = false, -- Disable temporarily to avoid out-of-range errors
    -- Alternative: Configure error-lens to be more resilient
    -- opts = {
    --   -- Increase debounce time to reduce rapid updates
    --   debounce = 100,
    --   -- Limit the number of diagnostics shown
    --   max_shown = 10,
    -- }
  },

  -- Wayland clipboard support
  {
    "ojroques/nvim-osc52",
    enabled = vim.fn.executable("wl-copy") == 1 and vim.fn.executable("wl-paste") == 1,
    opts = {
      -- Allows copy to system clipboard using OSC 52 escape sequence
      max_length = 0, -- Maximum length of selection (0 for no limit)
    },
    config = function(_, opts)
      require('osc52').setup(opts)
      -- Set up automatic sync of yanks to system clipboard
      vim.api.nvim_create_autocmd('TextYankPost', {
        callback = function()
          require('osc52').copy_visual_selection()
        end,
        desc = 'Copy selection to system clipboard',
      })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
