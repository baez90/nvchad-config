return {
    {
      "vim-test/vim-test",
      setup = function()
        vim.g["test#csharp#runner"] = "dotnettest"
      end
    },
    {
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
  }