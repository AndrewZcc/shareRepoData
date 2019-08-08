## Docker Systemd

1. docker中使用 systemd
	* [docker中使用systemd](https://blog.csdn.net/xiangxizhishi/article/details/77803932)

2. systemd: System and Service Manager
	* [Running systemd within a Docker Container](https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/)


```shell

docker run -d -it --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name testSystemd $1

docker exec -it testSystemd /bin/bash
```

## Docker 参考手册

1. Docker run 参数解析
	https://www.runoob.com/docker/docker-run-command.html
