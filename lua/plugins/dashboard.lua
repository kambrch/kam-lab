-- You can use this file to setup your dashboard
-- This is a suggested configuration, feel free to customize it as needed

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        -- You can customize the header here
        header = table.concat({
          "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        }, "\n"),
        -- You can customize the footer here
        -- footer = { "Welcome to AstroNvim!" },
        -- You can add custom keys to the dashboard
        keys = {
          {
            key = "f",
            desc = "Find File",
            action = "Telescope find_files",
            icon = " ",
          },
          {
            key = "n",
            desc = "New File",
            action = "enew",
            icon = " ",
          },
          {
            key = "r",
            desc = "Recent Files",
            action = "Telescope oldfiles",
            icon = " ",
          },
          {
            key = "g",
            desc = "Find Text",
            action = "Telescope live_grep",
            icon = " ",
          },
          {
            key = "c",
            desc = "Config",
            action = "edit " .. vim.fn.stdpath "config",
            icon = " ",
          },
          {
            key = "s",
            desc = "Restore Session",
            action = "SessionManager load_session",
            icon = " ",
          },
          {
            key = "l",
            desc = "Lazy",
            action = "Lazy",
            icon = "󰒲 ",
          },
          {
            key = "q",
            desc = "Quit",
            action = "qa",
            icon = "󰩈 ",
          },
        },
      },
    },
  },
}
