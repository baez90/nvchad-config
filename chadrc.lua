local userPlugins = require "custom.plugins"
local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}


M.ui = {
   theme = "gruvchad",
}

-- NvChad included plugin options & overrides
M.plugins = {
   install = userPlugins,
   status = {
     colorizer = true,
   },
   options = {
      nvimtree = {
        enable_git = 1,
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   configs = {
      treesitter = "custom.plugins.treesitter",
   },

   default_plugin_config_replace = {
   },
}

return M
