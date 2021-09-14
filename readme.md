# Kushidou Touch

## 功能 Function



## 打包方式 Package

把`DEBIAN`, `USR`, `var`三个文件夹复制到一个新的文件夹中，修改`DEBIAN/control`信息，退到新文件夹上级目录

```bash
Package: kushidoutouch      # Your Software Name
Version: 1.0                # Your version
Architecture: arm64         # x86, amd64, arm64, aarch, etc.
```

打包指令如下，xxx为软件目录，后面版本号和架构最好一致（名称不影响实际安装）

```bash
dpkg -b ./xxx Kushidoutouch-1.0_arm64.deb
```