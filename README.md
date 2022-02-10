<div align="center">
<!---
<img width="480" height="320" src="/media/yayfzf-banner.png">
--->

### **Another Pacman/yay fzf browser**
> *[*yayfzf*](https://github.com/ConnerWill/yayfzf) allows you to search and install packages from the Arch Linux AUR using [fzf](https://github.com/junegunn/fzf).*


![GitHub last commit](https://img.shields.io/github/last-commit/ConnerWill/yayfzf)
![GitHub issues](https://img.shields.io/github/issues-raw/ConnerWill/yayfzf)
![GitHub repo size](https://img.shields.io/github/repo-size/ConnerWill/yayfzf)
[![GitLab](https://img.shields.io/static/v1?label=gitlab&logo=gitlab&color=E24329&message=mirrored)](https://gitlab.com/ConnerWill/yayfzf)
![GitHub](https://img.shields.io/github/license/ConnerWill/yayfzf)
![GitHub Repo stars](https://img.shields.io/github/stars/ConnerWill/yayfzf?style=social)

---
</div>

# Table of Contents
<details>
  <summary>Click to expand table of contents</summary>

  ---
  
* [yayfzf](#yayfzf)
* [Table of Contents](#table-of-contents)
* [Overview](#overview)
  * [Description](##description)
  * [Demo](##demo)
* [Installation](#installation)
  * [Dependencies](##dependencies)
    * [yay Installation](###rclone-installation)
    * [fzf Installation](###fzf-installation)
  * [Setup](##setup)
* [Usage](#usage)
* [Customization](#customization)
  * [Configuration File](##configuration-file)
    * [Hotkeys](###hotkeys)
  * [Environment Variables](#environment-variables)
* [Other](#other)

  ---
  
<p align="right">(<a href="#top">back to top</a>)</p>

</details>  
  
# Overview

## Description

## Demo

<p align="right">(<a href="#top">back to top</a>)</p>

# Installation

## Dependencies

* yay/pacman/*(etc...)*
* fzf

### fzf

Make sure you have [fzf](https://github.com/junegunn/fzf) installed as that is the meat and potatoes of this script.

## Setup

1. Clone this repository

  ```console
  git clone https://github.com/ConnerWill/yayfzf.git
  ```

If you are not using yay and would like to use a different package manager, see [Using a Different Package Manager](#using-a-different-package-manager) below.


<p align="right">(<a href="#top">back to top</a>)</p>

# Usage

To use this script, all you have to do is run.

```sh
./yayfzf.sh
```

It can be either ran with a search query to start the search,
or it will prompt you to enter one if it did not receive any input, then start the search.

```sh
./yayfzf.sh fzf
```
> *Example of running the script with input searching for "fzf"*


<p align="right">(<a href="#top">back to top</a>)</p>

# Customization

### Using a Different Package Manager

This script is setup to use [yay](https://github.com/Jguer/yay) as the package manager.
However, it is very easy to change this and use a different package manager.

To use a different package manager, open [*yayfzf.sh* and find the lines where options are set.](https://github.com/ConnerWill/yayfzf/blob/82b6915d6130b8ba3deecf1360ca1c1a44759ab5/yayfzf.sh#L7)


```sh
    ##-------- OPTIONS --------##
    packages_sort_by="votes"
    use_color="always"

    detailedPreview="yay --sync --info --info --verbose --color $use_color "
    installPackage="yay --sync --verbose --color $use_color --nobatchinstall --confirm"
    ##-------------------------##
```

Remove/replace any options to suite your desired package manager.
Replace `installPackage` with the command to install a package.
Replace `detailedPreview` with the command to view extra details about the package.

*eg.*

***In this example, I replaced the commands to suite pacman.***
**pacman doesnt have the `--sortby` flag. So I removed it.**
**pacman also doesnt have the `--nobatchinstall` flag, to it was removed from the installer command**

```sh
    ##-------- OPTIONS --------##
    packages_sort_by=""
    use_color="always"

    detailedPreview="pacman --sync --info --verbose --color $use_color "
    installPackage="pacman --sync --verbose --color $use_color --confirm"
    ##-------------------------##
```

**NOTE**
> *In the future I intend to adapt the script to be compatible with other distros/package managers.*

## Configuration File

### Hotkeys

There are specific hotkeys that allow you to interact with yayfzf.
Allowing you to install packages, nagivate and view other packages, and change the fzf window formatting.

> *Here is a list of the default hotkeys*

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

> *Other than running the script and finding out for yourself, I suggest reading the [fzf](https://github.com/junegunn/fzf) documentation if you want to learn more about the keybindings.*


<p align="right">(<a href="#top">back to top</a>)</p>

# Other

<p align="right">(<a href="#top">back to top</a>)</p>

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

<p align="right">(<a href="#top">back to top</a>)</p>

</details>


<p align="right">(<a href="#top">back to top</a>)</p>

[fzf]:
    (https://github.com/junegunn/fzf)



