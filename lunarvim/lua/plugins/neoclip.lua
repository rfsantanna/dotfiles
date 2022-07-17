local M = {}

-- M.get_deps = function()
--   if lvim.features.neoclip.persistent == true
--   then
--     return { "tami5/sqlite.lua", module = "sqlite" }
--   else
--     return {}
--   end
-- end

M.config = function()
  local status_ok, neoclip = pcall(require, "neoclip")
  if not status_ok then
    return
  end

  neoclip.setup {
    history = 100,
    enable_persistent_history = lvim.features.neoclip.persistent,
    length_limit = 1048576,
    continuous_sync = false,
    db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3",
    filter = nil,
    preview = true,
    default_register = '"',
    default_register_macros = 'q',
    enable_macro_history = true,
    content_spec_column = false,
    on_paste = {
      set_reg = false,
    },
    on_replay = {
      set_reg = false,
    },
    keys = {
      telescope = {
        i = {
          select = '<cr>',
          paste = '<c-p>',
          paste_behind = '<c-k>',
          replay = '<c-q>', -- replay a macro
          delete = '<c-d>', -- delete an entry
          custom = {},
        },
        n = {
          select = '<cr>',
          paste = 'p',
          paste_behind = 'P',
          replay = 'q',
          delete = 'd',
          custom = {},
        },
      },
      fzf = {
        select = 'default',
        paste = 'ctrl-p',
        paste_behind = 'ctrl-k',
        custom = {},
      },
    },
  }
  local function clip()
    local opts = {
      winblend = 10,
      layout_strategy = "flex",
      layout_config = {
        prompt_position = "top",
        width = 0.8,
        height = 0.6,
        horizontal = { width = { padding = 0.15 } },
        vertical = { preview_height = 0.70 },
      },
      borderchars = {
        prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
        results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
        preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
      border = {},
      shorten_path = false,
    }
    local dropdown = require("telescope.themes").get_dropdown(opts)
    require("telescope").extensions.neoclip.default(dropdown)
  end

  local whk_status, whk = pcall(require, "which-key")
  if not whk_status then
    return
  end

  whk.register {
    ["<leader>y"] = { clip, " open yank history" },
  }

end

return M
