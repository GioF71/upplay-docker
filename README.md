# upplay-docker

Open a terminal and issue the following to build the image

`docker build . -t upplay`

It will take a while. When it's finished, run:

`docker run --rm --user $(id -u):$(id -g) -it -e DISPLAY=:0.0 --net=host --volume="${HOME}/.Xauthority":/root/.Xauthority:rw --volume ${HOME}:/config upplay`
