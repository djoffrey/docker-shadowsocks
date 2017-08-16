#!/bin/bash

help() {
    echo $0 'command(start|stop|build)';
}

if [ $# -lt 1 ]; then
    echo 'Insufficient arguments';
    help;
    exit;
fi

_CMD=$1

case $1 in
    start)
	sudo docker run -d --restart always --name ss -p 8891:8891 djoffrey/docker-shadowsocks -s 0.0.0.0 -p 8891 -k joffreyisking -m aes-256-cfb;
	;;

    build)
	sudo docker build -f Dockerfile -t djoffrey/docker-shadowsocks .
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





