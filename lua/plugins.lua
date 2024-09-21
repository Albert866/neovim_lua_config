-- Install Lazy.nvim automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
-- Enter lazy manage page : Lazy
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
        -- m{letter}：set/unset an mark, example: `m + a` set an mark a
        -- '{letter}：jump to {letter}
        -- :marks：list all tags
        -- :delmarks {letter}：delete tag {letter}
        -- Please note that lowercase: letter marks (such as "a") are only valid in the current file, while uppercase letter marks (such as "A") are valid across all files.
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
    -- Install nvim-ts-rainbow
    {
        "p00f/nvim-ts-rainbow",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.nvim-ts-rainbow")
        end,
    },

    -- Install vim-airline and vim-airline-themes
    {
        "vim-airline/vim-airline",
        dependencies = 'vim-airline/vim-airline-themes',
        config = function()
            require("config.airline")
        end,
    },

    -- Install nerd tree
    {
        "preservim/nerdtree",
        dependencies = {
            'ryanoasis/vim-devicons',
            'Xuyuanp/nerdtree-git-plugin',
        },
        config = function()
            require("config.nerdtree")
        end,
    },
    -- Install nerd commenter
    {
        'scrooloose/nerdcommenter',
        config = function()
            require("config.nerdcommenter")
        end,
    },

    -- Install LeaderF plugin, and run :LeaderfInstallCExtension
    {
        "Yggdroot/LeaderF",
        run = ":LeaderfInstallCExtension",
        config = function()
            require("config.leaderf")
        end,
    },

    -- Install github copilot
    {
        -- github copilot: https://docs.github.com/en/copilot/getting-started-with-github-copilot?tool=vimneovim
        -- https://github.com/github/copilot.vim.git  :Copilot setup   :Copilot enable/disable/status
        "github/copilot.vim",
        event = "InsertEnter",
    },

    -- Install LSP plugins
    {
        "neoclide/coc.nvim",
        branch = "release",
        config = function()
            require("config.nvim-coc")
        end,
    },
})
