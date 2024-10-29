return {
	{
		'karb94/neoscroll.nvim',
		event = "VeryLazy",
		config = function()
			neoscroll = require('neoscroll')
			local keymap = {
				["<C-Up>"] = function() neoscroll.ctrl_u({ duration = 250 }) end;
				["<C-Down>"] = function() neoscroll.ctrl_d({ duration = 250 }) end;
			}
			local modes = { 'n', 'v', 'x' }
			for key, func in pairs(keymap) do
			  vim.keymap.set(modes, key, func)
			end
		end
	},
	{
		'kevinhwang91/nvim-hlslens',
		event = "VeryLazy",
		config = function()
			require('hlslens').setup()

			local kopts = {noremap = true, silent = true}

			vim.api.nvim_set_keymap('n', 'n',
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts)
			vim.api.nvim_set_keymap('n', 'N',
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts)
			vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

			vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
		end

	},
	{
		'tpope/vim-surround',
		event = "VeryLazy"
	},
	{
		"tzachar/local-highlight.nvim",
		event = "VeryLazy",
		config = function()
			require('local-highlight').setup({
				insert_mode = true,
			})
		end
	},
}
