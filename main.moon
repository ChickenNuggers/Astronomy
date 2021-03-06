astronomy = require 'astronomy'
lfs       = require 'lfs'

error 'Unable to locate subprograms directory' if not (lfs.attributes('subprograms', 'mode') == 'directory')

dir = lfs.currentdir!

for program in lfs.dir 'subprograms'
	if program\sub(1, 1) == '.'
		continue
	lfs.chdir 'subprograms/' .. program
	func = assert loadfile 'main.lua'
	func!
	lfs.chdir dir

astronomy\loop!
