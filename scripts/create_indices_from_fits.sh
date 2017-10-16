#
# Copyright 2016 Christian Dersch <lupinix@mailbox.org>
# All rights reserved.
#
# License: BSD (2 clause, see LICENSE.txt)
#

# Exit on errors...
set -e

# Generate indices as mentioned in http://data.astrometry.net/4100/README
cd build
for i in `seq -w 11 19` ; do
    build-astrometry-index -d 3 -o index-41${i}.fits -P $i -S MAG_VT -B 0.1 -s 0 -r 1 -I 41${i} -M -i tyc2.fits
done

build-astrometry-index -d 4 -o index-4110.fits -P 10 -S MAG_VT -B 0.1 -s 0 -r 1 -I 4110 -M -i tyc2.fits

for i in `seq -w 7 9` ; do
    build-astrometry-index -d 4 -o index-410${i}.fits -P $i -S MAG_VT -B 0.1 -s 0 -r 1 -I 410${i} -M -i tyc2.fits
done

cd ..
