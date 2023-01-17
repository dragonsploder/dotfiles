-- Plugins and Packages done with packer
require('packer').startup(function(use)
    -- Packer will manage itself
    use 'wbthomason/packer.nvim'

    -- Better escape for exiting insert mode with 'ii'
    use {
        'max397574/better-escape.nvim',
	config = function()
	    require('better_escape').setup {
                mapping = {'ii'}
	    }
	end,
    }

    -- Gruvbox color scheme
    use 'ellisonleao/gruvbox.nvim'

    -- Vimpeccable
    use 'svermeulen/vimpeccable'

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Vim fugitive (git)
    use 'tpope/vim-fugitive'

    -- Make commenting easier 
    use 'tpope/vim-commentary'

    -- coc code completion
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Auto pairs
    use 'm4xshen/autoclose.nvim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- cell automation
    use 'eandrju/cellular-automaton.nvim'
end)

-- Leader
vim.g.mapleader = ","


-- Vimpeccable setup
local vimp = require('vimp')
vimp.nnoremap('<leader>rr', function() -- r = reload vimrc
  -- Remove all previously added vimpeccable maps
  vimp.unmap_all()

  -- Unload the lua namespace so that the next time require('config.X') is called
  -- it will reload the file
  --require("config.util").unload_lua_namespace('config') -- Uncommented because I don't currently have a config.util

  -- Make sure all open buffers are saved
  vim.cmd('silent wa')
  -- Execute our vimrc lua file again to add back our maps
  dofile(vim.fn.stdpath('config') .. '/init.lua')

  print("Reloaded init.lua!")
end)

-- Buffer movement
vimp.nnoremap({'silent'}, '<leader>n', '[[:bn<cr>]]')
vimp.nnoremap({'silent'}, '<leader>p', '[[:bp<cr>]]')
vimp.nnoremap({'silent'}, '<leader>d', '[[:bd<cr>]]')

-- Window movement
vimp.nnoremap('<leader>w', [[<C-w>]])

-- Search Settings
vim.o.ignorecase = true -- Pattern matching ignores case
vim.o.smartcase = true -- Override ignorecase if we explicitly use mixed case
vim.o.incsearch = true -- Incremental Searching
vim.o.hlsearch = true -- Highlight all searches even after search
vimp.nnoremap({'silent'}, '<leader>h', function() -- Toggle highlighting
    vim.o.hls = not vim.o.hls 
end)
vim.o.smartindent = true -- indent better

-- Indent (tab key) settings
vim.o.tabstop = 4 -- Tab char width
vim.o.expandtab = true -- Insert spaces instead of a tab char when indenting
vim.o.shiftwidth = 4 -- Indent size in spaces
vim.o.smarttab = true -- Tab the same amount as the previous line

-- Line numbers
vim.o.number = true -- List line numbers

-- Misc
vim.o.so = 5 -- Lines to keep below cursor when scrolling
vim.o.magic = true -- Turn on regex magic
vimp.nnoremap('<leader>lw', function() -- Line wrap
    vim.o.wrap = not vim.o.wrap
end)
vim.o.clipboard = "unnamedplus" -- Set clipboard to system

-- Turn off backups and turn on swap
vim.o.backup = false
vim.o.swapfile = true

-- Spell Check
vimp.nnoremap('<leader>s', function()
    vim.o.spell = not vim.o.spell
end)

-- Gruvbox color scheme settings
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Lua status line setup
require('lualine').setup {
    options = { theme = 'gruvbox' }
}

-- coc setup
require('cocsetup')
-- autoclose setup
require("autoclose").setup({})

-- cellular automation keybinds
vimp.nnoremap({'silent'}, '<leader>cr', '[[:CellularAutomaton make_it_rain<cr>]]')
vimp.nnoremap({'silent'}, '<leader>ca', '[[:CellularAutomaton game_of_life<cr>]]')
