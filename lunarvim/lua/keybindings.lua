local M = {}

M.config = function()
  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

  lvim.keys.normal_mode["gPd"] = {
    "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
    { noremap = true },
  }
  lvim.keys.normal_mode["gPr"] = {
    "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
    { noremap = true },
  }
  lvim.keys.normal_mode["gPi"] = {
    "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
    { noremap = true },
  }

  lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
  lvim.builtin.which_key.mappings["R"] = {
    name = "Replace",
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Current Buffer" },
    p = { "<cmd>lua require('spectre').open()<cr>", "Project" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  }

  lvim.builtin.which_key.mappings.b["k"] = { "<cmd>BufferKill<cr>", "Kill Buffer" }
end

return M
