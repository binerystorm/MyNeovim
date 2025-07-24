vim.api.nvim_create_autocmd('FileType', {
    -- This handler will fire when the buffer's 'filetype' is "python"
    pattern = 'rust',
    callback = function(ev)
        
        vim.lsp.start({
            name = 'rusty',
            cmd = {'rust-analyzer'},
            root_dir = vim.fs.root(ev.buf, {'main.rs', 'Cargo.toml'}),
        })
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    -- This handler will fire when the buffer's 'filetype' is "python"
    pattern = 'python',
    callback = function(ev)
        vim.lsp.start({
            name = 'pyright',
            cmd = {'pylsp'},
            root_dir = vim.fs.root(ev.buf, {'setup.py', 'pyproject.toml', '.git'}),
        })
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    -- This handler will fire when the buffer's 'filetype' is "python"
    pattern = 'c',
    callback = function(ev)
        vim.lsp.start({
            name = 'cbaby',
            cmd = {'ccls'},
            root_dir = vim.fs.root(ev.buf, {'.ccls', '.git', 'main.c'}),
        })
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        print("lsp running...")
    end
})
