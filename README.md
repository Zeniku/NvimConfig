## Nvim config
My Neovim Config

### Don't try it out
if you want then just
```
git clone https://github.com/Zeniku/NvimConfig.git ~/.config/nvim
```

### Dependencies
Requires [Neovim v0.6.0](https://github.com/neovim/neovim/releases/tag/v0.6.0) or [Nightly](https://github.com/neovim/neovim/releases/tag/nightly).

## Get Healthy
<details>
<summary></summary>
Open `nvim` and enter the command:

```
:checkhealth
```

You'll probably notice that copy/paste and python and node dont have support

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```
- On Termux

  you need to install Termux:API in F-Droid and run
  ```
  pkg install termux-api
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
---

**Note:**this was copy pasted from [Neovim From Scratch](https://github.com/LunarVim/Neovim-from-scratch)<br />
with Termux added in</details>
