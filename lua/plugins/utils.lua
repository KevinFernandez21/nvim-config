return{
    {
        'akinsho/toggleterm.nvim'
    },
    {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",

	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			preset = "enter",
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		completion = {
			menu = {
				auto_show = function(ctx)
					return ctx.mode ~= "cmdline"
				end,
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", gap = 1, "kind" } },
				},
			},

			accept = { auto_brackets = { enabled = true } },
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
				},
			},
		},

		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
    },
     {
  "hrsh7th/nvim-cmp", -- Plugin principal de autocompletado
  dependencies = {
    "hrsh7th/cmp-buffer", -- Fuente de autocompletado para el buffer actual
    "hrsh7th/cmp-path", -- Fuente de autocompletado para rutas de archivos
    "hrsh7th/cmp-nvim-lsp", -- Fuente de autocompletado para LSP
    "saadparwaiz1/cmp_luasnip", -- Integración con luasnip
    "L3MON4D3/LuaSnip", -- Plugin de snippets
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- Integración con luasnip
        end,
      },
      mapping = {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Deshabilita la confirmación con <C-y>
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar selección
       },
      sources = cmp.config.sources({
            { name = "nvim_lsp" }, -- Autocompletado desde LSP
            { name = "luasnip" }, -- Autocompletado desde snippets
            { name = "buffer" }, -- Autocompletado desde el buffer
            { name = "path" }, -- Autocompletado desde rutas de archivos
         }),
        })
        end,
    },
    {
        'jpalardy/vim-slime',
        config = function()
            vim.g.slime_target = "tmux" -- O "neovim" si prefieres usar el terminal integrado
        end
    },
    {
        "hrsh7th/nvim-cmp", -- Plugin principal de autocompletado
        dependencies = {
        "hrsh7th/cmp-buffer", -- Fuente de autocompletado para el buffer actual
        "hrsh7th/cmp-path", -- Fuente de autocompletado para rutas de archivos
        "hrsh7th/cmp-nvim-lsp", -- Fuente de autocompletado para LSP
        "saadparwaiz1/cmp_luasnip", -- Integración con luasnip
        "L3MON4D3/LuaSnip", -- Plugin de snippets
    },
    config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- Integración con luasnip
        end,
      },
      mapping = {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Deshabilita la confirmación con <C-y>
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar selección
       },
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- Autocompletado desde LSP
        { name = "luasnip" }, -- Autocompletado desde snippets
        { name = "buffer" }, -- Autocompletado desde el buffer
        { name = "path" }, -- Autocompletado desde rutas de archivos
      }),
    })
    end,
   },
     {
        'jpalardy/vim-slime',
        config = function()
            vim.g.slime_target = "tmux" -- O "neovim" si prefieres usar el terminal integrado
        end
    },

}
