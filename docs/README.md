<div align="center">
<img width="480" height="320" src="assets/yayfzf_demo.gif">

### **ｙａｙｆｚｆ**
> *[fzf](https://github.com/junegunn/fzf) wrapper for yay**

[![shellcheck](https://github.com/ConnerWill/yayfzf/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/ConnerWill/yayfzf/actions/workflows/shellcheck.yml)
![GitHub last commit](https://img.shields.io/github/last-commit/ConnerWill/yayfzf)
![GitHub issues](https://img.shields.io/github/issues-raw/ConnerWill/yayfzf)
![GitHub repo size](https://img.shields.io/github/repo-size/ConnerWill/yayfzf)
[![GitLab](https://img.shields.io/static/v1?label=gitlab&logo=gitlab&color=E24329&message=mirrored)](https://gitlab.com/ConnerWill/yayfzf)
![GitHub](https://img.shields.io/github/license/ConnerWill/yayfzf)
![GitHub Repo stars](https://img.shields.io/github/stars/ConnerWill/yayfzf?style=social)

</div>

# Description

*[*yayfzf*](https://github.com/ConnerWill/yayfzf) is a script that searches and installs packages from the Arch Linux AUR using [fzf](https://github.com/junegunn/fzf).*

<!--
## Demo

<details>
<summary>Click to expand demos</summary>
<div align="center">

|      |      | <img width="1920" height="1080" src="assets/yayfzf_demo.gif"> |      |
| ---- | ---- | ------------------------------------------------------------- | ---- |
|      |      |                                                               |      |

<p align="right">(<a href="#top">back to top</a>)</p>
</details>  
</div>
-->

# Installation

1. Clone this repository

  ```console
  git clone https://github.com/ConnerWill/yayfzf.git
  ```
  
 To run this script from anywhere as the current user, either symlink or add the script to a directory in your PATH

```shell
ln -s ./yayfzf/src/yayfzf ~/.bin/
```

> Assuming *`~/.bin`* is in your PATH

# Usage

To use this script, all you have to do is run.

```shell
source yayfzf
```

It can be either ran with a search query to start the search,
or it will prompt you to enter one if it did not receive any input, then start the search.

> *Example of running the script with no search query*
 
```shell
yayfzf
```

> *Example of running the script with input searching for "fzf"*
 
```shell
yayfzf fzf
```

## Dependencies

### fzf

Make sure you have [fzf](https://github.com/junegunn/fzf) installed as that is the meat and potatoes of this script.

### yay

If you are not using [yay](https://github.com/Jguer/yay) and would like to use a different package manager, see [Using a Different Package Manager](#using-a-different-package-manager) below


# Customization

### Using a Different Package Manager

This script is setup to use [yay](https://github.com/Jguer/yay) as the package manager.
However, it is very easy to change this and use a different package manager.

To use a different package manager, open [*yayfzf.sh* and find the lines where options are set.](https://github.com/ConnerWill/yayfzf/blob/82b6915d6130b8ba3deecf1360ca1c1a44759ab5/yayfzf.sh#L7) *(see below)*


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


> > > > *e.g.*
> > 
> *In this example, I replaced the commands to suite pacman.*
> *pacman doesnt have the `--sortby` flag. So I removed it.*
> *pacman also doesnt have the `--nobatchinstall` flag, to it was removed from the installer command*


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

---

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

[fzf]:
    (https://github.com/junegunn/fzf)



