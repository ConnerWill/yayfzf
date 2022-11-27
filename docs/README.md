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
  * [Contributing](#contributing)

<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">


# Installation

```console
git clone https://github.com/ConnerWill/yayfzf.git
```

To run this script from anywhere as the current user, source the script in your shell init scripts *(`.zshrc` `.bashrc`)* or symlink/move the script to a directory in your `$PATH`



### Adding line to source `yayfzf` to your shell init


> zsh

```shell
echo "source (PATH-TO-REPO)/yayfzf/bin/yayfzf" >> "${ZDOTDIR}/.zshrc"
```

> bash

```shell
echo 'source /yayfzf/bin/yayfzf' >> ~/.bashrc
```

### Adding script to your `$PATH`

> > **Assuming *`~/.bin`* is in your PATH**

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

### Hotkeys

There are specific hotkeys that allow you to interact with [yayfzf][github-repo]
Allowing you to install/remove packages, nagivate and view other packages, and change the fzf window formatting.

> *Here is a list of the default hotkeys*

<kbd>`TAB`</kbd>+<kbd>`d`</kbd> : Toggle selection

<kbd>`ALT`</kbd>+<kbd>`d`</kbd> : Install selected packages

<kbd>`CTRL`</kbd>+<kbd>`/`</kbd> : Change layout

<kbd>`PageUp`</kbd> : Scroll one page up

<kbd>`PageDn`</kbd> : Scroll one page down

<kbd>`?`</kbd> : Show help

<kbd>`CTRL`</kbd>+<kbd>`h`</kbd> : Show help

<kbd>`ESC`</kbd> : Exit

<kbd>`CTRL`</kbd>+<kbd>`q`</kbd> : Exit

```manpage
KEYBINDINGS
  Alt+D       Install Package(s)
  PageDn      Scroll One Page Down
  PageUp      Scroll One Page Up
  Home        Top
  End         Bottom
  Tab         Select
  Ctrl+d      Deselect All
  Ctrl+l      Cleary Query
  Ctrl+v      Toggle Preview Window
  Ctrl+/      Change Layout
  Ctrl+h      Show Help
  ?           Show Help
  Ctrl+q      Exit
  Esc         Exit
```

> *Other than running the script and finding out for yourself, I suggest reading the [fzf][fzf-url] documentation if you want to learn more about the keybindings.*

<p align="right">(<a href="#top">back to top</a>)</p>


# Customization

See the [wiki][wiki-url]

<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">

# Other

<!-- CONTRIBUTING -->
## Contributing

<details>
  <summary>Click to expand contributing section</summary>

  ---

Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

</details>

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

[fzf-url]: httaps://github.com/junegunn/fzf
[yay-url]: https://github.com/Jguer/yay
[yayfzf-source]: https://github.com/ConnerWill/yayfzf/blob/main/bin/yayfzf
