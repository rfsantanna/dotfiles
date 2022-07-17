local opts = {
  settings = {
    terraform = {}
  }
}
require("lvim.lsp.manager").setup("terraformls", opts)
