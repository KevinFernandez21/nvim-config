 return{
    {
        "uga-rosa/ccc.nvim",
        config = function()
        require("ccc").setup({
        highlighter = {
        auto_enable = true, -- Habilitar resaltado automático de colores
        lsp = true, -- Usar LSP para detección de colores en archivos soportados
        },
        mappings = {
        ["<C-c>"] = "Close", -- Cierra el selector de colores
        ["<CR>"] = "Accept", -- Aplica el color seleccionado
        },
        })
        end,
    }
 }
