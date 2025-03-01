require("kanagawa").setup({
  overrides = function(colors)
    local overrides = {}

    -- Aplicar el color naranja al grupo "Type"
    overrides.Type = { fg = "#FFA500" } -- Naranja

    return overrides
  end,
})

-- Aplicar el tema
vim.cmd("colorscheme kanagawa")
