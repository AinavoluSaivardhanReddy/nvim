return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        })
	vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        require("conform").format({
    	    lsp_fallback = true,
	    async = false,
            timeout_ms = 2000,
    	})
	end, { desc = "Format file or range (in visual mode)" })
    end
}

