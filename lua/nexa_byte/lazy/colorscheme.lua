-- define a local helper
local function ColorMyVimmy(color)
  -- fallback order
  color = color or "gruvbox" or "rose-pine"
  vim.cmd.colorscheme(color)
end

-- return plugin specs
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      ColorMyVimmy()
    end,
  },
  {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })

            ColorMyVimmy()
        end,
    },
}

