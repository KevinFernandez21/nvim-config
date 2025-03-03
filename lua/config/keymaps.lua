local keymap = vim.keymap.set

-- Guardar archivo
keymap('n', '<leader>s', ':w<CR>', { desc = 'Guardar archivo' })

-- Salir de Neovim
keymap('n', '<leader>q', ':q<CR>', { desc = 'Salir de Neovim' })

-- Guardar y salir
keymap('n', '<leader>wq', ':wq<CR>', { desc = 'Guardar y salir' })

-- Recargar configuración de Neovim
keymap('n', '<leader>r', ':source $MYVIMRC<CR>', { desc = 'Recargar configuración' })

-- Insertar una nueva línea sin entrar en modo de inserción
keymap('n', '<leader>o', 'o<Esc>', { desc = 'Insertar línea abajo' })
keymap('n', '<leader>O', 'O<Esc>', { desc = 'Insertar línea arriba' })

-- Navegar entre buffers
keymap('n', '<leader>bn', ':bnext<CR>', { desc = 'Siguiente buffer' })
keymap('n', '<leader>bp', ':bprevious<CR>', { desc = 'Buffer anterior' })
keymap('n', '<leader>bd', ':bdelete<CR>', { desc = 'Cerrar buffer' })

-- Dividir ventanas
keymap('n', '<leader>v', ':vsplit<CR>', { desc = 'Dividir verticalmente' })
keymap('n', '<leader>h', ':split<CR>', { desc = 'Dividir horizontalmente' })

-- Navegar entre ventanas
keymap('n', '<C-h>', '<C-w>h', { desc = 'Mover a la ventana izquierda' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Mover a la ventana inferior' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Mover a la ventana superior' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Mover a la ventana derecha' })

-- Navegar entre buffers
keymap('n', '<leader>bn', ':bnext<CR>', { desc = 'Siguiente buffer' })
keymap('n', '<leader>bp', ':bprevious<CR>', { desc = 'Buffer anterior' })
keymap('n', '<leader>bd', ':bdelete<CR>', { desc = 'Cerrar buffer' })

-- Dividir ventanas
keymap('n', '<leader>v', ':vsplit<CR>', { desc = 'Dividir verticalmente' })
keymap('n', '<leader>h', ':split<CR>', { desc = 'Dividir horizontalmente' })

-- Navegar entre ventanas
keymap('n', '<C-h>', '<C-w>h', { desc = 'Mover a la ventana izquierda' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Mover a la ventana inferior' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Mover a la ventana superior' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Mover a la ventana derecha' })

-- Buscar archivos
keymap('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Buscar archivos' })

-- Buscar texto en el proyecto
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Buscar texto en el proyecto' })

-- Buscar buffers abiertos
keymap('n', '<leader>fb', ':Telescope buffers<CR>', { desc = 'Buscar buffers' })

-- Buscar archivos recientes
keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', { desc = 'Archivos recientes' })

-- Buscar ayuda
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { desc = 'Buscar ayuda' })


-- Abrir una terminal en una ventana flotante
keymap('n', '<leader>tt', ':ToggleTerm<CR>', { desc = 'Abrir terminal flotante' })

-- Enviar línea actual a la terminal
keymap('n', '<leader>tl', ':ToggleTermSendCurrentLine<CR>', { desc = 'Enviar línea a la terminal' })

-- Enviar selección a la terminal
keymap('v', '<leader>ts', ':ToggleTermSendVisualSelection<CR>', { desc = 'Enviar selección a la terminal' })

-- Abrir Git status
keymap('n', '<leader>gs', ':Git status<CR>', { desc = 'Git status' })

-- Abrir Git diff
keymap('n', '<leader>gd', ':Git diff<CR>', { desc = 'Git diff' })

-- Hacer commit
keymap('n', '<leader>gc', ':Git commit<CR>', { desc = 'Git commit' })

-- Hacer push
keymap('n', '<leader>gp', ':Git push<CR>', { desc = 'Git push' })

keymap("n", "<leader>pv", vim.cmd.Ex)
keymap("n", "<CR>", "<Nop>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-x>", '"+d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })
