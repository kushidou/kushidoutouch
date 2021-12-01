# Kushidou Touch

## 功能 Function

基于bash脚本和**pyudev**，为多显示器、多触摸屏的Linux操作系统提供  *稳定可靠*  自动的触摸屏映射方案。本软件几乎适用于任何Linux+Xservice的桌面操作系统。

## 依赖 Depends

必须的依赖包含zenity和xinput，用于窗口化交互和执行映射功能。

推荐安装python3, python3-pip+pyudev 或 python3-pyudev，这些包可以在触摸usb插拔的时候自动重新映射。

## 使用方法

详细方法参考[我的博客](https://www.small09.top/tools/kushidoutouch/)。

双击桌面上的“配置触摸映射”快捷方式，会打开对话框，选中其中列举的所有显示器，然后会跳出第二层对话框，选项列举了所有的触摸输入设备（包括电磁笔），为刚刚的屏幕选择它对应的触摸屏。**注意** ：同一块屏幕可能对应多个触摸设备，他们的id接近。请确保第二页面上所有的触摸设备都被认领。所有的选项都是即时生效的，可以拖动窗口进行测试。确保设置结束后再关闭窗口，点击保存替换原来的配置文件。

**切勿配置一对屏和触摸就关掉程序，再打开配置下对。**

程序可以在开机进入桌面后自动适配触摸（登陆输密码的界面不支持！），也可以在你拔掉usb重新插上后适配触摸（如果安装了依赖的话）。对于屏幕顺序、分辨率、相对位置、数量的更改都无法识别，请想办法双击桌面上的"映射触摸"快捷方式，或者在终端窗口(ctrl + alt + T 打开)中输入`$kscreen-remap`进行立即映射。

配置文件位于`/opt/kushidou-touchscreen/config`，由于其配置了usb端口，故不具有通用性。日志文件位于`/var/log/kushidou-touchscreen`，如果遇到问题请提供这两个文件后询问。

## 打包方式 Package

检查package.sh的可执行权限

```bash
./package.sh
```

期间会要求输入密码，该密码用于检查/修改内部文件的权限，并读取、打印版本号。也可以使用指令直接打包（权限正确的话）：

```bash
dpkg -b ./kushidoutouch ./kushidouTouch-${vers}_${arch}.deb
```

如果您的系统不依赖于dpkg或者apt进行包管理，请按照本文件结构与对应系统要求进行打包。

## ChangeLog

2021-12-01    v1.1.5

- 修复了配置时就删掉配置文件的特性，现在要按保存才会替换生效。
- 添加更多的触摸设备识别特征
- 修改依赖，python3移入建议安装，虽然一般Linux都预装了py3。
- 下一步打算添加映射管理功能。将会研究zenity以外的可视化方案。



2021(c)@kushidou
允许自由下载、修改、使用和分发。
