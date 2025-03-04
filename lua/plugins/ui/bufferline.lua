return{
     {
    "famiu/bufdelete.nvim",
    event = "VeryLazy", -- Cargar el plugin de manera diferida
  },
 {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
    config = function()
      require("bufferline").setup({
        options = {
          close_command = function(bufnum) require("bufdelete").bufdelete(bufnum, true) end,
          right_mouse_command = function(bufnum) require("bufdelete").bufdelete(bufnum, true) end,
          left_mouse_command = "buffer %d",
          indicator = { icon = "▎", style = "icon" },
          buffer_close_icon = "",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          diagnostics = "nvim_lsp",
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          separator_style = "slant",
          always_show_bufferline = true,
          sort_by = "insert_after_current",
        },
      })

      -- Atajos de teclado
      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>bd", function() require("bufdelete").bufdelete(0, true) end, { noremap = true, silent = true })
    end,
  },
}

