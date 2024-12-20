return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
    },

    version = 'v0.*',

    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      completion = {
        menu = { border = 'single' },
        documentation = {
          window = {
            border = 'single'
          }
        }
      },
      signature = {
        enabled = true,
        window = {
          border = 'single'
        },
      },
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer", },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`lua:14)
            score_offset = 100,
          },
        },
      },
    },
  },
}
