SHELL:=/usr/bin/env bash

switch:
	./script/build-label.sh
	sudo nixos-rebuild switch --flake .
	git checkout build-label.nix

boot:
	sudo nixos-rebuild boot --flake .

update:
	nix flake update
	sudo nixos-rebuild switch --flake .
