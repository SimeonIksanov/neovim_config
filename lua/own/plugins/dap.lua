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
      dap.adapters.coreclr = {
        type = "executable",
        command = "C:\\Users\\Simeon\\AppData\\Local\\nvim-data\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe",
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
        { "<f5>", dap.continue, {} },
        { "<f17>", dap.terminate, { desc = "Stop" } }, -- shift f5
        { "<f9>", dap.toggle_breakpoint, { desc = "Set breakpoint" } },
        { "<f10>", dap.step_over, { desc = "Step Over" } },
        { "<f11>", dap.step_into, { desc = "Step Into" } },
        { "<f23>", dap.step_out, { desc = "Step Out" } }, -- shift f11
      }
      return mappings
    end,
  },
}
