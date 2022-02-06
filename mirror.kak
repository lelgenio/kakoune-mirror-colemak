declare-user-mode mirror

# insert/delete
map global mirror ( 'a)<esc>i(<esc>H<a-;>'                            -docstring '(surround)'
map global mirror { 'a}<esc>i{<esc>H<a-;>'                            -docstring '{surround}'
map global mirror [ 'a]<esc>i[<esc>H<a-;>'                            -docstring '[surround]'
map global mirror < 'a<gt><esc>i<lt><esc>H<a-;>'                      -docstring '<surround>'
map global mirror « 'a»<esc>i«<esc>H<a-;>'                            -docstring '«surround»'
map global mirror ) 'a )<esc>i( <esc>2H<a-;>'                         -docstring '( surround )'
map global mirror } 'a }<esc>i{ <esc>2H<a-;>'                         -docstring '{ surround }'
map global mirror ] 'a ]<esc>i[ <esc>2H<a-;>'                         -docstring '[ surround ]'
map global mirror > 'a <gt><esc>i<lt> <esc>2H<a-;>'                   -docstring '< surround >'
map global mirror » 'a »<esc>i« <esc>2H<a-;>'                         -docstring '« surround »'
map global mirror '"' 'a"<esc>i"<esc>H<a-;>'                          -docstring '"surround"'
map global mirror "'" "a'<esc>i'<esc>H<a-;>"                          -docstring "'surround'"
map global mirror '`' 'a`<esc>i`<esc>H<a-;>'                          -docstring '`surround`'
map global mirror d 'Z<a-S><a-d>z<a-:>H'                              -docstring 'delete'
map global mirror c 'Z<a-S><a-d>z<a-:>H: enter-user-mode mirror<ret>' -docstring 'change'

# insert/delete aliases
map global mirror b 'a)<esc>i(<esc>H<a-;>'                            -docstring '(surround)'
map global mirror B 'a}<esc>i{<esc>H<a-;>'                            -docstring '{surround}'
map global mirror r 'a]<esc>i[<esc>H<a-;>'                            -docstring '[surround]'
map global mirror a 'a<gt><esc>i<lt><esc>H<a-;>'                      -docstring '<surround>'
map global mirror A 'a»<esc>i«<esc>H<a-;>'                            -docstring '«surround»'
map global mirror g 'a`<esc>i`<esc>H<a-;>'                            -docstring '`surround`'
map global mirror q "a'<esc>i'<esc>H<a-;>"                            -docstring "'surround'"
map global mirror Q 'a"<esc>i"<esc>H<a-;>'                            -docstring '"surround"'

# fallthrough
map global mirror '<a-;>' '<a-;>'                                     -docstring 'swap anchor and cursor'
map global mirror 's'     '<a-S>'                                     -docstring 'select sels boundaries'

# Suggested mapping

#map global normal "'" ': enter-user-mode mirror<ret>' -docstring 'mirror mode'
