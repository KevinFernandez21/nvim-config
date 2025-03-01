return{
  {
   "stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        python = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        java = { "google-java-format" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        cs = { "csharpier" },
        rust = { "rustfmt" },
        kotlin = { "ktlint" },
        dart = { "dartfmt" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        sql = { "sqlfmt" },
        r = { "styler" },
        htmldjango = { "djlint" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		-- Customize formatters
		formatters = {
			djlint = {
				args = { "--reformat", "--indent", "2", "-" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,  
  },
  {
        "mason.nvim" 
  },
}
