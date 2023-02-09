vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = {{'nvim-lua/plenary.nvim'}}
	}
	use 'binerystorm/Spairs'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-dispatch'
	use 'ellisonleao/gruvbox.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
end)
