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
map global mirror <ret> 'i<ret><esc>Ha<ret><esc>_'                    -docstring 'add newlines around'
map global mirror " " 'a <esc>i <esc>'                                -docstring 'add spaces around'

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

# XML tag support

map global object "t" "c<lt>.*?<gt>,<lt>/.*?<gt><ret>"

declare-user-mode mirror-tag;
map global mirror "t" ': enter-user-mode mirror-tag<ret>' -docstring 'tag mode'

map global mirror-tag    "s" ': mirror-add-tag<ret>' -docstring 'add tag around'
map global mirror-tag    "d" ': mirror-rm-tag<ret>'  -docstring 'remove tag around'
map global mirror-tag    "c" ': mirror-change-tag<ret>'  -docstring 'change tag around'

define-command -hidden mirror-add-tag %{
    execute-keys %sh{
        echo 'Z' # save seleciton
        echo 'Za<lt>/<gt><esc>;"tZ' # add closing tag and save cursor position
        echo 'zi<lt><gt><esc>h' # add opening tag and save cursor position
        echo '"t<a-z>a' # join both saved cursor posions and enter insert mod
    }
    execute-keys -with-hooks 'i' # enter insert mode
    # if you press space, we clear the closing tag selection
    hook -once buffer InsertKey '<space>' %{
        execute-keys '<backspace><a-;><space> '
    }
}

define-command -hidden mirror-rm-tag %{ execute-keys %sh{
    echo 'Z' # save seleciton
    echo '<a-/><gt><ret><a-?><lt><ret>"bZ' # select previous tag
    echo 's<lt><ret>e"ty' # select previous tag type
    echo '"bzd' # delete previous tag
    echo 'z' # restore selection
    echo '/<lt>/<c-r>t<ret>?<gt><ret>dz' # delete next tag
    echo 'z' # restore selection
}}

define-command -hidden mirror-change-tag %{
    execute-keys %sh{
        echo '"oZ' # save seleciton
        echo '<a-/><lt><ret>' # select previous tag start
        echo 'eZ"py' # select previous tag type
        echo '/(?<lt>=<lt>/)<c-r>p<ret><a-;>' # select next tag type
        echo '<a-z>a)' # repalce tag type
    }
    execute-keys -with-hooks 'c' # replace both tag ends
    # if you press space, we clear the closing tag selection
    hook -once buffer InsertKey '<space>' %{
        execute-keys '<backspace><a-;><space> '
    }
}

# Suggested mapping

#map global normal "'" ': enter-user-mode mirror<ret>' -docstring 'mirror mode'
