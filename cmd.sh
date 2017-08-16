#!/bin/bash

help() {
    echo $0 'command(start|stop)';
}

if [ $# -lt 1 ]; then
    echo 'Insufficient arguments';
    help;
    exit;
fi

_CMD=$1

case $1 in
    start)
	docker run -d --restart always --name ss -p 8891:8891 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 8891 -k joffreyisking -m aes-256-cfb;
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





