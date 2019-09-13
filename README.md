# Docker - EDC 2019

This repo contains materials related to my Docker workshop on Equinor Developer Conference 2019. The workshop is planned at 13:30 to 16:00.

What the workshop will try to cover:
* Docker background
* Basic docker usage
   * Downloading and running images 
   * Building and publishing images.
* Cloud native application development practices (12 factor app)


# Prerequisites

I like to teach using the actual tools and methods and not using emulators or simulators.

If you are unable to use Docker you can play around with it in a browser using for example [Katakoda](https://www.katacoda.com/courses/docker/deploying-first-container).

## Preferred - Docker locally

The preferred way is to download and install Docker Desktop on your machine. You can download the installer without logging in to docker.com [here](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe).

### On Equinor managed laptop

On an Equinor managed laptop this requires `Elevated Installer` (and maybe `Elevated Privileges`). As well as these additional steps: 

* Installed Docker Desktop for Windows using elevated installer from c:\appl
* Added as member to local Windows group "Docker users"
* Config Docker
  * Proxy http://www-authproxy.statoil.net/ (same for both)
  * Network
    * Subnet 10.0.75.0
    * DNS server: 143.97.38.116

### Alternative - Remote with VS Code

If you cannot install Docker Desktop but have Visual Studio Code installed you can use VS Code Remote to connect to a virtual machine I have created in Azure that already has Docker installed.

Download these VS Code extensions:
* [ms-vscode-remote.vscode-remote-extensionpack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
* [ms-vscode-remote.remote-ssh](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)



### Alternative - Remote with putty





--- 

You can use the [editor on GitHub](https://github.com/equinor/edc2019-docker/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/equinor/edc2019-docker/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
