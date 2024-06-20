return {
	"nvim-neotest/neotest",
	lazy = true,
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"zidhuss/neotest-minitest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-minitest")
			},
		})

		require("neotest-minitest")({
			test_cmd = function()
				return vim.tbl_flatten({
					"bundle",
					"exec",
					"rails",
					"test",
				})
			end
		})
	end
}
