function Color(color)
    vim.cmd("let g:aurora_transparent = 1")
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)
    -- vim.api.nvim_set_hl(0, "CursorLine", {term=bold, cterm=bold })
    -- vim.api.nvim_set_hl(0, "Normal",{ctermfg=grey ,ctermbg=darkblue})
    vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = "grey" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermbg = "NONE", ctermbg = "NONE" })
end

Color()
