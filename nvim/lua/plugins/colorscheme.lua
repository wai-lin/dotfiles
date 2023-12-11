-- Theme inspired by Atom
return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "darker",
			transparent = true,
		})
		vim.cmd.colorscheme "onedark"
	end,
}
