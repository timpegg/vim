function! BuffComp()
	edit file1
	diffthis
	vnew
	edit file2
	diffthis
endfunction
