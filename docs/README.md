<div align="center">

<img width="720" height="480" src="/docs/images/demo-screenshot.png">

# yayfzf

> *AUR package **[fzf][fzf-url]** finder to search, install, remove, and manage packages using yay **[yay][yay-url]***

[![Shellcheck][shellcheck-badge]][shellcheck-workflow]
[![GitHub last commit][github-last-commit-badge]][github-commits]
[![GitHub issues][github-issues-badge]][github-issues]
[![GitHub repo size][github-repo-size-badge]][github-repo]
[![GitHub top language][github-top-language-badge]][github-repo]
[![GitHub language count][github-language-count-badge]][github-repo]
[![License][license-badge]][license]
[![GitHub Release Version][github-release-badge]][github-release-url]
[![AUR Version][aur-version-badge]][aur-url]
[![GitLab][gitlab-badge]][gitlab]
<!--[![GitHub repo stars][github-repo-stars-badge]][github-repo]
[![GitHub repo downloads][github-repo-downloads-badge]][github-repo]-->

</div>

<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">

# Description

AUR package [fzf][fzf-url] finder to search, install, remove, and manage packages using **[yay][yay-url]**


<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">

# Table of Contents

<!--toc:start-->
- [yayfzf](#yayfzf)
- [Description](#description)
- [Table of Contents](#table-of-contents)
- [Screenshots](#screenshots)
  - [Features](#features)
  - [Requirements](#requirements)
  - [Installation](#installation)
    - [AUR](#aur)
    - [Git](#git)
  - [Usage](#usage)
    - [Command Line Options](#command-line-options)
    - [Keybindings](#keybindings)
  - [Configuration](#configuration)
    - [Configuration Files](#configuration-files)
    - [Configuration Options](#configuration-options)
  - [See Also](#see-also)
  - [Other](#other)
    - [Contributing](#contributing)
    - [Donate](#donate)
<!--toc:end-->


<img width="100%" src="https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png">

# Screenshots

 <div align="center">

| ![demo screenshot](/docs/images/demo-screenshot.png) | ![demo screenshot 2](/docs/images/demo-screenshot-2.png) |
| ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |

</div>


## Features

* Interactive menu for Arch Linux package manager
* Inline package information preview
* Multi-select support via fzf
* Toggleable preview window
* Multiple built-in color themes
* Configurable layout, borders, and keybindings
* XDG-compliant configuration file support

## Requirements

- `yay`
- `fzf`

## Installation

### AUR

```bash
yay -S yayfzf
```

### Git

Clone the repository and make the script executable:

```bash
git clone https://github.com/connerwill/yayfzf.git
cd yayfzf
chmod +x bin/yayfzf
```

Optionally, move it to a directory in your PATH:

```bash
sudo install -Dm755 "bin/yayfzf" "/usr/local/bin/yayfzf"  # Main executable
sudo install -Dm644 "docs/README.md" "/usr/share/doc/yayfzf/README.md"  # Documentation
sudo install -Dm644 "docs/yayfzf.1" "/usr/share/man/man1/yayfzf.1"  # Man page
sudo install -Dm644 "LICENSE" "/usr/share/licenses/yayfzf/LICENSE"  # License
sudo install -Dm644 "completion/_yayfzf" "/usr/share/zsh/site-functions/_yayfzf"  # ZSH completion
sudo install -Dm644 "completion/yayfzf_completion.sh" "/usr/share/bash-completion/completions/yayfzf"  # Bash completion
```

## Usage

Launch the interactive interface:

```bash
yayfzf
```

### Command Line Options

| Option | Description |
|--------|-------------|
| `-k`, `--keybindings` | Show keybindings and exit |
| `-i`, `--init-config` | Install example configuration file |
| `-s`, `--show-config` | Show example configuration file content |
| `-v`, `--verbose` | Show verbose output |
| `-h` | Show short help |
| `--help` | Show full help |
| `--help-man` | Show manpage help |
| `-V`, `--version` | Show version |

### Keybindings

| Key | Action |
|-----|--------|
| <kbd>↑</kbd> | Move up |
| <kbd>↓</kbd> | Move down |
| <kbd>PGUP</kbd> | Move up one page |
| <kbd>PGDN</kbd> | Move down one page |
| <kbd>HOME</kbd> | Move to first |
| <kbd>END</kbd> | Move to last |
| <kbd>ENTER</kbd> | Perform action on selection |
| <kbd>TAB</kbd> | Select item |
| <kbd>Shift</kbd>+<kbd>TAB</kbd> | Unselect item |
| <kbd>CTRL</kbd>+<kbd>a</kbd> | Select all items |
| <kbd>CTRL</kbd>+<kbd>d</kbd> | Deselect all items |
| <kbd>CTRL</kbd>+<kbd>i</kbd> | Install selected packages |
| <kbd>CTRL</kbd>+<kbd>r</kbd> | Uninstall package |
| <kbd>CTRL</kbd>+<kbd>u</kbd> | Update all packages |
| <kbd>CTRL</kbd>+<kbd>l</kbd> | Clear search query |
| <kbd>CTRL</kbd>+<kbd>Backspace</kbd> | Clear search query |
| <kbd>CTRL</kbd>+<kbd>/</kbd> | Change layout |
| <kbd>CTRL</kbd>+<kbd>v</kbd> | Toggle preview window |
| <kbd>?</kbd> | Show keybindings |
| <kbd>CTRL</kbd>+<kbd>c</kbd> | Exit yayfzf |
| <kbd>CTRL</kbd>+<kbd>w</kbd> | Exit yayfzf |
| <kbd>ESC</kbd> | Exit yayfzf |

## Configuration

### Configuration Files

`yayfzf` looks for configuration files in this order (uses the first file found):

- `$XDG_CONFIG_HOME/yayfzf/yayfzf.conf`
- `$HOME/.config/yayfzf/yayfzf.conf`
- `$HOME/.yayfzf.conf`

### Configuration Options

| Option | Description | Default |
|--------|-------------|---------|
| `THEME` | Color theme | `default` *(options: default, light, tokyo-night, neon)* |
| `SORT_BY` | Package sort order | `popularity` *(options: popularity, votes, last_updated)* |
| `PREVIEW_WINDOW` | fzf preview window layout and size | `right:60%:wrap` |
| `ENABLE_PREVIEW` | Show preview window | `true` |
| `LAYOUT` | fzf layout | `reverse` *(options: default, reverse)* |
| `BORDER` | fzf border style | `rounded` *(options: default, rounded)* |
| `PROMPT` | Prompt string for fzf | `"yayfzf> "` |
| `VERBOSE` | Enable verbose logging | `false` |
| `YAYFZF_PAGER` | Pager for help/config/keybindings | `${PAGER:-less}` |
| `CTRL_C_CLOSE` | Close yayfzf with Ctrl-C | `true` |

## See Also

- [fzf][fzf-url]
- [yay][yay-url]
- [rclonefzf][rclonefzf-url]

## Other

<!-- CONTRIBUTING -->
### Contributing

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

### Donate

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
[github-repo-downloads-badge]: https://img.shields.io/github/downloads/ConnerWill/yayfzf/total?style=social
[github-release-badge]: https://img.shields.io/github/v/release/ConnerWill/yayfzf
[github-release-url]: https://github.com/ConnerWill/yayfzf/releases
[aur-version-badge]: https://img.shields.io/aur/version/yayfzf
[aur-url]: https://aur.archlinux.org/packages/yayfzf

[rainbow-line]: https://raw.githubusercontent.com/ConnerWill/Project-Template/main/assets/lines/rainbow.png
[wiki-url]: https://github.com/ConnerWill/yayfzf/wiki
[wiki-customization-url]: https://github.com/ConnerWill/yayfzf/wiki/Customization
[wiki-installation-url]: https://github.com/ConnerWill/yayfzf/wiki/Installation
[wiki-screenshots-url]: https://github.com/ConnerWill/yayfzf/wiki/Screenshots

[fzf-url]: httaps://github.com/junegunn/fzf
[yay-url]: https://github.com/Jguer/yay
[yayfzf-url]: https://github.com/ConnerWill/yayfzf
[rclonefzf-url]: https://github.com/ConnerWill/rclonefzf
[yayfzf-source]: https://github.com/ConnerWill/yayfzf/blob/main/bin/yayfzf
