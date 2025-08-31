-- on windows
-- you have to :set noshellslash
-- or netcoredbg is unable to find breakpoints
-- https://github.com/mfussenegger/nvim-dap/issues/1337#issuecomment-2361039620
--
local keymap_restore = {}

local remove_keymap = function(buf, keymap, char)
  print(keymap.lhs)
  if keymap.lhs == char then
    table.insert(keymap_restore, keymap)
    vim.api.nvim_buf_del_keymap(buf, "n", char)
  end
end

local on_init = function()
  for _, buf in pairs(vim.api.nvim_list_bufs()) do
    local keymaps = vim.api.nvim_buf_get_keymap(buf, "n")
    for _, keymap in pairs(keymaps) do
      remove_keymap(buf, keymap, "L")
      remove_keymap(buf, keymap, "J")
      remove_keymap(buf, keymap, "H")
    end
  end
  vim.api.nvim_set_keymap("n", "J", "<cmd>lua require('dap').step_over()<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "L", "<cmd>lua require('dap').step_into()<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "H", "<cmd>lua require('dap').step_out()<cr>", { silent = true })
end

local on_terminate = function()
  vim.cmd("nunmap H")
  vim.cmd("nunmap J")
  vim.cmd("nunmap L")
  for _, keymap in pairs(keymap_restore) do
    if keymap.rhs then
      vim.api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs, { silent = keymap.silent == 1 })
    elseif keymap.callback then
      vim.keymap.set(keymap.mode, keymap.lhs, keymap.callback, { buffer = keymap.buffer, silent = keymap.silent == 1 })
    end
  end
  keymap_restore = {}
end

local apply_fix = function()
  -- print(vim.uv.os_uname().sysname)
  vim.cmd("set noshellslash")
end

local is_windows = function()
  return vim.fn.has("win32") == 1
end

local run_debug = function()
  local dap = require("dap")
  if is_windows() then
    apply_fix()
  end
  dap.continue()
end

local getDebuggerExecutable = function()
  if is_windows() then
    return "C:\\Users\\Simeon\\AppData\\Local\\nvim-data\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe"
  else
    -- return "netcoredbg"
    return "/home/simeon/.local/share/nvim/mason/bin/netcoredbg"
  end
end

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "Error",
        linehl = "",
        numhl = "",
        culhl = "Error",
      })

      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.set_log_level("DEBUG")
      dap.adapters.coreclr = {
        type = "executable",
        command = getDebuggerExecutable(),
        args = { "--interpreter=vscode" },
      }
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Attach to process",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }
      dap.listeners.after["event_initialized"]["me"] = on_init
      dap.listeners.after["event_terminated"]["me"] = on_terminate
      dap.listeners.before.attach.dapui_config = dapui.open
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
    keys = function()
      local dap = require("dap")
      -- local dapui = require("dapui")
      local mappings = {
        { "<leader>dc", run_debug, { desc = "Run debug" } },
        { "<leader>dt", dap.terminate, { desc = "Stop" } },
        { "<leader>db", dap.toggle_breakpoint, { desc = "Set breakpoint" } },
        -- { "<leader>dj", dap.step_over, { desc = "Step Over" } },
        -- { "<leader>dl", dap.step_into, { desc = "Step Into" } },
        -- { "<leader>dk", dap.step_out, { desc = "Step Out" } },
      }
      return mappings
    end,
  },
}
-- config references missing adapter 'netcoredbg'. Available are: coreclr
