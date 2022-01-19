local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   local servers = { "yamlls", "dockerls", "jsonls", "elixirls", "texlab", "omnisharp" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         -- root_dir = vim.loop.cwd,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

   lspconfig.gopls.setup {
      on_attach = attach,
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
      flags = {
         debounce_text_changes = 150,
      },
      settings = {
         gopls = {
            gofumpt = true,
            experimentalPostfixCompletions = true,
            staticcheck = true,
            usePlaceholders = true,
         },
      },
   }

   lspconfig.golangci_lint_ls.setup {
     init_options = {
       command = { "golangci-lint", "run", "--out-format", "json" },
     }
   }

   lspconfig.elixirls.setup {
      cmd = { "/usr/bin/elixir-ls" },
   }

   lspconfig.jsonls.setup {
     cmd = { "/usr/bin/vscode-json-languageserver", "--stdio" },
     filetypes = { "json" },
     root_dir = lspconfig.util.root_pattern(".git"),
     single_file_support = true
   }

   local pid = vim.fn.getpid()

   lspconfig.omnisharp.setup {
     cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(pid) },
   }

   end

return M
