function map(key, cmd)
    vim.keymap.set("n", key, cmd, {})
end

function edit_conf()
    conf_dir = vim.fs.dirname(vim.fn.expand("$MYVIMRC"))
    vim.cmd.tcd(conf_dir)
    vim.cmd.tabnew(conf_dir)
end

vim.g.mapleader = " "

map("<leader>tt", vim.cmd.tabnew)
map("<leader>tc", edit_conf)
map("<leader>th", vim.cmd.tabprev)
map("<leader>tl", vim.cmd.tabnext)
map("<leader>tg", "<cmd>tab Git<cr>")
map("<leader>t ", ":tab ")

map("<leader>cc", "<cmd>Copen<cr>")
map("<leader>ca", "<cmd>AbortDispatch<cr>")
map("<leader>cm", "<cmd>Make<cr>")
map("<leader>cr", "<cmd>Dispatch<cr>")
map("<leader>cd", vim.cmd.cclose)
map("<leader>cj", vim.cmd.cnext)
map("<leader>ck", vim.cmd.cprev)
