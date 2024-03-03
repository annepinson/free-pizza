# free-pizza

Wanna get a free pizza ? Follow the road

# Necessary setup

You should have installed: - vim - neovim >=v.0.6

In order to be able to have you own color theme, please place all your theme configuration in a file `~/.config/nvim/colorconfig.vim` which is sourced in the `init.vim`.

# Apply configuration

Once you've cloned the repo, you can easily apply all the config through the script `apply-config.sh`.
It will replace your files: - `~/.config/nvim/init.vim` - `~/.config/nvim/coc-settings.json` - `~/.config/nvim/myinit.lua` - `~/.vimrc`

You just have to run:

```
bash ./apply-config.sh
```

It can also replace your file `colorconfig.vim`, if you run:

```
bash ./apply-config.sh -c
```

Moreover it create backup file for you current config, and you can restore your last configuration by running:

```
bash ./apply-config.sh -run
```

# New commands reminder

## Comment code

In normal mode:
`,cc` comment a line or a block
`,cu` uncomment a line or a block

In `.vimrc`

## Navigation between windows

In normal/insert mode
<C-Up/Down/Left/Right> to pass from a window to another window
<C-c> to close a window

## Coc diagnostics

These diagnostics originate from coc and the associated language server
In normal mode:
`dn` to go to the next diagnostic
`dp` to go to th previous diagnostic

## Git rebase interactve

In normal mode
`ed` to replace the `pick` on the line by an `edit`
`sa` to replace by a `squash`
`de` to replace by a `drop`
`re` to replace by a `replace`

## Search patterns

In normal mode
`fr` to search all occurences of the word you are on
`fs` to replace all occurences of the word you are on, by creating a `%s/patern//g` to complete
`fc` to remove the highlights due to a search

## Selection

In normal mode
`aw` to select a word

## Telescope pickers

In normal mode
`<C-f>` to open the find_files picker, which will search by files name
`<C-g>` to open the live_grep picker, which will search in the files content. If you have a selection, it will be grepped.
`<C-w>` to open the grep_string picker, which will search the word you're on in the files content
`<C-s>` to open the git_status picker
`<C-h>` to open the git_stash picker
`<C-l>` to open the git_commmits picker
`<C-b>` to open the buffers picker

## Go to definition

- `gs` on a variable open an horizontal split with the variable definition

- `gd`on a variable open a vertical split with the variable definition

- `gt` on a variable open a new tab with the variable definition

- `gr` on a variable declaration to see all its references through the workspace

## Replace in all files

`<F9>` open a new buffer with all places the variable is used, in order to replace it everywhere
