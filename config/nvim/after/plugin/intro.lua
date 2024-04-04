if vim.fn.argc() ~= 0 or #vim.api.nvim_list_wins() ~= 1 then return end
vim.opt.shortmess:remove("I") -- Enable default startscreen
local WIDTH = vim.api.nvim_win_get_width(0)
local HEIGHT = vim.api.nvim_win_get_height(0)
if WIDTH < 120 or HEIGHT < 40 then return end -- Bail if screen space is at a premium


vim.api.nvim_set_hl(0, "NvimGreen", { fg = 7054142, default = true })
vim.api.nvim_set_hl(0, "NvimBlue", { fg = 3054811, default = true })


local function shuffle(tbl)
    for i = #tbl, 2, -1 do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
    return tbl
end

local function get_highlight_range(line, pattern)
    local results = {}
    local start = 1
    while start <= #line do
        local s, e = string.find(line, pattern, start)
        if e == nil then
            return results
        end
        table.insert(results, { s, e })
        start = e + 1
    end
    return results
end

---@class EphemeralWidget
---@field opts EphemeralWidgetOpts
---@field win number?
---@field buf number?
local EphemeralWidget = {}
EphemeralWidget.__index = EphemeralWidget

---@class EphemeralWidgetOpts
---@field label string
---@field win_opts table?
---@field lines string[]
---@field highlights table

-- Constructor
---@param opts EphemeralWidgetOpts
---@return EphemeralWidget
---@nodiscard
function EphemeralWidget.new(opts)
    local widget = setmetatable({}, EphemeralWidget)
    widget.opts = opts
    return widget
end

function EphemeralWidget:render()
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, false, self.opts.win_opts)
    self.buf = buf
    self.win = win
    vim.wo[win].winhl = "Normal:NONE,EndOfBuffer:NONE"
    vim.wo[win].foldenable = false

    vim.api.nvim_buf_set_lines(buf, 0, -1, true, self.opts.lines)

    local ns = vim.api.nvim_create_namespace(self.opts.label)

    for col, line in ipairs(self.opts.lines) do
        for _, pattern_hl_pair in ipairs(self.opts.highlights) do
            for _, range in ipairs(get_highlight_range(line, pattern_hl_pair[1])) do
                vim.api.nvim_buf_add_highlight(buf, ns, pattern_hl_pair[2], col - 1, range[1] - 1, range[2])
            end
        end
    end

    local augroup = vim.api.nvim_create_augroup(self.opts.label, {})

    local function cleanup()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
        if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
            vim.api.nvim_buf_delete(buf, { force = true })
        end
        vim.on_key(nil, ns)
        vim.api.nvim_clear_autocmds({ group = self.opts.label })
        vim.api.nvim_del_augroup_by_id(augroup)
    end

    vim.on_key(cleanup, ns)
    vim.api.nvim_create_autocmd("VimResized", { group = augroup, callback = cleanup })
end

local ver = vim.version()
local ver_str_min = string.format("%d.%d", ver.major, ver.minor)

local sysinfo_fmt = [[
SYSTEM INFO
Hostname  │ %s
OS        │ %s %s
Memory    │ %d Gib
Processor │ %s]]
local hostname = vim.uv.os_gethostname()
local os_ = vim.uv.os_uname()
local mem_gigs = vim.uv.get_total_memory() / 1024 / 1024 / 1024
local cpu_info = vim.uv.cpu_info()

local sysinfo = vim.split(
    string.format(
        sysinfo_fmt,
        hostname,
        os_.machine, os_.sysname,
        mem_gigs,
        cpu_info[1].model
    ),
    "\n"
)

local sysinfo_win_width = vim.iter(sysinfo):fold(0,
    function(acc, line)
        return math.max(acc, vim.api.nvim_strwidth(line))
    end
)

EphemeralWidget.new({
    label = "sysinfo",
    lines = sysinfo,
    win_opts = {
        relative = "win",
        zindex = 25,
        focusable = false,
        style = "minimal",
        width = sysinfo_win_width,
        height = #sysinfo,
        anchor = "SW",
        row = HEIGHT - 1,
        col = 1,
    },
    highlights = {
        { "^.*$", "LineNr" },
        { "^SYSTEM INFO$", "NvimGreen" },
        { "^.*│", "NvimBlue" },
    }
}):render()


local function parse_keywords_in_section(lines)
    local keywords = {}
    for _, line in ipairs(lines) do
        for w in string.gmatch(line, "|(%S+%(%))|") do
            if #w > 40 then -- truncate long function names
                w = w:sub(1, 40) .. ".."
            end
            keywords[#keywords + 1] = w
        end
        -- You can parse other stuff like option values enclosed in ''
        -- I don't care enough to do this
    end
    return shuffle(keywords) -- Shuffle here to avoid same news sections
end

local function parse_news()
    local lines = {}
    for line in io.lines(vim.env.VIMRUNTIME .. "/doc/news.txt") do
        lines[#lines + 1] = line
    end

    -- Don't want to write a parser for news
    -- Perhaps I can do this with treesitter later?
    local section_labels = {
        "BREAKING CHANGES",
        "NEW FEATURES",
        "CHANGED FEATURES",
        "REMOVED FEATURES",
        "DEPRECATIONS",
    }
    local sections = {}
    local current_section = nil
    for _, line in ipairs(lines) do
        if string.find(line, string.rep("=", 10)) ~= nil then
            current_section = nil
        end
        if current_section ~= nil then
            if sections[current_section] == nil then
                sections[current_section] = {}
            end
            table.insert(sections[current_section], line)
        end
        for _, label in ipairs(section_labels) do
            if string.find(line, label) ~= nil then
                current_section = label
            end
        end
    end
    return sections
end

local keyboard_fmt = [[
                      Keyboard ❤️  Neovim
╭───┬───┬───┬───┬───┬───┬───┬───┬───┬───╮
│ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │
╰┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴╮
 │ A │ S │ D │ F │ G │ ← │ ↓ │ ↑ │ → │ ; │
 ╰┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──╯
  │ Z │ X │ C │  │ B │  │ M │ < │ > │
  ╰───┴───┴───┴───┴───┴───┴───╯───┴───╯]]

local keyboard = vim.split(keyboard_fmt, "\n")

local keyboard_win_width = vim.iter(keyboard):fold(0,
    function(acc, line)
        return math.max(acc, vim.api.nvim_strwidth(line))
    end
)

local keyboard_widget = EphemeralWidget.new({
    label = "keyboard",
    lines = keyboard,
    win_opts = {
        relative = "win",
        style = "minimal",
        zindex = 25,
        focusable = false,
        width = keyboard_win_width,
        height = #keyboard,
        anchor = "SE",
        row = HEIGHT - 1,
        col = WIDTH - 1,
    },
    highlights = {
        { "^.*$", "LineNr" },
        { "[A-Z;<>]", "NvimBlue" },
        { "", "NvimGreen" },
        { "", "NvimGreen" },
        { "←", "NvimGreen" },
        { "↑", "NvimGreen" },
        { "↓", "NvimGreen" },
        { "→", "NvimGreen" },
        { "Neo", "NvimGreen" },
        { "vim", "NvimBlue" },
        { "b", "NvimGreen" },
    }
})

keyboard_widget:render()
vim.wo[keyboard_widget.win].winblend = 50


local tools_fmt = [[
    CLI & TOOLCHAINS

            git │ %s
        ripgrep │ %s
             fd │ %s
     C compiler │ %s
          cargo │ %s
         golang │ %s
          forge │ %s

TREESITTER & PLUGINS

 Treesitter ABI │ %d
 Scripts Loaded │ %d
]]

local compiler_present = vim.iter({ "cc", "gcc", "clang", "cl", "zig" }):fold(false, function(acc, exe)
    return vim.fn.executable(exe) == 1 or acc
end)
local tools = vim.split(
    string.format(
        tools_fmt,
        vim.fn.executable("git") == 1 and "" or "󰅙",
        vim.fn.executable("rg") == 1 and "" or "󰅙",
        vim.fn.executable("fd") == 1 and "" or "󰅙",
        compiler_present and "" or "󰅙",
        vim.fn.executable("cargo") == 1 and "" or "󰅙",
        vim.fn.executable("go") == 1 and "" or "󰅙",
        vim.fn.executable("forge") == 1 and "" or "󰅙",
        vim.treesitter.language_version,
        #vim.fn.getscriptinfo()
    ),
    "\n"
)

local tools_win_width = vim.iter(tools):fold(0,
    function(acc, line)
        return math.max(acc, vim.api.nvim_strwidth(line))
    end
)

EphemeralWidget.new({
    label = "tools",
    lines = tools,
    win_opts = {
        relative = "win",
        style = "minimal",
        zindex = 25,
        focusable = false,
        width = tools_win_width,
        height = #tools,
        anchor = "NE",
        row = 2,
        col = WIDTH - 1,
    },
    highlights = {
        { "^.*$", "LineNr" },
        { "CLI & TOOLCHAINS", "NvimBlue" },
        { "TREESITTER & PLUGINS", "NvimBlue" },
        { "│ $", "DiagnosticOk" },
        { "│ 󰅙$", "DiagnosticError" },
        { "│ %d+", "DiagnosticWarn" },
    }
}):render()
