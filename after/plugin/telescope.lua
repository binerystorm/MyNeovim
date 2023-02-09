local builtin = require("telescope.builtin")
function map(key, cmd)
    vim.keymap.set("n", key, cmd, {})
end

map("<leader>ff", builtin.find_files)
map("<leader>fg", builtin.live_grep)
map("<leader>fh", builtin.help_tags)
map("<leader>fj", builtin.treesitter)
