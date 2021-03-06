#!/usr/bin/make -f

## Copyright (C) 2012 - 2018 ENCRYPTED SUPPORT LP <adrelanos@riseup.net>
## See the file COPYING for copying conditions.

## genmkfile - Makefile - version 1.5

## This is a copy.
## master location:
## https://github.com/Whonix/genmkfile/blob/master/usr/share/genmkfile/Makefile

GENMKFILE_PATH ?= /usr/share/genmkfile
GENMKFILE_ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

export GENMKFILE_PATH
export GENMKFILE_ROOT_DIR

include $(GENMKFILE_PATH)/makefile-full

##Bits copied from genmkfile end here. Still the same license though.

dummy:

VERSION=0.1
EMAIL=hankhill19580@gmail.com
NAME=pin-debian-main

gz:
	tar --exclude "./.git" --exclude "./debian" -czvf ../"$(NAME)_$(VERSION).tar.gz" .

debian/:
	dh_make -i -n -c mit \
		-e "$(EMAIL)" \
		-p "$(NAME)_$(VERSION)" \

deb: gz debian
	debuild -us -uc

signed: gz debian
	debuild

GOTHUB_BIN=~/.go/bin/gothub

export GITHUB_USER=eyedeekay
export GITHUB_REPO=pin-debian-main

release: signed gothub-current upload

upload:
	$(GOTHUB_BIN) upload \
		--tag current \
		--label "$(NAME)" \
		--name "$(NAME)" \
		--replace \
		--file "../$(NAME)_$(VERSION)_all.deb"

gothub-delete-current:
	$(GOTHUB_BIN) delete \
		--tag current; true

gothub-current: gothub-delete-current
	$(GOTHUB_BIN) release \
		--tag current \
		--name $(NAME) \
		--description "Force the use of i2p and i2pd routers from Debian main only"

docker:
	docker build -t eyedeekay/pin-debian-main .

test:
	docker build -f Dockerfile.test -t eyedeekay/pin-debian-main .

echo:
	gpg -n --import --import-options import-show my-key.asc
	gpg -n --import --import-options import-show i2p-debian-repo.key.asc

copy:
	cp ../$(NAME)*.* ./
