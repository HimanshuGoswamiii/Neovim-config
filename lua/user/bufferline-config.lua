vim.opt.termguicolors = true
require("bufferline").setup{
  options={
    indicator = {
        style = 'underline',
    },
    separator_style = "padded_slant", -- triangle slant lines
    offsets = {
            -- for NnnExplorer
        {
            filetype = "nnn",
            text = "File Explorer" ,
            text_align = "center",
            separator = true
        }
    },
  }
}
