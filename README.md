# Nvim-config
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
1. install `Nodejs` and `Chocolatey`
2. Open PowerShell
```sh
   choco install neovim
   choco install ag
```
Note: `ag` is for FZF

3. go to dir `.\AppData\Local\`

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


## Configuration
1. Check all plugins are installed in nvim
   ```vim
   :PlugInstall
   ```
2. Install yarn
    * **Kali Linux**
      ```sh
      yarn install
      yarn build
      reset
      ```
      ```sh
      npm install -g yarn
      ```
    * **Windows**
       
      You must have nodejs installed, [more](https://phoenixnap.com/kb/yarn-windows)
        ```sh
        npm install --global yarn
        ```
        Note: if you get the following error, `yarn : File C:\Program Files\nodejs\yarn.ps1 cannot be loaded because running scripts is         disabled on this system. For
        more information, see about_Execution_Policies at https:/go.microsoft.com/fwlink/?LinkID=135170.` Run the following command and select [Y]:
        ```sh
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
        ```
3. Coc.vim
   We will implement **coc-snippets** and **coc-higtligh**
   
   * Open Nvim and run:
   
   ```vim
   :CocInastall Coc-snippets
   :CocInstall Coc-highlight
   ```
4. Download and install font and icons [NerdFonts](https://www.nerdfonts.com/)

5. LSP
    ```vim
    :lspInstallInfo 
    ```
    If you want to view errors, run in nvim, `:checkhealth`



