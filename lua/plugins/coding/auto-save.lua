return{
     {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true, -- Habilitar el plugin
      execution_message = {
        message = function()
          return "Auto-saved at " .. vim.fn.strftime("%H:%M:%S")
        end,
        dim = 0.18, -- Opacidad del mensaje
        cleaning_interval = 1000, -- Tiempo en milisegundos para limpiar el mensaje 1 sg
      },
      trigger_events = { "InsertLeave", "TextChanged" }, -- Eventos que activan el auto-guardado
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if fn.getbufvar(buf, "&modifiable") == 1 and
           utils.not_in(fn.getbufvar(buf, "&filetype"), { "NvimTree", "TelescopePrompt" }) then
          return true -- Solo guardar buffers modificables y excluir ciertos tipos de archivos
        end
        return false
      end,
    })
  end,
  }
}
