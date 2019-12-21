# zfile-docker

[![](https://images.microbadger.com/badges/image/koalang/zfile.svg)](https://microbadger.com/images/koalang/zfile "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/koalang/zfile.svg)](https://microbadger.com/images/koalang/zfile "Get your own version badge on microbadger.com")

> 👋 本项目为 [zhaojun1998/zfile](https://github.com/zhaojun1998/zfile/commits/master) docker 镜像。

## 版本：

- `latest`：以alpine为基础系统，跟踪 [zhaojun1998/zfile](https://github.com/zhaojun1998/zfile/commits/master) 的最新提交。

## 运行：

- 使用`docker run`命令运行：

    ```
    docker run -d --name zfile \
        -p 8080:8080 --restart=always \
        -v ~/zfile/config:/root/.zfile \
        -v ~/zfile/data:/zfile \
        koalang/zfile
    ```

    - 停止删除容器：
        ```
        docker stop zfile
        docker rm -v zfile
        ```



## 持久化：

- `~/zfile/data`：本地数据存储目录
- `~/zfile/config`：配置文件存储目录

### 可自行修改数据目录和配置文件目录
