vim.cmd [[
try
  colorscheme snazzy
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
