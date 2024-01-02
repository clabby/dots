return {
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            local hop = require('hop')
            hop.setup { keys = 'etovxqpdygfblzhckisuran' }

            local directions = require('hop.hint').HintDirection
            vim.keymap.set('', 's', function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
            end, { remap = true })
            vim.keymap.set('', 'S', function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
            end, { remap = true })
        end
    }
}
