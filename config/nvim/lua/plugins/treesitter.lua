return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      local ts = require('nvim-treesitter')

      -- State tracking for async parser loading
      local parsers_loaded = {}
      local parsers_pending = {}
      local parsers_failed = {}

      local ns = vim.api.nvim_create_namespace('treesitter.async')

      -- Helper to start highlighting and indentation
      local function start(buf, lang)
        local ok = pcall(vim.treesitter.start, buf, lang)
        if ok then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
        return ok
      end

      -- Install core parsers after lazy.nvim finishes loading all plugins
      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyDone',
        once = true,
        callback = function()
          ts.install({
            'bash',
            'comment',
            'css',
            'diff',
            'git_config',
            'git_rebase',
            'gitcommit',
            'gitignore',
            'html',
            'javascript',
            'json',
            'latex',
            'lua',
            'luadoc',
            'make',
            'markdown',
            'markdown_inline',
            'python',
            'query',
            'regex',
            'toml',
            'typescript',
            'vim',
            'vimdoc',
            'xml',
            'rust',
            'go',
            'c'
          }, {
            max_jobs = 8,
          })
        end,
      })

      -- Decoration provider for async parser loading
      vim.api.nvim_set_decoration_provider(ns, {
        on_start = vim.schedule_wrap(function()
          if #parsers_pending == 0 then
            return false
          end
          for _, data in ipairs(parsers_pending) do
            if vim.api.nvim_buf_is_valid(data.buf) then
              if start(data.buf, data.lang) then
                parsers_loaded[data.lang] = true
              else
                parsers_failed[data.lang] = true
              end
            end
          end
          parsers_pending = {}
        end),
      })

      local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

      local ignore_filetypes = {
        'checkhealth',
        'lazy',
        'mason',
        'snacks_dashboard',
        'snacks_notif',
        'snacks_win',
      }

      -- Auto-install parsers and enable highlighting on FileType
      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        desc = 'Enable treesitter highlighting and indentation (non-blocking)',
        callback = function(event)
          if vim.tbl_contains(ignore_filetypes, event.match) then
            return
          end

          local lang = vim.treesitter.language.get_lang(event.match) or event.match
          local buf = event.buf

          if parsers_failed[lang] then
            return
          end

          if parsers_loaded[lang] then
            -- Parser already loaded, start immediately (fast path)
            start(buf, lang)
          else
            -- Queue for async loading
            table.insert(parsers_pending, { buf = buf, lang = lang })
          end

          -- Auto-install missing parsers (async, no-op if already installed)
          ts.install({ lang })
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true
    end,
    config = function()
      vim.keymap.set("n", "<leader>a", function()
        require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
      end)
      vim.keymap.set("n", "<leader>A", function()
        require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
      end)
    end,
  }
}
