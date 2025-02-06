require'nvim-treesitter.configs'.setup {
  ensure_installed = {"ada",
        "vimdoc",
        "javascript",
        "typescript",
        "c",
        "lua",
        "rust",
        "cpp",
        "python",
        "comment"
    },
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

