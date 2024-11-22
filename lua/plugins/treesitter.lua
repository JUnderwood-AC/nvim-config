return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "tsx", "javascript", "typescript", "html", "css" }, -- Add parsers here
            highlight = {
                enable = true,              -- Enable Treesitter highlighting
                additional_vim_regex_highlighting = false, -- Avoid slow regex fallback
            },
            autotag = {
                enable = true,             -- For automatic HTML/JSX tag closing
            },
        })
    end,
}

