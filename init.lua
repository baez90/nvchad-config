-- MAPPINGS
local map = require("core.utils").map

-- Install plugins
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
  use {
    "vim-test/vim-test",
    setup = function()
      vim.g["test#csharp#runner"] = "dotnettest"
    end
  }

  use {
      "rmagatti/auto-session",
      cmd = { "SaveSession", "RestoreSession" },
      event = "VimEnter",
      config = function()
         require("auto-session").setup {
            log_level = "info",
            auto_session_enabled = true,
            auto_save_enabled = true,
            auto_restore_enabled = true,
            auto_session_suppress_dirs = {'~/'},
            pre_save_cmds = { "tabdo NvimTreeClose" },
         }
      end,
   }
end)


map("n", "<leader>t", ":TestNearest <CR>")
map("n", "<leader>T", ":TestFile<CR>")
map("n", "<leader>a", ":TestSuite<CR>")
