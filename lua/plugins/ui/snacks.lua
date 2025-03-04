return{
     {
    "snacks.nvim",
    opts = {
     indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = false }, -- se configura en otro archivo si es necesario
      toggle = { map = vim.keymap.set }, -- Se usa la función nativa de Neovim
      words = { enabled = true },
    },
    -- stylua: ignore
    keys = {
    {
      "<leader>n",
      function()
        if Snacks.config.picker and Snacks.config.picker.enabled then
          Snacks.picker.notifications()
        else
          Snacks.notifier.show_history()
        end
      end,
      desc = "Notification History",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
      },
    },
  },

}
