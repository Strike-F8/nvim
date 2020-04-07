# My Neovim Configuration Files

I have merged the Linux branch into master! Now the same configuration files can be used on Windows or Linux!

Feel free to use/modify what you like!

### Installation for Windows and Linux
**If you have already customized your installation of neovim, then don't do this!**
**It is much more prefereable to copy whatever lines you like into your own config file.**
##### Tested on Windows 10 and Gallium OS
Open a terminal/powershell

Move to the directory where your neovim configuration files are kept
###### Powershell
``` cd $HOME\AppData\Local\ ```
###### Linux
``` cd ~/.config ```

Clone this repository

``` git clone https://github.com/Edhotmetal/nvim.git ```

Open neovim

``` nvim ```

You will be greeted with many errors!

Have no fear! All we need to do is install the plugins that are referenced in the configuration files.

Press enter until the errors go away.

Then type ```:``` to enter command mode and enter the command:

```PlugInstall```

This will automatically read the plugins listed in init.vim and install them! So convenient!

Now [exit neovim](https://github.com/hakluke/how-to-exit-vim)

```:q```

Once you start neovim again it should work perfectly!
