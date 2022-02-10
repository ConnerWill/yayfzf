<div align="center">
<!---
<img width="480" height="320" src="/media/yayfzf-banner.png">
--->

### **fzf for rclone**
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

* pacman/yay/etc...
* fzf

### Package Manager Configuration

This script is setup to use [yay](https://github.com/Jguer/yay) as the package manager.
However, it is very easy to change this and use a different package manager.

To use a different package manager, open yayfzf.sh

```Shells
    ##-------- OPTIONS --------##
    packages_sort_by="votes"
    use_color="always"

    detailedPreview="yay --sync --info --info --verbose --color $use_color "
    installPackage="yay --sync --verbose --color $use_color --nobatchinstall --confirm"
    ##-------------------------##
```





In the future I intend to adapt the script to be compatible with other distros/package managers.







### fzf Installation

2. Install [fzf](https://github.com/junegunn/fzf)

## Setup

1. Clone this repository

  ```console
  git clone https://github.com/ConnerWill/yayfzf.git
  ```

<p align="right">(<a href="#top">back to top</a>)</p>

# Usage

<p align="right">(<a href="#top">back to top</a>)</p>

# Customization

## Configuration File

### Hotkeys

## Environment Variables
<!---
**```RCLONEFZF_ENVVAR```**
: yayfzf environment variable description.

**```RCLONEFZF_REMOTE```**
: rclone remote to use by default. ***[string]***
*(eg. remoteName:, remoteName)*

**```RCLONEFZF_ENVVAR```**
: yayfzf environment variable description. ***[string]***

**```RCLONEFZF_ENVVAR```**
: yayfzf environment variable description. ***[string]***

**```RCLONEFZF_ENVVAR```**
: yayfzf environment variable description. ***[string]***
--->


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

rclone links[^rclone]

<p align="right">(<a href="#top">back to top</a>)</p>

<!---

Here is a simple footnote[^1].

A footnote can also have multiple lines[^2].  

You can also use words, to fit your writing style more closely[^note].


<details>
  <summary>Click to expand table of contents</summary>

  ---

---

[^1]: My reference.
[^2]: Every new line should be prefixed with 2 spaces.
  This allows you to have a footnote with multiple lines.
--->
[^rclone]:    
    [rclone website](https://rclone.org)
    [rclone github](https://github.com/rclone/rclone)

[fzf]:
    (https://github.com/junegunn/fzf)


   <!--- Named footnotes will still render with numbers instead of the text but allow easier identification and linking.  
    This footnote also has been made with a diffeorent syntax using 4 spaces for new --->




