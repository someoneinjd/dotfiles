# arch-config
Arch的一些配置

## 克隆仓库
```sh
git clone https://github.com/SomeoneInJD/arch-config.git
```
## Shell配置
```sh 
# 安装zsh
yay -S zsh
# 切换默认shell为zsh
chsh -s /bin/zsh
# 安装ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 安装zsh-autosuggestions和zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 还需修改.zshrc启用插件，具体请参考链接
```
参考链接：[ohmyzsh](https://ohmyz.sh/#install)  
          [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)  
          [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
## 字体配置
```sh
yay -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra nerd-fonts-fira-code
mv arch-config/fonts.conf ~/.config/fontconfig/
```
参考链接：[ArchWiki](https://wiki.archlinux.org/index.php/Font_configuration)
## vim配置
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mv arch-config/.vimrc  ~/ 
vim -c PlugInstall
```
参考链接：[vim-plug](https://github.com/junegunn/vim-plug)  
          [vim基本配置](http://www.ruanyifeng.com/blog/2018/09/vimrc.html)  
          [coc.nvim](https://github.com/neoclide/coc.nvim)
## 输入法配置
```sh
yay -S fcitx5-im   # fcitx5输入法框架
yay -S fcitx5-rime # fcitx5-rime 输入法
yay -S rime-cloverpinyin    # 四叶草输入方案
mv arch-config/.xprofile ~/ # 设置环境变量
mv arch-config/default.custom.yaml  ~/.local/share/fcitx5/rime/ # 配置文件
yay -S fcitx5-pinyin-zhwiki-rime # 词库
yay -S fcitx5-material-color     # 皮肤
mv arch-config/classicui.conf ~/.config/fcitx5/conf/ # 主题配置文件
```
参考链接：[fcitx5](https://wiki.archlinux.org/index.php/Fcitx5)  
          [四叶草输入方案](https://github.com/fkxxyz/rime-cloverpinyin)  
          [皮肤配置](https://github.com/hosxy/Fcitx5-Material-Color)
## 触摸板配置
```sh
# 自然滚动 单指触摸为左键 双指触摸为右键
sudo mv arch-config/30-touchpad.conf /etc/X11/xorg.conf.d/
```
参考链接：[libinput](https://wiki.archlinux.org/index.php/Libinput)
## 关于配置文件的一些说明
### .zshrc
使用了oh-my-zsh，配置主题为ys
### .xprofile
```sh
# 配置中文环境变量
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US


# 配置fcitx5环境变量
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export GLFW_IM_MODULE=ibus # 为了在kitty中使用fcitx5， 参考以下链接
# https://github.com/kovidgoyal/kitty/issues/469#issuecomment-778814173
export XMODIFIERS="@im=fcitx5"
```





