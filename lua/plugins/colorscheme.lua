return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optional configuration
      vim.opt.termguicolors = true
      vim.g.gruvbox_material_background = "medium"     -- "hard", "medium", "soft"
      vim.g.gruvbox_material_foreground = "material"   -- "material", "mix", "original"
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_enable_bold = true

      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },
}
