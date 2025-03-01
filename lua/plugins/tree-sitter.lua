return {
    {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- Última versión es demasiado antigua y no funciona en Windows
    build = ":TSUpdate", -- Comando para actualizar los parsers
    event = { "BufReadPost", "BufNewFile" }, -- Cargar treesitter después de abrir un archivo
    lazy = vim.fn.argc(-1) == 0, -- Cargar treesitter temprano al abrir un archivo desde la línea de comandos
    init = function(plugin)
      -- Añadir consultas de nvim-treesitter al runtime path (rtp) y sus predicados de consulta personalizados
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" }, -- Comandos para actualizar e instalar parsers
    keys = {
      { "<c-space>", desc = "Increment Selection" }, -- Keymap para incrementar selección
      { "<bs>", desc = "Decrement Selection", mode = "x" }, -- Keymap para decrementar selección
    },
    opts = {
      highlight = { enable = true }, -- Habilitar resaltado de sintaxis
      indent = { enable = true }, -- Habilitar indentación automática
      ensure_installed = { -- Lista de parsers a instalar automáticamente
        "bash",
        "c",
        "cpp",
        "c_sharp",
        "python",
        "java",
        "javascript",
        "typescript",
        "lua",
        "rust",
        "kotlin",
        "r",
        "dart",
        "vue",
        "angular",
        "sql",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "json",
        "yaml",
        "vim",
        "vimdoc",
        "query",
      },
      sync_install = false, -- Instalación asíncrona
      auto_install = true, -- Instalación automática de parsers
      incremental_selection = { -- Configuración de selección incremental
        enable = true,
        keymaps = {
          init_selection = "gnn", -- Iniciar selección
          node_incremental = "grn", -- Incrementar selección
          scope_incremental = "grc", -- Incrementar selección por ámbito
          node_decremental = "grm", -- Decrementar selección
        },
      },
      textobjects = { -- Configuración de objetos de texto
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
      folding = { -- Configuración de folding (plegado de código)
        enable = true, -- Habilitar folding basado en la sintaxis
      },
      context_highlighting = { -- Resaltado de contexto
        enable = true, -- Habilitar resaltado de contexto
      },
    },
    config = function(_, opts)
      -- Eliminar duplicados en ensure_installed (sin LazyVim.dedup)
      if type(opts.ensure_installed) == "table" then
        local seen = {}
        opts.ensure_installed = vim.tbl_filter(function(parser)
          if not seen[parser] then
            seen[parser] = true
            return true
          end
          return false
        end, opts.ensure_installed)
      end

      -- Configurar nvim-treesitter
      require("nvim-treesitter.configs").setup(opts)
    end,
    },  
    {
     "windwp/nvim-ts-autotag",
     event = "BufReadPost",
     opts = {},
    },
    {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufReadPost", -- Cargar después de abrir un archivo
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Dependencia de nvim-treesitter
    config = function()
      -- Configurar textobjects
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer", -- Seleccionar una función
              ["if"] = "@function.inner", -- Seleccionar el cuerpo de una función
              ["ac"] = "@class.outer", -- Seleccionar una clase
              ["ic"] = "@class.inner", -- Seleccionar el cuerpo de una clase
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer", -- Ir al inicio de la siguiente función
              ["]c"] = "@class.outer", -- Ir al inicio de la siguiente clase
            },
            goto_next_end = {
              ["]F"] = "@function.outer", -- Ir al final de la siguiente función
              ["]C"] = "@class.outer", -- Ir al final de la siguiente clase
            },
            goto_previous_start = {
              ["[f"] = "@function.outer", -- Ir al inicio de la función anterior
              ["[c"] = "@class.outer", -- Ir al inicio de la clase anterior
            },
            goto_previous_end = {
              ["[F"] = "@function.outer", -- Ir al final de la función anterior
              ["[C"] = "@class.outer", -- Ir al final de la clase anterior
            },
          },
        },
      })
      end,
    },
    {
    "folke/which-key.nvim",
        opts = {
        spec = {
                { "<BS>", desc = "Decrement Selection", mode = "x" },
                { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
            },
        },
    }

}
