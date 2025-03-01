return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        -- Configuración básica de Mason
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- Instalar LSPs, linters y formateadores
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- LSPs
          "pyright",                  -- Python
          "jdtls",                    -- Java
          "tsp_server",                 -- JavaScript/TypeScript (Node.js, Deno)
          "denols",                   -- Deno (alternativa a tsserver para Deno)
          "angularls",                -- Angular
          "rust_analyzer",            -- Rust
          "omnisharp",                -- C# (.NET)
          "kotlin_language_server",   -- Kotlin
          "ast_grep",                   -- Dart/Flutter
          "sqlls",                    -- SQL (para MySQL, PostgreSQL, etc.)
          "lua_ls",                   -- Lua
          "bashls",                   -- Bash
          "r_language_server",        -- R
          "clangd",                   -- C/C++
        },
        automatic_installation = true, -- Instalación automática de LSPs
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre", -- Cargar el plugin cuando se lea un archivo
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Configurar keymaps del LSP
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf

          -- Opciones para los keymaps
          local opts = { buffer = bufnr }

          -- Cambiar un keymap existente
          vim.keymap.set("n", "K", "<cmd>echo 'hello'<cr>", opts)

          -- Deshabilitar un keymap existente
          vim.keymap.set("n", "K", false, opts)

          -- Agregar un nuevo keymap
          vim.keymap.set("n", "H", "<cmd>echo 'hello'<cr>", opts)

          -- Keymaps adicionales del LSP
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Ir a la definición
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Mostrar referencias
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Acciones de código
        end,
      })

      -- Configurar servidores LSP
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lista de servidores LSP que deseas configurar
      local servers = { "pyright", "ts_ls", "rust_analyzer", "gopls" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end
    end,
  },
  {
    -- Plugin para gestionar dependencias de Python
    "PieterjanMontens/vim-pipenv",
    ft = "python",  -- Solo se carga para archivos Python
  },
  {
    "jmcantrell/vim-virtualenv",
  }, 
  {
	"ErickKramer/nvim-ros2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
    opts = {
        -- Add any custom options here
			autocmds = true,
			telescope = true,
			treesitter = true,
    }
  },
    {
        -- Plugin para trabajar con bases de datos (SQL)
        "tpope/vim-dadbod",
        ft = "sql",  -- Solo se carga para archivos SQL
    },
}
