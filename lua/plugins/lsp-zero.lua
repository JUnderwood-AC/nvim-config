return {
  {
    'neovim/nvim-lspconfig', -- Core LSP plugin
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- Adds LSP capabilities for nvim-cmp
    },
    config = function()
      -- Reserve a space in the gutter to avoid layout shifts
      vim.opt.signcolumn = 'yes'

      -- Extend LSP capabilities with cmp-nvim-lsp capabilities
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- Set up LSP keymaps on LSP attachment
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
        end,
      })


	local cmp = require('cmp')

	cmp.setup({
	  sources = {
    {name = 'nvim_lsp'},
  },
	  mapping = cmp.mapping.preset.insert({}),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
})

      -- Configure language servers
      require('lspconfig').ts_ls.setup({})
    end,
  },
}

