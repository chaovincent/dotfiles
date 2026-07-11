local status_ok, rainbow = pcall(reqire, "rainbow-delimiters.setup")
if not status_ok then
    return
end

rainbow.setup({
    strategy = {
        [''] = 'rainbow-delimiters.strategy.global',
    },
})
