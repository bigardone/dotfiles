return {
  "neoclide/coc.nvim",
  branch = "release",
  event = "VeryLazy",
  config = function()
    vim.g.coc_snippet_next = '<C-n>'
    vim.g.coc_snippet_prev = '<S-TAB>'
    -- vim.g.coc_snippet_next = '<tab>'

    vim.g.coc_global_extensions = {
      "coc-css",
      "coc-emmet",
      "coc-eslint",
      "coc-highlight",
      "coc-html",
      "coc-json",
      "coc-markdown-preview-enhanced",
      "coc-markdownlint",
      "coc-pairs",
      "coc-snippets",
      "coc-sumneko-lua",
      "coc-tsserver",
      "coc-webview",
      "coc-yaml",
      "@yaegassy/coc-tailwindcss3"
    }


    vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
    vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { silent = true })
    vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
    -- vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? 'coc#pum#next(1)' : '<TAB>'",
    --   { noremap = true, silent = true, expr = true })
    -- vim.api.nvim_set_keymap("i", "<S-TAB>", "pumvisible() ? 'coc#pum#prev(1)' : '<C-h>'", { noremap = true, expr = true })
    -- vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'",
    -- { silent = true, expr = true, noremap = true })\

    vim.cmd [[
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " Use <c-space> to trigger completion:

  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <CR> to confirm completion, use:

  inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

  " To make <CR> to confirm selection of selected complete item or notify coc.nvim
  " to format on enter, use:

  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]]
  end
}
