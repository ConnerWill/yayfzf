<div align="center">

<img width="465" height="314" src="/docs/images/yayfzf-demo.gif">

# yayfzf

> *Fullscreen interactive AUR / repo package manager using **[yay][yay-url]** and **[fzf][fzf-url]***

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

`yayfzf` is a fullscreen interactive package manager for Arch Linux systems.

It uses **[yay][yay-url]** for package operations and **[fzf][fzf-url]** for searching, selecting, installing, removing, and updating packages.

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
    - [Examples](#examples)
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
| ![demo screenshot 3](/docs/images/demo-screenshot-3.png) | ![demo screenshot 4](/docs/images/demo-screenshot-4.png) |


![yayfzf-demo-gif](/docs/images/yayfzf-demo.gif)

</div>

## Features

- Interactive menu for Arch Linux package management
- Package search using `yay`
- Package selection using `fzf`
- Install, remove, and update packages
- Inline package information preview
- Multi-select support
- Toggleable package preview window
- Built-in color themes
- Interactive theme selector
- Configurable layout, border, prompt, preview window, and sort order
- XDG-compliant configuration file support
- Bash and Zsh completion support

## Requirements

- `bash`
- `yay`
- `fzf`
- `awk`
- `sed`
- `tr`
- `tput`

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

Optionally, install the executable, documentation, man page, license, and shell completions:

```bash
sudo install -Dm755 "bin/yayfzf" "/usr/local/bin/yayfzf"
sudo install -Dm644 "docs/README.md" "/usr/share/doc/yayfzf/README.md"
sudo install -Dm644 "docs/yayfzf.1" "/usr/share/man/man1/yayfzf.1"
sudo install -Dm644 "LICENSE" "/usr/share/licenses/yayfzf/LICENSE"
sudo install -Dm644 "completion/_yayfzf" "/usr/share/zsh/site-functions/_yayfzf"
sudo install -Dm644 "completion/yayfzf_completion.sh" "/usr/share/bash-completion/completions/yayfzf"
```

## Usage

Launch the interactive interface:

```bash
yayfzf
```

Start with an initial package search query:

```bash
yayfzf fzf
```

### Command Line Options

| Option | Description |
| ------ | ----------- |
| `--sort-by [sort option]` | Set package search sort order |
| `--no-preview` | Disable package preview window |
| `-t`, `--theme [theme]` | Set built-in theme |
| `-l`, `--list-themes` | Show list of built-in themes |
| `--preview-themes` | Interactively preview and select a built-in theme |
| `-i`, `--init-config` | Install example configuration file |
| `-s`, `--show-config` | Show example configuration file content |
| `-k`, `--keybindings` | Show keybindings and exit |
| `-v`, `--verbose` | Show verbose output |
| `-h` | Show short help |
| `--help` | Show full help |
| `--help-man` | Show man page help |
| `-V`, `--version` | Show version |

### Examples

Run `yayfzf` with no search query:

```bash
yayfzf
```

Search for `fzf`:

```bash
yayfzf fzf
```

Search packages sorted by votes:

```bash
yayfzf --sort-by votes
```

Start with the `dracula` theme:

```bash
yayfzf --theme dracula
```

Show all built-in themes:

```bash
yayfzf --list-themes
```

Open the interactive theme selector:

```bash
yayfzf --preview-themes
```

Start with the package preview window disabled:

```bash
yayfzf --no-preview
```

Install an example configuration file:

```bash
yayfzf --init-config
```

Show the short help menu:

```bash
yayfzf -h
```

### Keybindings

| Key | Action |
| --- | ------ |
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
| <kbd>CTRL</kbd>+<kbd>r</kbd> | Remove selected package |
| <kbd>CTRL</kbd>+<kbd>u</kbd> | Update all packages |
| <kbd>CTRL</kbd>+<kbd>l</kbd> | Clear query, screen, and selection |
| <kbd>CTRL</kbd>+<kbd>Backspace</kbd> | Clear query |
| <kbd>CTRL</kbd>+<kbd>/</kbd> | Cycle preview window position and size |
| <kbd>CTRL</kbd>+<kbd>v</kbd> | Toggle package preview window |
| <kbd>?</kbd> | Show keybindings |
| <kbd>CTRL</kbd>+<kbd>c</kbd> | Exit yayfzf |
| <kbd>CTRL</kbd>+<kbd>w</kbd> | Exit yayfzf |
| <kbd>ESC</kbd> | Exit yayfzf |

## Configuration

### Configuration Files

`yayfzf` looks for configuration files in this order and uses the first file found:

- `$XDG_CONFIG_HOME/yayfzf/yayfzf.conf`
- `$HOME/.config/yayfzf/yayfzf.conf`
- `$HOME/.yayfzf.conf`

Install an example configuration file:

```bash
yayfzf --init-config
```

Show the current example configuration:

```bash
yayfzf --show-config
```

### Configuration Options

| Option | Description | Default | Values |
| ------ | ----------- | ------- | ------ |
| `THEME` | Built-in color theme | `default` | Show available themes: `yayfzf --list-themes` |
| `SORT_BY` | Package search sort order | `popularity` | `popularity`, `votes`, `last_updated` |
| `PREVIEW_WINDOW` | fzf package preview window layout and size | `right:60%:wrap` | Any valid `fzf --preview-window` value |
| `LAYOUT` | fzf layout | `reverse` | `default`, `reverse` |
| `BORDER` | fzf border style | `rounded` | Any valid `fzf --border` value |
| `YAYFZF_PROMPT` | fzf prompt string | `yayfzf> ` | Any string |
| `ENABLE_PREVIEW` | Enable package preview window | `true` | `true`, `false` |
| `VERBOSE` | Enable verbose output | `false` | `true`, `false` |
| `YAYFZF_PAGER` | Pager used for config/help output | `${PAGER:-less}` | `less`, `bat`, `more`, etc. |
| `CTRL_C_CLOSE` | Exit when fzf returns an empty selection | `true` | `true`, `false` |
| `NO_COLOR` | Disable ANSI color output | `false` | `true`, `false` |

Example configuration:

```bash
# Theme
# Show available themes:
#   yayfzf --list-themes
#
# Interactively select a theme:
#   yayfzf --preview-themes
THEME="default"

# Package sort order: popularity, votes, last_updated
SORT_BY="popularity"

# Preview window options for fzf
PREVIEW_WINDOW="right:60%:wrap"

# Layout: default, reverse
LAYOUT="reverse"

# Border style
BORDER="rounded"

# Prompt for fzf
YAYFZF_PROMPT="yayfzf> "

# Enable package preview window
ENABLE_PREVIEW=true

# Verbose output
VERBOSE=false

# Pager
YAYFZF_PAGER="${PAGER:-less}"

# Close yayfzf with Ctrl-C / empty fzf selection
CTRL_C_CLOSE=true

# Disable color output
NO_COLOR=false

# Example of custom user theme (Replace 'custom' with theme name)
BUILTIN_THEMES[custom]="
  fg:#c0caf5
  bg:#1a1b26
  hl:#7aa2f7
  fg+:#c0caf5
  bg+:#24283b
  hl+:#7dcfff
  info:#7aa2f7
  prompt:#7dcfff
  pointer:#7dcfff
  marker:#9ece6a
  spinner:#9ece6a
  header:#9ece6a
"
```

## See Also

- [fzf][fzf-url]
- [fzf Color Themes][fzf-themes-url]
- [yay][yay-url]
- [rclonefzf][rclonefzf-url]

## Other

<!-- CONTRIBUTING -->
### Contributing

<details>
  <summary>Click to expand contributing section</summary>

<br>

> Any contributions you make are appreciated.

> If you want to contribute, please fork this repo and create a pull request.

1. Fork the project
2. Create your feature branch

```console
git checkout -b AmazingNewFeature
```

3. Commit your changes

```console
git commit -m 'Description of the amazing feature you added'
```

4. Push to the branch

```console
git push origin AmazingNewFeature
```

5. Open a pull request.

If you experience bugs or have suggestions, open an issue.

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

[fzf-url]: https://github.com/junegunn/fzf
[fzf-themes-url]: https://junegunn.github.io/fzf/color-themes
[yay-url]: https://github.com/Jguer/yay
[yayfzf-url]: https://github.com/ConnerWill/yayfzf
[yayfzf-source]: https://github.com/ConnerWill/yayfzf/blob/main/bin/yayfzf
[rclonefzf-url]: https://github.com/ConnerWill/rclonefzf
