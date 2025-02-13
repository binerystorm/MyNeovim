function tmux_new_win()
    vim.system({"tmux", "new-window"}, {text = true}, on_proc_ex)
end

function tmux_start_vim_session()
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

function tmux_run(cmd)
    tmux_select = {"tmux", "select-window", "-tvim_session:vim_run"}
    tmux_cmd = {"tmux", "send-keys", cmd, "Enter"}
    vim.system(tmux_select):wait()
    vim.system(tmux_cmd):wait()
end

function tmux_compile(cmd)
    local tmux_select = {"tmux", "select-window", "-tvim_session:vim_compile"}
    local tmux_cmd = {"tmux", "send-keys", cmd, "Enter"}
    vim.system(tmux_select):wait()
    vim.system(tmux_cmd):wait()
end

function tmux_spawn(shell_cmd)
    local tmux_spawn = {"tmux", "new-window", "-tvim_session:", shell_cmd}
    vim.system(tmux_spawn):wait()
end

vim.api.nvim_create_user_command("Twin", tmux_new_win, {})


