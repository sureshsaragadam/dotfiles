local sw = require("config.switch")
return {
	"junegunn/fzf",
	enabled = sw.fzf,
	build = "./install --bin",
	"junegunn/fzf.vim",
}
