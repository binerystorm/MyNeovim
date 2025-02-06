if vim.g.neovide then
    vim.g.neovide_transparency = 0.8
    vim.keymap.set("n", "<F6>", function ()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end)
    vim.keymap.set("n", "<C-+>", function ()
        vim.g.neovide_scale_factor =  vim.g.neovide_scale_factor + 0.05;
    end)
    vim.keymap.set("n", "<C-->", function ()
        vim.g.neovide_scale_factor =  vim.g.neovide_scale_factor - 0.05;
    end)
    vim.opt.guifont = "OpenDyslexicMono:h10"
end
