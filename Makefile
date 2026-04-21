SHELL:=/usr/bin/env bash

switch:
	sudo nixos-rebuild switch --flake .

boot:
	sudo nixos-rebuild boot --flake .
