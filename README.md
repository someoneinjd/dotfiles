# arch-config
Arch的一些配置

## Sway配置
```sh
yay -S sway waybar swaylock swayidle ranger  alacritty-ligatures kitty
```
## Shell配置
```sh 
# fish
yay -S fish
chsh -s /bin/fish
```
## 字体配置
```sh
yay -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra nerd-fonts-fira-code nerd-fonts-noto
```
参考链接：[ArchWiki](https://wiki.archlinux.org/index.php/Font_configuration)
## neovim配置
```sh
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mv arch-config/nvim ~/.config/
```
参考链接：[packer](https://github.com/wbthomason/packer.nvim)  
          [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide)  
          [nvim-lua-guide-zh](https://github.com/glepnir/nvim-lua-guide-zh)
          [LunarVim](https://github.com/ChristianChiarulli/LunarVim)
## 输入法配置
```sh
yay -S fcitx5-im   # fcitx5输入法框架
yay -S fcitx5-rime # fcitx5-rime 输入法
yay -S rime-cloverpinyin    # 四叶草输入方案
mv arch-config/.pam_environment ~/ # 设置环境变量
mv arch-config/default.custom.yaml  ~/.local/share/fcitx5/rime/ # 配置文件
yay -S fcitx5-pinyin-zhwiki-rime # 词库
mv arch-config/classicui.conf ~/.config/fcitx5/conf/ # 单行模式
```
参考链接：[fcitx5](https://wiki.archlinux.org/index.php/Fcitx5)  
          [四叶草输入方案](https://github.com/fkxxyz/rime-cloverpinyin)  
