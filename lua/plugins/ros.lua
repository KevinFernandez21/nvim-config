return {
    {
        'tadachs/ros-nvim',
        config = function()
            require("ros-nvim").setup({
                lazy_load_package_list = true,
                telescope = {
                    ws_filter = "current",
                },
                treesitter = {
                    enabled = true,
                },
                commands = {
                    enabled = true,
                },
                autocmds = {
                    enabled = true,
                },
            })
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Mapeos de teclas para ros-nvim
    vim.keymap.set('n', '<leader>tr', '<cmd>Telescope ros ros<cr>', { noremap = true }),
    vim.keymap.set('n', '<leader>rol', function() require("ros-nvim.ros").open_launch_include() end, { silent = true, noremap = true }),
    vim.keymap.set('n', '<leader>rdi', function() require("ros-nvim.ros").show_interface_definition() end, { silent = true, noremap = true }),
}
