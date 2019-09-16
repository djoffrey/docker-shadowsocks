#!/bin/bash

help() {
    echo $0 'command(start|stop|build|start-proxy)';
}

if [ $# -lt 1 ]; then
    echo 'Insufficient arguments';
    help;
    exit;
fi

_CMD=$1

case $1 in
    start)
	sudo docker run -d --restart always --name ss -p 8891:8891 djoffrey/docker-shadowsocks -s 0.0.0.0 -p 8891 -k ${SS_PASSWD} -m aes-256-cfb;
	;;

    build)
	sudo docker build -f Dockerfile -t djoffrey/docker-shadowsocks .
	;;

    start-proxy)
	sudo docker run --name sslh -d --env SSLH_OPTS='-p0.0.0.0:443 --anyprot localhost:18891' --net host --restart always riftbit/sslh
	;;

    stop)
	docker stop ss;
	docker rm ss
	;;
    *)
	echo 'unknown operation '$2;
	exit
	;;
    esac





