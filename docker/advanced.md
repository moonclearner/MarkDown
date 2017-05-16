# docker

## docker restart
restart container that has been stopped

- docker ps -a
- docker restart docker-ID or name
	docker-ID It can input part of ID

## docker attach
enter docker container that has been started

- docker ps -a
- docker attach docker-ID

## docker rename
rename container

# rm
### rm container
docker rm containerID

### rm docker
删除所有未打 tag 的镜像
docker rmi $(docker images -q | awk '/^<none>/ { print $3 }')

删除所有镜像
docker rmi $(docker images -q)

根据格式删除所有镜像
docker rm $(docker ps -qf status=exited)


## host and container transport file
### one
docker cp containerID :/file/path/within/container /host/path/target

### two
mount path to share
docker run -v /file/path/within/container :/mnt containerID

### three
- docker inspect -f '{{.id}}'
	get complete contain id
- sudo cp path-file-host /var/lib/docker/devicemapper/mnt/containerID/rootfs/root

