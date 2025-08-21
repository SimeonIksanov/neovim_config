-- this is very important !!!
-- on windows 
-- you have to :set noshellslash
-- or netcoredbg is unable to find breakpoints
-- https://github.com/mfussenegger/nvim-dap/issues/1337#issuecomment-2361039620
--

local apply_fix = function()
  vim.cmd("set noshellslash")
end

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
   config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.set_log_level('DEBUG')
      dap.adapters.coreclr = {
        type = "executable",
        command = "C:\\Users\\Simeon\\AppData\\Local\\nvim-data\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe",
        -- command = "netcoredbg.cmd",
        args = { "--interpreter=vscode" },
      }
      dap.configurations.cs = {
        -- {
        --   type = "coreclr",
        --   name = "launch - netcoredbg",
        --   request = "launch",
        --   program = function()
        --     return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
        --   end,
        -- },
      }
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
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
        { "<leader>dc", function() apply_fix() dap.continue() end, {} },
        { "<leader>dt", dap.terminate, { desc = "Stop" } },
        { "<leader>db", dap.toggle_breakpoint, { desc = "Set breakpoint" } },
        { "<leader>dj", dap.step_over, { desc = "Step Over" } },
        { "<leader>dl", dap.step_into, { desc = "Step Into" } },
        { "<leader>dk", dap.step_out, { desc = "Step Out" } },
      }
      return mappings
    end,
  },
}
