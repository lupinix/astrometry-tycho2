#!/bin/bash
#
# Copyright: 2016 Christian Dersch <lupinix@mailbox.org>
# License: BSD-2-Clause
#

FTPURL="ftp://cdsarc.u-strasbg.fr/pub/cats/I/259"

# Get index files and docs
wget ${FTPURL}/guide.pdf
wget ${FTPURL}/ReadMe
wget ${FTPURL}/index.dat.gz
wget ${FTPURL}/suppl_1.dat.gz
wget ${FTPURL}/suppl_2.dat.gz
wget ${FTPURL}/tyc2.dat.00.gz
wget ${FTPURL}/tyc2.dat.01.gz
wget ${FTPURL}/tyc2.dat.02.gz
wget ${FTPURL}/tyc2.dat.03.gz
wget ${FTPURL}/tyc2.dat.04.gz
wget ${FTPURL}/tyc2.dat.05.gz
wget ${FTPURL}/tyc2.dat.06.gz
wget ${FTPURL}/tyc2.dat.07.gz
wget ${FTPURL}/tyc2.dat.08.gz
wget ${FTPURL}/tyc2.dat.09.gz
wget ${FTPURL}/tyc2.dat.10.gz
wget ${FTPURL}/tyc2.dat.11.gz
wget ${FTPURL}/tyc2.dat.12.gz
wget ${FTPURL}/tyc2.dat.13.gz
wget ${FTPURL}/tyc2.dat.14.gz
wget ${FTPURL}/tyc2.dat.15.gz
wget ${FTPURL}/tyc2.dat.16.gz
wget ${FTPURL}/tyc2.dat.17.gz
wget ${FTPURL}/tyc2.dat.18.gz
wget ${FTPURL}/tyc2.dat.19.gz

echo "Downloaded Tycho2 catalogue"
