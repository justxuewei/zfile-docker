# ZFile Docker

此Docker镜像由Xavier Niu维护，基于：

- lsiobase/alpine:3.11
- zfile:2.0

Docker Hub: [xavierniu/zfile](https://hub.docker.com/r/xavierniu/zfile)

## ZFile

ZFile是一个在线文件目录的程序，支持对象存储和本地存储，使用定位是个人网盘或公共文件库。

预览地址: [https://zfile.jun6.net](https://zfile.jun6.net/)

文档地址: http://docs.zhaojun.im/zfile

## 运行

使用Docker运行

```bash
docker run -d --name zfile \
  -e PUID=1000 \ # optional
  -e PGID=1000 \ # optional
  -e TZ="Asia/Shanghai" \ # optional
  -p 8080:8080 \
  --restart=unless-stopped \
  -v <YOUR ZFILE CONFIG PATH>:/root/.zfile \
  -v <YOUR ZFILE DATA PATH>:/zfile \
  xavierniu/zfile
```

Environment Variables

- PUID以及PGID的使用方法以及为什么使用参见: [Understanding PUID and PGID](https://docs.linuxserver.io/general/understanding-puid-and-pgid)
- `TZ`设置时区，默认值为`Asia/Shanghai`

Volumes

- `<YOUR ZFILE CONFIG PATH>`: zfile配置目录
- `<YOUR ZFILE DATA PATH>`: zfile本地文件系统

## 致谢

-  [zhaojun1998](https://github.com/zhaojun1998/zfile)
-  [koalang](https://github.com/koalang/zfile)

