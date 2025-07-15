local status, dap = pcall(require, "dap")
if not status then
    return
end

local status2, dapui = pcall(require, "dapui")
if not status2 then
    return
end

local status3, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not status3 then
    return
end

-- Setup virtual text
dap_virtual_text.setup()

-- Setup DAP UI
dapui.setup({
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.33 },
                { id = "breakpoints", size = 0.17 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
            },
            size = 0.33,
            position = "right",
        },
        {
            elements = {
                { id = "repl", size = 0.45 },
                { id = "console", size = 0.55 },
            },
            size = 0.27,
            position = "bottom",
        },
    },
})

-- Automatically open DAP UI when debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

-- Automatically close DAP UI when debugging ends
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Python debugging configuration
dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy" },
}

dap.configurations.python = {
    {
        name = "Launch file",
        type = "python",
        request = "launch",
        program = "${file}",
        console = "integratedTerminal",
    },
    {
        name = "Launch module",
        type = "python",
        request = "launch",
        module = "main",
        console = "integratedTerminal",
    },
}

-- JavaScript/TypeScript debugging configuration
dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
}

dap.configurations.javascript = {
    {
        name = "Launch file",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
    },
}

dap.configurations.typescript = {
    {
        name = "Launch file",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
    },
}

-- Go debugging configuration
dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
    },
}

dap.configurations.go = {
    {
        name = "Launch file",
        type = "delve",
        request = "launch",
        program = "${file}",
    },
    {
        name = "Launch package",
        type = "delve",
        request = "launch",
        program = "${workspaceFolder}",
    },
}

-- Rust debugging configuration
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
    },
}

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

-- Keymaps for debugging
local keymap = vim.keymap

-- Debug keymaps
keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue debugging" })
keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
keymap.set("n", "<leader>du", dap.step_out, { desc = "Step out" })
keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last debugger" })
keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Toggle debug UI" }) 