local M = {}
local settings = {
    default_program = "ls"
}

M.new_win = function()
    vim.system({"tmux", "new-window"}, {text = true}, on_proc_ex)
end

M.start_vim_session = function()
    local check_session_cmd = vim.fn.split([[tmux has-session -t vim_session]])
    local start_session_cmd = vim.fn.split([[tmux new-session -d -s vim_session]])
    local tmux_sub_cmd = [[tmux source-file ~/.config/nvim/tmux.conf]]
    table.insert(start_session_cmd, tmux_sub_cmd)
    -- print(vim.inspect(start_session_cmd))
    local check_ses_job = vim.system(check_session_cmd, {text = true}):wait()
    if check_ses_job.code ~= 0 then
        local start_ses_job = vim.system(start_session_cmd, {text = true}):wait()
        if start_ses_job.code ~= 0 then
            print(start_ses_job.stderr)
        end

    end
end

M.set_default_program = function(prog)
    settings.default_program = prog
end

M.run = function(cmd)
    cmd = cmd or settings.default_program
    tmux_select = {"tmux", "select-window", "-tvim_session:vim_run"}
    tmux_cmd = {"tmux", "send-keys", cmd, "Enter"}
    vim.system(tmux_select):wait()
    vim.system(tmux_cmd):wait()
end

M.compile = function(cmd)
    local tmux_select = {"tmux", "select-window", "-tvim_session:vim_compile"}
    local tmux_cmd = {"tmux", "send-keys", cmd, "Enter"}
    vim.system(tmux_select):wait()
    vim.system(tmux_cmd):wait()
end

M.spawn = function(shell_cmd)
    local tmux_spawn = {"tmux", "new-window", "-tvim_session:", shell_cmd}
    vim.system(tmux_spawn):wait()
end

return M
