return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap", -- Plugin principal de DAP
    "nvim-neotest/nvim-nio", -- Dependencia para operaciones asíncronas
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Configuración de nvim-dap-ui
    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          position = "bottom",
          size = 10,
        },
      },
    })

    -- Configuración de adaptadores DAP para cada lenguaje
    dap.adapters = {
      -- C/C++
      c = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" },
      },
      -- Python
      python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      },
      -- Java
      java = {
        type = "executable",
        command = "java",
        args = { "-jar", "path/to/java-debug-server.jar" }, -- Ajusta la ruta al servidor de depuración de Java
      },
      -- JavaScript/Node.js
      node = {
        type = "executable",
        command = "node",
        args = { "path/to/node-debug2.js" }, -- Ajusta la ruta al adaptador de depuración de Node.js
      },
      -- Rust
      rust = {
        type = "executable",
        command = "lldb-vscode", -- Asegúrate de tener instalado lldb-vscode
      },
      -- C#
      cs = {
        type = "executable",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
      },
      -- Kotlin
      kotlin = {
        type = "executable",
        command = "kotlin-debug-adapter", -- Asegúrate de tener instalado el adaptador de Kotlin
      },
      -- Dart/Flutter
      dart = {
        type = "executable",
        command = "dart",
        args = { "debug_adapter" },
      },
      -- R
      r = {
        type = "executable",
        command = "R",
        args = { "--vanilla", "-e", "languageserver::run()" },
      },
    }

    -- Configuraciones DAP para cada lenguaje
    dap.configurations = {
      -- C/C++
      c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      },
      -- Python
      python = {
        {
          name = "Launch",
          type = "python",
          request = "launch",
          program = "${file}",
          pythonPath = function()
            return "/usr/bin/python3" -- Ajusta la ruta a tu intérprete de Python
          end,
        },
      },
      -- Java
      java = {
        {
          name = "Launch",
          type = "java",
          request = "launch",
          mainClass = "${file}",
          projectName = "${workspaceFolder}",
        },
      },
      -- JavaScript/Node.js
      javascript = {
        {
          name = "Launch",
          type = "node",
          request = "launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      },
      -- Rust
      rust = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
        },
      },
      -- C#
      cs = {
        {
          name = "Launch",
          type = "coreclr",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
        },
      },
      -- Kotlin
      kotlin = {
        {
          name = "Launch",
          type = "kotlin",
          request = "launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      },
      -- Dart/Flutter
      dart = {
        {
          name = "Launch",
          type = "dart",
          request = "launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      },
      -- R
      r = {
        {
          name = "Launch",
          type = "R",
          request = "launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      },
    }

    -- Atajos de teclado para depuración
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Iniciar/continuar depuración" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Paso por encima" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Paso hacia adentro" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Paso hacia afuera" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Alternar punto de interrupción" })
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Alternar interfaz de depuración" })
  end,
}
