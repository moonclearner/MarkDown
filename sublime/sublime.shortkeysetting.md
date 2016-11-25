#open sublime.command_log 
- <kbd>ctrl+~</kbd> 
- input sublime.log_commands(True)

这样每次的操作都会在控制台显示出命令的参数

#use command in command windows
- <kbd>ctrl+shift+p</kbd>
- input the command that you want set key-binding
- It will display the argument of the command on the consolo
- copy the details of "command" and "args"

#open Preferences->Key Bindings
{
    "keys":[" "], 
    "caption":"",
    "command": "", 
    "args": {"id": "","file": ""} 
    },