local M = {}

M.config = function()
  local status_ok, focus = pcall(require, "focus")
  if not status_ok then
    return
  end

  focus.setup {
    enable = true,
    autoresize = true,
    width = 0,
    minwidth = 0,
    height = 0,
    -- treewidth = 30,
    cursorline = true,
    cursorcolumn = false,
    signcolumn = true,
    colorcolumn = {
      enable = false,
      width = 80,
    },
    winhighlight = false,
    number = false,
    relativenumber = false,
    hybridnumber = false,
    absolutenumber_unfocussed = false,
    tmux = false,
    bufnew = false,
    compatible_filetrees = { 'nvimtree', 'nerdtree', 'chadtree', 'fern' },
    excluded_filetypes = {},
    excluded_buftypes = { 'nofile', 'prompt', 'popup' },
    forced_filetypes = { 'dap-repl' },
  }
end

return M
