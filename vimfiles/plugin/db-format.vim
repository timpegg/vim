function! FormatSQL()
	%s/\\n/\r/g
	%s/\\r/\r/g
	%s/\\t/\t/g
	%s/TRUNCATE/\rTRUNCATE/g
	set syntax=sql
endfunction
