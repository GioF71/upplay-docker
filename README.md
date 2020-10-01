# upplay-docker

## Reference

First and foremost, the reference to the awesome project:

https://www.lesbonscomptes.com/upmpdcli/

## Prerequisites

You need to have Docker up and running on a Linux machine.

All of this has been tested on:

- Manjaro Linux with Gnome (amd64)

As I test the unit and/or the scripts on more platforms, I will update this list.


## Usage

So, just open a terminal and issue the following to build the image

`docker build . -t upplay`

It will take a while. When it's finished, run:

`docker run --rm --user $(id -u):$(id -g) -it -e DISPLAY=:0.0 --net=host --volume="${HOME}/.Xauthority":/root/.Xauthority:rw --volume ${HOME}:/config upplay`
