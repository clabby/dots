local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
  error('This plugin requires nvim-telescope/telescope.nvim')
end

local Path = require "plenary.path"

local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local icons = require('config.icons')
local entry_display = require('telescope.pickers.entry_display')
local palette = require('catppuccin.palettes.mocha')

-- Function to get LSP diagnostics count for a buffer
local function get_diagnostics(bufnr)
  local diagnostics = vim.diagnostic.get(bufnr)
  local counts = {
    errors = 0,
    warnings = 0,
    info = 0,
    hints = 0,
  }

  for _, diagnostic in ipairs(diagnostics) do
    if diagnostic.severity == vim.diagnostic.severity.ERROR then
      counts.errors = counts.errors + 1
    elseif diagnostic.severity == vim.diagnostic.severity.WARN then
      counts.warnings = counts.warnings + 1
    elseif diagnostic.severity == vim.diagnostic.severity.INFO then
      counts.info = counts.info + 1
    elseif diagnostic.severity == vim.diagnostic.severity.HINT then
      counts.hints = counts.hints + 1
    end
  end

  return counts
end

-- Custom buffer picker
local enhanced_buffers = function(opts)
  opts = opts or {}

  local bufnrs = vim.tbl_filter(function(bufnr)
    if 1 ~= vim.fn.buflisted(bufnr) then
      return false
    end
    return true
  end, vim.api.nvim_list_bufs())

  if not next(bufnrs) then
    vim.api.nvim_echo({ { "No open buffers", "TelescopeResultsComment" } }, true, {})
    return
  end

  if opts.sort_mru then
    table.sort(bufnrs, function(a, b)
      return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
    end)
  end

  if type(opts.sort_buffers) == "function" then
    table.sort(bufnrs, opts.sort_buffers)
  end

  local buffers = {}
  local default_selection_idx = 1
  for i, bufnr in ipairs(bufnrs) do
    local flag = bufnr == vim.fn.bufnr "" and "%" or (bufnr == vim.fn.bufnr "#" and "#" or " ")

    if opts.sort_lastused and not opts.ignore_current_buffer and flag == "#" then
      default_selection_idx = 2
    end

    local element = {
      bufnr = bufnr,
      flag = flag,
      info = vim.fn.getbufinfo(bufnr)[1],
    }

    if opts.sort_lastused and (flag == "#" or flag == "%") then
      local idx = ((buffers[1] ~= nil and buffers[1].flag == "%") and 2 or 1)
      table.insert(buffers, idx, element)
    else
      if opts.select_current and flag == "%" then
        default_selection_idx = i
      end
      table.insert(buffers, element)
    end
  end

  if not opts.bufnr_width then
    local max_bufnr = math.max(unpack(bufnrs))
    opts.bufnr_width = #tostring(max_bufnr)
  end

  -- Create highlight group for modified flag if it doesn't exist
  if vim.fn.hlexists('TelescopeBufferModified') == 0 then
    vim.api.nvim_set_hl(0, 'TelescopeBufferModified', { fg = palette.teal, bold = true })
  end

  -- Create displayer
  local displayer = entry_display.create {
    separator = " ",
    items = {
      { remaining = true }, -- Modified flag
      { remaining = true }, -- Filename
      { remaining = true }, -- Diagnostics
    }
  }

  local make_display = function(entry)
    -- Create a concatenated diagnostic string
    local diags = entry.diagnostics
    local diag_str = ""

    if diags.errors > 0 then
      diag_str = diag_str .. icons.diagnostics.BoldError .. ' ' .. diags.errors .. ' '
    end
    if diags.warnings > 0 then
      diag_str = diag_str .. icons.diagnostics.BoldWarning .. ' ' .. diags.warnings .. ' '
    end
    if diags.info > 0 then
      diag_str = diag_str .. icons.diagnostics.BoldInformation .. ' ' .. diags.info .. ' '
    end
    if diags.hints > 0 then
      diag_str = diag_str .. icons.diagnostics.BoldHint .. ' ' .. diags.hints
    end
    diag_str = vim.trim(diag_str)

    -- Select a single highlight group based on the highest severity
    local diag_hl = "Normal"
    if diags.errors > 0 then
      diag_hl = "DiagnosticError"
    elseif diags.warnings > 0 then
      diag_hl = "DiagnosticWarn"
    elseif diags.info > 0 then
      diag_hl = "DiagnosticInfo"
    elseif diags.hints > 0 then
      diag_hl = "DiagnosticHint"
    end

    local modified = entry.modified and icons.ui.FileModified or ''

    -- Filename logic
    local cwd = require('telescope.utils').path_expand(opts.cwd or vim.loop.cwd())
    local filename = entry.filename ~= "" and entry.filename or nil
    local bufname = filename and Path:new(filename):normalize(cwd) or "[No Name]"

    -- Return the display with the flag, filename, and single-highlight diagnostic info
    return displayer {
      { modified, "TelescopeBufferModified" },
      bufname,
      { diag_str, diag_hl }, -- Apply the selected highlight group to the entire diagnostic string
    }
  end

  pickers
      .new(opts, {
        prompt_title = "Find Buffers",
        finder = finders.new_table {
          results = buffers,
          entry_maker = function(entry)
            return {
              -- Metadata
              bufnr = entry.bufnr,
              filename = entry.info.name,
              modified = entry.info.changed == 1,
              diagnostics = get_diagnostics(entry.bufnr),
              -- Required telescope fields
              display = make_display,
              ordinal = entry.info.name,
              value = entry,
            }
          end,
        },
        previewer = false,
        initial_mode = "insert",
        theme = "dropdown",
        layout_config = {
          width = 0.5,
          height = 0.4,
          prompt_position = "top",
          preview_cutoff = 120,
        },
        sorter = conf.generic_sorter(opts),
        default_selection_index = default_selection_idx,
        attach_mappings = function(_, map)
          map({ "i", "n" }, "<C-d>", actions.delete_buffer)
          return true
        end,
      })
      :find()
end

-- Register the extension
return telescope.register_extension {
  exports = {
    enhanced_buffers = enhanced_buffers
  },
}
