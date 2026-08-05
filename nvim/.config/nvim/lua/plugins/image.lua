return {
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
}
