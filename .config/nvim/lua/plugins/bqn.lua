return {
    {
        'mlochbaum/BQN',
	config = function(plugin)
	    vim.opt.rtp:append(plugin.dir .. "/editors/vim")
	    require("lazy.core.loader").packadd(plugin.dir .. "/editors/vim")
	end,
	ft = "bqn",
	init = function(plugin)
	     require("lazy.core.loader").ftdetect(plugin.dir .. "/editors/vim")
	end,
    }
}
