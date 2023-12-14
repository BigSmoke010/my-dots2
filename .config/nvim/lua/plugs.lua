return require('packer').startup(function()
    use { 'mg979/vim-visual-multi' }
    use { 'ray-x/lsp_signature.nvim' }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'matze/vim-move' }
    use { 'folke/tokyonight.nvim' }
    use { 'ziontee113/color-picker.nvim', config = function()
        require("color-picker")
    end }
    use { 'onsails/lspkind.nvim' }
    use { 'folke/trouble.nvim' }
    use { 'windwp/nvim-ts-autotag' }
    use { 'smbl64/vim-black-macchiato' }
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'numToStr/Comment.nvim' }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
    use { 'brenoprata10/nvim-highlight-colors' }
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use { 'neovim/nvim-lspconfig' }
    use { 'EdenEast/nightfox.nvim' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'ggandor/leap.nvim' }
    use { 'mhinz/vim-startify' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'ray-x/aurora' }
end)
