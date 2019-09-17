# Docker - EDC 2019

> **[Download presentation here](./Docker_workshop_EDC2019.pdf)**

> Full EDC program here: [https://edc2019.github.io/](https://edc2019.github.io/).

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

The preferred way is to download and install Docker Desktop on your machine. You can download the installer without logging in to docker.com here: [Windows](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe) and [macOS](https://download.docker.com/mac/stable/Docker.dmg).

### On Equinor managed laptop

On an Equinor managed laptop this requires `Elevated Installer` (and maybe `Elevated Privileges`). As well as these additional steps: 

* Installed Docker Desktop for Windows using elevated installer from c:\appl
* Added as member to local Windows group "Docker users"
* Config Docker
  * Proxy http://www-authproxy.statoil.net/ (same for both)
  * Network
    * Subnet 10.0.75.0
    * DNS server: 143.97.38.116

**Start hacking!**

### Alternative - Remote with VS Code

If you cannot install Docker Desktop but have Visual Studio Code installed you can use VS Code Remote to connect to a virtual machine I have created in Azure that already has Docker installed.

Download these VS Code extensions:

* [ms-vscode-remote.vscode-remote-extensionpack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
* [ms-vscode-remote.remote-ssh](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)

[Download the remote bundle I have prepared](https://github.com/equinor/edc2019-docker/raw/master/remote-bundle/remote-bundle.zip) and unzip it into `C:\edc\`.

Open PowerShell and move the config file to where VS Code expects to find it. (If you are already using VS Code SSH Remote, append the contents to the existing file).

    # PowerShell:
    cd C:\edc\
    cp config $env:USERPROFILE\.ssh\config

You can now connect to one of the VMs in VS Code with

* View
  * Command Palette
    * Remote-SSH - Connect to Host...

**You will be assigned a number at the start of the workshop for the VM you should use.**

Click the Explorer button in VS Code and Open Folder to open the folder on the remote machine.

Click View - Terminal to open the terminal on the remote machine. Issue the command `sudo su` to change to root, which is required for running `docker` commands.

**Start hacking!**

### Alternative - Remote with putty

[Download the remote bundle I have prepared](https://github.com/equinor/edc2019-docker/raw/master/remote-bundle/remote-bundle.zip) and unzip it into `C:\edc\`.

Reduce the permissions on the private-key:

    cmd /c icacls C:\edc\edc_id_rsa /c /t /inheritance:d
    cmd /c icacls C:\edc\edc_id_rsa /c /t /grant %username%:F
    cmd /c icacls C:\edc\edc_id_rsa /c /t /remove Administrator "Authenticated Users" BUILTIN\Administrators BUILTIN Everyone System Users

(Windows SSH will refuse to use a private-key with too generous permissions).

**You will be assigned a number at the start of the workshop for the VM you should use.**

Use PowerShell to start a putty (SSH client) session to the remote host:

    # PowerShell
    cd C:\edc\
    .\putty.exe -i edc.ppk -l ubuntu vm03.edc.stian.tech

Run `sudo su` in the terminal to change to `root` user which is required for running `docker` commands.

**Start hacking!**
