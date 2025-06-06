local powershell_options = {
  shell = "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandartOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastErrorCode",
  shellquote = "",
  shellxquote = "",
}
for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end
