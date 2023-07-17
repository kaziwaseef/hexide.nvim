local M = {
	{
		"hrsh7th/nvim-cmp",
		event = "BufEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip", --snippet engine
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
		},
		config = function()
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
				return
			end

			local snip_status_ok, luasnip = pcall(require, "luasnip")
			if not snip_status_ok then
				return
			end

			require("luasnip/loaders/from_vscode").lazy_load()

			--   פּ ﯟ   some other good icons
			local kind_icons = {
				Text = "",
				Method = "m",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			}

			local map = require("hexide.osKeyMap").mapping
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = {
					[map.CMD_k] = cmp.mapping.select_prev_item(),
					[map.CMD_j] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
					-- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					-- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
					-- ["<C-e>"] = cmp.mapping {
					--   i = cmp.mapping.abort(),
					--   c = cmp.mapping.close(),
					-- },
					-- Accept currently selected item. If none selected, `select` first item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					[map.CMD_u] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- ["<Tab>"] = cmp.mapping(function(fallback)
					-- 	fallback()
					-- end, {
					-- 	"i",
					-- 	"s",
					-- }),
				},

				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

						vim_item.menu = ({
							path = "[Path]",
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[NVIM_LUA]",
							luasnip = "[Snippet]",
						})[entry.source.name]
						return vim_item
					end,
				},
				sources = {
					{ name = "path" },
					{
						name = "nvim_lsp",
						entry_filter = function(entry)
							return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
						end,
					},
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "buffer" },
				},
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				window = {
					documentation = cmp.config.window.bordered(),
				},
				experimental = {
					ghost_text = false,
					native_menu = false,
				},
			})
		end,
	},
}

return M
