<div align="center">

<img width="720" height="480" src="/assets/demo-screenshot.png">

# **ｙａｙｆｚｆ**


> ***[fzf][fzf-url]** wrapper for **[yay][yay-url]***

[![Shellcheck][shellcheck-badge]][shellcheck-workflow]
[![GitHub last commit][github-last-commit-badge]][github-commits]
[![GitHub issues][github-issues-badge]][github-issues]
[![GitHub repo size][github-repo-size-badge]][github-repo]
[![GitHub top language][github-top-language-badge]][github-repo]
[![GitHub language count][github-language-count-badge]][github-repo]
[![License][license-badge]][license]
[![GitHub repo stars][github-repo-stars-badge]][github-repo]
[![GitLab][gitlab-badge]][gitlab]

</div>

<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">

# Description

AUR package [fzf][fzf-url] finder to search, install, remove, and manage packages using **[yay][yay-url]**


<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">

# Table of Contents

* [<strong>ｙａｙｆｚｆ</strong>](#ｙａｙｆｚｆ)
* [Description](#description)
* [Table of Contents](#table-of-contents)
* [Installation](#installation)
  * [Dependencies](#dependencies)
* [Usage](#usage)
  * [Hotkeys](#hotkeys)
  * [Customization](#customization)
* [Other](#other)
  * [Wiki](#wiki)
  * [Contributing](#contributing)
  * [Donate](#donate)

<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">


# Installation

```console
git clone https://github.com/ConnerWill/yayfzf.git
```

To run this script from anywhere as the current user, source the script in your shell init scripts *(`.zshrc` `.bashrc`)* or symlink/move the script to a directory in your `$PATH`

**Adding line to source `yayfzf` to your shell init**


> zsh

```shell
echo "source (PATH-TO-REPO)/yayfzf/bin/yayfzf" >> "${ZDOTDIR}/.zshrc"
```

> bash

```shell
echo 'source (PATH-TO-REPO)/yayfzf/bin/yayfzf' >> ~/.bashrc
```

**Adding script to your `$PATH`**

> > *Assuming `~/.bin` is in your $PATH*

> Symbolic linking to `~/.bin`

```shell
ln -s ./yayfzf/bin/yayfzf ~/.bin/
```
> Copy/Move to `~/.bin`

```shell
cp ./yayfzf/bin/yayfzf ~/.bin/
```

## Dependencies

* **fzf**
* **yay**

*Make sure you have **[fzf][fzf-url]** and **[yay][yay-url]** installed as they are the meat and potatoes of this script*

<!--TODO
If you are not using [yay] and would like to use a different package manager, see [Using a Different Package Manager](#using-a-different-package-manager) below
-->

See the [wiki][wiki-installation-url] for more information


<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">

# Usage

If you added the script to your PATH as mentioned [above](#installation), you can run the command `yayfzf`

`yayfzf` can be either be executed directly or can be sourced to be invoked later

> Running directly
```console
./yayfzf
```

> Running if added to *$PATH*
```console
yayfzf
```

> Sourcing and invoking later
```shell
source yayfzf

yayfzf
```

Running `yayfzf` without any arguments or queries will list *all availiable packages* to be interactively searched using [fzf][fzf-url]

> *Example of running the script with no search query*

```shell
yayfzf
```

> *Example of running the script with input searching for "fzf"*

```shell
yayfzf fzf
```

## Hotkeys

There are specific hotkeys that allow you to interact with [yayfzf][github-repo]
Allowing you to install/remove packages, nagivate and view other packages, and change the fzf window formatting.

> *Here is a list of the default hotkeys*

<kbd>`TAB`</kbd>+<kbd>`d`</kbd> : Select

<kbd>`SHIFT`</kbd>+<kbd>`TAB`</kbd> : Unselect

<kbd>`CTRL`</kbd>+<kbd>`d`</kbd> : Deselect all

<kbd>`CTRL`</kbd>+<kbd>`i`</kbd> : Install selected packages

<kbd>`CTRL`</kbd>+<kbd>`r`</kbd> : Uninstall selected packages

<kbd>`CTRL`</kbd>+<kbd>`u`</kbd> : Update all packages

<kbd>`CTRL`</kbd>+<kbd>`n`</kbd> : History next

<kbd>`CTRL`</kbd>+<kbd>`p`</kbd> : History previous

<kbd>`CTRL`</kbd>+<kbd>`/`</kbd> : Change layout

<kbd>`CTRL`</kbd>+<kbd>`v`</kbd> : Hide/show preview

<kbd>`HOME`</kbd> : Top

<kbd>`END`</kbd> : Bottom

<kbd>`PGUP`</kbd> : Scroll one page up

<kbd>`PGDN`</kbd> : Scroll one page down

<kbd>`CTRL`</kbd>+<kbd>`h`</kbd> : Show help

<kbd>`?`</kbd> : Show keybindings

<kbd>`CTRL`</kbd>+<kbd>`c`</kbd> : Exit

<kbd>`CTRL`</kbd>+<kbd>`q`</kbd> : Exit

<kbd>`ESC`</kbd> : Exit


```manpage
KEYBINDINGS:

                     TAB : Select
               Shift-TAB : Unselect
                  Ctrl-d : Deselect all
                  Ctrl-i : Install selected
                  Ctrl-r : Uninstall selected
                  Ctrl-u : Update all packages
                  Ctrl-n : History next
                  Ctrl-p : History previous
                  Ctrl-/ : Change layout
                  Ctrl-v : Hide/show preview
                    HOME : Top
                     END : Bottom
                  PAGEUP : Scroll one page up
                PAGEDOWN : Scroll one page down
                  Ctrl-l : Clear query
           Alt-backspace : Clear query
                Alt-left : Delete word
                 Ctrl-h  : Show help
                       ? : Show keybindings
                  Ctrl-c : Exit
                  Ctrl-q : Exit
                     ESC : Exit
```

> *Other than running the script and finding out for yourself, I suggest reading the [fzf][fzf-url] documentation if you want to learn more about the keybindings.*

<p align="right">(<a href="#top">back to top</a>)</p>


## Customization

See the [wiki][wiki-customization-url]

<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">

# Other


## Wiki

Check out the [wiki][wiki-url] for more information

<!-- CONTRIBUTING -->
## Contributing

<details>
  <summary>Click to expand contributing section</summary>

<br>

> Any contributions you make are **greatly appreciated**.

> > If you want to contribute, please fork this repo and create a pull request.

1. Fork the Project
2. Create your Feature Branch

```console
git checkout -b AmazingNewFeature
```

3. Commit your Changes

```console
git commit -m 'Description of the amazing feature you added'
```

4. Push to the Branch

```console
git push origin AmazingNewFeature
```

5. Then open a pull request `:)`

> > If you experience any bugs/issues or have and suggestions, you can simply open an issue `:)`

</details>

## Donate

<a href="https://connerwill.com/static/img/xmr-qr-connerwill.com.png"><img src="https://connerwill.com/static/img/xmr.svg" alt="Monero (XMR) icon and wallet QR code" width="2%" height="2%"> XMR</a> :  <code>86tE67soBqFb5fxNGgC4HLdwZXebP42ewfBwfKyMDKvFbgA7T8p4g4T5BBNA9LNbwaVafup973w41PdvCS7bbj6gTNQpCh1</code>

<a href="https://connerwill.com"><img src="https://connerwill.com/static/img/btc.svg" alt="₿" width="2%" height="2%"></a> BTC : <code>bc1qpg5d69n2knsete7vw7f2vqpkg4a0faq9rc6se0</code>

<p align="right">(<a href="#top">back to top</a>)</p>


<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">

<!-- LINKS -->
[github-repo]: https://github.com/ConnerWill/yayfzf
[shellcheck-badge]: https://github.com/ConnerWill/yayfzf/actions/workflows/shellcheck.yml/badge.svg
[shellcheck-workflow]: https://github.com/ConnerWill/yayfzf/actions/workflows/shellcheck.yml
[github-top-language-badge]: https://img.shields.io/github/languages/top/ConnerWill/yayfzf
[github-language-count-badge]: https://img.shields.io/github/languages/count/ConnerWill/yayfzf
[github-last-commit-badge]: https://img.shields.io/github/last-commit/ConnerWill/yayfzf
[github-commits]: https://github.com/ConnerWill/yayfzf/commits/main
[github-issues-badge]: https://img.shields.io/github/issues-raw/ConnerWill/yayfzf
[github-issues]: https://github.com/ConnerWill/yayfzf/issues
[github-repo-size-badge]: https://img.shields.io/github/repo-size/ConnerWill/yayfzf
[gitlab-badge]: https://img.shields.io/static/v1?label=gitlab&logo=gitlab&color=E24329&message=mirrored
[gitlab]: https://gitlab.com/ConnerWill/yayfzf
[license-badge]: https://img.shields.io/github/license/ConnerWill/yayfzf
[license]: https://github.com/ConnerWill/yayfzf/blob/main/docs/LICENSE
[github-repo-stars-badge]: https://img.shields.io/github/stars/ConnerWill/yayfzf?style=social

[rainbow-line]: https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png
[wiki-url]: https://github.com/ConnerWill/yayfzf/wiki
[wiki-customization-url]: https://github.com/ConnerWill/yayfzf/wiki/Customization
[wiki-installation-url]: https://github.com/ConnerWill/yayfzf/wiki/Installation

[fzf-url]: httaps://github.com/junegunn/fzf
[yay-url]: https://github.com/Jguer/yay
[yayfzf-source]: https://github.com/ConnerWill/yayfzf/blob/main/bin/yayfzf
