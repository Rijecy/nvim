return {
	'hrsh7th/nvim-cmp',
    dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
	},
	config = function()
		local cmp = require'cmp'
		require('cmp').setup {
			snippet = {
      			expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      			end,
    	},
		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					local entry = cmp.get_selected_entry()
					if not entry then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					end
					cmp.confirm()
				else
					fallback()
				end
			end, {"i","s"}),
		}),
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' }, -- For luasnip users.
			{ name = "neorg" },
			}, {
				{ name = 'buffer' },
			})
		}
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
  		require('lspconfig')['lua_ls'].setup {
	    capabilities = capabilities
  }
	end,
}
