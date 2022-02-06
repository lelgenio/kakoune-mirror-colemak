# kakoune-mirror

[kakoune](http://kakoune.org) plugin to add/remove/change surroundings of selections.

## Install

Add `mirror.kak` to your autoload dir: `~/.config/kak/autoload/`.

Or via [plug.kak](https://github.com/andreyorst/plug.kak):

```
plug 'lelgenio/kakoune-mirror-colemak' %{
  # Suggested mapping
  map global normal "'" ': enter-user-mode -lock mirror<ret>'
}
```

## Usage

This plugin provides a `mirror` user-mode.

For example with the above mapping, press `'` to enter the mirror mode.

### Surround

Pairwise characters like braces, brackets or quotes can be added, replaced or removed.

**Example**: starting from the world `hello` selected.

First, let's surround it with double quotes and parentheses `'"(`

```
[hello]
["hello"]
[("hello")]
```

Oops, you meant to surround the double quotes with spaced-braces! Press `d` to remove the parens, then `}`

```
["hello"]
[{ "hello" }]
```

## See Also

- [kakoune-expand](https://github.com/occivink/kakoune-expand)
- [kakoune-text-objects](https://github.com/Delapouite/kakoune-text-objects)
- [kakoune-surround](https://github.com/h-youhei/kakoune-surround)
- [move-line.kak](https://github.com/alexherbo2/move-line.kak)
- [auto-pairs.kak](https://github.com/alexherbo2/auto-pairs.kak)
- [surround.kak](https://github.com/alexherbo2/surround.kak)

## Licence

MIT
