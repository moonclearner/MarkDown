# docker

## install docker-ce
reference of [official website](https://www.docker.com/community-edition#/download)
```bash
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

sudo apt-get update

sudo apt-get -y install docker-ce
```
## uage
### faster source
#### ubuntu
```bash
sudo echo "DOCKER_OPTS=\"$DOCKER_OPTS --registry-mirror=http://xxx.m.daocloud.io\"" >> /etc/default/docker service docker restart
```

#### centos
```bash
sudo sed -i 's|OPTIONS=|OPTIONS=--registry-mirror=http://xxx.m.daocloud.io |g' /etc/sysconfig/docker service docker restart
```
#### macos
```bash
boot2docker ssh sudo su echo "EXTRA_ARGS=\"--registry-mirror=http://xxx.m.daocloud.io\"" >> /var/lib/boot2docker/profile && exit exit boot2docker restart
```
#### windows
```bash
sudo su echo "EXTRA_ARGS=\"--registry-mirror=http://xxx.m.daocloud.io\"" >> /var/lib/boot2docker/profile exit
```
### search docker
docker search imagename

### download docker
docker pull imagename

### test
```bash
docker run hello-world
docker run learn/tutorial echo "hello word"
```
### install app in docker or run command
```bash
docker run learn/tutorial apt-get install -y ping
docker run lean/ping ping www.baidu.com
```
### save docker condition
- docker ps -l
	显示容器的 ID
- docker commit
	查看参数列表
- docker commit ID learn/ping

### check docker on running
- docker ps -a
- docker inspect efe

### pulish your docker
- docker images
	show all installed docker
- docker push learn/ping
	push your docker

# run docker
- 交互式容器
	前台运行，可以通过控制台与容器交互。如果创建该容器的终端被关闭，则容器就变为停止状态。此外，在容器控制台中输入 exit 或者通过 docker stop 或 docker kill 也能终止容器
- 后台式容器
	后台运行，创建启动之后就与终端无关了，需要用 docker stop 或 docker kill 来终止

## run interactive docker
- docker run -i -t 32bit/ubuntu:14.04
### exit
- exit

## run backstage docker
- docker run -d 32bit/ubuntu:14.04 /bin/bash -c "while true; do echo hello world; sleep 5; done"

### exit
- docker stop docker-name

### show output of backstage docker
- docker ps -a
	show information of all docker include docker name
- docker logs docker-name
	show output stream of docker
- docker top docker-name
	show all process in docker
- docker inspect docker-name
	show all information about the docker

# network
docker init default network config is bridge link

- docker run -i -t --net="host" 32bit/ubuntu:14.04 /bin/bash
	setting host mode make docker and host have same network

## upload image
- $ docker ps -a
CONTAINER ID        IMAGE                COMMAND                CREATED             STATUS                     PORTS               NAMES
1718e35463ff        32bit/ubuntu:14.04   /bin/bash              53 seconds ago      Exited (0) 8 seconds ago                       boring_babbage

- $ docker commit --author="cdai" 1718e35463ff cdai/sqlite3:v1
e10622157a5df7c82bdf148bda021e0fe312c153852f7a6c765c216d4d636ecb

- $ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
cdai/sqlite3        v1                  e10622157a5d        6 seconds ago       321.8 MB
32bit/ubuntu        14.04               c062cc00654e        11 hours ago        295.3 MB

**image will upload in local lib**

### Dockerfile
Dockerfile 是一种更加透明并且可重复的制作方式

- FROM
	指定扩展自哪个父级镜像
- RUN
	执行命令修改镜像。例如 RUN apt-get update 和 RUN [“apt-get”, “update”]。前者在 /bin/sh 中执行命令，后者直接使用系统调用 exec 执行
- EXPOSE
	指明容器内进程对外开放的端口。也可以在容器启动时用 -p 参数开放一些在 Dockerfile 里没有列出的端口
- ADD
	添加宿主主机文件、文件夹或 URL 指定资源到镜像中
- ENV
	设置容器运行的环境变量
- USER
	为容器的运行以及 Dockerfile 后面的命令指定用户
- MAINTAINER
	声明作者信息
- WORKDIR
	指定工作目录（最后一个会作为容器启动后的工作目录）
- VOLUME
	挂载文件
- CMD 和 ENTRYPOINT
	指定容器启动后执行的命令
- ONBUILD
	指定一些命令在当前镜像构建时不会执行，而是在子镜像构建时触发
#### example
FROM 32bit/ubuntu:14.04
MAINTAINER cdai "XXX@163.com"
USER root
RUN apt-get install -y nginx
EXPOSE 80 8080
RUN touch test.txt
ADD abc.txt .
ENTRYPOINT ["ls"]
CMD ["-a", "-l"]

#### build
docker build -t dockername:V1 .

## upload to docker hub
$docker login

$cat ~/.dockercfg

$docker push dockername:V1
