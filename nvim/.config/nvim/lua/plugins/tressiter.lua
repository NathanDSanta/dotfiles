return {
{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "lua", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true
      }
 }
}
