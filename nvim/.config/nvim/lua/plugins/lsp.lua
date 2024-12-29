return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        'folke/lazydev.nvim',
        ft = "lua",
        opts = {
          library = {
            vim.env.VIMRUNTIME,
            "${3rd}/luv/library",
            "${3rd}/busted/library",
          },
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      lspconfig.eslint.setup {
        settings = {
          useFlatConfig = true,
          experimental = {
            useFlatConfig = nil
          }
        }
      }

      lspconfig.ts_ls.setup {}
      lspconfig.lua_ls.setup {
      }
      lspconfig.html.setup {
        capabilities = capabilities,
      }
      lspconfig.css_variables.setup {
      }
      lspconfig.cssls.setup {
        capabilities = capabilities,
      }
      lspconfig.cssmodules_ls.setup {
      }
      lspconfig.basedpyright.setup {}


      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          ---@diagnostic disable-next-line:
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = args.buf,
                  id = client.id
                })
              end
            })
          end
        end
      })
    end,
  }
}
