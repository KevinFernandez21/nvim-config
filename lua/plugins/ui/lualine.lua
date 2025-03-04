return{
     {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- Cargar el plugin de manera diferida
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- Establecer una línea de estado vacía hasta que lualine se cargue
        vim.o.statusline = " "
      else
        -- Ocultar la línea de estado en la página de inicio
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- Definir iconos personalizados
      local icons = {
        diagnostics = {
          Error = " ",
          Warn = " ",
          Info = " ",
          Hint = " ",
        },
        git = {
          added = " ",
          modified = " ",
          removed = " ",
        },
      }

      -- Restaurar el valor de laststatus
      vim.o.laststatus = vim.g.lualine_laststatus

      -- Configuración de lualine
      local opts = {
        options = {
          theme = "auto", -- Tema automático (se adapta al esquema de colores actual)
          globalstatus = vim.o.laststatus == 3, -- Usar estado global si laststatus es 3
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } }, -- Deshabilitar en ciertos filetypes
        },
 
          sections = {
          lualine_a = { "mode" }, -- Modo actual (normal, inserción, visual, etc.)
          lualine_b = { "branch" }, -- Rama actual de Git
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } }, -- Tipo de archivo
            { "filename" }, -- Nombre del archivo
          },
          lualine_x = {
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } }, -- Progreso en el archivo
            { "location", padding = { left = 0, right = 1 } }, -- Ubicación actual (línea y columna)
          },
          lualine_z = {
            function()
              return " " .. os.date("%R") -- Hora actual
            end,
          },
        },
        extensions = { "neo-tree", "lazy", "fzf" }, -- Extensiones compatibles
      }

      return opts
    end,
    config = function(_, opts)
      require("lualine").setup(opts) -- Configurar lualine
    end,
  }, 
}
