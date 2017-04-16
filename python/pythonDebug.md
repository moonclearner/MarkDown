# Python Debug

## dir()
打印出该对象的属性和方法
print dir()

## print
打印出问题的部分

## debug mode
1. method one
	- python -m pdb mypython.py
	It will stop at first line
2. method two
	- \>\>\> import pdb
	- \>\>\> import mymodule
	- \>\>\> pdb.run('mymodule.test()')
3. method three
	- \>\>\> import pdb
	- \>\>\> pdb.set_trace()
### commands
#### show commands
- h
	help commands; will print pdb all commands
- l
	list all code block to be run
- a
	list current function attribute
- p variables
	print variables
- ! commands
	directly run commands, It can change any variables
- q
	quit()
- w
	Print a stack trace, with the most recent frame at the bottom.An arrow indicates the "current frame", which determines the context of most commands. 'bt' is an alias for this command.
- d
	Move the current frame one level down in the stack trace (to a newer frame).
- u
	Move the current frame one level up in the stack trace (to an older frame).
#### run commands
- b nums or b mypython.py:nums
	set breakpoint at nums line and add breakpoint number
- condition breakpoint_number a==3
	add condition a\=\=3 for breakpoint_number; if a==3, code will stop
- cl breakpoint_number
	delete nums breakpoint
- cl
	delete all breakpoint
- disable/enable breakpoint_number
- n
	run next line
- s
	enter the inner function or next line
- c
	run the code until breakpoint
- j nums
	let code jump to nums line

