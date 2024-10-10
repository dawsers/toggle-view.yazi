# toggle-view.yazi

Toggle different views: maximized preview, disabled preview, only current,
and default.

Merging [max-preview.yazi](https://github.com/yazi-rs/plugins/tree/main/max-preview.yazi)
and [hide-preview.yazi](https://github.com/yazi-rs/plugins/tree/main/hide-preview.yazi)
to provide both functionalities in one plugin (keystroke).

## Installation

```sh
ya pack -a dawsers/toggle-view
```

## Usage

Add this to your `~/.config/yazi/keymap.toml`:

``` toml
[manager]
prepend_keymap = [
    { on   = "T", run  = "plugin --sync toggle-view", desc = "Toggle views" },
]
```

Make sure the <kbd>T</kbd> key is not used elsewhere.

