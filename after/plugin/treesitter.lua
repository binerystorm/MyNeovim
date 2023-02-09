require'nvim-treesitter.configs'.setup {
  ensure_installed = {"ada", "help", "javascript", "typescript", "c", "lua", "rust", "cpp", "python" },
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
      enable = true
  }
}

