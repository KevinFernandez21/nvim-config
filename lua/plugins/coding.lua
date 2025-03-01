return{ 
    {
    "echasnovski/mini.pairs",
    opts = {
    modes = { insert = true, command = true, terminal = false },
    -- skip autopair when next character is one of these
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    -- skip autopair when the cursor is inside these treesitter nodes
    skip_ts = { "string" },
    -- skip autopair when next character is closing pair
    -- and there are more closing pairs than opening pairs
    skip_unbalanced = true,
    -- better deal with markdown code blocks
    markdown = true,
    },
    config = function(_, opts)
        require("mini.pairs").setup(opts)
    end,
    },
    {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
    },
    {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = function()
    local ai = require("mini.ai")
    return {
      n_lines = 500,
      custom_textobjects = {
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }),
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        d = { "%f[%d]%d+" },
        e = {
          { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]"         },
          "^().*()$",
        },
        u = ai.gen_spec.function_call(),
        U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
      },
    }
    end,
    config = function(_, opts)
        require("mini.ai").setup(opts)
    end,
    },
    {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            { path = "LazyVim", words = { "LazyVim" } },
            { path = "snacks.nvim", words = { "Snacks" } },
            { path = "lazy.nvim", words = { "LazyVim" } },
        },
    },
   },{
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
    }, {
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
  },{
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
   {
			"ThePrimeagen/harpoon",
 			branch = "harpoon2",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				local harpoon = require("harpoon")

				-- REQUIRED
				harpoon:setup()
				-- REQUIRED

				-- basic telescope configuration
				local conf = require("telescope.config").values
				local function toggle_telescope(harpoon_files)
					local file_paths = {}
					for _, item in ipairs(harpoon_files.items) do
						table.insert(file_paths, item.value)
					end

					require("telescope.pickers")
						.new({}, {
							prompt_title = "Harpoon",
							finder = require("telescope.finders").new_table({
								results = file_paths,
							}),
							previewer = conf.file_previewer({}),
							sorter = conf.generic_sorter({}),
						})
						:find()
				end

				vim.keymap.set("n", "<leader>a", function()
					harpoon:list():add()
				end)
				vim.keymap.set("n", "<C-e>", function()
					toggle_telescope(harpoon:list())
				end, { desc = "Open harpoon window" })
				vim.keymap.set("n", "<C-h>", function()
					harpoon:list():select(1)
				end)
				vim.keymap.set("n", "<C-t>", function()
					harpoon:list():select(2)
				end)
				vim.keymap.set("n", "<C-n>", function()
					harpoon:list():select(3)
				end)
				vim.keymap.set("n", "<C-s>", function()
					harpoon:list():select(4)
				end)

				-- Toggle previous & next buffers stored within Harpoon list
				vim.keymap.set("n", "<C-m>", function()
					harpoon:list():prev()
				end)
				vim.keymap.set("n", "<C-q>", function()
					harpoon:list():next()
				end)
			end,
   },
}
