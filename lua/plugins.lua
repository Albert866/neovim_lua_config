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
    -- Base plugin
    { "nvim-lua/plenary.nvim" },       -- lua plugins library
    { "folke/which-key.nvim" },        -- configure and prompt shortcut keys
    { "kkharji/sqlite.lua" },          -- sqlite
    { "MunifTanjim/nui.nvim" },        -- GUI library
    -- colorscheme
    { "tanvirtin/monokai.nvim" },      -- main
    { "marko-cerovac/material.nvim" }, -- line

    {
        "nvim-tree/nvim-web-devicons",
        opt = {
            color_icons = true,
            default = true,
            strict = true,
        },
    },
    {
        "echasnovski/mini.nvim",
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
            -- `nvim-notify` is only needed, if you want to use the notification view.
            -- If not available, we use `mini` as the fallback
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
            require("config.nvim-indent-blankline")
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
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            max_lines = 5,
        },
    },
    -- Install nvim-ts-rainbow
    {
        "p00f/nvim-ts-rainbow",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.nvim-ts-rainbow")
        end,
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("config.nvim-lualine")
        end,
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        config = function()
            require("config.nvim-tree")
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
        -- Copilot setup/enable/disable/status
        "github/copilot.vim",
    },

    -- complation plugin
    { "hrsh7th/nvim-cmp" },         -- The completion plugin
    { "hrsh7th/cmp-buffer" },       -- buffer completions
    { "hrsh7th/cmp-path" },         -- path completions
    { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- HightLight
    { "norcalli/nvim-colorizer.lua" }, -- display #FFFFFF
    { "andymass/vim-matchup" },        -- hight light pair case，example: #if 和 #endif

    -- code snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },

    -- lsp stronge model plugins
    { "jackguo380/vim-lsp-cxx-highlight" }, -- ccls hight light
    { "mattn/efm-langserver" },             -- for bash
    { "jakemason/ouroboros" },              -- quickly switch between header and source file in C/C++ project

    -- coc lsp
    -- npm install -g typescript typescript-language-server
    -- npm install -g pyright
    -- npm install -g bash-language-server
    {
        "neoclide/coc.nvim",
        branch = "release",
    },

    -- Install vim-gn
    {
        "kalcutter/vim-gn",
    },

    -- Install DoxygenToolkit.vim
    {
        "babaybus/DoxygenToolkit.vim",
        config = function()
            -- Doxygen Toolkit configuration
            require("config.doxygen_toolkit")
            vim.cmd([[
                augroup DoxAuthorOnNewFile
                    autocmd!
                    autocmd BufNewFile *.cpp,*.cc,*.c,*.h,*.hpp :DoxLic
                augroup END
            ]])
        end,
    },

    -- Markdown support
    { "preservim/vim-markdown", ft = { "markdown" } },
    -- Markdown previewer
    {
        -- You need to compile it manually:cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app && npm install
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        config = function()
            require("config.nvim-markdown")
        end,
        ft = { "markdown" }
    },

    -- vista
    {
        "liuchengxu/vista.vim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("config.vista")
        end,
    },
})
