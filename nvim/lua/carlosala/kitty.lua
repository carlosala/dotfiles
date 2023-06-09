-- Styled and colored underline support
vim.g["&t_AU"] = [[\e[58:5:%dm]]
vim.g["&t_8u"] = [[\e[58:2:%lu:%lu:%lum]]
vim.g["&t_Us"] = [[\e[4:2m]]
vim.g["&t_Cs"] = [[\e[4:3m]]
vim.g["&t_ds"] = [[\e[4:4m]]
vim.g["&t_Ds"] = [[\e[4:5m]]
vim.g["&t_Ce"] = [[\e[4:0m]]
-- Strikethrough
vim.g["&t_Ts"] = [[\e[9m]]
vim.g["&t_Te"] = [[\e[29m]]

-- Truecolor support
vim.g["&t_8f"] = [[\e[38:2:%lu:%lu:%lum]]
vim.g["&t_8b"] = [[\e[48:2:%lu:%lu:%lum]]
vim.g["&t_RF"] = [[\e]10;?\e\\]]
vim.g["&t_RB"] = [[\e]11;?\e\\]]

-- Bracketed paste
vim.g["&t_BE"] = [[\e[?2004h]]
vim.g["&t_BD"] = [[\e[?2004l]]
vim.g["&t_PS"] = [[\e[200~]]
vim.g["&t_PE"] = [[\e[201~]]

-- Cursor control
vim.g["&t_RC"] = [[\e[?12$p]]
vim.g["&t_SH"] = [[\e[%d q]]
vim.g["&t_RS"] = [[\eP$q q\e\\]]
vim.g["&t_SI"] = [[\e[5 q]]
vim.g["&t_SR"] = [[\e[3 q]]
vim.g["&t_EI"] = [[\e[1 q]]
vim.g["&t_VS"] = [[\e[?12l]]

-- Focus tracking
vim.g["&t_fe"] = [[\e[?1004h]]
vim.g["&t_fd"] = [[\e[?1004l]]
-- vim.cmd([[
-- execute "set <FocusGained>=\<Esc>[I"
-- execute "set <FocusLost>=\<Esc>[O"
-- ]])

-- Window title
vim.g["&t_ST"] = [[\e[22;2t]]
vim.g["&t_RT"] = [[\e[23;2t]]

-- vim hardcodes background color erase even if the terminfo file does
-- not contain bce. This causes incorrect background rendering when
-- using a color theme with a background color in terminals such as
-- kitty that do not support background color erase.
vim.g["&t_ut"] = ""
