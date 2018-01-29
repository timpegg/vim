function! SortIP()
	%s/\<\d\d\?\>/0&/g|%&&
	sort r/\(\d\{3}\)\%(\.\d\{3}\)\{3}/
	%s/\<00\?\ze\d//g
endfunction

