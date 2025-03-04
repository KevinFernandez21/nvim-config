return{
    {
    "echasnovski/mini.surround",
    version = false,
    event = "VeryLazy",
    config = function()
        require("mini.surround").setup({
            mappings = {
                add = "su",
            },
        })
    end,
  },
}
