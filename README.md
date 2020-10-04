# upplay-docker

## Reference

First and foremost, the reference to the awesome project:

https://www.lesbonscomptes.com/upplay/

## Why

Not all distros have a Upplay package available. For Arch and derived, there is an AUR package, but the application does not look good at least on my Gnome desktop: borders are missing.
Or, you might simply not be comfortable installing an AUR package.

## Prerequisites

You need to have Docker up and running on a Linux machine, and the current user must be allowed to run containers (this usually means that the current user belongs to the "docker" group).
You can verify whether your user belongs to the "docker" group with the following command:

`getent group | grep docker`

This command will output one line if the current user does belong to the "docker" group, otherwise there will be no output.

The Dockerfile and the incluted scripts have been tested on the following distros:

- Manjaro Linux with Gnome (amd64)

As I test the Dockerfile on more platforms, I will update this list.

## Usage

You can build (or rebuild) the image by opening a terminal and issuing the following command:

`docker build . -t upplay`

It will take a while. When it's finished, run:

`docker run --rm --user $(id -u):$(id -g) -it -e DISPLAY=:0.0 --net=host --volume=${HOME}/.Xauthority:/config/.Xauthority:rw --volume ${HOME}/.config/Upmpd.org:/config/.config/Upmpd.org upplay`

This command should generally work. You might need to tweak the DISPLAY variable value, and of course binding "/config/.config/Upmpd.org" is definitely not mandatory if you don't need to maintain the configuration settings.

You can avoid the dependency with the terminal which started upplay by detaching the process, just add '-d' after 'run' in the previous command.

## Menu Entry Installation

If the application runs properly with the previous command, you might want to be able to launch it by your desktop environment.
You can install the menu entry by running the included convenience script. Open a terminal and issue the following:

`sh create-desktop-entry.sh`

This script will copy the "run-upplay-docker" script to "$HOME/.local/bin/", copy the icon "upplay-docker.png" to "$HOME/.local/share/icons/", then copy the desktop file "upplay-docker.desktop" to "$HOME/.local/share/applications/".

On Gnome, just wait a few seconds and the new application will be available.
