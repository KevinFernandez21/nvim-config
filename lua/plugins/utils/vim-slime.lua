return{
   {
        'jpalardy/vim-slime',
        config = function()
            vim.g.slime_target = "tmux" -- O "neovim" si prefieres usar el terminal integrado
        end
    },
}
