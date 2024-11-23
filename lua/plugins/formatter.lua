return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    -- Define formatter configurations for JavaScript/TypeScript and related filetypes
    local formatters = {
      prettier = {
        command = "prettier",
        args = {
          "--stdin-filepath",
          "$FILENAME"
        },
        stdin = true,
      },
    }

    -- Configure Conform.nvim
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        mjs = { "prettier" },
        cjs = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        -- Add more filetypes as needed
      },
      format_on_save = {
        lsp_fallback = true, -- Use fallback if LSP formatter isn't available
        timeout_ms = 2000,   -- Set timeout for formatting (optional)
      },
    })

    -- Command to manually format
    vim.api.nvim_create_user_command("Format", function()
      conform.format({ async = true })
    end, { desc = "Format the current buffer" })
  end,
}

