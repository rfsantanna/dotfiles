local M = {}

M.deps = {
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'kyazdani42/nvim-web-devicons',
}

M.config = function()
  local status_ok, octo = pcall(require, "octo")
  if not status_ok then
    return
  end
  octo.setup()
end

return M
