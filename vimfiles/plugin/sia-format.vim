function! FormatSIA(title,version)
	call RemoveSpaceNHeaders()
	call FormatSIALines(a:version)
	call FormatSIAHeader(a:title, a:version)
	call FormatSIAFooter(a:title)
endfunction

function! RemoveSpaceNHeaders()
	%g/^Access.*/de
	%g/^Audit.*/de
	%g/^Configuration.*/de
	%g/^Conting.*/de
	%g/^Identif.*/de
	%g/^Mainten.*/de
	%g/^Physical.*/de
	%g/^Risk.*/de
	%g/^System.*/de
	%g/^\s*$/de
	%s/\%x85//ge
	%s/\%x93//ge
	%s/\%x94//ge
	%s/\%x96//ge
	%s/p |\/\//p:\/\//ge
	%s/ps |\/\//ps:\/\//ge
endfunction

function! FormatSIALines(sw_version)

	let topline = line("0")
	let botline = line("$")
	let fun_sw_version = a:sw_version

	for linenum in range(topline, botline)
		let line_content = getline(linenum)
		if line_content =~ '\a\a\-Q\d\d'
			let line_content = substitute(line_content, "^", "| " , "")
			let line_content = substitute(line_content, ":", " |" , "")
			let line_content = substitute(line_content, "$", " |  | ", "")
		elseif line_content =~ '\a\a\-A\d\d'
			let line_content = substitute(line_content, "^", "| " , "")
			let line_content = substitute(line_content, ":", " |" , "")
			let line_content = substitute(line_content, "$", " | " . fun_sw_version . " | ", "")
		else 
			let line_content = substitute(line_content, "^", " \\ ", "")
		endif
		
		let line_content = substitute(line_content, "\t", " ", "")
		call setline(linenum, line_content)
	endfor

endfunction

function! FormatSIAHeader(sw_title,sw_version)
	call append(0,'{section}')
	call cursor(1,1)
	put ='{column:width=70%}'
	put =''
	put ='{panel:title= Release\|borderStyle=solid\|borderColor=#FFFFFF\|titleBGColor=#DAE1E9\|bgColor=#F3F5F8}'
	put ='{table-plus:border=2\|enableSorting=false\|enableHighlighting=false\|columnTypes=S,S}'
	put ='\|\| Current Release: \| '. a:sw_title . ' {excerpt} ' . a:sw_version . ' {excerpt} \|'
	put ='{table-plus}'
	put ='{panel}'
	put =''
	put ='{panel:title= Required Follow-Up\|borderStyle=solid\|borderColor=#FFFFFF\|titleBGColor=#DAE1E9\|bgColor=#F3F5F8}'
	put ='{table-plus:border=2\|enableSorting=false\|enableHighlighting=false\|columnTypes=S,S}'
	put ='\|\| Subject \|\| Details \|\| Responsible \|\|Associated SIA \|\|'
	put ='\| None.  \| \| \| \|'
	put ='{table-plus}'
	put ='{panel}'
	put =''
	put ='{panel:title= Suggested Follow-Up\|borderStyle=solid\|borderColor=#FFFFFF\|titleBGColor=#DAE1E9\|bgColor=#F3F5F8}'
	put ='{expand}'
	put ='{table-plus:border=2\|enableSorting=false\|enableHighlighting=false\|columnTypes=S,S}'
	put ='\|\| Subject \|\| Details \|\| Responsible \|\| Associated SIA \|\|'
	put ='\| None.  \| \| \| \|'
	put ='{table-plus}'
	put ='{expand}'
	put ='{panel}'
	put =''
	put ='{panel:title= Completed Follow-Up\|borderStyle=solid\|borderColor=#FFFFFF\|titleBGColor=#DAE1E9\|bgColor=#F3F5F8}'
	put ='{expand}'
	put ='{table-plus:border=2\|enableSorting=false\|enableHighlighting=false\|columnTypes=S,S}'
	put ='\|\| Subject \|\| Details \|\| Responsible \|\| Associated SIA \|\|'
	put ='\| None.  \| \| \| \|'
	put ='{table-plus}'
	put ='{expand}'
	put ='{panel}'
	put =''
	put ='{panel:title=Questions & Answers\|borderStyle=solid\|borderColor=#FFFFFF\|titleBGColor=#DAE1E9\|bgColor=#F3F5F8}'
	put ='{expand}'
	put ='{multi-excerpt:name=SIAQuestions}'
	put ='{table-plus:border=2\|enableSorting=false\|enableHighlighting=false\|columnTypes=S,S}'
	put ='\|\| Index \|\| Details \|\| Responsible \|\| Associated SIA \|\|'
endfunction

function! FormatSIAFooter(sw_title)
	call cursor(line("$"),1)
	put ='{multi-excerpt}'
	put ='{table-plus}'
	put ='{expand}'
	put ='{panel}'
	put =''
	put ='{panel:title=Security Impact Analysis \|borderStyle=solid\|borderColor=#FFFFFF\|titleBGColor=#DAE1E9\|bgColor=#F3F5F8}'
	put ='{viewpdf:name='. a:sw_title . ' - SIA.pdf}'
	put ='{panel}'
	put =''
	put ='{panel:title=Attachments \|borderStyle=solid\|borderColor=#FFFFFF\|titleBGColor=#DAE1E9\|bgColor=#F3F5F8}'
	put ='{attachments:old=true\|sortBy=name}'
	put ='{panel}'
	put =''
	put ='{panel:title=Related Information\|borderColor=#FFFFFF\|titleBGColor=#DAE1E9\|bgColor=#F3F5F8}'
	put ='{contentbylabel:labels=\|spaces=pspConfItIsoIt\|sort=title}'
	put ='{panel}'
	put =''
	put ='{column}{column:width=40%}'
	put ='{column}'
	put ='{section}'
	put =''	
endfunction


function! FormatSIAFollowup(sw_version)
	%s/\%x95//g
	%s/^\s*//g
	%s/p |\/\//p:\/\//ge
	%s/ps |\/\//ps:\/\//ge
	
	let topline = line("0")
	let botline = line("$")
	let fun_sw_version = a:sw_version
	
	for linenum in range(topline, botline)
		let line_content = getline(linenum)
		let line_content = substitute(line_content, "^", "| " , "")
		let line_content = substitute(line_content, ":", " |" , "")
		let line_content = substitute(line_content, "$", " | " . fun_sw_version . " | ", "")
		call setline(linenum, line_content)
	endfor 
endfunction
