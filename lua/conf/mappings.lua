local tmux = require("conf.tmux")

function map(key, cmd)
    vim.keymap.set("n", key, cmd, {})
end

function edit_conf()
    conf_dir = vim.fs.dirname(vim.fn.expand("$MYVIMRC"))
    vim.cmd.tabnew(conf_dir)
    vim.cmd.tcd(conf_dir)
end

vim.g.mapleader = " "

-- Tab control
map("<leader>tt", vim.cmd.tabnew)
map("<leader>tc", edit_conf)
map("<leader>th", vim.cmd.tabprev)
map("<leader>tl", vim.cmd.tabnext)
map("<leader>tg", "<cmd>tab Git<cr>")
map("<leader>t ", ":tab ")

-- Dispatch control
map("<leader>cc", "<cmd>Copen<cr>")
map("<leader>ca", "<cmd>AbortDispatch<cr>")
map("<leader>cm", "<cmd>Make<cr>")
map("<leader>cr", "<cmd>Dispatch<cr>")
map("<leader>cd", vim.cmd.cclose)
map("<leader>cj", vim.cmd.cnext)
map("<leader>ck", vim.cmd.cprev)

-- Tmux control
map("<leader>ss", tmux.start_vim_session)
map("<leader>srr", tmux.run)
map("<leader>sr ", ":TRun ")

vim.api.nvim_create_user_command("Twin", tmux.new_win, {})
vim.api.nvim_create_user_command("TmuxStart", tmux.start_vim_session, {})

vim.api.nvim_create_user_command("TStart", function(opts)
    tmux.spawn(opts.fargs[1])
end, {nargs = 1})

vim.api.nvim_create_user_command("TSetRun", function(opts)
    tmux.set_default_program(opts.fargs[1])
end, {nargs = 1})

vim.api.nvim_create_user_command("TRun", function(opts)
    tmux.run(opts.fargs[1])
end, {nargs = "?"})

