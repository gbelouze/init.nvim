---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
		return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
	end
	return config
end

return {

	"mfussenegger/nvim-dap",
	recommended = true,
	desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

	dependencies = {

		-- fancy UI for the debugger
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
      -- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
      },
			opts = {},
			config = function(_, opts)
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup(opts)
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
				dap.listeners.after.event_terminated["dapui_config"] = function()
					dapui.close({})
				end

				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close({})
				end
			end,
		},

		-- virtual text for the debugger
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},

		-- which key integration
		{ "folke/which-key.nvim" },

		-- mason.nvim integration
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = "mason.nvim",
			cmd = { "DapInstall", "DapUninstall" },
			opts = {
				-- Makes a best effort to setup the various debuggers with
				-- reasonable debug configurations
				automatic_installation = true,

				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},

				-- You'll need to check that you have the required things installed
				-- online, please don't ask me how to install them :)
				ensure_installed = {
					-- Update this to ensure that you have the debuggers for the langs you want
				},
			},
		},
	},

	init = function()
		local wk = require("which-key")
		local dap = require("dap")
		wk.add({
			{ "<leader>d", group = "dap" },
			{
				"<leader>dB",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "[B]reakpoint Condition",
			},
			{ "<leader>dC", dap.run_to_cursor, desc = "Run to [C]ursor" },
			{ "<leader>dR", dap.restart, desc = "[R]estart" },
			{
				"<leader>da",
				function()
					dap.continue({ before = get_args })
				end,
				desc = "Run with Args",
			},
			{ "<leader>db", dap.toggle_breakpoint, desc = "Toggle [b]reakpoint" },
			{ "<leader>dc", dap.continue, desc = "[c]ontinue" },
			{ "<leader>dg", dap.goto_, desc = "[g]o to Line (No Execute)" },
			{ "<leader>di", dap.step_into, desc = "Step [i]nto" },
			{ "<leader>dj", dap.down, desc = "Down" },
			{ "<leader>dk", dap.up, desc = "Up" },
			{ "<leader>dl", dap.run_last, desc = "Run [l]ast" },
			{ "<leader>do", dap.step_out, desc = "Step [o]ut" },
			{ "<leader>dp", dap.pause, desc = "[p]ause" },
			{
				"<leader>dr",
				function()
					if not dap.repl.close({ mode = "toggle" }) then
						local _, win = dap.repl.open()
						vim.api.nvim_set_current_win(win)
					end
				end,
				desc = "Toggle [r]EPL",
			},
			{ "<leader>ds", dap.step_over, desc = "[s]tep Over" },
			{ "<leader>dt", dap.terminate, desc = "[t]erminate" },
			{ "<leader>dw", require("dap.ui.widgets").hover, desc = "Widgets" },
		})
	end,
  -- stylua: ignore

	config = function()
		vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
	end,
}
