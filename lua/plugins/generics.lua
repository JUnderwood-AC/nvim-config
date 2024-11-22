return {
  -- LSP configuration
  { 'neovim/nvim-lspconfig' },

  -- Completion source for LSP
  { 'hrsh7th/cmp-nvim-lsp' },

  -- Completion framework
  { 'hrsh7th/nvim-cmp', config = function()
    local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Navigate to the next item
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Navigate to the previous item
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept the suggestion
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Confirm selection on Enter
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
})
  end },
}

