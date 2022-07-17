local M = {}

M.config = function()
  vim.g.lazygit_floating_window_winblend = 80 -- transparency of floating window
  -- vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
  -- vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
  -- vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
  vim.g.lazygit_floating_window_corner_chars = {
    "╭", "╮", "╰", "╯"
  }

  -- vim.g.lazygit_floating_window_winblend = 0
  -- vim.g.lazygit_floating_window_scaling_factor = 0.9
  -- vim.g.lazygit_floating_window_use_plenary = 1
  -- vim.g.lazygit_use_neovim_remote = 1
end

return M
