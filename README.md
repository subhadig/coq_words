# coq_words

Provides autocomplete for dictionary words with
[coq_nvim](https://github.com/ms-jpq/coq_nvim).
Uses the [look](https://linuxcommand.org/lc3_man_pages/look1.html) command.


## Prerequisites

1. The `look` command is available.
2. The [/usr/share/dict/words](https://en.wikipedia.org/wiki/Words_(Unix)) file
   is available.


## Installation

USING NVIM NATIVE PACKAGES:

```bash
mkdir -p ~/.local/share/nvim/site/pack/plugins/start/
cd ~/.local/share/nvim/site/pack/plugins/start/
git clone https://github.com/subhadig/coq_words.git
```

USING NVIM PACKAGE MANAGER:

1. Add to "init.lua":
```
vim.pack.add({
    'https://github.com/subhadig/coq_words'
})
```

2. Restart neovim:
```
:restart
```

## License

MIT License
