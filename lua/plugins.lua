-- Install Lazy.nvim automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Install vim-monokai colorscheme
    {
        "crusoexia/vim-monokai",
    },
    -- Better UI
    -- Run `:checkhealth noice` to check for common issues
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
    -- Autopairs: [], (), "", '', etc
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("config.nvim-autopairs")
        end,
    },
    -- Install vim signature
    {
        "kshenoy/vim-signature",
    },
    -- Show indentation and blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("config.indent-blankline")
        end,
    },

    -- Install vim-airline and vim-airline-themes
    {
        "vim-airline/vim-airline",
    },
    {
        "vim-airline/vim-airline-themes",
        depends = 'vim-airline/vim-airline',
        config = function()
            require("config.airline")
        end,
    },

    -- Install nerdtree
    {
        "preservim/nerdtree",
        depends = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.nerdtree")
        end,
    },
    {
        "Xuyuanp/nerdtree-git-plugin",
        dependencies = 'preservim/nerdtree',
    },

    -- Treesitter-integration
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("config.nvim-treesitter")
        end,
    },
    -- Nvim-treesitter text objects
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.nvim-treesitter-textobjects")
        end,
    },

    -- Install nerdcommenter
    {
        "scrooloose/nerdcommenter",
        config = function()
            require("config.nerdcommenter")
        end,
    },
    -- Install github copilot
    {
        "github/copilot.vim",
    },

})
