return{
 {
    "mbbill/undotree",
    config = function()
    vim.g.undotree_WindowLayout = 3 -- Poner Undotree a la derecha
    vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })
    end
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
}
