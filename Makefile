SHELL:=/usr/bin/env bash

build:
	sudo nixos-rebuild switch --flake .
