-- MAPPINGS
local map = require("core.utils").map

-- Install plugins
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
  use {
    "vim-test/vim-test",
    setup = function()
      vim.g["test#csharp#xunit#executable"] = "dotnet test"
    end
  }
end)


map("n", "<leader>t", ":TestNearest <CR>")
map("n", "<leader>T", ":TestFile<CR>")
map("n", "<leader>a", ":TestSuite<CR>")
