# Makefile

#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

.PHONY: all run virtualbox clean

BOX_NAME := omniosce-r151030

all: virtualbox

run: virtualbox
	vagrant up ; vagrant ssh

virtualbox:
	packer build ./packer_templates/$(BOX_NAME).pkr.hcl

clean:
	rm -rf builds/virtualbox
	vagrant destroy -f
	rm -rf packer_cache
	rm -rf builds/*
	-vagrant box remove $(BOX_NAME) --force
