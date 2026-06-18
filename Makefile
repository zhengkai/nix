SHELL:=/usr/bin/env bash

switch:
	./script/build-label.sh
	sudo nixos-rebuild switch --flake .
	git checkout build-label.nix

boot:
	./script/build-label.sh
	sudo nixos-rebuild boot --flake .
	git checkout build-label.nix

update:
	./script/build-label.sh
	http_proxy=http://192.168.50.207:8118 nix flake update
	sudo nixos-rebuild switch --flake .
	git checkout build-label.nix
