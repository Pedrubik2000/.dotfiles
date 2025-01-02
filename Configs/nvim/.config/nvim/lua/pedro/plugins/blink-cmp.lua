return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'niuiic/blink-cmp-rg.nvim',
          "moyiz/blink-emoji.nvim",
  },
  event = {
    'InsertEnter',
'CmdlineEnter'
  },
  version = '*', 
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lazydev','lsp', 'path', 'snippets', 'buffer', "ripgrep", "emoji"},
      providers = {
        snippets = {
          opts = {
            search_paths = {
              "../snippets/"
            }
          }
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        ripgrep = {
				module = "blink-cmp-rg",
				name = "Ripgrep",
				-- options below are optional, these are the default values
				---@type blink-cmp-rg.Options
				opts = {
					-- `min_keyword_length` only determines whether to show completion items in the menu,
					-- not whether to trigger a search. And we only has one chance to search.
					prefix_min_len = 3,
					get_command = function(context, prefix)
						return {
							"rg",
							"--no-config",
							"--json",
							"--word-regexp",
							"--ignore-case",
							"--",
							prefix .. "[\\w_-]+",
							vim.fs.root(0, ".git") or vim.fn.getcwd(),
						}
					end,
					get_prefix = function(context)
						return context.line:sub(1, context.cursor[2]):match("[%w_-]+$") or ""
					end,
				},
      },
      emoji = {
        module = "blink-emoji",
        name = "Emoji",
        score_offset = 15,
      }
      }
    },
    completion = {
      menu = {
        border = 'rounded',
        auto_show = function(ctx)
          local cmdtype = vim.fn.getcmdtype()
          local cmdline = vim.fn.getcmdline()
          return not (cmdtype == ':' and cmdline:match("^l"))
        end,
            draw = {
      components = {
        kind_icon = {
          ellipsis = false,
          text = function(ctx)
            local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
            return kind_icon
          end,
          -- Optionally, you may also use the highlights from mini.icons
          highlight = function(ctx)
            local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
            return hl
          end,
        }
      }
    },
      },
      documentation = {
        window = {
          border = 'rounded',
        },
      },
    },
    signature = {
      enabled = true ,
      window = {
        border = 'rounded',
      },
    },
  },
  opts_extend = { "sources.default" }
}
