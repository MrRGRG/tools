# Untar
## Support
support file type | 支持文件类型
| file type |
| --------- |
| tar       |
| tar.gz    |
| tgz       |
| zip       |
| rar       |

## Init
need system has: tar, unzip and unrar

需要系统包含命令：tar, unzip and unrar

## Use
Add execute permission | 添加执行权限

```shell
chmod +x tools_untar.sh
```
Run | 执行

```shell
./tools_untar.sh -h

command list:
  -f file
  -d dir
support type: tar tar.gz tgz zip rar

```

```shell
./tools_untar.sh -f test.tar -d test

unzip file: test.tar
unzip dir: test
dir exist: test
file type: tar
--------------------------
test.txt
--------------------------
unzip file: test.tar
unzip dir: test
```

## Tips
Link sh in local so it can be use in anywhere | 添加软连接，在系统任意位置能访问
```shell
ln -s <your-project-path>/untar/tools_untar.sh /usr/bin/tools_untar
# e.g.
ln -s ~/program/tools/untar/tools_untar.sh /usr/bin/tools_untar

# e.g.
tools_untar -f test.tar -d test
```

install unzip | 安装unzip
```shell
apt-get install unzip
```

install rar/unrar | 安装rar/unrar
```shell
apt-get install rar
apt-get install unrar
```
