local function check_terminal()
    local terminal_chans = {}
    for _,chan in pairs(vim.api.nvim_list_chans()) do
        if chan["mode"] == "terminal" and chan["pty"] ~= "" then
            if vim.fn.getbufinfo(chan["buffer"])[1].hidden ~= 1 then
                table.insert(terminal_chans,chan)
            end
        end
    end
    return terminal_chans
end

local function get_terminal_id()
    local next = next
    if next(check_terminal()) == nil then
        vim.cmd('vsplit')
        vim.cmd('wincmd l')
        vim.cmd('terminal')
        vim.cmd('wincmd p')
    end
    return check_terminal()[1]["id"]
end

function Pyterm()
    local terminal_id = get_terminal_id()
    local dir = vim.fn.expand('%:h')
    local fname = vim.fn.expand('%:t')
    local cmd_chd = "cd "..vim.fn.fnameescape(dir).."\n"
    vim.api.nvim_chan_send(terminal_id,cmd_chd)
    local cmd_run = "python3 "..fname.."\n"
    vim.api.nvim_chan_send(terminal_id,cmd_run)
end

