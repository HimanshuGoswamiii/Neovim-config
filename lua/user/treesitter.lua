local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = { "python","c","cpp","lua","html","vim","css","bash" }, -- Download nvim-treesitter modules for these languages
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
}
