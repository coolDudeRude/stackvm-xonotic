divert(-1)
define(`TRUE', 1)
define(`FALSE', 0)
define(`REGISTRY_INIT_WAIT_TIME', 1)
define(`__REGISTRY_DATA__', `alias __vm.init_registry__ "RPN_CMD')

define(`REGISTRY_ADD',
`define(`__REGISTRY_DATA__', defn(`__REGISTRY_DATA__')` /$1.$2 /$3 put')dnl')

define(`REGISTRY_INIT', `__REGISTRY_DATA__"
defer REGISTRY_INIT_WAIT_TIME __vm.init_registry__
')

divert(0)dnl
