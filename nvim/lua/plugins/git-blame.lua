-- Git-Blame
return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		enabled = false,             -- disable by defaults, enabled only on keymap
		date_format = "%m/%d/%y %H:%M:%S", -- more concise date format
	},
}
