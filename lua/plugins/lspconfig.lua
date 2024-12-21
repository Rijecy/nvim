return {
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup {}
		end,
	},
	{
    	'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup {}
		end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			require('lspconfig').lua_ls.setup {
				on_init = function(client)
   				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
					return
				end

    			client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
     				runtime = {
        				version = 'LuaJIT'
      				},
					workspace = {
        				checkThirdParty = false,
        				library = {
          					vim.env.VIMRUNTIME
        				}
      				}
			    })
			end,
			settings = {
  				Lua = {}
			}
		}
			require'lspconfig'.rust_analyzer.setup{
			  settings = {
				['rust-analyzer'] = {
				  diagnostics = {
					enable = false;
				  }
				}
			  }
			}
			-- require('lspconfig').intelephense.setup{}
			-- require('lspconfig').clangd.setup{}
	-- 		require('lspconfig').tsserver.setup{}
	-- 		require('lspconfig').angularls.setup{}
	-- 		require('lspconfig').emmet_language_server.setup{}
	-- 		require('lspconfig').cssls.setup{}
	-- 		require('lspconfig').html.setup{}
	end,
},
}
