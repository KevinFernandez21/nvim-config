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

-- Mostrar información de la función bajo el cursor
keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Mostrar información' })

-- Ir a la definición
keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Ir a la definición' })

-- Ir a la declaración
keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Ir a la declaración' })

-- Mostrar referencias
keymap('n', 'gr', vim.lsp.buf.references, { desc = 'Mostrar referencias' })

-- Renombrar símbolo
keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Renombrar símbolo' })

-- Mostrar acciones de código
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Acciones de código' })

-- Formatear el archivo actual
keymap('n', '<leader>fm', vim.lsp.buf.format, { desc = 'Formatear archivo' })

-- Iniciar/continuar la depuración
keymap('n', '<leader>dc', require('dap').continue, { desc = 'Iniciar/continuar depuración' })

-- Establecer/eliminar breakpoint
keymap('n', '<leader>db', require('dap').toggle_breakpoint, { desc = 'Establecer breakpoint' })

-- Paso a paso por instrucción
keymap('n', '<leader>ds', require('dap').step_over, { desc = 'Paso a paso por instrucción' })

-- Paso a paso dentro de la función
keymap('n', '<leader>di', require('dap').step_into, { desc = 'Paso a paso dentro de la función' })

-- Paso a paso fuera de la función
keymap('n', '<leader>do', require('dap').step_out, { desc = 'Paso a paso fuera de la función' })

-- Abrir el dashboard
keymap('n', '<leader>d', ':Alpha<CR>', { desc = 'Abrir dashboard' })

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
