local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({

	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"css",
		"fish",
		"html",
		"javascript",
		"java",
		"lua",
		"php",
		"python",
		"regex",
		"ruby",
		"toml",
		"tsx",
		"typescript",
		"yaml",
	},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = true,
	},
	autopairs = { enable = true },
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = true,
	},
	rainbow = {
		enable = false,
		-- disable = { 'jsx', 'cpp' },
		extended_mode = true,
		max_file_lines = nil,
		-- colors = {},
		-- termcolors = {}
	},

	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"glimmer",
			"handlebars",
			"hbs",
		},
	},

	refactor = {
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
			highlight_definitions = {
				enable = true,
				-- Set to false if you have an `updatetime` of ~100.
				clear_on_cursor_move = true,
			},
			highlight_current_scope = { enable = true },
			navigation = {
				enable = true,
				keymaps = {
					goto_definition = "gnd",
					list_definitions = "gnD",
					list_definitions_toc = "gO",
					goto_next_usage = "<a-*>",
					goto_previous_usage = "<a-#>",
				},
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<A-]>",
				goto_previous_usage = "<A-[>",
			},
		},
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
