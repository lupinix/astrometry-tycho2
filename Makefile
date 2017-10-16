#
# Copyright 2016 Christian Dersch <lupinix@mailbox.org>
# All rights reserved.
#
# License: BSD (2 clause, see LICENSE.txt)
#
# Makefile for astrometry-tycho2
#

DESTDIR = /usr/local
ASTROMETRY_DATA_DIR = $(DESTDIR)/share/astrometry/data

build:
	python3 scripts/convert_cat_to_fits.py
	sh scripts/create_indices_from_fits.sh
	rm -f build/tyc2.fits

install:
	mkdir -p '$(ASTROMETRY_DATA_DIR)'
	cp build/index-*.fits '$(ASTROMETRY_DATA_DIR)'

clean:
	rm -rf build/

