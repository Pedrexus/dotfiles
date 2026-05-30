-- LazyVim v14.x uses the `master`-branch API of nvim-treesitter
-- (query_predicates, ensure_installed, :TSUpdate). Upstream made `main`
-- the default branch, which lacks that API and breaks LazyVim's init.
-- Pin both plugins to `master` until LazyVim itself migrates to `main`.
return {
  { "nvim-treesitter/nvim-treesitter", branch = "master" },
  { "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" },
}
