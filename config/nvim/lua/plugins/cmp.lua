return {
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",

    -- use a release tag to download pre-built binaries
    version = "v0.*",

    opts = {
      keymap = {
        accept = "<Tab>",
        select_prev = { "<S-CR>", "<Up>", "<C-p>" },
        select_next = { "<CR>", "<Down>", "<C-n>" },
      },
      windows = {
        documentation = {
          auto_show = true, -- automatically show documentation on hover
        },
      },
      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = "normal",

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } }

      -- experimental signature help support
      -- trigger = { signature_help = { enabled = true } }
    },
  },
}
