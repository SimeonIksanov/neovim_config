-- on windows
-- you have to :set noshellslash
-- or netcoredbg is unable to find breakpoints
-- https://github.com/mfussenegger/nvim-dap/issues/1337#issuecomment-2361039620
--
local keymap_saved = {}

local save_keymaps = function(keys)
  keymap_saved = {}
  local bufferIds = vim.api.nvim_list_bufs()
  for _, bufferId in pairs(bufferIds) do
    for _, bufferKeymap in pairs(vim.api.nvim_buf_get_keymap(bufferId, "n")) do
      for _, key in pairs(keys) do
        if bufferKeymap.lhs == key then
          table.insert(keymap_saved, bufferKeymap)
        end
      end
    end
  end
end

local remove_keymaps = function(keys)
  local bufferIds = vim.api.nvim_list_bufs()
  for _, bufferId in pairs(bufferIds) do
    for _, bufferKeymap in pairs(vim.api.nvim_buf_get_keymap(bufferId, "n")) do
      for _, key in pairs(keys) do
        if bufferKeymap.lhs == key then
          vim.api.nvim_buf_del_keymap(bufferId, "n", key)
        end
      end
    end
  end

  for _, key in pairs(keys) do
    vim.api.nvim_del_keymap("n", key)
  end
end

local restore_keymaps = function()
  for _, keymap in pairs(keymap_saved) do
    if keymap.rhs then
      vim.api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs, { silent = keymap.silent == 1 })
    elseif keymap.callback then
      vim.keymap.set(keymap.mode, keymap.lhs, keymap.callback, { buffer = keymap.buffer, silent = keymap.silent == 1 })
    end
  end
  keymap_restore = {}
end

local on_init = function()
  save_keymaps({ "H", "J", "L" })
  vim.api.nvim_set_keymap("n", "J", "<cmd>lua require('dap').step_over()<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "L", "<cmd>lua require('dap').step_into()<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "H", "<cmd>lua require('dap').step_out()<cr>", { silent = true })
end

local on_terminate = function()
  remove_keymaps({ "H", "J", "L" })
  restore_keymaps()
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
      dapui.setup({
        controls = { enabled = false },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 1 },
            },
            position = "bottom",
            size = 10,
          },
        },
      })
      -- dap.set_log_level("DEBUG")
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
      dap.listeners.before.launch.dapui_config = dapui.open
      dap.listeners.before.event_terminated.dapui_config = dapui.close
      dap.listeners.before.event_exited.dapui_config = dapui.close
    end,
    keys = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local mappings = {
        { "<leader>dc", run_debug, { desc = "Run debug" } },
        { "<leader>dt", dap.terminate, { desc = "Stop" } },
        { "<leader>du", dapui.toggle, { desc = "Toggle UI" } },
        { "<leader>de", dapui.eval, { desc = "Evaluate expression", mode = { "n", "v" } } },
        { "<leader>db", dap.toggle_breakpoint, { desc = "Set breakpoint" } },
      }
      return mappings
    end,
  },
}
