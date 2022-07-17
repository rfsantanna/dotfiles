local _, actions = pcall(require, "telescope.actions")


vim.g.tokyonight_style = "night"
vim.g.sonokai_style = "shusia"
vim.g.github_transparent = false
vim.g.sonokai_transparent_background = 0
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_foreground = "material"
-- vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_transparent_background = 1

lvim.colorscheme = "duskfox"
lvim.leader = "space"
lvim.format_on_save = {
  pattern = {
    '*.tf',
    '*.lua',
    -- '*.yaml',
    -- '*.yml',
  }
}

lvim.log.level = "warn"
lvim.transparent_window = false
lvim.builtin.bufferline.options.always_show_bufferline = true

lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = ""
lvim.builtin.notify.active = true

lvim.builtin.terminal.active = true
lvim.builtin.terminal.shell = "/usr/bin/zsh"
lvim.builtin.terminal.shading_factor = 1
lvim.builtin.terminal.shading_filetypes = { "none", "toggleterm" }
lvim.builtin.terminal.highlights = {
  Normal = {
    link = "ToggleTerm",
    guibg = "NONE",
    ctermbg = "NONE",
    bg = "NONE"
  },
  disable = { 'org' }
}


lvim.builtin.project.silent_chdir = false
vim.list_extend(
  lvim.builtin.project.patterns,
  {
    '=foxbit-pro',
    '=notekeep',
    '=org',
    '.tf',
    'config.lua',
  }
)



lvim.features = {}
lvim.features.octo = { disabled = false }
lvim.features.neoscroll = { disabled = false }
lvim.features.goto_preview = { disabled = false }
lvim.features.surround_nvim = { disabled = false }
lvim.features.orgmode = { disabled = false }
lvim.features.lsp_signature = { disabled = false }
lvim.features.spectre = { disabled = false }
lvim.features.twilight = { disabled = false }
lvim.features.zen = { disabled = false }
lvim.features.fidget = { disabled = false, custom = false }
lvim.features.neoclip = { disabled = false, persistent = true }
lvim.features.telescope_bookmarks = { disabled = false }
lvim.features.telescope_github = { disabled = false }
lvim.features.indent_blankline = { disabled = false }
lvim.features.dressing = { disabled = true }
lvim.features.neogit = { disabled = true }
lvim.features.gh = { disabled = true }
lvim.features.fugitive = { disabled = false }
lvim.features.sidebar = { disabled = true }
lvim.features.minimap = { disabled = true }
lvim.features.marks = { disabled = false }
lvim.features.focus = { disabled = false }
lvim.features.lazygit = { disabled = false }
lvim.features.filetype = { disabled = false }
lvim.features.vim_repeat = { disabled = false }


-- KEYBINDINGS
require("keybindings").config()
-- VIM SETTINGS
require("vim_options").config()


-- PLUGIN CONFIGS
lvim.plugins = {
  -- THEMES
  { "lunarvim/colorschemes" },
  { "sainnhe/gruvbox-material" },
  { "sainnhe/sonokai" },
  { "projekt0n/github-nvim-theme" },
  { "ellisonleao/gruvbox.nvim" },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("plugins.theme").nightfox()
    end
  },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("plugins.theme").rose_pine()
      -- vim.cmd [[colorscheme rose-pine]]
    end,
    -- cond = function()
    --   local _time = os.date "*t"
    --   return (_time.hour >= 1 and _time.hour < 9)
    -- end,
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("plugins.theme").tokyonight()
      -- vim.cmd [[colorscheme tokyonight]]
    end,
    -- cond = function()
    --   local _time = os.date "*t"
    --   return _time.hour >= 9 and _time.hour < 17
    -- end,
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("plugins.theme").catppuccin()
      -- vim.cmd [[colorscheme catppuccin]]
    end,
    -- cond = function()
    --   local _time = os.date "*t"
    --   return (_time.hour >= 17 and _time.hour < 21)
    -- end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("plugins.theme").kanagawa()
      -- vim.cmd [[colorscheme kanagawa]]
    end,
    -- cond = function()
    --   local _time = os.date "*t"
    --   return (_time.hour >= 21 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 1)
    -- end,
  },

  -- CUSTOM
  { "pearofducks/ansible-vim" },
  { "p00f/nvim-ts-rainbow" },
  { "ellisonleao/glow.nvim" },
  {
    "karb94/neoscroll.nvim",
    disable = lvim.features.neoscroll.disabled,
    config = function()
      require("plugins.neoscroll").config()
    end
  },
  {
    "rmagatti/goto-preview",
    disable = lvim.features.goto_preview.disabled,
    config = function()
      require("plugins.goto_preview").config()
    end
  },
  {
    "ur4ltz/surround.nvim",
    disable = lvim.features.surround_nvim.disabled,
    config = function()
      require("plugins.surround_nvim").config()
    end
  },
  {
    "nvim-orgmode/orgmode",
    disable = lvim.features.orgmode.disabled,
    config = function()
      require("plugins.orgmode").config()
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    disable = lvim.features.lsp_signature.disabled,
    config = function()
      require("plugins.lsp_signature").config()
    end
  },
  {
    "windwp/nvim-spectre",
    event = "BufReadPre",
    disable = lvim.features.spectre.disabled,
    config = function()
      require("plugins.spectre").config()
    end
  },
  {
    "pwntester/octo.nvim",
    requires = require("plugins.octo").deps,
    disable = lvim.features.octo.disabled,
    config = require("plugins.octo").config()
  },
  {
    "folke/zen-mode.nvim",
    disable = lvim.features.zen.disabled,
    config = function()
      require("plugins.zen").config()
    end,
  },
  {
    "folke/twilight.nvim",
    event = "BufRead",
    disable = lvim.features.twilight.disabled,
    config = function()
      require("plugins.twilight").config()
    end,
  },
  {
    "j-hui/fidget.nvim",
    disable = lvim.features.fidget.disabled,
    config = function()
      require("plugins.fidget").config()
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    -- event = "BufRead",
    disable = lvim.features.neoclip.disabled,
    requires = { "tami5/sqlite.lua", module = "sqlite" },
    keys = "<leader>y",
    opt = true,
    config = function()
      require("plugins.neoclip").config()
    end,
  },
  -- {
  --   "dhruvmanila/telescope-bookmarks.nvim",
  --   disable = lvim.features.telescope_bookmarks.disabled,
  --   config = require("plugins.telescope_bookmarks").config()
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    disable = lvim.features.indent_blankline.disabled,
    config = function()
      require("plugins.indent_blankline").config()
    end,
    event = "BufRead",
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("plugins.dressing").config()
    end,
    disable = lvim.features.dressing.disabled,
    event = "BufWinEnter",
  },
  {
    "TimUntersberger/neogit",
    config = function()
      require("plugins.neogit").config()
    end,
    disable = lvim.features.neogit.disabled,
  },
  {
    "ldelossa/gh.nvim",
    requires = require("plugins.gh").deps,
    config = function()
      require("plugins.gh").config()
    end,
    disable = lvim.features.gh.disabled,
  },
  {
    "tpope/vim-fugitive",
    disable = lvim.features.fugitive.disabled,
  },
  -- {
  --   "tpope/vim-repeat",
  --   disable = lvim.features.vim_repeat.disabled,
  -- },
  {
    "sidebar-nvim/sidebar.nvim",
    config = function()
      require("plugins.sidebar").config()
    end,
    disable = lvim.features.sidebar.disabled,
  },
  {
    "wfxr/minimap.vim",
    run = "cargo install --locked code-minimap",
    config = function()
      require("plugins.minimap").config()
    end,
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    disable = lvim.features.minimap.disabled,
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("plugins.marks").config()
    end,
    disable = lvim.features.marks.disabled,
  },
  {
    "beauwilliams/focus.nvim",
    config = function()
      require("plugins.focus").config()
    end,
    disable = lvim.features.focus.disabled,
  },
  -- {
  --   "nvim-telescope/telescope-github.nvim",
  --   config = function()
  --     require("plugins.telescope_github").config()
  --   end,
  --   disable = lvim.features.telescope_github.disabled,
  -- },
  {
    'kdheepak/lazygit.nvim',
    config = function()
      require("plugins.lazygit").config()
    end,
    disable = lvim.features.lazygit.disabled,
  },
  {
    "nathom/filetype.nvim",
    config = function()
      require("plugins.filetype").config()
    end,
    disable = lvim.features.filetype.disabled,
  },
  -- {
  --   "akinsho/org-bullets.nvim",
  --   config = require("org-bullets").setup {}
  -- }
}

--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
-- add your own keymapping
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "hcl",
  "go",
  "yaml",
  "json",
  "python",
  "bash",
  "javascript",
  "typescript",
  "tsx",
  "css",
  "rust",
  "org",
  "lua",
  "c",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.highlight.disable = { "org" }
lvim.builtin.treesitter.highlight.aditional_vim_regex_highlighting = { "org" }
lvim.builtin.treesitter.ignore_install = { "haskell", "norg" }

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "terraformls" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.tf" },
--   -- enable wrap mode for json files only
--   command = "set filetype=terraform",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })


local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.powershell = {
  install_info = {
    url = "https://github.com/jrsconfitto/tree-sitter-powershell",
    files = { "src/parser.c" }
  },
  filetype = "ps1",
  used_by = { "psm1", "psd1", "pssc", "psxml", "cdxml" }
}

lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.lualine.style = "default" -- or "none"

local kind = require "lsp_kind"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.telescope.defaults.path_display = { "smart" }
lvim.builtin.nvimtree.setup.renderer.icons.glyphs = kind.nvim_tree_icons
lvim.builtin.telescope.defaults.mappings = {
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  }
}
-- lvim.builtin.nvimtree.setup.update_focused_file = {
--   enable = true,
--   update_cwd = true,
-- }
-- lvim.builtin.lualine.options.theme = "tokyonight"
