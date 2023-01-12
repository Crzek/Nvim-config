# Nvim_kl_config
This is the configuration of my NeoVim, at first it was for Kali Linux, but I also use it for Windows systems.

## Presentation
[My neovim](https://user-images.githubusercontent.com/60371296/212150652-fc9d7d02-4074-4649-a561-f1db6a1bc5e4.mp4)

## Install
1. To install the Vim plugins you have to create the Nvim folder
2. You have to create a file 'init.vim'
3. Once you have written the sets and plugs
4. Go to cmd to install vim plug ----> to do Plugginstall https://github.com/junegunn/vim-plug

### installation in KAli
copy paste in shell.
```sh
sudo apt install neovim
```

The files for the configuration are stored in the following root in nvim. This file is located at: `~/.config/nvim/init.vim` if don't exist, creat it in `cd ~/.config/`
```sh
mkdir nvim
touch nvim/init.vim
```
### Windows
dir `.\AppData\Local\`

creat a directory 
```sh
md nvim
```
creat init.vim
```sh
New-Item init.vim
```

#### Set an Alias in Windows (PowerShell)
check if do I have a profile.
```sh
Test-Path $PROFILE
```
It should return True, if not, try the following command to create a profile:
```sh
ni -Path $PROFILE -force & notepad.exe $PROFILE
```
Note: `Notepad $PROFILE` create a document in PATH `\Documents\PowerShell\Microsoft.PowerShell_profile.ps1` you must write in this document `set-alias <alias> <comand>` e.g `set-alias v nvim`.
if you installed Neovim with Chocolatey, the PATH is `C:\tools\neovim\nvim-win64\bin\nvim.exe`


![Notepad $PROFILE](https://user-images.githubusercontent.com/60371296/212175950-35fc153d-acdc-46c5-bfde-6177dded9fe8.png)


