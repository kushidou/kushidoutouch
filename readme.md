# Kushidou Touch

## 功能 Function

基于bash脚本和**pyudev**，为多显示器、多触摸屏的Linux操作系统提供稳定可靠自动的触摸屏映射方案。


## 打包方式 Package

检查package.sh的可执行权限

```bash
./package.sh
```

期间会要求输入密码，该密码用于检查内部文件的权限，并读取、打印版本号。也可以使用指令直接打包（权限正确的话）：

```bash
dpkg -b ./kushidoutouch ./kushidouTouch-${vers}_${arch}.deb
```


2021(c)@kushidou
允许自由下载、修改、使用和分发。

