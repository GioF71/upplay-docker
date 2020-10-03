# upplay-docker

## Reference

First and foremost, the reference to the awesome project:

https://www.lesbonscomptes.com/upplay/

## Why

Not all distros have a upplay package available. For arch and derived, there is an AUR package, but it does not look good at least on my Gnome desktop: borders are missing.
And, you might not be comfortable installing an AUR package.

## Prerequisites

You need to have Docker up and running on a Linux machine.

All of this has been tested on:

- Manjaro Linux with Gnome (amd64)

As I test the Dockerfile on more platforms, I will update this list.

## Usage

So, just open a terminal and issue the following to build the image

`docker build . -t upplay`

It will take a while. When it's finished, run from a terminal:

`docker run --rm --user $(id -u):$(id -g) -it -e DISPLAY=:0.0 --net=host --volume=${HOME}/.Xauthority:/config/.Xauthority:rw --volume ${HOME}/.config/Upmpd.org:/config/.config/Upmpd.org upplay`

This command should generally work. You might need to tweak the DISPLAY variable value, and of course binding "/config/.config/Upmpd.org" is definitely not mandatory if you don't need to maintain the configuration settings.

You can avoid the dependency with the terminal which started upplay by detaching the process, just add '-d' after 'run' in the previous command.

## Menu Entry Installation

You can install the menu entry by running the included convenience script. Open a terminal and issue the following:

`sh create-desktop-entry.sh`

On Gnome, just wait a few seconds and the new application will be available.
