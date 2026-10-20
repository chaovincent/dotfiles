return {
  {
    "3rd/image.nvim",
    build = false,
    opts = {
        processor = "magick_cli",
        backend = "kitty",
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                filetypes = { "markdown", "vimwiki" },
            },
        },
        max_width = 80,
        max_height = 20,
        max_height_window_percentage = 40,
        window_overlap_clear_enabled = true,
    },
  },

  -- vim-table-mode: Auto-formatting and aligning for text tables
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown", "norg", "org" },
    config = function()
      vim.g.table_mode_corner = "|"
      vim.g.table_mode_corner_corner = "|"
      vim.g.table_mode_header_fillchar = "-"

      vim.keymap.set("n", "<leader>tm", ":TableModeToggle<CR>", { desc = "Toggle Table Mode" })
    end,
  },

  -- render-markdown.nvim: Modern UI rendering for tables, headers, and lists
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    ft = { "markdown" },
    opts = {
      pipe_table = {
        preset = "round", -- 'none', 'round', 'double', 'heavy'
        cell = "padded",
      },
    },
  },
}
