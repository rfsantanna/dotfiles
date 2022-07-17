local M = {}

M.config = function()
  local status_ok, spectre = pcall(require, "spectre")
  if not status_ok then
    return
  end

  spectre.setup {}
end

return M
