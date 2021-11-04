" fzf
command! -bang -complete=dir FilesCustom
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({
  \ 'source': 'fd -t f -i -H -E .git',
  \ 'options': '--info=inline'}), <bang>0)
command! -bang RgCustom
  \ call fzf#vim#grep(
  \ 'rg -n --color=always -i --hidden -g "!*.git/*" -- '.shellescape(<q-args>),
  \ 1, fzf#vim#with_preview({'options': '--info=inline'}), <bang>0)

" nvim-tree
let g:nvim_tree_quit_on_open = 1
