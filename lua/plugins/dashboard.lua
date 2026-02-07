-- You can use this file to setup your dashboard
-- This is a suggested configuration, feel free to customize it as needed

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        -- You can customize the header here
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
