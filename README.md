# My Neovim Configuration Files

I have merged the Linux branch into master! Now the same configuration files can be used on Windows or Linux!

Feel free to use/modify what you like!

### Installation for Windows and Linux
**If you have already customized your installation of neovim, then don't do this!**
**It is much better to copy the lines you like into your own config file.**
##### Tested on Windows 10, 11, Gallium OS, PopOS, and openSUSE Tumbleweed
I use the $HOME variable to refer to the home directory of your account.

In Windows, that would be ``` C:\users\<your username> ```

In Linux, it would be ``` /home/<your username> ```

However, you can substitute "~"(tilde) for $HOME and it should work fine.

1. Open a terminal/powershell

2. Move to the directory where your neovim configuration files are kept
###### Powershell
``` cd $HOME\AppData\Local\ ```
###### Linux
``` cd $HOME/.config ```

3. Clone this repository

``` git clone https://gitlab.com/Strike_F8/nvim.git ```

4. Create backup, swap, and bundle directories

###### Powershell
```
    mkdir $HOME\.vim
    cd $HOME\.vim
    mkdir backup
    mkdir swap
    mkdir bundle
```

###### Linux

```
    mkdir $HOME/.vim
    cd $HOME/.vim
    mkdir backup
    mkdir swap
    mkdir bundle
```

5. Open neovim

``` nvim ```

You will be greeted with many errors!

Have no fear! All we need to do is install the plugins that are referenced in the configuration files.

6. Press enter until the errors go away.

7. Then type ```:``` to enter command mode and enter the command:

```PlugInstall```

This will automatically read the plugins listed in init.vim and install them! So convenient!

8. Now [exit neovim](https://github.com/hakluke/how-to-exit-vim)

```:q```

9. Once you start neovim again it should work perfectly!
