# arch-config
Arch的一些配置

## Sway配置
```sh
yay -S sway i3blocks swaylock swayidle ranger  alacritty-ligatures kitty pulseaudio-ctl
```
## Shell配置
```sh 
# fish
yay -S fish
chsh -s /bin/fish
```
## 字体配置
```sh
yay -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra nerd-fonts-fira-code
```
参考链接：[ArchWiki](https://wiki.archlinux.org/index.php/Font_configuration)
## neovim配置
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mv arch-config/nvim ~/.config/
```
参考链接：[vim-plug](https://github.com/junegunn/vim-plug)  
          [vim基本配置](http://www.ruanyifeng.com/blog/2018/09/vimrc.html)  
          [coc.nvim](https://github.com/neoclide/coc.nvim)  
          [fgheng/vime](https://github.com/fgheng/vime)
## 输入法配置
```sh
yay -S fcitx5-im   # fcitx5输入法框架
yay -S fcitx5-rime # fcitx5-rime 输入法
yay -S rime-cloverpinyin    # 四叶草输入方案
mv arch-config/.pam_environment ~/ # 设置环境变量
mv arch-config/default.custom.yaml  ~/.local/share/fcitx5/rime/ # 配置文件
yay -S fcitx5-pinyin-zhwiki-rime # 词库
yay -S fcitx5-material-color     # 皮肤
mv arch-config/classicui.conf ~/.config/fcitx5/conf/ # 主题配置文件
```
参考链接：[fcitx5](https://wiki.archlinux.org/index.php/Fcitx5)  
          [四叶草输入方案](https://github.com/fkxxyz/rime-cloverpinyin)  
          [皮肤配置](https://github.com/hosxy/Fcitx5-Material-Color)
