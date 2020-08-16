[[ "$1" == "-d" ]] && DAEMONIZE="-d" && shift
docker run --rm -it --name picocms-lama -p 80:80 $DAEMONIZE picocms-lama $*

# --read-only -v $(pwd)/nginx-cache:/var/cache/nginx -v $(pwd)/nginx-pid:/var/run nginx
