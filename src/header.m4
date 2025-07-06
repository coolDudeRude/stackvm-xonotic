define(`quote', `"$1"')dnl
define(`nestedquote', `\"$1\"')dnl
define(`comment', `dnl')dnl
define(`private', `__svm_$1')dnl
define(`uprivate', `__svm_$1__')dnl
define(`private_cvar', `set __svm_$1 "$2"')dnl
define(`private_alias', `alias __svm_$1 "$2"')dnl
define(`uprivate_cvar', `set __svm_$1__ "$2"')dnl
define(`uprivate_alias', `alias __svm_$1__ "$2"')dnl
define(`error', private_alias($1, `echo [ERR:$1] $2'))dnl
