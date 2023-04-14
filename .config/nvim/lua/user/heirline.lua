-- Heirline statusline configuration

--- A provider function for showing the connected LSP client names
---@param opts? table options for explanding null_ls clients, max width percentage, and options passed to the stylize function
---@return function # the function for outputting the LSP client names
-- @usage local heirline_component = { provider = require("astronvim.utils.status").provider.lsp_client_names({ expand_null_ls = true, truncate = 0.25 }) }
-- @see astronvim.utils.status.utils.stylize
local lsp_client_names = function(opts)
	local status = require("astronvim.utils.status")
	local extend_tbl = require("astronvim.utils").extend_tbl
	local mocha = require("catppuccin.palettes").get_palette("mocha")
	local is_copilot = false

	opts = extend_tbl({ expand_null_ls = true, truncate = 0.25 }, opts)
	return function(self)
		local buf_client_names = {}
		for _, client in pairs(vim.lsp.get_active_clients({ bufnr = self and self.bufnr or 0 })) do
			if client.name == "null-ls" and opts.expand_null_ls then
				local null_ls_sources = {}
				for _, type in ipairs({ "FORMATTING", "DIAGNOSTICS" }) do
					for _, source in ipairs(status.utils.null_ls_sources(vim.bo.filetype, type)) do
						null_ls_sources[source] = true
					end
				end
				vim.list_extend(buf_client_names, vim.tbl_keys(null_ls_sources))
			elseif client.name == "copilot" then
				is_copilot = true
			else
				table.insert(buf_client_names, client.name)
			end
		end
		local str = table.concat(buf_client_names, ", ")
		if type(opts.truncate) == "number" then
			local max_width = math.floor(status.utils.width() * opts.truncate)
			if #str > max_width then
				str = string.sub(str, 0, max_width) .. "…"
			end
		end

		str = string.format("[%s]", str)
		-- If we have copilot enabled, add a green octocat
		if is_copilot then
			str = string.format("%s %s", "", str)
		end

		return status.utils.stylize(str, opts)
	end
end

local statusline_config = function(_, opts)
	local status = require("astronvim.utils.status")
	local mocha = require("catppuccin.palettes").get_palette("mocha")
	opts.statusline = {
		-- statusline
		hl = { fg = "fg", bg = "bg" },
		status.component.mode({
			hl = { fg = mocha.surface0 },
			mode_text = { icon = { kind = "VimIcon", padding = { right = 1, left = 1 } } },
			surround = {
				separator = "left",
				color = function()
					return {
						main = status.hl.mode_bg(),
						right = mocha.surface0,
					}
				end,
			},
			padding = { right = 1 },
			update = "ModeChanged",
		}),
		status.component.git_branch({
			surround = {
				separator = "left",
				color = {
					main = mocha.surface0,
					fg = mocha.green,
				},
				condition = status.condition.is_git_repo,
				padding = { left = 1 },
			},
			hl = { fg = mocha.rosewater },
			padding = { right = 1 },
		}),
		status.component.git_diff({
			surround = { separator = "none" },
		}),
		status.component.fill(), -- split right
		status.component.diagnostics({
			padding = { left = 1 },
			surround = { separator = "none" },
		}),
		status.component.builder({
			provider = lsp_client_names({ expand_null_ls = true, truncate = 0.25 }),
			hl = {
				fg = mocha.overlay2,
			},
			surround = { separator = "right" },
		}),
		status.component.file_info({
			file_icon = { highlight = true, padding = { left = 0 } },
			filetype = {},
			filename = false,
			file_modified = false,
			surround = { separator = "right" },
			padding = { right = 1 },
		}),
		status.component.nav({
			surround = {
				separator = "right",
				color = function()
					return {
						main = status.hl.mode_bg(),
					}
				end,
				padding = { left = 1 },
			},
			hl = { fg = mocha.surface0 },
			ruler = { padding = { left = 1, right = 1 } },
			scrollbar = false,
			percentage = false,
			update = { "CursorMoved", "CursorMovedI", "BufEnter", "ModeChanged" },
		}),
	}
	return opts
end

return statusline_config
