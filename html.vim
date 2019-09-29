" HTML-specific configuration

" The following was taken from
" https://stackoverflow.com/questions/2154193/using-vim-as-a-html-editor
" HTML wrap selected text with tags
function! VisualTagsWrap()
	if !exists('g:tags_to_wrap')
		let g:tags_to_wrap=[]
	endif
	let g:tags_to_wrap=split(input('space separated tags to wrap block: ', join(g:tags_to_wrap, ' ')), '\s\+')
	if len(g:tags_to_wrap)>0
		execute 'normal! '>a</'.join(reverse(g:tags_to_wrap), '></').'>'
		execute 'normal! '<i<'.join(reverse(g:tags_to_wrap), '><').'>'
	endif
endfunction

vnoremap <silent>,w <ESC>:call VisualTagsWrap()<CR>

