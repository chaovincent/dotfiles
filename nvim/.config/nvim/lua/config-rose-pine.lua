local status_ok, rose_pine = pcall(require, "rose-pine")
if not status_ok then
    return
end

rose_pine.setup({
    styles = {
        transparancy = true,
    },
})

vim.cmd("colorscheme rose-pine")
