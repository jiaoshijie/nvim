[
  (string)
  (raw_string)
  (heredoc_body)
  (ansi_c_string)
  (word)
] @string

[
  (heredoc_start)
  (heredoc_end)
] @label

(variable_name) @variable

((variable_name) @constant
  (#lua-match? @constant "^[A-Z][A-Z_0-9]*$"))

((variable_name) @variable.builtin
  (#any-of? @variable.builtin
    ; https://www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Variables.html
    "CDPATH" "HOME" "IFS" "MAIL" "MAILPATH" "OPTARG" "OPTIND" "PATH" "PS1" "PS2"
    ; https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
    "_" "BASH" "BASHOPTS" "BASHPID" "BASH_ALIASES" "BASH_ARGC" "BASH_ARGV" "BASH_ARGV0" "BASH_CMDS"
    "BASH_COMMAND" "BASH_COMPAT" "BASH_ENV" "BASH_EXECUTION_STRING" "BASH_LINENO"
    "BASH_LOADABLES_PATH" "BASH_REMATCH" "BASH_SOURCE" "BASH_SUBSHELL" "BASH_VERSINFO"
    "BASH_VERSION" "BASH_XTRACEFD" "CHILD_MAX" "COLUMNS" "COMP_CWORD" "COMP_LINE" "COMP_POINT"
    "COMP_TYPE" "COMP_KEY" "COMP_WORDBREAKS" "COMP_WORDS" "COMPREPLY" "COPROC" "DIRSTACK" "EMACS"
    "ENV" "EPOCHREALTIME" "EPOCHSECONDS" "EUID" "EXECIGNORE" "FCEDIT" "FIGNORE" "FUNCNAME"
    "FUNCNEST" "GLOBIGNORE" "GROUPS" "histchars" "HISTCMD" "HISTCONTROL" "HISTFILE" "HISTFILESIZE"
    "HISTIGNORE" "HISTSIZE" "HISTTIMEFORMAT" "HOSTFILE" "HOSTNAME" "HOSTTYPE" "IGNOREEOF" "INPUTRC"
    "INSIDE_EMACS" "LANG" "LC_ALL" "LC_COLLATE" "LC_CTYPE" "LC_MESSAGES" "LC_NUMERIC" "LC_TIME"
    "LINENO" "LINES" "MACHTYPE" "MAILCHECK" "MAPFILE" "OLDPWD" "OPTERR" "OSTYPE" "PIPESTATUS"
    "POSIXLY_CORRECT" "PPID" "PROMPT_COMMAND" "PROMPT_DIRTRIM" "PS0" "PS3" "PS4" "PWD" "RANDOM"
    "READLINE_ARGUMENT" "READLINE_LINE" "READLINE_MARK" "READLINE_POINT" "REPLY" "SECONDS" "SHELL"
    "SHELLOPTS" "SHLVL" "SRANDOM" "TIMEFORMAT" "TMOUT" "TMPDIR" "UID"))

"export" @keyword.import

"function" @keyword.function

[
  "declare"
  "typeset"
  "readonly"
  "local"
  "unset"
  "unsetenv"
] @keyword

[
  "if"
  "then"
  "else"
  "elif"
  "fi"
  "case"
  "in"
  "esac"
] @keyword.conditional

[
  "for"
  "do"
  "done"
  "select"
  "until"
  "while"
] @keyword.repeat

(comment) @comment @spell

; Shebang
((program
  .
  (comment) @keyword.directive @nospell)
  (#lua-match? @keyword.directive "^#![ \t]*/"))

(function_definition
  name: (word) @function)

(command_name
  (word) @function.call)

(number) @number

(file_descriptor) @operator

[
  (regex)
  (extglob_pattern)
] @string.regexp

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
  "[["
  "]]"
  "(("
  "))"
] @punctuation.bracket

[
  ";"
  ";;"
  ";&"
  ";;&"
  "&"
] @punctuation.delimiter

[
  ">"
  ">>"
  "<"
  "<<"
  "&&"
  "|"
  "|&"
  "||"
  "="
  "+="
  "=~"
  "=="
  "!="
  "&>"
  "&>>"
  "<&"
  ">&"
  ">|"
  "<&-"
  ">&-"
  "<<-"
  "<<<"
  ".."
  "!"
] @operator

(command_name
  (word) @function.builtin
  (#any-of? @function.builtin
    "." ":" "alias" "bg" "bind" "break" "builtin" "caller" "cd" "command" "compgen" "complete"
    "compopt" "continue" "coproc" "dirs" "disown" "echo" "enable" "eval" "exec" "exit" "false" "fc"
    "fg" "getopts" "hash" "help" "history" "jobs" "kill" "let" "logout" "mapfile" "popd" "printf"
    "pushd" "pwd" "read" "readarray" "return" "set" "shift" "shopt" "source" "suspend" "test" "time"
    "times" "trap" "true" "type" "typeset" "ulimit" "umask" "unalias" "wait"))

(command
  argument: "$" @string) ; bare dollar

(concatenation
  (word) @string)

(special_variable_name) @constant

(test_operator) @operator

(command_substitution
  "$(" @punctuation.special
  ")" @punctuation.special)

(process_substitution
  [
    "<("
    ">("
  ] @punctuation.special
  ")" @punctuation.special)

(arithmetic_expansion
  [
    "$(("
    "(("
  ] @punctuation.special
  "))" @punctuation.special)

(arithmetic_expansion
  "," @punctuation.delimiter)

(ternary_expression
  [
    "?"
    ":"
  ] @keyword.conditional.ternary)

(binary_expression
  operator: _ @operator)

(unary_expression
  operator: _ @operator)

(postfix_expression
  operator: _ @operator)

(command
  argument: [
    (word) @variable.parameter
    (concatenation
      (word) @variable.parameter)
  ])

(declaration_command
  (word) @variable.parameter)

(unset_command
  (word) @variable.parameter)

(file_redirect
  (word) @string.special.path)

(herestring_redirect
  (word) @string)

(simple_expansion
  "$" @punctuation.special) @none

(expansion
  "${" @punctuation.special
  "}" @punctuation.special) @none

(expansion
  operator: _ @punctuation.special)

(expansion
  "@"
  .
  operator: _ @character.special)

((expansion
  (subscript
    index: (word) @character.special))
  (#any-of? @character.special "@" "*"))

"``" @punctuation.special

(case_item
  value: (word) @variable.parameter)
