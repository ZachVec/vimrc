# My Ultimate vimrc

## Included Plugins

The [`Vim-Plug`](https://github.com/junegunn/vim-plug)
is used to manage vim plugins in this vim configuration.
Plugins used are listed below:

- [fzf](https://github.com/junegunn/fzf):
  fzf is a general-purpose command-line fuzzy finder.
- [lightline.vim](https://github.com/itchyny/lightline.vim):
  A light and configurable statusline/tabline plugin for Vim.
- [coc.nvim](https://github.com/neoclide/coc.nvim):
  Make your Vim/Neovim as smart as VSCode.
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi):
  Multiple cursors plugin for vim/neovim.
- [gruvbox](https://github.com/morhetz/gruvbox):
  Retro groove color scheme for Vim.

Besides, coc.nvim can be pluged-in as well. The plugins of coc.nvim is listed below:

- [coc-pairs](https://github.com/neoclide/coc-pairs):
  Basic auto pairs extension of coc.nvim.
- [coc-json](https://github.com/neoclide/coc-json):
  Json language server extension for coc.nvim.
- [coc-git](https://github.com/neoclide/coc-git):
  Git integration of coc.nvim.
- [coc-clangd](https://github.com/clangd/coc-clangd):
  clangd extension for coc.nvim.
- [coc-pyright](https://github.com/fannheyward/coc-pyright):
  Pyright extension for coc.nvim.
- [coc-vimlsp](https://github.com/iamcco/coc-vimlsp):
  viml language server.
- [coc-markdownlint](https://github.com/fannheyward/coc-markdownlint):
  markdownlint extension for coc.nvim.

## Prerequisite

[coc.nvim](https://github.com/neoclide/coc.nvim#quick-start) requires

- vim >= 8.1.1719 or neovim >= 0.4.0, and
- nodejs >= 14.14 as well

Install vim >= 8.1.1719 if necessary:

```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt install -y vim
```

Install nodejs >= 14.14 if necessary:

```bash
curl -sL install-node.vercel.app/lts | bash
```

## How to install the vimrc?

To start with, make sure you have vim and nodejs properly installed.
By properly, I mean the versions meet the minimum requirements.

### Step 1: Clone the repo and install vimrc

```bash
git clone https://github.com/ZachVec/vimrc.git ~/.vim
bash ~/.vim/install.sh
```

### Step 2: Open the vim to install plugins

Type `vim` in CLI to open vim.
Then type `:PlugInstall` in command mode to install plugins.
Quit the vim when the installation is complete.

### Step 3: Install language servers for coc.nvim

Type `vim` in CLI to open vim again. Then the language servers and some
other awesome plugins would be automatcally installed.
The time to install may vary depending on the network condition.
If some failures occur during the installation, then quit
and reopen vim to retry.

### (Optional) Step 4: Configure your LSP as needed

#### For C++

Coc-clangd is used in my configuration, and this plugin requires
clangd to be installed. Type the following command to check whether
the clangd has already been installed or not.

```bash
which clangd
```

If the response is `clangd not found`, then you may type the following
command to install clangd first; Otherwise you are good to go.

```bash
sudo apt install -y clangd-12
ln -sT /usr/bin/clangd-12 /usr/bin/clangd
```

> Also, you can type `CocCommand clangd.install` in the vim of command mode.

#### For Python

Coc-pyright is used as language server of python, black and pylint are used
as formatter and linter respectively. You may check if they are properly installed
before writing your python code.

##### Use pip as package manager

Type the commands below to install black and pylint.

```bash
pip install black
pip install pylint
```

Then name the path they are installed in `coc-settings.json` like following lines:

```json
"python.formatting.provider": "black",
"python.formatting.blackPath": "~/.local/bin/black",
"python.linting.pylintPath": "~/.local/bin/pylint"
```

> These line has been writen already, you can simply change the path to you installation.
>
> Also, there are other formatters and linters available. Please refer to the documentation
> of [pyright](https://github.com/fannheyward/coc-pyright) for more information.
