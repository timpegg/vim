function! FormatEWIN()
	%s/\%x85//ge
	%s/\%x93//ge
	%s/\%x94//ge
	%s/\%x95//ge
	%s/\%x96//ge
	%s/^\ //ge
	%s/ \././ge
	%s/^o\ //ge
	%s/.*/\L&/g
	%s/[h|H][t|T|x|X][t|T|x|X][p|P][S|s]:\/\///g
	%s/[h|H][t|T|x|X][t|T|x|X][p|P]:\/\///g
	%s/\/.*$//g
	%s/.pdf//g
	%s/.zip//g
	%s/\[@\]/@/g
	%s/\[at\]/@/g
	%s/\[dot]/./g
	%s/\[\.\]/./g
	%s/\[d\]/./g
	%s/\s$//g
	%s/:.*//g
endfunction
