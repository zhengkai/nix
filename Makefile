SHELL:=/usr/bin/env bash

switch:
	./script/build-label.sh
	sudo nixos-rebuild switch --flake .
	git checkout build-label.nix

boot:
	sudo nixos-rebuild boot --flake .

update:
	http_proxy=http://192.168.50.207:8118 nix flake update
	sudo nixos-rebuild switch --flake .
