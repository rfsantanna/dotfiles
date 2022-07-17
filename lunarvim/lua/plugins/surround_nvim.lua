local M = {}

M.config = function()
  local status_ok, surround_nvim = pcall(require, "surround")
  if not status_ok then
    return
  end

  surround_nvim.setup {
    mappings_style = "sandwich"
  }
end

return M
